 <%@page import="com.bean.Fees1"%>
<%@page import="com.dao.Feesdao"%>
<%@page import="com.bean.exam_master"%>
<%@page import="com.dao.ExamDao"%>
<%@page import="com.dao.employeedao"%>
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
<title>All Exam</title>


<!-- table css -->
	<link rel="stylesheet" type="text/css" href="tablecss/css1.css">

<!-- 
<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>
 -->
 
 
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

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
<br>
<!-- <form name="frm" method="post">
	<b>&nbsp;Search  Here: </b><input type="text" name="cname" onkeyup="searchInfo();" placeholder="Enter Course or Subject name" size="25">
	<span id="tops"></span>
</form> -->		
		
<%
		Feesdao fdao = new Feesdao();
		List<Fees1> list1=fdao.getAllFees();
%>

<center><caption><b><font color="blue" size="5">All Exams</font></b></caption></center>
<br>
<table   cellpadding="10"  id="example" class="display">
<thead>
	<tr>
		<th>Student Name</th>
		<th>Total Fees</th>
		<th>Paid</th>
		<th>Remaining</th>
		<th>Payment Type</th>
		<th>Payment Detail</th>
		<th>Installment</th>
		<th>Amount</th>
		<th>Date</th>
		<th>Receipt</th>
		</tr>
</thead>
<tbody>
<%
 	
	
		for(Fees1 s:list1)
		{
			
	%>
	<tr>
		<td><center><%=s.getSname() %></center></td>
		<td><b><%=s.getTotalfees()%></b></td>
		<td><%=s.getPaid() %></td>
		<td><%=s.getRemaining()%></td>
		<td><%=s.getPtype() %></td>
		<td><%=s.getPdetail()%></td>
		<td><%=s.getInstallment()%></td>
		<td><%=s.getAmount()%></td>
		<td><%=s.getDate()%></td>
		<td><center>	
		<form name="edit" action="receipt.jsp" method="post">
			<input type="hidden" value="<%=s.getFid()%>" name="fid">
			<input type="hidden" value="<%=s.getSid()%>" name="sid">
			
			<input type="hidden" value="<%=s.getSname()%>" name="sname">
			<input type="hidden" value="<%=s.getAmount()%>" name="ammount">
			<input type="hidden" value="<%=s.getDate()%>" name="date">
			 <input type="hidden" value="<%=s.getInstallment()%>" name="installment">
			<input type="hidden" value="<%=s.getPtype()%>" name="ptype">
			<input type="hidden" value="<%=s.getPdetail()%>" name="pdetail">
			
			
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Exam Report">
          	<span class="glyphicon glyphicon-new-window" ></span>
			</form></center></td>
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
 <jsp:include page="datatable.jsp"/>
 