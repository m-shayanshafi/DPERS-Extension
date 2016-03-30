package org.smu.wordsimilarity;

import java.awt.List;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Sample {
	//String inputFile = "G:/Study/CE work/Semesters-MSCS/Design Patterns Refactoring/Project/Game Project/WordSimSEDB/SEWordSim-r1.db"; //jdbc:sqlite:C:\\test.db
	static String inputFile = System.getProperty("user.dir")+"/SEWordSim-r1.db";
	static WordSimDBFacade facade = new WordSimDBFacade(inputFile);

	public static void main1(String args[]) {
		String inputFile = System.getProperty("user.dir")+"/SEWordSim-r1.db";
		WordSimDBFacade facade = new WordSimDBFacade(inputFile);

		//stem word
		String inputWord = "program"; // input word will be coming from user's feature vector
		String stemmedInputWord = facade.stemWord(inputWord);

		String comparedWord = "code"; // compared words come from repository
		String stemmedComparedWord = facade.stemWord(comparedWord);

		//set parameters
		double minSimilarityScore = 0.3;
		int N = 10;

		//search and print result
		System.out.print(facade.isInDatabase(stemmedInputWord) + "\n");
		System.out.print(facade.computeSimilarity(stemmedInputWord, stemmedComparedWord) + "\n");
		System.out.print(facade.findMostSimilarWord(stemmedInputWord) + "\n");
		System.out.print(facade.findMostSimilarWords(stemmedInputWord, minSimilarityScore) + "\n");
		System.out.print(facade.findTopNWords(stemmedInputWord, N) + "\n");
		System.out.println("End");
		//System.out.print(facade.getAllWords());
	}

	public static void main(String args[]) throws ClassNotFoundException, SQLException {
		ArrayList<String> userFeatureVector = new ArrayList<String>();
		userFeatureVector.add("translator");
		userFeatureVector.add("system");
		userFeatureVector.add("editor");
		userFeatureVector.add("font");
		userFeatureVector.add("spellcheck");
		System.out.println(userFeatureVector);
		ArrayList<String> enhancedFeatureVector = generateEnhancedFeatureVector(userFeatureVector);
		System.out.println(enhancedFeatureVector);
	}

	public static ArrayList<String> generateEnhancedFeatureVector(ArrayList<String> userFeatureVector) {
		ArrayList<String> enhancedFeatureVector = new ArrayList<String>();
		for (int i=0; i<userFeatureVector.size(); i++)
		{
			String inputWord = userFeatureVector.get(i); // input word will be coming from user's feature vector
			String stemmedInputWord = facade.stemWord(inputWord);
			enhancedFeatureVector.add(stemmedInputWord);
			/*
			java.util.List<String> matchingWords = facade.findTopNWords(stemmedInputWord, 5);
			if (matchingWords != null)
			{
				for (int j=0; j<matchingWords.size(); j++)
				{
					enhancedFeatureVector.add(matchingWords.get(j));
				}
			}
			*/
		}
		return enhancedFeatureVector;
	}

	private static ResultSet getDomainTopicsFromDb() throws ClassNotFoundException, SQLException {
		DbConnection dc = new DbConnection();
		dc.openConnection();
		return dc.getDomainTopicsFromDb();
	}

	/**Function related to domaintokeywords table
	private static ResultSet getKeywordsFromDb() throws ClassNotFoundException, SQLException {
		DbConnection dc = new DbConnection();
		dc.openConnection();
		return dc.getDomainToKeywordsFromDb();
	}
	*/

	private static void matchingDomain() throws ClassNotFoundException, SQLException
	{
		String inputWord = "language"; // input word will be coming from user's feature vector
		String stemmedInputWord = facade.stemWord(inputWord);

		System.out.print(facade.isInDatabase(stemmedInputWord) + "\n");

		System.out.print("here ");

		ResultSet domain = getDomainTopicsFromDb();
		//ResultSet keywords = getKeywordsFromDb();
		double similarityScore = 0;
		int TopicId = 0;
		int ProjectId = 0;

		while (domain.next() && facade.isInDatabase(stemmedInputWord)) // let it be domain of user here
		{
			int projectId = domain.getInt("ProjectID");
			int topicID = domain.getInt("KeywordID");
			String topic = domain.getString("Name");
			String stemmedComparedWord = facade.stemWord(topic);
			int topicWeight = domain.getInt("Proportion");
			double computedSimilarityScore = facade.computeSimilarity(stemmedInputWord, stemmedComparedWord);

			if (computedSimilarityScore > similarityScore)
			{
				similarityScore = computedSimilarityScore;
				TopicId = topicID;
				ProjectId = projectId;
			}
		}
		System.out.println(TopicId+" "+ProjectId+" "+similarityScore);
	}
}
