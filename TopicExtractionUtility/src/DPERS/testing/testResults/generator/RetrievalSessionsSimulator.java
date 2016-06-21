package DPERS.testing.testResults.generator;

import java.io.File;

import cc.mallet.javaTotext.javaTotext;
import cc.mallet.util.Constants;

public class RetrievalSessionsSimulator {	
	
	private static String projectPath;
		
	public static void run(File directoryName) throws Throwable{
		
		File rootDirectory = new File(directoryName.getPath());
		File[] projectsList = rootDirectory.listFiles();
		
		// file opening and var declaration code 
		int projectID = 1;
		for (File file : projectsList) {
			
			if (file.isDirectory()) {				
				
				projectPath = file.getPath();
				
				for (int i=10; i<=50; i+=10) {
					
					Constants.numberKeywordsThresh = i;
					
					Constants.getKeywordsbyTopic = true;
					Constants.keyWordstoGet = Constants.stemmedName;
					Constants.recommendationsOutputPath =  "F://Recommendations//" + Integer.toString(projectID)+"_"+Integer.toString(i)+"_"+Constants.keyWordstoGet+"_"+Boolean.toString(Constants.getKeywordsbyTopic)+".txt";					
					javaTotext.run(file);
					
					Constants.getKeywordsbyTopic = false;
					Constants.keyWordstoGet = Constants.stemmedName;
					Constants.recommendationsOutputPath =  "F://Recommendations//" + Integer.toString(projectID)+"_"+Integer.toString(i)+"_"+Constants.keyWordstoGet+"_"+Boolean.toString(Constants.getKeywordsbyTopic)+".txt";					
					javaTotext.run(file);
					
					Constants.getKeywordsbyTopic = true;
					Constants.keyWordstoGet = Constants.originalName;
					Constants.recommendationsOutputPath =  "F://Recommendations//" + Integer.toString(projectID)+"_"+Integer.toString(i)+"_"+Constants.keyWordstoGet+"_"+Boolean.toString(Constants.getKeywordsbyTopic)+".txt";					
					javaTotext.run(file);
					
					Constants.getKeywordsbyTopic = false;
					Constants.keyWordstoGet = Constants.originalName;
					Constants.recommendationsOutputPath =  "F://Recommendations//" + Integer.toString(projectID)+"_"+Integer.toString(i)+"_"+Constants.keyWordstoGet+"_"+Boolean.toString(Constants.getKeywordsbyTopic)+".txt";					
					javaTotext.run(file);					
				}
				
				
				
				
			}
			projectID += 1;
		}

	}
}
