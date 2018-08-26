package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.xml.ws.Response;

import com.bean.Student1;
import com.bean.subject;
import com.util.Courseutil;
import com.util.Studentutil;

public class Subjectdao {

	
	public void insertsubject(subject s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="insert into subject(s_name,sfees,cname) values(?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getS_name());
			pst.setString(2, s.getSfees());
			pst.setString(3,s.getCname());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void addcourse(String sname,String cname )
	{
		subject emp=null;
		try
		{
			String course="";
			Connection conn=Studentutil.createConnection();
			String sql="select cname from subject where s_name=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, sname);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				emp=new subject();
				if(rs.getString("cname")!=null)
				{
				emp.setCname(rs.getString("cname"));
				course = emp.getCname()+","+cname;
				}
				else
				{
					course=cname;
				}
			}
				
				
				sql = "update subject set cname=? where s_name=?";
				pst=conn.prepareStatement(sql);
				pst.setString(2, sname);
				pst.setString(1, course);
				
				pst.executeUpdate();
				
				
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deletesubject(subject s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="delete from subject where id = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getSid());	
			pst.executeUpdate();

			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public subject getSubjectById(int sid)
	{
		subject emp=null;
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="select * from subject where sid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, sid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				emp=new subject();
				emp.setSid(rs.getInt("sid"));
				emp.setS_name(rs.getString("s_name"));
				emp.setSfees(rs.getString("sfees"));
				emp.setCname(rs.getString("cname"));
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}
	
	public List<subject> getAllSubject()
	{
		List<subject> list=new ArrayList<subject>();
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="select * from subject";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				subject c=new subject();
				c.setSid(rs.getInt("sid"));
				c.setS_name(rs.getString("s_name"));
				c.setSfees(rs.getString("sfees"));
				c.setCname(rs.getString("cname"));
				
				list.add(c);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateSubject(subject s)
	{
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="update subject set s_name=?,sfees=?,cname=? where sid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getS_name());
			pst.setString(2, s.getSfees());
			pst.setString(3, s.getCname());
			pst.setInt(4, s.getSid());
		
			pst.executeUpdate();
			System.out.println(" Update Successfully");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
