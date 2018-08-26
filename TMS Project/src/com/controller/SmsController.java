package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student1;
import com.bean.employee1;
import com.dao.SmsDao;
import com.dao.Studentdao;
import com.dao.employeedao;

@WebServlet("/SmsController")
public class SmsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String action=request.getParameter("action");
		response.setContentType("text/html");
		
		if(action.equalsIgnoreCase("Send Batch Alert"))
		{
			int bid=Integer.parseInt(request.getParameter("batch"));
			String msg=request.getParameter("message");
		   Studentdao sda=new Studentdao();
		   List<Student1> list=sda.getAllStudentbybatchid(bid);
		   SmsDao sdao=new SmsDao();
		   for(Student1 s : list)
		   {
			   /*mobiles+=s.getStumobile()+",";*/
			  
			   sdao.SendSms( String.valueOf(s.getStumobile()), msg);
		   }
		   
		   System.out.println("end");
		   
		   
			//System.out.println("bid : "+bid+" subject : "+a1.getSubject()+" header : "+a1.getHeader()+"message : "+a1.getMessage());
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Student Alert"))
		{
			int sid=Integer.parseInt(request.getParameter("student"));
			String msg=request.getParameter("message");
		   Studentdao sda=new Studentdao();
		   Student1 s=sda.getStudentById(sid);
		   SmsDao sdao=new SmsDao();
		   sdao.SendSms( String.valueOf(s.getStumobile()), msg);
			//System.out.println("bid : "+bid+" subject : "+a1.getSubject()+" header : "+a1.getHeader()+"message : "+a1.getMessage());
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Employees Alert"))
		{
			String msg=request.getParameter("message");
			String des=request.getParameter("designation");
			if(!des.equalsIgnoreCase("--"))
			{	
				employeedao edao=new employeedao();
				List<employee1> list=edao.getEmployeeNameByDesignation(des);
				SmsDao sdao=new SmsDao();
				  
				for(employee1 e: list)
				{
					 sdao.SendSms( String.valueOf(e.getEmpmobile()), msg);
				}
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Send Employee Alert"))
		{
			
			int eid=Integer.parseInt(request.getParameter("employee"));
			String msg=request.getParameter("message");
			
				employeedao edao=new employeedao();
				employee1 e=edao.getEmployeeById(eid);
				SmsDao sdao=new SmsDao();
				 sdao.SendSms( String.valueOf(e.getEmpmobile()), msg);
				request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	

	}

}
