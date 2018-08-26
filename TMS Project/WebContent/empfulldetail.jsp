    <%@page import="com.bean.batch"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BatchDao"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.dao.employeedao"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EMPLOYEE DETAIL</title>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

<style type="text/css">
.a
{
	text-align:center;
	color:black;
	font-weight:bold;	
	background:white;
	
}
table 
{

 
 width:80%;
 text-align:center;
 align:center;
 font-family: Arial, Helvetica, sans-serif;
 border-collapse:collapse;

}
.b
{
color:#2688C3;
}
tr
{
    padding: 15px;
   border-top: 1px solid #d8592c;
    border-bottom: 1px solid #e0e0e0;
height:30px;
font-size:15px;
height:40px;
text-transform: capitalize;
    letter-spacing: 1px;
}

  tr:nth-child(even){background-color: #f2f2f2;}
    tr:nth-child(odd){background-color: #ffffff;}
  tr:hover {background-color: #ddd;}
.head
{
 border-radius: 5px;
color:white;
background:#d8592c;
 text-transform: capitalize;
    letter-spacing: 1px;
   font-size:20px;
   text-align:center;
}
td
{
	font-weight:bold;
	text-align:left;
	
	
}

.btn input[type="submit"] {
    font-size: 15px;
    font-weight: 500;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 2px;
    padding: 10px;
    /*width: 50%;*/
    margin: 10px auto 0px;
    box-sizing: border-box;
    border: 1px solid #fff;
    outline: none;
	cursor: pointer;
    display: block;
	color: #fff;
	background:#09a50e;

}
.btn input[type="submit"]:hover{
	background-color: #07e20e;
	
}

</style>


</head>
<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<%
		employee1 e = null;
		if (session != null) {
			if (session.getAttribute("e") != null) {
				e = (employee1) session.getAttribute("e");
	%>


	<%
		if (e.getEmpdesignation().equalsIgnoreCase("Admin")) {
	%>
	<jsp:include page="adminheader.jsp"></jsp:include>
	<%
		} else if (e.getEmpdesignation().equalsIgnoreCase("Faculty")) {
	%>
	<jsp:include page="facultyheader.jsp"></jsp:include>


	<%
		} else if (e.getEmpdesignation().equalsIgnoreCase("Counsellor")) {
	%>
	<jsp:include page="coucellorheader.jsp"></jsp:include>

	<%
		} else if (e.getEmpdesignation().equalsIgnoreCase("Manager")) {
	%>
	<jsp:include page="managerheader.jsp"></jsp:include>

	<%
		} else if (e.getEmpdesignation().equalsIgnoreCase("Accountant")) {
	%>
	<jsp:include page="accountantheader.jsp"></jsp:include>

	<%
		}
	%>
	<%
		} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

<%
	int eid=Integer.parseInt(request.getParameter("empid"));
			/* Integer.parseInt(s); */
	employeedao edao=new employeedao();
	employee1 s=edao.getEmployeeById(eid);

%>
<body>
<form action="showallemp.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>

<table align="center">
<tr>
<td colspan="2"  class="head">
Employee Personal Detail
</td>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Name : <td> <%= s.getEmpname() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Username : <td> <%= s.getEmpusername() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Address: <td> <%= s.getEmpaddress() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Mobile : <td> <%= s.getEmpmobile() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Email : <td> <%= s.getEmpemail() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Qualification : <td> <%= s.getEmpqualification() %>
</tr>
<tr>
</tr>

<tr>
<td colspan="2"  class="head">
Other Details
</td>
</tr>

<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Designation : <td> <%= s.getEmpdesignation() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Join Date : <td> <%= s.getEmpjoindate() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Aadhar Card : <td> <%= s.getEmpaadhar() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Salary : <td> <%= s.getEmpsalary() %>
</tr>
<tr>
</tr>
<tr>
</tr>
</table>
<%
	if(s.getEmpdesignation().equalsIgnoreCase("Faculty"))
	{
		BatchDao sdao=new BatchDao();
		List<batch> list=sdao.getAllbatch(s);
		
%>

<table align="center">
<tr>
<td colspan="7"  class="head">
Batch Detail
</td>
</tr>

	<tr>
	<td class="b"><center> Batch Name </center>  
	<td class="b"><center> Course Name </center>
	<td class="b"><center> Subject Name </center>
	<td class="b"><center> Starting Date </center>
	<td class="b"><center> Start Time </center>
	<td class="b"><center> End Time </center>
	<td class="b"><center> Status </center>
	</tr>
<%
int flag=0;
		for(batch f:list)
		{
			flag=1;
	%>
	<tr>
		<td><center> <%= f.getBatch_name() %></center>
		<td><center> <%= f.getCname() %></center>
		<td><center> <%= f.getS_name() %></center>
		<td><center> <%= f.getSdate() %></center>
		<td><center> <%= f.getStart_time() %></center>
		<td><center> <%= f.getEnd_time() %></center>
		<td><center> Running </center>
	</tr>
	<%	
		}
		if(flag==0)
		{
			%>
			<tr>
<td colspan="7">
<center>
		No Records Found
</center> 
	</td>
</tr>
		
			<%	
		}
	%>
	<tr>
	</tr>
</table>



<%
	}
%>



<form action="showallemp.jsp">
<center>
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</center>
</form>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>