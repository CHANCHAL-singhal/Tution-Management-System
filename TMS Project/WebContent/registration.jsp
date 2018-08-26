<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/sql"  prefix="sql"%>
      <jsp:include page="header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
 <meta charset="UTF-8">
  <title>Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
   <!-- registrationcss -->
    <link rel="stylesheet" href="registrationcss/css/style.css">      
    

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />


<link rel="stylesheet" href="css/jquery-ui.css"/>
<script src="js/formvalidation/jquery.min.js"></script>
<script src="js/formvalidation/jquery.validate.min.js"></script>
<script src="js/formvalidation/formvalidationemp.js"></script>

<script type="text/javascript">
var request=new XMLHttpRequest();  
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

function searchInfo()
{  
	var empname=document.empreg.empusername.value;
	//var no=document.getElementById('ab');
	var a = document.getElementById('a1');
	var btn = document.getElementById('btnform');
	var b = 1;
	var url="ajaxsearch.jsp?val="+empname +"&v="+b;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
						document.getElementById('a1').innerHTML=val;
					
						if(val=="")
						{
							btn.style.display="block";
						}
						else
						{
							btn.style.display="block";
						}
					
				
				
			}  
		}  
		
		request.open("GET",url,true);  
		request.send();
	 	
		if(empname==null || empname=="")
			{
			//no.style.display  = "inline-table";
			//no.style.width = "100%";
			a.style.display="none";
			}
		else
			{
		//no.style.display  = "none";
		a.style.display = "inline-table";
		a.style.width = "100%";
			} 
		
	}
  	catch(e)
  	{
  		alert("error");
  	}
}
function searchInfo1()
{  
	var empname=document.empreg.empemail.value;
	//var no=document.getElementById('ab');
	var a = document.getElementById('a2');
	var b = 2;
	var url="ajaxsearch.jsp?val="+empname +"&v="+b;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
					document.getElementById('a2').innerHTML=val; 
				
				
			}  
		}  
		
		request.open("GET",url,true);  
		request.send();
	 	
		if(empname==null || empname=="")
			{
			//no.style.display  = "inline-table";
			//no.style.width = "100%";
			a.style.display="none";
			}
		else
			{
		//no.style.display  = "none";
		a.style.display = "inline-table";
		a.style.width = "100%";
			} 
		
	}
  	catch(e)
  	{
  		alert("error");
  	}
}


</script>  


</head>
<body >
<sql:setDataSource driver="com.mysql.jdbc.Driver" url='<%=pageContext.getServletContext().getInitParameter("url") %>' user="root" password='<%=pageContext.getServletContext().getInitParameter("password") %>' var="DB"/> 
<sql:query var="Rec" dataSource="${DB}">
select * from subject;
</sql:query>

<!-- <form name="frm" method="post">
	<b>Search  Here: </b><input type="text" name="empname" onkeyup="searchInfo();" placeholder="Enter Name or Username" size="25">
	<span id="tops"></span>
</form> -->

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
	
<br>
<h1><b><font color="white">Employee Registration Form</font></b></h1>
<br/>

<div class="w3l-main">
	<div class="w3l-from">
				<form action="employeecontroller" method="post"  name="empreg" id="empreg" enctype="multipart/form-data">
							
			<div>
			<input type="hidden" name="empid">
			</div>
			
			<div class="w3l-user">
				<label class="head">Username<span class="w3l-star"> * </span></label>
				<input type="text" name="empusername"  id="empusername" onkeyup="searchInfo();" autocomplete="off">
				<span id="a1"></span>
			</div>
  	
  				<div class="w3l-user">
				<label class="head">Password<span class="w3l-star"> * </span></label>
				<input type="password" name="emppassword" id="emppassword" >
			</div>
			
			  <div class="w3l-user">
				<label class="head">Confirm Password<span class="w3l-star"> * </span></label>
				<input type="password" name="empconfirmpassword" >
			</div>
  
  			
<!-- 				<div class="clear"></div>
 -->  					<div class="w3l-lef1">
				<h3><b>Personal Details :</b></h3>
  
  			
			<div class="w3l-user">
				<label class="head">Employee Name<span class="w3l-star"> * </span></label>
				<input type="text" name="empname">
			</div>
			
			<div class="w3l-right">
					<label class="w3l-set2">Address<span class="w3l-star"> * </span></label>
					<textarea name="empaddress"></textarea>
			</div>
			
			<div class="w3l-mail">
				<label class="head">Email<span class="w3l-star"> * </span></label>
				<input type="email" name="empemail" onkeyup="searchInfo1();">
				<span id="a2"></span>
			</div>
			
			<!-- <div class="clear"></div> -->
			<div class="w3l-details1">
				<div class="w3l-user">
					<label class="head">Mobile Number<span class="w3l-star"> * </span></label>
					<input type="text"  name="empmobile"  >
				</div>
				
				
				
			<!-- 	<div class="w3l-options2">
				<label class="head">Gender<span class="w3l-star"> * </span></label>	
					<select class="category2" name="empgen" >
						<option value="">Gender</option>
						<option  value="male">Male</option>
						<option value="female">Female</option>
						
					</select>
			</div> -->
			
				
			<div class="w3l-user">
				<label class="head">Qualification<span class="w3l-star"> * </span></label>
				<input type="text" name="empqualification" >
			</div>
				
			
		
				<div class="clear"></div>
  					<div class="w3l-lef1">
				<h3><b>Other Details :</b></h3>
			
			
					<div class="clear"></div>	
				<div class="w3l-details1">
				<div class="w3l-num">
				<label class="head">Join Date<span class="w3l-star"> * </span></label>
							<input  name="empjoindate" type="date" style="width : 285px;" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'MM/DD/YYYY';}" >
						</div>
					</div>
	
  			<div class="w3l-options2">
				<label class="head">Designation<span class="w3l-star"> * </span></label>	
							<select   class="category2" id="empdesignation" name="empdesignation" onchange="subjectselect()">
										<option value="">--Select Designation--</option>
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
											<%-- <font color="black">
												<b>
											
												<c:forEach var="row" items="${Rec.rows}">
										<input type="checkbox" value="${row.s_name}" name="empsubject"><c:out value="${row.s_name}"></c:out>
										</c:forEach>
										 --%>
										 <font color="black">
												<b>
											
												
												<select name="empsubject" multiple size="5">
												<c:forEach var="row" items="${Rec.rows}" >
												<option value="${row.s_name}"><c:out value="${row.s_name}"></c:out>
												</c:forEach>
												</select> 
											
										</font>
										</b>
										</div></div></div></div>
										
										
	
	<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Aadhar Card</label>
					<input type="text"  name="empaadhar" >
				</div>
				
				
				<div class="w3l-sym">
				<label class="head">Salary<span class="w3l-star"> * </span></label>
				<input type="text" name="empsalary" >
			</div>	
			<div class="w3l-details1">
				<div class="w3l-num">
					<label class="head">Employee Photo</label>
					<input type="file" name="emppic" >
				</div>
				
</div>				</div>

<div class="clear"></div>
	
				<center>
				<div class="btn">
				<input type="submit" name="action" id="btnform" value="Registration"/>
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
<br>
<jsp:include page="footer.jsp"/>