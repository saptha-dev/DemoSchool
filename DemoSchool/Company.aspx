<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="DemoSchool.Company" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

     <%--   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//resources/demos/style.css">--%>
    <%--<script type="text/javascript">
        $.noConflict();
        $(document).ready(function () {
            $("#<%=txtRegdate.ClientID %>").datepicker({ maxDate: '0', dateFormat: 'yy-mm-dd', beforeShow: function () {
                $(".ui-datepicker").css('font-size', 13.5)
            }
            });
            $("#Img").click(function () {
                $("#<%= txtRegdate.ClientID %>").datepicker('show');
            });

            $("#<%=txtdob.ClientID %>").datepicker({ maxDate: '0', dateFormat: 'yy-mm-dd', beforeShow: function () {
                $(".ui-datepicker").css('font-size', 13.5)
            }
            });
            $("#cdr").click(function () {
                $("#<%= txtdob.ClientID %>").datepicker('show');
            });
        });
    </script>--%>
    <%-- <script type="text/javascript">
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
    <style type="text/css">
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
   <%-- <script type="text/javascript">
        function RegistrationSuccessful() {
            customAlert("You are registered successfully with us. Please check your mail for UserName and Password.");
            return false;
        }
        var message;
        function customAlert(message) {
            window.onresize = resizeCheck;
            function resizeCheck() {

                winX = window.innerWidth;
                winY = window.innerHeight;
                modelX = (winX / 2) - (350 / 2) + document.body.scrollLeft;
                modelY = (winY / 2) - (196px; / 2) + document.body.scrollTop;
                var _elm = document.getElementById('overlay');
                _elm.style.width = winX + "px";
                _elm.style.height = winY + "px";
                var _elm = document.getElementById('alert');
                _elm.style.left = modelX + "px";
                _elm.style.top = modelY + "px";
            }
            winX = window.innerWidth;
            winY = window.innerHeight;
            modelX = (winX / 2) - (350 / 2) + document.body.scrollLeft;
            modelY = (winY / 2) - (196 / 2) + document.body.scrollTop;
            winX += document.body.scrollLeft;
            winY += document.body.scrollTop;
            var overlay = document.createElement('div');
            overlay.setAttribute("id", "overlay");
            overlay.setAttribute("class", "overlay");
            document.body.appendChild(overlay);

            var box = document.createElement('div');
            box.setAttribute("id", "alert");
            box.innerHTML = '<center><div style="width: 100%; font-weight:bold;height: 30px;background: #428296;border-top-left-radius: 6px;border-top-right-radius: 6px;margin-top: -1px;color: #fff;"><p style="margin-top:1px; padding-top:7px">Alert !!</p></div><div id="button2" ><div id="alert2"><span class="message2">' + message + '</span></div><input type="button" style="width:43px; height:27px; background-color: #428296; color:#fff" id="ok1" value="OK" ></div></center>';
            document.body.appendChild(box);
            //css
            var sheet = document.createElement('style')
            sheet.innerHTML = ".overlay{background-color: #000;   opacity: .5;   filter: alpha(opacity=70);   position:absolute; top: 0; left: 0;   width:" + winX + "px; height: " + winY + "px;   z-index: 99999;} #alert{width:350px; height:160px; background:#fff; position:absolute;left: " + modelX + "px;top: " + modelY + "px; z-index: 999999;border-radius:6px;border:1px; box-shadow:1px 2px 5px #676767;}#ok1{position:absolute;bottom:33px;left:150px;cursor:pointer; color:black;font:bold 13px sans-serif;text-transform:uppercase;border:none;border-radius:8px;}#alert2 span {font:18px sans-serif;color:#428296;display:inline-block;margin-top:28px;}";
            document.body.appendChild(sheet);

            var element = document.getElementById("ok1");
            element.addEventListener('click', resume, false)
            function resume() {

                document.body.removeChild(overlay);
                document.body.removeChild(box);
                document.body.removeChild(sheet);
            }
        }
    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container shadow" style="margin-top:30px;background-color:#fff;">
  <div class="row">
    <div class="col-lg-12 ">
      <h1>ASSOC-COMPANY REGISTRATION </h1>
      
      <div class="form-body registration">
          <div class="container">
  
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="tab" href="#ASSOCCOMPANYDetails"><img src="images/user.png" />ASSOC-COMPANY  Details</a></li>
    <li><a data-toggle="tab" href="#ASSOCCOMPANYAddressDetails">ASSOC-COMPANY Address Details</a></li>
    <li><a data-toggle="tab" href="#COMPANYContactPersonDetails">COMPANY Contact Person Details</a></li>
    
  </ul>

  <div class="tab-content">
    <div id="ASSOCCOMPANYDetails" class="tab-pane fade in active">
      <h3>ASSOC-COMPANY  Details</h3>
    
      <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
               <tr>
                            <td>
                                <asp:Label ID="lblComapnyname" runat="server" Text="ASSOC-COMPANY Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcompanyName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblRegNo" runat="server" Text="ROC Registration Number" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRegNumber" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <%--<td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorCompany" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Company Name" ForeColor="Red" ControlToValidate="txtcompanyName"
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
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegNumber" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Registration Number" ForeColor="Red" ControlToValidate="txtRegNumber"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblRegdate" runat="server" Text="ROC Registration Date" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%--<asp:TextBox ID="txtRegdate" class="textusername" runat="server"></asp:TextBox>--%>
                                 <input id="txtdob"  type="date" value="2016-07-23"/>
                               <%-- <img src="Images/calender.png" id="Img" />--%>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblOfficephno" runat="server" Text="Office Phone" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtofficephno" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <%--<td>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegdate" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Registration Date" ForeColor="Red" ControlToValidate="txtRegdate"
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
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorofficephno" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter office Phone Number" ForeColor="Red" ControlToValidate="txtofficephno"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCompanyEmailId" runat="server" Text="ASSOC-COMPANY Email Id" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtCompanyEmailId" class="textusername" runat="server"></asp:TextBox>
                            </td>
                             <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblAccesCode" runat="server" Text="ASSOC-COMPANY Access Code" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAccesCode" class="textusername" runat="server"></asp:TextBox>
                            </td>
                           
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <%--<td>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorCompanyEmailId" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Company EmailID" ForeColor="Red" ControlToValidate="txtCompanyEmailId"
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
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorAccesCode" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Access Code" ForeColor="Red" ControlToValidate="txtAccesCode"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>

                            </td>--%>
                        </tr>
                        <tr>
                          
                           <td>
                                <asp:Label ID="lblnoofBranch" runat="server" Text="No.of Branches" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtnoofBranches" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldtxtnoofBranches" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Branches Count" ForeColor="Red" ControlToValidate="txtnoofBranches"
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
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Place of birth" ForeColor="Red" ControlToValidate="txtpob"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            </td>--%>
                        </tr>
                       
          </table>
    </div>
    <div id="ASSOCCOMPANYAddressDetails" class="tab-pane fade">
      <h3>ASSOC-COMPANY Address Details</h3>
  
         <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
             <tr>
                            <td>
                                <asp:Label ID="lblCountry" runat="server" Text="Country" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" class="textusername" style="width:64%;" AppendDataBoundItems="true">
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
                                    style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlstate" runat="server" class="textusername" style="width:88%;" AppendDataBoundItems="true">
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
                                  ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red"  ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                  ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:DropDownList ID="ddlDistrict" runat="server" class="textusername" style="width:64%;" AppendDataBoundItems="true">
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
                                <asp:Label ID="lblarea" runat="server" Text="Mandal/Taluk/SubUrb" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtarea" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlDistrict"
                                  ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="Required"
                                    ErrorMessage="Enter Mandal/Taluka" ForeColor="Red" ControlToValidate="txtarea"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblvillage" runat="server" Text="Village/Town/City" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcity" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpincode" runat="server" Text="Pin Code" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="Required"
                                    ControlToValidate="txtpincode" ErrorMessage="Please Enter Numbers " ForeColor="Red"
                                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblStreetno" runat="server" Text="Street No." Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                            <%--<td>
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
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="Required"
                                    ErrorMessage="Enter StreetName" ForeColor="Red" ControlToValidate="txtstreetname"
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
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="Required"
                                    ErrorMessage="Enter Flat No" ForeColor="Red" ControlToValidate="txtFlatno" Display="Dynamic"
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
                                <asp:Label ID="lblLoc" runat="server" Text="Student Location" Style="color: black;
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
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="Required"
                                    ErrorMessage="Enter Location" ForeColor="Red" ControlToValidate="txtLocation"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        
                    
            </table>
    </div>
    <div id="COMPANYContactPersonDetails" class="tab-pane fade">
      <h3>COMPANY Contact Person Details</h3>
   

    <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
         <tr>
                            <td>
                                <asp:Label ID="lblFname" runat="server" Text="First Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                            <%--<td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName"
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>--%>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblfatherguardian" runat="server" Text="Father/Guardian Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                            <%--<td>
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
                                <asp:Label ID="lblDob" runat="server" Text="Date of Birth" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <%--asp:TextBox ID="txtdob" class="textusername" runat="server"></asp:TextBox>--%>
                                 <input id="txtdob"  type="date" value="2016-07-23"/>
                                <%--<img src="Images/calender.png" id="cdr" />--%>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblpob" runat="server" Text="Place of Birth" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpob" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
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
                                <asp:Label ID="lblmobileNumber" runat="server" Text="Mobile Number" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
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
                                <asp:TextBox ID="txtphone" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="Required"
                                    ControlToValidate="txtmobile" ErrorMessage="Please Enter Numbers " ForeColor="Red"
                                    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </td>--%>
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
                                <asp:Label ID="lblemail" runat="server" Text="Email Id" Style="color: black; font-weight: bold;"></asp:Label><font
                                    style="color: Red;"></font>
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
                           <%-- <td>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Required"
                                    ErrorMessage=" Enter Mobile Number" ForeColor="Red" ControlToValidate="txtmobile"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                            </td>--%>
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
                                <asp:Label ID="lblphoto" runat="server" Text="Student Image" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;"></font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:FileUpload ID="FileUploadImage" runat="server" Style="color: rgb(26, 56, 211);"
                                    ValidationGroup="Required" />
                            </td>
                           <%-- <td>
                                <asp:FileUpload ID="FileUploadImage" runat="server" style="color: rgb(26, 56, 211);"  ValidationGroup="Required" />
                            </td>--%>
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
                            
                            </td>
                            <td>
                            </td>
                           <%-- <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage=" Choose image to upload"
                                    ValidationGroup="Required" ForeColor="Red" ControlToValidate="FileUploadImage"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="valUpTest" ControlToValidate="FileUploadImage"
                                    ErrorMessage=" Image Files Only (.jpg,.png)" ValidationGroup="Required" Display="Dynamic"
                                    Font-Size="11px" ForeColor="Red" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].))(.jpg|.JPG|.png|.PNG)$" />
                            </td>--%>
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
