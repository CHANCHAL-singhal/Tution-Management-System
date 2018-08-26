
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
<title>Show Employee Attendance</title>


<link rel="stylesheet" href="css/jquery-ui.css" />
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationshowatt.js"></script>


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
					document.getElementById("btnnext").style.display = "none";

				}

			}
			request.open("GET", url, true);
			request.send();

		} catch (e) {
			alert("Unable to connect to server");
		}

	}
	
	function da(str) {
		var request = new XMLHttpRequest();
		var sdate = document.getElementById("sdate").value;
		var edate = document.getElementById("edate").value;
		
			if(str != "")
				{
				document.getElementById("d").style.display = "block";
				if(sdate != "" )
				{
				if( edate != "")
					{
				document.getElementById("s").style.display = "block";
				document.frm.show.selectedIndex=0;
				 document.getElementById("table").style.display = "none";

					}
				else
					{
					document.getElementById("s").style.display = "none";
					document.getElementById("table").style.display = "none";

					}
				
				}
			else
				{
				document.getElementById("s").style.display = "none";
				document.getElementById("table").style.display = "none";
				}

				
				}
			else
				{
				document.getElementById("d").style.display = "none";
				document.getElementById("s").style.display = "none";
				 document.frm.show.selectedIndex=0;
				 document.getElementById("table").style.display = "none";

				}
	}
	function sd() {
		var request = new XMLHttpRequest();
		var sdate = document.getElementById("sdate").value;
		var edate = document.getElementById("edate").value;
		
		
			if(sdate != "" )
				{
				if( edate != "")
					{
				document.getElementById("s").style.display = "block";
				 document.frm.show.selectedIndex=0;
				 document.getElementById("table").style.display = "none";

					}
				else
					{
					document.getElementById("s").style.display = "none";
					document.getElementById("table").style.display = "none";
					}
				
				}
			else
				{
				document.getElementById("s").style.display = "none";
				document.getElementById("table").style.display = "none";
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
		<b><font color="white"> Employee Attendance</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">
			<form name="frm" id="showempatt">

				<div class="w3l-user">
					<label class="head"> Employee </label> <select id="empid"
						name="empid" class="dropdowncss" onchange="da(this.value);">
						<option value="">--Select Employee--</option>
						<%
									for (employee1 em : list) {
								%>
						<option value="<%=em.getEmpid()%>">
							<%=em.getEmpname()%>
						</option>

						<%
									}
								%>
					</select>
				</div>

				<div id="d" style="display: none;">

					
						<div class="w3l-num">
							<label class="head">Start Date</label> <input type="date"
								name="sdate" id="sdate" style="width: 250px" onchange="sd();">


						</div>
					
						<div class="w3l-sym">
							<label class="head"> End Date</label> <input type="date"
								name="edate" id="edate" style="width: 250px" onchange="sd();">

						</div>
					
				
			
					<div id="s" style="display: none;">

						<label class="head"> Show </label>
						 <select name="show" id="show" class="dropdowncss" onchange="showempattendance();">
							<option value="0">--Select What You Want to Show--</option>
							<option value="present">Present</option>
							<!-- <option value="absent">Absent</option> -->
						</select>
					</div>
			</div>		
				</div>
			</form>
		</div>
</div>

	<br>
	<br>
	<div style="display: none" id="table">

		<center>
			<caption>
				<h3>
					<b><font color="white">Employee Attendance Report</font></b>
				</h3>
			</caption>
		</center>
		<table cellpadding="10" id="ab" class="display">
		</table>
	</div>

	<br>
	<br>

</body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
