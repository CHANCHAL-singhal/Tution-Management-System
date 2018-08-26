<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Stock"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Stockdao"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STOCK DETAILS</title>



<!-- table css --><!-- 
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>
 -->
 
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

function myFunction() {
    window.print();
}

</script>  


</head>
<body>

<jsp:include page="header.jsp"/>	
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


<%
		Stockdao sdao=new Stockdao();
		List<Stock> list=sdao.getAllStock();
%>

<center><b><font color="blue" size="5">Stock Details</font></b></center>
<br>
<table  cellpadding="10" id="example" class="display">
<thead>
	<tr>
			<th class="header headerSortUp"><center>ID</center></th>
		<th class="header"><center>NAME</center></th>
		<th class="header"><center>QUANTITY</center></th>
		<th class="header"><center>STOCK TYPE</center></th>
		<th class="header"><center>SUBJECT</center></th>
		<th class="header"><center>COURSE</center></th>
		<th class="header"><center>REMARKS</center></th>
	</tr>
</thead>
<tbody>	
<%
int count=0;
		for(Stock s:list)
		{
		
	
	%>

	<tr >
		<td><center><%=s.getStid() %></center></td>
		<td><b><center><%=s.getStname() %></center></b></td>	
		<%
		 if(s.getStquantity().equals("3") || s.getStquantity().equals("2") || s.getStquantity().equals("1") || s.getStquantity().equals("0"))
		 {
		%>	
		<td><center><font color="red"><%=s.getStquantity() %></font></center></td>
		<%
		 }
		else
		{
		%>
		<td><center><%=s.getStquantity() %></center></td>
		<%
		}
		%>
		<td><center><%=s.getSttype() %></center></td>
		<td><center><%=s.getStsubject() %></center></td>
		<td><center><%=s.getStcourse() %></center></td>
		<td><center><%=s.getStremarks() %></center></td>
						
		</tr>
			 

	<%		
		}
	%>
	</tbody>
		
</table>
<br/>

<center><button onclick="myFunction()">Print</button></center>
<br/>

<jsp:include page="footer.jsp"/>
 <jsp:include page="datatable.jsp"/>
</body>
</html>