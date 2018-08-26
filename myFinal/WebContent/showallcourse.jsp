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
<title>All Course</title>


<!-- table css -->

<!-- 
<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script> -->

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />


<script type="text/javascript">


var request=new XMLHttpRequest();  
function searchInfo()
{  
	var cname=document.frm.cname.value;
	var no=document.getElementById('ab');
	var a = document.getElementById('tops');
	var url="ajaxcourse.jsp?val="+cname;  
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
		
		if(cname==null || cname=="")
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
<!-- <form name="frm" method="post">
	<b>&nbsp;Search  Here: </b><input type="text" name="cname" onkeyup="searchInfo();" placeholder="Enter Course or Subject name" size="25">
	<span id="tops"></span>
</form>		 -->
<br>		
<%
		Coursedao sdao=new Coursedao();
		List<Course1> list=sdao.getAllCourse();
%>

<center><caption><b><font color="blue" size="5">All Courses</font></b></caption></center>
<br>
<table   cellpadding="10"  id="example" class="display">
<thead>
	<tr>
		<th>ID</th>
		<th>COURSE NAME</th>
		<th>COURSE FEES</th>
		<th>COURSE DURATION</th>
		<th>SUBJECTS</th>
		<th>REMARKS</th>
		</tr>
</thead>
<tbody>
<%
 	int count=0;
	
		for(Course1 s:list)
		{
	%>
	<tr>
		<td><center><%=s.getCid() %></center></td>
		<td><b><center><%=s.getCname()%></center></b></td>
		<td><center><%=s.getCfees() %></center></td>
		<td><center><%=s.getCduration() %></center></td>
		<td><center><%=s.getCsubjects() %></center></td>
		<td><center><%=s.getCremarks() %></center></td>
		
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
