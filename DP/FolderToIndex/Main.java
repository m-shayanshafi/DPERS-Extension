package testDb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Main {
public static void main(String[] args) throws Exception{
	//Accesing driver from the jar file
	Class.forName("com.mysql.jdbc.Driver");
	//Creating a variable for the connection
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/derp","root","");
	//jdbc:mysql://localhost:3306/derp->is a database
	//root is the username
	//"" is password
	
	//Here we are creating a query
	PreparedStatement statement =con.prepareStatement("select * from names");
	
	//here we are executing a query 
	ResultSet result = statement.executeQuery();
	
	while(result.next()){
		System.out.println(result.getString(1)+" "+result.getString(2));
	}
}
}
