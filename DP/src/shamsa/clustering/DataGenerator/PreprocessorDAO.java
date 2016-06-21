package shamsa.clustering.DataGenerator;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import cc.mallet.util.Constants;

public class PreprocessorDAO {

	private static Connection connection;
	public String fileDirectory;

	private static Stemmer stemmer = new Stemmer();
	InflectionalMorphology morph = new InflectionalMorphology();
	
	PreprocessorDAO() throws ClassNotFoundException, SQLException
	{
		if(connection == null)
		{
			openDatabaseConnection();
		}
	}

	public void openDatabaseConnection() throws ClassNotFoundException, SQLException {		
		
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(Constants.dbConnectionString, Constants.uname, Constants.passwd);
		

	}
	
	public void insertDomainTopics(int projectId, double prob) throws SQLException {
		
		PreparedStatement statement = connection.prepareStatement("INSERT INTO `project_domain_topics` (`ProjectID`, `Contribution`) VALUES (?,?)");
		statement.setInt(1, projectId);
		statement.setDouble(2, prob);
		statement.executeUpdate();

		
	}

	public int getTopicID(int projectId) throws SQLException {
		
		PreparedStatement statement1 = connection.prepareStatement("SELECT `TopicID` FROM `project_domain_topics` WHERE `ProjectID` = ? ");
		statement1.setInt(1, projectId);
		ResultSet result1 = statement1.executeQuery();
		result1.next();
		return result1.getInt("TopicID");
		
	}

	public void insertDomainKeywords(String keywords, String KeywordWeightage, int projectId, String filePath,
			double prob, int topicId) throws SQLException {
		
		String[] words = keywords.split(" ");
		String[] weights = KeywordWeightage.split(" ");
		
		PreparedStatement statement = connection.prepareStatement(
				"INSERT INTO `project_domain_keywords`(`ProjectID`,`Path`,`StemmedName`,`RootWord`,`Name`,`Proportion`) VALUES (?,?,?,?,?,?)");
		int totalNumberOfKeywords = 0;
		
		int maxKeywordID = getMaxKeywordID();
		
		for (int i = 1; i < words.length; i++) {
			String stemmedInputWord = stemmer.stemWord(words[i]);
			String rootWord = morph.rootWord(words[i]);
			statement.setInt(1, projectId);
			statement.setString(2, filePath);
			statement.setString(3, stemmedInputWord);
			statement.setString(4, rootWord);
			statement.setString(5, words[i]);
			statement.setInt(6, Integer.parseInt(weights[i]));
			statement.executeUpdate();
			totalNumberOfKeywords = i;
			//int key = getKeywordId(projectId, words[i]);
			insertKeywordTopicIds(topicId,maxKeywordID + i);
		}
		
		/*int startKeywordID = maxKeywordID - totalNumberOfKeywords + 1;
		for(int keywordID = startKeywordID; keywordID <= maxKeywordID; keywordID++){
			insertKeywordTopicIds(topicId,keywordID);
		}*/		
	}

	private int getMaxKeywordID() throws SQLException {
		
		PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) FROM `project_domain_keywords`");
		ResultSet result = statement.executeQuery();
		result.next();
		return result.getInt(1);
	}

	public static void insertKeywordTopicIds(int topicsId, int keywordID) throws SQLException {
		
		PreparedStatement statement = connection.prepareStatement("INSERT INTO `topic_keywords`(`TopicID`, `KeywordID`) VALUES (?,?)");
		statement.setInt(1, topicsId);
		statement.setInt(2, keywordID);
		statement.executeUpdate();
	}

	public void insertTopicKeywords(int projectID, int topicsId, String keywords) throws SQLException {
		
		String[] words = keywords.split(" ");
		PreparedStatement statement = connection.prepareStatement("INSERT INTO `topic_keywords`(`TopicID`, `KeywordID`) VALUES (?,?)");
		for (int i = 1; i < words.length; i++) {
			statement.setInt(1, topicsId);			
			statement.setInt(2, getKeywordId(projectID, words[i]));
			statement.executeUpdate();
		}
	}

	public static int getKeywordId(int projectId, String keyword) throws SQLException {
		
		PreparedStatement statement1 = connection.prepareStatement("SELECT `KeywordID` FROM `project_domain_keywords` WHERE `ProjectID` = ? AND `Name` = ? ");
		statement1.setInt(1, projectId);
		statement1.setString(2, keyword);
		ResultSet result1 = statement1.executeQuery();
		result1.next();
		return result1.getInt(1);
		
	}

	public int getProjectID(String path) {
		int ID = 0;
		try {
			PreparedStatement getPatternID = connection.prepareStatement("select ProjectID from project where Path = ?");
			getPatternID.setString(1, path);
			ResultSet result = getPatternID.executeQuery();
			while(result.next())
				ID = result.getInt("ProjectID");			
			return ID;
		} catch (SQLException e) {
			e.printStackTrace();		
		}
		return ID;
	}

	public void saveProject(String path, int categoryID, String description) {
		
		PreparedStatement statement;
		try {
			statement = connection.prepareStatement("INSERT INTO `project` (`ProjectID`, `Path`, `Name`, `CategoryID`, `Description` ) VALUES (NULL, ?, ?, ?, ?);");
			String name = extractProjectName(path);
			statement.setString(1, path);
			statement.setString(2, name);
			statement.setInt(3, categoryID);
			statement.setString(4, description);
			statement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.fileDirectory = path;
	}

	public static String extractProjectName(String path) throws SQLException {
		
		String[] segments = path.split("\\\\");
		return segments[segments.length - 1];
		
	}

}
