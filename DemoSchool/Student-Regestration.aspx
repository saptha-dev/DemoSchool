<%@ Page Title="" Language="C#" MasterPageFile="~/Regestration.Master" AutoEventWireup="true" CodeBehind="Student-Regestration.aspx.cs" Inherits="DemoSchool.Student_Regestration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    
    <%-- <script type="text/javascript">
        $.noConflict();
        $(document).ready(function () {
            $("#<%=txtdob.ClientID %>").datepicker({ maxDate: '0', changeYear: true, yearRange: "1900:2000", dateFormat: 'yy-mm-dd', beforeShow: function () {
                $(".ui-datepicker").css('font-size', 13.5)
            }
            });
            $("#cdr").click(function () {
                $("#<%= txtdob.ClientID %>").datepicker('show');
            });
        });
    </script>
    <script type="text/javascript">
        function validate(source, args) {
            args.IsValid = true;
            if (args.Value == "--Select--") {
                args.IsValid = false;
            }
        }
    </script>
    <script type="text/javascript">
        function checkEmail() {

            var email = document.getElementById('<%= txtEmail.ClientID %>');
            var Alteremail = document.getElementById('<%= txtaltrEmail.ClientID %>');
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

            if (!filter.test(email.value) || !filter.test(Alteremail.value)) {
                alert('Please provide a valid email address');
                email.focus;
                return false;
            }


        }
    </script>--%>

    <script runat="server">

    void Button1_Click(Object sender, EventArgs e) {
       txtFirstName.Text = "Page is valid!";
    }
        </script>
 

    <style type="text/css">
        #rdbtnDiv
        {
            color: rgb(16, 99, 168);
            width: 100%;
            margin: auto;
            border: 1px solid white;
            background-color: Silver;
        }
        body {
	background-image:url(images/aboutbg.png);
	background-attachment:fixed;
	background-position:center;
	background-position:top;
}
        
        .textusername
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            padding: 4px 20px 4px 8px;
            font-size: 17px;
            -moz-transition: all .2s linear;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
            font: 700 0.9em Lato, Arial, Helvetica, sans-serif;
        }
        
        .textusername:hover
        {
            outline: none;
            box-shadow: 0px 0px 5px #61C5FA;
            border: 1px solid #5AB0DB;
            border-radius: 0;
        }
        #tblPadding td
        {
            padding-top: 8px;
        }
 #tblPadding1 td
        {
            padding-top: 8px;
        }
 #tblPadding2 td
        {
            padding-top: 8px;
        }
 #tblPadding3 td
        {
            padding-top: 8px;
        }

        #wizHeader li .prevStep
        {
            background-color: #669966;
        }
        #wizHeader li .prevStep:after
        {
            border-left-color:#669966 !important;
        }
        #wizHeader li .currentStep
        {
            background-color: #C36615;
        }
        #wizHeader li .currentStep:after
        {
            border-left-color: #C36615 !important;
        }
        #wizHeader li .nextStep
        {
            background-color:#C2C2C2;
        }
        #wizHeader li .nextStep:after
        {
            border-left-color:#C2C2C2 !important;
        }
        #wizHeader
        {
            list-style: none;
            overflow: hidden;
            font: 18px Helvetica, Arial, Sans-Serif;
            margin: 0px;
            padding: 0px;
        }
        #wizHeader li
        {
            float: left;
        }
        #wizHeader li a
        {
            color: white;
            text-decoration: none;
            padding: 10px 0 10px 55px;
            background: brown; /* fallback color */
            background: hsla(34,85%,35%,1);
            position: relative;
            display: block;
            float: left;
        }
        #wizHeader li a:after
        {
            content: " ";
            display: block;
            width: 0;
            height: 0;
            border-top: 50px solid transparent; /* Go big on the size, and let overflow hide */
            border-bottom: 50px solid transparent;
            border-left: 30px solid hsla(34,85%,35%,1);
            position: absolute;
            top: 50%;
            margin-top: -50px;
            left: 100%;
            z-index: 2;
        }
        #wizHeader li a:before
        {
            content: " ";
            display: block;
            width: 0;
            height: 0;
            border-top: 50px solid transparent;
            border-bottom: 50px solid transparent;
            border-left: 30px solid white;
            position: absolute;
            top: 50%;
            margin-top: -50px;
            margin-left: 1px;
            left: 100%;
            z-index: 1;
        }        
        #wizHeader li:first-child a
        {
            padding-left: 10px;
        }
        #wizHeader li:last-child 
        {
            padding-right: 50px;
        }
        #wizHeader li a:hover
        {
            background: #FE9400;
        }
        #wizHeader li a:hover:after
        {
            border-left-color: #FE9400 !important;
        }        
        .content
        {
            height:auto;
            width:auto;           
            padding-top:75px;
            text-align:center;
            background-color:#F9F9F9;
            font-size:48px;
        }

    </style>

    <!--side menu css-->
    <style type="text/css">
        .side-menu {
              position: fixed;
              width: 290px;
              height: 150px;
              background-color: #f8f8f8;
              border-right: 1px solid #e7e7e7;
              margin-top:20px;
              margin-left:20px;
            }
            .side-menu .navbar {
              border: none;
            }
            .side-menu .navbar-header {
              width: 100%;
              border-bottom: 1px solid #e7e7e7;
            }
            .side-menu .navbar-nav .active a {
              background-color: transparent;
              margin-right: -1px;
              border-right: 5px solid #e7e7e7;
            }
            .side-menu .navbar-nav li {
              display: block;
              width: 100%;
              border-bottom: 1px solid #e7e7e7;
            }
            .side-menu .navbar-nav li a {
              padding: 15px;
            }
            .side-menu .navbar-nav li a .glyphicon {
              padding-right: 10px;
            }

            /* Main body section */
.side-body {
  margin-left: 10px;
}
/* small screen */
@media (max-width: 768px) {
  .side-menu {
    position: relative;
    width: 100%;
    height: 200px;
    border-right: 0;
    border-bottom: 1px solid #e7e7e7;
  }
  .side-menu .brand-name-wrapper .navbar-brand {
    display: inline-block;
  }
  /* Slide in animation */
  @-moz-keyframes slidein {
    0% {
      left: -300px;
    }
    100% {
      left: 10px;
    }
  }
  @-webkit-keyframes slidein {
    0% {
      left: -300px;
    }
    100% {
      left: 10px;
    }
  }
  @keyframes slidein {
    0% {
      left: -300px;
    }
    100% {
      left: 10px;
    }
  }
  @-moz-keyframes slideout {
    0% {
      left: 0;
    }
    100% {
      left: -300px;
    }
  }
  @-webkit-keyframes slideout {
    0% {
      left: 0;
    }
    100% {
      left: -300px;
    }
  }
  @keyframes slideout {
    0% {
      left: 0;
    }
    100% {
      left: -300px;
    }
  }
  /* Slide side menu*/
  /* Add .absolute-wrapper.slide-in for scrollable menu -> see top comment */
  .side-menu-container > .navbar-nav.slide-in {
    -moz-animation: slidein 300ms forwards;
    -o-animation: slidein 300ms forwards;
    -webkit-animation: slidein 300ms forwards;
    animation: slidein 300ms forwards;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
  }
  .side-menu-container > .navbar-nav {
    /* Add position:absolute for scrollable menu -> see top comment */
    position: fixed;
    left: -300px;
    width: 300px;
    top: 43px;
    height: 100%;
    border-right: 1px solid #e7e7e7;
    background-color: #f8f8f8;
    -moz-animation: slideout 300ms forwards;
    -o-animation: slideout 300ms forwards;
    -webkit-animation: slideout 300ms forwards;
    animation: slideout 300ms forwards;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
  }
  /* Uncomment for scrollable menu -> see top comment */
  /*.absolute-wrapper{
        width:285px;
        -moz-animation: slideout 300ms forwards;
        -o-animation: slideout 300ms forwards;
        -webkit-animation: slideout 300ms forwards;
        animation: slideout 300ms forwards;
        -webkit-transform-style: preserve-3d;
        transform-style: preserve-3d;
    }*/
  @-moz-keyframes bodyslidein {
    0% {
      left: 0;
    }
    100% {
      left: 300px;
    }
  }
  @-webkit-keyframes bodyslidein {
    0% {
      left: 0;
    }
    100% {
      left: 300px;
    }
  }
  @keyframes bodyslidein {
    0% {
      left: 0;
    }
    100% {
      left: 300px;
    }
  }
  @-moz-keyframes bodyslideout {
    0% {
      left: 300px;
    }
    100% {
      left: 0;
    }
  }
  @-webkit-keyframes bodyslideout {
    0% {
      left: 300px;
    }
    100% {
      left: 0;
    }
  }
  @keyframes bodyslideout {
    0% {
      left: 300px;
    }
    100% {
      left: 0;
    }
  }
  /* Slide side body*/
  .side-body {
    margin-left: 5px;
    margin-top: 70px;
    position: relative;
    -moz-animation: bodyslideout 300ms forwards;
    -o-animation: bodyslideout 300ms forwards;
    -webkit-animation: bodyslideout 300ms forwards;
    animation: bodyslideout 300ms forwards;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
  }
  .body-slide-in {
    -moz-animation: bodyslidein 300ms forwards;
    -o-animation: bodyslidein 300ms forwards;
    -webkit-animation: bodyslidein 300ms forwards;
    animation: bodyslidein 300ms forwards;
    -webkit-transform-style: preserve-3d;
    transform-style: preserve-3d;
  }
  /* Hamburger */
  .navbar-toggle {
    border: 0;
    float: left;
    padding: 18px;
    margin: 0;
    border-radius: 0;
    background-color: #f3f3f3;
  }
  /* Search */
  #search .panel-body .navbar-form {
    border-bottom: 0;
  }
  #search .panel-body .navbar-form .form-group {
    margin: 0;
  }
  .navbar-header {
    /* this is probably redundant */
    position: fixed;
    z-index: 3;
    background-color: #f8f8f8;
  }
  /* Dropdown tweek */
  #dropdown .panel-body .navbar-nav {
    margin: 0;
  }
}

    .paymentButton{
        font-weight:bold; 
        font-family:"Courier New"; 
        font-size:16px; 
        color:Navy;
        margin-right:30px;
    }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container shadow" style="margin-top:30px;background-color:#fff;">
  <div class="row">
    <div class="col-lg-12 ">
      <h1>STUDENT REGISTRATION    </h1>
      <div class="form-body registration">

    <div class="container">
 <asp:Wizard ID="Wizardstudentreg" runat="server" DisplaySideBar="false" OnFinishButtonClick="Wizardstudentreg_FinishButtonClick" 
      StepNextButtonStyle-CssClass="btn btn-danger btn-lg"  StepPreviousButtonStyle-CssClass="btn btn-danger btn-lg" 
     StartNextButtonStyle-CssClass="btn btn-danger btn-lg"  FinishCompleteButtonStyle-CssClass ="btn btn-danger btn-lg"
      FinishPreviousButtonStyle-CssClass="btn btn-danger btn-lg"  OnNextButtonClick="Wizardstudentreg_NextButtonClick" OnActiveStepChanged="Wizardstudentreg_ActiveStepChanged" >

                 <WizardSteps>
                    <asp:WizardStep ID="WizardUserType" runat="server" Title="Options">
                        <br>
                            <div>
                                <table id="tblPadding" style="margin: auto; width: 100%; color: Black;">
                                         <tr>
                                            <td><asp:RadioButton ID="rdonewUser" runat="server" Text="New User" checked="true" GroupName="Software" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" Font-Bold="true" Font-Names="Courier New" Font-Size="XX-Large" ForeColor="Navy"></asp:RadioButton></td>
                                            <td></td>
                                            <td><asp:RadioButton ID="rdoexisting" runat="server" Text="Existing User" Checked="false" GroupName="Software"  AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" Font-Bold="true" Font-Names="Courier New" Font-Size="XX-Large" ForeColor="Navy"></asp:RadioButton>
                                            <td></td>
                                            <td colspan="4"><asp:Label ID="lblUserTypeError" runat="server" Font-Bold="true" Font-Names="Comic Sans MS" ForeColor="Crimson" Font-Size="Large"></asp:Label></td>
                                         </tr>
                                         <tr>
                                            <td><asp:Label ID="lbFname1" runat="server" Text="First Name" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label></td>
                                            <td></td>
                                            <td><asp:TextBox ID="studentFname" CssClass="form-control" runat="server" Visible="false"></asp:TextBox></td>
                                            <td></td>
                                            <td></td>
                                            <td><asp:Label ID="lbLname1" runat="server" Text="Last Name" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label></td>
                                            <td></td>
                                            <td><asp:TextBox ID="studentLname" CssClass="form-control" runat="server" Visible="false"></asp:TextBox></td>
                                         </tr>
                                         <tr>
                                            <td></td>
                                            <td></td>
                                                <%-- <td><asp:RequiredFieldValidator id="RequiredFieldValidatorstudentsrch" runat="server" ErrorMessage="please Enter First Name" ForeColor="Red" ControlToValidate="studentFname"></asp:RequiredFieldValidator></td>--%>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <%-- <td><asp:RequiredFieldValidator id="RequiredFieldValidatorstudentsrch1" runat="server" ErrorMessage ="please Enter Last Name" ForeColor="Red" ControlToValidate="studentLname"></asp:RequiredFieldValidator></td>--%>
                                         </tr>

                                        <tr>
                                            <td><asp:Label ID="lblMobileNumber1" runat="server" Text="Mobile Number" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label></td>
                                            <td></td>
                                            <td><asp:TextBox ID="studentMobilenumber" CssClass="form-control" runat="server" MaxLength="10" Visible="false"></asp:TextBox></td>
                                            <td></td>
                                            <td></td>
                                            <td><asp:Label ID="lblEmail1" runat="server" Text="Email Id" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label></td>
                                            <td></td>
                                            <td><asp:TextBox ID="studentEmail" CssClass="form-control" runat="server" Visible="false"></asp:TextBox></td>
                                        </tr>

                                         <tr>
                                            <td></td>
                                            <td></td>
                                            <%-- <td><asp:RequiredFieldValidator id="RequiredFieldValidatorstudentmobsrch" runat="server" ForeColor="Red" ErrorMessage ="please Enter Mobile Number" ControlToValidate="studentMobilenumber"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatormobsrch" runat="server" ControlToValidate="studentMobilenumber" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                </td>--%>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                               <%--  <td>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidatoremailsrch" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="studentEmail" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                                 <asp:RequiredFieldValidator id="RequiredFieldValidatoremaiidsrch" runat="server" ForeColor="Red" ErrorMessage="Please Enter ur Email Id" ControlToValidate="studentEmail"></asp:RequiredFieldValidator>
                                                </td>--%>
                                        </tr>
                     
                                         <tr>
                                            <td><asp:Label ID="lblsdob" runat="server" Text="Date of Birth" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label></td>
                                            <td></td>
                                            <td><input id="studentDate" runat="server" class="form-control" type="date" value="yyyy-mm-dd" visible="false"/></td>
                                        </tr> 
                                </table>
                          </div>
                          </asp:WizardStep>
                   
                    <asp:WizardStep ID="WizardStep1" runat="server" Title=" Personal">
                    <div>
                    <br>
                           <h3> <span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span>Student Personal Details</h3>

                        <table id="tblPadding1" class="Resopnsive">
                              <tr>
                                            <td>
                                                <asp:Label ID="lblFname" runat="server" Text="First Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblLastName" runat="server" Text="Last Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                  </tr>
                                   <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                  <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="please Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                             <td>
                                               <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage ="please Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                   </tr>
                                   <tr>
                                             <td>
                                                <asp:Label ID="lblfatherguardian" runat="server" Text="Father/Guardian Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                                <asp:TextBox ID="txtfathergurdianname" CssClass="form-control" runat="server"></asp:TextBox>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                                <asp:Label ID="lblMothermaaidenname" runat="server" Text="Mother Maiden Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                                <asp:TextBox ID="txtMothername" CssClass="form-control" runat="server"></asp:TextBox>
                                             </td>
                                    </tr>
                                    <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Father/Guardian name" ForeColor="Red" ControlToValidate="txtfathergurdianname"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Mother Maiden Name" ForeColor="Red" ControlToValidate="txtMothername"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>

                                  </tr>
                                  <tr>
                                            <td>
                                                <asp:Label ID="lblDob" runat="server" Text="Date of Birth" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                              <%--  <asp:TextBox ID="txtdob" class="textusername" runat="server"></asp:TextBox>--%>
                                                 <input id="txtdob" runat="server" class="form-control" type="date" value="2011-01-13"/>
                                                <%--<img src="Images/calender.png" id="cdr" />--%>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblpob" runat="server" Text="Place of Birth" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtpob" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                    </tr>
                                    <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <%--<td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Date of birth" ForeColor="Red" ControlToValidate="txtdob"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Place of birth" ForeColor="Red" ControlToValidate="txtpob"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>


                                   </tr>
                                   <tr>
                                            <td>
                                                <asp:Label ID="lblmobileNumber" runat="server" Text="Mobile Number" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server" MaxLength="10"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblphone" runat="server" Text="Fixed/Land Line Number" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFixedLandline" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                 </tr>
                                 <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator id="RequiredFieldValidatormob" runat="server" ForeColor="Red" ErrorMessage ="please Enter  Mobile Number" ControlToValidate="txtmobile" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatormob1" runat="server" ControlToValidate="txtmobile" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter LandLine Number" ForeColor="Red" ControlToValidate="txtFixedLandline"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                  </tr>
                                  <tr>
                                            <td>
                                                <asp:Label ID="lblemail" runat="server" Text="Email Id" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblAlternateEmail" runat="server" Text="Alternate Email Id" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtaltrEmail" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                 </tr>
                                 <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                 <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
                                                 <asp:RequiredFieldValidator id="RequiredFieldValidatorEmail" runat="server" ForeColor="Red" ErrorMessage="Please Enter ur Email Id" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>

                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                          <%--  <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Alternative Email ID" ForeColor="Red" ControlToValidate="txtaltrEmail"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                 </tr>
                                 <tr>
                                            <td>
                                                <asp:Label ID="lblEducation" runat="server" Text="Education/Qualification" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEducation" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblTechnicalSkills" runat="server" Text="Technical Skills" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTechnicalSkills" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                 </tr>
                                 <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Education" ForeColor="Red" ControlToValidate="txtEducation"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter TechnicalSkills" ForeColor="Red" ControlToValidate="txtTechnicalSkills"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                  </tr>
                                  <tr>
                                            <td>
                                                <asp:Label ID="lblDirAccessCode" runat="server" Text="Student-AccessCode" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtStudentAccescode" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblphoto" runat="server" Text="Student Image" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:FileUpload ID="FileUploadImage" runat="server" Style="color: rgb(26, 56, 211);"
                                                     />
                                            </td>
                                 </tr>
                                 <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                          <%--  <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="Required"
                                                    ErrorMessage=" Enter Student Accescode" ForeColor="Red" ControlToValidate="txtStudentAccescode"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <%--<td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage=" Choose image to upload"
                                                    ValidationGroup="Required" ForeColor="Red" ControlToValidate="FileUploadImage"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ID="valUpTest" ControlToValidate="FileUploadImage"
                                                    ErrorMessage=" Image Files Only (.jpg,.png)" ValidationGroup="Required" Display="Dynamic"
                                                    Font-Size="11px" ForeColor="Red" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].))(.jpg|.JPG|.png|.PNG)$" />
                                            </td>--%>
                                    </tr>
    
                         </table>
                  
                   </div>
                 </asp:WizardStep>
                    
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Address">
                 <div>
                     <br>
                           <h3> <span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Student Address Details</h3>

                                <table id="tblPadding2"  class="table-responsive">
                          <tr>
                                            <td>
                                                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlcountry" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="India" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="USA" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblstate" runat="server" Text="State" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlstate" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Telangana" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                            </tr>
                            <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                       <td>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator" ControlToValidate="ddlcountry" InitialValue="0" runat="server" ErrorMessage="Please select Country "></asp:RequiredFieldValidator>
 
                                          </td> 
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlstate"
                                                  ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                                            </td>--%>
                            </tr>
                            <tr>
                                            <td>
                                                <asp:Label ID="lbldistrict" runat="server" Text="District" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="Hyderabad" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Rangareddy" Value="2"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                     <asp:Label ID="lblMandalTalukSubUrb" runat="server" Text="Mandal/Taluk/SubUrb" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                    <asp:DropDownList ID="ddlMandal" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                                                    Style="width: 100%;">
                                                    <asp:ListItem Text="Mandal/Taluk/SubUrb" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="TELANGANA" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                            </td>
                             </tr>
                             <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                          <%--  <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlDistrict"
                                                  ValidationGroup="Required" Font-Size="11px"  Display="Dynamic" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter Mandal/Taluka" ForeColor="Red" ControlToValidate="txtarea"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                              </tr>
                              <tr>
                                             <td>
                                             <asp:Label ID="lblVillageTownCity" runat="server" Text="Village/Town/City" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                             <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                                              Style="width: 100%;">
                                             <asp:ListItem Text="Village/Town/City" Value="0"></asp:ListItem>
                                             <asp:ListItem Text="TELANGANA" Value="1"></asp:ListItem>
                                             <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                             </asp:DropDownList>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                             </td>
                                             <td>
                                                <asp:Label ID="lblpincode" runat="server" Text="Pin Code" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtpincode" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                               </tr>
                                <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter City" ForeColor="Red" ControlToValidate="txtcity" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter Pincode" ForeColor="Red" ControlToValidate="txtpincode"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                               </tr>
                               <tr>
                                            <td>
                                                <asp:Label ID="lblStreetno" runat="server" Text="Street No." CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtstreetno" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblStreetname" runat="server" Text="Street Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtstreetname" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                 </tr>
                                 <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter StreetNo" ForeColor="Red" ControlToValidate="txtstreetno"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                          <%--  <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter StreetName" ForeColor="Red" ControlToValidate="txtstreetname"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                               </tr>
                                <tr>
                                            <td>
                                                <asp:Label ID="lblhouseno" runat="server" Text="House No./Door No/Plot No." CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txthouseno" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblFlatno" runat="server" Text="Flat No./Unit No." CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFlatno" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                               </tr>
                               <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter HouseNo" ForeColor="Red" ControlToValidate="txthouseno"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                           <%-- <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter Flat No" ForeColor="Red" ControlToValidate="txtFlatno" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                               </tr>
                               <tr>
                                            <td>
                                                <asp:Label ID="lblLandmark" runat="server" Text="Building/LandMark Name" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLandMark" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblLoc" runat="server" Text="Student Location" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtLocation" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                              </tr>
                              <tr>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <%--<td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter LandMark" ForeColor="Red" ControlToValidate="txtLandMark"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                            </td>
                                          <%--  <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="Required"
                                                    ErrorMessage="Enter Location" ForeColor="Red" ControlToValidate="txtLocation"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>--%>
                              </tr>
                      </table>

                  </div>
                </asp:WizardStep>
          
                    <asp:WizardStep ID="WizardStep3" runat="server" Title="Program">
                    <div style="width:100%">
                      <br>
                        <h3><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Student Program Details</h3>
                        <table id="tblPadding3" class="table-responsive" style="margin: auto; width: 100%; color: Black;">
                                    <tr>
                                             <td>
                                                  <asp:Label ID="lblSelectCategory" runat="server" Text="Select Category" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                              <asp:DropDownList ID="ddladdCategory" runat="server" AutoPostBack="true" CssClass="form-control" style="width:100%;"
                                                            OnSelectedIndexChanged="ddladdCategory_SelectedIndexChanged">
                                                       <asp:ListItem Text="--Select Category--" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                            </td>
                                            <td>
                                            <asp:RequiredFieldValidator  ID="RequiredFieldSelectCategeory"  ControlToValidate="ddladdCategory" InitialValue="0"
                                                   runat="server" ForeColor="Red" ErrorMessage="Please select Category"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                                            </td>
                                            <td></td>
                                        </tr>
                                    <tr>
                                             <td>
                                                <asp:Label ID="lblSelectCategorySchedule" runat="server" Text="Select Category-ScheduleId:Startdate-Enddate" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                                 <asp:DropDownList ID="ddlselectcategoryschedule" runat="server" CssClass="form-control" style="width:100%;" 
                                                     AppendDataBoundItems="true" OnSelectedIndexChanged="ddlselectcategoryschedule_SelectedIndexChanged" AutoPostBack="true">
                                                  </asp:DropDownList>
                                            </td>
                                          
                                            <td>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategerySchedule" ControlToValidate="ddlselectcategoryschedule" InitialValue="0"
                                                   runat="server" ForeColor="Red" ErrorMessage="Please select CategorySchedule"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                                             </td>
                                             <td></td>                                       
                                    </tr>
                                <tr>
                                            <td>
                                                <asp:Label ID="lblSelectGroup"  runat="server" Text="Select Group Year/Semester:Schedule" CssClass="control-label col-sm-12 text-left"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlGroup" runat="server" AutoPostBack="true" CssClass="form-control" style="width:100%;" OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidatorselectgroup" ControlToValidate="ddlGroup" InitialValue="0"
                                                   runat="server" ForeColor="Red" ErrorMessage="Please select Group"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>   </td>
                                          
                                            <td>
                                            <td></td>
                                    </tr>
                              </table>
                      <table style="width: 100%; margin: 0 auto;" class="table">
                          <tr>
                               <td>
                                   <asp:Label ID="lblGroupSubjects" Text="Required Subjects for the Group " runat="server" Visible="false"  Style="font-weight: bold; font-size: 18px;"></asp:Label>
                                   <asp:GridView ID="gvGroupSubjcts" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                            Style="width: 30%" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white">
                            <Columns>
                                <asp:BoundField HeaderText="SubjectId" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Subject Name " DataField="Subject_Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                            </Columns>
                        </asp:GridView>
                               </td>
                           </tr> 
                          <tr>
                               <td>
                                   <asp:Label ID="lblProgramErrors" runat="server" Visible="false"  Style="font-weight: bold; font-size: 18px; color:red"></asp:Label>
                               </td>
                           </tr>
                          <tr>
                            <td>
                                <asp:Panel ID="DataPanel" runat="server" Visible="false">
                                <div id="heading">
                            <asp:Label ID="lblRegStnds" runat="server" Text="Subjects Schedule"></asp:Label>
                        </div>
                        <asp:Label ID="lblDetailsId" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="lblRegisteredusers" Text="Subjects Schedule" runat="server" Visible="false"  Style="font-weight: bold; font-size: 18px;"></asp:Label>
                        <asp:GridView ID="gvSubjectsSchedule" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                            Style="width: 98%" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                            AllowPaging="true" PageSize="20" >
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSubjectId" runat="server"  />
                                        <asp:HiddenField ID="SubjectId" runat="server" Value='<%# Eval("SubjectId") %>' />
                                        <asp:HiddenField ID="CompanyId" runat="server" Value='<%# Eval("CompanyID") %>' />
                                        <asp:HiddenField ID="Branch" runat="server" Value='<%# Eval("BranchName") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Subject" DataField="SubjectIdName" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Subject Schedule" DataField="SubjSchedule" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="ClassType" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Org Location" DataField="OrgLoc" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Class Date" DataField="ClassDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Class Time" DataField="ClassTime" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                            </td>
                          </tr>
                      </table>
                 </div>
                </asp:WizardStep>
                
                    <asp:WizardStep ID="WizardSummary" runat="server" Title="Summary">
                        <br>

                                    <div id="stdpersonaldetail" class="panel panel-primary">
                        <div class="panel-heading"><span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span>Student Personal Details</div>
                              <div class="panel-body">
                                  <div class="row">
                                        <div class="col-md-6 pull-left">
                                              <div class="row">
                                                    <div class="form-group">
                                                                    <label class="control-label col-sm-5"  for="assocCmpName">First Name : </label>
                                                                    <asp:label id="lblFirstNameValue" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-7-left" runat="server"></asp:label>
                                                      </div>
                                                       <div class="clearfix"></div>
                                                        <div class="form-group">
                                                                    <label class="control-label col-sm-5"  for="">Father/Guardain Name </label>
                                                                    <asp:label id="lblFatherNameValue"  Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                         </div>
                                                         <div class="clearfix"></div>
                                                         <div class="form-group">
                                                                    <label class="control-label col-sm-5"  for="cmpEmail">Date Of Bith : </label>
                                                                    <asp:label id="lblDobValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                          </div>
                                                          <div class="clearfix"></div>
                                                           <div class="form-group">
                                                                      <label class="control-label col-sm-5"  for="branchesNo">Mobile No:</label>
                                                                      <asp:label id="lblMobileNumberValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                           </div>
                                                           <div class="clearfix"></div>
                                                            <div class="form-group">
                                                                        <label class="control-label col-sm-5"  for="branchesNo">Email Id:</label>
                                                                         <asp:label id="lblEmailIdValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                             <div class="form-group">
                                                                        <label class="control-label col-sm-5"  for="branchesNo">Education/Qualification:</label>
                                                                         <asp:label id="lblEductionValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                             </div>
                                                             <div class="clearfix"></div>
                                                             <div class="form-group">
                                                                         <label class="control-label col-sm-5"  for="branchesNo">Student-Access Code : </label>
                                                                         <asp:label id="lblStudentAccessCodeValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                               </div>
                                                               </div>
                                                                 <div class="col-md-6 pull-right">
                                                                <div class="row">
                                                                <div class="form-group">
                                                                          <label class="control-label col-sm-5"  for="regNumber">Last Name : </label>
                                                                        <asp:label id="lblLastNameValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                              <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                        <label class="control-label col-sm-5"  for="officePhone">Mother Maiden Name : </label>
                                                                        <asp:label id="lblMotherMaidenNameValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                               <div class="clearfix"></div>
                                                                <div class="form-group">
                                                                      <label class="control-label col-sm-5"  for="assocCmpAccCode">Place Of Birth : </label>
                                                                       <asp:label id="lblPobValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                               <div class="clearfix"></div>
                                                                <div class="form-group">
                                                                      <label class="control-label col-sm-5"  for="assocCmpAccCode">Fixed/Land Line Number: </label>
                                                                        <asp:label id="lblLandLineNumberValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                              <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                        <label class="control-label col-sm-5"  for="assocCmpAccCode">AlterNate Email Id : </label>
                                                                         <asp:label id="lblAlterEmailIdValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                              <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                        <label class="control-label col-sm-5"  for="assocCmpAccCode">Technical Skills : </label>
                                                                        <asp:label id="lblTechnicalSkillValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                              <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                         <label class="control-label col-sm-5"  for="assocCmpAccCode">Faculty Image : </label>
                                                                         <asp:label id="lblStudentImageValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>                                                        
                                        </div>
                                    <div class="clearfix"></div>
                                    <div id="studentaddresssDetails" class="panel panel-primary">
                                        <div class="panel-heading"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Student Address Details</div>
                                                <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6 pull-left">
                                                        <div class="row">
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpCountry">Country : </label>
                                                                    <asp:label id="lblCountryValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpCity">District : </label>
                                                                    <asp:label id="lblDistrictValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="village">Village/Toen/City : </label>
                                                                   <asp:label id="lblVillageTownValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                             <div class="clearfix"></div>
                                                            <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpStreetNo">Street No : </label>
                                                                    <asp:label id="lblStreetNoValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmphouseNo">House No/Door No : </label>
                                                                    <asp:label id="lblHousePlotNoValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpLandMark">Building/LandMark Name : </label>
                                                                   <asp:label id="lblBuildingLandMarkValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 pull-right">
                                                        <div class="row">
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpState">State : </label>
                                                                    <asp:label id="lblStateValue" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-12-left" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5" for="mandal">Mandal/Taluk/SubUrb:</label>
                                                                    <asp:label id="lblManadalTalukValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="pinCode">PinCOde : </label>
                                                                   <asp:label id="lblPinCodeValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                             <div class="clearfix"></div>
                                                            <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpStreetNo">Street Name : </label>
                                                                    <asp:label id="lblStreetNameValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpFlatNo">Flat No/Unit No : </label>
                                                                    <asp:label id="lblFlatNoValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5" for="studentLocation">Student Location : </label>
                                                                   <asp:label id="lblStudentLocationValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                              <div class="clearfix"></div>
                                                             <div class="form-group">
                                                                <label class="control-label col-md-5"  for="lblprogAmount"> SUB-SCHID-DATE: </label>
                                                                <asp:label id="lblSubSchdDateValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-md-7" runat="server"></asp:label>
                                                              </div>
                                                               
                                                        </div>
                                                    </div>
                                                </div>                                
                                            </div> 
                                     </div>
                                   <div class="clearfix"></div>
                                    <div id="studentprogramdetail" class="panel panel-primary">
                                        <div class="panel-heading"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Student Program Details</div>
                                                <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6 pull-left">
                                                        <div class="row">
                                                              <div class="form-group">
                                                                <label class="control-label col-sm-5" for="cmpState">Category : </label>
                                                                <asp:label id="lblSelectCategoryValue" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-12-left" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="cmpCity">Categeory Schedule : </label>
                                                                   <asp:label id="lblSelectedCategeorySheduleValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                                <div class="clearfix"></div>
                                                              <div class="form-group">
                                                                  <label class="control-label col-sm-5" for="mandal">Group : </label>
                                                                    <asp:label id="lblSelectGroupValue"  Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                             <div class="clearfix"></div>
                                                            <div class="form-group">
                                                                  <label class="control-label col-sm-5"  for="pinCode">Year-Sem Schedule : </label>
                                                                   <asp:label id="lblSelectYearSemSheduleValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                                              </div>
                                                          </div>
                                                    </div>
                                                   
                                            </div>                            
                                
                </asp:WizardStep>
                    
                     <asp:WizardStep ID="WizardPayment" runat="server" Title="Payment">
                         <hr />

                         <div id="programInfo" class="panel panel-primary">
                        <div class="panel-heading"><span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span>Program Details</div>
                              <div class="panel-body">
                                  <div class="row">
                                        <div class="col-md-12 pull-left">
                                              <div class="row">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-5"  for="paymentCategory"> Category : </label>
                                                         <asp:label id="paymentCategory" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-md-7" runat="server"></asp:label>
                                                    </div>
                                                      <div class="clearfix"></div>
                                                        <div class="form-group">
                                                        <label class="control-label col-md-5"  for="paymentCategorySchedule"> Categeory Schedule: </label>
                                                        <asp:label id="paymentCategorySchedule"  Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-md-7" runat="server"></asp:label>
                                                      </div>
                                                      <div class="clearfix"></div>
                                                      <div class="form-group">
                                                        <label class="control-label col-md-5"  for="paymentGroup"> Group : </label>
                                                        <asp:label  id="paymentGroup" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-md-7" runat="server"></asp:label>
                                                        </div>
                                                      <div class="clearfix"></div>
                                                           <div class="form-group">
                                                          <label class="control-label col-md-5"  for="paymentYearSem"> Year-Sem Schedule : </label>
                                                            <asp:label id="paymentYearSem" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-md-7" runat="server"></asp:label>
                                                        </div>
                                                          
                                                            
                                                               </div>
                                                                

                                        </div>
                                        </div>
                                   </div>
                                </div>                                                        
                      
                         
                         <div class="row">
             
                            <!-- Menu -->
                            <%--<div class="side-menu">
    
                            <nav class="navbar navbar-default" role="navigation">

                                <!-- Main Menu -->
                                <div class="side-menu-container">
                                    <ul class="nav navbar-nav">
                                        <li class="active" onclick="showPayment('payment1')"><a href="#payment1"><span class="glyphicon glyphicon-send"></span>Credit Card</a></li>
                                        <li><a href="#payment2" onclick="showPayment('payment2')"><span class="glyphicon glyphicon-plane"></span> netbanking</a></li>
                                        <li><a href="#payment3" onclick="showPayment('payment3')"><span class="glyphicon glyphicon-cloud"></span> Direct</a></li>
                                    </ul>
                                </div><!-- /.navbar-collapse -->
                            </nav>
    
                            </div>--%>
                             

                            <!-- Main Content -->
                            <div class="container-fluid">
                                <div class="side-body">
                                    <table>
                                            <tr>
                                                    <td><asp:RadioButton ID="creditCard" runat="server" Text="Credit Card" checked="true" OnCheckedChanged="PaymentOption_Changed" GroupName="paymentType" AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton></td>
                                                    <td></td>
                                                    <td><asp:RadioButton ID="netBanking" runat="server" Text="Net Banking" checked="false" OnCheckedChanged="PaymentOption_Changed" GroupName="paymentType" AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton></td>
                                                    <td></td>
                                                    <td><asp:RadioButton ID="accountTransfer" runat="server" Text="Account Transfer" Checked="false" OnCheckedChanged="PaymentOption_Changed" GroupName="paymentType"  AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton>
                                                    <td></td>
                                            </tr>
                                     </table>
                                   <div id="payment1" Visible="true" runat="server" ClientIDMode="static">
                                       <h1>Credit Card Content here</h1>
                                   </div>
                                   <div id="payment2" runat="server" ClientIDMode="static" Visible="false"><h1>Account Detail</h1>
                                       <div class="row">
                                                <div class="col-md-6 pull-left">
                                                    <div class="row">
                                                        <div class="form-group">
                                                            <label id="lblAccno" class="control-label col-sm-5"  for="FromAccountNo">Account No : </label>
                                                             <label id="lblAccvalue" class="control-label col-sm-5"  for="FromAccountNo">123456789 </label>
                                                        
                                                            <asp:label id="Label1" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-7-left" runat="server"></asp:label>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label id="lblAccountName" class="control-label col-sm-5"  for="fromAccountName">Account Name : </label>
                                                            <label id="lblAccnamevalue" class="control-label col-sm-5"  for="fromAccountName">Sapthashri </label>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label id="lblifscCode" class="control-label col-sm-5"  for="fromifsccode">IFSC Code : </label>
                                                              <label id="lblifscvalue" class="control-label col-sm-5"  for="fromifsccode">8686 : </label>
                                                         
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label id="ablbranch" class="control-label col-sm-5"  for="fromBankBranch">Branch Name : </label>
                                                              <label id="lblbranch" class="control-label col-sm-5"  for="fromBankBranch">Branch Name </label>
                                                          
                                                        </div>
                                                     </div>
                                                    </div>
                                           </div>
                                       </div>
                                                        <div id="payment3" runat="server" ClientIDMode="static" Visible="false">
                                       <h1>Account Transfer</h1>
                                        <div class="row">
                                            <div class="col-md-6 pull-left">
                                                <div class="row">
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-5"  for="bankName">Bank Name: </label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox id="bankName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-5"  for="branchName">Branch: </label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox id="branchName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control col-sm-6" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-5" for="amount">Amount : </label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox id="amount" Font-Bold="true" ClientIDMode="Static" CssClass="form-control col-sm-6" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-5" for="transactionIds">Transaction Id : </label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox id="transactionIds" Font-Bold="true" ClientIDMode="Static" CssClass="form-control col-sm-6" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="form-group">
                                                            <label class="control-label col-sm-5" for="accNumber">Account Number : </label>
                                                            <div class="col-sm-6">
                                                                <asp:TextBox id="accNumber" Font-Bold="true" ClientIDMode="Static" CssClass="form-control col-sm-6" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                   </div>
  </div>
                    </asp:WizardStep>
               </WizardSteps>
                <HeaderTemplate>
                <ul id="wizHeader">
                    <asp:Repeater ID="SideBarList" runat="server">
                        <ItemTemplate>
                            <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                                <%# Eval("Name")%></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </HeaderTemplate>
        </asp:Wizard>
        </div>
        <div class="formbuttons"><asp:Button ID="btn"   CssClass="btn btn-danger btn-lg" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;"/><button type="submit" class="btn btn-danger btn-lg">Cancel</button></div>
      </div>
    </div>
   </div>
  
    <div>
     </div>
    </div>
          <div class="topbar"></div>
                <div class="container footer">
                    <div class="container"> © <%=DateTime.Now.Year%> STCIPL INSTITUTE All rights reserved. </div>
              </div>
  
    <script type="text/javascript">
        function Check_Click(objRef) {          //Remove MultiCheckBox wn uncheck of any item
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;
            if (objRef.checked) {
                //If checked change color to Aqua
                //            row.style.backgroundColor = "aqua";
            }
            else {
                //If not checked change back to original color
                if (row.rowIndex % 2 == 0) {
                    //Alternating Row Color
                    //                row.style.backgroundColor = "#C2D69B";
                }
                else {
                    //                row.style.backgroundColor = "white";
                }
            }

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;

        }
    </script>
    <script type="text/javascript">
        function showPayment(paymentId) {
            if (paymentId == "payment1") {
                $('#' + paymentId).show();
                $('#payment2').hide();
                $('#payment3').hide();
            }
            if (paymentId == "payment2") {
                $('#' + paymentId).show();
                $('#payment1').hide();
                $('#payment3').hide();
            }
            if (paymentId == "payment3") {
                $('#' + paymentId).show();
                $('#payment1').hide();
                $('#payment2').hide();
            }
        }
    </script>
    
</asp:Content>
