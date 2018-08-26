package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student1;
import com.bean.batch;
import com.dao.BatchDao;
import com.dao.Coursedao;
@WebServlet("/BatchController")
public class BatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action=request.getParameter("action");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(action.equalsIgnoreCase("ADD BATCH"))
		{
			batch b=new batch();
			
			
			b.setBatch_name(request.getParameter("bname"));
			b.setStart_time(request.getParameter("stime"));
			b.setEnd_time(request.getParameter("etime"));
			b.setEmp_id(Integer.parseInt(request.getParameter("Ename")));
			b.setCname(request.getParameter("Cname"));
			b.setS_name(request.getParameter("Csubject"));
			b.setSdate(request.getParameter("sdate"));
	
			
		
			BatchDao sdao=new BatchDao();
			sdao.insertBatch(b);
			
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("ADD STUDENTS"))
		{
			batch b=new batch();
			Student1 s=new Student1();
			
			b.setBatch_id(Integer.parseInt(request.getParameter("batch")));
			if(request.getParameterValues("chkstudent[]") !=null)
			{
			String[] SelectedValues = request.getParameterValues("chkstudent[]");
			BatchDao sdao=new BatchDao();
			for(String a : SelectedValues)
			  {
				 s.setStuid(Integer.parseInt(a));
				 sdao.insertstudent(b, s);
				 
			  }
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("REMOVE STUDENTS"))
		{
			batch b=new batch();
			Student1 s=new Student1();
			
			//b.setBatch_id(Integer.parseInt(request.getParameter("batch")));
			if(request.getParameterValues("chkstudent[]") != null)
			{
			String[] SelectedValues = request.getParameterValues("chkstudent[]");
			BatchDao sdao=new BatchDao();
			for(String a : SelectedValues)
			  {
				 s.setStuid(Integer.parseInt(a));
				 sdao.insertstudent(b, s);
				 
			  }
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	
		else if(action.equalsIgnoreCase("COMPLETE BATCH"))
		{
			int bid;
			bid=Integer.parseInt(request.getParameter("batch"));
			BatchDao sdao=new BatchDao();
			sdao.completebatch(bid);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Edit"))
		{
			int bid;
			bid=Integer.parseInt(request.getParameter("batch_id"));
			BatchDao sdao=new BatchDao();
			batch b=sdao.getBatchById(bid);
			request.setAttribute("b", b);
			request.getRequestDispatcher("updatebatch.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			batch b=new batch();
			b.setBatch_id(Integer.parseInt(request.getParameter("bid")));
			b.setBatch_name(request.getParameter("bname"));
			b.setStart_time(request.getParameter("stime"));
			b.setEnd_time(request.getParameter("etime"));
			
			BatchDao sdao=new BatchDao();
			sdao.updateBatch(b);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}
	
	
	
	}

}
