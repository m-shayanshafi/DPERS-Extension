package cc.mallet.util;

public class Constants {
	//for localhost
	public static String dbConnectionString="jdbc:mysql://localhost:3306/dprs_fact_repository";
	public static String uname="root";
	public static String passwd="";
	
	
	//for online hosted mysql db
	//public static String dbConnectionString = "jdbc:mysql://shamsa.db.11682291.hostedresource.com/shamsa";
	//public static String uname = "shamsa";
	//public static String passwd = "Sham@123";
	
	public static int numberKeywordsThresh = 50;
	public static String SEWordSimPath = System.getProperty("user.dir")+"/SEWordSim-r1.db";
	public static String recommendationsOutputPath = "F:\\SERL Internship\\Data Collection for Analysis\\For MAP\\Sports_crg-scoreboard\\sports_crg-scoreboard_" + Integer.toString(numberKeywordsThresh) +"_original_kwdwise.txt";
	public static double threshold = 0.0; //threshold includes this value and greater ones
	public static int noOfRecommendations = 10;
	
	public static String keyWordstoGet = "RootWord"; // can be one of the three StemmedName, RootWord, Name 
	public static boolean getKeywordsbyTopic = false;	
	public static final String[] javaKeywords = {";","public", "(", ")", "{", "}", "[", "]",  "*", "\\*", "\\", "\n", "\r", "\"", "string", "String", "println", "set", "get", "button", "panel", "main", "java", "list", "empty", "override", "exit", "return", "label", "system", "true", "false", "file", "while", "equals", "equal", "directory", "comment", "indexof", "path", "data", "field", "files", "datasource", "replace", "reset", "filewriter", "filereader", "exception", "sql", "getpath", "endswith", "found", "notfound", "contains", "next", "hit", "package", "exception", "folder", "index", "QueryParser", "zero", "abstract", "default", " if", "private", "this ", "assert", "double", "do", "implements", "protected", "throw ", "Boolean", "import", "throws ", "break", "else", "instanceof", "return", "transient ", "byte", "enum", "int ", "short", "try ", "case", "extends", "interface", "static", "void ", "catch", "final", "long", "strictfp", "volatile", "char", "finally", "native", "while", "float", "new", "switch", "continue", "for", "package", "synchronized", "const", "goto",  "Literals", "null", "Thread", "System", "boolean", "List", "Array", "TODO", "args", "JFrame", "JPanel", "JLabel", "JButton", "Frame", "Panel", "Label", "Text", "Menu", "Override", "println"};
}
