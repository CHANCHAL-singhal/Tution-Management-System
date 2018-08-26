<%@page import="com.bean.exam_master"%>
<%@page import="com.dao.ExamDao"%>
<%@page import="com.bean.batch"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>

<%@page import="com.bean.Course1"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Exam Attendance</title>


<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>

<script type="text/javascript">
var request = new XMLHttpRequest();


function showexaattendance()
{
	var request = new XMLHttpRequest();
	var exa=document.getElementById("exaid").value;
	  var url = "exaatt.jsp?exa="+exa;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById("ab").innerHTML=val;
					if(search.style.display=="none"){
						search.style.display="block";
						
					}
					else{
						search.style.display=="none";
						
					}
					if(table.style.display=="none"){
						table.style.display="block";
						
					}
					else{
						table.style.display=="none";
						
					}
						
				}

			}
			request.open("GET", url, true);
			request.send();
			
		} catch (e) {
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

<%
		ExamDao edao=new ExamDao();
		List<exam_master> list=edao.getAllexam(e);
%>
<div id="search">
<h4 align="right"><font color="white"><%=Calendar.getInstance().getTime() %></font></h4>
		
</div>

	<h1>
		<b><font color="white">Exam Attendance</font></b>
	</h1>
<br>
<div class="w3l-main">
		<div class="w3l-from">
				<form name="frm" >
						
						<div class="w3l-user">
						<label class="head">
					Exam
						</label>
						<select id="exaid" name="exaid" onchange="showexaattendance();" class="dropdowncss">
								<option value="--" name="--">--Select Exam--</option>

		<%
	for(exam_master s:list)
	{
		
		%>
				
				<option value="<%=s.getExa_id() %>">
		<%=s.getExa_name() %>
		</option>
		
		<%
	}
	
	%>
	</select>
	</div>
</form>
</div>
</div>
<br><br>
<div style="display: none" id="table">


		<table cellpadding="10" id="ab" class="display">
			
		</table>
	</div>
<br/>
<br/>


</body>
</html>

<jsp:include page="footer.jsp"/>
 