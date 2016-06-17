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
	public static String recommendationsOutputPath = "F:\\SERL Internship\\Data Collection for Analysis\\For MAP\\RPG_RPG-master\\RPG_RPG-master_20_original_kwdwise.txt";
	public static double threshold = 0.0; //threshold includes this value and greater ones
	public static int noOfRecommendations = 10;
	public static int numberKeywordsThresh = 70;
	public static String keyWordstoGet = "RootWord"; // can be one of the three StemmedName, RootWord, Name 
	public static boolean getKeywordsbyTopic = false;	

}
