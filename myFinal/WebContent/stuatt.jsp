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
		String stuid = request.getParameter("stu");
	    String sdate = request.getParameter("sdate");
	    String edate = request.getParameter("edate");
	    String show = request.getParameter("show");
	    Date min,max;
	    min=new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
	    max=new SimpleDateFormat("yyyy-MM-dd").parse(edate);
	    int sid=Integer.parseInt(stuid);
		if (!stuid.equalsIgnoreCase("")) {
		 	if(!sdate.equalsIgnoreCase(""))
		 	{
		 		if(!sdate.equalsIgnoreCase(""))
		 		{
		 	try {
		 		int cnt=0;
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tms", "root", "root");
				String sql="";
				PreparedStatement stmt;
				ResultSet rs;
				if(show.equalsIgnoreCase("present") || show.equalsIgnoreCase("absent"))
				{
				 sql = "select * from student_attendence where stuid=? AND present=?";
				 stmt = conn.prepareStatement(sql);
				stmt.setInt(1, sid);
				stmt.setString(2, show);
				rs = stmt.executeQuery();
				}
				else
				{

					 sql = "select * from student_attendence where stuid=? ";
					 stmt = conn.prepareStatement(sql);
					stmt.setInt(1, sid);
					rs = stmt.executeQuery();
				}
				
				
				out.println("<thead><th><center>Student Attendance Id</center></th><th><center>Batch Id</center></th><th><center>Date</center></th><th><center>Status</center></th></thead>");
				 out.println("<tbody>");
				while (rs.next()) {
					Date d=new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("date"));
							
					if((d.after(min) && d.before(max))|| d.equals(min) || d.equals(max))
					{
						cnt=1;
					out.println("<tr><td>" + rs.getInt("stu_attid") + "</td><td>&nbsp;&nbsp;"+rs.getString("bat_id")+"</td><td>&nbsp;&nbsp;"
							+ rs.getString("date") + "</td>"+"<td>&nbsp;&nbsp;"+rs.getString("present")+"</td></tr>");
				}
				}
				if(cnt==0)
				{
					out.println("<tr><td colspan='4'> No Student Attendance Found</td></tr>");
				}
				out.println("</tbody>");

			} catch (Exception e) {
				//e.printStackTrace();
			}

		    } 
		   
		}
		}
	%>
