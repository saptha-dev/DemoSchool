<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ACMPHome.aspx.cs" Inherits="PresentationLayer.ACMP.ACMPHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script> 
          <link href="../font-awesome/css/font-awesome.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image:url(../StudentImages/acmpimg.jpg); background-repeat:no-repeat;background-position:middle center;">
<form id="form1" runat="server">
<div class="container-fluid containerbg" style="height:480px" >
  <div class="container listcontainer"  style="width:1000px;">
    <div class="row homepagetitle"> <i class="fa fa-list fa-1x"></i> ACMP HOME</div>
    <div class="row" style="position:relative;display:block;">
      <div class="col-xs-12" style="text-align:center;">
        <div style="border-right:1px solid #fff;width:220px;position:absolute;">
          <h3 style="text-align:left;color:#fff;padding-bottom:10PX;padding-left:25PX;"><i class="fa fa-arrow-circle-o-down fa-1x"></i> ACMP TRAINING</h3>
          <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-trg-student.aspx" > <i class="fa fa-user fa-2x"></i><br />
          <span class="homebuttonlinks">ACMP TRAINING<br />
          STUDENTS</span> </a>
           <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-trg-info.aspx"> <i class="fa fa-info fa-2x"></i><br />
          <span class="homebuttonlinks"> ACMP TRAINING<br />
          INFORMATION</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-trg-report.aspx" > <i class="fa fa-file-text-o fa-2x"></i><br />
          <span class="homebuttonlinks">ACMP TRAINING<br />
          REPORT</span> </a> </div>
        <div style="border-right:1px solid #fff; width:346px; float:left; position:absolute; left: 250px; top: 0px;">
          <h3 style="text-align:left;color:#fff;padding-bottom:10PX;padding-left:25PX;float:left;"><i class="fa fa-arrow-circle-o-down fa-1x"></i> ACMP ASSESSMENT</h3>
          <br />
          <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/Assesment-Students.aspx" > <i class="fa fa-check-square-o fa-2x"></i><br />
          <span class="homebuttonlinks">ASSESSMENT<br />
          STUDENTS</span> </a> <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/RealTest-booking.aspx" style="margin-bottom:10px;"> <i class="fa fa-pencil-square-o fa-2x"></i><br />
          <span class="homebuttonlinks">BOOKING <br />
          UPDATION</span> </a> <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/RealTest-Commence.aspx" > <i class="fa fa-key fa-2x"></i><br />
          <span class="homebuttonlinks">REAL TEST <br />
          COMMENCE</span> </a> <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-RT-report.aspx" > <i class="fa fa-file-text-o fa-2x"></i><br />
          <span class="homebuttonlinks">ACMP RT <br />
          REPORT</span> </a> <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-Report.aspx"> <i class="fa fa-file-text-o fa-2x"></i><br />
          <span class="homebuttonlinks">ASSESSMENT <br />
          REPORT</span> </a> </div>
      </div>
      <div style="width:346px; float:left; position:absolute; left:630px; top:6px;">
         
          <br />
          <a class="btn btn-sq-lg btn-danger homebutton" href="../ACMP/ACMP-CMP-PROFILE.aspx">
            <i class="fa fa-users fa-2x"></i><br /><span class="homebuttonlinks"> ACMP <br />
PROFILE</span>
          </a>
           <a class="btn btn-sq-lg btn-success homebutton" href="#">
            <i class="fa fa-sign-out  fa-2x"></i> <br /><span class="homebuttonlinks"> LOGOUT<br />
APPLICATION</span>
          </a>
      </div>
     
    </div>
  </div>
</div>
</form>
</body>
</html>