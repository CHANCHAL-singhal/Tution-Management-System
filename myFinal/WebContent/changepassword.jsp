<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
    <link rel="stylesheet" href="registrationcss/css/style.css">      
    
    
<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationlogin.js"></script>


<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
</head>
<body>
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
<h1><b><font color="white">Change Your Password</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
			<form action="employeecontroller" method="post" id="changepass">
							
				<input type="hidden" name="empid" value="<%=e.getEmpid()%>">
				
				<input type="hidden" name="emppassword" value="<%=e.getEmppassword()%>">
			
				<div class="w3l-user">
				<label class="head">Current Password<span class="w3l-star"> * </span></label>
				<input type="password" name="empcurpassword">
				</div>
		
  				<div class="w3l-user">
				<label class="head">New Password<span class="w3l-star"> * </span></label>
				<input type="password" name="empnewpassword" id="empnewpassword">
				</div>
			
			  	<div class="w3l-user">
				<label class="head">Confirm Password<span class="w3l-star"> * </span></label>
				<input type="password" name="empconfirmpassword" >
				</div>

				<div class="clear"></div>	
				<center>
				<div class="btn">
				<input type="submit" name="action" value="Change Password"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>
			
		</form>
	</div>
</div>
<br/>

</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>