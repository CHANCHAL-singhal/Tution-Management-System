package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.employee_attendence;
import com.bean.student_attendence;
import com.dao.Studentdao;
import com.dao.emp_attdao;
import com.dao.stu_attdao;

@WebServlet("/Emp_attController")
public class Emp_attController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
	
		if(action.equalsIgnoreCase("ADD ATTENDANCE"))
		{
			employee_attendence e=new employee_attendence();
			e.setStatus("present");
			e.setDate(request.getParameter("date"));
			System.out.println("Date : "+request.getParameter("date"));
			
			if(request.getParameterValues("chkemp[]")!=null)
			{
				if(request.getParameterValues("chkemp[]") !=null)
				{
				String[] SelectedValues = request.getParameterValues("chkemp[]");
				emp_attdao sdao=new emp_attdao();
				for(String a : SelectedValues)
				  {
					 e.setEmpid(Integer.parseInt(a));
					 sdao.addattendence(e);				 
				  }
				}
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
			
	
		}
		 else if(action.equalsIgnoreCase("REMOVE ATTENDANCE"))
			{
			 int emp_attid;
			 if(request.getParameterValues("chkemp[]") != null)
			 {
			 String[] SelectedValues = request.getParameterValues("chkemp[]");
			 emp_attdao sdao=new emp_attdao();
				for(String a : SelectedValues)
				  {
					emp_attid=Integer.parseInt(a);
					 sdao.removeattendence(emp_attid);				 
				  }
			 
			 }
				//
				//Studentdao sdao=new Studentdao();
				//sdao.deleteStudent(emp_attid);
				request.getRequestDispatcher("home.jsp").forward(request, response);
				//request.getRequestDispatcher("show.jsp").forward(request, response);
			}
	
	}

}
