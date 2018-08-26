package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Stock;
import com.bean.Student1;
import com.bean.batch;
import com.bean.employee1;
import com.bean.exam_master;
import com.util.Courseutil;
import com.util.Studentutil;
import com.util.employeeutil;

public class ExamDao {
	
	public void create_exam(exam_master e) 
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into exam_master(batch_id,date,time,tmarks,pmarks,Exa_name) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, e.getBatch_id());
			pst.setString(2, e.getDate());
			pst.setString(3, e.getTime());
			pst.setInt(4, e.getTmarks());
			pst.setInt(5, e.getPmarks());
			pst.setString(6, e.getExa_name());
			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
	}
	

	public void deleteexam(int exa_id) 
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="delete from exam_master where exa_id = ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, exa_id);
			pst.executeUpdate();
			
			sql="delete from exam_attendance where exa_id = ?";
			 pst=conn.prepareStatement(sql);
			pst.setInt(1, exa_id);
			pst.executeUpdate();
			
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
	}
	
	public int getexamidByname(String examname)
	{  
			int eid = 0;
			try
			{

				Connection conn=employeeutil.createConnection();
				String sql="select * from exam_master where exa_name = ? ";
				PreparedStatement pst=conn.prepareStatement(sql);
				pst.setString(1, examname);
				ResultSet rs = pst.executeQuery();
				if(rs.next())
				{
					eid=rs.getInt("exa_id");
					
				}
				
			
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return eid;
			
		
	}
	
	public exam_master getExamById(int exa_id)
	{
		exam_master s=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from exam_master where exa_id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1,exa_id);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				 s=new exam_master();
				s.setExa_id(rs.getInt("exa_id"));
				s.setExa_name(rs.getString("exa_name"));
				s.setBatch_id(rs.getInt("batch_id"));
				s.setDate(rs.getString("date"));
				s.setTmarks(rs.getInt("tmarks"));
				s.setPmarks(rs.getInt("pmarks"));
				s.setTime(rs.getString("time"));
				
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}


	public void Add_examAttendance(exam_master e, Student1 s1) {
		
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into exam_attendance(exa_id,stuid,present,ob_marks) values(?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, e.getExa_id());
			pst.setInt(2, s1.getStuid());
			pst.setString(3, "absent");
			pst.setInt(4, 0);
			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
		
	}

	
	public void updateExam(exam_master s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update exam_master set batch_id=?,date=?,time=?,tmarks=?,pmarks=?,exa_name=? where exa_id=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getBatch_id());
			pst.setString(2, s.getDate());
			pst.setString(3, s.getTime());
			pst.setInt(4, s.getTmarks());
			pst.setInt(5, s.getPmarks());
			pst.setString(6, s.getExa_name());
			pst.setInt(7, s.getExa_id());
			

		
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public List<exam_master> getAllexam(employee1 e1)
	{
		List<exam_master> list=new ArrayList<exam_master>();
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql;
			PreparedStatement pst;
			ResultSet rs;
			
			if(e1.getEmpdesignation().equalsIgnoreCase("Faculty"))
			{
			 sql = "SELECT * FROM exam_master e,batch b WHERE b.emp_id=? AND e.batch_id=b.batch_id";
			
			pst=conn.prepareStatement(sql);
			pst.setInt(1, e1.getEmpid());
			rs=pst.executeQuery();
			while(rs.next())
			{
				exam_master e=new exam_master();
				e.setBatch_id(rs.getInt("batch_id"));
				
				e.setB_name(rs.getString("batch_name"));
				e.setDate(rs.getString("date"));
				e.setExa_id(rs.getInt("exa_id"));
				e.setExa_name(rs.getString("exa_name"));
				e.setPmarks(rs.getInt("pmarks"));
				e.setTime(rs.getString("time"));
				e.setTmarks(rs.getInt("tmarks"));
				list.add(e);
			}
			}
			else
			{
				sql = "SELECT * FROM exam_master e,batch b WHERE e.batch_id=b.batch_id";
			
			pst=conn.prepareStatement(sql);
		
			rs=pst.executeQuery();
			while(rs.next())
			{
				exam_master e=new exam_master();
				e.setBatch_id(rs.getInt("batch_id"));
				
				e.setB_name(rs.getString("batch_name"));
				e.setDate(rs.getString("date"));
				e.setExa_id(rs.getInt("exa_id"));
				e.setExa_name(rs.getString("exa_name"));
				e.setPmarks(rs.getInt("pmarks"));
				e.setTime(rs.getString("time"));
				e.setTmarks(rs.getInt("tmarks"));
				list.add(e);
			}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<exam_master> StudentExam(int sid)
	{
		List<exam_master> list=new ArrayList<exam_master>();
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql;
			PreparedStatement pst;
			ResultSet rs;
			
			
				sql = "SELECT * FROM exam_attendance e, exam_master e1 WHERE e.stuid=? AND e.exa_id=e1.exa_id";
			
			pst=conn.prepareStatement(sql);
			pst.setInt(1, sid);
			rs=pst.executeQuery();
			while(rs.next())
			{
				exam_master e=new exam_master();
				e.setBatch_id(rs.getInt("batch_id"));
				
				/*e.setB_name(rs.getString("batch_name"));*/
				e.setDate(rs.getString("date"));
				e.setExa_id(rs.getInt("exa_id"));
				e.setExa_name(rs.getString("exa_name"));
				e.setPmarks(rs.getInt("pmarks"));
				e.setTime(rs.getString("time"));
				e.setTmarks(rs.getInt("tmarks"));
				e.setObmarks(rs.getInt("ob_marks"));
				
				list.add(e);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
