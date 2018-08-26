<%@page import="java.util.List"%>
<%@page import="com.bean.inquiry"%>
<%@page import="com.bean.employee1"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.dao.inquiryDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Inquiry</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />


</head>
<body>
		
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

<h4 align="right"><font color="blue"><%=Calendar.getInstance().getTime() %></font></h4>
<br>
<%
		inquiryDao sdao=new inquiryDao();
		List<inquiry> list=sdao.getAllInquiry();
%>

<center><b><font color="blue" size="5">Inquiry Details</font></b></center>
<br>
<table  cellpadding="10" id="example" class="display">
<thead>
	<tr>
		<th class="header headerSortUp"><center>ID</center></th>
		<th class="header"><center>NAME</center></th>
		<th class="header"><center>EMAIL</center></th>
		<th class="header"><center>MOBILE</center></th>
		<th class="header"><center>DATE</center></th>
		<th class="header"><center>COURSE</center></th>
		<th class="header"><center>INTEREST</center></th>
		<th class="header"><center>REFERENCE</center></th>
		<th class="header"><center>REMARKS</center></th>
	</tr>
</thead>
<tbody>	
<%
int count=0;
		for(inquiry s:list)
		{
		
	
	%>

	<tr >
		<td><center><%=s.getId() %></center></td>
		<td><center><b><%=s.getIsname() %></b></center></td>	
	
		<td><center><%=s.getIsemail() %></center></td>
		<td><center><%=s.getIsmobile() %></center></td>
		<td><center><%=s.getDate() %></center></td>
		<td><center><%=s.getCname() %></center></td>
		<td><center><%=s.getInterest() %></center></td>
		<td><center><%=s.getIsref() %></center></td>
		<td><center><%=s.getIremarks() %></center></td>
						
		</tr>
			 

	<%-- 
	<td>
			<form name="edit" method="post" action="ActionController">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="Edit">
			</form>
		</td>
		<td>
			<form name="delete" method="post" action="ActionController">
				<input type="hidden" name="id" value="<%=s.getId()%>">
				<input type="submit" name="action" value="Delete">
			</form>
		</td>
 --%>	
	<%		
		}
	%>
	</tbody>
		
</table>
<br/>

<br/>




<jsp:include page="footer.jsp"/>
 <jsp:include page="datatable.jsp"/>




</body>
</html>