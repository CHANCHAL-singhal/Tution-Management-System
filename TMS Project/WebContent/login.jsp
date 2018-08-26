
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title>Login</title>
  
  <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationlogin.js"></script>
  
    <link rel="stylesheet" href="logincss/normalize.min.css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
  
      <link rel="stylesheet" href="logincss/style.css">
      
<style type="text/css">

.a
{
	width:250px;
	size:20px;
	font-weight:bold;
}
</style>
<!-- Jquery css -->

<script src="js/jqueryjar/jquery.min.js"></script>
<script src="js/jqueryjar/jquery.validate.min.js"></script>
<script src="js/LoginValidation.js"></script>



<!-- Jquery css -->
</head>

<body background="logincss/bg3.png" height="100%" width="100%">

<%
	
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	
		if(session.getAttribute("e")!=null)
		{
			response.sendRedirect("home.jsp");
		}
		
		
	
	/* else
	{
	 */	%>
		


		





<h4 align="right"><%=Calendar.getInstance().getTime() %></h4>
									
<br/>
	<br/>
					
				<div style="width: 100%;">
				<form class="login-form" method="post" action="employeecontroller" ><!-- id="formlogin" -->
				
					<h1 class="Login"><font face="Adobe Myungjo Std M" size="20" color="white"><b>Login</b></font></h1>
					<br/>
					<br/>
			<select name="designation" class="a form-control" > 
				<option value="">---Select Your Designation---</option>
				<option value="admin"><b>ADMIN</b></option>
				<option value="manager"><b>MANAGER</b></option>
				<option value="faculty"><b>FACULTY</b></option>
				<option value="accountant"><b>ACCOUNTANT</b></option>
				<option value="counsellor"><b>COUNSELLOR</b></option>
			</select>
			<br/>
			<br/>
					<div class="input-wrap">
						<label for="" class="user-id"><input type="text" name="empusername" placeholder="Enter your User ID"></label> 
						<hr class="form-hr">
						<label for="" class="password"><input type="password" name="emppassword" placeholder="Enter Your Password"></label> 
					
					<input type="submit" class="button" value="Login" name="action" style="margin-top: 50px;">
					<a href="forgotpassword.jsp" class="forgot">Forgot Password?</a>
					</div>
											
				</form>
			</div>	
	
	
	<br>
	<br>
	
<%-- <%} %>
 --%>
	 <jsp:include page="footer.jsp"/>
	 			
</body>
		
	
</html>
		
		

	