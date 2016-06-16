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
import java.util.Iterator;
import java.util.List;

import org.smu.wordsimilarity.JackardSimilarityBags;
import org.smu.wordsimilarity.Sample;

import cc.mallet.TopicExtraction.TopicModel;
import cc.mallet.util.Constants;
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
		String[] tokens = breakTopics(list.toString());
		double[] probs=getProbabilities(tokens);
		int noTopicsInserted = 0; 
		// while(DomainNames.length ) {
		while ( (DomainNames.size() < Constants.numberKeywordsThresh) || noTopicsInserted > 10) {
			int max=getMaxIndex(probs);
			DomainNames.addAll(getDomainRow(tokens, max));//Get the names of the clusters having the highest weightage
			probs[max] = -1; // remove the index so that doesnt interfere in next calculation		
			while(DomainNames.size() > Constants.numberKeywordsThresh) {
				DomainNames.remove(DomainNames.size() - 1);
			}			
			noTopicsInserted++;
		}
		
		//System.out.print(DomainNames);
		clean();
		javaTotext.delete(new File("Outfile\\Output.txt"));
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		return DomainNames;
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
			String preprocessedFile = "";
			String line = "";
			while ((line = br.readLine()) != null) {					
				line = line.trim();
				if(line.startsWith("private")||line.startsWith("public"))
				{
					preprocessedFile += cleanString(line)+ "\n";
					//System.out.println(line);					
				}
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

	public static void write(String s, boolean overwrite) throws IOException{
		FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,overwrite);
		BufferedWriter writer = new BufferedWriter(fileWritter);
		writer.write(s);
		writer.close();
		System.gc();
	}

	public static String cleanString(String s){
		String str=s;
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
		str=str.replace("class", " ");
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
		str=str.replace("if", " ");
		str=str.replace("private", " ");
		str=str.replace("this ", " ");
		str=str.replace("assert", " ");
		str=str.replace("do", " ");
		str=str.replace("implements", " ");
		str=str.replace("protected", " ");
		str=str.replace("throw ", " ");
		str=str.replace("Boolean", " ");
		str=str.replace("double", " ");
		str=str.replace("import", " ");
		str=str.replace("public", " ");
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
		str=str.replace("class", " ");
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
		str = spiltCamelCase(str);
		str=str.replaceAll("\\s{2,}"," ");
		str=str.replace("@Override", "");
		return str;
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
