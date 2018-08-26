<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		/* System.out.print(date);
		System.out.print(bid+"\n\n"); */
		String url = pageContext.getServletContext().getInitParameter("url");
		String password = pageContext.getServletContext().getInitParameter("password");


		
		if (!str.equalsIgnoreCase("")) {

			if(!date.equalsIgnoreCase(""))
		 	{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql;
				PreparedStatement stmt ;
		
				int c=0;
				sql = "select * from student_attendence where bat_id=? AND date=? AND present=?";
				
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, bid);
				stmt.setString(2, date);
				stmt.setString(3,"present");
				ResultSet rs = stmt.executeQuery();
			
				/* sql="insert into student_attendence(stuid,bat_id,date,present) values(?,?,?,?)";
				stmt = conn.prepareStatement(sql);

				stmt.setInt(2, bid);
				stmt.setString(3,date);
				
				stmt.setString(4, "absent");	
 */				
 				out.println("<tr class='a'><th>ABSENT</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Name</th></tr>");
				while (rs.next()) {
					c=1;
					
					out.println("<tr class='a' > <td><input type='checkbox' name='chkstudent[]' value="+ rs.getInt("stuid") +"></td><td>&nbsp;&nbsp;&nbsp;" 
							+ rs.getString("stuid") + "</td></tr>");


				}
				if(c==1)
				{
					out.println("<tr class='a'><td ><input type='checkbox' name='chkstudent' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td></tr>");
					
				}
				else
				{
					out.println("<tr class='a'><td colspan='2'>Batch is Not Taken or All Student Are Absent On This Date</td></tr>");
				}
	

			} catch (Exception e) {
				e.printStackTrace();
			}

		    } 
		   
		}
	%>
