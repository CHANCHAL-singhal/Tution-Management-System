<%@page import="com.bean.Student1"%>
<%@page import="com.dao.Studentdao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.awt.Checkbox"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");

		String exaid = request.getParameter("exa");
	   int cnt=0;
		if (!exaid.equalsIgnoreCase("")) {
			 
		 	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql = "select * from exam_attendance where exa_id=?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				int eid=Integer.parseInt(exaid);
				stmt.setInt(1, eid);
				ResultSet rs = stmt.executeQuery();
					
				out.println("<thead><th><center>Exam Attendance Id</center></th><th><center>Exam Id</center></th><th><center>Student Id</center></th><th><center>Student Name</center></th><th><center>Status</center></th><th><center>Obtained Marks</center></th></thead>");
				 out.println("<tbody>");
				
				while (rs.next()) {
						cnt++;			
						Studentdao sdao=new Studentdao();
						Student1 s=sdao.getStudentById(rs.getInt("stuid"));
						
						out.println("<tr><td>" + rs.getInt("ex_attid") + "</td><td>&nbsp;&nbsp;"+rs.getString("exa_id")+"</td><td>&nbsp;&nbsp;"+
						rs.getString("stuid")+"</td><td>&nbsp;&nbsp;"+s.getStuname()+"</td><td>&nbsp;&nbsp;"
								+ rs.getString("present")+"</td>"+"</td><td>&nbsp;&nbsp;"
								+ rs.getString("ob_marks")+"</td></tr>");
					
						

			}
				if(cnt==0)
				 {
					 out.println("<tr><td colspan='6'>Exam is Not Taken Yet OR Attendance is Not completed</tr>");
				 }
				 out.println("</tbody>");
				 
		 	}catch (Exception e) {
				e.printStackTrace();

		   
		}
		 	
		 	
		}
		
	%>
    