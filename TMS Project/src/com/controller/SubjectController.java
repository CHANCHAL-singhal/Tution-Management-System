package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.subject;
import com.dao.Subjectdao;

@WebServlet("/SubjectController")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action=request.getParameter("action");
		 if(action.equalsIgnoreCase("ADD SUBJECT"))
		{
			 
			 subject s=new subject();
			 s.setS_name(request.getParameter("sname"));
			 s.setCname("");
			 s.setSfees(request.getParameter("sfees"));
			 Subjectdao s1=new Subjectdao();
			 s1.insertsubject(s);
			 response.sendRedirect("home.jsp");
		}
		 else if(action.equalsIgnoreCase("Delete Subject"))
		 {
			 subject s=new subject();
			 s.setSid(Integer.parseInt(request.getParameter("subject")));
			 Subjectdao s1=new Subjectdao();
			 s1.deletesubject(s);
			 
			 response.sendRedirect("home.jsp");
	
		 }
		 else if(action.equalsIgnoreCase("Edit"))
			{
				int sid=Integer.parseInt(request.getParameter("sid"));
				Subjectdao sdao=new Subjectdao();
				subject s=sdao.getSubjectById(sid);
				request.setAttribute("s", s);
				request.getRequestDispatcher("updatesub2.jsp").forward(request, response);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				
				subject e=new subject();
				
				e.setSid(Integer.parseInt(request.getParameter("sid")));
				e.setS_name(request.getParameter("s_name"));
				e.setSfees(request.getParameter("sfees"));
				e.setCname(request.getParameter("cname"));	
				Subjectdao sdao=new Subjectdao();
				sdao.updateSubject(e);
				request.getRequestDispatcher("showallsubject.jsp").forward(request, response);
				//request.getRequestDispatcher("show.jsp").forward(request, response);
			}


	}

}


