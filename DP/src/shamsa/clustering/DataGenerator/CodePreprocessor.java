package shamsa.clustering.DataGenerator;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;

import cc.mallet.TopicExtraction.TopicModel;
import cc.mallet.util.Constants;
import gr.uom.java.pattern.gui.Console;

//import org.smu.wordsimilarity.JackardSimilarityBags;
//import org.smu.wordsimilarity.Sample;


public class CodePreprocessor {
	
	private static PreprocessorDAO preprocessorDAO;
	private static String projectPath;
		
	public static void run(File directoryName) throws Throwable{
		
		File rootDirectory = new File(directoryName.getPath());
		File[] projectsList = rootDirectory.listFiles();
		
		// file opening and var declaration code 
		String descriptionFilePath = directoryName.getPath() + "\\description.csv";
		File descriptionFile = new File(descriptionFilePath);		
		Scanner scanner = new Scanner(descriptionFile);
		String projectDetails = "";
		String [] splitprojectDetails = new String[2];
		int categoryID = -1;
		String description = "";
		// //

		
		for (File file : projectsList) {
			if (file.isDirectory()) {				
				
				projectPath = file.getPath();
				
				// get category ID and description of project
				projectDetails = scanner.nextLine();
				splitprojectDetails = projectDetails.split(",");
				categoryID = Integer.parseInt(splitprojectDetails[0]);
				description = splitprojectDetails[1];
				// //

				Console designPatternDetector = new Console();//this starts pattern detection and save pattern instances
				designPatternDetector.detectPatternInstances(new File(projectPath));
				if(designPatternDetector.hasDesignPatternInstances())
				{
					preprocessorDAO = new PreprocessorDAO();		
					preprocessorDAO.saveProject(file.getPath(),categoryID, description);

//					preprocessorDAO.saveProject(file.getPath());
					designPatternDetector.saveDesignPatternInstances();
					createConsolidatedCodeFile();
			 		preprocessProjectSourceFiles(file); 
					TopicModel.IdentifyTopic();
					saveIdentifiedTopics(file);
					deleteConsolidatedFile();
					System.out.println("DONE!!!");
					
				}
				else {
					System.out.println("No design pattern instances for project: " + projectPath );
				}
				
			}
		}
		/*
		preprocessorDAO = new PreprocessorDAO();		
		preprocessorDAO.saveProject(directoryName.getPath());
		projectPath = directoryName.getPath();		
		createConsolidatedCodeFile();
 		preprocessProjectSourceFiles(directoryName); 
		TopicModel.IdentifyTopic();
		saveIdentifiedTopics(directoryName);
		deleteConsolidatedFile();
		System.out.println("DONE!!!");*/
	
	}

	private static void preprocessProjectSourceFiles(File directoryName) throws Exception {
		
		List<File> folderList = new ArrayList<File>();
		List<File> javaFiles = new ArrayList<File>();
		File[] filesList = directoryName.listFiles();
		
		for (File file : filesList){
			if (file.isFile() ){
				if(file.getName().endsWith(".java"))
				{
					javaFiles.add(file);					
				}
			}
			else if(!file.getName().contentEquals(".svn")) {
				folderList.add(file);
			}
		}
		
		Iterator<File> javaFileIterator = javaFiles.iterator();
		while(javaFileIterator.hasNext()){
			preprocessSourceFiles(javaFileIterator.next());
		}
		for(File folder:folderList){
			preprocessSourceFilesFromNestedFolders(folder);
		}
	} 

	public static List<File> getNestedJavaFiles(String directoryName) {
		
		File directory = new File(directoryName);
		File[] filesList = directory.listFiles();
		
		List<File> javaFilesList = new ArrayList<File>();
		
		for (File file : filesList) {
			if (file.isFile() && file.getAbsolutePath().endsWith("java")) {
				javaFilesList.add(file);
				//System.out.println(file.getAbsolutePath());
			} else if (file.isDirectory()) {
				javaFilesList.addAll(getNestedJavaFiles(file.getAbsolutePath()));
			}
		}
		return javaFilesList;
	} 

	public static void preprocessSourceFilesFromNestedFolders(File file) throws Exception {
		
		List<File> javaFilesDirectory= getNestedJavaFiles(file.getPath());
		Iterator<File> javaFileIter = javaFilesDirectory.iterator();
		
		while(javaFileIter.hasNext()){
			preprocessSourceFiles(javaFileIter.next());
		}
	}

	private static void saveIdentifiedTopics(File file)
			throws Exception, IOException, ClassNotFoundException, SQLException {
			
		String topicsMatrix = getTopics().toString();
		insertTopicData(topicsMatrix, projectPath);
		
	}

	public static double[] getProbabilities(String[] topicList){
		
		double[] outputProbs = new double[topicList.length-1];
		String[] prob=new String[topicList.length-1];
		for(int i=0;i<=topicList.length-2;i++){
			String[] temp =topicList[i].split(" ") ;
			if(i>0){
				prob = temp[1].split("\t");
			}
			else{
				prob = temp[0].split("\t");
			}
			outputProbs[i] = Double.parseDouble(prob[1].replace("]", "").toString()); 
		}
		return outputProbs;
	}

	public static void preprocessSourceFiles(File file) throws Exception{
		if(file.exists()){
			//System.out.println("Reading file from "+ file.getAbsolutePath());			
			try 
			{
				Path consolidatedFilePath = Paths.get(Constants.ConsolidatedCodeFilePath);				
				if (!Files.exists(consolidatedFilePath)) 
				{				  
					Files.createFile(consolidatedFilePath);
				}				
			
				BufferedReader br = new BufferedReader(new FileReader(file));
				String preprocessedFile = "0 " + "0 ";
				String line = "";
				
				boolean isMultilineComment = false;
				boolean isCopyrightComment = false;				
				boolean isSinglelineComment = false;
				boolean isFirst = true; 
				while ((line = br.readLine()) != null) {					
					line = line.trim();
					if(line.startsWith("/*"))
					{
						isMultilineComment = true;
						if (isFirst) {
							while ((line = br.readLine()) != null) {
								line = line.trim();
								if (line.endsWith("*/")) {
									isMultilineComment = false;
									break;
								}
							}
							isFirst = false;
							continue;
						}
//						if(line.contains("Copyright"))
//						{
//							isCopyrightComment = true;							
//						}
//						else
//							isCopyrightComment = false;
						
					}
					
					if (line.startsWith("//")) {
						isSinglelineComment = true;
					}
					
					if(line.startsWith("private")||line.startsWith("public")||line.startsWith("//")||(isMultilineComment) || isSinglelineComment) // && !isCopyrightComment))
					{
						boolean canPreprocess = true;

						if (isMultilineComment || isSinglelineComment) {
							canPreprocess = hasNoJavaCode(line);
						}
						if (canPreprocess) {
							preprocessedFile += clean(line)+ " ";
						}
						//System.out.println(line);					
					}
					if(line.endsWith("*/"))
					{
						isMultilineComment = false;
						isCopyrightComment = false;
						
					}
					isSinglelineComment = false;
				}
				br.close();
				Files.write(consolidatedFilePath,  " \n".getBytes(), StandardOpenOption.APPEND);
				Files.write(consolidatedFilePath,  preprocessedFile.getBytes(), StandardOpenOption.APPEND);
				
			}
			catch (IOException e) 
			{			
				  e.printStackTrace();
			}
		}
	}
	
	private static boolean hasNoJavaCode(String line) {
		
		if (line.startsWith("private")||line.startsWith("public") || line.endsWith(";")) {
			return false;
		}	
		return true;
	}


	public static List<String> getTopics() throws IOException{
				
		BufferedReader br = new BufferedReader(new FileReader(Constants.topicsFilePath));
		ArrayList<String> detectedTopics = new ArrayList<String>();		
		
		while (br.ready()) {			
			detectedTopics.add(br.readLine());
		}
		
		new File(Constants.topicsFilePath).delete();		
		br.close();
		return detectedTopics;
	}

	public static void deleteConsolidatedFile()
	{	
		try{
			
			Path path = Paths.get(Constants.ConsolidatedCodeFilePath);
			System.gc();
			if (Files.exists(path)) {
				new File(Constants.ConsolidatedCodeFilePath).delete();				
			}		

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static void createConsolidatedCodeFile() throws IOException{
		
		deleteConsolidatedFile();
		FileWriter fileWritter = new FileWriter(Constants.ConsolidatedCodeFilePath,true);
		BufferedWriter writer = new BufferedWriter(fileWritter);
		writer.write("");
		writer.close();
	}
	
	public static String clean(String s){
		String str=s;
		str=str.replace("public", " ");		
		str=str.replace("(", "");
		str=str.replace(")", "");
		str=str.replace("{", "");
		str=str.replace("}", "");
		str=str.replace("[", "");
		str=str.replace("]", "");
		str=str.replace(";", "");
		str=str.replace("*", "");
		str=str.replace("\\*", "");
		str=str.replace("\\", "");
		str=str.replace("//", "");
		str=str.replace("\n", " ");
		str=str.replace("\r", " ");
		str=str.replace("\"", " ");
		str=str.replace(",", " ");
		str=str.replace("string", "");
		str=str.replace("String", "");
		str=str.replace("println", " ");
		str=str.replace("set", " ");
		str=str.replace("get", " ");
		str=str.replace("button", " ");
		str=str.replace("panel", " ");
		str=str.replace("main", " ");
		str=str.replace("java", " ");
		str=str.replace("list", " ");
		str=str.replace("empty", " ");
		str=str.replace("override", " ");
		str=str.replace("exit", " ");
		str=str.replace("return", " ");
		str=str.replace("label", " ");
		str=str.replace("system", " ");
		str=str.replace("true", " ");
		str=str.replace("false", " ");
		str=str.replace("file", " ");
		str=str.replace("while", " ");
		str=str.replace("equals", " ");
		str=str.replace("equal", " ");		
		str=str.replace("directory", " ");
		str=str.replace("comment", " ");
		str=str.replace("indexof", " ");
		str=str.replace("path", " ");
		str=str.replace("data", " ");
		str=str.replace("field", " ");
		str=str.replace("files", " ");
		str=str.replace("datasource", " ");
		str=str.replace("replace", " ");
		str=str.replace("reset", " ");
		str=str.replace("filewriter", " ");
		str=str.replace("filereader", " ");
		str=str.replace("exception", " ");
		str=str.replace("sql", " ");
		str=str.replace("getpath", " ");
		str=str.replace("endswith", " ");
		str=str.replace("found", " ");
		str=str.replace("notfound", " ");
		str=str.replace("contains", " ");
		str=str.replace("next", " ");
		str=str.replace("hit", " ");
		str=str.replace("package", " ");
		str=str.replace("exception", " ");
		str=str.replace("folder", " ");
		str=str.replace("index", " ");
		str=str.replace("QueryParser", " ");
		str=str.replace("zero", " ");
		str=str.replace("abstract", " ");
		str=str.replace("default", " ");
		str=str.replace(" if", " ");
		str=str.replace("private", " ");
		str=str.replace("this ", " ");
		str=str.replace("assert", " ");
		str=str.replace("double", " ");
		str=str.replace("do", " ");
		str=str.replace("implements", " ");
		str=str.replace("protected", " ");
		str=str.replace("throw ", " ");
		str=str.replace("Boolean", " ");		
		str=str.replace("import", " ");
		
		str=str.replace("throws ", " ");
		str=str.replace("break", " ");
		str=str.replace("else", " ");
		str=str.replace("instanceof", " ");
		str=str.replace("return", " ");
		str=str.replace("transient ", " ");
		str=str.replace("byte", " ");
		str=str.replace("enum", " ");
		str=str.replace("int ", " ");
		str=str.replace("short", " ");
		str=str.replace("try ", " ");
		str=str.replace("case", " ");
		str=str.replace("extends", " ");
		str=str.replace("interface", " ");
		str=str.replace("static", " ");
		str=str.replace("void ", " ");
		str=str.replace("catch", " ");
		str=str.replace("final", " ");
		str=str.replace("long", " ");
		str=str.replace("strictfp", " ");
		str=str.replace("volatile", " ");
		str=str.replace("char", " ");
		str=str.replace("finally", " ");
		str=str.replace("native", " ");
		str=str.replace("super", " ");
		str=str.replace("while", " ");		
		str=str.replace("float", " ");
		str=str.replace("new", " ");
		str=str.replace("switch", " ");
		str=str.replace("continue", " ");
		str=str.replace("for", " ");
		str=str.replace("package", " ");
		str=str.replace("synchronized", " ");
		str=str.replace("const", " ");
		str=str.replace("goto", " ");
		str=str.replace("Reserved", " ");
		str=str.replace("Literals", " ");
		str=str.replace("null", " ");
		str=str.replace("Thread", " ");
		str=str.replace("sleep", " ");
		str=str.replace("System", " ");
		str=str.replace("boolean", " ");
		str=str.replace("List", " ");
		str=str.replace("Array", " ");
		str=str.replace("TODO", " ");
		str=str.replace("args", " ");
		str=str.replace("color", "");
		str=str.replace("JFrame", " ");
		str=str.replace("JPanel", "");
		str=str.replace("JLabel", " ");
		str=str.replace("JButton", "");
		str=str.replace("Frame", " ");
		str=str.replace("Panel", "");
		str=str.replace("Label", " ");
		str=str.replace("Text", " ");
		str=str.replace("Ran", "");
		str=str.replace("Menu", "");
		str=str.replace("J", "");
		str=str.replace("Override", "");
		str=str.replace(".", " ");
		str=str.replace(" to", " ");
		
		str=str.replaceAll("\\s{2,}"," ");
		str=str.replace("@Override", "");
		String className="";
	
		if(str.contains("class"))
		{
			str = str.replace("class", " ");
			str = str.trim();
			int index = str.indexOf(" ");
			
			if (index >= 0){
				className = str.substring(0,str.indexOf(" "));
				className = splitCamelCase(className);
			}
		}
		str = splitCamelCase(str);
//		if (!(str == " ")){
			str = deDuplicate(str);
//		}
		if(!className.contentEquals(""))
		{
			str = str + " " + className + " " + className + " " + className + " " + className
					+ " " + className+ " " + className+ " " + className+ " " + className+ " " + className;//boost class name by 10 times
		}
		
		str=str.replaceAll("\\s{2,}"," ");
		return str;
	}
	public static String deDuplicate(String line) {//does not maintain word order
		String[] arr = (line.toLowerCase()).split(" ");
        Arrays.sort(arr);
        String finalStr = "";
        if (arr.length > 0) {
	        finalStr = arr[0];
	        for(int i=1; i<arr.length; i++){
	            if(arr[i].equalsIgnoreCase(arr[i-1])==false){
	                finalStr = finalStr + " " + arr[i];
	            }
	        }
        }
        return finalStr;
	}

	public static String splitCamelCase(String input)
	{
		String  result="";
		for (String w : input.split("(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])")) {
			result = result + " " + w;
		}
		return result;
	}  
		
	public static void insertTopicData(String topics, String filePath) throws SQLException {
		
		int projectID = preprocessorDAO.getProjectID(filePath);
		String[] topicClusters = topics.split(",");
		double[] probs = getProbabilities(topicClusters);		
		
		String[] orderedTopicClusters = getOrderedTopicClusters(topicClusters, probs);
		double[] orderedProbabilities = getOrderedProbabilities(probs);		

		List<String> keywords = getDomainRow(orderedTopicClusters, true);
		List<String> keywordsWeightage = getDomainRow(orderedTopicClusters, false);
		
		
		for (int count = 0; count<10; count++) {		//loop till the number of topics
			
			preprocessorDAO.insertDomainTopics(projectID, orderedProbabilities[count]);
			int topicID = preprocessorDAO.getTopicID(projectID);						
			preprocessorDAO.insertDomainKeywords(keywords.get(count).toString(), keywordsWeightage.get(count).toString(),
					projectID, filePath, orderedProbabilities[count], topicID+count);			
		}
	}
	
private static double[] getOrderedProbabilities(double[] probs) {
	Arrays.sort(probs);	
	
	double[] probabilities = Arrays.copyOf(probs, probs.length);
	for(int i = 0,j = 9; i < 10; i++, j--)
	{
		probabilities[j] = probs[i];
	}	
	return probabilities;
	}

private static String[] getOrderedTopicClusters(String[] topicClusters, double[] probs) {
	
		String[] orderedTopicClusters = new String[10];
		double[] probabilities = Arrays.copyOf(probs, probs.length);
		for(int c =0; c < 10; c++)
		{
			int index = getMaxValueIndex(probabilities);
			probabilities[index]= 0;
			orderedTopicClusters[c] = topicClusters[index];
		}
		
		
		return orderedTopicClusters;
	}

	public static int getMaxValueIndex(double[] array) {

		double maxValue = array[0];
		int maxIndex = 0;

		for (int i = 1; i < array.length; i++) {
			if (array[i] > maxValue) {
				maxValue = array[i];
				maxIndex = i;
			}
		}
		return maxIndex;
	}  

public static List<String> getDomainRow(String[] topicArray, boolean div) {
	List<String> domainElement = new ArrayList<String>();
	
	boolean tempPos = div;
	String element = "";
	int j = 2;
	for (String line : topicArray) {
		String[] clusterKeywords = line.replace("\t", " ").replace("\n", " ").split(" ");
		if (line.startsWith(" ")) {
			tempPos = !div;
			j = 3;
		}
		for (int i = j; i < clusterKeywords.length; i++) {

			if ((i % 2 == 0) == tempPos) {
				element = element + " " + clusterKeywords[i];
			}
		}
		element = element.replace("(", "").replace(")", "");
		domainElement.add(element);
		element = "";
		tempPos = div;
		
	}
	return domainElement;
}

	public static ArrayList<String> getDomaincolumn(String[] topicArray, int position){
		ArrayList<String> domainElement = new ArrayList<String>();
		
		int tempPos=position;
		String element="";
		for(String line:topicArray){
			String[] clusterKeywords = line.replace("\t"," ").replace("\n"," ").split(" ");
			if(line.startsWith(" ")){
				tempPos=tempPos+1;
			}
			if(clusterKeywords.length>tempPos){
				element=clusterKeywords[tempPos].replace("(", "").replace(")", "");
				domainElement.add(element);
			}
			
			tempPos=position;
		}
		return domainElement;
	}

	}
