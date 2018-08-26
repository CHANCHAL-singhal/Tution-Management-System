<%@page import="com.bean.employee1"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Stockdao"%>
<%@page import="com.bean.Stock"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STOCK DETAILS</title>

<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<!-- <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"> -->

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">

<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>



<script type="text/javascript">

var request=new XMLHttpRequest();  
function searchInfo()
{  
	var empname=document.frm.empname.value;
	var no=document.getElementById('ab');
	var a = document.getElementById('tops');
	var url="ajaxsearch.jsp?val="+empname;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
						document.getElementById('tops').innerHTML=val; 
				
				
			}  
		}  
		
		request.open("GET",url,true);  
		request.send();
		
		if(empname==null || empname=="")
			{
			no.style.display  = "inline-table";
			no.style.width = "100%";
			a.style.display="none";
			}
		else
			{
		no.style.display  = "none";
		a.style.display = "inline-table";
		a.style.width = "100%";
			}
		
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  
}  




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
		Stockdao sdao=new Stockdao();
		List<Stock> list=sdao.getAllStock();
%>

<center><b><font id="cap">Stock Details</font></b></center>
<table  cellpadding="10" id="ab" class="display">
<thead>
	<tr>
		<th class="header headerSortUp">ID</th>
		<th class="header">NAME</th>
		<th class="header">QUANTITY</th>
		<th class="header">STOCK TYPE</th>
		<th class="header">SUBJECT</th>
		<th class="header">COURSE</th>
		<th class="header">REMARKS</th>
		<th class="header">EDIT</th>
	</tr>
</thead>
<tbody>	
<%

		for(Stock s:list)
		{
		
	
	%>

	<tr >
		<td><%=s.getStid() %></td>
		<td><%=s.getStname() %></td>		
		<td><%=s.getStquantity() %></td>
		<td><%=s.getSttype() %></td>
		<td><%=s.getStsubject() %></td>
		<td><%=s.getStcourse() %></td>
		<td><%=s.getStremarks() %></td>
		<td colspan="2">
			<form name="delete" method="post" action="Stockcontroller">
			<input type="hidden" name="stid" value="<%=s.getStid()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
        </button>
<!--         &nbsp;&nbsp;
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

<center><button onclick="myFunction()">Print</button></center>
<br/>

</body>
</html>