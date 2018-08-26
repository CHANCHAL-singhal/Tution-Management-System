<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Stock</title>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />

 <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationpro.js"></script>

<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- js -->
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">


<style type="text/css">
select {
	width: 50px;
}
</style>

<script type="text/javascript">


var request = new XMLHttpRequest();
function showSubject(str) {
		  var url = "fetchsttype.jsp?val=" + str;
			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;
						document.getElementById("sub").innerHTML=val;
					}

				}
				request.open("GET", url, true);
				request.send();
				
			} catch (e) {
				alert("Unable to connect to server");
			}
}



function showCourse(str) {
	
	var request = new XMLHttpRequest();
		  var url = "fetchcourse.jsp?val=" + str;
			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;
						document.getElementById("subject").innerHTML=val;
					}

				}
				request.open("GET", url, true);
				request.send();
				
			} catch (e) {
				alert("Unable to connect to server");
			}
}



</script>

</head>
<body>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'

		var="DB" />
	<sql:query var="Rec" dataSource="${DB}">

select * from subject;
</sql:query>
	<sql:query var="cou" dataSource="${DB}">

select * from course;
</sql:query>

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
	<br>
	<h1>
		<b><font color="white">Add New Product</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">

			<form action="Stockcontroller" method="post" id="newpro">
				<input type="hidden" name="stid">
				<div class="w3l-user">
					<label class="head"> Name</label> <input name="stname" type="text">
				</div>



				<div class="w3l-user">
					<label class="head"> Quantity</label> <input name="stquantity"
						type="number">
				</div>

				<label class="head"> Stock Type </label>
				 <select name="sttype"	onchange="showSubject(this.value);" class="dropdowncss">
					<option value="">--Select Type--</option>
					<option value="Stationary">Stationary Stock</option>
					<option value="Study">Study Stock</option>
				</select> 
				
				<label class="head"> Subject</label> <select name="stsubject"
					id="sub" onchange="showCourse(this.value);" class="dropdowncss">
					<option value="">--Select Subject--</option>
		 			<option value="other">Other</option>
				</select> 
				
				<label class="head"> Course </label> <select name="stcourse"
					id="subject" class="dropdowncss">
					<option value="">--Select Course--</option>
					<option value="other">Other</option>
				</select>





		<div class="w3l-user">
			<label class="head"> Remarks</label> <input name="stremarks"
				type="text" >
		</div>


		<center>
				<div class="btn">
					<center>
						<input type="submit" value="ADD PRODUCT" name="action">
					</center>
				</div>
				<div class="btn">
					<center>
						<input type="reset" value="RESET" name="reset">
					</center>
				</div>
		</center>

		</form>
	</div>
	</div>

	<br />



	<jsp:include page="footer.jsp" />
</body>

</html>