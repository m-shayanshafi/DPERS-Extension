package cc.mallet.javaTotext;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import cc.mallet.TopicExtraction.TopicModel;
public class javaTotext {
	public static TopicModel identifyTopic;
	public static DbConnection db;
	public static final String FILES_TO_INDEX_DIRECTORY = "Outfile\\Output.txt"; //contains the java files
	public static File folder;
	  static String temp = "";

	  public static void run(File file) throws Exception {
	    // TODO Auto-generated method stub
		 folder = file;
		if(folder.exists()){
	    System.out.println("Reading files under the folder "+ folder.getAbsolutePath());
	    listFilesForFolder(folder);
	    read(folder) ;
	    javaTotext.delete(new File("Outfile\\out.txt"));
	    identifyTopic.IdentifyTopic();
	    db = DbConnection.getDBcon();
	    db.insertTopicData(getTopics(), file.getPath());
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
	        	if(file.delete()){
	    			System.out.println(file.getName() + " is deleted!");
	    		}else{
	    			System.out.println("Delete operation is failed.");
	    		}
	    	   
	    	}catch(Exception e){
	    		
	    		e.printStackTrace();
	    		
	    	}
	    }

	  public static void clean() throws IOException{
		  FileWriter fileWritter = new FileWriter(FILES_TO_INDEX_DIRECTORY,true);
	      BufferedWriter writer = new BufferedWriter(fileWritter);
	      writer.write("");
	      writer.close();
	  }
	  public static void read(final File folder) throws IOException{
	  File directory = folder;      
	  File[] myarray;  
	  myarray=new File[10];
	  myarray=directory.listFiles();
	  delete(new File(FILES_TO_INDEX_DIRECTORY));
	  for (int j = 0; j < myarray.length; j++)
	  {
	         File path=myarray[j];
	         if (path.getPath().endsWith(".java"))
				{
	         FileReader fr = new FileReader(path);
	         BufferedReader br = new BufferedReader(fr);
	         String s = "";
	         
	         while (br.ready()) {
	            s += br.readLine() + "\n";
	            s = cleanString(s);
	            clean();
	            write(s);
	            
	     //       System.out.println(s);
	         }
				}
	  }
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
