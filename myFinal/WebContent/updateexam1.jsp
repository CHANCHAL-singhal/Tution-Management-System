<%@page import="com.bean.exam_master"%>
<%@page import="com.dao.ExamDao"%>
<%@page import="com.bean.salary"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Salarydao"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salary Details</title>


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
		ExamDao sdao=new ExamDao();
		List<exam_master> list=sdao.getAllexam(e);
%>
<br>
<center><b><font id="cap">Exam Details</font></b></center>
<br>
<table  id="ab" class="display" width="100%">
<thead>
	<tr>
	
		<th class="header headerSortUp"><center>ID</center></th>
		<th class="header"><center>BATCH NAME</center></th>
		<th class="header"><center>DATE</center></th>
		<th class="header"><center>TIME</center></th>
		<th class="header"><center>TOTAL MARKS</center></th>
		<th class="header"><center>PASSING MARKS</center></th>
		<th class="header"><center>EXAM NAME</center></th>
		<th class="header"><center>EDIT - DELETE</center></th>
		
	</tr>

</thead>
<tbody>	
<%

		for(exam_master s:list)
		{
		
	
	%>

	<tr >
		<td><%=s.getExa_id() %></td>
		<td><%= s.getB_name()%></td>		
		<td><%=s.getDate() %></td>
		<td><%=s.getTime() %></td>
		<td><%=s.getTmarks() %></td>
		<td><%=s.getPmarks() %></td>
		<td><%=s.getExa_name()%></td>
		
		<td colspan="2">
			<form name="delete" method="post" action="ExamController">
			<input type="hidden" name="exa_id" value="<%=s.getExa_id()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
        </button>
        &nbsp;&nbsp;
        <button type="submit" class="btn btn-default btn-trash" name="action" id="p" value="Delete">
          <span class="glyphicon glyphicon-trash" ></span>
        </form>
 
       
		</td>				
						
		
			 


	</tr>
		<%-- 
		<td>
			<form name="delete" method="post" action="ActionController">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="Delete">
			</form>
		</td>
 --%>	
	<%		
		}
	%>
	</tbody>
		
</table>
<br/>


</body>
</html>