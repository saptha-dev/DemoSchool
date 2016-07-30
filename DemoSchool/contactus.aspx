<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="DemoSchool.contactus" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<title></title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/redysun.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
body {
	background-image:url(images/aboutbg.png);
	background-attachment:fixed;
	background-position:center;
	background-position:top;
}
</style>
</head>
<body>
<div class=" container shadow ">
  <div class="topbar"></div>
  <div class="row">
    <div class="container  header-aboutus header"  style=" height: 150px;">
      <div class="row"> <span class="col-lg-6"><img src="images/stcipl_logo_small.png"  class="logo-shadow img-responsive"></span> </div>
    </div>
  </div>
  <div class="menu-programs">
    <nav class="navbar navbar-inverse aboutus-menu" style=" margin:0px -15px;">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="Home.aspx">HOME</a></li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">COURSES<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="aboutus.html">Academic </a></li>
              <li><a href="educationsystem.html">Management</a></li>
             <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Technical</a></li>
              <li><a href="#">Engineering</a></li>
              <li><a href="#">Medical & Health</a></li>
              <li><a href="#">Research</a></li>
              <li><a href="#">Diploma</a></li>
                 <li><a href="#">Certificate</a></li>
                 <li><a href="#">Secondary</a></li>
            </ul>
          </li>
          <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown">ASSOCIATES<b class="caret"></b></a>
            <ul class="dropdown-menu multi-level">
             <li><a href="associations.html"> ASCTE-Compaines</a></li>
            <li><a href="affiliations.html">APOS </a></li>
             <li><a href="affiliations.html">NIOS </a></li>
            </ul>
          </li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">COUSULTING<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="admin_registration.html">Data-Management</a></li>
            <li><a href="company_registration.html">Data-Processing </a></li>
            <li><a href="counsellor_registration.html">Data-Collection</a></li>
            <li><a href="counsellor_registration.html">Health-Research</a></li>
            </ul>
          </li>
         <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">REGISTRATION<span class="caret"></span></a>
            <ul class="dropdown-menu">
             <li><a href="admin_registration.html">Admin/Director</a></li>
            <li><a href="company_registration.html">Counsellor </a></li>
            <li><a href="counsellor_registration.html">Company</a></li>
            <li><a href="counsellor_registration.html">Faculty</a></li>
           <li><a href="counsellor_registration.html">Student</a></li>
  
            </ul>
          </li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">AFFILIATIONS<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="date_management.html"> Govt Organizations</a></li>
            <li><a href="outsource.html">Universities</a></li>
            <li><a href="resource.html">Resource Consulting </a></li>
             
            </ul>
          </li>

             <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ACCREDITIONS<span class="caret"></span></a>
            <ul class="dropdown-menu">
               <li><a href="ISO200900.aspx">ISO-9000-2000</a></li>
                                                           <li><a href="AIU-Associates.aspx">AIU-Associate of Indian Universites</a></li>   
                                                           <li><a href="IAO-Accredition.aspx">IAO-International Accredition Organization</a></li>
             
            </ul>
          </li>
          <li><a href="Login.aspx">LOGIN</a></li>
        </ul>
      </div>
      <!--/.container-fluid -->
    </nav>
  </div>
  <div class="row"><div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active"> <img src="images/aboutus_banner.png" alt="Chania" > </div>
        <div class="item"> <img src="images/careers.png" alt="Chania" > </div>
        <div class="item"> <img src="images/consultancy_banner.png" alt="Flower"> </div>
        <div class="item"> <img src="images/organization_banner.png" alt="Flower"> </div>
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div></div>
</div>

<div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
  <div class="row">
    <div class="col-lg-12">
      <h1>Contact Us</h1>
      <h2 class="contactus-titles">Head Office</h2>
      <div class="row">
      <div class="col-lg-6" >         
        
<h4> REDYSUNS INSITUTE</h4>
<h4>SAPPHIRE TECHNOSOFT & CONSULTING INDIA PVT LTD	</h4>
        <p>#72/33, 1st Floor, 80 feet Road,  </p>
        <p>4th Block, Koramangala,  </p>
Bangalore  – 560 034, INDIA

      </div>
      <div class="col-lg-6" >         
       
<div class="map"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31108.54568241301!2d77.61468282152268!3d12.935450366284638!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae144ed898fc2d%3A0x1681f38e8c00ae56!2sKoramangala%2C+Bengaluru%2C+Karnataka!5e0!3m2!1sen!2sin!4v1463420926613" width="100%" height="350" frameborder="0" style="border:0" allowfullscreen></iframe></div>
      </div>   

	</div>
    
    </div>
    
    <div> </div>
  </div>
  <h2 class="contactus-titles">Branch Office</h2>
  <div class="topbar"></div>
</div>
<div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
  

<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="js/bootstrap.min.js"></script>
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false,
  });
});
	</script>
<script type="text/javascript">
	$(document).ready(function() {
  $('#media').carousel({
    pause: true,
    interval: false,
  });
});
	</script>
</body>
</html>
