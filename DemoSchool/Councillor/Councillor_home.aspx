<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Councillor_home.aspx.cs" Inherits="PresentationLayer.Councellor.Councellor_home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../font-awesome/css/font-awesome.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body{ background-image:url(../CounsellorStyles/meeting.jpg); background-repeat:no-repeat;background-position:middle center;}

</style>
</head>
<body>
    <form id="form1" runat="server">
 <div class="container-fluid containerbg" >
<div class="container listcontainer"  style="width:1000px;">
<div class="row homepagetitle"> <i class="fa fa-list fa-1x"></i>  COUNCELLOR HOME</div>
<div class="row">
        <div class="col-xs-12" style="text-align:center;">
          
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Councillor/Enquiry.aspx">
            <i class="fa fa-question-circle fa-2x"></i><br /><span class="homebuttonlinks">ENQUIRY</span>
          </a>
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Councillor/ProgramCommunication.aspx">
            <i class="fa fa-envelope fa-2x"></i><br /><span class="homebuttonlinks"> PROGRAM<br />
 COMMUNICATION</span>
          </a>
          
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Councillor/CouncillorReport.aspx">
            <i class="fa fa-file-text-o fa-2x"></i><br /><span class="homebuttonlinks"> REPORT</span>
          </a>
          
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Councillor/CouncillorProfile.aspx">
            <i class="fa fa-user fa-2x"></i><br /><span class="homebuttonlinks"> COUNCILER <br />
PROFILE</span>
          </a>
            <a class="btn btn-sq-lg btn-success homebutton" href="../Login.aspx">
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
