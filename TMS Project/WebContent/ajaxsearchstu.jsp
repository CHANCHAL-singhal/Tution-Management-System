<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">

</head>
<body>
<%
	String stuname=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

	//out.println("Email : "+email);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,"root",password);
		String sql="select * from student where stuname like '"+stuname+"%' OR batchid like '" + stuname + "%'";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		
		int a=0,i=0;
		if(rs.next())
		{
			a=1;
			out.println("<br>");
			out.println("<caption><center><b><font color='green' size='4px'>Search Results..</font></b></center></caption>");
		out.println("<table  align='center' width='1345'><tr><th>ID</th><th>NAME</th><th>ADDRESS</th><th>EMAIL</th><th>MOBILE</th><th>GENDER</th><th>PARENT NAME</th><th>PARENT MOBILE</th><th>PARENT EMAIL</th><th>BATCH ID</th><th>REFRENCE NAME</th><th>COURSE ID</th><th>BOOK</th></tr>");
		out.println("<tr id='c'><td>"+rs.getString("stuid")+"</td><td>"+rs.getString("stuname")+"</td><td>"+rs.getString("stuaddress")+"</td><td>"+rs.getString("stuemail")+"</td><td>"+rs.getString("stumobile")+"</td><td>"+rs.getString("stugen")+"</td><td>"+rs.getString("parname")+"</td><td>"+rs.getString("parmobile")+"</td><td>"+rs.getString("paremail")+"</td><td>"+rs.getString("batchid")+"</td><td>"+rs.getString("refname")+"</td><td>"+rs.getString("courseid")+"</td><td>"+rs.getString("stubook")+"</td></tr>");
		while(rs.next())
		{
			if(i==0)
			{
				out.println("<tr><td>"+rs.getString("stuid")+"</td><td>"+rs.getString("stuname")+"</td><td>"+rs.getString("stuaddress")+"</td><td>"+rs.getString("stuemail")+"</td><td>"+rs.getString("stumobile")+"</td><td>"+rs.getString("stugen")+"</td><td>"+rs.getString("parname")+"</td><td>"+rs.getString("parmobile")+"</td><td>"+rs.getString("paremail")+"</td><td>"+rs.getString("batchid")+"</td><td>"+rs.getString("refname")+"</td><td>"+rs.getString("courseid")+"</td><td>"+rs.getString("stubook")+"</td></tr>");
			i=1;
			}
			else
			{
				out.println("<tr id='c'><td>"+rs.getString("stuid")+"</td><td>"+rs.getString("stuname")+"</td><td>"+rs.getString("stuaddress")+"</td><td>"+rs.getString("stuemail")+"</td><td>"+rs.getString("stumobile")+"</td><td>"+rs.getString("stugen")+"</td><td>"+rs.getString("parname")+"</td><td>"+rs.getString("parmobile")+"</td><td>"+rs.getString("paremail")+"</td><td>"+rs.getString("batchid")+"</td><td>"+rs.getString("refname")+"</td><td>"+rs.getString("courseid")+"</td><td>"+rs.getString("stubook")+"</td></tr>");
			i=0;
			}
		}
		}
		if(a==0)
		{
			
			out.println("<center><font color='red' ><h4><b>OOPS ! Result Not Found</b></h4></font></center>");
			
		}
		out.println("</table>");
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}


%>


</body>
</html>