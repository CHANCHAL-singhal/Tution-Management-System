<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Subject</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stylecourse.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
</head>
<body>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">

select * from subject;
</sql:query>

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
<br/>
<br/>

	<div class="main">
		<h1>Delete Subject</h1>
		<br/>
		<div class="w3_agile_main_grids" ng-app>
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="agileits_w3layouts_main_grid">
								<h3>Delete  Subject</h3>
								<form action="SubjectController" method="post">
								<input type="hidden" name="sid" >
									<span>
										<label>Subject</label>
										<select name="subject">
										<option value="">--Select Subject--</option>
										<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.id}">${row.s_name}</option>
										</c:forEach>
										</select>
									</span>
									
									<center><div class="w3_agileits_submit">
										<input type="submit" value="Delete Subject" name="action">
										<input type="reset" value="reset" name="reset">
									</div></center>
								</form>
							</div>
						</li>
				</ul>
				</div>
			</section>
		</div>

<br/>
<jsp:include page="footer.jsp"/>
</body>
</html>