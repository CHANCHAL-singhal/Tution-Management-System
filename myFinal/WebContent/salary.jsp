<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Salary</title>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- <link href="registrationcss/stylecourse.css" rel="stylesheet" type="text/css" media="all" />
 -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->
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
							document.frm.tdate.value="";
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
		var a = document.frm.year.value;
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


<br>
<h1><b><font color="white">ADD SALARY DETAIL</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">



								<form action="salarycontroller" method="post" name="frm" >
								
								<div>
								<input type="hidden" name="sid" >
									</div>		
											
								
										<label class="head"> Designation</label>
										<select name="designation"  id="des" onchange="showemployee(this.value);" class="dropdowncss">
										<option value="">--Select Designation--</option>
										 <option value="Admin">ADMIN</option>
										<option value="Manager">MANAGER</option>
										<option value="Faculty">FACULTY</option>
										<option value="Accountant">ACCOUNTANT</option>
										<option value="Counsellor">COUNSELLOR</option>
										
										</select>
								 
								
																
									
										<label class="head">Employee</label>
										<select name="empid" id="empid" onchange="showsal(this.value);" class="dropdowncss">
										<option value="">--Select Employee--</option>
										
										</select>
						
									
									<div class="w3l-user">
										<label class="head">Total salary</label>
									<input name="tsalary"  id="sal" type="text" >
									</div>									
									
									<div>
									<label class="head">Select Year</label>
									<select id="year" name="year" class="dropdowncss" >
											<option value="2018">--Select Year--</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option>
											<option value="2025">2025</option>
											<option value="2026">2026</option>
											<option value="2027">2027</option>
										</select>										
									</div>
							
										
										<!-- <div class="w3l-user">
										<label class="head">From Date </label>
										<input name="fdate" type="date"  style="width : 655px">
									</div> -->
									<div>
									<label class="head">Select Month </label>
									 <select id='month' name="month" class="dropdowncss" onchange="showatt(this.value);">
    								<option value=''>--Select Month--</option>
								    <option value='00'>Janaury</option>
								    <option value='01'>February</option>
								    <option value='02'>March</option>
								    <option value='03'>April</option>
								    <option value='04'>May</option>
								    <option value='05'>June</option>
								    <option value='06'>July</option>
								    <option value='07'>August</option>
								    <option value='08'>September</option>
								    <option value='09'>October</option>
								    <option value='10'>November</option>
								    <option value='11'>December</option>
								    </select>
									</div>
									
												<!-- <div class="w3l-user">
										<label class="head">To Date </label>
										<input name="tdate" type="date" style="width : 655px" onchange="showatt(this.value);">
											</div>
						 -->
										<div class="w3l-user">								
										<label class="head"> Attendance</label>
									<input name="tattend" id="att" type="Number" >
									</div>					
									
									<div class="w3l-user">
										<label class="head ">Net salary</label>
									<input name="nsalary"  id="nsal" type="text" >
									</div>
									
									
										<label class="head"> Payment Type </label>
										<select name="ptype" onchange="showdetail(this.value);" class="dropdowncss">
										<option value="">--Select Payment Type--</option>
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										</select>
									
									
									
									
										<div class="w3l-user">
										<label class="head ">  Detail </label>
										<input name="pdetail"  id="det" type="text" >
										
									</div>
			
										
										<div class="w3l-user">
										<label class="head">Payment Date </label>
										<input name="pdate" type="date"  style="width : 655px">
									</div>
									
											<div class="w3l-user">
										<label class="head "> Remarks </label>
										<input name="remarks" type="text">
									</div>
									
									
									<center>
				<div class="btn">
				<input type="submit" name="action" value="ADD DETAIL"/>
				
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
<!-- Calendar -->
<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
		$( "#datepicker,#datepicker1" ).datepicker();
		});
	</script>
<!-- //Calendar -->  
			
	 <jsp:include page="footer.jsp"></jsp:include>
	 


</body>
</html>