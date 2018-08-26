<jsp:include page="header.jsp"/>
<%@page import="com.bean.employee1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>AMN Tuition Management System</title>
<!--css-->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/ken-burns.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/animate.min.css" type="text/css" media="all" />
<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Studies Plus Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--js-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!--js-->
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Cagliostro' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--webfonts-->
</head>
<body>



<%
			if(session!=null)
			{
				
			
					if(session.getAttribute("e")!=null)
					{

					employee1 e=(employee1)session.getAttribute("e");	
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
 
				
				
				
					<%}
						}
					%>


	<!-- banner -->
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">

            <!-- Wrapper-for-Slides -->
            <div class="carousel-inner" role="listbox">

                <!-- First-Slide -->
                <div class="item active">
                    <img src="images/books.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption">
                       <!--  <h3 data-animation="animated flipInX">Get Everything Right</h3>
                        <h4 data-animation="animated flipInX">cupidatat non proident</h4> -->
                    </div>
                </div>

                <!-- Second-Slide -->
                <div class="item">
                    <img src="images/img3.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <!-- <h3 data-animation="animated flipInX">Get Everything Right</</h3>
                        <h4 data-animation="animated flipInX">cupidatat non proident</h4> -->
                    </div>
                </div>

                <!-- Third-Slide -->
                <div class="item">
                    <img src="images/img4.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_center">
                       <!--  <h3 data-animation="animated flipInX">Get Everything Right</</h3>
                        <h4 data-animation="animated flipInX">cupidatat non proident</h4> -->
                    </div>
                </div>

            </div>
			
            <!-- Left-Button -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>

            <!-- Right-Button -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
			
        </div>
		<script src="js/custom.js"></script>
	</div>

	
	
			<!--student-->
			<div class="student-w3ls">
				<div class="container">
					<h3 class="tittle"> Our Strength</h3>
					<div class="student-grids">
						<div class="col-md-6 student-grid">
							<h4>Research and Development</h4></br>
								<p>At present, most of the R&D activities in the various centres fall into these categories. You can gather more information about the specific projects and systems by clicking on these thematic areas on the left of the screen. We are building a more organised, searchable repository of such information.</p>
								</br></br><p>As mentioned earlier, most of the R&D work has a driving practical application of importance. Most of the works are, therefore, actually deployed and in use by concerned user agencies - which include the common people of India as well. The research focus has resulted in a number of publications in national and international conferences/journals.</p>
								<!-- <ul class="grid-part">
									<li><i class="glyphicon glyphicon-ok-sign"> </i>High Performance Computing including the series of supercomputers, Garuda national grid initiative, development of scientific computing applications on these platforms, and cloud computing.</li>
									<li><i class="glyphicon glyphicon-ok-sign"> </i>Professional Electronics covering electronic devices and embedded systems. This area covers work such as underwater electronics, software radio, ubiquitous computing.</li>
									<li><i class="glyphicon glyphicon-ok-sign"> </i>Information and Cyber Security including intrusion detection and prevention, malware analysis, cyber forensics, network security, etc</li>
									<li><i class="glyphicon glyphicon-ok-sign"> </i>Health Informatics including hospital information systems, electronic medical records, telemedicine, and cancer networks.</li>
									<li><i class="glyphicon glyphicon-ok-sign"> </i>Web-App Technologies including e-governance solutions, e-learning technologies, geomatics, open source software, accessibility, etc.</li>
								</ul> -->

						</div>
						<div class="col-md-6 student-grid">
							<img src="images/w6.jpg" class="img-responsive" alt="Image-2">
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!--student-->
			<!--testimonials-->
				<div class="testimonials-w3">
					<div class="container">
					<h3 class="tittle2">Testimonials</h3>
						<div class="test-grid">
							<img src="images/quote.png" alt=/>
						<h5>Setting goals is the first step in turning the INVISIBLE into the VISIBLE </h5>
						<p><i>- Tony Robbins -</i></p>
						</div>
					</div>
				</div>
			<!--testimonials-->
		
		<!--content-->
		<center>
		<div id="map">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d917.7208382037627!2d72.56283242917989!3d23.06473769905824!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e837ef4ca8763%3A0x0!2zMjPCsDAzJzUzLjEiTiA3MsKwMzMnNDguMiJF!5e0!3m2!1sen!2sin!4v1514475445207" width="1100" height="450" frameborder="0" style="border:1" allowfullscreen>
</iframe></div>
</center>

<jsp:include page="footer.jsp"/>
				
</body>
</html>
