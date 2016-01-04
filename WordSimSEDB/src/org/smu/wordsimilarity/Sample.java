package org.smu.wordsimilarity;

public class Sample {
	public static void main1(String args[]) {
		//read in database
		//String inputFile = "G:/Study/CE work/Semesters-MSCS/Design Patterns Refactoring/Project/Game Project/WordSimSEDB/SEWordSim-r1.db"; //jdbc:sqlite:C:\\test.db
		String inputFile = System.getProperty("user.dir")+"/SEWordSim-r1.db";
		WordSimDBFacade facade = new WordSimDBFacade(inputFile);
		
		//stem word
		String inputWord = "program";
		String stemmedInputWord = facade.stemWord(inputWord);
		String comparedWord = "code";
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

	public static void main(String args[]) {
		//read in database
		//String inputFile = "G:/Study/CE work/Semesters-MSCS/Design Patterns Refactoring/Project/Game Project/WordSimSEDB/SEWordSim-r1.db"; //jdbc:sqlite:C:\\test.db
		String inputFile = System.getProperty("user.dir")+"/SEWordSim-r1.db";
		WordSimDBFacade facade = new WordSimDBFacade(inputFile);
		
		//stem word
		String inputWord = "program";
		String stemmedInputWord = facade.stemWord(inputWord);
		String comparedWord = "code";
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
}
