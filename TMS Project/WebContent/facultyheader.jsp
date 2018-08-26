<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faculty Header</title>


<style>

/*dropdown */
.navbar1 {
    overflow: hidden;
    background-color: #000000;
    font-family: Arial;
    
}

.navbar1 a {
    float: left;
    font-size: 16px;
    color: white;
    text-align: center;
    padding: 14px 26px;
    text-decoration: none;
}
.navbar1 font {
    float: right;
    font-size: 16px;
    color: yellow;
    text-align: center;
    padding: 14px 26px;
    text-decoration: none;
}

.dropdown1 {
    float: left;
    overflow: hidden;
}

.dropdown1 .dropbtn {
    font-size: 16px;    
    border: none;
    outline: none;
    color: white;
    padding: 14px 36px;
    background-color: inherit;
}

.navbar1 a:hover, .dropdown1:hover, .navbar1 p:hover .dropbtn {
    background-color: red;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #0080ff;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}

.dropdown1:hover .dropdown-content {
    display: block;
}

/*dropdown finish*/

i, cite, em, var, address, dfn {
    font-style: italic;
}


}
</style>
</head>
<%
employee1 e=null;
e=(employee1)session.getAttribute("e");
%>
<body>

 

 <div class="navbar1">

  <a href="home.jsp">Dashboard</a>

  <div class="dropdown1">
    <button class="dropbtn">Student<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     
      <a href="updatestudent1.jsp">Edit Student</a>
      <a href="studentattendence.jsp">Student Attendance  </a>
      <a href="removestuattend.jsp">Remove Attendance  </a>
       <a href="showstudentattendance.jsp">Show Student Attendance  </a>
      <a href="showallstudent.jsp">Show All Student</a>
    </div>
    
  </div>	
  
  
  <div class="dropdown1">
    <button class="dropbtn">Course<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="showallcourse.jsp">Show All Courses</a>
    </div>
    
  </div>
  
<div class="dropdown1">
    <button class="dropbtn">Batch<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
   <a href="removebatchattendance.jsp">Remove Batch Attendance</a>
    <a href="completebatch.jsp">Complete Batch</a>
      <a href="showallbatch.jsp">Show All Batch Details</a>
      <a href="showbatchattendance.jsp">Show Batch Attendance</a>
    </div>
  </div>
    
  
  <div class="dropdown1">
    <button class="dropbtn">Subject<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
  
<a href="showallsubject.jsp">Show All Subject</a>
    </div>
  </div>
  
  
   <div class="dropdown1">
    <button class="dropbtn">Exam<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <a  href="createexam.jsp">Create Exam  </a>
	 <a href="addexamattendance.jsp">Add Exam Attendance</a>
	 <a href="updateexam1.jsp">Edit/Delete Exam</a>
	 <a href="addmarks.jsp">Add Marks of Exam</a>
	 
	 <a href="EditexamAtt.jsp">Remove Exam Attendance</a>
 	 <a href="showallexam.jsp">Show All Exam Details</a>
 	 <a href="showexamattendance.jsp">Show Exam Attendance</a>	
    </div>
  </div>
  <div class="dropdown1">
    <button class="dropbtn">Fees<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
       <a href="showfeesdetail.jsp">Show Fees Detail </a>
    </div>
  </div>
  
  <div class="dropdown1">
    <button class="dropbtn">Email Alerts<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <a  href="batchalert.jsp">Batch Alerts  </a>
	  <a  href="sendstudentalert.jsp">Student Alerts  </a>
	  <a  href="sendemployeesalert.jsp">Employees Alerts  </a>
	   <a  href="sendemployeealert.jsp">Employee Alerts  </a>
 </div>
  </div>
  
  <div class="dropdown1">
    <button class="dropbtn">SMS Alerts<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <a  href="smsbatchalert.jsp">Batch Alerts  </a>
	  <a  href="smsstudentalert.jsp">Student Alerts  </a>
	  <a  href="smsemployeesalert.jsp">Employees Alerts  </a>
	   <a  href="smsemployeealert.jsp">Employee Alerts  </a>
 </div>
  </div>
   <div class="dropdown1">
    <button class="dropbtn">Profile<span class="caret"></span>
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
  <a href="profile.jsp">Edit Profile</a>
  <a href="changepassword.jsp">Change Password</a>
  <a href="showmyattendance.jsp">My Attendance</a>
  
 </div>
  </div>  
  
  
  
</div>


</body>
</html>
