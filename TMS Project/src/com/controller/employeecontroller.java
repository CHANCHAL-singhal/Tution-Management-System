package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bean.employee1;
import com.dao.employeedao;

@MultipartConfig
@WebServlet("/employeecontroller")
public class employeecontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static int flag = 0;

	private static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-256");
			byte[] hashedBytes = sha.digest(input.getBytes("UTF-8"));
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
			flag = 1;
			e.printStackTrace();
		}

		return hash.toString();
	}

	private String getFileName(final Part part) {
		final String partHeader = part.getHeader("content-disposition");

		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("Login")) {
			String a = request.getParameter("emppassword");
			a = generateHash(a);
			employee1 e = new employee1();
			e.setEmpusername(request.getParameter("empusername"));
			e.setEmppassword(a);

			e.setEmpdesignation(request.getParameter("designation"));

			employeedao sdao = new employeedao();
			// employee employee=sdao.checkLogin(e);
			e = sdao.checkLogin(e);
			if (e == null) {

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your Username Or Password Is Incorrect!')");
				out.println("location='login.jsp';");
				out.println("</script>");
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("e", e);
				if (e.getEmpdesignation().equalsIgnoreCase("Admin")) {
					request.getRequestDispatcher("home.jsp").forward(request, response);

				} else if (e.getEmpdesignation().equalsIgnoreCase("Faculty")) {
					request.getRequestDispatcher("home.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}

			}
		} else if (action.equalsIgnoreCase("Registration")) {
			String empsubject = "not faculty";
			String a = request.getParameter("emppassword");
			a = generateHash(a);
			String val = request.getParameter("empdesignation");
			if (val.equalsIgnoreCase("Faculty")) {
				String sub[] = request.getParameterValues("empsubject");
				for (int i = 0; i < sub.length; i++) {
					if (i == 0) {
						empsubject = "";
					}
					empsubject += sub[i] + ",";
				}
			}
			employee1 e = new employee1();
			Part filePart = request.getPart("emppic");

			String path = getServletContext().getInitParameter("imgurl");

			File file = new File(path);
			file.mkdir();
			String fileName = getFileName(filePart);

			OutputStream out11 = null;

			InputStream filecontent = null;

			try {
				out11 = new FileOutputStream(new File(path + File.separator + fileName));

				filecontent = filePart.getInputStream();

				int read = 0;
				final byte[] bytes = new byte[1024];

				while ((read = filecontent.read(bytes)) != -1) {
					out11.write(bytes, 0, read);

					e.setEmppic(fileName);

				}

			} catch (Exception e1) {

			}

			
			e.setEmpusername(request.getParameter("empusername"));
			e.setEmppassword(a);

			e.setEmpname(request.getParameter("empname"));
			e.setEmpaddress(request.getParameter("empaddress"));
			e.setEmpmobile(request.getParameter("empmobile"));
			e.setEmpemail(request.getParameter("empemail"));
			e.setEmpqualification(request.getParameter("empqualification"));
			e.setEmpjoindate(request.getParameter("empjoindate"));
			e.setEmpdesignation(request.getParameter("empdesignation"));
			e.setEmpaadhar(request.getParameter("empaadhar"));
			e.setEmpsalary(request.getParameter("empsalary"));
			e.setEmpsubject(empsubject);
			employeedao sdao = new employeedao();
			sdao.insertemployee(e);

			request.getRequestDispatcher("showallemp.jsp").forward(request, response);

		} 
		
		else if (action.equalsIgnoreCase("delete")) {
			int empid = Integer.parseInt(request.getParameter("empid"));
			System.out.println("ID : " + empid);
			employeedao sdao = new employeedao();
			sdao.deleteemployee(empid);
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} 
		
		else if (action.equalsIgnoreCase("Edit")) {
			int empid = Integer.parseInt(request.getParameter("empid"));
			System.out.println("ID : " + empid);
			employeedao sdao = new employeedao();
			employee1 s = sdao.getEmployeeById(empid);
			request.setAttribute("s", s);
			request.getRequestDispatcher("updateemp2.jsp").forward(request, response);
		} 
		
		else if (action.equalsIgnoreCase("Update")) {

			employee1 e = new employee1();
			
			
			Part filePart = request.getPart("emppic");

			String path = getServletContext().getInitParameter("imgurl");

			File file = new File(path);
			file.mkdir();
			String fileName = getFileName(filePart);

			OutputStream out11 = null;

			InputStream filecontent = null;

			try {
				out11 = new FileOutputStream(new File(path + File.separator + fileName));

				filecontent = filePart.getInputStream();

				int read = 0;
				final byte[] bytes = new byte[1024];

				while ((read = filecontent.read(bytes)) != -1) {
					out11.write(bytes, 0, read);

					e.setEmppic(fileName);

				}

			} catch (Exception e1) {

			}

			
			
			
			
			e.setEmpid(Integer.parseInt(request.getParameter("empid")));
			e.setEmpusername(request.getParameter("empusername"));

			e.setEmpname(request.getParameter("empname"));
			e.setEmpaddress(request.getParameter("empaddress"));
			e.setEmpmobile(request.getParameter("empmobile"));
			e.setEmpemail(request.getParameter("empemail"));
			e.setEmpqualification(request.getParameter("empqualification"));
			e.setEmpaadhar(request.getParameter("empaadhar"));
			HttpSession session = request.getSession(true);
			employee1 e1=(employee1) session.getAttribute("e");
			e1.setEmppic(e.getEmppic());
			session.setAttribute("e", e1);
			employeedao sdao = new employeedao();
			sdao.updateEmployee(e);
			
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Change Password"))
		{
			String a = request.getParameter("empcurpassword");
			a = generateHash(a);
			String b =request.getParameter("emppassword");
			System.out.println(a + "  -  " + b );
			if(a.equals(b))
			{
			String c = request.getParameter("empnewpassword");
			String d = request.getParameter("empconfirmpassword");
			System.out.println(c + "  -  " + d );
			if(c.equals(d))
			{
				
				
			employee1 e=new employee1();
			c = generateHash(c);
			if(c.equals(a))
			{
				 out.println("<script type=\"text/javascript\">");
					out.println("alert('Your New Password And Old Password Are Same!')");
					out.println("location='changepassword.jsp';");
					out.println("</script>");		
			}
			else
			{
			e.setEmpid(Integer.parseInt(request.getParameter("empid")));
			e.setEmppassword(c);
			
			employeedao sdao=new employeedao();
			sdao.changepass(e);
			request.getRequestDispatcher("home.jsp").forward(request, response);
				
			}
			}
			else
			{
				 out.println("<script type=\"text/javascript\">");
					out.println("alert('Your New Password And Confirm Password Not Match!')");
					out.println("location='changepassword.jsp';");
					out.println("</script>");		
				
			}
			}
			else
			{
				 out.println("<script type=\"text/javascript\">");
					out.println("alert('You Entered Current Password Is Incorrect!')");
					out.println("location='changepassword.jsp';");
					out.println("</script>");		
			}
		}
		else if (action.equalsIgnoreCase("Save Changes")) {
			String empsubject = "not faculty";
			employee1 e = new employee1();
			e.setEmpid(Integer.parseInt(request.getParameter("empid")));
			String val = request.getParameter("empdesignation");
			if (val.equalsIgnoreCase("Faculty")) {
				String sub[] = request.getParameterValues("empsubject");
				for (int i = 0; i < sub.length; i++) {
					if (i == 0) {
						empsubject = "";
					}
					empsubject += sub[i] + ",";
				}
			}
			e.setEmpdesignation(request.getParameter("empdesignation"));
			e.setEmpsalary(request.getParameter("empsalary"));
			e.setEmpsubject(empsubject);
			HttpSession session = request.getSession(true);
			employee1 e1=(employee1) session.getAttribute("e");
			e1.setEmppic(e.getEmppic());
			session.setAttribute("e", e1);
			employeedao sdao = new employeedao();
			sdao.updateEmp(e);
			
			request.getRequestDispatcher("home.jsp").forward(request, response);

		}
		
		


	}

}
