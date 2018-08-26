<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Exam</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
	

<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationexa.js"></script>


<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
 <script>  
var request=new XMLHttpRequest();  
function searchInfo()
{  
	var empname=document.exa.ename.value;
	//var no=document.getElementById('ab');
	var a = document.getElementById('a5');
	var b = 5;
	var url="ajaxsearch.jsp?val="+empname +"&v="+b;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
						document.getElementById('a5').innerHTML=val; 
				
				
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
<sql:query var="bat" dataSource="${DB}">

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
<h1><b><font color="white">Create New Exam</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
							<form action="ExamController" method="post" id="exa" name="exa">
								<input type="hidden" name="bid" >
								
								
								
										
										<div class="w3l-user">
										<label class="head">Exam Name</label>
										<input name="ename" type="text" onkeyup="searchInfo();">
										<span id="a5"></span>
									</div>
									
									
									
									
									<div class="w3l-user">
										<label class="head"> Date</label>
										<input type="date" name="date" id="date"  style="width: 655px">
									</div>	
								

									<div class="w3l-user">
										<label class="head">
										 Total Time</label> 
										<input name="ttime" type="text" >
									</div>
									
	
									
										<label class="head"> Batch</label>
										<select name="batch" class="dropdowncss">
										<option value="">--Select Your Batch--</option>
										<c:forEach var="row" items="${bat.rows}">

										
										<option value="${row.batch_id}">Batch id : ${row.batch_id}(Batch Name : ${row.batch_name})</option>
										</c:forEach>
										</select>
									
									
									<div class="w3l-user">
										<label class="head"> Total Marks</label>
										<input name="tmarks" type="text"  >
									
									</div>
									
									<div class="w3l-user">
										<label class="head"> Passing Marks</label> 
										<input name="pmarks" type="text" >
									</div>
									
	
										<center>
				<div class="btn">
				<input type="submit" value="Create Exam" name="action"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>	
							
							
									
								</form>
</div></div>
<br/>

<jsp:include page="footer.jsp"></jsp:include>
</body>
