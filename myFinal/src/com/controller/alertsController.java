package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student1;
import com.bean.alerts;
import com.bean.employee1;
import com.dao.AlertDao;
import com.dao.Studentdao;
import com.dao.employeedao;

@WebServlet("/alertsController")
public class alertsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action=request.getParameter("action");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		if(action.equalsIgnoreCase("Send Batch Alert"))
		{
			alerts a1=new alerts();
			int bid=Integer.parseInt(request.getParameter("batch"));
			a1.setSubject(request.getParameter("subject"));
			a1.setHeader(request.getParameter("header"));
			a1.setMessage(request.getParameter("message"));
		   Studentdao sda=new Studentdao();
		   List<Student1> list=sda.getAllStudentbybatchid(bid);
		   AlertDao adao=new AlertDao();
		   
		   for(Student1 s : list)
		   {
			   adao.SendEmail(a1, s.getStuemail());
		   }
		   
			//System.out.println("bid : "+bid+" subject : "+a1.getSubject()+" header : "+a1.getHeader()+"message : "+a1.getMessage());
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Student Alert"))
		{
			alerts a1=new alerts();
			int sid=Integer.parseInt(request.getParameter("student"));
			a1.setSubject(request.getParameter("subject"));
			a1.setHeader(request.getParameter("header"));
			a1.setMessage(request.getParameter("message"));
		   Studentdao sda=new Studentdao();
		   Student1 s=sda.getStudentById(sid);
		   AlertDao adao=new AlertDao();
		   
			   adao.SendEmail(a1,s.getStuemail());
		   
			//System.out.println("bid : "+bid+" subject : "+a1.getSubject()+" header : "+a1.getHeader()+"message : "+a1.getMessage());
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Employees Alert"))
		{
			
			alerts a1=new alerts();
			a1.setSubject(request.getParameter("subject"));
			a1.setHeader(request.getParameter("header"));
			a1.setMessage(request.getParameter("message"));
			String des=request.getParameter("designation");
			if(!des.equalsIgnoreCase("--"))
			{	
				AlertDao adao=new AlertDao();
				employeedao edao=new employeedao();
				List<employee1> list=edao.getEmployeeNameByDesignation(des);
				for(employee1 e: list)
				{
					adao.SendEmail(a1, e.getEmpemail());
				}
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Employee Alert"))
		{
			
			alerts a1=new alerts();
			a1.setSubject(request.getParameter("subject"));
			a1.setHeader(request.getParameter("header"));
			a1.setMessage(request.getParameter("message"));
			int eid=Integer.parseInt(request.getParameter("employee"));
				
			AlertDao adao=new AlertDao();
				employeedao edao=new employeedao();
				String email=edao.getEmployeeEmailIdById(eid);
				adao.SendEmail(a1, email);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	
	
	}

}
