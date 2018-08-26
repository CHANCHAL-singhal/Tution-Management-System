<%@page import="com.bean.Student1"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- fonts -->

<link href="//fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet">
<!-- /fonts -->
<!-- css -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<!-- /css -->
<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationstu.js"></script>

<title>Update Student</title>
<script type="text/javascript">
function showFees(str) {

	var request = new XMLHttpRequest();
		  var url = "fetchFees.jsp?val=" + str;
		  
			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;
						
						document.getElementById("fees").value=val.trim();
						
					}

				}
				request.open("GET", url, true);
				request.send();
				
			} catch (e) {
				alert("Unable to connect to server");
			}
}

function showSub(str) {

 	var request = new XMLHttpRequest();
		 
		  var url = "fetchsub.jsp?val="+ str;
		  
			try {
				request.onreadystatechange = function() {
					if (request.readyState == 4) {
						var val = request.responseText;				
						document.getElementById("chksubject").innerHTML=val;
						
						
					}

				}
				request.open("GET", url, true);
				request.send();
				
			} catch (e) {
				alert("Unable to connect to server");
			} 
}

function selectAll(source) {
	checkboxes = document.getElementsByName('stusubject[]');
	for(var i in checkboxes)
		checkboxes[i].checked = source.checked;
}
</script>


</head>
<body>
<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">

select * from course;
</sql:query>

	<%
	Student1 s=(Student1)request.getAttribute("s");
%>

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
<h1><b><font color="white">Please Update Details</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
				<form action="Studentcontroller" method="post" id="sturegup">
							
			<div>
			<input type="hidden" name="stuid" value="<%=s.getStuid()%>">
			</div>
			
			<div class="w3l-user">
				<label class="head">Student Name<span class="w3l-star"> * </span></label>
				<input type="text" name="stuname"  value="<%=s.getStuname()%>"  >
			</div>
			
			<div class="w3l-right">
					<label class="w3l-set2">Address</label>
					<textarea name="stuaddress"><%=s.getStuaddress()%></textarea>
			</div>
			
			<div class="w3l-mail">
				<label class="head">Email<span class="w3l-star"> * </span></label>
				<input type="email" name="stuemail" value="<%=s.getStuemail()%>">
			</div>
			
			
			<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Mobile Number<span class="w3l-star"> * </span></label>
					<input type="text"  name="stumobile" value="<%=s.getStumobile()%>">
				</div>
				
				<div class="w3l-options2">
				<label class="head">Gender<span class="w3l-star"> * </span></label>	
					<select class="category2" name="stugen" readonly>
						<option value="<%=s.getStugen()%>"><%=s.getStugen()%></option>
						<!-- <option  value="Male">Male</option>
						<option value="Female">Female</option> -->
						
					</select>
			</div>
			
		
			<br/>
				<div class="w3l-lef1">
				<h3><b>Parent/Guardian Information :</b></h3>
		
			<div class="w3l-user">
				<label class="head">Parent Name<span class="w3l-star"> * </span></label>
				<input type="text" name="parname" value="<%=s.getParname()%>">
			</div>		
				
			<div class="w3l-mail">
				<label class="head">Parent Email<span class="w3l-star"> * </span></label>
				<input type="email" name="paremail" value="<%=s.getParemail()%>">
			</div>
			
			<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Parent Mobile<span class="w3l-star"> * </span></label>
					<input type="text"  name="parmobile" value="<%=s.getParmobile()%>">
				</div></div>
				<div class="w3l-sym">
				<label class="head">Reference Detail<span class="w3l-star"> * </span></label>
				<input type="text" name="refname" value="<%=s.getRefname()%>" readonly>
				
			</div>
			
			
			</div>
			<br/>
				<div class="w3l-lef1">
				<h3><b>Course Information :</b></h3>
			
			
				<div class="gender">
				<label class="head">Course Name: <span class="w3l-star"> * </span></label>	
					<select class="form-control" name="courseid" readonly onchange="showFees(this.value); showSub(this.value);">
						<option value="<%=s.getCourseid()%>"><%=s.getCourseid()%></option>
			<%-- 			<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.cid}">${row.cname}</option>
						</c:forEach>
			 --%>			
					</select>
			</div>
			
			<div class="w3l-sym">
				<label class="head">Total Fees<span class="w3l-star"> * </span></label>
				<input type="text" id="fees" name="totalfees" value="<%=s.getTotalfees()%>" readonly>
			</div>	
			
	 		  <div class="clear"></div>
	<div class="w3l-user" id="chksubject" >
		 									</div></div>
												
											
				<%-- <c:forEach var="row1" items="${Rec1.rows}">
			&nbsp;&nbsp;&nbsp;<input type="checkbox" value="${row1.s_name}" name="empsubject">&nbsp;<c:out value="${row1.s_name}"></c:out>
				</c:forEach> --%>
										
										</div>
			
			
			<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Paid Amount<span class="w3l-star"> * </span></label>
					<input type="text"  name="paidamount" value="<%=s.getPaidamount()%>" readonly>
				</div>
				
			<div class="w3l-user">
				<div class="w3l-options2">
					<label class="head">Books<span class="w3l-star"> * </span></label>
					<input type="text"  name="stubook" value="<%=s.getStubook()%>">
				</div>
			</div>
				<div class="clear"></div>	
				<p class="btn-group">	
				<center>
				<div class="btn">
				<input type="submit" name="action" value="Update"/>
				
				</div>
				</center>
				</p> 
				<p class="btn-group">
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>
				</p>
</div>
		</form>
	</div>
</div>




	<jsp:include page="footer.jsp"/>
</body>
</html>