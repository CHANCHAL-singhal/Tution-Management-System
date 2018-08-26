<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
    <jsp:include page="header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inquiry</title>

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

 <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationinquiry.js"></script>


<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->

<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">


<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">
select * from course;
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
<h1><b><font color="white">New Inquiry</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
				<form action="inquiryController" method="post" id="inquiry">
	<div>
			<input type="hidden" name="id">
			</div>
			
			<div class="w3l-user">
				<label class="head">Student Name<span class="w3l-star"> * </span></label>
				<input type="text" name="isname" >
			</div>
			
			<div class="w3l-mail">
				<label class="head">Email<span class="w3l-star"> * </span></label>
				<input type="email" name="isemail" id="stuemail" onkeyup="searchInfo();">
				<span id="a3"></span>
			</div>
			
				<div class="w3l-user">
					<label class="head">Mobile Number<span class="w3l-star"> * </span></label>
					<input type="text"  name="ismobile">
				</div>
				
				<div class="w3l-user">
				<label class="head">Date<span class="w3l-star"> * </span></label>
				<input type="date"	 name="date" style="width : 655px">
					<!-- <select class="category2" name="date">
						<option value="">Gender</option>
						<option  value="male">Male</option>
						<option value="female">Female</option> 
						
					</select> -->
			</div>
			<div class="clear"></div>
	<label class="head">Interested in Courses<span class="w3l-star"> * </span></label>	
											
										 <font color="black">
												<b>
											
												
												<select name="interest" multiple size="5" cols="30">
												<c:forEach var="row" items="${Rec.rows}" >
												<option value="${row.cname}"><c:out value="${row.cname}"> </c:out>
												</c:forEach>
												</select> 
											
										</font>
										</b>
	
		
										
				<div class="w3l-user">
				<label class="head">Admission in Course: <span class="w3l-star"> * </span></label>	
					<select class="dropdowncss" name="icourse" >     <!-- multiple size="5" -->
						<option value="">-- Select Course --</option>
						<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.cid}">${row.cname}</option>
						</c:forEach>
						
					</select>
			</div>
			
			

				<div class="w3l-user">
					<label class="head">Reference Detail</label>
					<input type="text"  name="isref">
				</div>
				
			
						<div class="w3l-user">
							<label class="head"> Remarks</label>
							<input name="iremarks" type="text" >
						</div>
									
										<center>
				<div class="btn">
				<input type="submit" value="ADD DETAIL" name="action"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" value="reset" name="reset"/>				
				</div>
				</center>		
				</form>
		</div>
	</div>
<br/>
<jsp:include page="footer.jsp"/>

</body>
</html>