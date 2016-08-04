﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Regestration.Master" AutoEventWireup="true" CodeBehind="Student-Regestration.aspx.cs" Inherits="DemoSchool.Student_Regestration" %>
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
      FinishPreviousButtonStyle-CssClass="btn btn-danger btn-lg"  OnNextButtonClick="Wizardstudentreg_NextButtonClick" >

 <WizardSteps>
   <asp:WizardStep ID="Wizardrdo" runat="server" Title="Options">
   <br>
   <div>
        <table id="tblPadding" class="table-responsive" style="margin: auto; width: 100%; color: Black;">
                         <tr>
                                   <td>
                                      <asp:Label ID="lblrd" runat="server" Font-Bold="true" Font-Names="Comic Sans MS" ForeColor="Crimson" Font-Italic="true" Font-Size="X-Large"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                      <asp:RadioButton ID="rdonewUser" runat="server" Text="New User" checked="true" GroupName="Software" AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" Font-Bold="true" Font-Names="Courier New" Font-Size="XX-Large" ForeColor="Navy"></asp:RadioButton>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                      <asp:RadioButton ID="rdoexisting" runat="server" Text="Existing User" Checked="false" GroupName="Software"  AutoPostBack="true" OnCheckedChanged="RadioButton_CheckedChanged" Font-Bold="true" Font-Names="Courier New" Font-Size="XX-Large" ForeColor="Navy"></asp:RadioButton>
                                    <td>
                                    </td>
                         </tr>
                        
                         <tr>
                      
                                <td>
                                   <asp:Label ID="lbFname1" runat="server" Text="First Name" class="control-label col-sm-12 text-left" Visible="false"></asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                   <asp:TextBox ID="studentFname" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                   <asp:Label ID="lbLname1" runat="server" Text="Last Name" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label>
                                </td>
                                <td>
                                </td>
                                <td>
                                   <asp:TextBox ID="studentLname" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                                <td>
                                </td>
                                <td>
                                </td>

                                <%-- <td>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidatorstudentsrch" runat="server" ErrorMessage="please Enter First Name" ForeColor="Red" ControlToValidate="studentFname"></asp:RequiredFieldValidator>
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
                                 <asp:RequiredFieldValidator id="RequiredFieldValidatorstudentsrch1" runat="server" ErrorMessage ="please Enter Last Name" ForeColor="Red" ControlToValidate="studentLname"></asp:RequiredFieldValidator>
                                </td>--%>


                        </tr>

                        <tr>
                                 <td>
                                    <asp:Label ID="lblMobileNumber1" runat="server" Text="Mobile Number" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label>
                                 </td>
                                 <td>
                                 </td>
                                 <td>
                                    <asp:TextBox ID="studentMobilenumber" CssClass="form-control" runat="server" MaxLength="10" Visible="false"></asp:TextBox>
                                 </td>
                                 <td>
                                 </td>
                                 <td>
                                 </td>

                                 <td>
                                    <asp:Label ID="lblEmail1" runat="server" Text="Email Id" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label>
                                 </td>
                                 <td>
                                 </td>
                                 <td>
                                    <asp:TextBox ID="studentEmail" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                                 </td>

                     </tr>

                         <tr>
                                <td>
                                </td>
                                <td>
                                </td>

                                <%-- <td>
                                          <asp:RequiredFieldValidator id="RequiredFieldValidatorstudentmobsrch" runat="server" ForeColor="Red" ErrorMessage ="please Enter Mobile Number" ControlToValidate="studentMobilenumber"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatormobsrch" runat="server" ControlToValidate="studentMobilenumber" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
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
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatoremailsrch" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="studentEmail" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator id="RequiredFieldValidatoremaiidsrch" runat="server" ForeColor="Red" ErrorMessage="Please Enter ur Email Id" ControlToValidate="studentEmail"></asp:RequiredFieldValidator>

                                </td>--%>


                        </tr>
                     <tr>
                                 <td>
                                    <asp:Label ID="lblsdob" runat="server" Text="Date of Birth" CssClass="control-label col-sm-12 text-left" Visible="false"></asp:Label>                           
                                 </td>
                                 <td>
                                 </td>
                                 <td>
                                   <input id="studentDate" runat="server" CssClass="form-control" type="date" value="yyyy-mm-dd" visible="false"/>

                                 </td>


                     </tr>
                         
          </table>

                     
          </div>
          </asp:WizardStep>



   <asp:WizardStep ID="WizardStep1" runat="server" Title=" Personal">
    <div>
    <br>
           <h3> <span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span>Student Personal Details</h3>

        <table id="tblPadding" class= "table-responsive" >
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
                                  <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="please Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
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
                               <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage ="please Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator id="RequiredFieldValidatormob" runat="server" ForeColor="Red" ErrorMessage ="please Enter  Mobile Number" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatormob1" runat="server" ControlToValidate="txtmobile" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
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
                                 <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator id="RequiredFieldValidatorEmail" runat="server" ForeColor="Red" ErrorMessage="Please Enter ur Email Id" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>

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
                                    ValidationGroup="Required" />
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

                <table id="tblPadding" class="table-responsive" >
          <tr>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
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
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
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
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlcountry"
                                  ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red"  ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Hyderabad" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Rangareddy" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblarea" runat="server" Text="Mandal/Taluk/SubUrb" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtarea" CssClass="form-control" runat="server"></asp:TextBox>
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
                                <asp:Label ID="lblvillage" runat="server" Text="Village/Town/City" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcity" CssClass="form-control" runat="server"></asp:TextBox>
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
                                <asp:Label ID="lblhouseno" runat="server" Text="House No./Door No/Plot No." class="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txthouseno" class="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblFlatno" runat="server" Text="Flat No./Unit No." class="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFlatno" class="form-control" runat="server"></asp:TextBox>
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
                                <asp:Label ID="lblLandmark" runat="server" Text="Building/LandMark Name" class="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLandMark" class="form-control" runat="server"></asp:TextBox>
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
               
 <asp:WizardStep ID="WizardStep3" runat="server" Title=" Program">
  <div>
      <br>
        <h3><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Faculty Program Details</h3>
        <table id="tblPadding" class="table-responsive" style="margin: auto; width: 100%; color: Black;">
                    <tr>
                             <td>
                               <asp:Label ID="lblSelectProgram" runat="server" Text="Select Program" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSelectProgram" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Program" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="GRADUTION" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="MBBS" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="DEPLOMA" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblSelectCategory" runat="server" Text="Select Category" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectcategory" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Schedule" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                 </tr>
                 <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlSelectProgram"
                                  ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red"  ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlselectcategory"
                                  ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                            </td>--%>
                </tr>
                <tr>
                            <td>
                                <asp:Label ID="lblSelectCategorySchedule" runat="server" Text="Select Category Schedule" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectcategoryschedule" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Category Schedule" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                                  <td>
                                <asp:Label ID="lblSelectGroup" runat="server" Text="Select Group" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectgroup" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Group" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
 
                  </tr>
                  <tr>
                            <td>
                                <asp:Label ID="lblSelectYear" runat="server" Text="Select Year" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectyear" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Year" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                                  <td>
                                <asp:Label ID="lblselectyearsem" runat="server" Text="Select Year-Sem Schedule" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectyearsemschedule" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Group" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
 
                 </tr>
                 <tr>
      
                            <td>
                                <asp:Label ID="lblSelectSubjects" runat="server" Text="Select Subjects" CssClass="control-label col-sm-12 text-left"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlselectsubjects" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                    <asp:ListItem Text="Select Year" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
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
                                                      <label class="control-label col-sm-5"  for="branchesNo">Mobile No : </label>
                                                      <asp:label id="lblMobileNumberValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                           </div>
                                           <div class="clearfix"></div>
                                            <div class="form-group">
                                                        <label class="control-label col-sm-5"  for="branchesNo">Email Id : </label>
                                                         <asp:label id="lblEmailIdValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                            </div>
                                            <div class="clearfix"></div>
                                             <div class="form-group">
                                                        <label class="control-label col-sm-5"  for="branchesNo">Education/Qualification : </label>
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
                                                    <asp:label id="lblCountryValue" Font-Bold="true" ClientIDMode="Static" class="form-control-static col-sm-7" runat="server"></asp:label>
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
                                                  <label class="control-label col-sm-5" for="mandal">Mandal/Taluk/SubUrb : </label>
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
                                                  <label class="control-label col-sm-5"  for="cmpCountry">Select Program: </label>
                                                    <asp:label id="lblSelectProgramValue" Font-Bold="true" ClientIDMode="Static" class="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpCity">Select Categeory Schedule : </label>
                                                    <asp:label id="lblSelectCategeorySheduleValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5" for="village">Select Year : </label>
                                                   <asp:label id="lblSelectYearValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                             <div class="clearfix"></div>
                                            <div class="form-group">
                                                  <label class="control-label col-sm-5" for="cmpStreetNo">Select Subjects : </label>
                                                    <asp:label id="lblSelectSubjectsValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                          </div>
                                    </div>
                                    <div class="col-md-6 pull-right">
                                        <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5" for="cmpState">Select Category : </label>
                                                    <asp:label id="lblSelectCategoryValue" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-12-left" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5" for="mandal">Select Group : </label>
                                                    <asp:label id="lblSelectGroupValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="pinCode">Select Year-Sem Schedule : </label>
                                                   <asp:label id="lblSelectYearSemSheduleValue" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
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
        <div class="formbuttons"><asp:Button ID="btn" type="submit" CssClass="btn btn-danger btn-lg" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;"/><button type="submit" class="btn btn-danger btn-lg">Cancel</button></div>
      </div>
    </div>
   </div>
 </div>    
    <div>
     </div>
          <div class="topbar"></div>
                <div class="container footer">
                    <div class="container"> © <%=DateTime.Now.Year%> STCIPL INSTITUTE All rights reserved. </div>
              </div>
    
</asp:Content>
