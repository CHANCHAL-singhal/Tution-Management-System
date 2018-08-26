<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Batch</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />

<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationbat.js"></script>


<script>  
var request=new XMLHttpRequest();  
function searchInfo()
{  
	var empname=document.batch.bname.value;
	//var no=document.getElementById('ab');
	var a = document.getElementById('a4');
	var b = 4;
	var url="ajaxsearch.jsp?val="+empname +"&v="+b;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
						document.getElementById('a4').innerHTML=val; 
				
				
			}  
		}  
		
		request.open("GET",url,true);  
		request.send();
	 	
		if(empname==null || empname=="")
			{
			//no.style.display  = "inline-table";
			//no.style.width = "100%";
			a.style.display="none";
			}
		else
			{
		//no.style.display  = "none";
		a.style.display = "inline-table";
		a.style.width = "100%";
			} 
		
	}
  	catch(e)
  	{
  		alert("error");
  	}
}
 
function showSubject(str) {
	var request = new XMLHttpRequest();
		  var url = "fetchsubject.jsp?val=" + str;
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
		user="root"
		password='<%=pageContext.getServletContext().getInitParameter("password") %>'
		var="DB" />
	<sql:query var="Rec" dataSource="${DB}">

select * from employee where empdesignation="Faculty";
</sql:query>
	<sql:query var="cour" dataSource="${DB}">

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
		<b><font color="white">Create New Batch</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">

			<form action="BatchController" method="post" id="batch1" name="batch">

				<div>
					<input type="hidden" name="bid">
				</div>


				<div class="w3l-user">
					<label class="head"> Batch Name</label> 
					<input name="bname"	type="text" onkeyup="searchInfo();">
					<span id="a4"></span>
				</div>

				<div class="w3l-user">
					<label class="head"> Start Time</label> <input type="time"
						name="stime" style="width: 655px">
				</div>


				<div class="w3l-user">
					<label class="head"> End Time</label> <input type="time"
						name="etime" style="width: 655px">
				</div>


				<label class="head"> Faculty</label>
				 <select name="Ename"	class="dropdowncss" onchange="showSubject(this.value);">
					<option value="">--Select Employee--</option>
					<c:forEach var="row" items="${Rec.rows}">
						<option value="${row.empid}">${row.empname}</option>
					</c:forEach>
				</select> 
				
				<label class="head"> Subjects</label> 
				<select name="Csubject"	class="dropdowncss" id="sub" onchange="showCourse(this.value);">
					<option value="">--Select Subjects--</option>
				</select> 
				
				
				<label class="head"> Course</label>
				 <select name="Cname"	class="dropdowncss" id="subject"
					onchange="showStudents(this.value);">
					<option value="">--Select Course--</option>

				</select>


				<div class="w3l-user">
					<label class="head"> Start Date</label> 
					<input type="date"
						name="sdate" style="width: 655px">
				</div>



				<center>

					<div class="btn">
						<center>
							<input type="submit" value="ADD BATCH" name="action">
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