
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title>Forgot Password</title>
  
    <link rel="stylesheet" href="logincss/normalize.min.css">

    <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationlogin.js"></script>
      <link rel="stylesheet" href="logincss/style.css">
      
      <!-- <script src="js/jquery.min.js"></script>
 --><script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-dialog.min.js"></script>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
      

<!-- Jquery css -->

<script src="js/jqueryjar/jquery.validate.min.js"></script>
<script src="js/LoginValidation.js"></script>

<!-- Jquery css -->


<script type="text/javascript">
function confirm() {
	   
	/*    BootstrapDialog.alert({
           title: 'WARNING',
           message: 'Warning! No Banana!',
           type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
           closable: true, // <-- Default value is false
           draggable: true, // <-- Default value is false
           buttonLabel: 'Roar! Why!', // <-- Default value is 'OK',
           callback: function(result) {
               // result will be true if button was click, while it will be false if users close the dialog directly.
               alert('Result is: ' + result);
           }
       }); */
       
       
   /*     BootstrapDialog.show({
           title: 'Default Title',
           message: 'Click buttons below.',
           buttons: [{
               label: 'Title 1',
               action: function(dialog) {
                   dialog.setTitle('Title 1');
               }
           }, {
               label: 'Title 2',
               action: function(dialog) {
                   dialog.setTitle('Title 2');
               }
           }]
       });
       
       
 */
 
/*  BootstrapDialog.show({
     message: 'Hi Apple!'
 });
 */
  
 /* BootstrapDialog.confirm({
     title: 'Confirmation',
     size: BootstrapDialog.SIZE_LARGE,
     message: 'Are You Sure To Add New Course ? ',
     type: BootstrapDialog.TYPE_WARNING, // <-- Default value is BootstrapDialog.TYPE_PRIMARY
     closable: true, // <-- Default value is false
     draggable: true, // <-- Default value is false
     btnCancelLabel: 'No', // <-- Default value is 'Cancel',
     btnOKLabel: 'Yes', // <-- Default value is 'OK',
     btnOKClass: 'btn-warning', // <-- If you didn't specify it, dialog type will be used,
     callback: function(result) {
         // result will be true if button was click, while it will be false if users close the dialog directly.
         if(result) {
             //alert('Yup.');
             document.getElementById("abc").submit();
         }else {
             //alert('Nope.');
         }
     }
 });  */
 
/*     BootstrapDialog.confirm('I want banana!');  */
	 }
	 

</script>   



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
			


					
	<div style="width: 100%;" >
${SendOtpError}
<c:choose>
<c:when test="${empty FpassData}">


	<div style="width: 100%;">
				<form class="login-form" method="post" action="EmailController" style="height:400px;" id="sendotp">
				
					<h3 class="Login"><font face="Adobe Myungjo Std M" size="20" color="white"><b>Forgot Password</b></font></h3>
					<br/>
					<br/>
			<br/>
					<div class="input-wrap" style="height:70px;">
						<label for="" class="user-id"><input type="text" name="email" placeholder="Enter your Email Here"></label> 
					</div>	 
					
					<input type="submit" class="button" value="SendOtp" name="action" style="margin-top: 50px;">
							
					
				</form>
			</div>	
	

</c:when>
<c:otherwise>
<form action="EmailController" method="post" class="login-form" id="confirmotp">
<h4><font face="Adobe Myungjo Std M" size="5" color="white"><b>${ErrorOtp}</b></font></h4>
<br>
<h4><font face="Adobe Myungjo Std M" size="5" color="white"><b>Otp Sent On ${FpassData}</b></font></h4>
<br/>
<br/>
<div class="input-wrap" style="height:70px;">
						<label for="" class="user-id" style="background:none;"><input type="text" name="EnterOtp"" placeholder="Enter your OTP Here"></label> 
						

<br>
<button type="submit" name="action" value="ConfirmOtp" class="button" style="margin-top: 50px;">Confirm</button>
</div>
</form>

</c:otherwise>


</c:choose>
</div>
	<br>
	<br>
	

	 <jsp:include page="footer.jsp"/>
	 			
</body>
		
	
</html>
		
		

	