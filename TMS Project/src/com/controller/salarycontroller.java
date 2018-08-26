package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student1;
import com.bean.salary;
import com.dao.Salarydao;
import com.dao.Studentdao;

@WebServlet("/salarycontroller")
public class salarycontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		 if(action.equalsIgnoreCase("Add Detail"))
		{
		
			 	
				salary e=new salary();
				e.setEmpid(Integer.parseInt(request.getParameter("empid")));
				e.setTsalary(request.getParameter("tsalary"));
				e.setPtype(request.getParameter("ptype"));
				e.setMonth(request.getParameter("month"));
				e.setYear(request.getParameter("year"));
				e.setTattend(request.getParameter("tattend"));
				e.setNsalary(request.getParameter("nsalary"));
				e.setPdetail(request.getParameter("pdetail"));
				e.setPdate(request.getParameter("pdate"));
				e.setRemarks(request.getParameter("remarks"));
				Salarydao sdao=new Salarydao();
				sdao.insertsalary(e);
				request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		 
		 else if(action.equalsIgnoreCase("Edit"))
			{
				int sid=Integer.parseInt(request.getParameter("sid"));
				Salarydao sdao=new Salarydao();
				salary s=sdao.getSalaryById(sid);
				request.setAttribute("s", s);
				request.getRequestDispatcher("updatesal2.jsp").forward(request, response);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				
				salary e = new salary();
				e.setSid(Integer.parseInt(request.getParameter("sid")));
				e.setEmpid(Integer.parseInt(request.getParameter("empid")));
				e.setTsalary(request.getParameter("tsalary"));
				e.setPtype(request.getParameter("ptype"));
				e.setMonth(request.getParameter("month"));
				e.setYear(request.getParameter("year"));
				e.setTattend(request.getParameter("tattend"));
				e.setNsalary(request.getParameter("nsalary"));
				e.setPtype(request.getParameter("ptype"));
				e.setPdetail(request.getParameter("pdetail"));
				e.setPdate(request.getParameter("pdate"));
				e.setRemarks(request.getParameter("remarks"));
				Salarydao sdao=new Salarydao();
				sdao.updateSalary(e);
				request.getRequestDispatcher("home.jsp").forward(request, response);
				//request.getRequestDispatcher("show.jsp").forward(request, response);
			}
 
			
	}

}
