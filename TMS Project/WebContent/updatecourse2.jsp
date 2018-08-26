<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Course1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Course</title>
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
<script src="js/formvalidation/formvalidationcou.js"></script>
   
</head>
<body>

<jsp:include page="header.jsp"/>
		<%
	Course1 s=(Course1)request.getAttribute("s");
%>

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
<br><br>
<h1><b><font color="white">Update Course</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
								<form action="Coursecontroller" method="post" id="upcou">
								<input type="hidden" name="cid" value="<%=s.getCid()%>">
			
									<div class="w3l-user">
			
										<label class="head"> Name</label>
										<input name="cname" type="text" value="<%=s.getCname()%>" >
									</div>


									<div class="w3l-user">
										<label class="head"> Fees</label>
										<input name="cfees" type="text" value="<%=s.getCfees()%>">
									</div>
									<div class="w3l-user">
										<label class="head"> Duration</label>
										<input name="cduration" type="text" value="<%=s.getCduration()%>">
									</div>
										
										<div class="w3l-user">
										<label class="head"> Subject </label>
										<font color="white">&nbsp;&nbsp;&nbsp;&nbsp;
												<b>       
										<input type="checkbox" <%=s.getCsubjects().contains("java")?"checked='checked'":"" %> value="java" name="csubjects">Java
										<input type="checkbox" <%=s.getCsubjects().contains("php")?"checked='checked'":"" %> value="php" name="csubjects">PHP
										<input type="checkbox" <%=s.getCsubjects().contains("dotnet")?"checked='checked'":"" %> value="dotnet" name="csubjects">Dot Net
										<input type="checkbox" <%=s.getCsubjects().contains("android")?"checked='checked'":"" %> value="android" name="csubjects">Android
										<input type="checkbox" <%=s.getCsubjects().contains("c")?"checked='checked'":"" %> value="c" name="csubjects">C
										<input type="checkbox"  <%=s.getCsubjects().contains("c++")?"checked='checked'":"" %> value="c++" name="csubjects">C++ </b>
										
										</font>
										</div>			
										
										<div class="w3l-user">
										<label class="head"> Remarks</label>
										<input name="cremarks" type="text" value="<%=s.getCremarks()%>">
										</div>
								
										<center>
				<div class="btn">
				<input type="submit" value="UPDATE" name="action"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" value="reset" name="reset"/>				
				</div>
				</center>		</form>
					</div></div>

<jsp:include page="footer.jsp"/>
</body>
</html>