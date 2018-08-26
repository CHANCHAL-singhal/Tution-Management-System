package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Stock;
import com.bean.Student1;
import com.util.Studentutil;
import com.util.employeeutil;



public class Stockdao {

	public void insertstock(Stock s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();  // Util is same for stock
			String sql="insert into stock(stname,stquantity,sttype,stsubject,stcourse,stremarks) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStname());
			pst.setString(2, s.getStquantity());
			pst.setString(3, s.getSttype());
			pst.setString(4, s.getStsubject());
			pst.setString(5, s.getStcourse());
			pst.setString(6, s.getStremarks());
					
			System.out.println(" Success");
			
			pst.executeUpdate();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Stock getStockById(int stid)
	{
		Stock s=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from stock where stid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, stid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				 s=new Stock();
				s.setStid(rs.getInt("stid"));
				s.setStname(rs.getString("stname"));
				s.setStquantity(rs.getString("stquantity"));
				s.setSttype(rs.getString("sttype"));
				s.setStsubject(rs.getString("stsubject"));
				s.setStcourse(rs.getString("stcourse"));
				s.setStremarks(rs.getString("stremarks"));
				
				
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	public void deleteStock(int stid)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="delete from stock where stid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, stid);
			pst.executeUpdate();
			
			System.out.println(" Delete ");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Stock> getAllStock()
	{
		List<Stock> list=new ArrayList<Stock>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from stock";
			PreparedStatement pst=conn.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Stock s=new Stock();
				s.setStid(rs.getInt("stid"));
				s.setStname(rs.getString("stname"));
				s.setStquantity(rs.getString("stquantity"));
				s.setSttype(rs.getString("sttype"));
				s.setStsubject(rs.getString("stsubject"));
				s.setStcourse(rs.getString("stcourse"));
				s.setStremarks(rs.getString("stremarks"));
				list.add(s);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void updateStock(Stock s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update stock set stname=?,stquantity=?,sttype=?,stsubject=?,stcourse=?,stremarks=? where stid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, s.getStname());
			pst.setString(2, s.getStquantity());
			pst.setString(3, s.getSttype());
			pst.setString(4, s.getStsubject());
			pst.setString(5, s.getStcourse());
			pst.setString(6, s.getStremarks());
			pst.setInt(7, s.getStid());
			

		
			pst.executeUpdate();
			System.out.println(" Update Successfully");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	


}
