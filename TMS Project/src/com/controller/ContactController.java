package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactController")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("send")) {
	   String name = request.getParameter("name");
	   String msg = request.getParameter("message");
	   String email = request.getParameter("email");
	   String mobile=request.getParameter("phone");
	   
	   System.out.println("Name : " +name );
	   System.out.println("Msg : "+msg);
	   System.out.println("Email : "+email);
	   System.out.println("mobile : "+mobile);
	  
	   
	   final String Senderid = "amn.tms2017@gmail.com";
		final String password = "9714670032";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.starttls.enable", "true");

		props.put("mail.smtp.host", "smtp.gmail.com");

		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication(Senderid, password);

			}

		});

		try {


			Message message = new MimeMessage(session);

			message.setFrom(new InternetAddress(Senderid));

			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("amn.tms2017@gmail.com")); // mail
			message.setSubject("Feedback");

			String msg1 = "<!DOCTYPE html><html><head></head><body><center><div style='background-color:#f1f1f1; width:500px; height:200px'><div style='background-color:#1db1fa; width:500px; height:50px'><h3 style='color:white; padding-top:10px;'>"
					+ name + "</h3></div><p style='color:gray; margin-left:-300px;'></p><br><p style='color:gray; margin-top:-10px;'>Name : "+name+"<br>Email : "+email+"<br>Mobile : "+mobile+"<br>Message : "+ msg+"</p><div></center></body></html>";

			message.setContent(msg1, "text/html; charset=utf-8");
			Transport.send(message);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();

		}

		}
	
	
	}

}
