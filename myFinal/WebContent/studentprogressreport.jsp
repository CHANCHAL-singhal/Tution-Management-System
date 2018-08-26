<%@page import="com.bean.Student1"%>
<%@page import="com.dao.Studentdao"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.bean.reportbean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.ReportDao"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
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
	<br>
	<%
		} else {
				response.sendRedirect("login.jsp");
			}
		} else {
			response.sendRedirect("login.jsp");
		}
	%>


</head>
<body>
<div id="graph">
<meta charset="UTF-8">
<%
	int sid=Integer.parseInt(request.getParameter("stuid"));
			/* Integer.parseInt(s); */
	ReportDao rdao=new ReportDao();
	List<reportbean> list=ReportDao.getstudentprogress(sid);
	Studentdao sdao=new Studentdao();
	Student1 s=sdao.getStudentById(sid);

%>
<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Student Progress Report"
		},
		axisY: {
			title: "Marks"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "Exam Name",
			dataPoints: [      
				<%
				for(reportbean r: list)
				{
					%>
					{ y: <%=r.getMarks()%>, label: "<%=r.getExam()%>" },
					
					<%
				}
				%>
			]
		}]
	});
	chart.render();

	}
</script>
<br>
<br>
<form action="showallstudent.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>


<br>
<h1><b><font color="white">Student Name : <%=s.getStuname() %></font></b></h1>
<br/>

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="js/canvasjs.min.js"></script>
 </div>

<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>
