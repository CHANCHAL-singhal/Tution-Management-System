package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.exam_attendance;
import com.dao.Exam_attdao;
import com.dao.emp_attdao;

@WebServlet("/Exam_attendance")
public class Exam_attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
	
		if(action.equalsIgnoreCase("ADD ATTENDANCE"))
		{
			int eid=Integer.parseInt(request.getParameter("exam"));
			
			Exam_attdao edao=new Exam_attdao();
			if(request.getParameterValues("chkstu[]") != null)
			{
			String[] SelectedValues = request.getParameterValues("chkstu[]");
			for(String a : SelectedValues)
			  {
				int sid=Integer.parseInt(a);
				edao.update_examAttendance(eid, sid);
			  
			  }}
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
		else if(action.equalsIgnoreCase("Add Marks"))
		{
			
			int eid=Integer.parseInt(request.getParameter("exam"));
			
			Enumeration<String> getAll=request.getParameterNames();
			Exam_attdao e1=new Exam_attdao();
			
			exam_attendance e= null;
			while(getAll.hasMoreElements()){
				e=new exam_attendance();
				e.setExa_id(eid);
				String paramname=getAll.nextElement();
				if(paramname.contains("add")){
					String id=paramname.replace("add", "");
					if(id.equalsIgnoreCase(""))
					{
						id="0";
						System.out.println(id);
					}
					e.setStuid(Integer.parseInt(id));
					e.setOb_marks(Integer.parseInt(request.getParameter(paramname)));
					
					
					
					e1.update_exammarks(e);
				}
				
			}
/*			e.setStuid(Integer.parseInt(request.getParameter("student")));
			e.setOb_marks(Integer.parseInt(request.getParameter("marks")));*/
			
			
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
		else if(action.equalsIgnoreCase("UPDATE ATTENDANCE"))
		{
			int eid=Integer.parseInt(request.getParameter("exam"));
			
			Exam_attdao edao=new Exam_attdao();
			if(request.getParameterValues("chkstu[]") != null)
			{
			String[] SelectedValues = request.getParameterValues("chkstu[]");
			for(String a : SelectedValues)
			  {
				int sid=Integer.parseInt(a);
				edao.remove_examAttendance(eid, sid);
			  
			  }
			}
			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
	
	
	
	}

}
