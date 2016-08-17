<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="DemoSchool.Company" %>
<script runat="server">
    Dictionary<string, string> result = new Dictionary<string, string>();
    void OnActiveStepChanged(object sender, WizardNavigationEventArgs e)
    {
        //WizardStep stepp = wizardStep as WizardStep;
        if (e.NextStepIndex == 3 || e.NextStepIndex == 4)
         {
            result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        result.Add("txtName",txtAssocCmpName.Text);
        
        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "previewClick", "previewClick()", true);
        //Button btn = GetButtonFromWizardControl();
        //btn.Text = "Test";
        }
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
   

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
        label.error{
            color:red;
            font-size:12px;
        }
        .margin5{
            margin:5px 5px 5px 5px;
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
    <!-- modal placeholder-->
<%--<div id='myModal' class='modal fade in'>
    <div class="modal-dialog">
        <div class="modal-content">
            <div id='myModalContent'>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Preview</h4>
                </div>

                <div class="modal-body">
                    <div class="form-horizontal"> 

                    </div>
                </div>                  

                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal">Cancel</button>
                    <input class="btn btn-primary" id="register" type="button" onclick="saveRegister()" value="Register" />        
                </div>
            </div>
        </div>
    </div>
</div>--%>

  <div class="container shadow" style="margin-top:30px;background-color:#fff;">
  <div class="row">
    <div class="col-lg-12 ">
      <h1>ASSOC-COMPANY REGISTRATION </h1>
      
      <div class="form-body registration">

          <div class="container">
          
              <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="False" 
             onFinishButtonClientClick="previewClick()" StepNextButtonStyle-CssClass="btn btn-primary margin5" 
              StepPreviousButtonStyle-CssClass="btn btn-danger margin5" StartNextButtonStyle-CssClass="btn btn-primary margin5"  OnNextButtonClick="Wizard1_NextButtonClick"
              FinishCompleteButtonStyle-CssClass="btn btn-primary margin5" FinishPreviousButtonStyle-CssClass="btn btn-danger margin5" FinishCompleteButtonText="Submit" ActiveStepIndex="0">

                <StartNextButtonStyle CssClass="btn btn-primary margin5"></StartNextButtonStyle>

                <StepNextButtonStyle CssClass="btn btn-primary margin5"></StepNextButtonStyle>

                <StepPreviousButtonStyle CssClass="btn btn-danger margin5"></StepPreviousButtonStyle>
            <WizardSteps>


                <asp:WizardStep ID="WizardStep1" runat="server" Title="ASSOC-COMPANY">
                 <div>
                     <hr>
                        <h3><span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span>Management Personal Details</h3>                     
                            
                           <table id="tblPadding" style="margin: auto; width: 100%; color: Black;">
                                <tr>
                                    <td><asp:Label ID="Label1" runat="server" Text="ASSOC-COMPANY Name" class="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtAssocCmpName" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                    <td><asp:Label ID="Label2" runat="server" Text="ROC Registration Number" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtRegNumber" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%--<td>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorCompany" runat="server" ValidationGroup="Required"
                                            ErrorMessage=" Enter Company Name" ForeColor="Red" ControlToValidate="txtcompanyName"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%-- <td>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegNumber" runat="server" ValidationGroup="Required"
                                            ErrorMessage=" Enter Registration Number" ForeColor="Red" ControlToValidate="txtRegNumber"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    </tr>
                               <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" CssClass="control-label col-sm-12 text-left" Text="ROC Registration Date"></asp:Label>
                                        </td>
                                    <td>
                                        <input class="form-control" id="txtregDate"  type="date" value="2016-07-23"/>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" CssClass="control-label col-sm-12 text-left" Text="Office Phone"></asp:Label>
                                        </td>
                                  
                                    <td>
                                        <asp:TextBox ID="txtOfficePhone" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label5" runat="server" Text="ASSOC-COMPANY Email Id" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><%--<asp:TextBox ID="txtRegdate" class="textusername" runat="server"></asp:TextBox>--%>
                                       <%-- <img src="Images/calender.png" id="Img" />--%>
                                        <asp:TextBox ID="txtAssocCmpEmail" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                    <td><asp:Label ID="Label6" runat="server" Text="ASSOC-COMPANY Access Code" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtAssocCmpAccCode" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%--<td>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorRegdate" runat="server" ValidationGroup="Required"
                                            ErrorMessage=" Enter Registration Date" ForeColor="Red" ControlToValidate="txtRegdate"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%--  <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorofficephno" runat="server" ValidationGroup="Required"
                                            ErrorMessage=" Enter office Phone Number" ForeColor="Red" ControlToValidate="txtofficephno"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" CssClass="control-label col-sm-12 text-left" Text="No.of Branches"></asp:Label>
                                        </td>
                                    <td>
                                        <asp:TextBox ID="txtBranchesNo" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </td>
                                </tr>
                       </table>
                 </div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Address">                    
                    <div>
                        <hr>
                          <h3><span class="glyphicon glyphicon-globe" aria-hidden="true"></span>ASSOC-COMPANY Address Details</h3>
                            <table id="tblPadding1" style="margin: auto; width: 100%; color: Black;">
                                <tr>
                                    <td><asp:Label ID="Label8" runat="server" Text="Country" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ClientIDMode="Static" ID="txtCmpCountry" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="India" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="USA" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td><asp:Label ID="Label9" runat="server" Text="State" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ID="txtCmpState" ClientIDMode="Static" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Telangana" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                        <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="ddlcountry"
                                          ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red"  ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%-- <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="ddlstate"
                                          ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label10" ClientIDMode="Static" runat="server" Text="District" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td>
                                        <asp:DropDownList ClientIDMode="Static" ID="txtCmpCity" runat="server" CssClass="form-control" style="width:100%;" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Hyderabad" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Rangareddy" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                     <td>
                                <asp:Label ID="lblMandalTalukSubUrb" runat="server" Text="Mandal/Taluk/SubUrb" CssClass="control-label col-sm-12 text-left" ></asp:Label>
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
                                    <%-- <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="ddlDistrict"
                                          ValidationGroup="Required"  Display="Dynamic" Font-Size="11px" ForeColor="Red" ErrorMessage=" Select an Option" InitialValue="0"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    
                                 <%--   <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter Mandal/Taluka" ForeColor="Red" ControlToValidate="txtarea"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                                <tr>
                                        <td>
                                <asp:Label ID="lblVillageTownCity" runat="server" Text="Village/Town/City" CssClass="control-label col-sm-12 text-left" ></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control" AppendDataBoundItems="true"
                                    Style="width: 100%;">
                                    <asp:ListItem Text="Village/Town/City" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="TELANGANA" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                                    <td><asp:Label ID="Label13" runat="server" Text="Pin Code" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtPinCode" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter City" ForeColor="Red" ControlToValidate="txtcity" Display="Dynamic"
                                            Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
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
                                    <td><asp:Label ID="Label14" runat="server" Text="Street No." CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtCmpStreetNo" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox></td>
                                    <td><asp:Label ID="Label15" runat="server" Text="Street Name" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtCmpStreetName" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%--<td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter StreetNo" ForeColor="Red" ControlToValidate="txtstreetno"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%--<td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter StreetName" ForeColor="Red" ControlToValidate="txtstreetname"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label16" runat="server" Text="House No./Door No/Plot No." CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtCmpHouseNo" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                    <td><asp:Label ID="Label17" runat="server" Text="Flat No./Unit No." CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtCmpFlatNo" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%-- <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter HouseNo" ForeColor="Red" ControlToValidate="txthouseno"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%--<td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter Flat No" ForeColor="Red" ControlToValidate="txtFlatno" Display="Dynamic"
                                            Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label18" runat="server" Text="Building/LandMark Name" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtCmpLandMark" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                    <td><asp:Label ID="Label19" runat="server" Text="Student Location" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtStudentLocation" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <%--<td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter LandMark" ForeColor="Red" ControlToValidate="txtLandMark"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                    <%--<td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="Required"
                                            ErrorMessage="Enter Location" ForeColor="Red" ControlToValidate="txtLocation"
                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>--%>
                                </tr>
                            </table>
                    </div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Contact Person">                    
                    <div>
                        <hr>
                          <h3><span class="glyphicon glyphicon-globe" aria-hidden="true"></span>COMPANY Contact Person Details</h3>

                            <table id="tblPadding2" style="margin: auto; width: 100%; color: Black;">
                                <tr>
                                    <td><asp:Label ID="Label20" runat="server" Text="First Name" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtFirstName" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                    <td><asp:Label ID="Label21" runat="server" Text="Last Name" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtLastName" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                     <td><asp:RequiredFieldValidator id="RequiredFieldValidatorfname" runat="server" ErrorMessage="please Enter First Name" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator></td>
                                     <td></td>
                                     <td><asp:RequiredFieldValidator id="RequiredFieldValidatorlname" runat="server" ErrorMessage ="please Enter Last Name" ForeColor="Red" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label22" runat="server" CssClass="control-label col-sm-12 text-left" Text="Father/Guardian Name"></asp:Label></td>
                                    <td><asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                                    <td><asp:Label ID="Label23" runat="server" CssClass="control-label col-sm-12 text-left" Text="Mother Maiden Name"></asp:Label></td>
                                    <td><asp:TextBox ID="txtMotherMaidenName" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                                </tr>
                            
                                <tr>
                                    <td><asp:Label ID="Label24" runat="server" Text="Date of Birth" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><input id="txtDob" class="form-control"  type="date" value="2016-07-23"/></td>
                                    <td><asp:Label ID="Label25" runat="server" Text="Place of Birth" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtPlaceOfBirth" CssClass="form-control" runat="server"></asp:TextBox></td>
                                </tr>
                           
                                <tr>
                                    <td><asp:Label ID="Label26" runat="server" CssClass="control-label col-sm-12 text-left" Text="Mobile Number"></asp:Label></td>
                                    <td><asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                                    <td><asp:Label ID="Label27" runat="server" CssClass="control-label col-sm-12 text-left" Text="Fixed/Land Line Number"></asp:Label></td>
                                    <td><asp:TextBox ID="txtFixedLineNumber" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                               
                               </tr>
                                <tr>
                                    <td></td>
                                    <td><asp:RequiredFieldValidator id="RequiredFieldValidatormob" runat="server" ForeColor="Red" ErrorMessage ="please Enter  Mobile Number" ControlToValidate="txtMobileNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatormob1" runat="server" ControlToValidate="txtMobileNumber" ForeColor="Red" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            
                               <tr>
                                    <td><asp:Label ID="Label28" runat="server" Text="Email Id" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                                    <td><asp:Label ID="Label29" runat="server" Text="Alternate Email Id" CssClass="control-label col-sm-12 text-left"></asp:Label></td>
                                    <td><asp:TextBox ID="txtAlternateEmail" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid Email Format" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator id="RequiredFieldValidatorEmail" runat="server" ForeColor="Red" ErrorMessage="Please Enter Email Id" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                             <tr>
                                    <td><asp:Label ID="Label30" runat="server" CssClass="control-label col-sm-12 text-left" Text="Student Image"></asp:Label></td>
                                    <td><asp:FileUpload ID="txtFileUpload1" runat="server" ClientIDMode="Static" Style="color: rgb(26, 56, 211);" ValidationGroup="Required" /></td>
                            </tr>
                            </table>
                    </div>
                </asp:WizardStep>
               
                <asp:WizardStep ID="Summary" runat="server">
                    <br>

                    <div id="assocCmpSection" class="panel panel-primary">
                            <div class="panel-heading">Assoc Comp Details</div>
                                 <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6 pull-left">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5"  for="assocCmpName">Company Name : </label>
                                                    <asp:label id="assocCmpName" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-7-left" runat="server"></asp:label>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5"  for="regDate">Reg Date : </label>
                                                    <asp:label id="regDate" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5"  for="cmpEmail">Email : </label>
                                                    <asp:label id="cmpEmail" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-sm-5"  for="branchesNo">Branches No : </label>
                                                    <asp:label id="branchesNo" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 pull-right">
                                            <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="regNumber">Reg Number : </label>
                                                    <asp:label id="regNumber" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="officePhone">Office Phone : </label>
                                                    <asp:label id="officePhone" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="assocCmpAccCode">Company Code : </label>
                                                   <asp:label id="assocCmpAccCode" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                        
                        </div>
                    <div class="clearfix"></div>
                    <div id="companyDetails" class="panel panel-primary">
                        <div class="panel-heading">Assoc Comp Address Details</div>
                                <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 pull-left">
                                        <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpCountry">Country : </label>
                                                    <asp:label id="cmpCountry" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpCity">City : </label>
                                                    <asp:label id="cmpCity" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="village">Village : </label>
                                                   <asp:label id="village" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                             <div class="clearfix"></div>
                                            <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpStreetNo">Street No : </label>
                                                    <asp:label id="cmpStreetNo" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmphouseNo">House No : </label>
                                                    <asp:label id="cmphouseNo" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpLandMark">Building/LandMark : </label>
                                                   <asp:label id="cmpLandMark" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pull-right">
                                        <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpState">State : </label>
                                                    <asp:label id="cmpState" Font-Bold="true" ClientIDMode="Static" CssClass="control-label col-sm-12-left" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="mandal">Mandal : </label>
                                                    <asp:label id="mandal" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="pinCode">PinCOde : </label>
                                                   <asp:label id="pinCode" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                             <div class="clearfix"></div>
                                            <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpStreetNo">Street Name : </label>
                                                    <asp:label id="cmpStreetName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="cmpFlatNo">Flat No : </label>
                                                    <asp:label id="cmpFlatNo" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="studentLocation">Student Location : </label>
                                                   <asp:label id="studentLocation" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                        </div>
                                    </div>
                                </div>                                
                            </div>                            
                    </div>
                    <div class="clearfix"></div>
                        
                    <div id="companyDetail" class="panel panel-primary">
                        <div class="panel-heading">Company Contract Person Details</div>
                                <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 pull-left">
                                        <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="firstName">FirstName : </label>
                                                    <asp:label id="firstName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="fatherName">FatherName : </label>
                                                    <asp:label id="fatherName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="date">Date : </label>
                                                   <asp:label id="date" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                             <div class="clearfix"></div>
                                            <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="mobileNumber">Mobile Number : </label>
                                                    <asp:label id="mobileNumber" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="emailId">EmailId : </label>
                                                    <asp:label id="emailId" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                            </div>
                                    </div>
                                    <div class="col-md-6 pull-right">
                                        <div class="row">
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="lastName">LastName : </label>
                                                    <asp:label id="lastName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="motherMaidenName">Mother MaidenName : </label>
                                                    <asp:label id="motherMaidenName" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="placeOfBirth">PlaceOfBirth : </label>
                                                   <asp:label id="placeOfBirth" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                              <div class="clearfix"></div>
                                            <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="fixedLineNumber">Fixed Line Number : </label>
                                                    <asp:label id="fixedLineNumber" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                                <div class="clearfix"></div>
                                              <div class="form-group">
                                                  <label class="control-label col-sm-5"  for="emailId">Alternate Email : </label>
                                                    <asp:label id="alternateEmail" Font-Bold="true" ClientIDMode="Static" CssClass="form-control-static col-sm-7" runat="server"></asp:label>
                                              </div>
                                            </div>
                                    </div>
                                </div>
                            </div>                            
                    </div>

                </asp:WizardStep>
               
           </WizardSteps>
            <FinishCompleteButtonStyle CssClass="btn btn-primary margin5"></FinishCompleteButtonStyle>
            <FinishPreviousButtonStyle CssClass="btn btn-danger margin5"></FinishPreviousButtonStyle>
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

          <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>--%>
       <%-- <div class="formbuttons">--%>
            <%--<button type="submit" class="btn btn-danger btn-lg">Register</button>--%> <%--<button type="submit" class="btn btn-danger btn-lg">Reset</button>--%> 
           
            <div class="formbuttons"><asp:Button ID="btn"  CssClass="btn btn-danger btn-lg" runat="server" Text="Reset" OnClientClick="this.form.reset();return false;"/> <asp:Button id="btncan" runat="server" CssClass="btn btn-danger btn-lg" Text="Cancel"/> <button type="button" onclick="previewClick()" class="btn btn-primary btn-lg">Summary</button></div>
        </div>
      </div>
    
        <div> </div>
    </div>
  
        <div class="topbar"></div>
    </div>
    <%--</div>--%>
<div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>


    <script type="text/javascript">
        var reg = {};
        function validateCheck(value) {

        }

        function saveRegister() {
            reg = 
            JSON.stringify({
                'reg': reg
            });
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Company.aspx/Register",
                data: reg,
                dataType: "json",
                success: function (data) {
                    //Write functionality to display data
                },
                error: function (result) {
                    alert("Error");
                }
            });
        }

        function previewClick() {
            //alert('hello');
            var validator = $("#form1").validate()
            console.log(validator.errorList);
            var fileUpload = $("#txtFileUpload1").val();
            //assocCmpDetails
            //var alternateEmail = $("#txtAlternateEmail.ClientID").val();
            var assocCmpName = $("#txtAssocCmpName").val();
            var regNumber = $("#txtRegNumber").val();
            var regDate = $('#txtregDate').val();
            var officePhone = $("#txtOfficePhone").val();
            var assocCmpEmail = $("#txtAssocCmpEmail").val();
            var assocCmpAccCode = $("#txtAssocCmpAccCode").val();
            var branchesNo = $("#txtBranchesNo").val();
            
            reg["AccessCode"] = assocCmpAccCode;
            reg["DateofRegistration"] = regDate; 
            reg["OfficePhone"] = officePhone
             
            $('#assocCmpName').text(assocCmpName);
            $('#regNumber').text(regNumber);
            $('#regDate').text(regDate);
            $('#officePhone').text(officePhone);
            $('#assocCmpEmail').text(assocCmpEmail);
            $('#assocCmpAccCode').text(assocCmpAccCode);
            $('#branchesNo').text(branchesNo);
            //var cmpEmail = $("<%= txtAssocCmpEmail.ClientID %>").val();
            

            //company details
            var cmpCountry = $("#txtCmpCountry").val();
            var cmpState = $("#txtCmpState").val();
            var cmpCity = $("#txtCmpCity").val();
            var cmpStreetNo = $("#txtCmpStreetNo").val();
            var cmpLandMark = $("#txtCmpLandMark").val();
            var cmphouseNo = $("#txtCmpHouseNo").val();
            var pinCode = $("#txtPinCode").val();
            var studentLocation = $("#txtStudentLocation").val();
            var mandal = $("#txtMandal").val();
            var village = $("#txtVillage").val();
            var cmpStreetName = $("#txtCmpStreetName").val();
            var cmpFlatNo = $("#txtCmpFlatNo").val();
            var cmpStreetNo = $("#txtCmpStreetNo").val();
            
            reg["Flat_UnitNo "] = cmpFlatNo;
            reg["HouseNO"] = cmphouseNo;
            reg["StreetNO"] = cmpStreetNo;
            reg["StreetName"] = cmpStreetName;
            reg["Village_Town_City"] = village;
            reg["DistrictID"] = cmpCity;
            reg["StateID"] = cmpState;
            reg["CountryID"] = cmpCountry; 
            reg["PostalCode"] = pinCode
            reg["Location"] = studentLocation;

            $('#cmpCountry').text(cmpCountry);
            $('#cmpState').text(cmpState);
            $('#cmpCity').text(cmpCity);
            $('#cmpStreetNo').text(cmpStreetNo);
            $('#cmpLandMark').text(cmpLandMark);
            $('#cmphouseNo').text(cmphouseNo);
            $('#pinCode').text(pinCode);
            $('#studentLocation').text(studentLocation);
            $('#mandal').text(mandal);
            $('#village').text(village);
            $('#cmpStreetName').text(cmpStreetName);
            $('#cmpFlatNo').text(cmpFlatNo);
            $('#cmpStreetNo').text(cmpStreetNo);

            //company contract details
            var firstName = $("#txtFirstName").val();
            var lastName = $("#txtLastName").val();
            var fatherName = $("#txtFatherName").val();
            var motherMaidenName = $("#txtMotherMaidenName").val();
            var placeOfBirth = $("#txtPlaceOfBirth").val();
            var date = $("#txtDob").val();
            var fixedLineNumber = $("#txtFixedLineNumber").val();
            var mobileNumber = $("#txtMobileNumber").val();
            var alternateEmail = $("#txtAlternateEmail").val();
            var email = $("#txtEmail").val();
            
            reg["FirstName "] = firstName;
            reg["LastName "] = lastName;
            reg["Father_GaurdainName "] = fatherName;
            reg["MotherMaidenName "] = motherMaidenName;
            reg["PlaceOfBirth "] = placeOfBirth;
            reg["DateOfBirth"] = date;
            reg["MobileNumber "] = mobileNumber;
            reg["Fixed_LandlineNumber"] = fixedLineNumber;
            reg["EmailID"] = email;
            reg["OptionalEmailID"] = alternateEmail;
            
            $('#firstName').text(firstName);
            $('#lastName').text(lastName);
            $('#fatherName').text(fatherName);
            $('#motherMaidenName').text(motherMaidenName);
            $('#placeOfBirth').text(placeOfBirth);
            $('#date').text(date);
            $('#fixedLineNumber').text(fixedLineNumber);
            $('#mobileNumber').text(mobileNumber);
            $('#alternateEmail').text(alternateEmail);
            $('#email').text(email);

            //$('#myModalContent').load(this.href, function () {
            //$('#')

                $('#myModal').modal({
                    /*backdrop: 'static',*/
                    keyboard: true
                }, 'show');

              //  bindForm(this);
            //});

        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({  
                rules: {  
                    //This section we need to place our custom rule   
                    //for the control.  
                    <%=txtAssocCmpName.UniqueID %>:{  required:true  },
                    <%=txtRegNumber.UniqueID %>:{  required:true  },                    
                    <%=txtOfficePhone.UniqueID %>:{  required:true  },
                    <%=txtAssocCmpEmail.UniqueID %>:{  required:true  },
                    <%=txtAssocCmpAccCode.UniqueID %>:{  required:true  },
                    <%=txtBranchesNo.UniqueID %>:{  required:true  },
                    <%=txtCmpCountry.UniqueID %>:{  required:true  },
                    <%=txtCmpState.UniqueID %>:{  required:true  },
                    <%=txtCmpCity.UniqueID %>:{  required:true  },
                    <%=ddlMandal.UniqueID %>:{  required:true  },
                    <%=ddlVillage.UniqueID %>:{  required:true  },
                    <%=txtPinCode.UniqueID %>:{  required:true  },
                    <%=txtCmpStreetName.UniqueID %>:{  required:true  },
                    <%=txtCmpStreetNo.UniqueID %>:{  required:true  },
                    <%=ddlMandal.UniqueID %>:{  required:true  },
                    <%=ddlVillage.UniqueID %>:{  required:true  },
                    <%=txtPinCode.UniqueID %>:{  required:true  },
                    <%=txtCmpStreetName.UniqueID %>:{  required:true  },
                    <%=txtCmpStreetNo.UniqueID %>:{  required:true  },
                    <%=txtCmpFlatNo.UniqueID %>:{  required:true  },
                    <%=txtCmpHouseNo.UniqueID %>:{  required:true  },
                    <%=txtPlaceOfBirth.UniqueID %>:{  required:true  },
                    <%=txtMobileNumber.UniqueID %>:{  required:true  },
                    <%=txtFatherName.UniqueID %>:{  required:true  },
                    <%=txtLastName.UniqueID %>:{  required:true  },
                    <%=txtMotherMaidenName.UniqueID %>:{  required:true  }
                },  
                messages: {  
                    //This section we need to place our custom   
                    //validation message for each control.
                    <%=txtAssocCmpName.UniqueID %>:{  required:"Name is required."  },
                    <%=txtRegNumber.UniqueID %>:{  required:"RegNumber is required."  },                    
                    <%=txtOfficePhone.UniqueID %>:{  required:"OfficePhone is required."  },
                    <%=txtAssocCmpEmail.UniqueID %>:{  required:"Assoc Company Email is required."  },
                    <%=txtAssocCmpAccCode.UniqueID %>:{  required:"AssocCmpAccCode is required."  },
                    <%=txtBranchesNo.UniqueID %>:{  required:"BranchesNo is required."  },
                    <%=txtCmpCountry.UniqueID %>:{  required:"CmpCountry is required."  },
                    <%=txtCmpState.UniqueID %>:{  required:"CmpState is required."  },
                    <%=txtCmpCity.UniqueID %>:{  required:"CmpCity is required."  },
                    <%=ddlMandal.UniqueID %>:{  required:"Mandal is required."  },
                    <%=ddlVillage.UniqueID %>:{  required:"Village is required."  },
                    <%=txtPinCode.UniqueID %>:{  required:"PinCode is required."  },
                    <%=txtCmpStreetName.UniqueID %>:{  required:"CmpStreetName is required."  },
                    <%=txtCmpStreetNo.UniqueID %>:{  required:"CmpStreetNo is required."  },
                    <%=txtCmpFlatNo.UniqueID %>:{  required:"CmpFlatNo is required."  },
                    <%=txtCmpHouseNo.UniqueID %>:{  required:"CmpHouseNo is required."  },
                    <%=txtPlaceOfBirth.UniqueID %>:{  required:"PlaceOfBirth is required."  },
                    <%=txtMobileNumber.UniqueID %>:{  required:"MobileNumber is required."  },
                    <%=txtFatherName.UniqueID %>:{  required:"FatherName is required."  },
                    <%=txtLastName.UniqueID %>:{  required:"LastName is required."  },
                    <%=txtMotherMaidenName.UniqueID %>:{  required:"MotherMaidenName is required."  }
                      
                },  
            });  
        
        });
    </script>

</asp:Content>



