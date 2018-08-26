<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Attendence</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" /><!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">


<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationempatt.js"></script>

<script>  



var request=new XMLHttpRequest();  


	function showemployee() {
			var s=document.getElementById("lbls");
			
				var str=document.getElementById("des").value;
				var str1=document.getElementById("date").value;
				var addstudent = document.getElementById("addstudent");
				 
				
		        var request = new XMLHttpRequest();
					  var url = "empattendance.jsp?val=" + str +"&date=" + str1;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									document.getElementById("emp").innerHTML=val;
									 if(addstudent.style.display=="none"){
										addstudent.style.display="block";
										
									}
									else{
										addstudent.style.display=="none";
										
									}
									
									
										s.style.display="block";
										
								}

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}

	function selectAll(source) {
		checkboxes = document.getElementsByName('chkemp[]');
		for(var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>


</head>
<body>



	<jsp:include page="header.jsp" />
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
		<br>
	<br>
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
	<br />
	<br />

	<h1><b><font color="white">Add Employee Attendence</font></b></h1>
<br/>
		
<div class="w3l-main">
	<div class="w3l-from">
							<form action="Emp_attController" method="post" name="empatt"
								id="empatt">
								<input type="hidden" name="bid"> 
								
								<!-- <div class="w3l-options2"> -->
								 <label class="head">
										Designation</label>
								 <select name="designation" id="des"
									onchange="showemployee();"  class="dropdowncss">
										<option value="">--Select Designation--</option>
										<option value="admin">ADMIN</option>
										<option value="manager">MANAGER</option>
										<option value="faculty">FACULTY</option>
										<option value="accountant">ACCOUNTANT</option>
										<option value="counsellor">COUNSELLOR</option>

								</select>
								<!-- </div> -->
								<div class="w3l-user">
								 <label class="head">
								 Date</label>
								<input type="date" name="date" id="date" style="width : 250px" onchange="showemployee();">
								</div>
								
								<br> 
								<div class="w3l-user">
								
								 <label class="head" id="lbls" style="display: none">Employee</label>
									
									<div style="overflow-x: auto;">
										<table name="Employee" id="emp">

										</table>
										
										<br> <br>
									</div>
							</div>



								<center>
									<div class="btn" id="addstudent"
										style="display: none">
										<div class="btn">
										<center>
										<input type="submit" value="ADD ATTENDANCE" name="action">
										</center>
										</div>

									</div>
								</center>
							</form>
							</div>
						</div>
		

		<br />
		<jsp:include page="footer.jsp" />
</body>
</html>