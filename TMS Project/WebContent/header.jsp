<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--css-->

	<!-- <link rel="shortcut icon" href="clone-trooper.ico"> -->
	<link rel="shortcut icon" href="images/amn.png">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />
<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Studies Plus Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- <link rel="stylesheet" href="css/screen.css">
 -->	<script src="js/jquery.js"></script>
	<script src="js/jquery.validate.js"></script>
<!--js-->
<!--js-->
<!--webfonts-->
<!-- <link href='//fonts.googleapis.com/css?family=Cagliostro' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
 --><!--webfonts-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<!--header-->
		<div class="header1">
			<div class="header-top1">
				<div class="container">
					<div class="detail">
						<ul>
							<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i> +91 9714670032</li>
							<li><i class="glyphicon glyphicon-time" aria-hidden="true"></i> Mon-Sat 10:00 am to 8:00 pm </li>
						</ul>
					</div>
					
					<div class="indicate">
					<%
					if(session.getAttribute("e")==null)
					{
					%>	<a  href="login.jsp" class="btn btn-primary"> <b>Log In</b></a>		
					<%}
					else
					{
						employee1 e=null;
						e=(employee1)session.getAttribute("e");
						%>
						<font size="4" color="yellow"><b> Welcome, <%=e.getEmpname()%></b>
						<%
						if(e.getEmppic()!=null)
						{
						%>
						<img alt=" " src="images/emppic/<%=e.getEmppic()%>" style="width: 40px;height: 40px ;border-radius: 100%">
						<%
						}
						else
						{
						%>
						<img alt=" " src="images/emppic/download.jpg" style="width: 55px;height: 40px ;border-radius: 100% ">
						<%} %>
						</font>
						<a href="logout.jsp" class="btn btn-primary"><b>Logout</b></a>
						<%					}
					%>
					
				 
						<!-- <p><a href="#map"><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></a></i>Krushnanagar Society, Ahemdabad-13</p> -->
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="container">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
				<!---Brand and toggle get grouped for better mobile display--->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>				  
							<div class="navbar-brand">
							
							<!-- <table>	<tr>
								<td><img  src="images/amn.png" style="height: 20px;height: 20px;"></td>
							</tr>
							</table> -->
							
							<h1><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
								<a href="index.jsp" ><b>AMN</b> <span>Tuition Management System</span></a></h1>
							</div>
						</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<nav class="link-effect-2" id="link-effect-2">
								<ul class="nav navbar-nav">
									<li class="active"><a href="index.jsp"><span data-hover="Home"><b>Home</b></span></a></li>
									<li><a href="services.jsp"><span data-hover="Services"><b>Services</b></span></a></li>
									
									
									<li><a href="aboutus.jsp"><span data-hover="About Us"><b>About us</b></span></a></li>
									<li><a href="contact.jsp"><span data-hover="Contact Us"><b>Contact us</b></span></a></li>
									
								</ul>
							</nav>
						</div>
					</div>
				</nav>
			</div>
		</div>
	<!--header-->

</body>
</html>