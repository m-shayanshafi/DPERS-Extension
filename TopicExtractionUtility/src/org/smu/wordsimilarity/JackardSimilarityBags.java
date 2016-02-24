package org.smu.wordsimilarity;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.sun.org.apache.xerces.internal.util.URI;

public class JackardSimilarityBags {
	static List<ArrayList<String>> featureVectors = new ArrayList<ArrayList<String>>();
	static ArrayList<String> featureProjectIDs = new ArrayList<String>();
	static String inputFile = System.getProperty("user.dir")+"/SEWordSim-r1.db";
	static WordSimDBFacade facade = new WordSimDBFacade(inputFile);

	public static void main (String args[]) throws Throwable { //input from user's code i.e. feature vector
		ArrayList<String> userFeatureVector = new ArrayList<String>(); //input from user's code i.e. feature vector
		userFeatureVector.add("translator");
		userFeatureVector.add("system");
		userFeatureVector.add("editor");
		userFeatureVector.add("font");
		userFeatureVector.add("spellcheck");

		Sample s1 = new Sample();
		userFeatureVector = s1.generateEnhancedFeatureVector(userFeatureVector);
		featureVectors.add(userFeatureVector);
		featureProjectIDs.add("");

		getFeatureVectorsFromDB(); //get all the feature vectors from db based on project ids
		//addTemporary();

		System.out.println(featureVectors);
		System.out.println(featureProjectIDs);
		int totalMethods = featureVectors.size();
		double dist[][] = new double[totalMethods][totalMethods]; //Distance of each method with the rest 
		int minDist [] = new int[totalMethods];				   //index of closest cluster
		System.out.println("Total methods: "+ totalMethods);

		/**** Jaccard Difference Matrix Creation *****/
		createDistanceMatrix(dist, featureVectors, minDist);
	}

	public static void findRecommendations(ArrayList<String> userFeatureVector) throws Throwable
	{
		Sample s1 = new Sample();
		userFeatureVector = s1.generateEnhancedFeatureVector(userFeatureVector); //stemmed user feature vector
		featureVectors.clear();
		featureProjectIDs.clear();
		featureVectors.add(userFeatureVector);
		featureProjectIDs.add("");

		getFeatureVectorsFromDB(); //get all the feature vectors from db based on project ids
		//addTemporary();

		System.out.println(featureVectors);
		System.out.println(featureProjectIDs);
		int totalMethods = featureVectors.size();
		double dist[][] = new double[totalMethods][totalMethods]; //Distance of each method with the rest 
		int minDist [] = new int[totalMethods];				   //index of closest cluster
		System.out.println("Total methods: "+ totalMethods);
		
		compareFeatureVectors();

		/**** Jaccard Difference Matrix Creation *****/
		createDistanceMatrix(dist, featureVectors, minDist);
	}

	private static void compareFeatureVectors() {
		double similarityScores[][] = new double[10][10];
		double projectSimilarityScore[] = new double[featureVectors.size()];
		String projectIDs[] = new String[featureVectors.size()];
		
		List<String> userFV = featureVectors.get(0);
		projectSimilarityScore[0] = 0;
		projectIDs[0] = "0";
		
		for (int i=1; i<featureVectors.size(); i++)
		{
			List<String> repoFV = featureVectors.get(i);
			for (int j = 0; j < userFV.size(); j++) {
				String userTopic = userFV.get(j);
				for (int k = 0; k < repoFV.size(); k++) {
					String repoTopic = repoFV.get(k);
					if (userTopic.equalsIgnoreCase(repoTopic))
					{
						similarityScores[j][k] = 10; // in order to boost our exactly matching keywords
					}
					else
					{
						similarityScores[j][k] = facade.computeSimilarity(userTopic, repoTopic);
					}
				}
			}
			System.out.println(similarityScores.length);
			projectSimilarityScore[i] = 0;
			projectIDs[i] = featureProjectIDs.get(i);
			
			for (int a=0; a<10; a++)
			{
				for (int b=0; b<10; b++)
				{
					projectSimilarityScore[i] = projectSimilarityScore[i] + similarityScores[a][b];
				}
			}
			System.out.println(projectSimilarityScore[i]);
			System.out.println(projectIDs[i]);
		}
	}

	private static void addTemporary() {
		//get all the feature vectors from db based on project ids
		ArrayList<String> userFeatureVector2 = new ArrayList<String>();
		userFeatureVector2.add("print");
		userFeatureVector2.add("system");
		userFeatureVector2.add("spellcheck");
		userFeatureVector2.add("style");
		userFeatureVector2.add("matrix");

		ArrayList<String> userFeatureVector3 = new ArrayList<String>();
		userFeatureVector3.add("system");
		userFeatureVector3.add("editor");
		userFeatureVector3.add("translator");
		userFeatureVector3.add("print");
		userFeatureVector3.add("write");

		featureVectors.add(userFeatureVector2);
		featureVectors.add(userFeatureVector3);
	}

	private static void getFeatureVectorsFromDB() throws Throwable {
		DbConnection dc = new DbConnection();
		dc.openConnection();
		ResultSet projectIDs = dc.getProjectIDOfDomainTopics();
		while (projectIDs.next())
		{
			ResultSet projectWiseDomainTopics = dc.getDomainTopicsofProjectID(projectIDs.getInt("projectID"));
			ArrayList<String> domainTopics = new ArrayList<String>(); 
			while (projectWiseDomainTopics.next())
			{
				String stemmedInputWord = facade.stemWord(projectWiseDomainTopics.getString("topics")); // stemmed words should already be in db 
				domainTopics.add(stemmedInputWord);
			}
			featureVectors.add(domainTopics);
			featureProjectIDs.add(projectIDs.getString("projectID"));
		}
		dc.closeConnection();
	}

	public static void createDistanceMatrix(double d[][], List<ArrayList<String>> methodsTags, int minD[] ) throws Throwable{
		//for (int i=0; i<d.length; i++){
		for (int j=0; j<d[0].length; j++){
			if (0==j) d[0][j]=2.0;
			//d[i][j] = Double.POSITIVE_INFINITY;
			else {
				d[0][j] = calculateJaccardDifference(methodsTags.get(0), methodsTags.get(j));
			}
			//Maintain minimum index of closest cluster
			if (d[0][j]<d[0][minD[0]] && d[0][j]!=2)
				minD[0] = j;
			//}
		}

		System.out.println("\nDifference Matrix");
		System.out.print("Node-0: ");
		for(int j=0; j<d[0].length; j++){
			//for (int j=0; j<i; j++){
			System.out.print(Math.round(d[0][j]*100.0)/100.0 + "	");
		}

		System.out.println();
		System.out.println("min distant node of  node 0: "+ minD[0]);
		System.out.println("\nRecommended Project ID from "+ (minD.length-1) + " projects: " + featureProjectIDs.get(minD[0]));
		recommendProject(featureProjectIDs.get(minD[0]));
	}

	private static void recommendProject(String projectID) throws Throwable {
		if (projectID!=null && projectID!= "" && projectID!="0" && !projectID.isEmpty())
		{
			DbConnection dc = new DbConnection();
			dc.openConnection();
			System.out.println("\nRecommended project uri is: " + dc.getProjectName(projectID));
			String pn = dc.getProjectName(projectID);
			String[] segments = pn.split("\\\\");
			String idStr = segments[segments.length-1];
			System.out.println("\nRecommended project name is: " + idStr);
			System.out.println("\nPatterns implemented are: ");
			ResultSet patterns = dc.getPatternsOfProject(projectID);
			while(patterns.next()){
				System.out.println(patterns.getString(1));
			}
			
			ResultSet patternIDs = dc.getPatternIDsOfProject(projectID);
			System.out.println("\nDetails of project are: ");
			while(patternIDs.next()){
				//System.out.println(patternIDs.getString(1));
				System.out.println("\nFor Design Pattern: " + patternIDs.getString(2));
				ResultSet patternIDsDetails = dc.getPatternIDsDetail(projectID,patternIDs.getString(1));
				while(patternIDsDetails.next()){
					System.out.println("Role Name: " + patternIDsDetails.getString("roleName") + ", Method Name: " + patternIDsDetails.getString("methodName") + ", Class Name: " + patternIDsDetails.getString("className"));
				}
			}
			/*
			System.out.println("\nDetails of project are: ");
			ResultSet details = dc.getProjectDetails(projectID);
			while(details.next()){
				System.out.println("Role Name: " + details.getString("roleName") + ", Method Name: " + details.getString("methodName") + ", Class Name: " + details.getString("className"));
			}
			*/
			dc.closeConnection();
		}
		else
		{
			System.out.println("No useful recommendation found...");
		}
	}

	public static double calculateJaccardDifference(List<String> list1, List<String> list2){
		double jaccardDifference = 1- calculateJaccardSimilarity(list1, list2);
		return jaccardDifference;
	}

	public static double calculateJaccardSimilarity(List<String> list1, List<String> list2){
		List<String> unions = new ArrayList<String>();
		List<String> intersections = new ArrayList<String>();
		double similarity;
		unions = findUnion(list1, list2);
		System.out.print("Union: ");
		for (int i=0; i<unions.size(); i++){
			System.out.print(unions.get(i) + '\t');
		}
		System.out.println();

		// Intersection of 1st two methods	 
		intersections = findIntersection(list1, list2);
		System.out.print("Intersection: ");
		for (int i=0; i<intersections.size(); i++){
			System.out.print(intersections.get(i) + '\t');
		}
		System.out.println();
		similarity = jaccardSimilarity(intersections, unions);
		System.out.println("Similarity: " + similarity);
		return similarity;
	}

	public static <T> List<T> findUnion(List<T> list1, List<T> list2) {
		Set<T> set = new HashSet<T>();
		set.addAll(list1);
		set.addAll(list2);
		return new ArrayList<T>(set);
	}

	public static <T> List<T> findIntersection(List<T> list1, List<T> list2) {
		List<T> list = new ArrayList<T>();
		for (T t : list1) {
			if(list2.contains(t)) {
				list.add(t);
			}
		}
		return list;
	}

	public static <T> double jaccardSimilarity(List<T> list1, List<T> list2){
		float intersectionCount = list1.size();
		float unionCount = list2.size();
		return intersectionCount/unionCount;
	}
}
