package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Student1;
import com.bean.salary;
import com.util.Studentutil;
import com.util.employeeutil;

public class Salarydao {

	public void insertsalary(salary s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();  // Util is same for stock
			String sql="insert into salary(empid,tsalary,month,year,tattend,nsalary,ptype,pdetail,pdate,remarks) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getEmpid());
			pst.setString(2, s.getTsalary());
			pst.setString(3, s.getMonth());
			pst.setString(4, s.getYear());
			pst.setString(5, s.getTattend());
			pst.setString(6, s.getNsalary());
			pst.setString(7, s.getPtype());
			pst.setString(8, s.getPdetail());
			pst.setString(9, s.getPdate());
			pst.setString(10, s.getRemarks());
					
			System.out.println(" Success");
			
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public salary getSalaryById(int sid)
	{
		salary s=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from salary where sid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, sid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				 s=new salary();
				 s.setSid(rs.getInt("sid"));
				 s.setEmpid(rs.getInt("empid"));
				 s.setTsalary(rs.getString("tsalary"));
				 s.setMonth(rs.getString("month"));
				 s.setYear(rs.getString("year"));
				 s.setTattend(rs.getString("tattend"));
				 s.setNsalary(rs.getString("nsalary"));
				 s.setPtype(rs.getString("ptype"));
				 s.setPdetail(rs.getString("pdetail"));
				 s.setPdate(rs.getString("pdate"));
				 s.setRemarks(rs.getString("remarks"));
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public void updateSalary(salary s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update salary set empid=?,tsalary=?,month=?,year=?,tattend=?,nsalary=?,ptype=?,pdetail=?,pdate=?,remarks=? where sid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getEmpid());
			pst.setString(2, s.getTsalary());
			pst.setString(3, s.getMonth());
			pst.setString(4, s.getYear());
			pst.setString(5, s.getTattend());
			pst.setString(6, s.getNsalary());
			pst.setString(7, s.getPtype());
			pst.setString(8, s.getPdetail());
			pst.setString(9, s.getPdate());
			pst.setString(10, s.getRemarks());
			pst.setInt(11, s.getSid());

		
			pst.executeUpdate();
			System.out.println(" Update Successfully");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<salary> getAllSalary()
	{
		List<salary> list=new ArrayList<salary>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from salary";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				salary s=new salary();
				s.setSid(rs.getInt("sid"));
				s.setEmpid(rs.getInt("empid"));
				s.setTsalary(rs.getString("tsalary"));
				s.setMonth(rs.getString("month"));
				s.setYear(rs.getString("year"));
				s.setTattend(rs.getString("tattend"));
				s.setNsalary(rs.getString("nsalary"));
				s.setPtype(rs.getString("ptype"));
				s.setPdetail(rs.getString("pdetail"));
				s.setPdate(rs.getString("pdate"));
				s.setRemarks(rs.getString("remarks"));
						list.add(s);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	
}
 