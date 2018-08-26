\ <%@page import="com.dao.employeedao"%>
<%@page import="com.bean.batch"%>
<%@page import="com.dao.BatchDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Course1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Coursedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Batch</title>


<!-- table css -->
	<link rel="stylesheet" type="text/css" href="tablecss/css1.css">


<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>

<script type="text/javascript">


var request=new XMLHttpRequest();  

$(document).ready(function(){
    $('#ab').DataTable();
});
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
 <br><br>


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
<form name="frm" method="post">
	<b>&nbsp;Search  Here: </b><input type="text" name="cname" onkeyup="searchInfo();" placeholder="Enter Course or Subject name" size="25">
	<span id="tops"></span>
</form>		
		
<%
		BatchDao sdao=new BatchDao();
		List<batch> list1=sdao.getAllbatch(e);
		employeedao edao=new employeedao();
%>

<center><caption><b>All Batches</b></caption></center>
<table   cellpadding="10"  id="ab" class="display">
<thead>
	<tr>
		<th>Batch Id</th>
		<th>Batch Name</th>
		<th>Start Time</th>
		<th>End Time</th>
		<th>Faculty Name</th>
		<th>Subject Name</th>
		<th>Course Name</th>
		<th>Start Date</th>
		<th>Edit</th>
		</tr>
</thead>
<tbody>
<%
 	
	
		for(batch s:list1)
		{
			int eid=s.getEmp_id();
			String name = edao.getEmployeeNameById(eid);
	%>
	<tr>
		<td><%=s.getBatch_id() %></td>
		<td><b><%=s.getBatch_name()%></b></td>
		<td><%=s.getStart_time() %></td>
		<td><%=s.getEnd_time() %></td>
		<td><%=name %></td>
		<td><%=s.getS_name() %></td>
		<td><%=s.getCname() %></td>
		<td><%=s.getSdate() %></td>
		<td>
		<form name="edit" method="post" action="BatchController">
			<input type="hidden" name="batch_id" value="<%=s.getBatch_id()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
		
	<%-- 		<form name="edit" action="BatchController" method="post">
			<input type="hidden" value="<%=s.getBatch_id()%>" name="batch_id"> 
			<input type="submit" value="Edit" name="action"> 
	 --%>		
			
			</form>		</td>
 </tr>
	<%		
		}
	%>
	 </tbody>	
</table>
<br/>
<br/>
	


</body>
</html>

<jsp:include page="footer.jsp"/>
 