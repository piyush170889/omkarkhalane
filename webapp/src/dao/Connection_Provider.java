package dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class Connection_Provider implements DB_Config{
	
	private Connection con = null;
	
	public Connection getConnection() {
		try{
			if(con == null){
				Class.forName(DB_DRIVER);
				con = DriverManager.getConnection(CONNECTION_URL,DB_USERNAME,DB_PASSWORD);
				con.setAutoCommit(false);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}
