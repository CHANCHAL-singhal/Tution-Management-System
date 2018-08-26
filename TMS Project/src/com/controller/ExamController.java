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
import com.bean.exam_master;
import com.dao.ExamDao;
import com.dao.Studentdao;

@WebServlet("/ExamController")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("Create Exam"))
		{
			exam_master e=new exam_master();
			e.setBatch_id(Integer.parseInt(request.getParameter("batch")));
			e.setDate(request.getParameter("date"));
			e.setExa_name(request.getParameter("ename"));
			e.setPmarks(Integer.parseInt(request.getParameter("pmarks")));
			e.setTmarks(Integer.parseInt(request.getParameter("tmarks")));
			e.setTime(request.getParameter("ttime"));
		
			ExamDao edao=new ExamDao();
			edao.create_exam(e);
			
			e.setExa_id(edao.getexamidByname(e.getExa_name()));
			
			Studentdao sdao = new Studentdao();
			List<Student1> s = sdao.getAllStudentbybatchid(e.getBatch_id());
			
			for(Student1 s1 : s)
			{
				edao.Add_examAttendance(e, s1);
			}
			
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int exa_id;
			exa_id=Integer.parseInt(request.getParameter("exa_id"));
			ExamDao edao=new ExamDao();
			edao.deleteexam(exa_id);

			request.getRequestDispatcher("home.jsp").forward(request, response);
	
		}
	

		else if(action.equalsIgnoreCase("Edit"))
		{
			int exa_id=Integer.parseInt(request.getParameter("exa_id"));
			ExamDao edao=new ExamDao();
			exam_master s=edao.getExamById(exa_id);
			request.setAttribute("s", s);
			request.getRequestDispatcher("updateexam2.jsp").forward(request, response);
			
			
			
			
			/*int eid;
			eid=Integer.parseInt(request.getParameter("e"));
			
			edao.deleteexam(eid);

			request.getRequestDispatcher("home.jsp").forward(request, response);
*/	
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			exam_master e = new exam_master();
			e.setExa_id(Integer.parseInt(request.getParameter("exa_id")));
			e.setBatch_id(Integer.parseInt(request.getParameter("batch_id")));
			e.setDate(request.getParameter("date"));
			e.setExa_name(request.getParameter("exa_name"));
			e.setTime(request.getParameter("time"));
			e.setPmarks(Integer.parseInt(request.getParameter("pmarks")));
			e.setTmarks(Integer.parseInt(request.getParameter("tmarks")));
			ExamDao edao=new ExamDao();
			edao.updateExam(e);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}

	}

}
