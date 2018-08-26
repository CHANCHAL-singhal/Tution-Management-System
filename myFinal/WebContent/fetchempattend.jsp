<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String str=request.getParameter("id");
	String str2=request.getParameter("v");
	String str3 =request.getParameter("val");
	String str4 =request.getParameter("sal");
	int month=Integer.parseInt(str3);
	int year=Integer.parseInt(str2);
    Calendar cal= Calendar.getInstance();
    cal.set(year, month, 1);
/*     System.out.println(cal.get(Calendar.YEAR)+ "-0" + (cal.get(Calendar.MONTH)+1) + "-" + cal.getActualMaximum(Calendar.DATE));	
	System.out.println(cal.get(Calendar.YEAR)+ "-0" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DATE));
 */	str2 = cal.get(Calendar.YEAR)+ "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.get(Calendar.DATE);
	str3 = cal.get(Calendar.YEAR)+ "-" + (cal.get(Calendar.MONTH)+1) + "-" + cal.getActualMaximum(Calendar.DATE);
	String url = pageContext.getServletContext().getInitParameter("url");
	String password = pageContext.getServletContext().getInitParameter("password");

if(!str.equalsIgnoreCase(""))
{
/* 	System.out.println(str +  " sd=" + str2 + "ed" + str3); */
	int id=Integer.parseInt(str); 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection(url,"root",password);
	
	Date d = new SimpleDateFormat("yyyy-MM-dd").parse(str2);
	Date d1 = new SimpleDateFormat("yyyy-MM-dd").parse(str3); 
 	int sal = Integer.parseInt(str4);
/*  	System.out.println(" sd=" + d + "ed" + d1); */
 	long days = ChronoUnit.DAYS.between(d.toInstant(),d1.toInstant());
 	int tdays= (int) days;
 	tdays = tdays + 1;
 	int nsal = sal/tdays;
 	if(tdays>0)
 	{
	String sql="select * from employee_attendence  where empid =" + id  ;
	PreparedStatement stmt=conn.prepareStatement(sql);
	ResultSet rs=stmt.executeQuery();
	int count=0;	
	
    while(rs.next())
    {
    	String date1 = rs.getString("date");
    	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(date1);
		if((date.after(d) && (date.before(d1))) || (date.equals(d)) || date.equals(d1))
    	{
  		count++;
    	}
    
	}
    
    int salary = count*nsal;
    String s=String.join("-",Integer.toString(count),Integer.toString(salary));
    System.out.println(s);
    out.println(s);
 	}
 	else
 	{
 		out.println("Enter Proper Date");	
 	}

		} catch (Exception e) {
			e.printStackTrace();
		}

	} else {
		out.println(" ");
	}
%>



