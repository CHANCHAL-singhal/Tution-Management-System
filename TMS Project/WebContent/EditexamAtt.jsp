<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exam Attendence</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />

<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationexa.js"></script>
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
   
<script>  
var request=new XMLHttpRequest();  


	function showexamdet() {
			
				var str=document.getElementById("exam").value;
		       
				 
				
		        var request = new XMLHttpRequest();
					  var url = "Editexaatt.jsp?val=" + str;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									document.getElementById("stu").innerHTML=val;
									
									
									 if(addexamatt.style.display=="none"){
										 addexamatt.style.display="block";
											
										}
										else{
											addexamatt.style.display=="none";
											
										}
								}
								

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}

	function selectAll(source) {
		checkboxes = document.getElementsByName('chkstu[]');
		for(var i in checkboxes)
			checkboxes[i].checked = source.checked;
	}
</script>


</head>
<body>

<jsp:include page="header.jsp"></jsp:include>



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

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/>
<sql:query var="exam" dataSource="${DB}">

SELECT * FROM exam_master e,batch b WHERE b.emp_id= <%=e.getEmpid()%> AND e.batch_id=b.batch_id
</sql:query>
 
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
		<b><font color="white">Remove Exam Attendance</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">

								<form action="Exam_attendance" method="post"  id="exaattedit">
								<input type="hidden" name="bid" >
									
									
									
										<label class="head"> Exam</label>
										<select name="exam" class="dropdowncss"  id="exam" onchange="showexamdet(this.value);">
										<option value="">--Select Exam--</option>
										<c:forEach var="row" items="${exam.rows}">
										<option value="${row.exa_id}">Exam id : ${row.exa_id} (Exam Name : ${row.exa_name})</option>
										</c:forEach>
										
										</select>
									
								
									
									 
									 <br>
									 <div id="addexamatt" style="display: none">	
									<label id="lbls" class="head">Students</label>
								<br>
									<div style="overflow-x: auto;">
										<table name="Students" id="stu">
											
										</table>
										<br> <br>
									</div>
								</div>	
								
						<center>
												<div class="btn">
						
							<input type="submit" value="UPDATE ATTENDANCE" name="action" >
						
					</div>
				</center>
									
				

						</form>
</div></div>
<br>
<jsp:include page="footer.jsp"/>
</body>
</html>