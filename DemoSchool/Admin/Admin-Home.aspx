<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-Home.aspx.cs" Inherits="PresentationLayer.Admin.Admin_Home" %>

<asp:Content ID="headstyle" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="../Styles/UploadStyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            function ShowPreview(input) {
                if (input.files && input.files[0]) {
                    var ImageDir = new FileReader();
                    ImageDir.onload = function (e) {
                        $("#<%=impPrev.ClientID %>").attr('src', e.target.result);
                    }
                    ImageDir.readAsDataURL(input.files[0]);
                }
            }  
    </script> 
    <script type="text/javascript">
        $.noConflict();
        $(document).ready(function () {
            $("#<%=txtdob.ClientID %>").datepicker({ maxDate: '0', dateFormat: 'yy-mm-dd', beforeShow: function () {
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
            width: 67%;
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
            padding-top: 6px;
        }
        #map td 
        {
            color:White;
            font-size:10px;
            background-color:#2E2E2E;
            padding:10px;
        }
        #map a
        {
            color:White;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="contentRegistration" ContentPlaceHolderID="content" runat="server">
<table id="map" style="width:72%;margin:auto;margin-top:20px;">
<tr>
<td style="width:100%;text-align:left"><a href="#">ADM-OPERATIONS</a> > <a href="Admin-Home.aspx" style="color:#00CCFF">Home</a> </td>
</tr>
</table>
    <div style="margin-top: 0px;">
        <table style="width:100%;">
            <tr style="width:100%;">
                <td style="width:80%;">
                <table style="width: 80%; height: 450px; margin-left:6%;">
            <tr>
               
            </tr>
            <tr>
                <td style="width: 100%">
                    <h2 style="color: #002290; margin-left: 126px;">
                        Admin Profile</h2>
                    <table id="tblPadding" style="margin: auto;width: 100%;color: Black;margin-left: 15%;">
                        <p class="bg-info" style="width: 93%; margin-left: 126px; font-weight: bold;">
                            &nbsp;&nbsp;Admin Personal Details</p>
                        <tr>
                            <td>
                                <asp:Label ID="lblFname" runat="server" Text="First Name" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="txtEditFirstName" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                                <%-- <asp:TextBox ID="txtFirstName" class="textusername" runat="server"></asp:TextBox>--%>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblLastName" runat="server" Text="Last Name" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="txtEditLastName" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName"
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
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblfatherguardian" runat="server" Text="Father/Guardian Name" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="txtEditFatherName" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblMothermaaidenname" runat="server" Text="Mother Maiden Name" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="txtEditmotherName" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Father/Guardian name" ForeColor="Red" ControlToValidate="txtfathergurdianname"
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
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mother Maiden Name" ForeColor="Red" ControlToValidate="txtMothername"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDob" runat="server" Text="Date of Birth" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtdob" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditDOB" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                                <asp:Panel ID="calenderPanel" runat="server" visible="false">
                                <img src="../Images/calender.png" id="cdr" style="margin-top: -24px;margin-left: 68%;"  />
                                </asp:Panel>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpob" runat="server" Text="Place of Birth" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpob" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditPOB" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Date of birth" ForeColor="Red" ControlToValidate="txtdob"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Place of birth" ForeColor="Red" ControlToValidate="txtpob"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblmobileNumber" runat="server" Text="Mobile Number" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtmobile" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditMobile" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblphone" runat="server" Text="Fixed/Land Line Number" Style="color: #002290;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFixedLandline" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditFixedLandline" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblemail" runat="server" Text="Email Id" Style="color: #002290; font-weight: bold;"></asp:Label><font
                                    style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditEmail" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblAlternateEmail" runat="server" Text="Alternate Email Id" Style="color: #002290;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtaltrEmail" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditaltrEmail" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDirAccessCode" runat="server" Text="Admin-AccessCode" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:TextBox ID="txtDirAccessCode" class="textusername" runat="server"></asp:TextBox>--%>
                                <asp:Label ID="txtEditDirAccessCode" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Panel ID="photoPanel" runat="server" Visible="false">
                                    <asp:Label ID="lblphoto" runat="server" Text="Admin Image" Style="color: #002290;
                                        font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                                </asp:Panel>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUploadImage" runat="server" Style="color: White;" Visible="false" onchange="ShowPreview(this)"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td colspan="8">
                                <p class="bg-info" style="width: 95%; font-weight: bold; margin-left: -7px;">
                                    &nbsp;&nbsp;Admin Address Details</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblFlatno" runat="server" Text="Flat No./Unit No." Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFlatno" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditFlatno" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblhouseno" runat="server" Text="House No./Door No/Plot No." Style="color: #002290;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txthouseno" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEdithouseno" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStreetno" runat="server" Text="Street No." Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtstreetno" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditstreetno" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblStreetname" runat="server" Text="Street Name" Style="color: #002290;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtstreetname" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditstreetname" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblarea" runat="server" Text="Sub Urban/Area" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtarea" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditarea" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country" Style="color: #002290; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Visible="false">
                                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                    <asp:ListItem Text="India" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="USA" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="ddlEditcountry" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblstate" runat="server" Text="State" Style="color: #002290; font-weight: bold;"></asp:Label><font
                                    style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Visible="false">
                                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                    <asp:ListItem Text="Telangana" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="AP" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="ddlEditstate" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lbldistrict" runat="server" Text="District" Style="color: #002290;
                                    font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Visible="false">
                                    <asp:ListItem Text="--Select--" Value="--Select--"></asp:ListItem>
                                    <asp:ListItem Text="Hyderabad" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Rangareddy" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Label ID="ddlEditDistrict" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage="* Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
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
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblvillage" runat="server" Text="Village/Town/City" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcity" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditcity" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpincode" runat="server" Text="Pin Code" Style="color: #002290;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpincode" class="textusername" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="txtEditpincode" runat="server" Style="color: #0F0F10; font-weight: bold;"></asp:Label>
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
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
                <td>
                    <br />
                </td>
                <td>
                    <br />
                </td>
                <td>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="8" align="center">
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" style="margin-left: 31%;"
                        CssClass="btn btn-primary" onclick="btnEdit_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                        CssClass="btn btn-primary" onclick="btnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
        </table>
                </td>
                <td style="width:20%;">
                <div id="imageDiv" style="height: 205px;width: 76%;      margin-left: -50px;margin-top: -229px;">
                    <%--<img src="" id="img" runat="server" style="height: 148px;width: 63%;"  />--%>
                    <asp:Image ID="impPrev" runat="server" Height="148px" Width="63%" />
                </div>

                <%--<asp:Image ID="impPrev" runat="server" Height="90px" Width="100px" />
                <br />
                    <label class="file-upload">
                    <span>Upload Image</span>
                    <asp:FileUpload  runat="server" name="ImageUpload" id="ImageUpload" onchange="ShowPreview(this)" />
                    </label>--%>
                </td>
            </tr>
        </table>
        
    </div>
    <%--<div>
        <img src="../Images/images.jpg" />
    </div>--%>
</asp:Content>
