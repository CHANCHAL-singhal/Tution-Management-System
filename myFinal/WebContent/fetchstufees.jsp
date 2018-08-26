<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
	String sql="select * from student where stuid ='"+str+"'";
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	
	if(rs.next())
	{
			String s1=rs.getString("totalfees");
			String s2=rs.getString("paidamount");
			%>
			<%=s1 %>
			<%=s2 %>
			<%
			
	}

}catch(Exception e)
{
	e.printStackTrace();
}


}
else
{
	out.println(" ");
}
%>
