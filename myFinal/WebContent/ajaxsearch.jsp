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
	String empname=request.getParameter("val");
	String diff = request.getParameter("v");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");
String sql;
PreparedStatement pst;
ResultSet rs;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,"root",password);
		if(diff.equalsIgnoreCase("1"))
		{
			if(empname.length()>=5)
			{
		 sql="select * from employee where empusername like '"+empname+"%'";
		 pst=conn.prepareStatement(sql);
		 rs=pst.executeQuery();
		
		int a=0,i=0;
				if(rs.next())
				{
					out.println("<font color='red' size='3'><b>Username is Taken</b></font>");
				}
			}
		}
		
		
		else if(diff.equalsIgnoreCase("2"))
		{
		 sql="select * from employee where empemail like '"+empname+"%'";
		 pst=conn.prepareStatement(sql);
		 rs=pst.executeQuery();
		
		int a=0,i=0;
			if(rs.next())
			{
					out.println("<font color='red' size='3'><b>Email Id is Taken</b></font>");
			}
		}
		
		
		else if(diff.equalsIgnoreCase("3"))
		{
		 sql="select * from student where stuemail like '"+empname+"%'";
		 pst=conn.prepareStatement(sql);
		 rs=pst.executeQuery();
		
		int a=0,i=0;
			if(rs.next())
			{
					out.println("<font color='red' size='3'><b>Email Id is Taken</b></font>");
			}
		}
		
		else if(diff.equalsIgnoreCase("4"))
		{
		 sql="select * from batch where batch_name like '"+empname+"%'";
		 pst=conn.prepareStatement(sql);
		 rs=pst.executeQuery();
		
		int a=0,i=0;
			if(rs.next())
			{
					out.println("<font color='red' size='3'><b>Batch Name is Taken</b></font>");
			}
		}
		
		
		else if(diff.equalsIgnoreCase("5"))
		{
		 sql="select * from exam_master where exa_name like '"+empname+"%'";
		 pst=conn.prepareStatement(sql);
		 rs=pst.executeQuery();
		
		int a=0,i=0;
			if(rs.next())
			{
					out.println("<font color='red' size='3'><b>Exam Name is Taken</b></font>");
			}
		}

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}


%>

</body>
</html>