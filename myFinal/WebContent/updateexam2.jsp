<%@page import="com.dao.BatchDao"%>
<%@page import="com.bean.exam_master"%>
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
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
   
   <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationexa.js"></script>
   
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />
</head>
<body>

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/> 

<sql:query var="bat" dataSource="${DB}">

select * from batch where status = "running";
</sql:query>


	
	
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
<%
	exam_master s=(exam_master)request.getAttribute("s");
	BatchDao b1=new BatchDao();
	
%>
	
	<br>
<h1><b><font color="white">Create New Exam</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
									<form action="ExamController" method="post" id="exa">
								<input type="hidden" name="bid" value="<%=s.getExa_id() %>">
								
								
								
										
										<div class="w3l-user">
										<label class="head">Exam Name</label>
										<input name="ename" type="text" placeholder="Enter Exam Name" value="<%=s.getExa_name() %>">
									</div>
									
									
									
									
									<div class="w3l-user">
										<label class="head"> Date</label>
										<input type="date" name="date" id="date"  style="width: 655px" value="<%=s.getDate() %>">
									</div>	
								

									<div class="w3l-user">
										<label class="head">
										 Total Time</label> 
										<input name="ttime" type="text" placeholder="Enter Exam Total Time In Minutes"  value="<%=s.getTime() %>">
									</div>
									
	
									
										<label class="head"> Batch</label>
										
										<select name="batch_id" class="dropdowncss">
										<option value="<%=s.getBatch_id() %>"><%=b1.getBatchNameById(s.getBatch_id()) %></option>
										<c:forEach var="row" items="${bat.rows}">
										<option value="${row.batch_id}">Batch id : ${row.batch_id}(Batch Name : ${row.batch_name})</option>
										</c:forEach>
										</select>
									
									
									<div class="w3l-user">
										<label class="head"> Total Marks</label>
										<input name="tmarks" type="text" placeholder="Enter Exam Total Marks" value="<%=s.getTmarks() %>">
									
									</div>
									
									<div class="w3l-user">
										<label class="head"> Passing Marks</label> 
										<input name="pmarks" type="text" placeholder="Enter Exam Passing Marks" value="<%=s.getPmarks() %>" >
									</div>
									
	
										<center>
				<div class="btn">
				<input type="submit" value="Update" name="action"/>
				
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
<%-- 
	<div class="main">
		<h1>Create New Exam</h1>
		<br/>
		<div class="w3_agile_main_grids" ng-app>
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="agileits_w3layouts_main_grid">
								<h3>New  Exam</h3>
								<form action="ExamController" method="post">
								<input type="hidden" name="exa_id" value="<%=s.getExa_id() %>">
									<span>
										<label> Exam Name</label>
										<input name="exa_name" type="text" value="<%=s.getExa_name() %>" >
									</span>
									
									<span>
										<label> Date</label>
										<input type="date" name="date" value="<%=s.getDate() %>" >
										
								
									</span> 

									<span>
										<label> Total Time</label> 
										<input name="time" type="text" value="<%=s.getTime() %>" >
									
									</span>
	
									<span>
										<label> Batch</label>
										<select name="batch_id">
										<option value="<%=s.getBatch_id() %>"><%=s.getBatch_id() %></option>
										<c:forEach var="row" items="${bat.rows}">
										<option value="${row.batch_id}">Batch id : ${row.batch_id}(Batch Name : ${row.batch_name})</option>
										</c:forEach>
										</select>
									</span>
									
											<span>
										<label> Total Marks</label>
										<input name="tmarks" type="text" value="<%=s.getTmarks() %>" >
									
									</span>
									
											<span>
										<label> Passing Marks</label> 
										<input name="pmarks" type="text" value="<%=s.getPmarks() %>" >
									
									</span>
	
											
							
							
									<center><div class="w3_agileits_submit">
										<input type="submit" value="Update" name="action">
										<input type="reset" value="RESET" name="reset">
									</div></center>
								</form>
							</div>
						</li>
				</ul>
				</div>
			</section>
		</div>

<br/>
 --%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
