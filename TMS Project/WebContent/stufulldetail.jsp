<%@page import="com.bean.exam_master"%>
<%@page import="com.dao.ExamDao"%>
<%@page import="com.bean.Fees1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Feesdao"%>
<%@page import="com.bean.Student1"%>
<%@page import="com.dao.Studentdao"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT DETAIL</title>

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
	int sid=Integer.parseInt(request.getParameter("stuid"));
			/* Integer.parseInt(s); */
	Studentdao sdao=new Studentdao();
	Student1 s=sdao.getStudentById(sid);

%>
</head>
<body>
<form action="showallstudent.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>


<table align="center">
<tr>
<td colspan="2"  class="head">
Student Personal Detail
</td>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Name : <td> <%= s.getStuname() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Address: <td> <%= s.getStuaddress() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Mobile : <td> <%= s.getStumobile() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Email : <td> <%= s.getStuemail() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Gender : <td> <%= s.getStugen() %>
</tr>
<tr>
</tr>
<tr>
<td colspan="2"  class="head">
Student Parents & Reference Detail
</td>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Parents Name : <td> <%= s.getParname() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Parents Mobile : <td> <%= s.getParmobile() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Parents Email : <td> <%= s.getParemail() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Reference Name : <td> <%= s.getRefname() %>
</tr>
<tr>
</tr>
<tr>
<td colspan="2"  class="head">
Student Course Detail
</td>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Batch Name : <td> <%= s.getBatchname() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Course Name : <td> <%= s.getCname() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Total Fees : <td> <%= s.getTotalfees() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Paid Amount : <td> <%= s.getPaidamount() %>
</tr>
<tr>
<td class="b">&nbsp;&nbsp;&nbsp; Student Book : <td> <%= s.getStubook() %>
</tr>

<tr>
</tr>
</table>
<%
	Feesdao fdao=new Feesdao();
	List<Fees1> list=fdao.getFeesDetail(sid);
%>
<table align="center">
<tr>
<td colspan="5"  class="head">
Fees History
</td>
</tr>

	<tr>
	<td class="b"><center> Installment Type </center>  
	<td class="b"><center> Amount </center>
	<td class="b"><center> Payment Type </center>
	<td class="b"><center> Payment Detail </center>
	<td class="b"><center> Date </center>
	</tr>
<%
int flag=0;
		for(Fees1 f:list)
		{
			flag=1;
	%>
	<tr>
		<td><center> <%= f.getInstallment() %></center>
		<td><center> <%= f.getAmount() %></center>
		<td><center> <%= f.getPtype() %></center>
		<td><center> <%= f.getPdetail() %></center>
		<td><center> <%= f.getDate() %></center>
	</tr>
	<%	
		}
		if(flag==0)
		{
			%>
			<tr>
<td colspan="5">
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
	ExamDao edao=new ExamDao();
	List<exam_master> list1=edao.StudentExam(sid);
%>
<table align="center">
<tr>
<td colspan="6"  class="head">
All Exam Details
</td>
</tr>

	<tr>
	<td class="b"><center> Exam Name </center> 
	<td class="b"><center> Date </center>
	<td class="b"><center> Total Marks </center>
	<td class="b"><center> Passing Marks </center>
	<td class="b"><center> Obtain Marks </center>
	<td class="b"><center> Result </center>
	</tr>
<%
int f=0;
		for(exam_master e1:list1)
		{
			f=1;
	%>
	<tr>
		<td><center> <%= e1.getExa_name() %> </center>
		<td><center> <%= e1.getDate() %> </center>
		<td><center> <%= e1.getTmarks() %></center>
		<td><center> <%= e1.getPmarks() %></center>
		<td><center> <%= e1.getObmarks() %></center>
		<%
			if(e1.getObmarks()>=e1.getPmarks())
			{
		%>
		<td><center><font color="green"> PASS </font></center>
		<%
			}
		else
			{
		%>
		<td><center><font color="red"> FAIL </font></center>
		<%
			}		
		%>
	</tr>
	<%	
			
		}
		if(f==0)
		{
			%>
			<tr>
<td colspan="6">
<center>
		No Records Found
</center> 
	</td>
</tr>
		
			<%	
		}
	%>
</table>


<br>
<form action="showallstudent.jsp">
<center>
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</center>
</form>

</body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
