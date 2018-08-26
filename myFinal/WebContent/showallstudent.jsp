<%@page import="java.util.Calendar"%>
<%@page import="com.bean.employee1"%>
<%@page import="com.bean.Student1"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Studentdao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Students</title>

<!-- table css -->

<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="datatable/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />


<script type="text/javascript">


var request=new XMLHttpRequest();  
function searchInfo()
{  
	var stuname=document.frm.stuname.value;
	var no=document.getElementById('ab');
	var a = document.getElementById('tops');
	var url="ajaxsearchstu.jsp?val="+stuname;  
  	try
  	{  
		request.onreadystatechange=function()
		{  
			if(request.readyState==4)
			{  
				
					var val=request.responseText;  
					
						document.getElementById('tops').innerHTML=val; 
				
				
			}  
		}  
		
		request.open("GET",url,true);  
		request.send();
		
		if(stuname==null || stuname=="")
			{
			no.style.display  = "inline-table";
			no.style.width = "100%";
			a.style.display="none";
			}
		else
			{
		no.style.display  = "none";
		a.style.display = "inline-table";
		a.style.width = "100%";
			}
		
	}
  	catch(e)
  	{
  		alert("Unable to connect to server");
  		no.style.display  = "inline-table";
		no.style.width = "100%";
		a.style.display="none";
  	}  
}  
/* 
$(document).ready(function(){
    $('#ab').DataTable();
}); */
</script>  


</head>
<body>
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
<!-- <form name="frm" method="post">
	<b>&nbsp;Search  Here: </b><input type="text" name="stuname" onkeyup="searchInfo();" placeholder="Enter Name or Batch Id" size="25">
	<span id="tops"></span>
</form> -->
	
<%
		Studentdao sdao=new Studentdao();
		List<Student1> list=sdao.getAllStudent(e);
%>
<center><caption><b><font color="blue" size="5">All Students</font></b></caption></center>
<br>
<table  width="100%"  id="example" class="display">
<thead>
	<tr>
		<th>ID</th>
		<th>NAME</th>
		<!-- <th>ADDRESS</th> -->
		<th>EMAIL</th>
		<th>MOBILE</th>
		<!-- <th>PARENT NAME</th> -->
		<!-- <th>BATCH ID</th>
		<th>COURSE ID</th> -->
		<th>TOTAL FEES</th>
		<th>PAID FEES</th>
		<th>ATTENDANCE REPORT</th>
		<th>PROGRESS REPORT</th>
		<th>FULL DETAIL</th>
	</tr>
	</thead>
	<tbody>
<%

		for(Student1 s:list)
		{
	%>
	<tr >
		<td><center><%=s.getStuid() %></center></td>
		<td><center><%=s.getStuname()%></center></td>
		<%-- <td><center><%=s.getStuaddress() %></center></td> --%>
		<td><center><%=s.getStuemail() %></center></td>
		<td><center><%=s.getStumobile() %></center></td>
		<%-- <td><center><%=s.getParname() %></center></td> --%>
		<%-- <td><center><%=s.getBatchid()%></center></td>
		<td><center><%=s.getCourseid() %></center></td> --%>
		<td><center><%=s.getTotalfees() %></center></td>
		<td><center><%=s.getPaidamount() %></center></td>
		<td><center>	
		<form name="edit" action="studentattendancereport.jsp" method="post">
			<input type="hidden" value="<%=s.getStuid()%>" name="stuid"> 
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Attendance">
          	<span class="glyphicon glyphicon-new-window" ></span></button>
			</form></center></td>
		<td><center>	
		<form name="edit" action="studentprogressreport.jsp" method="post">
			<input type="hidden" value="<%=s.getStuid()%>" name="stuid"> 
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Progress">
          	<span class="glyphicon glyphicon-new-window" ></span></button>
			</form></center></td>
		<td><center><form name="show" action="stufulldetail.jsp" method="post">
			<input type="hidden" value="<%=s.getStuid()%>" name="stuid"> 
			<button type="submit" class="btn btn-default btn-sm" name="action" id="p" value="Show Detail">
          	<span class="glyphicon glyphicon-new-window" ></span></button>
			</form></center></td>
 </tr>
		<%	
		}
	%>
	</tbody>
</table>
<br>
<br>

<jsp:include page="footer.jsp"/>				

</body>
<!-- <script src="js/jquery.min.js"></script>

<script src="datatable/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>
<script src="datatable/dataTables.bootstrap.min.js"></script>


<script src="datatable/dataTables.buttons.min.js"></script>

<script src="datatable/buttons.bootstrap.min.js"></script>

<script src="datatable/jszip.min.js"></script>
<script src="datatable/pdfmake.min.js"></script>
<script src="datatable/vfs_fonts.js"></script>
<script src="datatable/buttons.html5.min.js"></script>
<script src="datatable/buttons.print.min.js"></script>
<script src="datatable/buttons.colVis.min.js"></script>

<script>
$(document).ready(function(){
    var table = $('#example').DataTable(
    		{
    			/* lengthChange: false, */
    			
    		    buttons: [ 'copy', 'excel', 'pdf', 'print', 'colvis' ]
    		
    		});
    table.buttons().container()
	.appendTo( '#example_wrapper .col-sm-6:eq(0)' );
    
    
    
});
</script>
 -->
 <jsp:include page="datatable.jsp"/>
</html>