	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" /> 
<link href="css/ajax.css" rel="stylesheet" type="text/css" media="all" />
</head>
</html>
	<%
	String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");


		String str = request.getParameter("val");

		if (!str.equalsIgnoreCase("")) {

			try {
				int bid = Integer.parseInt(str);
				String cname="";
				int cid=0;
				int flag=0,cnt=0;
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql = "select * from student where batchid =" + bid ;
				
				 PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
				/*if (rs.next()) {
					cname=rs.getString("cname");
				}
				
				sql = "select * from course where cname = '" + cname+"'";
				stmt = conn.prepareStatement(sql);
				 rs = stmt.executeQuery();
				 if (rs.next()) {
					cid=rs.getInt("cid");
					}
				
				
				sql = "select * from student where courseid =" + cid;

				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				
*/				out.println("<tr class='a'><th>REMOVE</th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Name</th></tr>");
				
				while (rs.next()) {
					flag=1;
					cnt++;
					
					out.println("<tr class='a' > <td><input type='checkbox' name='chkstudent[]' value="+ rs.getInt("stuid") +"></td><td>&nbsp;&nbsp;&nbsp;" 
							+ rs.getString("stuname") + "</td></tr>");
				
				}
				if(flag==1)
				{
					out.println("<tr class='a'><td ><input type='checkbox' name='chkstudent' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td></tr>");
					out.println("<tr class='a'><td colspan='2'> Total Students :" + cnt + " </td></tr>");
					
				}
				else
				{
					out.println("<tr class='a'><td colspan='2'>No Students Are In This Batch</td></tr>");
				}
				
				
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			out.println(" ");
		}
	%>
