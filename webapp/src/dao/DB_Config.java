package dao;

public interface DB_Config {
	String DB_DRIVER = "com.mysql.jdbc.Driver";
	String DB_NAME = "omk_db"; 
	String CONNECTION_URL = "jdbc:mysql://localhost:3306/"+DB_NAME;
	String DB_USERNAME = "root";
	String DB_PASSWORD = "P@ssw0rd";
	
}
