package gr.uom.java.comments;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
	
public class DbConnection {
	
	public static Connection con;
	
	public static void main(String[] args) throws Exception{
	}

	void openConnection() throws ClassNotFoundException, SQLException {
				Class.forName("com.mysql.jdbc.Driver");
				this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo","root","");	
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
	
	void insertData(String word) throws SQLException
	{
		java.sql.Statement statement = this.con.createStatement();
		statement.executeUpdate("INSERT INTO `lookupwords`(`Word`) VALUES ('"+word+"')");
		
	}
	 public int getCommentWordID(String word,int patternID, String className) throws SQLException{
	    	int ID=0;
	    	PreparedStatement getWordID=this.con.prepareStatement("SELECT `WordId`, `Word` FROM `lookupwords` WHERE `Word` = ?");
			getWordID.setString(1, word);
			ResultSet result=getWordID.executeQuery();
			while(result.next()){
			ID = result.getInt(1);
			}
	    	PreparedStatement statement2 = this.con.prepareStatement("INSERT INTO `commentstopattern`(`patternInstanceID`,`WordID`,`Word`,`className`) VALUES (?,?,?,?)");
	    	statement2.setInt(1,patternID);
	    	statement2.setInt(2,ID);
	    	statement2.setString(3,word);
	    	statement2.setString(4,className);
	    	int result2=statement2.executeUpdate();
	    	
	    	return ID;
	    }
	
	
}
