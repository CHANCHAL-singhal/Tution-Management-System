<%@page import="java.util.List"%>
<%@page import="com.dao.employeedao"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Employee</title>
   

<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />

<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Studies Plus Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--js-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--js-->
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Cagliostro' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--webfonts-->


<!-- table css -->
<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<!-- <link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"> -->

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>

<script type="text/javascript">

var request=new XMLHttpRequest();  




$(document).ready(function(){
    $('#ab').DataTable();
});

function myFunction() {
    window.print();
}

</script>  


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

		
<%
		employeedao sdao=new employeedao();
		List<employee1> list=sdao.getAllEmployee();
%>
<br>
<center><b><font id="cap">Edit Employee Details</font></b></center>
<table  id="ab"  class="display" width="100%" >
<thead>
	<tr>
		<th class="header headerSortUp"><center>ID</center></th>
		<th class="header"><center>USERNAME</center></th>
		<th class="header"><center>NAME</center></th>
		<th class="header"><center>DESIGNATION</center></th>
		<th class="header"><center>EMAIL</center></th>
		<th class="header"><center>EDIT</center></th>
	</tr>
</thead>
<tbody>
<%
		for(employee1 s:list)
		{
		
	%>
	<tr>
		<td><%=s.getEmpid() %></td>
		<td><%=s.getEmpusername() %></td>
		<td><%=s.getEmpname() %></td>
		<td><%=s.getEmpdesignation() %></td>
		<td><%=s.getEmpemail() %></td>
			<td colspan="2">
			<form name="delete" method="post" action="employeecontroller">
			<input type="hidden" name="empid" value="<%=s.getEmpid()%>">
		   <button type="submit" class="btn btn-default btn-pencil" name="action" id="p" value="Edit">
          <span class="glyphicon glyphicon-pencil" ></span>
        </button>
       <!--  &nbsp;&nbsp;
        <button type="submit" class="btn btn-default btn-trash" name="action" id="p" value="Delete">
          <span class="glyphicon glyphicon-trash" ></span>
  -->       </form>
 
       
		</td>	
		 </tr>
	<%		
		}
	%>

	</tbody>
</table>
<br/>
<br/>
	

<!--footer-->
			<div class="footer-w3">
				<div class="container">
					<div class="footer-grids">
						<div class="col-md-4 footer-grid">
							<h4>About Us</h4>
							<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
								fugiat nulla pariatur. <span>Excepteur sint occaecat cupidatat non proident 
								sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>
						</div>
						<div class="col-md-4 footer-grid">
						<h4>Instagram Posts</h4>
							<div class="footer-grid1">
								<img src="images/w1.jpg" alt=" " class="img-responsive">
							</div>
							<div class="footer-grid1">
								<img src="images/w2.jpg" alt=" " class="img-responsive">
							</div>
							<div class="footer-grid1">
								<img src="images/w4.jpg" alt=" " class="img-responsive">
							</div>
							<div class="footer-grid1">
								<img src="images/w5.jpg" alt=" " class="img-responsive">
							</div>
							<div class="footer-grid1">
								<img src="images/w6.jpg" alt=" " class="img-responsive">
							</div>
							<div class="footer-grid1">
								<img src="images/w2.jpg" alt=" " class="img-responsive">
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 footer-grid">
						<h4>Information</h4>
							<ul>
								<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Krushnanagar Society, Ahemdabad-13.</li>
								<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+91 8733942898</li>
								<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:example@mail.com"> amn.tms2017@gmail.com</a></li>
								<li><i class="glyphicon glyphicon-time" aria-hidden="true"></i> Mon-Sat 10:00 am to 8:00 pm</li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		<!--footer-->
		<!---copy--->
			<div class="copy-section">
				<div class="container">
					<div class="social-icons">
						<a href="#"><i class="icon1"></i></a>
						<a href="#"><i class="icon2"></i></a>
						<a href="#"><i class="icon3"></i></a>
						<a href="#"><i class="icon4"></i></a>
					</div>
					<div class="copy">
						<p>&copy; 2016  Studies Plus . All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
					</div>
				</div>
			</div>
			<!---copy--->
				

</body>
</html>