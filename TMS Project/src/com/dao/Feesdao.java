package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Course1;
import com.bean.Fees1;
import com.bean.Receiptbean;
import com.bean.Student1;
import com.util.Studentutil;
import com.util.employeeutil;

public class Feesdao {

	public Receiptbean insertfees(Fees1 s)
	{
		Receiptbean r=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="insert into fees(sid,totalfees,paid,remaining,ptype,pdetail,installment,amount,date,remarks) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getSid());
			pst.setString(2, s.getTotalfees());
			pst.setString(3, s.getPaid());
			pst.setString(4, s.getRemaining());
			pst.setString(5, s.getPtype());
			pst.setString(6, s.getPdetail());
			pst.setString(7, s.getInstallment());
			pst.setString(8, s.getAmount());
			pst.setString(9, s.getDate());
			pst.setString(10, s.getRemarks());
		
			String s1=s.getPaid();
			String s2=s.getAmount();
			String t=s.getRemaining();
			String sql1;
			PreparedStatement pst1;
			if(t.equals(s2))
			{
				 sql1="update student set paidamount= ? where stuid= ?";
				 pst1=conn.prepareStatement(sql1);
				System.out.println("done");
				pst1.setString(1, "DONE");
				pst1.setInt(2, s.getSid());	
			}
			else
			{
			int s3= Integer.parseInt(s1) + Integer.parseInt(s2);
			String s4 =String.valueOf(s3);
			sql1="update student set paidamount= ? where stuid= ?";
			 pst1=conn.prepareStatement(sql1);
			pst1.setString(1, s4);
			pst1.setInt(2, s.getSid());
			}
			
			pst.executeUpdate();
			pst1.executeUpdate();
			
			Studentdao sdao=new Studentdao();
			Student1 st=sdao.getStudentById(s.getSid());
			
			r=new Receiptbean();
			
			r.setAmmount(Integer.parseInt(s.getAmount()));
			r.setCourse(st.getCname());
			r.setDate(s.getDate());
			r.setName(st.getStuname());
			r.setPaymentid(0);
			r.setMail(st.getStuemail());
			if(s.getPtype().equalsIgnoreCase("cheque"))
			{
				r.setPaymenttype("Cheque "+s.getPdetail() );
			}
			else
			{
				r.setPaymenttype("Cash");
				
			}
			
			 sql="select * from fees where sid=? and date = ? ";
			 
			 pst=conn.prepareStatement(sql);
			 pst.setInt(1, s.getSid());
			 pst.setString(2, s.getDate());
			 
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				r.setInstallmentno(rs.getString("installment"));
				r.setPaymentid(rs.getInt("fid"));
			}
		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}
	
	public Fees1 getFeesById(int fid)
	{
		Fees1 s=null;
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from fees where fid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, fid);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				
				 s=new Fees1();
				 s.setFid(rs.getInt("fid"));
				 s.setSid(rs.getInt("sid"));
				 s.setTotalfees(rs.getString("totalfees"));
				 s.setPaid(rs.getString("paid"));
				 s.setRemaining(rs.getString("remaining"));
				 s.setPtype(rs.getString("ptype"));
				 s.setPdetail(rs.getString("pdetail"));
				 s.setInstallment(rs.getString("installment"));
				 s.setAmount(rs.getString("amount"));
				 s.setDate(rs.getString("date"));
				 s.setRemarks(rs.getString("remarks"));
			}
					
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
	
	public void updateFees(Fees1 s)
	{
		try
		{
			Connection conn=Studentutil.createConnection();
			String sql="update fees set sid=?,totalfees=?,paid=?,remaining=?,ptype=?,pdetail=?,installment=?,amount=?,date=?,remarks=? where fid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, s.getSid());
			pst.setString(2, s.getTotalfees());
			pst.setString(3, s.getPaid());
			pst.setString(4, s.getRemaining());
			pst.setString(5, s.getPtype());
			pst.setString(6, s.getPdetail());
			pst.setString(7, s.getInstallment());
			pst.setString(8, s.getAmount());
			pst.setString(9, s.getDate());
			pst.setString(10, s.getRemarks());
			pst.setInt(11, s.getFid());
			System.out.print(s.getFid());
			
			String s1=s.getPaid();
			String s2=s.getAmount();
			String t=s.getRemaining();
			String sql1;
			PreparedStatement pst1;
			if(t.equals(s2))
			{
				 sql1="update student set paidamount= ? where stuid= ?";
				 pst1=conn.prepareStatement(sql1);
				System.out.println("done");
				pst1.setString(1, "DONE");
				pst1.setInt(2, s.getSid());	
			}
			else
			{
			int s3= Integer.parseInt(s1) + Integer.parseInt(s2);
			String s4 =String.valueOf(s3);
			sql1="update student set paidamount= ? where stuid= ?";
			 pst1=conn.prepareStatement(sql1);
			System.out.println(s4);
			pst1.setString(1, s4);
			pst1.setInt(2, s.getSid());
			}
			
			System.out.println(" Success");
			pst.executeUpdate();
			pst1.executeUpdate();
			
			System.out.println(" Update Successfully");	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Fees1> getAllFees()
	{
		List<Fees1> list=new ArrayList<Fees1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="SELECT * FROM fees f, student s WHERE f.sid = s.stuid";
			PreparedStatement pst=conn.prepareStatement(sql);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Fees1 s=new Fees1();
				
				 s=new Fees1();
				 s.setFid(rs.getInt("fid"));
				 s.setSid(rs.getInt("sid"));
				 s.setTotalfees(rs.getString("totalfees"));
				 s.setPaid(rs.getString("paid"));
				 s.setRemaining(rs.getString("remaining"));
				 s.setPtype(rs.getString("ptype"));
				 s.setPdetail(rs.getString("pdetail"));
				 s.setInstallment(rs.getString("installment"));
				 s.setAmount(rs.getString("amount"));
				 s.setDate(rs.getString("date"));
				 s.setRemarks(rs.getString("remarks"));
				 s.setSname(rs.getString("stuname"));
				 list.add(s);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	public List<Fees1> getFeesDetail(int sid)  
	{
		List<Fees1> list=new ArrayList<Fees1>();
		try
		{
			Connection conn=employeeutil.createConnection();
			String sql="select * from fees where sid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, sid);
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				Fees1 s=new Fees1();
				
				 s=new Fees1();
				 s.setFid(rs.getInt("fid"));
				 s.setSid(rs.getInt("sid"));
				 s.setTotalfees(rs.getString("totalfees"));
				 s.setPaid(rs.getString("paid"));
				 s.setRemaining(rs.getString("remaining"));
				 s.setPtype(rs.getString("ptype"));
				 s.setPdetail(rs.getString("pdetail"));
				 s.setInstallment(rs.getString("installment"));
				 s.setAmount(rs.getString("amount"));
				 s.setDate(rs.getString("date"));
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
