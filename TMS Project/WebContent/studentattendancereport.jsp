<%@page import="com.bean.Student1"%>
<%@page import="com.dao.Studentdao"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.bean.reportbean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.dao.ReportDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
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


<script>

<%
int sid;
sid=Integer.parseInt(request.getParameter("stuid"));
Map<String, Integer> map=ReportDao.getstuattendancecount(sid);

List<reportbean> list=ReportDao.getstuattendance(sid);
Studentdao sdao=new Studentdao();
Student1 s=sdao.getStudentById(sid);
%>
window.onload = function() {

var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Attendance Count Report"
	},
	data: [{
		type: "pie",
		startAngle: 25,
		toolTipContent: "<b>{label}</b>: {y}%",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}",
		dataPoints: [
			
			{ y: <%=map.get("present")%>, label: "Present" },
			{ y: <%=map.get("absent")%>, label: "Absent" },
			
		]
	}]
});


chart.render();



var chart1 = new CanvasJS.Chart("chartContainer1", {
	animationEnabled: true,
	title:{
		text: "Student Attendance Report"
	},
	axisX:{
		valueFormatString: "DD MMM"
	},
	axisY: {
		title: "Present / Absent",
		includeZero: false,
		
	},
	data: [{
		type: "line",
		xValueFormatString: "string",
		color: "#F08080",
		dataPoints: [
			
			<%
			for(reportbean r : list)
			{
				%>
				
				{ x: new Date(<%=r.getYear()%>,<%=r.getMon()%>, <%=r.getDay()%>), y: <%=r.getPresent()%> },
				
				<%
			}
			%>
			
		]
	}]
});
chart1.render();

}
</script>

 </head>
<body><form action="showallstudent.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>

<br>
<h1><b><font color="white">Student Name : <%=s.getStuname() %></font></b></h1>
<br/>

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="js/canvasjs.min.js"></script>
<br>
<br>
<div id="chartContainer1" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<br>
<center>
<table>
<tr>
<td style="width: 100px"  bgcolor="#ffffff" align="center"><font color="green" ><b>Present :  3</b></font></td>

<td style="width: 100px"  bgcolor="#ffffff" align="center"><font color="red" ><b>  Absent :  1</b></font></td>
</tr>

</table>
</center>
<br>
<br>

</body>
</html>

<jsp:include page="footer.jsp"></jsp:include>