package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.Course1;
import com.bean.employee1;
import com.util.Courseutil;
import com.util.employeeutil;

import java.util.ArrayList;
import java.util.List;

public class Coursedao {

	public void insertcourse(Course1 s)
	{
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="insert into course(cname,cfees,cduration,csubjects,cremarks) values(?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getCname());
			pst.setString(2, s.getCfees());
			pst.setString(3, s.getCduration());
			pst.setString(4, s.getCsubjects());
			pst.setString(5, s.getCremarks());
			
			System.out.println(" Success");
			
			
			
			//pst.setString(2, s.getLname());
			//pst.setString(3, s.getEmail());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deletecourse(int cid)
	{
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="delete from course where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
			
			System.out.println(" Delete ");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Course1 getCourseById(int cid)
	{
		Course1 emp=null;
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="select * from course where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, cid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				emp=new Course1();
				emp.setCid(rs.getInt("cid"));
				emp.setCname(rs.getString("cname"));
				emp.setCfees(rs.getString("cfees"));
				emp.setCduration(rs.getString("cduration"));
				emp.setCsubjects(rs.getString("csubjects"));
				emp.setCremarks(rs.getString("cremarks"));
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}
	
	public List<Course1> getAllCourse()
	{
		List<Course1> list=new ArrayList<Course1>();
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="select * from course";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Course1 c=new Course1();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				c.setCfees(rs.getString("cfees"));
				c.setCduration(rs.getString("cduration"));
				c.setCsubjects(rs.getString("csubjects"));
				c.setCremarks(rs.getString("cremarks"));
				
				list.add(c);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateCourse(Course1 s)
	{
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="update course set cname=?,cfees=?,cduration=?,csubjects=?,cremarks=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getCname());
			pst.setString(2, s.getCfees());
			pst.setString(3, s.getCduration());
			pst.setString(4, s.getCsubjects());
			pst.setString(5, s.getCremarks());
			pst.setInt(6, s.getCid());
		
			pst.executeUpdate();
			System.out.println(" Update Successfully");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
}
