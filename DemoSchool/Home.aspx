<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DemoSchool.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<!-- Note there is no responsive meta tag here -->
<link rel="icon" href="../../favicon.ico">
<!-- Bootstrap core CSS 
	<link href="css/bootstrap.min.css" rel="stylesheet">-->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/home.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/sbimenu.css" />
<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=News+Cycle&v1' rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/css?family=Viga|Roboto|Roboto+Condensed|Roboto+Mono' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Viga' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- Fixed navbar -->
<div class="headerbg">
  <div class="header"><img src="images/stcipl_logo_small.png" width="305" height="112"> </div>
</div>
<div id="sbi_container" class="sbi_container">
  <div class="sbi_panel" data-bg="images/1.jpg"> <a href="#" class="sbi_label">Organisation</a>
	<div class="sbi_content">
	  <ul>
		<li><a href="AboutUs.aspx">ABOUT US</a></li>
	  <%--  <li><a href="VisionIbms.aspx">IBMS Vision</a></li>--%>
		<li><a href="careers.aspx">CAREERS</a></li>
		<li><a href="contactus.aspx">CONTACT US</a></li>
		   <li><a href="Education System.aspx">EDUCATION & SYSTEM</a></li>
		   <li><a href="Enquiry.aspx">ENQUIRY</a></li>
		   <li><a href="news.aspx">NEWS & EVENTS</a></li>
	  </ul>
	</div>
  </div>
  <div class="sbi_panel" data-bg="images/2.jpg"> <a href="#" class="sbi_label">Programs</a>
	<div class="sbi_content">
	  <ul>
	   
			  <li><a href="#">GRADUATE</a></li>
			  <li><a href="#">POST GRADUATE</a></li>
			  <li><a href="#">ENGINEERING</a></li>
			  <li><a href="#">Medical & Health</a></li>
			  <li><a href="#">DIPLOMA</a></li>
				 <li><a href="#">CERTIFICATE</a></li>
				 <li><a href="#">SECONDARY</a></li>
				<li><a href="#">VOCATIONAL</a></li>
				<li><a href="#">CULTURAL</a></li>
	  </ul>
	</div>
  </div>
<div class="sbi_panel" data-bg="images/3.jpg"> <a href="#" class="sbi_label">Collaboration</a>
	<div class="sbi_content">
	  <ul>
  <li><a href="affiliations.html">AFFILIATIONS</a></li>
			<li><a href="associations.html">ASSOCIATIONS</a></li>
	  </ul>
	</div>
  </div>
  <div class="sbi_panel" data-bg="images/3.jpg"> <a href="#" class="sbi_label">Consultancy</a>
	<div class="sbi_content">
	  <ul>
  <li><a href="affiliations.html">Data Management</a></li>
			<li><a href="associations.html">Outsource Consulting</a></li>
		  <li><a href="associations.html">Outsource Consulting</a></li>
		  <li><a href="associations.html">Educational Consulting</a></li>
		  <li><a href="associations.html">Resource Consulting</a></li>
		  <li><a href="associations.html">Health Research</a></li>
			<li><a href="associations.html">Market Research</a></li>
	  </ul>
	</div>
  </div>
	  <div class="sbi_panel" data-bg="images/5.jpg"> <a href="#" class="sbi_label">REGISTRATION</a>
	<div class="sbi_content">
	  <ul>
	   <li><a href="Admin.aspx">MANAGEMENT</a></li>
			<li><a href="Counsellorreg.aspx">COUNSELLOR </a></li>
			<li><a href="Company.aspx">ASSOC-COMPANY</a></li>
			<li><a href="faculty.aspx">Faculty</a></li>
		   <li><a href="Student-Regestration.aspx">Student</a></li>
	  </ul>
	</div>
  </div>
   
  <div class="sbi_panel" data-bg="images/6.jpg"> <a href="Login.aspx" class="sbi_label">LOGIN</a> </div>
</div>
<!-- /container -->
<!-- Bootstrap core JavaScript
	================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.bgImageMenu.js"></script>
<script type="text/javascript">
			$(function() {
				$('#sbi_container').bgImageMenu({
					defaultBg	: 'images/default.jpg',
					menuSpeed	: 300,
					type		: {
						mode		: 'verticalSlide',
						speed		: 250,
						easing		: 'jswing',
						seqfactor	: 100
					}
				});
			});
		</script>
</body>
</html>
