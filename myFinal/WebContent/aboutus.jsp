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

<script src="js/jquery-2.2.3.min.js"></script> 
<script defer src="js/jquery.flexslider.js"></script>
<script src="js/easy-responsive-tabs.js"></script>
<script src="js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>	
 <script src="js/bootstrap.js"></script>
	 <link href="css/about.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/easy-responsive-tabs.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>	

<!-- about-page --> 
	<div class="about">
		<div class="container">
		<div class="w3-hed-all">
			<h3>About us</h3>
		    </div>
			<div class="agileits_w3layouts_team_grids w3ls_about_grids new-agileinfo">
				<div class="col-md-6 w3ls_banner_bottom_left w3ls_about_left">
					<div class="w3ls_about_left_grids">
						<div class="w3ls_about_left_grid">
							<h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Who we are?</h3>
							<p>We are AMN developers that develops great web applications for very serious companies.</p>
						</div>
						<div class="w3ls_about_left_grid">
							<h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i>What we use?</h3>
							<p>We use all our efforts to achieve the development of innovative web applications, where the intutiveness and ease of use is key to an excellent user experience.</p>
						</div>
						<div class="w3ls_about_left_grid">
							<h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Our Mission</h3>
							<p>Our mission is to help our customer bring their services regarding web application through our solution..</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 agileits_about_right">
					<img src="images/ab2.jpg" alt=" " class="img-responsive"/>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //about -->


<!-- team -->
	<div class="team" id="team">
		<div class="container">
			<div class="w3-hed-all1">
				<h3>Our Team</h3>
			</div>
			<div class="inner_w3l_agile_grids">
				<div id="horizontalTab">
						<ul class="resp-tabs-list">
						<li>
							<img src="images/aniketsmall.jpg" alt=" " class="img-responsive" />
						</li>
						<li style="max-width: 100% ;max-height: 500px; height: 135px;width: 11%" >
							<img src="images/ch.jpg" alt=" " style="max-width: 100%;max-height: 500px; height: 115px; width: 95%" class="img-responsive"  />
						</li>
						
						 
						 </ul>
						<div class="resp-tabs-container">
							<div class="tab1">
								<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>Aniket Gajjar</h4>
									<span>Developer</span>
									<p>"Software development is Technical activity conducted by human beings."</p>
									<p>Qualification :- BScIT</p>
									<p>Phone no :- 9714670032</p>
									<p>E-mail :- <a href="mailto:aniketgajjar966@gmail.com">aniketgajjar966@gmail.com</a></p>
								<div class="w3_agileits_social_media team_agile_w3l">
										<ul class="social-icons3">
											<li class="agileinfo_share">Follow In</li>
											<li><a href="https://www.facebook.com/aniket.gajjar.31" class="wthree_facebook"> <i style="margin-top: 8px;" class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href="https://twitter.com/GajjarAniket" class="wthree_twitter"><i style="margin-top :8px;" class="fa fa-twitter" aria-hidden="true"></i></a></li>
											<li><a href="https://www.instagram.com/ak_gajjar_98/" class="wthree_dribbble"><i  style="margin-top: 8px;" class="fa fa-instagram" aria-hidden="true"></i></a></li>
											<li><a href="https://www.linkedin.com/in/aniket-gajjar-6b142a130/" class="wthree_behance"><i style="margin-top: 8px;" class="fa fa-linkedin" aria-hidden="true"></i></a></li>
										</ul>
									</div>								
								</div>
								<div class="clearfix"> </div>
							</div>
							
							<div class="tab2">
							<div class="col-md-6 team-img-w3-agile">
								</div>
								<div class="col-md-6 team-Info-agileits">
									<h4>Chanchal Singhal </h4>
									<span>Developer</span>
									<p>"Programs are usually taught by Examples."</p>
									<p>Qualification :- BScIT</p>
									<p>Phone no :- 9672999500</p>
									<p>E-mail :- <a href="mailto:singhalchanchal28@gmail.com">singhalchanchal28@gmail.com</a></p>	
								<div class="w3_agileits_social_media team_agile_w3l">
										<ul class="social-icons3">
											<li class="agileinfo_share">Follow In</li>
											<li><a href="https://m.facebook.com/profile.php?ref=bookmarks" class="wthree_facebook"> <i style="margin-top: 8px;" class="fa fa-facebook" aria-hidden="true"></i></a></li>
											<li><a href="https://www.instagram.com/chanchal8435/" class="wthree_dribbble"><i  style="margin-top: 8px;" class="fa fa-instagram" aria-hidden="true"></i></a></li>
											</ul>
									</div>									
								</div>
								<div class="clearfix"> </div>
							</div>
					
						 </div>
				</div>
			</div>
		</div>
	</div>
	<!-- //team -->

<script>
	$(document).ready(function () {
	$('#horizontalTab').easyResponsiveTabs({
	type: 'default', //Types: default, vertical, accordion           
	width: 'auto', //auto or any width like 600px
	fit: true,   // 100% fit in a container
	closed: 'accordion', // Start closed if in accordion view
	activate: function(event) { // Callback function if tab is switched
	var $tab = $(this);
	var $info = $('#tabInfo');
	var $name = $('span', $info);
	$name.text($tab.text());
	$info.show();
	}
	});
	$('#verticalTab').easyResponsiveTabs({
	type: 'vertical',
	width: 'auto',
	fit: true
	});
	});
	</script>
	


<jsp:include page="footer.jsp"/>