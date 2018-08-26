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

String str=request.getParameter("val");
String url = pageContext.getServletContext().getInitParameter("url");
String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{
	
	int eid=Integer.parseInt(str);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	int c=0;	
		

	
	
	String s="present";
	/* String sql="select * from exam_attendance e, student s where e.exa_id =? and e.present = ? and e.stuid=s.stuid"; */
	String sql ="SELECT * FROM exam_attendance e INNER JOIN student s  ON e.stuid=s.stuid INNER JOIN exam_master em ON em.exa_id=e.exa_id WHERE e.exa_id =? AND e.present =?";
	PreparedStatement stmt=conn.prepareStatement(sql);
	stmt.setInt(1, eid);
	stmt.setString(2, s);
	 ResultSet rs=stmt.executeQuery();
	
		 //if(rs.next())
		 //{
		/* out.println("<option value=''>"+"--Select Student--"+"</option> ");
		out.println("<option value='"+rs.getInt("stuid")+"'>"+rs.getString("stuname")+"</option> ");
		System.out.println(rs.getInt("stuid"));
		while(rs.next())
			{
			out.println("<option value='"+rs.getInt("stuid")+"'>"+rs.getString("stuid")+"</option> ");
			System.out.println(rs.getInt("stuid"));
			}
		 }
		 else
		 {
			 out.println("<option value=''>"+"--No Students--"+"</option> ");
		 }
		  */
		 
		 out.println("<tr class='a'><th>Enter Student Marks </th><th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Student Name</th></tr>");
			while (rs.next()) {
			/* 	stmt.setInt(1, rs.getInt("stuid"));
				stmt.executeUpdate(); 
				onblur='require(this.value)'
				*/
				c=1;				
				
				out.println("<tr class='a' > <td><input type='text' id='a'  max = "+ rs.getInt("tmarks") +" min='0' name='add"+rs.getInt("stuid")+"' value="+ rs.getInt("ob_marks") +" required></td>	<td>&nbsp;&nbsp;&nbsp;" 
				+ rs.getString("stuname") + "</td></tr>");
			}
			 if(c==1)
			{
				//out.println("<tr class='a'><td ><input type='text' name='chkstudent' value='0' onClick='selectAll(this);'></div></td><td>SELECT ALL</td></tr>");
				
			}
			else
			{
				out.println("<tr class='a'><td colspan='2'>No Students Found</td></tr>");
			} 
	//}

	
}
catch(Exception e)
{
	e.printStackTrace();
}


}

%>

</body>
</html>