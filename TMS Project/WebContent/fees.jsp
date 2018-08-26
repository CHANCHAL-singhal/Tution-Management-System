<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Fees Detail </title>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Course</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationfees.js"></script>

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
<script>  
var request=new XMLHttpRequest();  	

	function showStudents(str) {
		
				var request = new XMLHttpRequest();
					 var url = "fetchstudents.jsp?val=" + str;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									
									document.getElementById("Stuname").innerHTML=val;
								}

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}
	function showfees(str) {

		var request = new XMLHttpRequest();
			  var url = "fetchstufees.jsp?val=" + str;
				try {
					request.onreadystatechange = function() {
						if (request.readyState == 4) {
							var val = request.responseText;
							var b = val.trim();
							var a = b.substr(0,7);
							
							var c = b.substr(9,15);
							var d = a - c;
							document.getElementById("totalfees").value=a;
							document.getElementById("paid").value=c.trim();
							document.getElementById("rem").value=d;
						}

					}
					request.open("GET", url, true);
					request.send();
					
				} catch (e) {
					alert("Unable to connect to server");
				}
	}
	
	function showdetail(str)
	{
					if(str=="cash")
					{
						 document.getElementById("det").value="cash";
					}
					else if(str=="cheque")
					{
						document.getElementById("det").value="cheque no = ";
					}
					else
					{
						document.getElementById("det").value="--- Please Select Payment Type ---";
					}
		
	}
	
	</script>


</head>
<body>


  
	 <jsp:include page="header.jsp"></jsp:include>
	 

<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/> 
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
<h1><b><font color="white">ADD FEES DETAIL</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">


								<form action="Feescontroller" method="post" id="fees">
								<div>
								
								<input type="hidden" name="fid" >
								</div>
								
										
										
											<label class="head"> Course </label>
										<select name="cname" class="dropdowncss" onchange="showStudents(this.value);">
										<option value="">--Select Course--</option>
										<c:forEach var="row" items="${Rec.rows}">
										<option value="${row.cid}">${row.cname}</option>
										</c:forEach>
										</select>
									
								

									
									
									
										<label class="head">Students</label>
										<select name="sid" id="Stuname" class="dropdowncss" onchange="showfees(this.value);">
										<option value="">--Select Student--</option>
										
										</select>
									
									
									<div class="w3l-user">
										<label class="head"> Total Fees</label>
									<input name="totalfees" id="totalfees" type="text" readonly  >
									</div>
									
									
									<div class="w3l-user">
										<label class="head"> Paid Fees</label>
										<input name="paid" id="paid" type="text"  readonly>
									</div>
									
									
									
										<div class="w3l-user">
										<label class="head"> Remaining </label>
										<input name="remaining" id="rem" type="text"  readonly>
										</div>
									
									
										<label  class="head"> Payment Type </label>
										<select name="ptype" onchange="showdetail(this.value);" class="dropdowncss">
										<option value="">--Select Payment Type--</option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										</select>
									
									
									
										<div class="w3l-user">
										<label class="head">  Detail </label>
										<input name="pdetail"  id="det" type="text" >
									</div>
									
									
										<label class="head">  Installment </label>
										<select name="installment" class="dropdowncss">
										<option value="">--Select Installment No--</option>
										<option value="Registration">Registration(First)</option>
										<option value="Second">Second</option>
										<option value="Third">Third</option>
										<option value="Fourth">Fourth</option>
										</select>
			
									<div class="w3l-user">
										<label class="head"> Enter Amount </label>
										<input name="amount" type="text" >
									</div>


										<div class="w3l-user">
								 <label class="head"> Date </label>
										<input name="date" type="date" style="width : 655px">
										</div>

										
										<div class="w3l-user">
								 <label class="head"> Remarks </label>
										<input name="remarks" type="text" >
									</div>
									
											<center>
				<div class="btn">
				<input type="submit" name="action"  value="ADD DETAIL"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>
									
								</form>
</div></div>
			
	 <jsp:include page="footer.jsp"></jsp:include>
	 
</body>
</html>