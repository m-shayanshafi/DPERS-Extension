package org.smu.wordsimilarity;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbConnection {

	public static Connection con;

	void openConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo","root","");	
	}

	void closeConnection() throws Throwable{
    	con.close();
    }
	
	ResultSet getProjectIDOfDomainTopics() throws SQLException
	{
		PreparedStatement statement = this.con.prepareStatement("SELECT distinct projectID FROM domaintopics");
		ResultSet result = null;
		try 
		{
			result = statement.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}

	ResultSet getData() throws SQLException
	{
		//Here we are creating a query
		PreparedStatement statement = this.con.prepareStatement("select distinct word from lookupwords");

		//here we are executing a query 
		ResultSet result = null;
		try {
			result = statement.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	ResultSet getParticularWord(String word) throws SQLException
	{
		//Here we are creating a query
		PreparedStatement statement = this.con.prepareStatement("select distinct word from lookupwords where UPPER(word) = UPPER('"+word+"')");

		//here we are executing a query 
		ResultSet result = null;
		try {
			result = statement.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	ResultSet getDomainTopicsFromDb() throws SQLException
	{
		//Here we are creating a query
		PreparedStatement statement = this.con.prepareStatement("select * from domaintopics");

		//here we are executing a query 
		ResultSet result = null;
		try {
			result = statement.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	ResultSet getDomainToKeywordsFromDb() throws SQLException
	{
		//Here we are creating a query
		PreparedStatement statement = this.con.prepareStatement("select * from domaintokeywords");

		//here we are executing a query 
		ResultSet result = null;
		try {
			result = statement.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	void insertData(String word) throws SQLException
	{
		java.sql.Statement statement = this.con.createStatement();
		statement.executeUpdate("INSERT INTO `lookupwords`(`Word`) VALUES ('"+word+"')");
	}

	ResultSet getDomainTopicsofProjectID(int projectID) throws SQLException
	{
		PreparedStatement statement = this.con.prepareStatement("select * from domaintopics where projectID = " +projectID);
		ResultSet result = null;
		try 
		{
			result = statement.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return result;
	}

	String getProjectName(String projectID) throws SQLException
	{
		PreparedStatement statement = this.con.prepareStatement("SELECT Directory FROM file_directory where ID="+projectID);
		String projectName = null;
		try 
		{
			ResultSet name = statement.executeQuery();
			projectName = getRecord(name);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return projectName;
	}
	
	ResultSet getPatternsOfProject(String projectID) throws SQLException
	{
		PreparedStatement statement = this.con.prepareStatement("SELECT distinct name from patterninstance a join patterns b on a.patternID=b.patternID where a.projectID="+projectID);
		ResultSet patterns = null;
		try 
		{
			patterns = statement.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return patterns;
	}
	
	ResultSet getProjectDetails(String projectID) throws SQLException
	{
		PreparedStatement statement = this.con.prepareStatement("select * from methodnames where patternInstanceID in (SELECT distinct patternInstanceID from patterninstance where projectID="+projectID+")");
		ResultSet patterns = null;
		try 
		{
			patterns = statement.executeQuery();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return patterns;
	}
	
	public String getRecord(ResultSet result) throws SQLException{
		String name = null;
		while(result.next()){
			name = result.getString(1);
		}
		return name;
	}  
}
