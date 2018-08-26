<%@page import="com.dao.Studentdao"%>
<%@page import="com.bean.Student1"%>
<%@page import="com.bean.Fees1"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Details</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
   <link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationfees.js"></script>
   
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
							document.getElementById("fees").value=a;
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
					/* else
					{
						document.getElementById("det").value="--- Please Select Payment Type ---";
					} */
					
					
			

		
			
			
		
		
	}
	
	</script>


</head>
<body>


<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>'
 user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>'
 var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">

select * from course;
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
	<%
	Fees1 s=(Fees1)request.getAttribute("s");
  Studentdao sdao=new Studentdao();
 Student1 s1=sdao.getStudentById(s.getSid());
%>
<br>
<h1><b><font color="white">UPDATE FEES DETAIL</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">


								<form action="Feescontroller" method="post" id="feesup">
								<div>
								
								<input type="hidden" name="fid" value="<%=s.getFid()%>">
								</div>
								
										
								
						
									
									
									
										<label class="head">Students</label>
										
										<select name="sid" id="Stuname" class="dropdowncss"onchange="showfees(this.value);">
										
										<option value="<%=s.getSid()%>"><%=s1.getStuname()%></option>
										</select>
									
									
									<div class="w3l-user">
										<label class="head"> Total Fees</label>
								<input name="totalfees" id="fees" type="text" value="<%=s.getTotalfees()%>" onchange="showpaid(studentname.value);" readonly>
									</div>
									
									
									<div class="w3l-user">
										<label class="head"> Paid Fees</label>
										<input name="paid" id="paid" type="text"  value="<%=s.getPaid()%>" readonly>
									</div>
									
									
									
										<div class="w3l-user">
										<label class="head"> Remaining </label>
										<input name="remaining" id="rem" type="text"  value="<%=s.getRemaining()%>"  readonly>
										</div>
									
									
										<label  class="head"> Payment Type </label>
											<select name="ptype" onchange="showdetail(this.value);" class="dropdowncss">
										<option value="<%=s.getPtype()%>"><%=s.getPtype()%></option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										</select>
									
									
									
										<div class="w3l-user">
										<label class="head">  Detail </label>
										<input name="pdetail"  id="det" type="text" value="<%=s.getPdetail()%>">
									</div>
									
									
										<label class="head">  Installment </label>
										
										<select name="installment" class="dropdowncss">
										<option value="<%=s.getInstallment()%>"><%=s.getInstallment()%></option>
										<option value="Registration">Registration(First)</option>
										<option value="Second">Second</option>
										<option value="Third">Third</option>
										<option value="Fourth">Fourth</option>
			
										</select>
			
									<div class="w3l-user">
										<label class="head"> Enter Amount </label>
										<input name="amount" type="text"  value="<%=s.getAmount()%>">
									</div>


										<div class="w3l-user">
								 <label class="head"> Date </label>
										<input name="date" type="date" style="width : 655px" value="<%=s.getDate()%>">
										</div>

										
										<div class="w3l-user">
								 <label class="head"> Remarks </label>
										<input name="remarks" type="text" value="<%=s.getRemarks()%>">
									</div>
									
											<center>
				<div class="btn">
				<input type="submit" name="action"  value="UPDATE"/>
				
				</div>
				</center>
				
				<center>
				<div class="btn">
				<input type="reset" name="action" value="Reset"/>				
				</div>
				</center>
									
								</form>
</div></div>

|
<br/>

		<jsp:include page="footer.jsp"/>

</body>
</html>