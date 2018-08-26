package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.ForgotPassword;
import com.util.Studentutil;

public class ForgotPassDao {
	
	
	public ForgotPassword fetchEmailData(String email)
	{
		ForgotPassword f=null;
		try {
			 f=new ForgotPassword();

			Connection conn=Studentutil.createConnection();
			String sql="select * from employee where empemail=? ";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs=stmt.executeQuery();
			System.out.println(email);
			if(rs.next())
			{
				f.setName(rs.getString("empname"));
				f.setEmail(rs.getString("empemail"));
			}
			else
			{
				f=null;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public void UpdatePassword(String email,String pass)
	{
		try {

			Connection conn=Studentutil.createConnection();
			String sql="update employee set emppassword=? where empemail = ?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, pass);
			stmt.setString(2, email);
			stmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
