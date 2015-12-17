package gr.uom.java.pattern.gui.progress;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import gr.uom.java.comments.LuceneForComments;
import gr.uom.java.pattern.PatternInstance;
import gr.uom.java.comments.*;

public class PopulateDBWithPatterns {
	protected String patternName;
	protected createIndex index=new createIndex();
    protected Vector<PatternInstance> patternInstanceVector;
    private LuceneForComments CommentsExtractObj; 
    public String fileDirectory;
    private int fileID;
    public int patternID;
    public int patternInstanceID;
    public static Connection con;
    private PrintWriter writer;
    private FileReader reader;
    public PopulateDBWithPatterns() throws ClassNotFoundException, SQLException, FileNotFoundException, UnsupportedEncodingException
    {
    	Class.forName("com.mysql.jdbc.Driver");
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/designpatternrepo","root","");
    }
    public static void closeConnection() throws Throwable{
    	con.close();
    }
    public int getPattternID(String patternName){
    	try {
    		PreparedStatement getPatternID=con.prepareStatement("select patternID from patterns where name = ?");
    		getPatternID.setString(1, patternName);
    		ResultSet result=getPatternID.executeQuery();
    		setPatternID(result);
    		return this.patternID;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
    }
    
    public int getPattternInstanceID(String projectName){
    	try {
    		PreparedStatement getPatternID=con.prepareStatement("select patternInstanceID from patterninstance where projectName = ?");
    		getPatternID.setString(1, projectName);
    		ResultSet result=getPatternID.executeQuery();
    		setPatternInstanceID(result);
    		return this.patternInstanceID;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
    }
    public void populatePatternInstance(PopulateDBWithPatterns DBobj) throws Exception{
    	this.patternInstanceVector = DBobj.patternInstanceVector;
    	this.con=DBobj.con;
    	this.patternInstanceVector=DBobj.patternInstanceVector;
    	getPattternID(patternName);
    	
    	if (!patternInstanceVector.isEmpty()){
    		PreparedStatement statement =con.prepareStatement("INSERT INTO `patterninstance` (`patternID`, `instanceClass`,`projectName`) VALUES (?,?,?);");
    		statement.setInt(1, this.patternID);
        	statement.setString(2, patternInstanceVector.toString());
          	statement.setString(3, this.getFileDir(DBobj.con));
          	getPattternInstanceID(this.fileDirectory);
          	this.CommentsExtractObj.extractComments(this.fileDirectory,this.patternInstanceID);
             
        	int result = statement.executeUpdate();
        	
        	 	index.createindex();
    	}
    }
    
   
    
    public void setPatternID(ResultSet result) throws SQLException{
    	while(result.next()){
    		this.patternID=result.getInt(1);
    	}
	}   
    
    public void setPatternInstanceID(ResultSet result) throws SQLException{
    	while(result.next()){
    		this.patternInstanceID=result.getInt(1);
    	}
	}   
    
    public void setFileDir(String dir) {
    	PreparedStatement statement;
		try {
			statement = con.prepareStatement("INSERT INTO `file_directory` (`ID`, `Directory`) VALUES (NULL, ?);");
			statement.setString(1, dir);
	    	statement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	this.fileDirectory = dir;
    }
    public int getFileID(){
    	return this.fileID;
    }
    public String getFileDir(Connection con) throws IOException, SQLException{
    	PreparedStatement getPatternID=con.prepareStatement("select * from file_directory");
		ResultSet result=getPatternID.executeQuery();
		while(result.next()){
			if(result.last()){
				this.fileDirectory=result.getString(2);
//				System.out.println(this.fileDirectory);
			}
		}
		return this.fileDirectory;
    	}
		
    }
    

