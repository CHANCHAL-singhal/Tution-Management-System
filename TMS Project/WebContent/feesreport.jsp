<%@page import="java.util.Map"%>
<%@page import="com.dao.ReportDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">

<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />
<script>
<% Map<String, Integer> map=ReportDao.getPaidCount();
%>
window.onload = function() {

var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Desktop Browser Market Share in 2016"
	},
	data: [{
		type: "pie",
		startAngle: 25,
		toolTipContent: "<b>{label}</b>: {y}%",
		showInLegend: "true",
		legendText: "{label}",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}%",
		dataPoints: [
			
			{ y: <%=map.get("Done")%>, label: "Paid" },
			{ y: <%=map.get("NotDone")%>, label: "Unpaid" },
			
		]
	}]
});
chart.render();

}
</script>

</head>
<body>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="js/canvasjs.min.js"></script>
</body>
</html>