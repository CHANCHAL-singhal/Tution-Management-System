<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Fees1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Feesdao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Detail</title>

<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<!-- <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"> -->

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">


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

<%
		Feesdao sdao=new Feesdao();
		List<Fees1> list=sdao.getAllFees();
%>

<center><b><font id="cap">Fees Details</font></b></center>
<table  cellpadding="10" id="ab" class="display">
<thead>
	<tr>
		<th class="header headerSortUp">FEES ID</th>
		<th class="header">STUDENT</th>
		<th class="header">FEES</th>
		<th class="header">PAYMENT TYPE</th>
		<th class="header">INSTALLMENT</th>
		<th class="header">AMOUNT</th>
		<th class="header">DATE</th>
		<th class="header">EDIT</th>
	</tr>
</thead>
<tbody>	
<%
		for(Fees1 s:list)
		{
		
	
	%>

	<tr >
		<td><%=s.getFid() %></td>
		<td><%=s.getSid() %></td>
		<td><%=s.getTotalfees() %></td>		
		<td><%=s.getPtype() %></td>
		<td><%=s.getInstallment() %></td>
		<td><%=s.getAmount() %></td>
		<td><%=s.getDate() %></td>
		<td colspan="2">
			<form name="delete" method="post" action="Feescontroller">
			<input type="hidden" name="fid" value="<%=s.getFid()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
        </button>
          &nbsp;&nbsp;
        <button type="submit" class="btn btn-default btn-trash" name="action" id="p" value="Delete">
          <span class="glyphicon glyphicon-trash" ></span>
        </form>
 
       
		</td>
						
		
			 


	</tr>
		
	<%		
		}
	%>
	</tbody>
		
</table>
<br/>

<center><button onclick="myFunction()">Print</button></center>
<br/>


</body>
</html>