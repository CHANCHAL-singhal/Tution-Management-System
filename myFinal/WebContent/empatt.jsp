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
		String empid = request.getParameter("e");
	    String sdate = request.getParameter("sdate");
	    String edate = request.getParameter("edate");
	    String show = request.getParameter("show");
	    /* Date min,max;
	    min=new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
	    max=new SimpleDateFormat("yyyy-MM-dd").parse(edate); */
	    int eid=Integer.parseInt(empid);
		if (!empid.equalsIgnoreCase("")) {
		 	if(!sdate.equalsIgnoreCase(""))
		 	{
		 		if(!sdate.equalsIgnoreCase(""))
		 		{
		 	try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tms", "root", "root");
				String sql="";
				PreparedStatement stmt;
				ResultSet rs=null;
				if(show.equalsIgnoreCase("absent"))
				{
					sql = "SET @i = -1; "+
							" t1.da FROM (SELECT DATE(ADDDATE('2018-03-01', INTERVAL @i:=@i+1 DAY)) AS 'da' FROM information_schema.tables "
							+ " HAVING " 
							+ " @i < DATEDIFF( ? , ? )) AS t1 "
							+ " LEFT JOIN "
									+ " (SELECT tms.employee_attendence.date  AS 'da' "
								+ " FROM tms.`employee_attendence` " 
								+ " WHERE tms.employee_attendence.date BETWEEN ? AND ? AND tms.employee_attendence.empid=?) AS t2 "
								+ " ON t1.da!=t2.da "	
										+ " GROUP BY "
												+ " t1.da "
														+ "	HAVING "
																+ " COUNT(t1.da)>2;";
					stmt = conn.prepareStatement(sql);
					 //stmt.setString(1, sdate);
					 stmt.setString(1, edate);
					 stmt.setString(2, sdate);
					 stmt.setString(3, sdate);
					 stmt.setString(4, edate);
					 stmt.setInt(5, eid);
					 rs = stmt.executeQuery();
				}
				else{
					 sql = "SELECT tms.employee_attendence.date  AS 'da' "
								+"FROM tms.employee_attendence " 
								+"WHERE tms.employee_attendence.date BETWEEN ? AND ? AND tms.employee_attendence.empid=?;";
					 stmt = conn.prepareStatement(sql);
					 stmt.setString(1, sdate);
					 stmt.setString(2, edate);
				//	 stmt.setString(2, edate);
					 stmt.setInt(3, eid);
					 rs = stmt.executeQuery();
				}
				
/* 				 stmt = conn.prepareStatement(sql);
				stmt.setInt(1, eid);
				 rs = stmt.executeQuery();
 */				
				
				 out.println("<thead><th><center>Date</center></th><th><center>Status</center></th></thead>");
				 out.println("<tbody>"); 
				while (rs.next()) {
				
						
					out.println("<tr><td>" + rs.getString("da") + " </td><td>  Present </td></tr>" );
				}
			 	out.println("</tbody>");
 
			} catch (Exception e) {
				e.printStackTrace();
			}

		    } 
		   
		}
		}
	%>
    