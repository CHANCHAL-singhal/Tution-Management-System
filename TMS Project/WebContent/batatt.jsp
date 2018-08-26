<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.awt.Checkbox"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
		String batid = request.getParameter("e");
	    String sdate = request.getParameter("sdate");
	    String edate = request.getParameter("edate");
	    String url = pageContext.getServletContext().getInitParameter("url");
		String password = pageContext.getServletContext().getInitParameter("password");
 
	    Date min,max;
	    min=new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
	    max=new SimpleDateFormat("yyyy-MM-dd").parse(edate);
	    int bid=Integer.parseInt(batid);
		if (!batid.equalsIgnoreCase("")) {
		 	if(!sdate.equalsIgnoreCase(""))
		 	{
		 		if(!sdate.equalsIgnoreCase(""))
		 		{
		 	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql = "select * from batch_attendance where batch_id=?";
				PreparedStatement stmt = conn.prepareStatement(sql);
				stmt.setInt(1, bid);
				ResultSet rs = stmt.executeQuery();
				
				
				out.println("<thead><th><center>Batch Attendance Id</center></th><th><center>Batch Id</center></th><th><center>Date</center></th><th><center>Status</center></th></thead>");
				 out.println("<tbody>");
				while (rs.next()) {
					Date d=new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("date"));
							
					if((d.after(min) && d.before(max))|| d.equals(min) || d.equals(max))
					{
						
						
						out.println("<tr><td>" + rs.getInt("batch_attid") + "</td><td>&nbsp;&nbsp;"+rs.getString("batch_id")+"</td><td>&nbsp;&nbsp;"
								+ rs.getString("date") + "</td>"+"<td>&nbsp;&nbsp;"+rs.getString("status")+"</td></tr>");
					
						
				}
				}
				out.println("</tbody>");

			} catch (Exception e) {
				e.printStackTrace();
			}

		    } 
		   
		}
		}
	%>
    