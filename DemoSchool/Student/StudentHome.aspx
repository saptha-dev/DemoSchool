<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="PresentationLayer.Student.StudentHome" %>

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
body {
	background:url(StudentImages/student-2014.jpg);
	background-repeat:no-repeat;
	background-position:middle center;
}
</style>
</head>
<body style="background-image:url(../StudentImages/student-2014.jpg);background-repeat:no-repeat;background-position:middle center;">
    <form id="form1" runat="server">
   <div class="container-fluid containerbg" style="height:480px" >
  <div class="container listcontainer"  style="width:1000px;">
    <div class="row homepagetitle"> <i class="fa fa-list fa-1x"></i> STUDENT HOME</div>
    <div class="row" style="position:relative;display:block;">
      <div class="col-xs-12" style="text-align:center;">
      <div style="border-right:1px solid #fff;width:346px;position:absolute;">
          <h3 style="text-align:left;color:#fff;padding-bottom:10PX;padding-left:25PX;"><i class="fa fa-arrow-circle-o-down fa-1x"></i> MY STUDENT           </h3>

          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-category.aspx" > <i class="fa fa-user fa-2x"></i><br />
          <span class="homebuttonlinks">MY-CATEGORIES</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/StudentSubjects.aspx"> <i class="fa fa-list fa-2x"></i><br />
          <span class="homebuttonlinks"> MY-SUBJECTS</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-certificates.aspx" > <i class="fa fa-file-text-o fa-2x"></i><br />
          <span class="homebuttonlinks" style="font-size:12px;">MY-CERTIFICATES</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-report.aspx"> <i class="fa fa-bar-chart fa-2x"></i><br />
          <span class="homebuttonlinks">MY-REPORT</span> </a>
           <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/student-profile.aspx" > <i class="fa fa-user fa-2x"></i><br />
          <span class="homebuttonlinks">MY-PROFILE</span> </a>
        </div>
        <div style="border-right:1px solid #fff; width:346px; position:absolute; left: 364px; top: 2px;">
          <h3 style="text-align:left;color:#fff;padding-bottom:10PX;padding-left:25PX;"><i class="fa fa-arrow-circle-o-down fa-1x"></i> TRAINING</h3>

          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/content.aspx" > <i class="fa fa-file-o fa-2x"></i><br />
          <span class="homebuttonlinks">CONTENT</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/StudentExercise.aspx"> <i class="fa fa-table fa-2x"></i><br />
          <span class="homebuttonlinks">EXERCISE</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/my-class.aspx" > <i class="fa fa-file-text-o fa-2x"></i><br />
          <span class="homebuttonlinks" style="font-size:12px;">CLASSES</span> </a> 
          
         </div>
         <div style="width:346px; position:absolute; left: 718px; top: 1px;">
          <h3 style="text-align:left;color:#fff;padding-bottom:10PX;padding-left:25PX;"><i class="fa fa-arrow-circle-o-down fa-1x"></i> ASSESSMENT      </h3>

             <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-sample-test.aspx" > <i class="fa fa-check-square-o fa-2x"></i><br />
          <span class="homebuttonlinks">SAMPLE TEST</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-real-test.aspx"> <i class="fa fa-indent fa-2x"></i><br />
          <span class="homebuttonlinks"> REAL TEST</span> </a> 
          <a class="btn btn-sq-lg btn-danger homebutton" href="../Student/Student-results-grade.aspx" > <i class="fa fa-angellist fa-2x"></i><br />
          <span class="homebuttonlinks" style="font-size:12px;">RESULTS-GRADE</span> </a> 
           <a class="btn btn-sq-lg btn-success homebutton" href="../Login.aspx">
            <i class="fa fa-sign-out  fa-2x"></i> <br /><span class="homebuttonlinks"> LOGOUT<br />
APPLICATION</span>
          </a>
         
         </div>
      </div>
   </div>
    </div>
  </div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    </form>
</body>
</html>
