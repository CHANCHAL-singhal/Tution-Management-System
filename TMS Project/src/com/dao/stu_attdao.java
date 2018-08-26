package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.bean.Student1;
import com.bean.student_attendence;
import com.util.Studentutil;

public class stu_attdao {
	public void addattendence(student_attendence s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update student_attendence set present = ? where stuid= ? and date = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStatus());
			pst.setInt(2, s.getStuid());
			pst.setString(3, s.getDate());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void removeattendence(student_attendence s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update student_attendence set present = ? where stuid= ? and date = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStatus());
			pst.setInt(2, s.getStuid());
			pst.setString(3, s.getDate());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void removebatchattendence(int id,String date)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			Date min;
			//String s ="select CONVERT(date,batch_attendance.date)";
		    min= new SimpleDateFormat("yyyy-MM-dd").parse(date);
			String sql = "delete from batch_attendance where batch_id=? AND date=?" ;
			
			//String sql="update student_attendence set present = ? where stuid= ? and date = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, date);
			//pst.setDate(2, (java.sql.Date) min);
			pst.executeUpdate();
			
			
			sql = " delete from student_attendence where bat_id=? AND date=?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, date);
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
