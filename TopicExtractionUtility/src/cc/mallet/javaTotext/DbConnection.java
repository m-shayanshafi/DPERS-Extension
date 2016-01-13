package cc.mallet.javaTotext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
	
public class DbConnection {
	public static DbConnection db;
	public static Connection con;
	private DbConnection(){}
	public static DbConnection getDBcon() throws ClassNotFoundException, SQLException{
		if(db == null){
			db=new DbConnection();
			db.openConnection();
			return db;
		}
		else{return db;
		}
	}
	
	public static void main(String[] args) throws Exception{
	}

	public static void openConnection() throws ClassNotFoundException, SQLException {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo","root","");	
				
	}
	
	 public void insertTopicData(String topics, String filePath) throws SQLException {
		 String[] tokens = breakTopics(topics);
		 List DomainNames =getDomaincolumn(tokens,2);//Get the names of the clusters having the highes weightage
		 List DomainWeightage =getDomaincolumn(tokens,3);//Get the weightage of the names of the clusters having the highes weightage
		 List keywords= getDomainRow(tokens,true);
		 List keywordsWeightage= getDomainRow(tokens,false);
		 
		 int result;
		 int count=0;
		 for(Object name:DomainNames){
		 PreparedStatement statement = this.con.prepareStatement("INSERT INTO `domaintopics`(`projectID`,`filePath`,`topics`,`topicWeightage`) VALUES (?,?,?,?)");
	    	statement.setInt(1,getProjectName(filePath));
	    	statement.setString(2,filePath);
	    	statement.setString(3,name.toString());
	    	statement.setInt(4,Integer.parseInt(DomainWeightage.get(count).toString()));
	    	result=statement.executeUpdate();
	    	insertKeywords(keywords.get(count).toString(), keywordsWeightage.get(count).toString(),getdomainID(name.toString(), filePath));
	    	
		count++;
		 }
		 
	 }
	 public void insertKeywords(String keywords, String KeywordWeightage, int topicId) throws SQLException{
		 String[] words= keywords.split(" ");
		 String[] weights = KeywordWeightage.split(" ");
		 int result;
		 PreparedStatement statement = this.con.prepareStatement("INSERT INTO `domaintokeywords` (`topicID`, `keyword`, `weightage`) VALUES (?,?,?)");
	    	for(int i=1;i<words.length;i++){
		 	statement.setInt(1,topicId);
	    	statement.setString(2,words[i]);
	    	statement.setInt(3,Integer.parseInt(weights[i]));
	    	result=statement.executeUpdate();
	    	}
	 }
	 private List getDomainNameWeightage(List topics) {
		 List domainNameWeightages = new ArrayList();
		 for(Object line:topics){
			 String domainNameWeightage = line.toString().replace("(", " ");
			 domainNameWeightage.replace(")", " ");
			 domainNameWeightages.add(domainNameWeightage.split(" ")[2]);
		 }
		 return domainNameWeightages;
	}
	 
	public String[] breakTopics(String topics){
		 String[] topicList = topics.split(",");
		 return topicList;
	 }
	 public List getDomainRow(String[] topicArray, boolean div){
		 List domainElement = new ArrayList();
		 int count =1;
		 boolean tempPos=div;
		 String element="";
		 int j=2;
		 for(String line:topicArray){
			 String[] clusterKeywords = line.replace("\t"," ").replace("\n"," ").split(" ");
			 if(line.startsWith(" ")){
				 tempPos=!div;
				 j=3;
			 }
			 for(int i=j;i<clusterKeywords.length;i++){
				
				 if((i%2==0)==tempPos){
					 element=element+" "+clusterKeywords[i];
				 }
			 }
			 element=element.replace("(", "").replace(")", "");
			 domainElement.add(element);
			 element="";
			 tempPos=div;
			 count++;
		 }
		 return domainElement;
		}

	 public List getDomaincolumn(String[] topicArray, int position){
		 List domainElement = new ArrayList();
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
	
	 public List getDomainNames(List topics){
		 List domainNames = new ArrayList();
		 for(Object line:topics){
			 String domainName = line.toString().replace("(", " ");
			 domainName.replace(")", " ");
			 domainNames.add(domainName.split(" ")[0]);
		 }
		 return domainNames;
	 }
	 
	 
	 public void closeConn() throws SQLException{
		 this.con.close();
	 }
	 public int getProjectName(String projectName){
		 int ID=0;
	    	try {
	    		PreparedStatement getPatternID=con.prepareStatement("select ID from file_directory where Directory = ?");
	    		getPatternID.setString(1, projectName);
	    		ResultSet result=getPatternID.executeQuery();
	    		ID = getPatternInstanceID(result);
	    		return ID;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
	    }
	 public int getdomainID(String domain, String filePath){
		 int ID=0;
	    	try {
	    		PreparedStatement getDomainID=con.prepareStatement("select topicID from domaintopics where topics = ? and filePath = ?");
	    		getDomainID.setString(1, domain);
	    		getDomainID.setString(2, filePath);
	    		ResultSet result=getDomainID.executeQuery();
	    		ID = getPatternInstanceID(result);
	    		return ID;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}
	    }
	 
	
	 public int getPatternInstanceID(ResultSet result) throws SQLException{
		 int ID=0;
	    	while(result.next()){
	    		ID=result.getInt(1);
	    	}
			return ID;
		}   
}
