package cc.mallet.javaTotext;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import org.smu.wordsimilarity.JackardSimilarityBags;
import org.smu.wordsimilarity.Sample;
import org.smu.wordsimilarity.Stemmer;

import cc.mallet.TopicExtraction.TopicModel;
import cc.mallet.util.Constants;
//import shamsa.clustering.DataGenerator.Stemmer;


public class javaTotext {
	public static TopicModel identifyTopic;
	public static DbConnection db;
	public static final String FILES_TO_INDEX_DIRECTORY = "Outfile\\Output.txt"; //contains the java files
	public static File folder;
	static String temp = "";

	public static void run(File directoryName) throws Throwable{
		File directory = directoryName;
		JackardSimilarityBags j1 = new JackardSimilarityBags();
		clean();
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		ArrayList<String> userVector = ExtractDomainTopic(directory);
		j1.findRecommendations(userVector);
	} 

	public static List<File> listf(String directoryName) {
		File directory = new File(directoryName);
		List<File> resultList = new ArrayList<File>();

		File[] fList = directory.listFiles();
		List<File> javaList =new ArrayList<File>();
		resultList.addAll(Arrays.asList(fList));
		for (File file : fList) {
			if (file.isFile() && file.getAbsolutePath().endsWith("java")) {
				javaList.add(file);
//				System.out.println(file.getAbsolutePath());
			} else if (file.isDirectory()) {
				javaList.addAll(listf(file.getAbsolutePath()));
			}
		}
		//System.out.println(fList);
		return javaList;
	} 

	public static File getProjectPath(File f){
		if(f.getAbsolutePath().contains("src")){
			return getProjectPath(f.getParentFile());
		}
		else{return f;}
	}

	public static ArrayList<String> ExtractDomainTopic(File file) throws Exception {
		clean();
		javaTotext.delete(new File("Outfile\\Output.txt"));
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		ArrayList<String> DomainNames = new ArrayList<String>();
		List<File> javaFilesDirectory= listf(file.getPath());
		Iterator<File> javaFileIter = javaFilesDirectory.iterator();
		while(javaFileIter.hasNext()){
			extractTopic(javaFileIter.next());
		}
		identifyTopic.IdentifyTopic();
		List<String> list=getTopics();
		String[] topicClusters = breakTopics(list.toString());
		double[] probs=getProbabilities(topicClusters);
		
		if(Constants.getKeywordsbyTopic)
		{
			int noTopicsInserted = 0; 
			// while(DomainNames.length ) {
			while ( (DomainNames.size() < Constants.numberKeywordsThresh) || noTopicsInserted > 10) {
				int max=getMaxIndex(probs);
				DomainNames.addAll(getDomainRow(topicClusters, max));//Get the names of the clusters having the highest weightage
				probs[max] = -1; // remove the index so that doesnt interfere in next calculation		
				while(DomainNames.size() > Constants.numberKeywordsThresh) {
					DomainNames.remove(DomainNames.size() - 1);
				}			
				noTopicsInserted++;
			}
		}
		else
		{
			DomainNames.addAll(getKeywordsByProbability(topicClusters,probs));
		}
		//System.out.print(DomainNames);
		clean();
		javaTotext.delete(new File("Outfile\\Output.txt"));
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		
		
		return DomainNames;
	}
	

	private static ArrayList<String> getKeywordsByProbability(String[] topicClusters, double[] probs) {
	
		String[] orderedTopicClusters = getOrderedTopicClusters(topicClusters, probs);
		
		List<String> keywords = getDomainRow(orderedTopicClusters, true);
		List<String> keywordsWeightage = getDomainRow(orderedTopicClusters, false);
		String[] keywordsByProb = new String[100];
		int keywordsByProbIndex = 0;
		final Integer[] weightsByProb = new Integer[100];
		int weightsByProbIndex = 0;
		
		for (int count = 0; count<10; count++) {		//loop till the number of topics
								
			String[] words = keywords.get(count).toString().split(" ");
			String[] weights = keywordsWeightage.get(count).toString().split(" ");		
			//sort words by weights
			for(int i=1;i<words.length;i++)
			{
				keywordsByProb[keywordsByProbIndex] = words[i];				
				weightsByProb[keywordsByProbIndex] = Integer.parseInt(weights[i]);
				keywordsByProbIndex+=1;
			}
		}
		//sort the words by weights
		//sort weights to get the sorted ascending sequence in a third array idxs		
		Integer[] idxs = new Integer[keywordsByProbIndex];
		for(int i = 0; i < keywordsByProbIndex; i++) idxs[i] = i;
		Arrays.sort(idxs, new Comparator<Integer>(){
			public int compare(Integer o1, Integer o2){
				return Double.compare(weightsByProb[o1], weightsByProb[o2]);
			}
		});
		ArrayList<String> sorted = new ArrayList<String>();
		String[] sortedKeywords = new String[keywordsByProbIndex];
		
		int numberOfKeywords = Constants.numberKeywordsThresh < keywordsByProbIndex ? Constants.numberKeywordsThresh:keywordsByProbIndex; 
		int addedKeywords = 0;
		
		for (int i=0; i < numberOfKeywords || addedKeywords < numberOfKeywords; i++){
			
			sortedKeywords[i] = keywordsByProb[idxs[keywordsByProbIndex-1-i]];
			if(!sorted.contains(sortedKeywords[i]))
			{
				sorted.add(sortedKeywords[i]);
				addedKeywords+=1;
			}
		}		
		return sorted;
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

	public static int getMaxIndex(double[] outputProbs){
		int maxIndex = 0;
		double max=0;
		for (int i = 0; i <= outputProbs.length-1; i++) {
			if (outputProbs[i] > max) {
				max = outputProbs[i];
				maxIndex = i;
			}
		}
		System.out.println(maxIndex);
		return maxIndex;
	}

	public static String[] breakTopics(String topics){
		String[] topicList = topics.split(",");
		return topicList;
	}

	public static ArrayList<String> getDomainRow(String[] topicArray, int temp){
		ArrayList<String> domainElement = new ArrayList<String>();
		boolean div=true;
		int count=0;
		boolean tempPos=true;
		String element="";
		int j=2;
		for(String line:topicArray){
			if(count==temp){
				String[] clusterKeywords = line.replace("\t"," ").replace("\n"," ").split(" ");
				if(line.startsWith(" ")){
					tempPos=false;
					j=3;
				}
				for(int i=j;i<clusterKeywords.length;i++){

					if((i%2==0)==tempPos){
						//element=element+" "+clusterKeywords[i];
						element=clusterKeywords[i].replace("(", "").replace(")", "");
						domainElement.add(element);
					}
				}
				//element=element.replace("(", "").replace(")", "");
				//domainElement.add(element);
			}
			element="";
			tempPos=div;
			count++;
		}
		return domainElement;
	}

	public static ArrayList getDomaincolumn(String[] topicArray, int position){
		ArrayList domainElement = new ArrayList();
		int count =1;
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
			count++;
			tempPos=position;
		}
		return domainElement;
	}

	public static boolean isSrcFolder(File file){
		if(file.getAbsolutePath().contains("src")){
			return true;
		}
		else{return false;}
	} 

	public static void extractTopic(File file) throws Exception{
		if(file.exists()){
			System.out.println("Reading file from "+ file.getAbsolutePath());
			//  listFilesForFolder(folder);
			read(file) ;
		}
	}

	public static List<String> getTopics() throws IOException{
		File f= new File("Outfile\\out.txt");
		FileReader fr = new FileReader("Outfile\\out.txt");
		String line = "";
		BufferedReader br = new BufferedReader(fr);
		ArrayList<String> s = new ArrayList<String>();
		while (br.ready()) {
			line =br.readLine();
			s.add(line);
		}
		f.delete();
		return s;
	}

	public static void delete(File outfile)
	{	
		try{
			Path p = Paths.get(outfile.getPath());
			String outfileName = "Outfile\\" + p.getFileName();
			Path path = Paths.get(outfileName);
			System.gc();
			if (Files.exists(path)) {
				File outFile1 = new File(outfileName);
				outFile1.delete();
			}
			/*
			File file = outfile;
			String name = file.getName();
			if(file.exists()){
				file.delete();
				System.out.println(name + " is deleted!");
			}else{
				System.out.println("Already Deleted.");
			}
			 */

		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static void clean() throws IOException{
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,true);
		BufferedWriter writer = new BufferedWriter(fileWritter);
		writer.write("");
		writer.close();
	}

	public static void read(final File file) throws IOException{
		/*File path = folder;     
		String line="";
		FileReader fr = new FileReader(path);
		BufferedReader br = new BufferedReader(fr);
		String s = "";
		while (br.ready()) {
			line =br.readLine();
			if (line.contains("Copyright")|| line.startsWith("import ") ||line.startsWith("package ")||line.equals(" ")){

			}
			else{
				s += line + "\n";
				s = cleanString(s);
				//  write(s);
			}
		}
		write(s,true);
		br.close();*/
		
		try 
		{
			Path consolidatedFilePath = Paths.get("Outfile\\Output.txt");				
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
//					if(line.contains("Copyright"))
//					{
//						isCopyrightComment = true;							
//					}
//					else
//						isCopyrightComment = false;
					
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
						preprocessedFile += cleanString(line)+ " ";
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

	private static boolean hasNoJavaCode(String line) {
		
		if (line.startsWith("private")||line.startsWith("public") || line.endsWith(";")) {
				return false;
		}
		return true;
		
	}

	public static void write(String s, boolean overwrite) throws IOException{
		FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,overwrite);
		BufferedWriter writer = new BufferedWriter(fileWritter);
		writer.write(s);
		writer.close();
		System.gc();
	}

	public static String cleanString(String s){
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
				className = spiltCamelCase(className);
			}
		}
		str = spiltCamelCase(str);
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


	public static String spiltCamelCase(String input)
	{
		String  result="";
		for (String w : input.split("(?<!(^|[A-Z]))(?=[A-Z])|(?<!^)(?=[A-Z][a-z])")) {
			result = result + " " + w;
		}
		return result;
	}  

	public static void listFilesForFolder(final File folder) {

		for (final File fileEntry : folder.listFiles()) {
			if (fileEntry.isDirectory()) {

				listFilesForFolder(fileEntry);
			} else {
				if (fileEntry.isFile()) {
					temp = fileEntry.getName();
					if ((temp.substring(temp.lastIndexOf('.') + 1, temp.length()).toLowerCase()).equals("txt"))
						System.out.println("File= " + folder.getAbsolutePath()+ "\\" + fileEntry.getName());
				}
			}
		}
	}
}
