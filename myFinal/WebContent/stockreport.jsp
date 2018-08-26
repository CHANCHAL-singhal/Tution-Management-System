<%@page import="com.bean.Stock"%>
<%@page import="com.dao.Stockdao"%>
<%@page import="com.bean.employee1"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ReportDao"%>
<%@page import="com.bean.reportbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
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
		} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<meta charset="UTF-8">

<%

	
Stockdao sdao = new Stockdao();
List<Stock> list=sdao.getAllStock();

%>

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Stock Report"
		},
		axisY: {
			title: "Quantity"
		},
		data: [{        
			
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "Stock Name",
			dataPoints: [      
				<%
				for(Stock r: list)
				{
					%>
					{ y: <%=r.getStquantity()%>, label: "<%=r.getStname()%>" },
					
					<%
				}
				%>
			]
		}]
	});
	chart.render();

	}
</script>
</head>
<body>

<br>
<br>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>

 <br>
 <br>

<script src="js/canvasjs.min.js"></script>
</body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
