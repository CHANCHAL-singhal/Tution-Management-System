
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%

String str=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	String sql="select * from course where cid ='"+str+"'";
	
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	
	if(rs.next())
	{
			String s1=rs.getString("cfees");
			%>
			<%=s1 %>

			<%
	}

}catch(Exception e)
{
	e.printStackTrace();
}


}

%>