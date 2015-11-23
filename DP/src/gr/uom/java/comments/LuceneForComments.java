package gr.uom.java.comments;

import java.awt.List;
import java.beans.Statement;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.LineNumberReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Hit;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.MatchAllDocsQuery;
import org.apache.lucene.search.PrefixQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.analysis.WhitespaceAnalyzer;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import org.apache.lucene.store.jdbc.JdbcDirectory;
import org.apache.lucene.store.jdbc.dialect.MySQLDialect;

public class LuceneForComments {
	
	public static final String FILES_TO_INDEX_DIRECTORY = "OutFiles"; //contains the java files
	public static String FILES_TO_EXTRACT_DIRECTORY = "FolderToIndex"; //contains the java files
	public static int PATTERN_ID = 0;
	public static final String INDEX_DIRECTORY = "indexDirectory";
	public static final String FIELD_PATH = "path";
	public static final String FIELD_CONTENTS = "contents";
	public static final String[] ENGLISH_STOP_WORDS = {
			"a", "an", "and", "are", "as", "at", "be", "but", "by",
			"for", "if", "in", "into", "is", "it",
			"no", "not", "of", "on", "or", "such",
			"that", "the", "their", "then", "there", "these",
			"they", "this", "to", "was", "will", "with", "here"
			};
	
	private Searcher indexSearcher;
	final static Charset ENCODING = StandardCharsets.UTF_8;
	
	public static void extractComments(String dir,int patternID) throws Exception
	{
		FILES_TO_EXTRACT_DIRECTORY = dir;
		PATTERN_ID = patternID;
		extractCommentsFromFiles(dir);
		insertIntoDB();
		//putInDB();
		//createIndex();
		//searchIndex("javadoc");
		//searchIndex("comment");
	}
	
	/*
	 //get all data from this file
     //make substrings based on spaces and length >3
	 //we get words
	 //in lookupwords table, see if any of these words exist, remove it from array of words
	 //insert this array of words one by one into lookupwords table
	 */
	private static void insertIntoDB() throws IOException, ClassNotFoundException, SQLException {
		DbConnection dc = new DbConnection();
		dc.openConnection();
		File dir = new File(FILES_TO_INDEX_DIRECTORY);
		File[] files = dir.listFiles();
		for (File file : files) {
			String className = file.getName().replace(".txt", "");
			ArrayList<String> cleanWords = new ArrayList<String>();
			cleanWords = getRefinedData(file);
			 
			 for (String n:cleanWords)
				{
				 	ResultSet result = dc.getParticularWord(n);
					if (result.next())
					{
						dc.getCommentWordID(n,PATTERN_ID,className);
						System.out.println(n + " is already in DB");
					}
					else
					{
						dc.insertData(n);
						dc.getCommentWordID(n,PATTERN_ID,className);
						System.out.println(n + " is inserted in DB");
					}
				}
		}
		dc.con.close();
		System.out.println("---THE END---");
	}
	

	private static ArrayList<String> getRefinedData(File file) throws IOException {
		ArrayList<String> cleanWords = new ArrayList<String>();
		String allData = "";
		List completeData = null;
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = null;
		while ((line = br.readLine()) != null) {
		   allData = allData + line + " "; // complete line
		 }
		
		 allData = allData.replace("  ", " ");
		 allData = allData.replace("\t", " ");
		 allData = allData.replace("\n", " ");
		 
		 Pattern p = Pattern.compile(" "); //"\\s"
		 String[] words = p.split(allData);  // words
		 
		 boolean isStoppingword=false;
		 
		 for (int i=0; i<words.length; i++) // removing nulls, small, repeating, and stopping words
		 {
			 if (words[i] != "" && words[i].length()>3 && !(cleanWords.contains(words[i])))
			 {
				 isStoppingword=false;
				 for (int j=0; j<ENGLISH_STOP_WORDS.length; j++)
				 {
					 if (words[i].equalsIgnoreCase(ENGLISH_STOP_WORDS[j]))
					 {
						 isStoppingword = true;
						 break;
					 }
				 }
				 if (!isStoppingword)
				 {
					 cleanWords.add(words[i]);
				 }
			 }
		 }
		 return cleanWords;
	}

	private static void extractCommentsFromFiles(String Fdir) throws IOException {
		File dir = new File(Fdir);
		File[] files = dir.listFiles();
		for (File file : files) {
			if (file.getPath().endsWith(".java"))
			{
				singleLineComments(file);
				multiLineComments(file);
			}
		}
	}
	
	private static void multiLineComments(File file) throws IOException {
		BufferedReader br = null;
		String allData = null;
		try {
			br = new BufferedReader(new FileReader(file));
			//String outfileName = "OutFiles" + file.getPath().substring(file.getPath().indexOf("\\"), file.getPath().indexOf(".java")) + ".txt";
			String outfileName = "C:\\Users\\Natasha Khan\\workspace\\DP\\OutFiles\\"+file.getName().toString().replace(".java", ".txt");
				Path path = Paths.get(outfileName);

			if (Files.exists(path)) {
			  // file exist
			}
			else{
				File outFile = new File(outfileName);
			}
			
			FileWriter fileWritter = new FileWriter(outfileName,true);
	        BufferedWriter writer = new BufferedWriter(fileWritter);
			
			String line = null;
			while ((line = br.readLine()) != null) {
			   allData = allData + line + "\n";
			 }
			 
			 int length = allData.length();
			 while (allData.length() != 0  && allData.contains("/*"))
			 {
				 int a = allData.indexOf("/*"); //got the first comment, start string from here now
				 allData=allData.substring(a);
				 int b = allData.indexOf("*/") + 2;
				 String abc = allData.substring(0,b);
				 allData=allData.substring(b);
				 abc = abc.replace("/*", "");
				 abc = abc.replace("*", "");
				 abc = abc.replace("*/", "");
				 abc = abc.replace("/", "");
				 //System.out.println(abc);
				 writer.write(abc+"\n");
			 }
			 writer.close();
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	private static void singleLineComments(File file) throws IOException {
		BufferedReader br = null;
		String allData = null;
		try {
			br = new BufferedReader(new FileReader(file));
			// String outfileName = "OutFiles" + file.getPath().substring(file.getPath().indexOf("\\"), file.getPath().indexOf(".java")) + ".txt";
			String outfileName = "OutFiles\\"+file.getName().toString().replace(".java", ".txt");
			
			Path path = Paths.get(outfileName);

			if (Files.exists(path)) {
			  // file exist
			}
			else
			{
				File outFile = new File(outfileName);
			}
			
			//FileWriter fileWritter = new FileWriter(outfileName,true);
	        //BufferedWriter writer = new BufferedWriter(fileWritter);
			BufferedWriter writer = new BufferedWriter(new FileWriter(outfileName));
			
			String line = null;
			while ((line = br.readLine()) != null) {
			   allData = allData + line + "\n";
			 }
			
			 int length = allData.length();
			 while (allData.length() != 0  && allData.contains("//"))
			 {
				 int a = allData.indexOf("//"); //got the first comment, start string from here now
				 allData=allData.substring(a);
				 int b = allData.indexOf("\n");
				 String abc = allData.substring(0,b);
				 allData=allData.substring(b);
				 abc = abc.replace("//", "");
				 abc = abc.replace("/", "");
				 //System.out.println(abc); //////////
				 writer.write(abc+"\n");
			 }
			 writer.close();
		} 
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static void createIndex() throws Exception {
		//Analyzer analyzer = new WhitespaceAnalyzer();
		Analyzer analyzer = new StandardAnalyzer();
		IndexWriter indexWriter = new IndexWriter(INDEX_DIRECTORY, analyzer, true);
		File dir = new File(FILES_TO_INDEX_DIRECTORY);
		File[] files = dir.listFiles();
		for (File file : files) {
			
			Document document = new Document();

			String path = file.getCanonicalPath();
			document.add(new Field(FIELD_PATH, path, Field.Store.YES, Field.Index.UN_TOKENIZED));

			Reader reader = new FileReader(file);
			document.add(new Field(FIELD_CONTENTS, reader));

			indexWriter.addDocument(document);
		}
		indexWriter.optimize();
		indexWriter.close();
	}
	
	public static void putInDB() throws SQLException, Exception
	{
		MysqlDataSource dataSource = new MysqlDataSource();
		dataSource.setUser("root");
		dataSource.setPassword("");
		dataSource.setDatabaseName("comments");
		dataSource.setEmulateLocators(true); //This is important because we are dealing with a blob type data field
		
		JdbcDirectory jdbcDir = new JdbcDirectory(dataSource, new MySQLDialect(), "Index");
		jdbcDir.create(); // creates the indexTable in the DB (test). No need to create it manually
		
		System.out.println("Created Successfully");
		
		//code snippet for indexing
		StandardAnalyzer analyzer = new StandardAnalyzer();
		IndexWriter writer = new IndexWriter(jdbcDir, analyzer, true);
		indexDocss(writer, dataSource.getConnection());

		System.out.println("Optimizing...");
		writer.optimize();
		writer.close();
	}

	public static void connectDb() throws Exception{
		//Accessing driver from the jar file
		Class.forName("com.mysql.jdbc.Driver");
		//Creating a variable for the connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derp","root","");
		//jdbc:mysql://localhost:3306/derp->is a database
		//root is the username
		//"" is password
		
		//Here we are creating a query
		PreparedStatement statement =(PreparedStatement) con.prepareStatement("select * from names");
		
		//here we are executing a query 
		ResultSet result = statement.executeQuery();
	}

	public static void indexDocss(IndexWriter writer, Connection conn) throws Exception {
		    String sql = "select WordId, Word from LookupWords";
		    Statement stmt = (Statement) conn.createStatement();
		    ResultSet rs = ((java.sql.Statement) stmt).executeQuery(sql);

		    //while (rs.next()) {
		    File dir = new File(FILES_TO_INDEX_DIRECTORY);
			File[] files = dir.listFiles();
			for (File file : files) {
				Document d = new Document();
				String path = file.getCanonicalPath();
		        d.add(new Field(FIELD_PATH, path, Field.Store.YES, Field.Index.UN_TOKENIZED));

				Reader reader = new FileReader(file);
				d.add(new Field(FIELD_CONTENTS, reader));
		        //d.add(new Field("id", rs.getString("id"), Field.Store.YES, Field.Index.NO));
		        //d.add(new Field("name", rs.getString("name"), Field.Store.YES, Field.Index.TOKENIZED));
		        //d.add(new Field("color", rs.getString("color"), Field.Store.YES,  Field.Index.TOKENIZED));
		        writer.addDocument(d);
		    }
		}
		
	private static void extractComments(File file) {
		String p = "//.*|(\"(?:\\\\[^\"]|\\\\\"|.)*?\")|(?s)/\\*.*?\\*/";
		//String pp="(/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/|[ \t]*//.*)";
		String pp="(/\\*([^*]|[\r\n]|(\\*+([^*/]|[\r\n])))*\\*+/|[ \t]*//.*)";
		
		Pattern regexp = Pattern.compile(pp);
	    Matcher matcher = regexp.matcher("");

	    try
	    {
	    	BufferedReader reader = Files.newBufferedReader(file.toPath(), ENCODING);
	    	System.out.println(reader.readLine());
		    LineNumberReader lineReader = new LineNumberReader(reader);
	    	
	      String line = null;
	      while ((line = lineReader.readLine()) != null) {
	        matcher.reset(line); //reset the input
	        if (matcher.find()) {
	        	System.out.println(line);
	       }
	      }      
	    }    
	    catch (IOException ex){
	      ex.printStackTrace();
	    }
	}
	
	public static void searchIndex(String searchString) throws IOException, ParseException {
		System.out.println("Searching for '" + searchString + "'");
		Directory directory = FSDirectory.getDirectory(INDEX_DIRECTORY);
		
		IndexReader indexReader = IndexReader.open(directory);
		IndexSearcher indexSearcher = new IndexSearcher(indexReader);
		
		//Analyzer analyzer = new WhitespaceAnalyzer();
		Analyzer analyzer = new StandardAnalyzer();
		QueryParser queryParser = new QueryParser(FIELD_CONTENTS, analyzer);
		Query query = queryParser.parse(searchString);
		System.out.println(query.toString());
		
		Hits hits = indexSearcher.search(query);
		System.out.println("Number of hits: " + hits.length());

		Iterator<Hit> it = hits.iterator();
		while (it.hasNext()) {
			Hit hit = it.next();
			Document document = hit.getDocument();
			String path = document.get(FIELD_PATH).replace("OutFiles", FILES_TO_EXTRACT_DIRECTORY);
			System.out.println("Hit: " + path.replace(".txt", ".java"));
		}
		
		//delete the temporary created text files
		File dir = new File(FILES_TO_INDEX_DIRECTORY);
		for (File file: dir.listFiles()) {
	        file.delete();
	    }
	}
}
