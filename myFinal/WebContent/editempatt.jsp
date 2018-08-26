<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
	
		String s1 = request.getParameter("d");
		String s = request.getParameter("val");
		String url = pageContext.getServletContext().getInitParameter("url");
		String password = pageContext.getServletContext().getInitParameter("password");

		if (!s1.equalsIgnoreCase("")) {
		 	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql="select * from employee_attendence JOIN employee on employee_attendence.empid=employee.empid";
				PreparedStatement stmt=conn.prepareStatement(sql);
				int c=0;
				String s2;
				Date min,ch;
			    min=new SimpleDateFormat("dd-MM-yyyy").parse(s1);
				ResultSet rs=stmt.executeQuery();
				out.println("<tr class='a'><th>ABSENT</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee name</th><th>&nbsp;Employee Username</th></tr>");
				while (rs.next()) {
				
					s2 = rs.getString("date");
					ch=new SimpleDateFormat("dd-MM-yyyy").parse(s2);	
					if( ch.equals(min))
					{
						if(rs.getString("empdesignation").equalsIgnoreCase(s))
						{
							c=1;
							out.println("<tr class='a' > <td><input type='checkbox' name='chkemp[]' value="+ rs.getInt("emp_attid") +"></td><td>&nbsp;&nbsp;&nbsp;" + rs.getString("empname") + "</td><td>"
									+ rs.getString("empusername") + "</td></tr>");
						}
					}
					

				}
				if(c==1)
				{
					out.println("<tr class='a'><td ><input type='checkbox' name='chkall' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td><td></td></tr>");
					
				}
				else
				{
					out.println("<tr class='a'><td colspan='3'>No Employees Found</td></tr>");
				}
				


			} catch (Exception e) {
				e.printStackTrace();
			}

		   
		   
		}
	%>

</body>
</html>