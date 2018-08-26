<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

String str=request.getParameter("val");

String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{
	


try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	String sql="select * from subject";
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	if(str.equalsIgnoreCase("stationary"))
	{
		out.println("<option value='"+"select"+"'>"+"--Select Subject--"+"</option> ");
		out.println("<option value='"+"other"+"'>"+"other"+"</option> ");
	}
	else
	{
	out.println("<option value='"+"select"+"'>"+"--Select Subject--"+"</option> ");
	while(rs.next())
	{
		String s1=rs.getString(2);
	
		out.println("<option value='"+s1+"'>"+s1+"</option> ");
	}
	out.println("<option value='"+"All"+"'>"+" All "+"</option> ");
	}
}

catch(Exception e)
{
	e.printStackTrace();
}


}
%>


</body>
</html>