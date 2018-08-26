<%@page import="com.bean.exam_master"%>
<%@page import="com.dao.ExamDao"%>
<%@page import="com.bean.Student1"%>
<%@page import="com.dao.Studentdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bean.exam_attendance"%>
<%@page import="java.util.List"%>
<%@page import="com.sun.javafx.scene.control.skin.ListViewSkin"%>
<%@page import="com.dao.ReportDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<html>
<head>  

<meta charset="UTF-8">

<%
int eid=Integer.parseInt(request.getParameter("eid"));
	Studentdao sdao=new Studentdao();
List<exam_attendance> list=new ArrayList<exam_attendance>();
list=ReportDao.getexamdata(eid);
ExamDao edao=new ExamDao();
exam_master exam=edao.getExamById(eid);
%>
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

<script>
window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Exam Report"
		},
		axisY: {
			title: "Marks"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "Student Name",
			dataPoints: [      
				<%
				for(exam_attendance r: list)
				{
					Student1 s=new Student1();
					s=sdao.getStudentById(r.getStuid());
					%>
					{ y: <%=r.getOb_marks()%>, label: "<%=s.getStuname()%>" },
					
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

<form action="showallexam.jsp">
<div class="btn">
				<input type="submit" name="action" id="btnform" value="BACK"/>
</div>
</form>
<br>
<h1><b><font color="white">Exam Name : <%=exam.getExa_name() %></font></b></h1>
<br/>

<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>

 <br>
 <br>
<br/>

<script src="js/canvasjs.min.js"></script>
</body>
</html>

<jsp:include page="footer.jsp"></jsp:include>
