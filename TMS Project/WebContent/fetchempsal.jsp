
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%

String str=request.getParameter("val");

String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{
	int id=Integer.parseInt(str); 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	String sql="select * from employee where empid ='"+id+"'";
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{	
			
			String s1=rs.getString("empsalary");
			out.println(s1);
	}

}catch(Exception e)
{
	e.printStackTrace();
}


}
else
{
	System.out.println(" ");
}
%>


