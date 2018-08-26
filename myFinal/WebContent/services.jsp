<%@page import="com.bean.employee1"%>
<jsp:include page="header.jsp"/>

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
 <br><br>
				
				
				
					<%}
						}
					%>

<!doctype html>
<html class="no-js" lang="en">

<!-- Mirrored from www.zenoxit.com/software-for-coaching-classes.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Mar 2018 11:50:29 GMT -->
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <!-- Document Title -->
    <title>Services</title>
	<meta name="description" content="Lead Management Software, Enquiry Management Software, Sales management Software, Billing Software, Institute Management Software, School management software">
    <meta name="Keywords" content="Sales Management, Lead management">
	<meta name="author" content="ZENOXIT" />



<!-- 
    FontsOnline
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Crimson+Text:400,400italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'>
 -->
    <!-- StyleSheets -->
     <link rel="stylesheet" href="services/css/1.css">
    <link rel="stylesheet" href="services/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="services/css/2.css">
    <link rel="stylesheet" href="services/css/3.css">
    <link rel="stylesheet" href="services/css/4.css">
    <link rel="stylesheet" href="services/css/5.css">
    <link rel="stylesheet" href="services/css/6.css">
	<link rel="stylesheet" href="services/css/7.css">
	<link rel="stylesheet" href="services/css/8.css">



    <script src="services/js/vendors/wow.min.js"></script>
    <script src="services/js/vendors/bootstrap.min.js"></script>

    <script src="services/js/vendors/flexslider/jquery.flexslider-min.js"></script>
    <script src="services/js/vendors/jquery.countTo.js"></script>
    <script src="services/js/vendors/jquery.counterup.min.js"></script>
    <script src="services/js/vendors/jquery.isotope.min.js"></script>
    <script src="services/js/vendors/jquery.bxslider.min.js"></script>
    <script src="services/js/vendors/owl.carousel.min.js"></script>
    <script src="services/js/vendors/jquery.lighter.js"></script>
    <script src="services/js/vendors/jquery.sticky.js"></script>
    <script src="services/js/vendors/cp.min.js"></script>
    <script src="services/js/vendors/color-switcher.js"></script>

    <!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
    <script type="text/javascript" src="services/rs-plugin/js/jquery.tp.t.min.js"></script>
    <script type="text/javascript" src="services/rs-plugin/js/jquery.tp.min.js"></script>
    <script src="js/1.js"></script>
	<script type="text/javascript">

	
   
		<script type="text/javascript">
        
        var Plan = [];
        Plan[0] = [15000, 15000, 3000, 3000];
        Plan[1] = [15000, 15000, 3000, 3000];
        Plan[2] = [15000, 15000, 3000, 3000];
	
        function CalculateCost() {
            var id = $('#cmbPlan').val();
            var NoOfCenters = $('#txtNoCenters').val();
            if (id == -1) {
                alert("Please select Plan !");
                return false;
            }
            if (NoOfCenters == "" || parseInt(NoOfCenters) < 1) {
                alert("Please enter valid center number !");
                return false;
            }


            var SP = Plan[id][0];
            var SPX = Plan[id][1];
            var AMC = Plan[id][2];
            var AMCX = Plan[id][3];
            var AdditionalLicense = (NoOfCenters - 1) * SPX;
            var SoftwareCost = SP + AdditionalLicense;
            var AMCCost = AMC + ((NoOfCenters - 1) * AMCX);
            $('#SoftwareCost').text("Software Total Cost : Rs." + SoftwareCost);
            $('#AMC').html("<strong>Annual Maintainance Charge:</strong> Rs." + AMCCost);
            $('#ShowCost').removeClass("hidden");
        }
    </script>
<style type="text/css">

</style>	
</head>
<body>
    <!-- Page Wrapper -->
    <div id="wrap">

        <!-- Header -->
        <header id="header" class="header"></header>
        <script>
            $("#header").load("header.html", function (responseTxt, statusTxt, xhr) {
                if (statusTxt == "success") {
                    $("#Solution").addClass("active");
                }
            });
        </script>
        <script src="js/vendors/own-menu.js"></script>
        <!-- End Header -->
       

        <!-- Content -->
        <div id="content">

            <!-- Services -->
            <section class="padding-top-80 padding-bottom-80">
                <div class="container">
                    <div class="row">

                        <!-- Heading -->
                        <!-- <div class="heading-block text-center animate fadeInUp" data-wow-delay="0.4s">
                            <h3></h3>
                            <hr class="main">
                            <p class="intro-small">
                        </div> -->
                       
                        <!-- Service Welcome -->
						 <section class="list-style-featured  margin-top-20">
                <!-- Heading -->
                <div class="heading-block text-center animate fadeInUp">
                    <h3>SERVICES</h3>
                    <hr class="main">
                </div>
                <div class="container">
                    <div class="row">

                        <!-- LIST LEFT -->
                        <div class="col-md-6 no-padding">
                            <ul class="margin-top-30">
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Employee Login</h4>
                                            <hr class="small">
                                            <span>TMS Software provides login facility for employee to manage daily activities. Every employee can have their own user & password.

</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Graphical Reports</h4>
                                            <hr class="small">
                                            <span>TMS software generates graphical reports to analyze your training institute business growth.</span>
                                        </div>
                                    </div>
                                </li>
                               <!-- <li>
                                    <div class="media animate fadeInUp">
                                         <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Auto updates to Director on Enquiry/Admission</h4>
                                            <hr class="small">
                                            <span>With Auto SMS Configuration facility Admin can get auto update on enquiry / admission / fees received. No dependency on staff members.</span>
                                        </div>
                                    </div> 
                                </li>-->
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Daily Work Log</h4>
                                            <hr class="small">
                                            <span>Lecturers can enter their daily work log. Using daily work log sheets is a great way to organize and keep track of the activities that employees.</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Fees Collection</h4>
                                            <hr class="small">
                                            <span>TMS Software manages fees collection. Users can send SMS or Email for fees reminder. Users can easily analyze their total daily/weakly/monthly/yearly collection.</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">User-Friendly</h4>
                                            <hr class="small">
                                            <span>TMS Software is user friendly. Users can start work within 15 minutes. It is a simple and easy to use TMS Software.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Affordable Pricing</h4>
                                            <hr class="small">
                                            <span>TMS Offerss addictive features for everyone. All users will enjoy their daily work with TMS Software.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">No Unnecessary Features</h4>
                                            <hr class="small">
                                            <span>TMS Software’s all features are very useful & users cannot find unwanted features in this solution.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-pie-chart"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Data Security</h4>
                                            <hr class="small">
                                            <span>All data is secured with TMS software. Don’t worry, we protects your data.</span>
                                        </div>
                                    </div>
                                </li>
								
                            </ul>
                        </div>
                        <!-- LIST ICON RIGHT -->
                        <div class="col-md-6 no-padding">
                            <ul class="margin-top-30 ">
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color"> Multi User Management</h4>
                                            <hr class="small">
                                            <span>It is easy to create user access for counselor, accountant, faculty, admin etc. with TMS Software.</span>
                                        </div>
                                    </div>
                                </li>
								                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Notice / Announcement</h4>
                                            <hr class="small">
                                            <span>Centre Coordinator can set reminder to staff members for Meetings or any other activities. Message box will be display at Staff login.</span>
                                        </div>
                                    </div>
                                </li>
								
								  
                                <li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Think Green, Save Nature</h4>
                                            <hr class="small">
                                            <span>Use TMS software & stay away from paperwork. Manage your data with TMS & say no to Register Books & Filling.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Addictive features</h4>
                                            <hr class="small">
                                            <span>TMS Offerss addictive features for everyone. All users will enjoy their daily work with TMS Software.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Email & SMS Services Configured</h4>
                                            <hr class="small">
                                            <span>Every form of TMS software has facility of Email & SMS services. User can send Email or SMS to students for fees reminder, attendance, enquiry, admission etc.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Better Work Flow</h4>
                                            <hr class="small">
                                            <span>TMS Software maintained smooth work flow throughout application by adopting latest technology & advance features.</span>
                                        </div>
                                    </div>
                                </li>
								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">	
No Hidden Charges</h4>
                                            <hr class="small">
                                            <span>TMS price is fixed & there are no hidden charges.</span>
                                        </div>
                                    </div>
                                </li>
								

								<li>
                                    <div class="media animate fadeInUp">
                                        <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color"> Student Progress Report</h4>
                                            <hr class="small">
                                            <span>In this report we can see the details of Students Marks, Students Attendance & Fees Details by filter criteria i.e. Students Name wise, Batch wise & Package wise.</span>
                                        </div>
                                    </div>
                                </li>
<!--                                								<li>
                                    <div class="media animate fadeInUp">
                                         <div class="media-left">
                                            <div class="icon" data-wow-delay="0.4s"> <i class="lnr lnr-diamond"></i> </div>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="primary-color">Meaningful Reports</h4>
                                            <hr class="small">
                                            <span>TMS provides meaningful reports for Fees Due Installment, Fees Received, Market Analysis, Students Follow up, Finance, Attendance etc. Our real-time reports helps you make the decisions that will grow and improve your business.</span>
                                        </div> 
                                    </div>
                                </li>-->
														
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
                    </div>
                </div>
            </section>

          

</body>

<!-- Mirrored from www.zenoxit.com/software-for-coaching-classes.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Mar 2018 11:51:09 GMT -->
</html>


<jsp:include page="footer.jsp"/>