/*
* (C) Copyright 2018 
*
* Version 1.0
*
* Date: 2018-08-06
*
* Modification Logs:
* DATE		   AUTHOR		DESCRIPTION
*--------------------------------------
* 2018-08-06	Naa		Create
*/
package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
	
	Connection sqlConnect = null;
	
	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			sqlConnect = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=QuanLyHocBa;integratedSecurity=true");
			if(sqlConnect == null) {
				throw new NullPointerException("Cannot connected to database...");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sqlConnect;
	}
	
	public void closeConnection() {
		try {
			sqlConnect.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}