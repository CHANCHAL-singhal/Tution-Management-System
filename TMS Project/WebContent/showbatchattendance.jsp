<%@page import="com.bean.employee1"%>
<%@page import="com.bean.batch"%>
<%@page import="com.dao.BatchDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.Coursedao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show batch Attendance</title>


<!-- table css -->
	<link rel="stylesheet" type="text/css" href="tablecss/css1.css">
<link href="registrationcss/stureg.css" rel='stylesheet' type='text/css' media="all" />

<link rel="stylesheet" type="text/css" href="js/tablejs/sort.css">
<link rel="stylesheet" type="text/css" href="js/tablejs/datatables.min.css">
<script type="text/javascript" src="js/tablejs/datatables.min.js"></script>

<script type="text/javascript">
var request=new XMLHttpRequest(); 
function searchInfo()
{  
	var empname=document.frm.empname.value;
	var no=document.getElementById('ab');
	var a = document.getElementById('tops');
	var url="ajaxsearch.jsp?val="+empname;  
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
		
		if(empname==null || empname=="")
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
  	}  
}  



function showbatattendance()
{     
	var bat=document.getElementById("batid").value;
	var sdate=document.getElementById("sdate").value;
	var edate=document.getElementById("edate").value;
	
	  var url = "batatt.jsp?e="+bat+"&sdate="+sdate+"&edate="+edate;
		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var val = request.responseText;
					document.getElementById("ab").innerHTML=val;
					if(search.style.display=="none"){
						search.style.display="block";
						
					}
					else{
						search.style.display=="none";
						
					}
					if(table.style.display=="none"){
						table.style.display="block";
						
					}
					else{
						table.style.display=="none";
						
					}
					document.getElementById("btnnext").style.display="none";
						
				}

			}
			request.open("GET", url, true);
			request.send();
			
		} catch (e) {
			alert("Unable to connect to server");
		}

}
function da(str) {
	var request = new XMLHttpRequest();
	var sdate = document.getElementById("sdate").value;
	var edate = document.getElementById("edate").value;
	
		if(str != "")
			{
			document.getElementById("d").style.display = "block";
			 document.getElementById('sdate').value = "";
			 document.getElementById('edate').value = "";
				document.getElementById("s").style.display = "none";
				document.getElementById("table").style.display = "none";
			
			}
		else
			{
			document.getElementById("d").style.display = "none";
			 document.getElementById("table").style.display = "none";
				if(sdate != null)
				{
				document.getElementById("s").style.display = "none";
				}
	
			}

			
			/* } */
/* 		else
			{
			document.getElementById("d").style.display = "none";
			document.getElementById("s").style.display = "none";
			 document.frm.show.selectedIndex=0;
			 document.getElementById("table").style.display = "none";

			}
 */}
function sd(str) {
	var request = new XMLHttpRequest();
	//var edate = document.getElementById("edate").value;
	
	
		if(str != "" )
			{
			document.getElementById("s").style.display = "block";
	
			 document.getElementById("table").style.display = "none";
			 document.getElementById('edate').value = "";
					
			}
		else
			{
			document.getElementById("s").style.display = "none";
			
			 document.getElementById("table").style.display = "none";
	

			}
}


$(document).ready(function(){
    $('#ab').DataTable();
});
</script>  


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
<div  id="search">
<h4 align="right"><font color="white"><%=Calendar.getInstance().getTime() %></font></h4>
</div>
<br>

	<h1>
		<b><font color="white">Batch Attendance</font></b>
	</h1>
<br>

<%
		BatchDao edao=new BatchDao();
		List<batch> list=edao.getAllbatch(e);
%>



<div class="w3l-main">
		<div class="w3l-from">
				<form name="frm" >
						
						<div class="w3l-user">
						<label class="head">
					Batch
						</label>
						<select id="batid" name="batid" class="dropdowncss" onchange="da(this.value);">
								<option value="">--Select Batch--</option>
		<%
	for(batch em:list)
	{
		%>
		<option value="<%=em.getBatch_id() %>">
		<%=em.getBatch_name() %>
		</option>
		
		<%
	}
	
	%>
	</select>
	</div>
	<div id="d" style="display: none;">
						<div class="w3l-user">
						<label class="head">Start Date</label>
						<input type="date" name="sdate" id="sdate" style="width : 660px" onchange="sd(this.value);">

					
					</div>

<div id="s" style="display: none;">
						<div class="w3l-user">
						<label class="head">
						End Date</label>
						<input type="date" name="edate" id="edate" style="width : 660px" onchange="showbatattendance();">
					
					</div>
</div>

</div>
<!-- 					<center>
										<div class="btn">
										<input type="button"  name="btnnext" value="Show Attendance" onclick="showbatattendance();" id="btnnext"/>
										
										</div>
							</center>
 -->					
				</form>
				</div>
				</div>
	
	<br><br>
	
<div style="display: none" id="table">
<center><h3><b><font color="white">Show Batch Attendance</font></b></h3></center>
<table   cellpadding="10"  id="ab" class="display">

 </table>
 </div>
<br/>
<br/>


</body>
</html>

<jsp:include page="footer.jsp"/>
 