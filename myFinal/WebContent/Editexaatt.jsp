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
		int eid=Integer.parseInt(str);
		String url = pageContext.getServletContext().getInitParameter("url");
		String password = pageContext.getServletContext().getInitParameter("password");



		if (!str.equalsIgnoreCase("")) {
		 	
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				int cnt=0;
				String sql="select * from exam_attendance where exa_id = ?";
				PreparedStatement stmt=conn.prepareStatement(sql);
				stmt.setInt(1, eid);
				
				ResultSet rs=stmt.executeQuery();
				
				sql="select * from student where stuid = ?";
				 stmt=conn.prepareStatement(sql);
				
				 out.println("<tr class='a'><th>PRESENT</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Name</th></tr>");
					while (rs.next()) {
						
						stmt.setInt(1, rs.getInt("stuid"));		
						ResultSet rs1=stmt.executeQuery();
						String stuname=null;
						cnt=1;
						if(rs1.next())
						{
							
							stuname=rs1.getString("stuname");
						}
						
						out.println("<tr class='a' > <td><input type='checkbox' name='chkstu[]' value="+ rs.getInt("stuid") +"></td><td>&nbsp;&nbsp;&nbsp;" 
								+ stuname + "</td></tr>");					
						
					}
					if(cnt==1)
					{
						out.println("<tr class='a'><td ><input type='checkbox' name='chkall' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td></tr>");
						
					}
					else
					{
						out.println("<tr class='a'><td colspan='2'>No Students Found OR All Are Absent</td></tr>");
					}
				 
				 
	

			} catch (Exception e) {
				e.printStackTrace();
			}

		   
		   
		}
	%>

</body>
</html>