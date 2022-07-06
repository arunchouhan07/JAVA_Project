package com.pharmacystore.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	public static Connection getDatabaseConnection()
	{
		Connection con = null;
		
		try {
			
			Class.forName(DbDetails.DBDRIVER);
			
			con = DriverManager.getConnection(
					DbDetails.CONSTR,
					DbDetails.USERNAME,
					DbDetails.PASSWORD);
			
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			return null;
		}
	
		return con;
	}
}
