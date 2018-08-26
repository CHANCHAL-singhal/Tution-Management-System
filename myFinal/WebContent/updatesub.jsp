<%@page import="com.bean.employee1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Subjectdao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.subject"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />
<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Studies Plus Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--js-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--js-->
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Cagliostro' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--webfonts-->


<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<!-- <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"> -->

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">

<!--
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/jqueryjar/jquery-latest.js"></script> 
<script type="text/javascript" src="/js/tablejs/sortjs.js"></script> -->
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 


<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>



<script type="text/javascript">

var request=new XMLHttpRequest();  




$(document).ready(function(){
    $('#ab').DataTable();
});

function myFunction() {
    window.print();
}

</script>  


</head>
<body>
		
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%
	employee1 e=null;
	if(session!=null)
	{
		if(session.getAttribute("e")!=null)
		{
			e=(employee1)session.getAttribute("e");
%>



<%
 if(e.getEmpdesignation().equalsIgnoreCase("Admin"))
 {
	 %>
	 <jsp:include page="adminheader.jsp"></jsp:include>
	 <%
 }
 else if(e.getEmpdesignation().equalsIgnoreCase("Faculty"))
 {
	 
 
 %>
 	 <jsp:include page="facultyheader.jsp"></jsp:include>
 
 
 <%} 
 else if(e.getEmpdesignation().equalsIgnoreCase("Counsellor"))
 {
	 
 
 %>
 	 <jsp:include page="coucellorheader.jsp"></jsp:include>
 
 <%}
 else if(e.getEmpdesignation().equalsIgnoreCase("Manager"))
 {

 %>
 	 <jsp:include page="managerheader.jsp"></jsp:include>
 
 <%
 }
 else if(e.getEmpdesignation().equalsIgnoreCase("Accountant"))
 {

 %>
 	 <jsp:include page="accountantheader.jsp"></jsp:include>
 
 <%
 }%>




<%
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
	
	%>

<h4 align="right"><font color="blue"><%=Calendar.getInstance().getTime() %></font></h4>

<%
		Subjectdao sdao=new Subjectdao();
		List<subject> list=sdao.getAllSubject();
%>

<center><b><font id="cap">Subject Details</font></b></center>
<table  cellpadding="10" id="ab" class="display">
<thead>
	<tr>
		<th class="header headerSortUp"><center>ID</center></th>
		<th class="header"><center>NAME</center></th>
		<th class="header"><center>FEES</center></th>
		<th class="header"><center>Course</center></th>
		<th class="header"><center>EDIT</center></th>
					
	</tr>
</thead>
<tbody>	
<%
int count=0;
		for(subject s:list)
		{
		
	
	%>

	<tr >
		<td><%=s.getSid() %></td>
		<td><b><%=s.getS_name() %></b></td>	
	
		<td><%=s.getSfees() %></td>
		<td><%=s.getCname() %></td>
			<td colspan="2">
			<form name="delete" method="post" action="SubjectController">
			<input type="hidden" name="sid" value="<%=s.getSid()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
        </button>
<!--           &nbsp;&nbsp;
        <button type="submit" class="btn btn-default btn-trash" name="action" id="p" value="Delete">
          <span class="glyphicon glyphicon-trash" ></span> -->
        </form>
 
       
		</td>
	
	
	
		</tr>
	
	<%		
		}
	%>
	</tbody>
	</table>
<br/>
	

</body>
</html>