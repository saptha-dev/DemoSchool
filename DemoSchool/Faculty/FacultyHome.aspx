<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyHome.aspx.cs" Inherits="PresentationLayer.Faculty.FacultyHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
         <link href="../font-awesome/css/font-awesome.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
body{ background-image:url(StudentImages/faculty-2014.jpg); background-repeat:no-repeat;background-position:middle center;}

</style>
</head>
<body style="background-image:url(../StudentImages/faculty-2014.jpg);">
    <form id="form1" runat="server">
    <div>
    
<div class="container-fluid containerbg" >
<div class="container listcontainer"  style="width:1000px;">
<div class="row homepagetitle"> <i class="fa fa-list fa-1x"></i> FACULTY HOME</div>
<div class="row">
        <div class="col-xs-12">
          
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Faculty/FacultyClass-List.aspx">
            <i class="fa fa-list-alt fa-2x"></i><br /><span class="homebuttonlinks">CLASS <br />
LIST</span>
          </a>
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Faculty/Facutly-org-Class.aspx">
            <i class="fa fa-calendar fa-2x"></i><br /><span class="homebuttonlinks"> ORGANIZE <br />
CLASS</span>
          </a>
          
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Faculty/FacultyReport.aspx">
            <i class="fa fa-file-text-o fa-2x"></i><br /><span class="homebuttonlinks"> REPORT</span>
          </a>
          
           
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Faculty/Faculty-TestManagement.aspx">
            <i class="fa fa-tasks fa-2x"></i><br /><span class="homebuttonlinks"> CLASS<br />
 TASKS</span>
          </a>
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Faculty/FacultyProfile.aspx">
            <i class="fa fa-users fa-2x"></i><br /><span class="homebuttonlinks"> FACULTY <br />
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

    </div>
    </form>
</body>
</html>
