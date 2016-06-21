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
	
	public static String SEWordSimPath = System.getProperty("user.dir")+"/SEWordSim-r1.db";
	public static String recommendationsOutputPath = "E:\\Recommendations.txt";
	public static final String ConsolidatedCodeFilePath = "Outfile\\Output.txt"; //contains the preprocessed data of all java files of a project
	public static final String topicsFilePath = "Outfile\\out.txt"; //contains the topics detected for a project
	public static final String[] javaKeywords = {";","public", "(", ")", "{", "}", "[", "]",  "*", "\\*", "\\", "\n", "\r", "\"", ",", "string", "String", "println", "set", "get", "button", "panel", "main", "java", "list", "empty", "override", "exit", "return", "label", "system", "true", "false", "file", "while", "equals", "equal", "directory", "comment", "indexof", "path", "data", "field", "files", "datasource", "replace", "reset", "filewriter", "filereader", "exception", "sql", "getpath", "endswith", "found", "notfound", "contains", "next", "hit", "package", "exception", "folder", "index", "QueryParser", "zero", "abstract", "default", " if", "private", "this ", "assert", "double", "do", "implements", "protected", "throw ", "Boolean", "import", "throws ", "break", "else", "instanceof", "return", "transient ", "byte", "enum", "int ", "short", "try ", "case", "extends", "interface", "static", "void ", "catch", "final", "long", "strictfp", "volatile", "char", "finally", "native", "while", "float", "new", "switch", "continue", "for", "package", "synchronized", "const", "goto",  "Literals", "null", "Thread", "System", "boolean", "List", "Array", "TODO", "args", "JFrame", "JPanel", "JLabel", "JButton", "Frame", "Panel", "Label", "Text", "Menu", "Override", "println"};
}
