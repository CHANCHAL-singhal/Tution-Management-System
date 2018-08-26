package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class employeeutil {
	public static Connection createConnection()
	{
		Connection conn=null;
		try
		{
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("com.mysql.jdbc.Driver");
			
			//conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/tms","root","");	
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tms", "root", "root");
		}
		catch (Exception e) {
			e.printStackTrace();
		}		
		return conn;
	}

}
