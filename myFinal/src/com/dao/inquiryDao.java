package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.inquiry;
import com.bean.subject;
import com.util.Courseutil;
import com.util.Studentutil;

public class inquiryDao {

	public void insertinquiry(inquiry i)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="insert into inquiry(isname,isemail,isref,ismobile,date,interest,icourse,iremarks) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, i.getIsname());
			pst.setString(2,i.getIsemail());
			pst.setString(3,i.getIsref());
			pst.setString(4,i.getIsmobile());
			pst.setString(5,i.getDate());
			pst.setString(6,i.getInterest());
			pst.setString(7,i.getIcourse());
			pst.setString(8,i.getIremarks());
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<inquiry> getAllInquiry()
	{
		List<inquiry> list=new ArrayList<inquiry>();
		try
		{
			Connection conn=Courseutil.createConnection();
			String sql="select * from inquiry JOIN course on inquiry.icourse = course.cid";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{	
				inquiry i = new inquiry();
				i.setId(rs.getInt("id"));
				i.setIsname(rs.getString("isname"));
				i.setIsemail(rs.getString("isemail"));
				i.setIsmobile(rs.getString("ismobile"));
				i.setDate(rs.getString("date"));
				i.setInterest(rs.getString("interest"));
				i.setIcourse(rs.getString("icourse"));
				i.setIsref(rs.getString("isref"));
				i.setIremarks(rs.getString("iremarks"));
				i.setCname(rs.getString("cname"));
				list.add(i);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
