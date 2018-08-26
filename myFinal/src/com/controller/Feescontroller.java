package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Course1;
import com.bean.Fees1;
import com.bean.Receiptbean;
import com.dao.AlertDao;
import com.dao.Coursedao;
import com.dao.Feesdao;

@WebServlet("/Feescontroller")
public class Feescontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("ADD DETAIL"))
		{
			
				Fees1 f = new Fees1();
				f.setSid(Integer.parseInt(request.getParameter("sid")));
				f.setTotalfees(request.getParameter("totalfees"));
				f.setPaid(request.getParameter("paid"));
				f.setRemaining(request.getParameter("remaining"));
				f.setPtype(request.getParameter("ptype"));
				f.setPdetail(request.getParameter("pdetail"));
				f.setInstallment(request.getParameter("installment"));
				f.setAmount(request.getParameter("amount"));
				f.setDate(request.getParameter("date"));
				f.setRemarks(request.getParameter("remarks"));
				Feesdao sdao=new Feesdao();
				
				
				
				Receiptbean r=new  Receiptbean();
				r=sdao.insertfees(f);
				
				AlertDao adao=new AlertDao();
				adao.SendReceipt(r);
				
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}
		
		else if(action.equalsIgnoreCase("Edit"))
		{
			int fid=Integer.parseInt(request.getParameter("fid"));
			System.out.println("ID : "+fid);
			Feesdao sdao=new Feesdao();
			Fees1 s=sdao.getFeesById(fid);
			request.setAttribute("s", s);
			request.getRequestDispatcher("updatefees2.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
				
			Fees1 f = new Fees1();
			f.setFid(Integer.parseInt(request.getParameter("fid")));
			f.setSid(Integer.parseInt(request.getParameter("sid")));
			f.setTotalfees(request.getParameter("totalfees"));
			f.setPaid(request.getParameter("paid"));
			f.setRemaining(request.getParameter("remaining"));
			f.setPtype(request.getParameter("ptype"));
			f.setPdetail(request.getParameter("pdetail"));
			f.setInstallment(request.getParameter("installment"));
			f.setAmount(request.getParameter("amount"));
			f.setDate(request.getParameter("date"));
			f.setRemarks(request.getParameter("remarks"));
			Feesdao sdao=new Feesdao();
			sdao.updateFees(f);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		
	}

}
