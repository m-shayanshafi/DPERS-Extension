package cc.mallet.javaTotext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
	
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
		 PreparedStatement statement2 = this.con.prepareStatement("INSERT INTO `domaintopics`(`patternInstanceID`,`Topics`,`filePath`) VALUES (?,?,?)");
	    	statement2.setInt(1,getPattternInstance(filePath));
	    	statement2.setString(2,topics);
	    	statement2.setString(3,filePath);
	    	int result2=statement2.executeUpdate();
	    	this.con.close();
	 }
	 public int getPattternInstance(String projectName){
		 int ID=0;
	    	try {
	    		PreparedStatement getPatternID=con.prepareStatement("select patternInstanceID from patterninstance where projectName = ?");
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
	 public int getPatternInstanceID(ResultSet result) throws SQLException{
		 int ID=0;
	    	while(result.next()){
	    		ID=result.getInt(1);
	    	}
			return ID;
		}   
}
