<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
		String str = request.getParameter("val");
		
	String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");



		if (!str.equalsIgnoreCase("")) {
		 	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql="select * from employee where empdesignation = '"+str+"'";
				PreparedStatement stmt=conn.prepareStatement(sql);
				
				
				ResultSet rs=stmt.executeQuery();
				out.println("<option value='"+"select"+"'>"+"--Select Employee--"+"</option> ");
				while (rs.next()) {
					
					out.println("<option value='"+rs.getString("empid")+"'>"+rs.getString("empname") + "( " + rs.getString("empusername") + " ) " +"</option> ");

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		   
		   
		}
		else
		{
			out.println(" ");	
		}
	%>


</body>
</html>