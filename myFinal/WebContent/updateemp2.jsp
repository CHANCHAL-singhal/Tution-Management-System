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
<title>Update Employee</title>
   
   
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />
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

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<link rel="stylesheet" href="css/jquery-ui.css"/>

<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationemp.js"></script>

<script type="text/javascript">

function subjectselect() {
	var de = document.getElementById('empdesignation').value;
	
	 if(de == "Faculty")
		 {
			 if(document.getElementById('chksubject').style.display=="none"){
				document.getElementById('chksubject').style.display="block";
		 	}
		 }
	 else
		 {
		 document.getElementById('chksubject').style.display="none";
		 }
	}
	

</script>  


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
	employee1 s=(employee1)request.getAttribute("s");
%>

<div class="w3l-main">
	<div class="w3l-from">
  <!-- multistep form -->
<form  name="Register1" id="Register1" method="post" action="employeecontroller" >

  
  
  
  		<div>
			<input type="hidden" name="empid" value="<%=s.getEmpid()%>">
			</div>
			
				
		<%-- 	<div class="w3l-mail">
				<label class="head">Email<span class="w3l-star"> * </span></label>
				<input type="email" name="empemail" value="<%=s.getEmpemail()%>" >
			</div>
		 --%>	
<div>			
				<label class="head">Designation<span class="w3l-star"> * </span></label>	
							<select onchange="subjectselect()"  id="empdesignation" name="empdesignation" class="dropdowncss">
										<option value="<%=s.getEmpdesignation()%>"><%=s.getEmpdesignation()%></option>
										<option value="Admin">Admin</option>
										<option value="Faculty">FACULTY</option>
										<option value="Manager">MANAGER</option>
										<option value="Counsellor">COUNSELLOR</option>
										<option value="Accountant">ACCOUNTANT</option>
			
										</select>
				</div>
  
  		
  <div class="clear"></div>
	<div class="w3l-user" id="chksubject" style="display: none;">
	<label class="head">Select Subjects<span class="w3l-star"> * </span></label>	
											<font color="black">
												<b>
											
												<c:forEach var="row" items="${Rec.rows}">
										<input type="checkbox" <%=s.getEmpsubject().contains("${row.s_name}")?"checked='checked'":"" %> value="${row.s_name}" name="empsubject">${row.s_name}
										<%-- <input type="checkbox" value="${row.s_name}" name="empsubject"><c:out value="${row.s_name}"></c:out> --%>
										</c:forEach>
										
										</font>
										</div>
										
		
				<div class="w3l-user">
				<label class="head">Salary<span class="w3l-star"> * </span></label>
				<input type="text" name="empsalary" value="<%=e.getEmpsalary()%>">
			</div>	

<div class="clear"></div>	
				<center>
				<div class="btn">
				<input type="submit" name="action" value="Save Changes"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>

</form>
	</div>
</div>
		
  
  
  				


</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>