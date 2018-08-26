	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
	<%
		String str = request.getParameter("val");
	String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");



		if (!str.equalsIgnoreCase("")) {

			try {
				int bid = Integer.parseInt(str);
				String cname="";
				int cid=0;
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url, "root", password);
				String sql = "select * from student where batchid =" + bid ;

				 PreparedStatement stmt = conn.prepareStatement(sql);
				ResultSet rs = stmt.executeQuery();
 				out.println("<option value='-'>--Select Student--</option>");
				while (rs.next()) {
					out.println("<option value='"+rs.getInt("stuid")+"'>"+rs.getString("stuname")+"</option>");
					
				}
				
				

			} catch (Exception e) {
				e.printStackTrace();
			}

		} 
	%>
