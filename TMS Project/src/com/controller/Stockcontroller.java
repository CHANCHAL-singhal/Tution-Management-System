package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Course1;
import com.bean.Stock;
import com.dao.Coursedao;
import com.dao.Stockdao;

@WebServlet("/Stockcontroller")
public class Stockcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("ADD PRODUCT"))
		{
			Stock s = new Stock();
			s.setStname(request.getParameter("stname"));
			s.setStquantity(request.getParameter("stquantity"));
			s.setSttype(request.getParameter("sttype"));
			s.setStsubject(request.getParameter("stsubject"));
			s.setStcourse(request.getParameter("stcourse"));
			s.setStremarks(request.getParameter("stremarks"));
			Stockdao sdao = new Stockdao();

				sdao.insertstock(s);
				
				
			request.getRequestDispatcher("home.jsp").forward(request, response);
			
		}
		
		else if(action.equalsIgnoreCase("Delete"))
		{
			int stid=Integer.parseInt(request.getParameter("stid"));
			System.out.println("ID : "+stid);
			Stockdao sdao = new Stockdao();
			
			sdao.deleteStock(stid);
			request.getRequestDispatcher("showallstock.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Edit"))
		{
			int stid=Integer.parseInt(request.getParameter("stid"));
			System.out.println("ID : "+stid);
			Stockdao sdao=new Stockdao();
			Stock s=sdao.getStockById(stid);
			request.setAttribute("s", s);
			request.getRequestDispatcher("updatestock2.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			
			Stock e=new Stock();

			e.setStid(Integer.parseInt(request.getParameter("stid")));
			e.setStname(request.getParameter("stname"));
			e.setStquantity(request.getParameter("stquantity"));
			e.setSttype(request.getParameter("sttype"));
			e.setStsubject(request.getParameter("stsubject"));
			e.setStcourse(request.getParameter("stcourse"));
			e.setStremarks(request.getParameter("stremarks"));
			Stockdao sdao=new Stockdao();
			sdao.updateStock(e);
			request.getRequestDispatcher("showallstock.jsp").forward(request, response);
			//request.getRequestDispatcher("show.jsp").forward(request, response);
		}

	}
	
	

}
