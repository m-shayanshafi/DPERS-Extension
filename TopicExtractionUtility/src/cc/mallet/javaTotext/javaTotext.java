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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.smu.wordsimilarity.JackardSimilarityBags;
import org.smu.wordsimilarity.Sample;

import cc.mallet.TopicExtraction.TopicModel;
public class javaTotext {
	public static TopicModel identifyTopic;
	public static DbConnection db;
	public static final String FILES_TO_INDEX_DIRECTORY = "Outfile\\Output.txt"; //contains the java files
	public static File folder;
	static String temp = "";

	public static void run(File directoryName) throws Throwable{
		File directory = directoryName;
		JackardSimilarityBags j1 = new JackardSimilarityBags();
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
				System.out.println(file.getAbsolutePath());
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

	public static ArrayList ExtractDomainTopic(File file) throws Exception {
		clean();
		ArrayList DomainNames = null;
		List<File> javaFilesDirectory= listf(file.getPath());
		Iterator<File> javaFileIter = javaFilesDirectory.iterator();
		while(javaFileIter.hasNext()){
			extractTopic(javaFileIter.next());
		}
		identifyTopic.IdentifyTopic();
		List<String> list=getTopics();
		String[] tokens = breakTopics(list.toString());
		DomainNames =getDomaincolumn(tokens,2);//Get the names of the clusters having the highest weightage
		System.out.print(DomainNames);
		delete(new File(FILES_TO_INDEX_DIRECTORY));
		return DomainNames;
	}

	public static String[] breakTopics(String topics){
		String[] topicList = topics.split(",");
		return topicList;
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
	
	public static void read(final File folder) throws IOException{
		File path = folder;     
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
		br.close();
	}

	public static void write(String s, boolean overwrite) throws IOException{
		FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,overwrite);
		BufferedWriter writer = new BufferedWriter(fileWritter);
		writer.write(s);
		writer.close();
	}

	public static String cleanString(String s){
		  String str=s;
		  str=str.replace("(", "");
		  str=str.replace(")", "");
		  str=str.replace("{", "");
		  str=str.replace("}", "");
		  str=str.replace(";", "");
		  str=str.replace("*", "");
		  str=str.replace("\\*", "");
		  str=str.replace("\\", "");
		  str=str.replace("//", "");
		  str=str.replace("\n", " ");
		  str=str.replace("\r", " ");
		  str=str.replace("\"", " ");
		  str=str.replace("string", "");
		  str=str.replace("String", "");
		  str=str.replace("println", " ");
		  str=str.replace("equals", " ");
		  str=str.replace("equal", " ");
		  str=str.replace("class", " ");
		  str=str.replace("exception", " ");
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
