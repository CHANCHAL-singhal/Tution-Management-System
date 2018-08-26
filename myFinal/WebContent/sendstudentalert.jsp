
<%@page import="com.dao.employeedao"%>
<%@page import="com.bean.batch"%>
<%@page import="com.dao.BatchDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Course1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Coursedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Alert</title>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />
<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationalerts.js"></script>


<script type="text/javascript">
	var request = new XMLHttpRequest();

	function fetchstu(str) {
		var request = new XMLHttpRequest();
		var url = "getstudents.jsp?val=" + str;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById("ab").innerHTML = val;
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



	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<%
		employee1 e = null;
		if (session != null) {
			if (session.getAttribute("e") != null) {
				e = (employee1) session.getAttribute("e");
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
		} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	%>


	<%
		BatchDao sdao = new BatchDao();
		List<batch> list1 = sdao.getAllbatch(e);
	%>
	
	<h1>Student Alerts</h1>
	<br>
	<div class="w3l-main">
		<div class="w3l-from">


		<form method="post" name="batchalert" action="alertsController" id="alertstu">
		<label class="head">	
		Batch : 
		</label>
		
		<select name="batch" onchange="fetchstu(this.value);" 	class="dropdowncss">
			<option value="">--Select Batch--</option>
			<%
				for (batch b : list1) {
			%>

			<option value="<%=b.getBatch_id()%>">
				<%=b.getBatch_name()%>(<%=b.getCname()%>)</option>
			<%
				}
			%>

		</select> 
		
		
		<div class="w3l-user">
		<label class="head">
		Student :  
		</label>
		<select name="student" id="ab" class="dropdowncss">
			<option value="">--Select Student--</option>

		</select>
		</div>
		
		<div class="w3l-user">
		<label class="head">
		 Subject : 
		 </label>
		 <input type="text" name="subject">
		</div>
		
		<div class="w3l-user">
		<label class="head">
		Header : 
		</label>
		<input type="text" name="header"> 
		
		</div>
		
		<div class="w3l-user">
		<label class="head">
		Message :
		</label>
		<textarea rows="15" cols="90" name="message"></textarea>
		</div>
		
		<p class="btn-group">
				<center>
					<div class="btn">
 <input type="submit" name="action" value="Send Student Alert">
			</div>
				</center>
				</p>
</form>
</div>
</div>



	
	<br />
	<br />



</body>
</html>

<jsp:include page="footer.jsp" />
