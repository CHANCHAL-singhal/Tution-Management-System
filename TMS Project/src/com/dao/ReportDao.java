package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bean.Fees1;
import com.bean.exam_attendance;
import com.bean.reportbean;
import com.util.employeeutil;

public class ReportDao {
     
	public static Map<String, Integer> getPaidCount(){
		Map<String, Integer> map=new HashMap();
		
			Connection conn=employeeutil.createConnection();
			String sql="SELECT * FROM (SELECT COUNT(*) AS 'NotDONE' FROM student WHERE `paidamount`!='DONE') AS t1,(SELECT COUNT(*) AS 'DONE' FROM student WHERE `paidamount`='DONE') AS t2";
			PreparedStatement pst;
			
			try {
				pst = conn.prepareStatement(sql);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
					map.put("Done", rs.getInt("DONE"));
					map.put("NotDone", rs.getInt("NotDONE"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}               
		
			
		return map;
	}
	public static List<reportbean> getsalaryperemp(int eid , int year){
		 List<reportbean> list=new ArrayList<reportbean>();
		 try {

				Connection conn=employeeutil.createConnection();
				String sql="SELECT MONTH(STR_TO_DATE(`pdate`,'%Y-%m-%d')) AS mon,YEAR(STR_TO_DATE(`pdate`,'%Y-%m-%d')) AS ye,`nsalary` FROM `salary` WHERE YEAR(STR_TO_DATE(`pdate`,'%Y-%m-%d')) = ? AND `empid` = ?;";
				PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, year);
			pst.setInt(2, eid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				reportbean a= new reportbean();
				int m=rs.getInt("mon");
				switch (m) {
				case 1:
					a.setMonth("January");
					break;
				case 2:
					a.setMonth("February");
					break;
				case 3:
					a.setMonth("March");
					break;
				case 4:
					a.setMonth("April");
					break;
				case 5:
					a.setMonth("May");
					break;
				case 6:
					a.setMonth("June");
					break;
				case 7:
					a.setMonth("July");
					break;
				case 8:
					a.setMonth("August");
					break;
				case 9:
					a.setMonth("September");
					break;
				case 10:
					a.setMonth("Octomber");
					break;
				case 11:
					a.setMonth("November");
					break;
				case 12:
					a.setMonth("December");
					break;
			
				}
				a.setYear(rs.getInt("ye"));
				a.setNsalary(rs.getInt("nsalary"));
				list.add(a);
			}
				
				
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return list;
	 }
	public static List<reportbean> getinquirydata(int year){
		 List<reportbean> list=new ArrayList<reportbean>();
		 try {

				Connection conn=employeeutil.createConnection();
				String sql="SELECT COUNT(*) AS cou, MONTH(STR_TO_DATE(`date`,'%Y-%m-%d')) AS mon FROM `inquiry` WHERE YEAR(STR_TO_DATE(`date`,'%Y-%m-%d')) = ? GROUP BY mon;";
				PreparedStatement pst=conn.prepareStatement(sql);
				pst.setInt(1, year);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				reportbean a= new reportbean();
				int m=rs.getInt("mon");
				switch (m) {
				case 1:
					a.setMonth("January");
					break;
				case 2:
					a.setMonth("February");
					break;
				case 3:
					a.setMonth("March");
					break;
				case 4:
					a.setMonth("April");
					break;
				case 5:
					a.setMonth("May");
					break;
				case 6:
					a.setMonth("June");
					break;
				case 7:
					a.setMonth("July");
					break;
				case 8:
					a.setMonth("August");
					break;
				case 9:
					a.setMonth("September");
					break;
				case 10:
					a.setMonth("Octomber");
					break;
				case 11:
					a.setMonth("November");
					break;
				case 12:
					a.setMonth("December");
					break;
			
				}
				a.setCount(rs.getInt("cou"));
				list.add(a);
			}
				
				
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return list;
	 }

	
 public static List<exam_attendance> getexamdata(int eid){
	 List<exam_attendance> list=new ArrayList<exam_attendance>();
	 try {

			Connection conn=employeeutil.createConnection();
			String sql="SELECT * FROM `exam_attendance` WHERE `exa_id`=?";
			PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, eid);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			exam_attendance e=new exam_attendance();
			e.setExa_attid(rs.getInt("ex_attid"));
			e.setExa_id(rs.getInt("exa_id"));
			e.setOb_marks(rs.getInt("ob_marks"));
			e.setPresent(rs.getString("present"));
			e.setStuid(rs.getInt("stuid"));
			list.add(e);
		}
			
			
		 
	} catch (Exception e) {
		e.printStackTrace();
	}
	 return list;
 }
	
	public static List<reportbean> getstuattendance(int sid){
		
		List<reportbean> list=new  ArrayList<reportbean>();
			Connection conn=employeeutil.createConnection();
			String sql="SELECT YEAR(STR_TO_DATE(`date`,'%Y-%m-%d')) AS ye,MONTH(STR_TO_DATE(`date`,'%Y-%m-%d')) AS mon,DAY(STR_TO_DATE(`date`,'%Y-%m-%d')) AS da,`present` FROM `student_attendence` WHERE stuid=?";
			PreparedStatement pst;
			String a;
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, sid);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					reportbean r=new reportbean();
				    a=rs.getString("present");
				    if(a.equalsIgnoreCase("present"))
				    {
				    	r.setPresent(3);
				    }
				    else
				    {
				    	r.setPresent(1);
				    }
				    
					r.setYear(rs.getInt("ye"));
					r.setMon(rs.getInt("mon"));
					r.setDay(rs.getInt("da"));
					list.add(r);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		return list;
	}
	

	public static Map<String, Integer> getstuattendancecount(int sid){
		Map<String, Integer> map=new HashMap();
		
			Connection conn=employeeutil.createConnection();
			String sql="SELECT * FROM (SELECT COUNT(*) AS present FROM `student_attendence` WHERE stuid=? AND present = \"present\" ) AS t1 ,(SELECT COUNT(*) AS absent FROM `student_attendence` WHERE stuid=? AND present = \"absent\" ) AS t2";
			PreparedStatement pst;
			
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, sid);
				pst.setInt(2, sid);
				ResultSet rs=pst.executeQuery();
				if(rs.next()){
					map.put("present", rs.getInt("present"));
					map.put("absent", rs.getInt("absent"));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
		return map;
	}
	
	public static List<reportbean> getstudentprogress(int stuid){
		List<reportbean> list=new ArrayList<>();
			Connection conn=employeeutil.createConnection();
			String sql="SELECT * FROM (SELECT e.exa_name AS ename,e1.ob_marks  AS ob_marks FROM exam_master e , exam_attendance e1 WHERE e.exa_id = e1.exa_id  AND e1.stuid=?) AS t1";
			PreparedStatement pst;
			reportbean a = null;
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, stuid);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					a=new  reportbean();
				a.setExam(rs.getString("ename"));
				a.setMarks(rs.getInt("ob_marks"));
				list.add(a);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return list;
	}
	
	public static List<reportbean> getstudentAdmission(int year){
		List<reportbean> list=new ArrayList<>();
			Connection conn=employeeutil.createConnection();
			String sql="SELECT YEAR(admissiondate)AS ye,MONTH(admissiondate) AS mon,COUNT(*) AS MonthCount FROM `temp_admission` GROUP BY ye,mon HAVING ye = ?";
			PreparedStatement pst;
			reportbean a = null;
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, year);
				ResultSet rs=pst.executeQuery();
				while(rs.next()){
					a=new  reportbean();
					a.setAdmission(rs.getInt("MonthCount"));
					int m=rs.getInt("mon");
					switch (m) {
					case 1:
						a.setMonth("January");
						break;
					case 2:
						a.setMonth("February");
						break;
					case 3:
						a.setMonth("March");
						break;
					case 4:
						a.setMonth("April");
						break;
					case 5:
						a.setMonth("May");
						break;
					case 6:
						a.setMonth("June");
						break;
					case 7:
						a.setMonth("July");
						break;
					case 8:
						a.setMonth("August");
						break;
					case 9:
						a.setMonth("September");
						break;
					case 10:
						a.setMonth("Octomber");
						break;
					case 11:
						a.setMonth("November");
						break;
					case 12:
						a.setMonth("December");
						break;
				
					}
					
					list.add(a);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		return list;
	}
	
}
