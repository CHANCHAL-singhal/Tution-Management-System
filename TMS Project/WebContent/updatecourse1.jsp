<%@page import="com.bean.Course1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Coursedao"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update course</title>


<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>


<script type="text/javascript">  

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

		
<%
		Coursedao sdao=new Coursedao();
		List<Course1> list=sdao.getAllCourse();
%>
<center><caption><b>Edit Course Details</b></caption></center>

<table   cellpadding="10" class="display" id="ab">
<thead>
		<tr>
		<th class="header headerSortUp">ID</th>
		<th class="header">COURSE NAME</th>
		<th class="header">COURSE FEES</th>
		<th class="header">COURSE SUBJECTS</th>
		<th class="header">EDIT</th>
		</tr>
	</thead>
	<tbody>
<%
		for(Course1 s:list)
		{
	%>
	<tr >
		<td><%=s.getCid() %></td>
		<td><%=s.getCname()%></td>
		<td><%=s.getCfees()%></td>
		<td><%=s.getCsubjects() %></td>
		
				<td colspan="2">
			<form name="delete" method="post" action="Coursecontroller">
			<input type="hidden" name="cid" value="<%=s.getCid()%>">
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