package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.bean.employee1;
import com.util.employeeutil;
import java.util.ArrayList;
import java.util.List;
public class employeedao {
	public employee1 checkLogin(employee1 e)
	{
		employee1 emp=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from employee where empusername=? and emppassword=? and empdesignation=? ";
			PreparedStatement pst=conn.prepareStatement(sql);
			
			pst.setString(1, e.getEmpusername());
			pst.setString(2,e.getEmppassword());
			pst.setString(3, e.getEmpdesignation());
			
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				emp=new employee1();
				emp.setEmpid(rs.getInt("empid"));
				emp.setEmppassword(rs.getString("emppassword"));
				emp.setEmpusername(rs.getString("empusername"));
				
				emp.setEmpname(rs.getString("empname"));
				emp.setEmpaddress(rs.getString("empaddress"));
				emp.setEmpmobile(rs.getString("empmobile"));
				emp.setEmpemail(rs.getString("empemail"));
				emp.setEmpqualification(rs.getString("empqualification"));
				emp.setEmpjoindate(rs.getString("empjoindate"));
				emp.setEmpdesignation(rs.getString("empdesignation"));
				emp.setEmpaadhar(rs.getString("empaadhar"));
				emp.setEmpsalary(rs.getString("empsalary"));
				emp.setEmpsubject(rs.getString("empsubject"));
				emp.setEmppic(rs.getString("empimg"));
			}
			else
			{
				emp=null;
			}
		
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
		return emp;
	}
	

	public void insertemployee(employee1 s)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into employee(empusername,emppassword,empname,empaddress,empmobile,empemail,empjoindate,empqualification,empdesignation,empaadhar,empsalary,empsubject,empimg) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getEmpusername());
			pst.setString(2, s.getEmppassword());
			pst.setString(3, s.getEmpname());
			pst.setString(4, s.getEmpaddress());
			pst.setString(5, s.getEmpmobile());
			pst.setString(6, s.getEmpemail());
			pst.setString(7, s.getEmpjoindate());
			pst.setString(8, s.getEmpqualification());
			pst.setString(9, s.getEmpdesignation());
			pst.setString(10, s.getEmpaadhar());
			pst.setString(11, s.getEmpsalary());
			pst.setString(12, s.getEmpsubject());
			pst.setString(13, s.getEmppic());
			System.out.println(" Success");
			
			//pst.setString(2, s.getLname());
			//pst.setString(3, s.getEmail());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
public void deleteemployee(int empid)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="delete from employee where empid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, empid);
			pst.executeUpdate();
			
			System.out.println(" Delete ");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
public employee1 getEmployeeById(int empid)
{
	employee1 emp=null;
	try
	{
		Connection conn=employeeutil.createConnection();
		String sql="select * from employee where empid=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, empid);
		ResultSet rs=pst.executeQuery();
		if(rs.next()){
			emp=new employee1();
			emp.setEmpid(rs.getInt("empid"));
			emp.setEmpusername(rs.getString("empusername"));
			emp.setEmppassword(rs.getString("emppassword"));
			
			emp.setEmpname(rs.getString("empname"));
			emp.setEmpaddress(rs.getString("empaddress"));
			emp.setEmpmobile(rs.getString("empmobile"));
			emp.setEmpemail(rs.getString("empemail"));
			emp.setEmpjoindate(rs.getString("empjoindate"));
			emp.setEmpqualification(rs.getString("empqualification"));
			emp.setEmpdesignation(rs.getString("empdesignation"));
			emp.setEmpaadhar(rs.getString("empaadhar"));
			emp.setEmpsalary(rs.getString("empsalary"));
			emp.setEmpsubject(rs.getString("empsubject"));
			emp.setEmppic(rs.getString("empimg"));
		}
				
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	return emp;
}

	public String getEmployeeNameById(int empid)
	{
		String name = null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from employee where empid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, empid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				name=rs.getString("empname");
			
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return name;
	}
public String getEmployeeEmailIdById(int empid)
	{
		String email = null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from employee where empid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, empid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				email=rs.getString("empemail");
			
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}
	

	public void changepass(employee1 s)
{
	try
	{
		Connection conn=employeeutil.createConnection();
		String sql="update employee set emppassword=? where empid=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, s.getEmppassword());
		pst.setInt(2, s.getEmpid());
	
		pst.executeUpdate();
		System.out.println("Password Update Successfully");	
	}
	catch (Exception e) {
		e.printStackTrace();
	}
}
	public void updateEmployee(employee1 s)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update employee set empusername=?,empname=?,empaddress=?,empmobile=?,empemail=?,empqualification=?,empaadhar=?,empimg=? where empid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getEmpusername());
			
			pst.setString(2, s.getEmpname());
			pst.setString(3, s.getEmpaddress());
			pst.setString(4, s.getEmpmobile());
			pst.setString(5, s.getEmpemail());
			pst.setString(6, s.getEmpqualification());
			pst.setString(7, s.getEmpaadhar());
			pst.setInt(9, s.getEmpid());
			pst.setString(8, s.getEmppic());
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateEmp(employee1 s)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="update employee set empdesignation=?,empsalary=?,empsubject=? where empid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getEmpdesignation());
			
			pst.setString(2, s.getEmpsalary());
			pst.setString(3, s.getEmpsubject());
			pst.setInt(4, s.getEmpid());
			pst.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<employee1> getEmployeeNameByDesignation(String des)
	{
		employee1 emp=null;
		List<employee1> list=new ArrayList<employee1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from employee where empdesignation=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, des);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				emp=new employee1();
				emp.setEmpid(rs.getInt("empid"));
				emp.setEmpusername(rs.getString("empusername"));
				emp.setEmppassword(rs.getString("emppassword"));
				emp.setEmpname(rs.getString("empname"));
				emp.setEmpaddress(rs.getString("empaddress"));
				emp.setEmpmobile(rs.getString("empmobile"));
				emp.setEmpemail(rs.getString("empemail"));
				emp.setEmpqualification(rs.getString("empqualification"));
				emp.setEmpdesignation(rs.getString("empdesignation"));
				emp.setEmpaadhar(rs.getString("empaadhar"));
				emp.setEmpsalary(rs.getString("empsalary"));
				emp.setEmpsubject(rs.getString("empsubject"));
				emp.setEmppic(rs.getString("empimg"));
				list.add(emp);
			}
					
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
		return list;
	}
	

	
	public List<employee1> getAllEmployee()
	{
		List<employee1> list=new ArrayList<employee1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from employee";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				employee1 s=new employee1();
				s.setEmpid(rs.getInt("empid"));
				s.setEmpusername(rs.getString("empusername"));
				s.setEmppassword(rs.getString("emppassword"));
				
				s.setEmpname(rs.getString("empname"));
				s.setEmpaddress(rs.getString("empaddress"));
				s.setEmpmobile(rs.getString("empmobile"));
				s.setEmpemail(rs.getString("empemail"));
				s.setEmpjoindate(rs.getString("empjoindate"));
				s.setEmpqualification(rs.getString("empqualification"));
				s.setEmpdesignation(rs.getString("empdesignation"));
				s.setEmpaadhar(rs.getString("empaadhar"));
				s.setEmpsalary(rs.getString("empsalary"));
				s.setEmpsubject(rs.getString("empsubject"));
				s.setEmppic(rs.getString("empimg"));
				list.add(s);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
