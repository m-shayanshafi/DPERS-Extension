package com.lucene.test;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.IOException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.core.KeywordAnalyzer;
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
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.WildcardQuery;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.queryParser.ParseException;

public class LuceneTest extends JFrame implements ActionListener
{
	public static File INDEX_DIRECTORY = new File("IndexDirectory");
	JButton submit = new JButton("Search");
	JLabel label= new JLabel("Keyword to Search: ");
	JLabel labelError = new JLabel();
	JTextField keyword= new JTextField();
	JFrame mainFrame = new JFrame();
	JPanel panel = new JPanel();

	public LuceneTest()
	{
		keyword.setPreferredSize(new Dimension(150,30));
		panel.add(label);
		panel.add(keyword);
		panel.add(submit);
		panel.add(labelError);
		submit.addActionListener(this);
		mainFrame.setContentPane(panel);
		mainFrame.setSize(400, 100);
		mainFrame.setLocationRelativeTo(null);
		mainFrame.setTitle("Design Pattern Search Repository");
		mainFrame.setResizable(false);
		mainFrame.setVisible(true);
	}

	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
	{
		new LuceneTest();
	}

	public String search(String keyword)
	{
		System.out.println("-- Searching --");
		String output="";
		try {
			String[] filesToSearch ={ "patternInstanceID", "roleName", "methodName", "className","Word"};
			String[] fileType = {"Class","Method","Comment"};
			//queryingIndex(keyword, filesToSearch);

			for(int i=0; i<filesToSearch.length; i++){
				for(int j=0;j<3;j++){
					output = output + searchIndexWithWildcardQuery(filesToSearch[i],keyword,fileType[j]);
				}
			}
		}
		catch (Exception e) 
		{ 
			e.printStackTrace(); 
			return "No Result found";
		}
		return output;
	}

	private void queryingIndex(String keyword, String[] filesToSearch) throws org.apache.lucene.queryparser.classic.ParseException, IOException {
		IndexSearcher searcher = readLuceneIndex("Method");
		Analyzer keywordAnalyzer = new KeywordAnalyzer();
		MultiFieldQueryParser mqp = new MultiFieldQueryParser(filesToSearch, keywordAnalyzer);
		mqp.setAllowLeadingWildcard(true);

		Query query = mqp.parse(keyword);
		System.out.println("query >> " + query);
		TopDocs hits = searcher.search(query, 10);
		System.out.println("Results found >> "+ hits + hits.totalHits);
	}

	private static IndexSearcher readLuceneIndex(String type) throws IOException {
		INDEX_DIRECTORY = new File("IndexDirectory\\"+type);
		Directory directory = FSDirectory.open(INDEX_DIRECTORY.toPath());
		IndexReader directoryReader = DirectoryReader.open(directory); 
		IndexSearcher searcher = new IndexSearcher(directoryReader);
		return searcher;
	} 

	public static String searchIndexWithWildcardQuery(String whichField, String searchString, String SearchFrom) throws IOException, ParseException {
		System.out.println("\nSearching for '" + searchString + "' using WildcardQuery");
		IndexSearcher indexSearcher = readLuceneIndex(SearchFrom);
		Term term = new Term(whichField, searchString);
		Query query = new WildcardQuery(term);
		TopDocs hits = indexSearcher.search(query,100);
		String output="";
		System.out.println("Number of hits: " + hits.totalHits);

		for (int i = 0; i < hits.totalHits; i++) 
		{ 
			System.out.println("entered"+i+" ");
			Document doc = indexSearcher.doc(hits.scoreDocs[i].doc); 
			output = output + ("==========" + (i + 1) + " : Start Record=========\nId :: " + doc.get("patternInstanceID") + "\nroleName :: " + doc.get("roleName") + "\nmethodName :: " + doc.get("methodName") + "\nclassName :: " + doc.get("className") + "\nComment :: "+ doc.get("Word")+"\n==========End Record=========\n"); 
			System.out.println(output);

		} 
		return output;
	}

	private static void displayOutput(String resultFor, String output) {
		JFrame outputFrame = new Display(resultFor, output);
		outputFrame.show();
	}

	public void actionPerformed(ActionEvent event) {
		if (keyword.getText().toString() != "" && keyword.getText().toString() != null && !keyword.getText().isEmpty())
		{
			mainFrame.setVisible(false);
			mainFrame.dispose();
			String out = "\n==================searching in Method===========================";
			out = out + search("*" + keyword.getText() + "*");
			displayOutput("Output Results for " + keyword.getText(), out);
		}
		else
		{
			labelError.setText("Enter a keyword to search");
		}
	}
}