package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Course1;
import com.bean.employee1;
import com.dao.Coursedao;
import com.dao.Subjectdao;
import com.dao.employeedao;

@WebServlet("/Coursecontroller")
public class Coursecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("ADD COURSE"))
		{
			String csubjects="";
			Course1 c = new Course1();
			c.setCname(request.getParameter("cname"));
			c.setCfees(request.getParameter("cfees"));
			c.setCduration(request.getParameter("cduration"));
			c.setCremarks(request.getParameter("cremarks"));
			String sub[]=request.getParameterValues("csubjects");
			
			Subjectdao dao=new Subjectdao();
			
			for(int i=0;i<sub.length;i++){
			    csubjects+=sub[i]+",";
			    dao.addcourse(sub[i], c.getCname());
			}
			
				
				c.setCsubjects(csubjects);
				Coursedao sdao=new Coursedao();
				sdao.insertcourse(c);
				
				
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int cid=Integer.parseInt(request.getParameter("cid"));
			System.out.println("ID : "+cid);
			Coursedao sdao=new Coursedao();
			sdao.deletecourse(cid);
			request.getRequestDispatcher("showallcourse.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Edit"))
		{
			int cid=Integer.parseInt(request.getParameter("cid"));
			System.out.println("ID : "+cid);
			Coursedao sdao=new Coursedao();
			Course1 s=sdao.getCourseById(cid);
			request.setAttribute("s", s);
			request.getRequestDispatcher("updatecourse2.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			String csubjects="";
			String sub[]=request.getParameterValues("csubjects");
			for(int i=0;i<sub.length;i++){
			    csubjects+=sub[i]+",";
			}
			Course1 e=new Course1();
			e.setCid(Integer.parseInt(request.getParameter("cid")));
			e.setCname(request.getParameter("cname"));
			e.setCfees(request.getParameter("cfees"));
			e.setCduration(request.getParameter("cduration"));
			e.setCsubjects(csubjects);
			e.setCremarks(request.getParameter("cremarks"));
			
			Coursedao sdao=new Coursedao();
			sdao.updateCourse(e);
			request.getRequestDispatcher("showallcourse.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}

	}
}
