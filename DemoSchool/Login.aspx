<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DemoSchool.Login" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server">
    <div class=" container shadow ">
<div class="topbar"></div>
<div class="row">

<div class="container  header-consulting header"  style=" height: 150px;">
  <div class="row"> <span class="col-lg-6"><img src="images/stcipl_logo_small.png"  class="logo-shadow img-responsive"></span> </div>
</div></div>
<div class="menu-programs">
<nav class="navbar navbar-inverse consulting-menu" style=" margin:0px -15px;">
      
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        </div>
        <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="Home.aspx">HOME</a></li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">ORGANIZATION<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="AboutUs.aspx">ABOUT US</a></li>
        <li><a href="VisionIbms.aspx">IBMS Vision</a></li>
        <li><a href="careers.aspx">CAREERS</a></li>
        <li><a href="contactus.aspx">CONTACT US</a></li>
           <li><a href="Education System">EDUCATION SYSTEM</a></li>
           <li><a href="Enquiry.aspx">ENQUIRY</a></li>
           <li><a href="news.aspx">NEWS & EVENTS</a></li>
            </ul>
          </li>
          <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown">PROGRAMS<b class="caret"></b></a>
            <ul class="dropdown-menu multi-level">
            
              <li><a href="#">GRADUATE </a></li>
              <li><a href="#">POST GRADUATE</a></li>
              <li> <a href="#">SECONDARY</a></li>
              <li><a href="#">ENGINEERING</a></li>
               <li><a href="#">DIPLOMA</a></li>
          <li> <a href="#">CERTIFICATE</a></li>
                 <li><a href="#">CULTURAL</a></li>
                 <li><a href="#">VOCATIONAL</a></li>
            </ul>
          </li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">COLLABORATIONS<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="Associations.aspx">ASSOCIATIONS</a></li>
            <li><a href="Affilations.aspx">AFFILIATIONS</a></li>
            </ul>
          </li>
            <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">CONSULTING<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="#l">Data Management</a></li>
            <li><a href="#">Outsource Consulting</a></li>
          <li><a href="#">Outsource Consulting</a></li>
          <li><a href="#l">Educational Consulting</a></li>
          <li><a href="#">Resource Consulting</a></li>
          <li><a href="#">Health Research</a></li>
            <li><a href="#">Market Research</a></li>
            </ul>
          </li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">REGISTRATION<span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="Admin.aspx">MANAGEMENT</a></li>
               <li><a href="Company.aspx">ASSOC-COMPANY</a></li>
              <li><a href="Counsellorreg.aspx">COUNSELLOR</a></li>
              <li><a href="faculty.aspx">FACULTY</a></li>
              <li><a href="Student-Regestration.aspx"> STUDENT </a></li>
            </ul>
          </li>
          <li><a href="Login.aspx">LOGIN</a></li>
        </ul>
      </div>
      <!--/.container-fluid -->
    </nav></div>
</div>


<div class="container shadow" style="margin-top:20px;background-color:#fff;border-top:5px solid #CCC;background-image:url(images/login.jpg);background-position:center;background-repeat:no-repeat;">
  <div class="row">
    <div class="col-lg-5  col-lg-offset-4">
      <div class="panel panel-default loginform" style="margin:150px 0px ;">
        <div class="panel-body login-panel-body ">
          <form role="form">
            <div class="login-form">
              <h2>User Login</h2>
              <div class="form-group">
             
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                  <input id="txtUserName" type="text" class="form-control input-lg" name="txtUserName" value="" placeholder="username" runat="server" />
                </div>
              </div>
              <div class="form-group">
               
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  <input id="txtPassword" type="password" class="form-control input-lg" name="txtPassword" placeholder="password" runat="server" />
                </div>
                
              </div>
              <div class="form-group">
             
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-check"></i></span>
                  <input id="login-username" type="text" class="form-control input-lg" name="access code" value="" placeholder="access code" />
                </div>
               
                
              </div>
              <div class="help-block text-right"><a href="">Forgot the password ?</a></div> 
             
            </div>
            <div >
                 <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="" Visible="false"></asp:Label>
                  <button type="submit" class="btn btn-lg btn-danger" runat="server" onserverclick ="btnlogin_Click" validationgroup="Login" >Sign in</button>
                <%--<asp:Button ID="btnLogin"  class="btn btn-lg  btn-block"  runat="server" Text="Login" onclick="btnlogin_Click" ValidationGroup="Login" />--%>

            </div>
          </form>
        </div>
      </div>
     
      <div>
      <!--/well-->   
      </div>
<br>
    </div>
    <div> </div>
  </div>
  <div class="topbar"></div>
</div>
<div class="footer">
  <div class="container"> © <%=DateTime.Now.Year%> STCIPL All rights reserved. </div>
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
    </form>
</body>
</html>
