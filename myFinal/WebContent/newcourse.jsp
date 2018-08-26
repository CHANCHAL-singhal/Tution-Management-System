<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"/>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Course</title>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

 <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationcou.js"></script>


<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->

<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
</head>
<body>



<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">
select * from subject;
</sql:query>

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
<br>
<h1><b><font color="white">Add New Course</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
								<form action="Coursecontroller" method="post" id="newcou">
								<input type="hidden" name="cid" >
			
									<div class="w3l-user">
			
										<label class="head"> Name<span class="w3l-star"> * </span></label>
										<input name="cname" type="text" >
									</div>


									<div class="w3l-user">
										<label class="head"> Fees<span class="w3l-star"> * </span></label>
										<input name="cfees" type="text" >
									</div>
									<div class="w3l-user">
										<label class="head"> Duration<span class="w3l-star"> * </span></label>
										<input name="cduration" type="text" >
									</div>
										
										<!-- <div class="w3l-user">
										<label class="head"> Subject </label>
										
					 -->							
						<div class="w3l-user" id="chksubject" >
						<label class="head">Select Subjects<span class="w3l-star"> * </span></label>						
									
									<c:forEach var="row" items="${Rec.rows}">
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="${row.s_name}" name="csubjects">${row.s_name}
										<!-- <font color="white">
										 --><%-- <b><c:out value="${row.s_name}"></b></font></c:out>
										 --%></c:forEach>
										<!-- <input type="checkbox" value="java" name="csubjects">Java
										<input type="checkbox" value="php" name="csubjects">PHP
										<input type="checkbox" value="dotnet" name="csubjects">Dot Net
										<input type="checkbox" value="android" name="csubjects">Android
										<input type="checkbox" value="c" name="csubjects">C
										<input type="checkbox" value="c++" name="csubjects">C++ </b> -->
						
										</div>			
										
										<div class="w3l-user">
										<label class="head"> Remarks</label>
										<input name="cremarks" type="text" >
										</div>
								
										<center>
				<div class="btn">
				<input type="submit" value="ADD COURSE" name="action"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" value="reset" name="reset"/>				
				</div>
				</center>		</form>
					</div></div>
<br/>
<jsp:include page="footer.jsp"/>
</body>
</html>