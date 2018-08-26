package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Course1;
import com.bean.Student1;
import com.bean.batch;
import com.bean.employee1;
import com.util.Courseutil;
import com.util.employeeutil;

public class BatchDao {

	public void insertBatch(batch b)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into batch(batch_name,start_time,end_time,emp_id,s_name,cname,sdate,status) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, b.getBatch_name());
			pst.setString(2, b.getStart_time());
			pst.setString(3, b.getEnd_time());
			pst.setInt(4, b.getEmp_id());
			pst.setString(5, b.getS_name());
			pst.setString(6, b.getCname());
			pst.setString(7, b.getSdate());
			pst.setString(8, "running");
			
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void insertstudent(batch b,Student1 s)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update student set batchid= ? where stuid= ? " ;
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,b.getBatch_id());
			pst.setInt(2, s.getStuid());
			
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void completebatch(int bid)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update batch set status = ? where batch_id = ? and status = ?" ;
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(2,bid);
			pst.setString(1, "completed");
			pst.setString(3, "running");
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<batch> getAllbatch(employee1 e)
	{
		List list=new ArrayList();
		
		
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="";
			PreparedStatement pst;
			ResultSet rs=null;
			if(e.getEmpdesignation().equalsIgnoreCase("Faculty"))
			{
			 sql="select * from batch where status = ? AND emp_id=?";
			 pst=conn.prepareStatement(sql);
			pst.setString(1, "running");
			pst.setInt(2, e.getEmpid());
			 rs=pst.executeQuery();
			}
			else
			{
				 sql="select * from batch where status = ?";
				 pst=conn.prepareStatement(sql);
					pst.setString(1, "running");
					 rs=pst.executeQuery();
			}


			while(rs.next())
			{
				batch b=new batch();
				b.setBatch_id(rs.getInt("batch_id"));
				b.setBatch_name(rs.getString("batch_name"));
				b.setCname(rs.getString("cname"));
				b.setEmp_id(rs.getInt("emp_id"));
				b.setEnd_time(rs.getString("end_time"));
				b.setS_name(rs.getString("s_name"));
				b.setSdate(rs.getString("sdate"));
				b.setStart_time(rs.getString("start_time"));
				
				list.add(b);
			}
		}
		catch (Exception e1) {
			e1.printStackTrace();
		}
		return list;
	}
	
	

	public String getBatchNameById(int batchid)
	{
		String name = null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from batch where batch_id=? and status = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, batchid);
			pst.setString(2, "running");
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				name=rs.getString("batch_name");
			
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	
	public batch getBatchById(int batchid)
	{
		batch b=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from batch where batch_id=? and status = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, batchid);
			pst.setString(2, "running");
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				b=new batch();
				b.setBatch_id(rs.getInt("batch_id"));
				b.setBatch_name(rs.getString("batch_name"));
				b.setCname(rs.getString("cname"));
				b.setEmp_id(rs.getInt("emp_id"));
				b.setEnd_time(rs.getString("end_time"));
				b.setS_name(rs.getString("s_name"));
				b.setSdate(rs.getString("sdate"));
				b.setStart_time(rs.getString("start_time"));
				
			
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public void updateBatch(batch s)
	{
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="update batch set batch_name=?,start_time=?,end_time=? where batch_id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getBatch_name());
			pst.setString(2, s.getStart_time());
			pst.setString(3, s.getEnd_time());
			pst.setInt(4, s.getBatch_id());
		
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
