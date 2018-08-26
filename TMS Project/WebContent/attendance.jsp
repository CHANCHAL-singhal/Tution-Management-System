<%@page import="java.awt.Checkbox"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<html>
<head>
<link href="css/ajax.css" rel="stylesheet" type="text/css" media="all" />
</head>
</html>
	<%
		String str = request.getParameter("val");
		int bid=Integer.parseInt(str);
	    String date = request.getParameter("date");
		
	    String url = pageContext.getServletContext().getInitParameter("url");
		String password = pageContext.getServletContext().getInitParameter("password");



	
		if (!str.equalsIgnoreCase("")) {
		 	if(!date.equalsIgnoreCase(""))
		 	{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				int c=0;
				String sql="select * from batch_attendance where date = ?  and batch_id= ? ";
				PreparedStatement stmt = conn.prepareStatement(sql);
				
				stmt.setInt(2, bid);
				stmt.setString(1,date);
				
				 ResultSet rs=stmt.executeQuery();
				if(!rs.next())
				{
				 sql = "insert into batch_attendance(batch_id,date,status) values(?,?,?)";
					 stmt = conn.prepareStatement(sql);
				
				stmt.setInt(1, bid);
				stmt.setString(2,date);
				stmt.setString(3,"Taken");
				
				stmt.executeUpdate();
				}
				
				sql = "select * from student where batchid=" + bid ;

				stmt = conn.prepareStatement(sql);
				 rs = stmt.executeQuery();
			
				sql="insert into student_attendence(stuid,bat_id,date,present) values(?,?,?,?)";
				stmt = conn.prepareStatement(sql);

				stmt.setInt(2, bid);
				stmt.setString(3,date);
				
				stmt.setString(4, "absent");	
				
				out.println("<tr class='a'><th>PRESENT</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Name</th></tr>");
				while (rs.next()) {
					stmt.setInt(1, rs.getInt("stuid"));
					stmt.executeUpdate();
					c=1;				
	
					out.println("<tr class='a' > <td><input type='checkbox' name='chkstudent[]' value="+ rs.getInt("stuid") +"></td><td>&nbsp;&nbsp;&nbsp;" 
					+ rs.getString("stuname") + "</td></tr>");
				}
				if(c==1)
				{
					out.println("<tr class='a'><td ><input type='checkbox' name='chkstudent' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td></tr>");
					
				}
				else
				{
					out.println("<tr class='a'><td colspan='2'>No Students Found</td></tr>");
				}
	
				
				
				
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}

		    } 
		   
		}
	%>
