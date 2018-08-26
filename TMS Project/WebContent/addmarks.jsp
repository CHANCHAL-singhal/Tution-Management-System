<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Marks</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />


<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationexa.js"></script>

<!-- js -->
<!-- <script src="js/jquery-2.2.3.min.js"></script> 
 --><!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
  <script>  
var request=new XMLHttpRequest();  
function getstu(str)
{  
	
	var addstudent = document.getElementById("addstudent");
	var s1=document.getElementById("lbls");
	var url="getstu.jsp?val="+str;  
	
  	try
  	{  
		request.onreadystatechange=function()
		{  	
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById("stu").innerHTML=val;
					if(addstudent.style.display=="none"){
						addstudent.style.display="block";
						
					}
					else{
						addstudent.style.display=="none";
						
					}
					
						s1.style.display="block";
				}	
				
			 
		}  
		request.open("GET",url,true);  
		request.send();  
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  	}  
}  

</script>
</head>
<body>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/> 



	
	
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
<sql:query var="exa" dataSource="${DB}">

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
<br>
<h1><b><font color="white">Add Marks of Students</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
								<form action="Exam_attendance" method="post" id="examark">
								
									
										<label class="head"> Exam Name</label>
										<select name="exam" class="dropdowncss" onchange="getstu(this.value);">
										<option value="">--Select Exam--</option>
										<c:forEach var="row" items="${exa.rows}">
										<option value="${row.exa_id}">Exam id : ${row.exa_id}(Exam Name : ${row.exa_name})</option>
										</c:forEach>
										</select>
								

<!-- 									
										<label class="head">Students</label>
										<select name="student" class="dropdowncss" id="stu">
										<option value="">--Select Student--</option>
										</select>
								
								
									
									
			<div class="w3l-user">
										<label class="head">Marks</label> 
										<input name="marks" type="text" >
									
	 -->

	 	<div class="w3l-user">
									 <label id="lbls" class="head" style="display: none">Students</label> 
								
								
									<div style="overflow-x: auto;">
										<table name="student" id="stu">
											
										</table>
								<br><br>
	 </div>
	</div>														
								<center>
								<div class="btn" id="addstudent" style="display: none">
										<input type="submit" value="ADD MARKS" name="action">
													</div></center>
							
							

								</form>
</div></div>
<br/>

<jsp:include page="footer.jsp"></jsp:include>
</body>
