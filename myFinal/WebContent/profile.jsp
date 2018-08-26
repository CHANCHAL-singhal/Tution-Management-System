<%@page import="com.bean.employee1"%>
<%@page import="com.dao.employeedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
 
      <!-- registrationcss -->
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<style type="text/css">
.a
{
flaot:right;
position:relative;
}
readonly
{
bgcolor:blue;
}
</style>   
</head>
<body >


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
 
 
 <%} %>
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


<div class="w3l-main">
	<div class="w3l-from">
				<form action="employeecontroller" method="post"  id="msform" enctype="multipart/form-data">
							
			<div>
			<input type="hidden" name="empid" value="<%=e.getEmpid()%>">
			</div>
			
			
			
			<center><b><font color="white" size="5"><%=e.getEmpdesignation() %></font></b></center>
			<font color="white" class="a"><h4><b>Join Date :   <%=e.getEmpjoindate() %></b></h4></font>	
			<center><img alt="image" src="images/emppic/<%=e.getEmppic() %>" style="width: 140px;height: 140px; " >
		<!-- 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->

			<br><input type="file" name="emppic" style="margin-left:130px">
			</center>
			<% 
			if(e.getEmpdesignation().equalsIgnoreCase("Faculty"))
			{
				System.out.println(e.getEmppic());
			%>
			<br>
			<font color="white" size="4.5"><b>Your Total Subjects :  <%=e.getEmpsubject()%></b></font>
			<br>
			<%
			}
			%>
			<font color="white" size="4.5"><b>Total Salary :   <%=e.getEmpsalary()%></b></font>
			<br>
			<div class="w3l-user">
				<label class="head"><b>Username</b></label>
				<input type="text" name="empusername"  id="empusername" value="<%=e.getEmpusername()%>">
			</div>
  			
			<div class="w3l-user">
				<label class="head"><b>Employee Name</b></label>
				<input type="text" name="empname" value="<%=e.getEmpname()%>">
			</div>
			
			<div class="w3l-right">
					<label class="w3l-set2"><b>Address</b></label>
					<textarea name="empaddress"><%=e.getEmpaddress()%></textarea>
			</div>
			
			<div class="w3l-mail">
				<label class="head"><b>Email</b></label>
				<input type="email" name="empemail" value="<%=e.getEmpemail()%>">
			</div>
		
			<!-- <div class="clear"></div> -->
			<div class="w3l-details1">
				<div class="w3l-user">
					<label class="head"><b>Mobile Number</b></label>
					<input type="text"  name="empmobile"  value="<%=e.getEmpmobile()%>">
				</div>
				
				
			<!-- 	
				<div class="w3l-options2">
				<label class="head">Gender</label>	
					<select class="category2" name="empgen" >
						<option value="">Gender</option>
						<option  value="male">Male</option>
						<option value="female">Female</option>
						
					</select>
			</div> -->
		
			<div class="w3l-user">
				<label class="head"><b>Qualification</b></label>
				<input type="text" name="empqualification" value="<%= e.getEmpqualification()%> ">
			</div>
				
	</div>		
		
				<!-- <div class="clear"></div> -->
			
			
	<%-- 				<div class="clear"></div>	
				<div class="w3l-details1">
				<div class="w3l-num">
				<label class="head">Join Date</label>
							<input  name="empjoindate" type="text" style="width : 315px;" value=" <%= e.getEmpjoindate()%> " readonly>
						</div>
					</div>
	 --%>
<%--   			<div class="w3l-sym">
				<label class="head">Designation</label>
				<input type="text" value=" <%= e.getEmpdesignation()%> "  name="empdesignation" readonly>	
							<select   class="category2" id="empdesignation" name="empdesignation" onchange="subjectselect()">
										<option value="">--Select Designation--</option>
										<option value="Admin">Admin</option>
										<option value="Faculty">FACULTY</option>
										<option value="Manager">MANAGER</option>
										<option value="Counsellor">COUNSELLOR</option>
										<option value="Accountant">ACCOUNTANT</option>
			
										</select>
				</div>
 --%>   

   		
  <div class="clear"></div>
<div class="w3l-details1">
				<div class="w3l-user">
					<label class="head"><b>Aadhar Card</b></label>
					<input type="text"  name="empaadhar" value=" <%= e.getEmpaadhar()%> ">
				</div>
				
			
				
</div>				

<div class="clear"></div>
<br>	
				<center>
				<div class="btn">
				<input type="submit" name="action" id="btnform" value="Update"/>
				
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
	



	<br/>

<jsp:include page="footer.jsp"/>

</body>
</html>