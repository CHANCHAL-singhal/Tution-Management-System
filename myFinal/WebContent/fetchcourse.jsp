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

String str=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	String sql="select * from subject where s_name ='"+str+"'";
	System.out.println(str);
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	if(str.equalsIgnoreCase("other"))
	{
		out.println("<option value='"+"other"+"'>"+"Other"+"</option> ");
	}
	else if(str.equalsIgnoreCase("All"))
	{
		 sql="select * from course";
		
		 stmt=conn.prepareStatement(sql);
		 rs=stmt.executeQuery();
		out.println("<option value='"+"select"+"'>"+"--Select Subject--"+"</option> ");
		while(rs.next())
		{
			String s1=rs.getString("cname");
			out.println("<option value='"+s1+"'>"+s1+"</option> ");
		}	
	}
	else
	{
	out.println("<option value='"+"select"+"'>"+"--Select Course--"+"</option> ");
   while(rs.next())
	{
		String s1=rs.getString("cname");
		String s[]=s1.split(",");
		for(String a : s)
		out.println("<option value='"+a+"'>"+a+"</option> ");
	}
	}
}catch(Exception e)
{
	e.printStackTrace();
}


}

%>

</body>
</html>