<%@ Page Title="" Language="C#" MasterPageFile="~/Regestration.Master" AutoEventWireup="true" CodeBehind="Counsellorreg.aspx.cs" Inherits="DemoSchool.Counsellorreg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    
     <style type="text/css">
        #rdbtnDiv
        {
            color: rgb(16, 99, 168);
            width: 100%;
            margin: auto;
            border: 1px solid white;
            background-color: Silver;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;">
  <div class="row">
    <div class="col-lg-12 ">
      <h1>COUNSELLOR  REGISTRATION  </h1>
      
      <div class="form-body registration">
      <div class="container">
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="tab" href="#CounsellorPersonalDetails"> Counsellor Personal Details</a></li>
    <li><a data-toggle="tab" href="#CounsellorAddressDetails"> Counsellor Address Details</a></li>
    <li><a data-toggle="tab" href="#CounsellorEmployerDetails"> Counsellor Employer Details</a></li>
      </ul>

  <div class="tab-content">
    <div id="CounsellorPersonalDetails" class="tab-pane fade in active">
      <h3> Counsellor Personal Details</h3>
    
           <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
                 <tr>
                            <td>
                                <asp:Label ID="lblFname" runat="server" Text="First Name" Style="color:black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblLastName" runat="server" Text="Last Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                       <%--   <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
               <br>
                        <tr>
                            <td>
                                <asp:Label ID="lblfatherguardian" runat="server" Text="Father/Guardian Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtfathergurdianname" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblMothermaaidenname" runat="server" Text="Mother Maiden Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMothername" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                         <%--   <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Father/Guardian name" ForeColor="Red" ControlToValidate="txtfathergurdianname"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mother Maiden Name" ForeColor="Red" ControlToValidate="txtMothername"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDob" runat="server" Text="Date of Birth" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                               <%-- <asp:TextBox ID="txtdob" class="textusername" runat="server"></asp:TextBox>--%>
                                <input id="txtdob"  type="date" value="yyyy-mm-dd"/>
                              <%--  <img src="Images/calender.png" id="cdr" />--%>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpob" runat="server" Text="Place of Birth" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpob" class="textusername" runat="server"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                          <%--  <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Date of birth" ForeColor="Red" ControlToValidate="txtdob"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Place of birth" ForeColor="Red" ControlToValidate="txtpob"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblmobileNumber" runat="server" Text="Mobile Number" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtmobile" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblphone" runat="server" Text="Fixed/Land Line Number" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFixedLandline" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Required"
                                    ControlToValidate="txtmobile" Font-Size="11px" ErrorMessage="* Please Enter Numbers "
                                    ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter LandLine Number" ForeColor="Red" ControlToValidate="txtFixedLandline"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblemail" runat="server" Text="Email Id" Style="color: black; font-weight: bold;"></asp:Label><font
                                    style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblAlternateEmail" runat="server" Text="Alternate Email Id" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtaltrEmail" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                          <%--  <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Email ID" ForeColor="Red" ControlToValidate="txtEmail"
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
                         <%--   <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Alternative Email ID" ForeColor="Red" ControlToValidate="txtaltrEmail"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEducation" runat="server" Text="Education/Qualification" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEducation" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblTechnicalSkills" runat="server" Text="Technical Skills" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTechnicalSkills" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                          <%--  <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Education" ForeColor="Red" ControlToValidate="txtEducation"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter TechnicalSkills" ForeColor="Red" ControlToValidate="txtTechnicalSkills"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAccessCode" runat="server" Text="Counsellor Access Code" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAccessCode" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblphoto" runat="server" Text="Counsellor Image" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
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
                          <%--  <<%--td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Student Accescode" ForeColor="Red" ControlToValidate="txtAccessCode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>--%>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="* Choose image to upload"
                                    ValidationGroup="Required" ForeColor="Red" ControlToValidate="FileUploadImage"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="valUpTest" ControlToValidate="FileUploadImage"
                                    ErrorMessage="* Image Files Only (.jpg,.png)" ValidationGroup="Required" Display="Dynamic"
                                    Font-Size="11px" ForeColor="Red" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpg|.JPG|.png|.PNG)$" />
                            </td>--%>
                        </tr>
               
             
               
               </table>
      
    </div>
    <div id="CounsellorAddressDetails" class="tab-pane fade">
      <h3> Counsellor Address Details</h3>
     
           <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
                  
                        <tr>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 72%;">
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
                                <asp:Label ID="lblstate" runat="server" Text="State" Style="color: black; font-weight: bold;"></asp:Label><font
                                    style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 59%;">
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
                          <%--  <td>
                                <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlcountry"
                                    ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="* Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlstate"
                                    ValidationGroup="Required" Font-Size="11px" Display="Dynamic" ForeColor="Red"
                                    ErrorMessage="* Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbldistrict" runat="server" Text="District" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 72%;">
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
                                <asp:Label ID="lblMandalTalukSubUrb" runat="server" Text="Mandal/Taluk/SubUrb" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMandal" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 72%;">
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
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlDistrict"
                                    ValidationGroup="Required" Display="Dynamic" ForeColor="Red" Font-Size="11px"
                                    ErrorMessage="* Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                    ErrorMessage="*Enter Mandal/Taluka" ForeColor="Red" ControlToValidate="txtarea"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblVillageTownCity" runat="server" Text="Village/Town/City" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlVillage" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 72%;">
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
                                <asp:Label ID="lblpincode" runat="server" Text="Pin Code" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpincode" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter City" ForeColor="Red" ControlToValidate="txtcity" Display="Dynamic"
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
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter Pincode" ForeColor="Red" ControlToValidate="txtpincode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStreetno" runat="server" Text="Street No." Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtstreetno" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblStreetname" runat="server" Text="Street Name" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtstreetname" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter StreetNo" ForeColor="Red" ControlToValidate="txtstreetno"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter StreetName" ForeColor="Red" ControlToValidate="txtstreetname"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblhouseno" runat="server" Text="House No./Door No/Plot No." Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txthouseno" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblFlatno" runat="server" Text="Flat No./Unit No." Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFlatno" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter HouseNo" ForeColor="Red" ControlToValidate="txthouseno"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter Flat No" ForeColor="Red" ControlToValidate="txtFlatno" Display="Dynamic"
                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLandmark" runat="server" Text="Building/LandMark Name" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLandMark" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblLoc" runat="server" Text="Counseller Location" Style="color: black;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLocation" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="Required"
                                    ErrorMessage="*Enter LandMark" ForeColor="Red" ControlToValidate="txtLandMark"
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
                                    ErrorMessage="*Enter Location" ForeColor="Red" ControlToValidate="txtLocation"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
      
               </table>
 
    </div>
    <div id="CounsellorEmployerDetails" class="tab-pane fade">
      <h3> Counsellor Employer Details</h3>
      
            <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
             <tr>
                            <td>
                                <asp:Label ID="lblWorkExp" runat="server" Text="Work Experience(YRs)" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtworkExp" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblEmployerName" runat="server" Text="Employer Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmployerName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Reg.code" ForeColor="Red" ControlToValidate="txtDirectorregcode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
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
                                <%--   <asp:CustomValidator ID="directorddl" runat="server" ClientValidationFunction="validate" ControlToValidate="ddlProgramme"
                                ErrorMessage="* Select a Programe" ForeColor="Red" ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                CssClass="Validator">
                            </asp:CustomValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmployerAddress" runat="server" Text="Employer Address" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEMpAddress" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblempPhone" runat="server" Text="Employer Phone" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpPhone" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Reg.code" ForeColor="Red" ControlToValidate="txtDirectorregcode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
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
                                <%--   <asp:CustomValidator ID="directorddl" runat="server" ClientValidationFunction="validate" ControlToValidate="ddlProgramme"
                                ErrorMessage="* Select a Programe" ForeColor="Red" ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                CssClass="Validator">
                            </asp:CustomValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmpEmail" runat="server" Text="Employer Email" Style="color: blck;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpEmail" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Reg.code" ForeColor="Red" ControlToValidate="txtDirectorregcode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
 
    
                    </table>
        </div>
            </div>
                    </div>    
             <div class="formbuttons"><button type="submit" class="btn btn-danger btn-lg">Register</button> <button type="submit" class="btn btn-danger btn-lg">Reset</button> <button type="submit" class="btn btn-danger btn-lg">Cancel</button></div>
      </div>
           </div>
    
    <div> </div>
  </div>
     
  <div class="topbar"></div>
</div>
     
      
            <div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
      
       
</asp:Content>
