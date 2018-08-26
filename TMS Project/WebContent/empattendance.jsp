<%@page import="java.awt.Checkbox"%>
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
<link href="css/ajax.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<%
		String str = request.getParameter("val");
	String date1 = request.getParameter("date");
	String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");
	int c=0;
		if (!str.equalsIgnoreCase("")) {
		 	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql="SELECT * FROM employee WHERE empid NOT IN (SELECT empid FROM employee_attendence AS e WHERE e.date=?) AND `empdesignation`=?;";
				PreparedStatement stmt=conn.prepareStatement(sql);
				stmt.setString(1,date1);
				stmt.setString(2,str);
				
				ResultSet rs=stmt.executeQuery();
				
				out.println("<tr class='a'><th>PRESENT</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee name</th><th>&nbsp;Employee Username</th></tr>");
				while (rs.next()) {
					c=1;				
	
					out.println("<tr class='a' > <td><input type='checkbox' name='chkemp[]' value="+ rs.getInt("empid") +"></td><td>&nbsp;&nbsp;&nbsp;" + rs.getString("empname") + "</td><td>"
							+ rs.getString("empusername") + "</td></tr>");
				}
				if(c==1)
				{
					out.println("<tr class='a'><td ><input type='checkbox' name='chkall' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td><td></td></tr>");
					
				}
				else
				{
					out.println("<tr class='a'><td colspan='3'>No Employees Found OR All Employees Are Present On This Date</td></tr>");
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		   
		   
		}
	%>

</body>
</html>