package gr.uom.java.pattern.gui.progress;
import gr.uom.java.comments.LuceneForComments;

import gr.uom.java.pattern.PatternInstance;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Vector;

import com.sun.corba.se.spi.ior.Writeable;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PopulateDBWithPatterns {
	protected String patternName;
    protected Vector<PatternInstance> patternInstanceVector;
    private LuceneForComments CommentsExtractObj; 
    public String fileDirectory;
    private int fileID;
    int patternID;
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
    public void fileDirectory(){
    	
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
          	this.CommentsExtractObj.extractComments(this.fileDirectory,this.patternID);
             
        	int result = statement.executeUpdate();
//           System.out.print(result);
//        	
    	}
    }
    
   
    
    public void setPatternID(ResultSet result) throws SQLException{
    	while(result.next()){
    		this.patternID=result.getInt(1);
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
    

