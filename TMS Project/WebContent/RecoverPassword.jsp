
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title>Recover Password</title>
  
    <link rel="stylesheet" href="logincss/normalize.min.css">

  
      <link rel="stylesheet" href="logincss/style.css">
      

<!-- Jquery css -->

<script src="js/jqueryjar/jquery.min.js"></script>
<script src="js/jqueryjar/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationlogin.js"></script>

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
		


		

<%

	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	session.removeAttribute("otp");
	String email=(String)session.getAttribute("FpassData");

	session.invalidate(); 
%>


<h4 align="right"><%=Calendar.getInstance().getTime() %></h4>
									
<br/>
<br/>
					
<h1>Recover Password</h1>
<div style="width: 100%;">
<c:if test="${empty OtpMatch }">
<c:redirect url="forgotpassword.jsp"/>
</c:if>
<form action="EmailController" method="post" class="login-form" id="chgepass">
<h3 class="Login"><font face="Adobe Myungjo Std M" size="20" color="white"><b>Change Password</b></font></h3>
					<br/>
					<br/>
					<br/>
<div class="input-wrap">
	<label for="" class="password"><input type="password" name="NewPassword" id="NewPassword" placeholder="Enter New Password"></label> 
						<hr class="form-hr">
	<label for="" class="password"><input type="password" name="CPassword" placeholder="Enter Confirm Password"></label> 

<input type="hidden" name="email" value="<%=email%>">;
<button type="submit" name="action" value="RecoverPassword" class="button" style="margin-top: 50px;">Change</button>
		</div>
		
					
	</form>
	</div>
	<br>
	
	
 <jsp:include page="footer.jsp"/>
</body>
		
	
</html>
		
		

	