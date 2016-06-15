package org.smu.wordsimilarity;



import java.io.File;
import java.util.Iterator;
import java.util.List;
import cc.mallet.javaTotext.javaTotext;



public class DesignPatternPathExtractor {
	
//	public static void main(String [ ] args) {
//		File directory = new File("C:\\Users\\shan\\Downloads\\Compressed\\Testing Projects\\Action\\101games-master");
//		DesignPatternPathExtractor extractor = new DesignPatternPathExtractor(directory);
//		System.out.println(extractor.findPath("ITabell2D"));		
//	}
	
	
	public static String findPath(String fileName, String directory) {
		String path = "";
		fileName = fileName + ".java";
		File tempFile;
		String tempFileName = "";
		List<File> thisProjDirectory= javaTotext.listf(directory);
		Iterator<File> javaFileIter = thisProjDirectory.iterator();
		while (javaFileIter.hasNext()) {
			tempFile = javaFileIter.next();
			tempFileName = tempFile.getName();
			if (fileName.equals(tempFileName)) {
				path = tempFile.getAbsolutePath();
				break;
			}
		}
		return path;
	}
		
	
	
}
