<%@page import="com.dao.Studentdao"%>
<%@page import="com.bean.Student1"%>
<%@page import="com.bean.Receiptbean"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>invoice</title>
<style type="text/css">
table {
	width: 80%;
	border-collapse: collapse;
	
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

.c{

ba
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	
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
	<br>
	<br>
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
	Receiptbean r=new Receiptbean();
	r.setAmmount(Integer.parseInt(request.getParameter("ammount")));
	Studentdao sdao=new Studentdao();
	Student1 st=sdao.getStudentById(Integer.parseInt(request.getParameter("sid")));
	r.setCourse(st.getCname());
	r.setDate(request.getParameter("date"));
	r.setInstallmentno(request.getParameter("installment"));
	r.setName(request.getParameter("sname"));
	r.setPaymentid(Integer.parseInt(request.getParameter("fid")));
	if(request.getParameter("ptype").equalsIgnoreCase("cash"))
	{
		r.setPaymenttype(request.getParameter("ptype"));
			
	}
	else
	{
		r.setPaymenttype(request.getParameter("ptype")+" "+request.getParameter("pdetail"));
		
	}
	%>
	<br>
<form action="showfeesdetail.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>
	<h1 align="center">Student Receipt</h1>
	

<center>
<div >
		<table border="1" >
			<tr>
				<td colspan="2" align="left"><b>AMN Tuition Management
						System</b> <br> Address : Krushnanagar society,Ahemdabad-13<br>
					Phone : 9714670032 Email : amn.tms2017@gmail.com
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><b><font size="5">Receipt</font></b></td>
			</tr>

			<tr>
				<td colspan="2" align="right"><b>Date :</b> <%=r.getDate() %><br>
					<b>Payment Id :</b> <%=r.getPaymentid() %></td>
			</tr>

			<tr>
				<td align="left">Name</td>
				<td><b><%=r.getName() %></b></td>
			</tr>
			<tr>
				<td align="left">Course</td>
				<td><b><%=r.getCourse() %></b></td>
			</tr>
			<tr>
				<td align="left">Ammount</td>
				<td><b><%=r.getAmmount() %></b></td>
			</tr>
			<tr>
				<td align="left">Installment</td>
				<td><b><%=r.getInstallmentno() %></b></td>
			</tr>
			<tr>
				<td align="left">Payment Type</td>
				<td><b><%=r.getPaymenttype() %></b></td>
			</tr>

			<tr>

				<td colspan="2" align="right"><b>Total :</b> <%=r.getAmmount() %></td>
			</tr>


			<tr>
				<td colspan="2"><b>By</b><br> <br> AMN Tuition
					Management System<br> 1) Subject to Ahemdabad Juridiction.<br>
					2) Fees Once Paid Will Not be Refunded.<br> 3) Rules &
					Regulations of the Company Will have to Obeyed.<br></td>
			</tr>
		</table>
</div>	
	</center>

	<br>
	<br>
	<br>
<jsp:include page="footer.jsp" />
</body>
</html>