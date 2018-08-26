<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Attendence</title>
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
<script src="js/formvalidation/formvalidationstuatt.js"></script>
   
<script>  
var request=new XMLHttpRequest();  


	function showStudents() {
			
				var str=document.getElementById("batch").value;
		        var s=document.getElementById("date").value;
				/* var addstudent = document.getElementById("addstudent"); */
				var s1=document.getElementById("lbls");
	 		/* 	alert("batch : "+str+" date : "+s);
 */		        var request = new XMLHttpRequest();
					  var url = "updatestuatt.jsp?val=" + str+"&date="+s;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									document.getElementById("stu").innerHTML=val;
									/* 			if(addstudent.style.display=="none"){
										addstudent.style.display="block";
										
									}
									else{
										addstudent.style.display=="none";
										
									}
									
									document.getElementById("btnnext").style.display="none";
										s1.style.display="block";
				 */						
								}

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}

	function selectAll(source) {
		checkboxes = document.getElementsByName('chkstudent[]');
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
<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">

select * from batch where status = "running" and emp_id = <%=e.getEmpid()%> ;
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
<h1><b><font color="white">Absent Student Attendance</font></b></h1>
<br>
<div class="w3l-main">
	<div class="w3l-from">
								
								<form action="Stu_attController" method="post" id="stuattrem">
								<input type="hidden" name="bid" >
										<label class="head"> Batch</label>
										<select name="batch"  id="batch" class="dropdowncss">
										<option value="">--Select Batch--</option>
										<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.batch_id}">Batch id : ${row.batch_id}(Batch Name : ${row.batch_name})</option>
										</c:forEach>
										</select>
									
									
							<div class="w3l-user">
								 <label class="head">
								 Date</label>
								<input type="date" name="date" id="date" style="width : 250px" onchange="showStudents();">
								</div>
								
									
									
								<div class="w3l-user">
									<label class="head" id="lbls" style="display: none">Students<span class="w3l-star"> * </span></label>
									</div>
									
									
								<br>
								<br>
									<div style="overflow-x: auto;">
										<table name="student" id="stu">
											
										</table>
										<br> <br>
									</div>




								<center><div class="w3_agileits_submit" id="addstudent" >
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