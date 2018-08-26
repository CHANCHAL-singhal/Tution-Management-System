<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Attendence</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">


   <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationempatt.js"></script>
   
<script>  
var request=new XMLHttpRequest();  


	function showemployee() {
			
				 var str=document.getElementById("des").value; 
		       	var date = document.frm.date.value;
				 
				
		        var request = new XMLHttpRequest();
					  var url = "editempatt.jsp?d=" + date + "&val=" + str;
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
<br/>
<br/>

	<h1><b><font color="white">Absent Employee</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
							<form action="Emp_attController" method="post" name="frm" id="removeempatt">
								<input type="hidden" name="bid" >
									
				<label class="head">Designation</label>	
							<select  class="dropdowncss" name="designation"  id="des" onchange="showemployee(this.value);">
										<option value="">--Select Designation--</option>
										<option value="Admin">ADMIN</option>
										<option value="Faculty">FACULTY</option>
										<option value="Manager">MANAGER</option>
										<option value="Counsellor">COUNSELLOR</option>
										<option value="Accountant">ACCOUNTANT</option>
			
										</select>
  		
									
									
									
									
									 	<div class="w3l-user">
										<label class="head"> Date</label>
										<input type="date" name="date" id="date" onchange="showemployee(this.value);" style="width : 250px">
										</div>									
								
									
									<div class="w3l-user">
									<label class="head" id="lbls" style="display: none">Employee<span class="w3l-star"> * </span></label>
									</div>
									
									
								<br>
								<br>
									<div style="overflow-x: auto;">
										<table name="Employee" id="emp">
											
										</table>
										<br> <br>
									</div>
								</span>




								<center><div class="w3_agileits_submit" id="addstudent" style="display: none">
								<div class="btn">
										<center>
										<input type="submit" value="REMOVE ATTENDANCE" name="action">
										</center>
									</div>
									<div class="btn">
										<center>
										<input type="reset" value="RESET" name="reset">
										</center>
									</div>
									</div></center>
								</form>
				</div>
				</div>

<br/>
<jsp:include page="footer.jsp"/>
</body>
</html>