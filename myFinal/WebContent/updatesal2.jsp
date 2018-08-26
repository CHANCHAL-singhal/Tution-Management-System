<%@page import="com.bean.salary"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Details</title>


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />



<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script> 
<!-- //js -->
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
   
<script>  
var request=new XMLHttpRequest();  	

	function showemployee(str) {
		
				var request = new XMLHttpRequest();
					 var url = "findemp.jsp?val=" + str;
						try {
							request.onreadystatechange = function() {
								if (request.readyState == 4) {
									var val = request.responseText;
									
									document.getElementById("empid").innerHTML=val;
								}

							}
							request.open("GET", url, true);
							request.send();
							
						} catch (e) {
							alert("Unable to connect to server");
						}
	}

	function showsal(str) {

		var request = new XMLHttpRequest();
			  var url = "fetchempsal.jsp?val=" + str;
				try {
					request.onreadystatechange = function() {
						if (request.readyState == 4) {
							var val = request.responseText;
							var b = val.trim();
							document.getElementById("sal").value=val.trim();
						}

					}
					request.open("GET", url, true);
					request.send();
					
				} catch (e) {
					alert("Unable to connect to server");
				}
	}
	function showatt(str) {

		var request = new XMLHttpRequest();
		var a = document.frm.fdate.value;
		var id = document.frm.empid.value;
		var sal = document.frm.tsalary.value;
			  var url = "fetchempattend.jsp?val=" + str +"&v="+a + "&id=" + id + "&sal=" + sal;
				try {
					request.onreadystatechange = function() {
						if (request.readyState == 4) {
							var val = request.responseText;
							
							 var arr = val.split("-");
							 var a1 = arr[0];
							 var b = arr[1];
							//var b = val.trim();
							document.getElementById("att").value=a1.trim();
							document.getElementById("nsal").value=b;
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
	salary s=(salary)request.getAttribute("s");
%>


<br>
<h1><b><font color="white">ADD SALARY DETAIL</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">



								<form action="salarycontroller" method="post" name="frm">
								
								<div>
								<input type="hidden" name="sid" value="<%=s.getSid()%>" >
									</div>		
											
																
									
										<label class="head">Employee</label>
													<select name="empid" id="empid" onchange="showsal(this.value);" class="dropdowncss" readonly>
										<option value="<%=s.getEmpid()%>"><%=s.getEmpid()%></option>
										
										
										</select>
						
									
									<div class="w3l-user">
										<label class="head">Total salary</label>
									<input name="tsalary"  id="sal" type="text" value="<%=s.getTsalary()%>" >
									</div>									
									
										<div class="w3l-user">								
										<label class="head"> Year</label>
									<input name="year" id="att" type="text" value="<%=s.getYear()%>" readonly>
									</div>					
							
										<div class="w3l-user">								
										<label class="head"> Month</label>
									<input name="month"  type="text" value="<%=s.getMonth()%>" readonly>
									</div>					
							
									
										
									
										
										<div class="w3l-user">								
										<label class="head"> Attendance</label>
									<input name="tattend" id="att" type="Number" value="<%=s.getTattend()%>" readonly>
									</div>					
									
									<div class="w3l-user">
										<label class="head ">Net salary</label>
									<input name="nsalary"  id="nsal" type="text" value="<%=s.getNsalary()%>" >
									</div>
									
									
										<label class="head"> Payment Type </label>
										<select name="ptype" onchange="showdetail(this.value);" class="dropdowncss">
										<option value="<%=s.getPtype()%>"><%=s.getPtype()%></option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										</select>
									
									
									
									
										<div class="w3l-user">
										<label class="head ">  Detail </label>
										<input name="pdetail"  id="det" type="text" value="<%=s.getPdetail()%>"  >
										
									</div>
			
										
										<div class="w3l-user">
										<label class="head">Payment Date </label>
										<input name="pdate" type="date"  style="width : 655px" value="<%=s.getPdate()%>">
									</div>
									
											<div class="w3l-user">
										<label class="head "> Remarks </label>
										<input name="remarks" type="text" value="<%=s.getRemarks()%>">
									</div>
									
									
									<center>
				<div class="btn">
				<input type="submit" name="action" value="UPDATE"/>
				
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

			
	 <jsp:include page="footer.jsp"></jsp:include>
	 

</body>
</html>