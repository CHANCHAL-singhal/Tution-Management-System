package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Student1;
import com.bean.employee1;
import com.dao.Studentdao;
import com.dao.employeedao;

@WebServlet("/Studentcontroller")
public class Studentcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		 if(action.equalsIgnoreCase("Registration"))
		{
			
				Student1 e=new Student1();
				e.setStuname(request.getParameter("stuname"));
				e.setStuaddress(request.getParameter("stuaddress"));
				e.setStuemail(request.getParameter("stuemail"));
				e.setStumobile(request.getParameter("stumobile"));
				e.setStugen(request.getParameter("stugen"));
				e.setParname(request.getParameter("parname"));
				e.setParmobile(request.getParameter("parmobile"));
				e.setParemail(request.getParameter("paremail"));
				e.setBatchid("-");
				e.setRefname(request.getParameter("refname"));
				e.setCourseid(request.getParameter("courseid"));
				e.setTotalfees(request.getParameter("totalfees"));
				e.setPaidamount("0");
				e.setStubook(request.getParameter("stubook"));
				Studentdao sdao=new Studentdao();
				sdao.insertstudent(e);
			request.getRequestDispatcher("showallstudent.jsp").forward(request, response);
			
		}
		 else if(action.equalsIgnoreCase("delete"))
			{
				int stuid=Integer.parseInt(request.getParameter("stuid"));
				System.out.println("ID : "+stuid);
				Studentdao sdao=new Studentdao();
				sdao.deleteStudent(stuid);
				request.getRequestDispatcher("showallstudent.jsp").forward(request, response);
				//request.getRequestDispatcher("show.jsp").forward(request, response);
			}
		 else if(action.equalsIgnoreCase("Edit"))
			{
				int stuid=Integer.parseInt(request.getParameter("stuid"));
				System.out.println("ID : "+stuid);
				Studentdao sdao=new Studentdao();
				Student1 s=sdao.getStudentById(stuid);
				request.setAttribute("s", s);
				request.getRequestDispatcher("updatestudent2.jsp").forward(request, response);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				Student1 e = new Student1();
				e.setStuid(Integer.parseInt(request.getParameter("stuid")));
				e.setStuname(request.getParameter("stuname"));
				e.setStuaddress(request.getParameter("stuaddress"));
				e.setStuemail(request.getParameter("stuemail"));
				e.setStumobile(request.getParameter("stumobile"));
				e.setStugen(request.getParameter("stugen"));
				e.setParname(request.getParameter("parname"));
				e.setParmobile(request.getParameter("parmobile"));
				e.setParemail(request.getParameter("paremail"));
				e.setBatchid(request.getParameter("batchid"));
				e.setRefname(request.getParameter("refname"));
				e.setCourseid(request.getParameter("courseid"));
				e.setTotalfees(request.getParameter("totalfees"));
				e.setPaidamount(request.getParameter("paidamount"));
				e.setStubook(request.getParameter("stubook"));
				Studentdao sdao=new Studentdao();
				sdao.updateStudent(e);
				request.getRequestDispatcher("showallstudent.jsp").forward(request, response);
				//request.getRequestDispatcher("show.jsp").forward(request, response);
			}

		
		
	}
}
