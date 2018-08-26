package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.employee_attendence;
import com.bean.student_attendence;

import com.util.employeeutil;

public class emp_attdao {
	public void addattendence(employee_attendence e)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into employee_attendence(empid,date,status) values(?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, e.getEmpid());
			pst.setString(2,e.getDate());
			pst.setString(3, e.getStatus());
			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
	}
	public void removeattendence(int emp_attid)
	{
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="delete  from employee_attendence where emp_attid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, emp_attid);
			
			
			pst.executeUpdate();
			
		}
		catch (Exception ea) {
			ea.printStackTrace();
		}
	}
}
