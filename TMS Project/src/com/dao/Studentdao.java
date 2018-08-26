package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student1;
import com.bean.employee1;
import com.util.Studentutil;
import com.util.employeeutil;

public class Studentdao {
	public void insertstudent(Student1 s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="insert into student(stuname,stuaddress,stuemail,stumobile,stugen,parname,parmobile,paremail,batchid,refname,courseid,totalfees,paidamount,stubook) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStuname());
			pst.setString(2, s.getStuaddress());
			pst.setString(3, s.getStuemail());
			pst.setString(4, s.getStumobile());
			pst.setString(5, s.getStugen());
			pst.setString(6, s.getParname());
			pst.setString(7, s.getParmobile());
			pst.setString(8, s.getParemail());
			pst.setString(9, s.getBatchid());
			pst.setString(10, s.getRefname());
			pst.setString(11, s.getCourseid());
			pst.setString(12, s.getTotalfees());
			pst.setString(13, s.getPaidamount());
			pst.setString(14, s.getStubook());
			
			
			//pst.setString(2, s.getLname());
			//pst.setString(3, s.getEmail());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteStudent(int stuid)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="delete from student where stuid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, stuid);
			pst.executeUpdate();
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Student1 getStudentById(int stuid)
	{
		Student1 s=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from student s, batch b where stuid=? and s.batchid = b.batch_id";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, stuid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				 s=new Student1();
			
				s.setStuid(rs.getInt("stuid"));
				s.setStuname(rs.getString("stuname"));
				s.setStuaddress(rs.getString("stuaddress"));
				s.setStuemail(rs.getString("stuemail"));
				s.setStumobile(rs.getString("stumobile"));
				s.setStugen(rs.getString("stugen"));
				s.setParname(rs.getString("parname"));
				s.setParmobile(rs.getString("parmobile"));
				s.setParemail(rs.getString("paremail"));
				s.setBatchid(rs.getString("batchid"));
				s.setRefname(rs.getString("refname"));
				s.setCourseid(rs.getString("courseid"));
				s.setTotalfees(rs.getString("totalfees"));
				s.setPaidamount(rs.getString("paidamount"));
				s.setStubook(rs.getString("stubook"));
				s.setBatchname(rs.getString("batch_name"));
				s.setCname(rs.getString("cname"));

			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public List<Student1> getallStudentByBatchId(int bid)
	{
		Student1 s=null;
		List<Student1> list=new ArrayList<Student1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from student where batchid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, bid);
			ResultSet rs=pst.executeQuery();
			
			if(rs.next()){
				
				 s=new Student1();
				s.setStuid(rs.getInt("stuid"));
				s.setStuname(rs.getString("stuname"));
				s.setStuaddress(rs.getString("stuaddress"));
				s.setStuemail(rs.getString("stuemail"));
				s.setStumobile(rs.getString("stumobile"));
				s.setStugen(rs.getString("stugen"));
				s.setParname(rs.getString("parname"));
				s.setParmobile(rs.getString("parmobile"));
				s.setParemail(rs.getString("paremail"));
				s.setBatchid(rs.getString("batchid"));
				s.setRefname(rs.getString("refname"));
				s.setCourseid(rs.getString("courseid"));
				s.setTotalfees(rs.getString("totalfees"));
				s.setPaidamount(rs.getString("paidamount"));
				s.setStubook(rs.getString("stubook"));
				list.add(s);
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void updateStudent(Student1 s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update student set stuname=?,stuaddress=?,stuemail=?,stumobile=?,stugen=?,parname=?,parmobile=?,paremail=?,batchid=?,refname=?,courseid=?,totalfees=?,paidamount=?,stubook=? where stuid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStuname());
			pst.setString(2, s.getStuaddress());
			pst.setString(3, s.getStuemail());
			pst.setString(4, s.getStumobile());
			pst.setString(5, s.getStugen());
			pst.setString(6, s.getParname());
			pst.setString(7, s.getParmobile());
			pst.setString(8, s.getParemail());
			pst.setString(9, s.getBatchid());
			pst.setString(10, s.getRefname());
			pst.setString(11, s.getCourseid());
			pst.setString(12, s.getTotalfees());
			pst.setString(13, s.getPaidamount());
			pst.setString(14, s.getStubook());
			pst.setInt(15, s.getStuid());
			

		
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Student1> getAllStudent(employee1 e1)
	{
		List<Student1> list=new ArrayList<Student1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="",sql1="";
			PreparedStatement pst,pst1;
			ResultSet rs,rs1;
			sql="select * from student";
			
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			int eid = e1.getEmpid();
			
			if(e1.getEmpdesignation().equalsIgnoreCase("Faculty"))
			{
				sql1 = "select * from batch where emp_id=" + eid;
				pst1=conn.prepareStatement(sql1);
				rs1=pst1.executeQuery();
				int bid1[] = new int[1000];
				int i=0,j;
				while(rs1.next())
				{
					bid1[i] = Integer.parseInt(rs1.getString("batch_id"));
					//System.out.println(bid1[i]);
					i++;
					
				}
				while(rs.next())
				{
					String bid2 = rs.getString("batchid");
					int bid=0;
					int flag=0;
					if(bid2.equalsIgnoreCase("-"))
					{
						
					}
					else
					{
					bid = Integer.parseInt(bid2);
					
					for(j=0;j<i;j++)
					{
						if(bid1[j]==bid)
						{
							//System.out.println(bid1[j]);
							flag=1;
						}
						
					}
					}
					
					if(flag==1)
					{
					
						Student1 s=new Student1();
						s.setStuid(rs.getInt("stuid"));
						s.setStuname(rs.getString("stuname"));
						s.setStuaddress(rs.getString("stuaddress"));
						s.setStuemail(rs.getString("stuemail"));
						s.setStumobile(rs.getString("stumobile"));
						s.setStugen(rs.getString("stugen"));
						s.setParname(rs.getString("parname"));
						s.setParmobile(rs.getString("parmobile"));
						s.setParemail(rs.getString("paremail"));
						s.setBatchid(rs.getString("batchid"));
						s.setRefname(rs.getString("refname"));
						s.setCourseid(rs.getString("courseid"));
						s.setTotalfees(rs.getString("totalfees"));
						s.setPaidamount(rs.getString("paidamount"));
						s.setStubook(rs.getString("stubook"));
						list.add(s);
					}
				}
			
			}
			
			else
				{
					while(rs.next())
					{
						
							Student1 s=new Student1();
							s.setStuid(rs.getInt("stuid"));
							s.setStuname(rs.getString("stuname"));
							s.setStuaddress(rs.getString("stuaddress"));
							s.setStuemail(rs.getString("stuemail"));
							s.setStumobile(rs.getString("stumobile"));
							s.setStugen(rs.getString("stugen"));
							s.setParname(rs.getString("parname"));
							s.setParmobile(rs.getString("parmobile"));
							s.setParemail(rs.getString("paremail"));
							s.setBatchid(rs.getString("batchid"));
							s.setRefname(rs.getString("refname"));
							s.setCourseid(rs.getString("courseid"));
							s.setTotalfees(rs.getString("totalfees"));
							s.setPaidamount(rs.getString("paidamount"));
							s.setStubook(rs.getString("stubook"));
							list.add(s);
					}	
				
				}
			
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	public List<Student1> getAllStudentbybatchid(int batchid)
	{
		List<Student1> list=new ArrayList<Student1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from student where batchid =  ?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, batchid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Student1 s=new Student1();
				s.setStuid(rs.getInt("stuid"));
				s.setStuname(rs.getString("stuname"));
				s.setStuaddress(rs.getString("stuaddress"));
				s.setStuemail(rs.getString("stuemail"));
				s.setStumobile(rs.getString("stumobile"));
				s.setStugen(rs.getString("stugen"));
				s.setParname(rs.getString("parname"));
				s.setParmobile(rs.getString("parmobile"));
				s.setParemail(rs.getString("paremail"));
				s.setBatchid(rs.getString("batchid"));
				s.setRefname(rs.getString("refname"));
				s.setCourseid(rs.getString("courseid"));
				s.setTotalfees(rs.getString("totalfees"));
				s.setPaidamount(rs.getString("paidamount"));
				s.setStubook(rs.getString("stubook"));
				list.add(s);
				
			
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
