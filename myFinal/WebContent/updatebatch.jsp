<%@page import="com.dao.employeedao"%>
<%@page import="com.bean.batch"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update Batch</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css'
	media="all" />




<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   


</head>
<body>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
		url='<%=pageContext.getServletContext().getInitParameter("url") %>'
		user="root"
		password='<%=pageContext.getServletContext().getInitParameter("password") %>'
		var="DB" />
	<sql:query var="Rec" dataSource="${DB}">

select * from employee where empdesignation="Faculty";
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

<%
	batch b=(batch)request.getAttribute("b");
	employeedao edao=new employeedao();
	String name=edao.getEmployeeNameById(b.getEmp_id());
	employeedao e1=new employeedao();
%>



	<br>
	<h1>
		<b><font color="white">Update Batch</font></b>
	</h1>
	<br />

	<div class="w3l-main">
		<div class="w3l-from">

			<form action="BatchController" method="post">

				<div>
					<input type="hidden" name="bid"  value="<%=b.getBatch_id()%>">
				</div>


				<div class="w3l-user">
					<label class="head"> Batch Name</label> <input name="bname"
						type="text"  value="<%=b.getBatch_name()%>">
				</div>

				<div class="w3l-user">
					<label class="head"> Start Time</label> <input type="time"
						name="stime" style="width: 655px" value="<%=b.getStart_time()%>">
				</div>


				<div class="w3l-user">
					<label class="head"> End Time</label> <input type="time"
						name="etime" style="width: 655px" value="<%=b.getEnd_time()%>">
				</div>

				<%-- 	<div class="w3l-user">
					<label class="head"> Faculty Name</label> 
					<input name="bname" type="text" value="<%=e1.getEmployeeNameById(b.getEmp_id())%>" >
				</div> --%>
				
			<%-- 	<label class="head"> Faculty</label>
				 <select name="Ename"	class="dropdowncss" onchange="showSubject(this.value);">
					<option value="<%=e1.getEmployeeNameById(b.getEmp_id())%>"><%=e1.getEmployeeNameById(b.getEmp_id())%></option>
					<c:forEach var="row" items="${Rec.rows}">
					
						<option value="${row.empid}">${row.empname}</option>
					</c:forEach>
				</select> --%>



<!-- 				</select> <label class="head"> Subjects</label> <select name="Csubject"
					class="dropdowncss" id="sub" onchange="showCourse(this.value);">
					<option value="">--Select Subjects--</option>
				</select> 
				
				
				<label class="head"> Course</label> <select name="Cname"
					class="dropdowncss" id="subject"
					onchange="showStudents(this.value);">
					<option value="">--Select Course--</option>

				</select> -->


<!-- 				<div class="w3l-user">
					<label class="head"> Start Date</label> <input type="date"
						name="sdate" style="width: 655px">
				</div>
 -->


				<center>

					<div class="btn">
						<center>
							<input type="submit" value="UPDATE" name="action">
						</center>
					</div>
					<div class="btn">
						<center>
							<input type="reset" value="RESET" name="reset">
						</center>
					</div>

				</center>



			</form>

		</div>
	</div>
<br/>
<jsp:include page="footer.jsp"/>
</body>
</html>