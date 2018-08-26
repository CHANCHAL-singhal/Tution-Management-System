<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.employeedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Employee</title>
   

<!-- table css -->
<!-- <link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>
 -->
 
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />

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
	<b>Search  Here: </b><input type="text" name="empname" onkeyup="searchInfo();" placeholder="Enter Name or Username" size="25">
	<span id="tops"></span>
</form> -->
	
<!-- <select name="sort" onchange="sortTable()">SORT
<option value="select">Select</option>
<option value="name">BY NAME</option>
</select>
	 -->

<%
		employeedao sdao=new employeedao();
		List<employee1> list=sdao.getAllEmployee();
		
%>

<center><b><font color="blue" size="5">All Employees</font></b></center>
<br>
<table  cellpadding="10" id="example" class="display">
<thead>
	<tr>
		<th ><center>ID</center></th>
		<th ><center>USERNAME</center></th>
		<th ><center>NAME</center></th>
		<th ><center>MOBILE</center></th>
		<!-- <th ><center>EMAIL</center></th> -->
		<th ><center>DESIGNATION</center></th>
		<th ><center>SALARY</center></th>
		<th><center>SALARY REPORT</center></th>
		<th><center>FULL DETAIL</center></th>
	</tr>
</thead>
<tbody>	
<%
int count=0;
		for(employee1 s:list)
		{
		
	
	%>

	<tr >
		<td><center><%=s.getEmpid() %></center></td>
		<td><center><%=s.getEmpusername()%></center></td>
		
		<td><center><%=s.getEmpname() %></center></td>
		<td><center><%=s.getEmpmobile() %></center></td>
		<%-- <td><center><%=s.getEmpemail() %></center></td> --%>
		<td><center><%=s.getEmpdesignation()%></center></td>
		<td><center><%=s.getEmpsalary() %></center></td>
		<td><center>	
		<form name="edit" action="salaryreport.jsp" method="post">
			<input type="hidden" value="<%=s.getEmpid()%>" name="eid"> 
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Attendance">
          	<span class="glyphicon glyphicon-new-window" ></span>
			</form></center></td>
		<td><center>	
		<form name="edit" action="empfulldetail.jsp" method="post">
			<input type="hidden" value="<%=s.getEmpid()%>" name="empid"> 
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Detail">
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


 <jsp:include page="footer.jsp"/> 

</body>
</html> 
 <jsp:include page="datatable.jsp"/>