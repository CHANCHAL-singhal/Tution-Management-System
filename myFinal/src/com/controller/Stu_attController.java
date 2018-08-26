package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.employee1;
import com.bean.student_attendence;
import com.dao.BatchDao;
import com.dao.employeedao;
import com.dao.stu_attdao;

@WebServlet("/Stu_attController")
public class Stu_attController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
	
		if(action.equalsIgnoreCase("ADD ATTENDANCE"))
		{
			student_attendence s=new student_attendence();
			s.setBat_id(Integer.parseInt(request.getParameter("batch")));
			s.setDate(request.getParameter("date"));
			s.setStatus("present");
			if(request.getParameterValues("chkstudent[]")!=null)
			{
			String[] SelectedValues = request.getParameterValues("chkstudent[]");
			stu_attdao sdao=new stu_attdao();
			for(String a : SelectedValues)
			  {
				 s.setStuid(Integer.parseInt(a));
				 sdao.addattendence(s);				 
			  }
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
		else if(action.equalsIgnoreCase("REMOVE BATCH ATTENDANCE"))
		{
			student_attendence s=new student_attendence();
			
			int id = Integer.parseInt(request.getParameter("batch"));
			String date =request.getParameter("date");
			//s.setStatus("present");
			/*String[] SelectedValues = request.getParameterValues("chkstudent[]");*/
			stu_attdao sdao=new stu_attdao();
			/*for(String a : SelectedValues)
			  {
				 s.setStuid(Integer.parseInt(a));*/
				 sdao.removebatchattendence(id,date);				 
			 
	
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
		else if(action.equalsIgnoreCase("REMOVE ATTENDANCE"))
		{
			student_attendence s=new student_attendence();
			s.setBat_id(Integer.parseInt(request.getParameter("batch")));
			s.setDate(request.getParameter("date"));
			s.setStatus("absent");
			if(request.getParameterValues("chkstudent[]") != null)
			{
			String[] SelectedValues = request.getParameterValues("chkstudent[]");
			stu_attdao sdao=new stu_attdao();
			for(String a : SelectedValues)
			  {
				 s.setStuid(Integer.parseInt(a));
				 sdao.removeattendence(s);				 
			  }
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
		
	}

}
