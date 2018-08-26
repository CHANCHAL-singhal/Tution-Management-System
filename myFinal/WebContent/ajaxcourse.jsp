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



<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">

</head>
<body>
<%
	String cname=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,"root",password);
		String sql="select * from course where cname like '"+cname+"%' OR csubjects like '%"+cname+"%'";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		
		int a=0,i=0;
		if(rs.next())
		{
			a=1;
		 	out.println("<br>");
			out.println("<caption><center><b><font color='green' size='4px'>Search Results..</font></b></center></caption>");
		out.println("<table  align='center' width='1345' id='abc'><tr><th>ID</th><th>COURSE NAME</th><th>COURSE FEES</th><th>COURSE DURATION</th><th>SUBJECTS</th><th>REMARKS</th></tr>");
		out.println("<tr id='c'><td>"+rs.getString("cid")+"</td><td>"+rs.getString("cname")+"</td><td>"+rs.getString("cfees")+"</td><td>"+rs.getString("cduration")+"</td><td>"+rs.getString("csubjects")+"</td><td>"+rs.getString("cremarks")+"</td></tr>");
		while(rs.next())
		{
			if(i==0)
			{
				out.println("<tr><td>"+rs.getString("cid")+"</td><td>"+rs.getString("cname")+"</td><td>"+rs.getString("cfees")+"</td><td>"+rs.getString("cduration")+"</td><td>"+rs.getString("csubjects")+"</td><td>"+rs.getString("cremarks")+"</td></tr>");
			i=1;
			}
			else
			{
				out.println("<tr id='c'><td>"+rs.getString("cid")+"</td><td>"+rs.getString("cname")+"</td><td>"+rs.getString("cfees")+"</td><td>"+rs.getString("cduration")+"</td><td>"+rs.getString("csubjects")+"</td><td>"+rs.getString("cremarks")+"</td></tr>");
			i=0;
			}
		}
		}
		if(a==0)
		{
			
			out.println("<center><font color='red' face='TIMES NEW ROMAN'><h4><b>OOPS ! Result Not Found</b></h4></font></center>");
			
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