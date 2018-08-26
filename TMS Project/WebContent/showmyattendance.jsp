
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
<title>Show My Attendance</title>


<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />

<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">


<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css"
	href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>

<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchInfo() {
		var empname = document.frm.empname.value;
		var no = document.getElementById('ab');
		var a = document.getElementById('tops');
		var url = "ajaxsearch.jsp?val=" + empname;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {

					var val = request.responseText;

					document.getElementById('tops').innerHTML = val;

				}
			}

			request.open("GET", url, true);
			request.send();

			if (empname == null || empname == "") {
				no.style.display = "inline-table";
				no.style.width = "100%";
				a.style.display = "none";
			} else {
				no.style.display = "none";
				a.style.display = "inline-table";
				a.style.width = "100%";
			}

		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function showempattendance() {
		var request = new XMLHttpRequest();
		var emp = document.getElementById("empid").value;
		var sdate = document.getElementById("sdate").value;
		var edate = document.getElementById("edate").value;
		var show = document.getElementById("show").value;

		var url = "empatt.jsp?e=" + emp + "&sdate=" + sdate + "&edate=" + edate + "&show="+ show;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById("ab").innerHTML = val;
					if (search.style.display == "none") {
						search.style.display = "block";

					} else {
						search.style.display == "none";

					}
					if (table.style.display == "none") {
						table.style.display = "block";

					} else {
						table.style.display == "none";

					}
					//document.getElementById("btnnext").style.display = "none";

				}

			}
			request.open("GET", url, true);
			request.send();

		} catch (e) {
			alert("Unable to connect to server");
		}

	}
	$(document).ready(function() {
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


	<%
		} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

	<%
		employeedao edao = new employeedao();
		List<employee1> list = edao.getAllEmployee();
	%>
<div id="search">
				<h4 align="right">
					<font color="white"><%=Calendar.getInstance().getTime()%></font>
				</h4>
			</div>

	<h1>
		<b><font color="white"> My Attendance</font></b>
	</h1>
	<br />
<br>
	<div class="w3l-main">
		<div class="w3l-from">
				<form name="frm" >
						<input type="hidden"  id="empid" value="<%=e.getEmpid() %>">
									<div class="w3l-details1">
						<div class="w3l-num">
						<label class="head">Start Date</label>
						<input type="date" name="sdate" id="sdate" style="width : 320px">

					
					</div>

							<div class="w3l-sym">
						<label class="head" >
						End Date</label>
						<input type="date" name="edate" id="edate" style="width : 320px">
					
					</div>
					</div>
					<label class="head"> Show </label> <select name="show" id="show" class="dropdowncss">
					<option value="">--Select What You Want to Show--</option>
					<option value="present">Present</option>
					<!-- <option value="absent">Absent</option> -->
				</select> 
					<center>
										<div class="btn">
										<input type="button"  name="btnnext" value="Next" onclick="showempattendance();" id="btnnext"/>
										
										</div>
							</center>
					
				</form>
				</div>
				</div>
			<br>
			<br>
			<div style="display: none" id="table">

				<center>
					<caption>
						<h3><b><font color="white">Show My Attendance</font></b></h3>
					</caption>
				</center>
				<table cellpadding="10" id="ab" class="display">
</table>
			</div>

	<br><br>

</body>
</html>

<jsp:include page="footer.jsp" />
