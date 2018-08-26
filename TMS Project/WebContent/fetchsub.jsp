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

<!-- <link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" /> -->
</head>
<body>
<%

String str=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{
	
int id=Integer.parseInt(str); 

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	String sql="select * from course where cid =" + id;
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	out.print("<label class='head'>Select Subjects<span class='w3l-star'> * </span></label>");
	out.println("<font color='white'>");
	out.println("&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' name='chkall' value='0' onClick='selectAll(this);' checked='true'>	<b>Select All</b> <br>");
/* 	out.println("<option value='"+"select"+"'>"+"--Select Subject--"+"</option> "); */
	while(rs.next())
	{
		String s1=rs.getString("csubjects");
		
		String s[]=s1.split(",");
		
		for(String a : s)
		out.println("<b>&nbsp;&nbsp;&nbsp;&nbsp;<input type='checkbox' value='"+a+"' name='stusubject[]' checked='true'>&nbsp;"+ a + "</b>");
		out.println("</font>");
	}
	
}catch(Exception e)
{
	e.printStackTrace();
}


}
else
{
	out.print("<label class='head'>Select Subjects<span class='w3l-star'> * </span></label>");
}
%>


</body>
</html>