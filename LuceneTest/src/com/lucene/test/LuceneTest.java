package com.lucene.test;

import java.io.File;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.core.KeywordAnalyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.FieldType;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexOptions;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.SortField.Type;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;

import javax.swing.JFrame;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Hit;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.LockObtainFailedException;

/**
 * This is test example file to explore Lucene API
 * 
 * @author vishal.zanzrukia
 * @version 1.0
 */
public class LuceneTest
{
	/**
	 * this is index directory path where all index file will be stored which lucene uses internally.
	 */
	public static final File	INDEX_DIRECTORY	= new File("IndexDirectory");

	/**
	 * to create index on simple database table
	 * 
	 * 
	 */
	public static void createClassTableIndex(){
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo", "root", "");
		Statement stmt = conn.createStatement();
		String sql = "select `patternInstanceID`, `roleName`, `className` from `classnames";
		ResultSet rs = stmt.executeQuery(sql);
		String[] columns = { "patternInstanceID", "roleName", "className"}; 
		createIndex(rs, columns);
		stmt.close();
		conn.close();
		rs.close();
} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	public static void createMethodTableIndex(){
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo", "root", "");
		Statement stmt = conn.createStatement();
		String sql = "select `patternInstanceID`, `roleName`, `methodName` from `methodnames";
		ResultSet rs = stmt.executeQuery(sql);
		String[] columns = { "patternInstanceID", "roleName", "methodName"}; 
		createIndex(rs, columns);
		stmt.close();
		conn.close();
		rs.close();
} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public static void createCommentTableIndex(){
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo", "root", "");
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM `commentstopattern`";
		ResultSet rs = stmt.executeQuery(sql);
		String[] columns = { "patternInstanceID", "WordID", "Word", "className"}; 
		createIndex(rs, columns);
		stmt.close();
		conn.close();
		rs.close();
} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	public static void createIndex(ResultSet inputRs, String[] columns)
	{

		System.out.println("-- Indexing --");

		try
		{
//			/** JDBC Section */
//			Class.forName("com.mysql.jdbc.Driver").newInstance();
//
//			/** Assuming database solr_test exists */
//			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/solr_test", "root", "");
//			Statement stmt = conn.createStatement();
//			String sql = "select id,name,address,details from student_details";
			ResultSet rs = inputRs;
			
			/** Lucene Section */
			Directory directory = FSDirectory.open(INDEX_DIRECTORY.toPath());

			/** defining Analyzer */
			KeywordAnalyzer keywordAnalyzer = new KeywordAnalyzer();

			/** preparing config for indexWriter */
			IndexWriterConfig writerConfig = new IndexWriterConfig(keywordAnalyzer);
			/** Create a new index in the directory, removing any previously indexed documents */
			writerConfig.setOpenMode(OpenMode.CREATE);
			/**
			 * Optional: for better indexing performance, if you are indexing many documents,<BR>
			 * increase the RAM buffer. But if you do this, increase the max heap size to the JVM (eg add -Xmx512m or -Xmx1g):
			 */
			writerConfig.setRAMBufferSizeMB(256.0);

			IndexWriter iWriter = new IndexWriter(directory, writerConfig);

			int count = 0;
			Document doc = null;
			Field field = null;

			/** declaring string type */
			FieldType stringType = new FieldType();
			stringType.setTokenized(true);
			IndexOptions op = null ;
			
			stringType.setIndexOptions(op.DOCS);

			/** Looping through resultset and adding data to index file */
			while (rs.next())
			{
				doc = new Document();
				/** adding id in document */
				field = new IntField(columns[0], rs.getInt(columns[0]), Field.Store.YES);
				doc.add(field);
				System.out.println(rs.getInt(columns[0]));
				/** adding name in document */
				field = new StringField(columns[1], rs.getString(columns[1]).replace("()", ""), Field.Store.YES);
				doc.add(field);
				System.out.println(rs.getString(columns[1]));
				/** adding address in document */
				field = new StringField(columns[2], rs.getString(columns[2]), Field.Store.YES);
				doc.add(field);
				System.out.println(rs.getString(columns[2]));
				if(columns.length>3){
					field = new StringField(columns[3], rs.getString(columns[3]), Field.Store.YES);
					doc.add(field);
					System.out.println(rs.getString(columns[3]));
					
				}
				/** Adding doc to iWriter */
				
				iWriter.addDocument(doc);
				count++;
			}

			System.out.println(count + " record indexed");

			/** Closing iWriter */
			iWriter.commit();
			iWriter.close();

			/** Closing JDBC connection */
			rs.close();
			

		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

	}

	/**
	 * to search the keywords
	 * 
	 * @param keyword
	 * @return 
	 */
	public String search(String keyword)
	{

		System.out.println("-- Seaching --");
		String output="";
		  
  
try{ 
	
	Directory directory = FSDirectory.open(INDEX_DIRECTORY.toPath());
	IndexReader directoryReader = DirectoryReader.open(directory); 
	IndexSearcher searcher = new IndexSearcher(directoryReader); 
    Analyzer keywordAnalyzer = new KeywordAnalyzer(); 

    String[] filesToSearch ={ "patterID", "roleName", "methodName", "className","Word"}; 
    MultiFieldQueryParser mqp = new MultiFieldQueryParser(filesToSearch, keywordAnalyzer);
    mqp.setAllowLeadingWildcard(true);
    
    Query query = mqp.parse(keyword);;  
    
    System.out.println("query >> " + query); 
    Sort sort=new Sort();
   TopDocs hits = searcher.search(query, 10); 
   System.out.println("Results found >> "+ hits + hits.totalHits); 
   for(int i=0; i<filesToSearch.length;i++){
   output = output + searchIndexWithWildcardQuery(filesToSearch[i],keyword);
   }
   Document doc = null; 

}
  catch (Exception e) 
  { 
   e.printStackTrace(); 
   return "No Result found";
  }
return output;
 } 
  
	

public static String searchIndexWithWildcardQuery(String whichField, String searchString) throws IOException,
	ParseException {
System.out.println("\nSearching for '" + searchString + "' using WildcardQuery");
Directory directory = FSDirectory.open(INDEX_DIRECTORY.toPath());
IndexReader directoryReader = DirectoryReader.open(directory); 
IndexSearcher indexSearcher = new IndexSearcher(directoryReader); 

Term term = new Term(whichField, searchString);
Query query = new WildcardQuery(term);
TopDocs hits = indexSearcher.search(query,100);
String output="";
System.out.println("Number of hits: " + hits.totalHits);
for (int i = 0; i < hits.totalHits; i++) 
{ 
 Document doc = indexSearcher.doc(hits.scoreDocs[i].doc); 
 output = output + ("==========" + (i + 1) + " : Start Record=========\nId :: " + doc.get("patternID") + "\nroleName :: " + doc.get("roleName") + "\nmethodName :: " + doc.get("methodName") + "\nclassName :: " + doc.get("className") + "\nComment :: "+doc.get("Word")+"\n==========End Record=========\n"); 
 
 System.out.println("==========" + (i + 1) + " : Start Record=========\nId :: " + doc.get("patternID") + "\nroleName :: " + doc.get("roleName") + "\nmethodName :: " + doc.get("methodName") + "\nclassName :: " + doc.get("className") + "\nComment :: "+doc.get("Word")+"\n==========End Record=========\n"); 
 

} 
return output;
}


	/**
	 * main method to check the output
	 * 
	 * @param args
	 */
	public static void main(String[] args)
	{

		/**LuceneTest obj1 = new LuceneTest();
		LuceneTest obj2 = new LuceneTest();
		
		/** creating index 
		obj1.createMethodTableIndex(); 
		obj2.createClassTableIndex();
		
		System.out.println("==================searching using logical AND operator===========================");
		obj1.search("TemplateMethod AND St*");
		obj2.search("Abs*");*/
		LuceneTest obj1 = new LuceneTest();
		LuceneTest obj2 = new LuceneTest();
		System.out.println("==================searching in Method===========================");
		
		obj1.createMethodTableIndex(); 
		String out = "\n==================searching in Method===========================";
				out= out+obj1.search("Abs*");
		
		System.out.println("==================searching in Classes===========================");
		
		obj1.createClassTableIndex();
		out =out +  "\n==================searching in Class===========================" + obj1.search("Abs*");
		System.out.println("==================searching in Comments===========================");
		
		obj1.createCommentTableIndex();
		String out2 = obj1.search("File*");
		out2 = "\n==================searching in Comments===========================" + out2;

		JFrame f1 = new Display("Comments Output", out2);
		JFrame f2 = new Display("Class\\Method Output", out);
		
	    f1.show();
	    //f2.show();
	  }
	}



