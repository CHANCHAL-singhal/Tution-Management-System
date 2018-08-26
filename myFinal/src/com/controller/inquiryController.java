package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Stock;
import com.bean.inquiry;
import com.dao.Stockdao;
import com.dao.inquiryDao;

@WebServlet("/inquiryController")
public class inquiryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("ADD DETAIL"))
		{
			String interest = "not interested";
			String ins[] = request.getParameterValues("interest");
			for (int i = 0; i < ins.length; i++) {
				if (i == 0) {
					interest = "";
				}
				interest += ins[i] + ",";
			}
			
			
			inquiry i = new inquiry();
			i.setIsname(request.getParameter("isname"));
			i.setIsemail(request.getParameter("isemail"));
			i.setIsmobile(request.getParameter("ismobile"));
			i.setDate(request.getParameter("date"));
			i.setInterest(interest);
			i.setIcourse(request.getParameter("icourse"));
			i.setIsref(request.getParameter("isref"));
			i.setIremarks(request.getParameter("iremarks"));
			inquiryDao idao = new inquiryDao();

				idao.insertinquiry(i);
				
			request.getRequestDispatcher("inquiry.jsp").forward(request, response);
			
		}

	}

}
