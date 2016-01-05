package cc.mallet.javaTotext;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import cc.mallet.TopicExtraction.TopicModel;
public class javaTotext {
	public static TopicModel identifyTopic;
	public static DbConnection db;
	public static final String FILES_TO_INDEX_DIRECTORY = "Outfile\\Output.txt"; //contains the java files
	public static File folder;
	  static String temp = "";

	  public static List<File> listf(String directoryName) {
	        File directory = new File(directoryName);

	        List<File> resultList = new ArrayList<File>();

	        // get all the files from a directory
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

	  public static void run(File file) throws Exception {
	    // TODO Auto-generated method stub
		  clean();
		 List<File> javaFilesDirectory= listf(file.getPath());
		 Iterator<File> javaFileIter = javaFilesDirectory.iterator();
		 while(javaFileIter.hasNext()){
			 exteractTopic(javaFileIter.next());
		 }
		 javaTotext.delete(new File("Outfile\\out.txt"));
		 identifyTopic.IdentifyTopic();
		 db = DbConnection.getDBcon();
		 db.insertTopicData(getTopics(), getProjectPath(file).getPath());
		 javaTotext.delete(new File("Outfile\\Output.txt"));
		 
		// exteractTopic(file);
	  }
	  
	  public static void exteractTopic(File file) throws Exception{
		if(file.exists()){
	    System.out.println("Reading file from "+ file.getAbsolutePath());
	  //  listFilesForFolder(folder);
	    read(file) ;
		}
		 
	  }
	  public static String getTopics() throws IOException{
		  FileReader fr = new FileReader("Outfile\\out.txt");
	         BufferedReader br = new BufferedReader(fr);
	         String s = "";
	         
	         while (br.ready()) {
	            s += br.readLine() + "\n";
	  }
			return s;
	  }
	

	public static void delete(File outfile)
	    {	
	    	try{
	    		File file = outfile;
	        	if(file.exists()){
	        		file.delete();
	    			System.out.println(file.getName() + " is deleted!");
	    		}else{
	    			System.out.println("Already Deleted.");
	    		}
	    	   
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
	  FileReader fr = new FileReader(path);
      BufferedReader br = new BufferedReader(fr);
      String s = "";
	         while (br.ready()) {
	            s += br.readLine() + "\n";
	            s = cleanString(s);
	            write(s);
	         }
	         
	         br.close();
		}
	  
	  public static void write(String s) throws IOException{
		  FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,true);
	      BufferedWriter writer = new BufferedWriter(fileWritter);
	      writer.write(s);
	      writer.close();
	  }
	  
	  public static String cleanString(String s){
		  String str=s;
		  str=str.replace("(", " ");
          str=str.replace(")", " ");
          str=str.replace("{", " ");
          str=str.replace("}", " ");
          str=str.replace(";", " ");
          str=str.replace("*", " ");
          str=str.replace("\\", " ");
          str=str.replace("//", " ");
          str=str.replace("@Override", " ");
		  return str;
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
