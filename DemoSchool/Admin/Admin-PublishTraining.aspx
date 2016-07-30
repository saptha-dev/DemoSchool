<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin-PublishTraining.aspx.cs"
    Inherits="PresentationLayer.Admin.Admin_PublishTraining" MasterPageFile="~/AdminMaster.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.ui.timepicker.js" type="text/javascript"></script>
    <link href="../Styles/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "content";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {

                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));

            });

        });

        function hideUnitdiv() {
            $("#unitDiv").hide();
        }

        function hideStudentdiv() {
            $("#studentDiv").hide();
        }


    </script>
    <script type="text/javascript">
        function checkAll(objRef) {                       //Multi Check CheckBox at a time
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        //If the header checkbox is checked
                        //check all checkboxes
                        //and highlight all rows
                        //                        row.style.backgroundColor = "aqua";
                        inputList[i].checked = true;
                    }
                    else {
                        //If the header checkbox is checked
                        //uncheck all checkboxes
                        //and change rowcolor back to original
                        if (row.rowIndex % 2 == 0) {
                            //Alternating Row Color
                            //                            row.style.backgroundColor = "#C2D69B";
                        }
                        else {
                            //                            row.style.backgroundColor = "white";
                        }
                        inputList[i].checked = false;
                    }
                }
            }
        }
    </script>
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
    <style type="text/css">
        .tblDesign
        {
            -moz-box-shadow: inset 0 0 10px #000000;
            -webkit-box-shadow: inset 0 0 10px #000000;
            box-shadow: inset 0 0 10px #000000;
            text-align: center;
        }
        .tblDesign td
        {
            padding: 5px;
            border: 1px solid silver;
        }
        .tblDesign th
        {
            padding: 5px;
        }
        .tblItem
        {
            padding: 6px;
        }
        .Gridview
        {
            font-family: Verdana;
            font-size: 12pt;
            font-weight: normal;
            color: black;
            width: 100%;
        }
        .nav-tabs
        {
            border-color: brown;
        }
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus
        {
            color: #555;
            cursor: default;
            background-color: #fff;
            border: 1px solid brown;
            border-bottom-color: transparent;
        }
        #Dashboard
        {
            margin-left: 16%;
            height: 570px;
            margin-top: 5%;
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
            font-size: 0.9em;
            font-style: normal;
            font-variant: normal;
            font-weight: 700;
            line-height: normal;
            font-family: Lato, Arial, Helvetica, sans-serif;
        }
        
        .textusername:hover
        {
            outline: none;
            box-shadow: 0px 0px 5px #61C5FA;
            border: 1px solid #5AB0DB;
            border-radius: 0;
        }
        .style
        {
            text-align: center;
            width: 4%;
        }
        .style1
        {
            text-align: center;
            width: 8%;
        }
        .style2
        {
            text-align: left;
        }
        .heading
        {
            margin-top: 3%;
            font-size: 20px;
            background-image: -webkit-gradient( linear, left top, left bottom, color-stop(0.11, rgb(16, 21, 26)), color-stop(0.55, rgb(74, 99, 137)), color-stop(0.87, rgb(58, 80, 95)) );
            color: rgb(229, 236, 134);
            width: 68%;
        }
        .banner
        {
            width: 100%;
            background: -moz-linear-gradient(rgb(16, 21, 26), rgb(74, 99, 137),rgb(58, 80, 95));
            background: -webkit-linear-gradient(rgb(16, 21, 26), rgb(74, 99, 137),rgb(58, 80, 95));
            background: -ms-linear-gradient(rgb(16, 21, 26), rgb(74, 99, 137),rgb(58, 80, 95));
            height: 30px;
            border-top-right-radius: 10px;
            border-top-left-radius: 10px;
        }
        #divbody
        {
            border-style: groove;
            border-radius: 19px;
            border-color: cadetblue;
        }
        #map td
        {
            color: White;
            font-size: 10px;
            background-color: #2E2E2E;
            padding: 10px;
        }
        #tabs
        {
            background: none;
            width: 91%;
            margin-left: 0px;
            margin-top: 20px;
        }
        #map a
        {
            color: White;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="TabName" runat="server" />
    <asp:ScriptManager ID="scrpt" runat="server">
    </asp:ScriptManager>
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 30%">
                <a href="#">Training</a> &nbsp; > &nbsp;<a href="Admin-PublishTraining.aspx" style="color: #00CCFF">DashBoard</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <table style="width: 72%; margin: auto;">
        <tr>
            <td align="center">
                <div id="divbody">
                    <center>
                        <div class="heading">
                            Training DashBoard</div>
                    </center>
                    <table style="width: 72%; margin: auto;">
                        <tr>
                            <td align="center">
                                <div class="panel panel-default" style="width: 99%; padding: 10px; margin-top: 15px;">
                                    <div id="Tabs" role="tabpanel">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li><a href="#content" aria-controls="content" role="tab" data-toggle="tab">CONTENT</a></li>
                                            <li><a href="#schedules" aria-controls="schedules" role="tab" data-toggle="tab">TASKS</a></li>
                                            <li><a href="#classes" aria-controls="classes" role="tab" data-toggle="tab">CLASSES</a></li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content" style="padding-top: 20px">
                                            <table style="width: 100%; margin-top: 3%; margin-bottom: 20px;">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        <asp:RadioButtonList ID="rdbList" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                            Style="width: 33%; margin-left: 100px;" OnSelectedIndexChanged="rdbList_SelectedIndexChanged">
                                                            <asp:ListItem Text="Publish" Selected="True" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Un-Publish" Value="2"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div role="tabpanel" class="tab-pane active" id="content">
                                                <asp:UpdatePanel ID="udpl" runat="server">
                                                    <ContentTemplate>
                                                        <table id="unitsTable" style="margin-top: 19px;">
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblprogram" Text="Select Program" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlPrograms" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlPrograms"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblCategory" Text="Select Category" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlCategory" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlCategory"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Select Cat-Schedule </b><font style="color: Red;">*</font>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlContentcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlContentcatsch_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%--<asp:CustomValidator ID="CVContentcatsch" runat="server" ClientValidationFunction="validate"
                                                                        ControlToValidate="ddlCategory" ErrorMessage="* Select Category Schedule" ForeColor="Red"
                                                                        ValidationGroup="RequiredDDLs" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblgrowup" Text="Select Group" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlgroup" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlgroup" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblsemYear" Text="Select Sem/Year" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlSemister" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlSemister_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSemister"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblSubjects" Text="Select Subject ID-Name" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlSubjects" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSubjects"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblconsubschid" runat="server" Text="Select Sub-Schedule-ID"></asp:Label><font
                                                                            style="color: Red;">*</font></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlconsubschid" runat="server" AutoPostBack="true" Style="width: 100%;"
                                                                        class="textusername" OnSelectedIndexChanged="ddlconsubschid_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RequiredFieldValidator ID="RFVconsubschid" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Subject Schedule-Id" ForeColor="Red" ControlToValidate="ddlconsubschid"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblConUnit" Text="Select Unit" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlConUnit" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlConUnit_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RFVConUnit" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Unit" ForeColor="Red" ControlToValidate="ddlConUnit" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>Content Type</b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlContentType" runat="server" class="textusername" Style="width: 100%;"
                                                                        OnSelectedIndexChanged="ddlContentType_SelectedIndexChanged" AutoPostBack="true">
                                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Video" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RFVContentType" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlContentType"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblrole" runat="server" Text="Select Role"></asp:Label>
                                                                    </b>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:DropDownList ID="ddlRoles" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Faculty" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RFVRoles" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlRoles" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <%--<tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="lblconstatus" runat="server" Text="Select Status"></asp:Label>
                                                                    </b>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:DropDownList ID="ddlconstatus" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" 
                                                                        onselectedindexchanged="ddlconstatus_SelectedIndexChanged">
                                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Publish" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Unpublish" Value="3"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="rfvconstatus" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlconstatus" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>--%>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>Select Access Level </b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlAccesslevel" runat="server" class="textusername" Style="width: 100%;" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlAccesslevel_SelectedIndexChanged">
                                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Download" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Read Only" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RFVAccesslevel" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlAccesslevel"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" style="height: 38px;">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel ID="Pnl1" runat="server" Visible="false">
                                                            <table class="tblDesign" style="margin: auto; margin-top: 20px">
                                                                <tr>
                                                                    <td colspan="7">
                                                                        <b>Item Information</b>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="color: Green;">
                                                                        Category Name
                                                                    </td>
                                                                     <td style="color: Green;">
                                                                        Group
                                                                    </td>
                                                                     <td style="color: Green;">
                                                                        Year-Sem
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        Subject Name
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        Unit Name
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                    Role
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                    Access Level
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconctname" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconGroup" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconYear" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconsubname" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconunname" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconrole" runat="Server"></asp:Label>
                                                                    </td>
                                                                    <td style="color: Green;">
                                                                        <asp:Label ID="lblconAcclvl" runat="Server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                        <div class="container">
                                                           <br /><br />
                                                            <div class="row">
                                                                <div class="col-xs-3">
                                                                </div>
                                                                <div class="col-xs-6" id="studentDiv" style="top: 0px; left: 0px;">
                                                                    <div class="panel panel-info">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title">
                                                                                SELECT STUDENTS
                                                                            </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <asp:Label ID="lblNorecords" runat="server" Visible="false" Style="color: red; font-size: 17px;"
                                                                                Text="Sorry...!!! No Records Found."></asp:Label>
                                                                            <div style="margin-top: 20px;text-align:center;">
                                                                                <asp:GridView ID="GVStudents" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                    Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                    Style="margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-CssClass="style" HeaderStyle-HorizontalAlign="Center">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Left" />
                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="ID" DataField="Student_Id" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                        <asp:BoundField HeaderText="Name" DataField="studentname" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" HeaderStyle-Width="50%" />
                                                                                        <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" HeaderStyle-Width="50%" />
                                                                                        <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                                <%--<asp:GridView ID="GvForAllUnits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                    Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                    Style="margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                    <Columns>
                                                                                     <asp:TemplateField ItemStyle-CssClass="style" HeaderStyle-HorizontalAlign="Center">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Left" />
                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                        <asp:BoundField HeaderText="Name" DataField="UserID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                    </Columns>
                                                                                    </asp:GridView>--%>
                                                                                <asp:GridView ID="GvForAllUnits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                    Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                    Style="width: 72%; margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-CssClass="style">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                        <asp:BoundField HeaderText="Name" DataField="UserID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                            <asp:TemplateField ItemStyle-CssClass="style" HeaderText="Status">
                                                                                            <ItemTemplate>
                                                                                            <asp:Label ID="lblsts" runat="server" Text="New"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                                <br />
                                                                            </div>
                                                                            <br />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <table style="margin-left: 7%;">
                                                            <%--  <tr>
                                                         <td align="center" colspan="3"></td>
                                                         </tr>
                                                         <tr>
                                                         <td align="center" colspan="3">
                                                         <asp:Label runat="server" ID="lblpublishmsg"></asp:Label>
                                                         </td>
                                                         </tr>--%>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <asp:Button ID="BtnPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                                        ValidationGroup="RequiredDDLs" Visible="true" Style="font-family: Times new Roman;
                                                                        font-weight: bold;" OnClick="BtnPublish_Click" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                                        Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnCancel_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div role="tabpanel" class="tab-pane active" id="schedules">
                                                <asp:UpdatePanel ID="unl" runat="server">
                                                    <ContentTemplate>
                                                        <table id="Table1" style="margin-top: 19px;">
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label1" Text="Select Program" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexerciseprgm" runat="server" class="textusername" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlexerciseprgm_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlPrograms"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label2" Text="Select Category" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddexercisecatgry" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddexercisecatgry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlCategory"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Select Cat-Schedule </b><font style="color: Red;">*</font>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                                        ValidationGroup="ClassesRequired" Style="width: 100%;" OnSelectedIndexChanged="ddlexcatsch_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%--  <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                                                                        ControlToValidate="ddlCategory" ErrorMessage="* Select Category Schedule" ForeColor="Red"
                                                                        ValidationGroup="RequiredDDLs" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label3" Text="Select Group" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexercisegrp" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlexercisegrp_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlgroup" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label4" Text="Select Sem/Year" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexercisesem" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlexercisesem_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSemister"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label5" Text="Select Subject" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexercisesub" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlexercisesub_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSubjects"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="Label14" runat="server" Text="Select Sub-Schedule-ID"></asp:Label><font
                                                                            style="color: Red;">*</font></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlExeSubschId" runat="server" AutoPostBack="true" Style="width: 100%;"
                                                                        class="textusername" OnSelectedIndexChanged="ExeSubschId_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Subject Schedule-Id" ForeColor="Red" ControlToValidate="ddlconsubschid"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label6" Text="Select Unit" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlexerciseunit" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlexerciseunit_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="lbltsktype" Text="Task-Type" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddltasktype" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddltasktype_SelectedIndexChanged">
                                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Exercise" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Assignment" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Case-study" Value="3"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="lblstrole" Text="Role" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlstudentrole" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlstudentrole_SelectedIndexChanged">
                                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Faculty" Value="2"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel ID="Panelexe" runat="server" Visible="false">
                                                    <table class="tblDesign" style="margin: auto; margin-top: 20px">
                                                        <tr align="center">
                                                            <td colspan="4">
                                                                <b>Item Information </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: Green;">
                                                                Program Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                               Category Id:Name
                                                            </td>
                                                             
                                                            <td style="color: Green;">
                                                               Group Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                               Subject Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                                Unit Id:Name
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lbleprgname" runat="Server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblecatname" runat="Server"></asp:Label>
                                                            </td>
                                                           
                                                            <td>
                                                                <asp:Label ID="lblegrpname" runat="Server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblesbjname" runat="Server"></asp:Label>
                                                            </td>
                                                             <td>
                                                                <asp:Label ID="lbleunitname" runat="Server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                        <table style="margin: auto; width: 80%; margin-bottom: 50px; margin-top: 50px; padding: 10px;
                                                            margin-left: 10%;">
                                                            <tr>
                                                                <td align="center">
                                                                    <div class="col-xs-10" style="top: 0px; left: 14px;">
                                                                        <div class="panel panel-info">
                                                                            <div class="panel-heading">
                                                                                <h3 class="panel-title">
                                                                                    SELECT STUDENTS
                                                                                </h3>
                                                                            </div>
                                                                            <div class="panel-body">
                                                                                <div style="margin-top: 20px;">
                                                                                    <asp:Label ID="lblnomsg" runat="server" Visible="false" Style="color: red; font-size: 17px;"
                                                                                        Text="Sorry...!!! No Records Found."></asp:Label>
                                                                                    <asp:GridView ID="GVExercise" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                        Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                        Style="width: 72%; margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                        <Columns>
                                                                                            <asp:TemplateField ItemStyle-CssClass="style">
                                                                                                <HeaderTemplate>
                                                                                                    <asp:CheckBox ID="chksheader" runat="server" onclick="checkAll(this);" />
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chkschild" runat="server" onclick="Check_Click(this)" />
                                                                                                </ItemTemplate>
                                                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField HeaderText="ID" DataField="DetailsId" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style1" />
                                                                                            <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                                            <asp:BoundField HeaderText="Status" DataField="Publish_Status" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                                            <asp:BoundField HeaderText="StatusDate" DataField="Publish_StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                    <asp:GridView ID="GrdExercise" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                        Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                        Style="width: 72%; margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                        <Columns>
                                                                                            <asp:TemplateField ItemStyle-CssClass="style">
                                                                                                <HeaderTemplate>
                                                                                                    <asp:CheckBox ID="chkexheader" runat="server" onclick="checkAll(this);" />
                                                                                                </HeaderTemplate>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="chkexchild" runat="server" onclick="Check_Click(this)" />
                                                                                                </ItemTemplate>
                                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                            </asp:TemplateField>
                                                                                            <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style1" />
                                                                                            <asp:BoundField HeaderText="Name" DataField="UserID" HeaderStyle-HorizontalAlign="Center"
                                                                                                ItemStyle-CssClass="style1" />
                                                                                                <asp:TemplateField ItemStyle-CssClass="style" HeaderText="Status">
                                                                                            <ItemTemplate>
                                                                                            <asp:Label ID="lbltasksts" runat="server" Text="New"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                        </Columns>
                                                                                    </asp:GridView>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table style="margin-left: 7%;">
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <asp:Button ID="BtnExePublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                                        Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnExePublish_Click" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button ID="Btn_clear" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                                        Style="font-family: Times new Roman; font-weight: bold;" OnClick="Btn_clear_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                            <div role="tabpanel" class="tab-pane active" id="classes">
                                                <asp:UpdatePanel ID="updnl" runat="server">
                                                    <ContentTemplate>
                                                        <table id="SubjectsTable" style="margin-top: 19px;">
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label7" Text="Select Program" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclassprgm" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlclassprgm_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlPrograms"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label8" Text="Select Category" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclasscatgry" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlclasscatgry_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlCategory"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <b>Select Cat-Schedule </b><font style="color: Red;">*</font>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclssch" runat="server" AutoPostBack="true" class="textusername"
                                                                        ValidationGroup="ClassesRequired" OnSelectedIndexChanged="ddlclssch_SelectedIndexChanged"
                                                                        Style="width: 100%;">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <%--  <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                                                                        ControlToValidate="ddlCategory" ErrorMessage="* Select Category Schedule" ForeColor="Red"
                                                                        ValidationGroup="RequiredDDLs" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label9" Text="Select Group" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclassgrp" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlclassgrp_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlgroup" Display="Dynamic"
                                                                        Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label10" Text="Select Sem/Year" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclasssem" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlclasssem_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSemister"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label11" Text="Select Subject" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclassub" runat="server" class="textusername" Style="width: 100%;"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlclassub_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSubjects"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="Label15" runat="server" Text="Select Sub-ScheduleID"></asp:Label><font
                                                                            style="color: Red;">*</font></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlClassSubSchId" runat="server" AutoPostBack="true" class="textusername"
                                                                        OnSelectedIndexChanged="ClassSubSchId_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="RequiredDDLs"
                                                                        ErrorMessage="* Select Subject Schedule-Id" ForeColor="Red" ControlToValidate="ddlconsubschid"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="lblClassdrpdown" Text="Select Class" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlClassdrpdown" runat="server" class="textusername" Style="width: 100%;
                                                                        height: 26px;" AutoPostBack="true" OnSelectedIndexChanged="ddlClassdrpdown_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select unit" ForeColor="Red" ControlToValidate="ddlClassdrpdown"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tblItem">
                                                                    <b>
                                                                        <asp:Label ID="Label12" Text="Select Unit" runat="server"></asp:Label></b>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlclassunit" runat="server" class="textusername" Style="width: 100%;
                                                                        height: 26px;" AutoPostBack="true" 
                                                                        onselectedindexchanged="ddlclassunit_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required"
                                                                        ErrorMessage="* Select unit" ForeColor="Red" ControlToValidate="ddlclassunit"
                                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left" style="padding: 6px;">
                                                                    <b>
                                                                        <asp:Label ID="Label13" runat="server" Text="Select Role"></asp:Label>
                                                                    </b>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:DropDownList ID="ddlclassrole" runat="server" class="textusername" AutoPostBack="true"
                                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlclassrole_SelectedIndexChanged">
                                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                                        <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                                                                        <asp:ListItem Text="Faculty" Value="2"></asp:ListItem>
                                                                        <asp:ListItem Text="Company" Value="3"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Panel ID="Panelcls" runat="server" Visible="false">
                                                    <table class="tblDesign" style="margin: auto; margin-top: 20px">
                                                        <tr align="center">
                                                            <td colspan="4">
                                                                <b>Item Information </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: Green;">
                                                                Program Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                               Category Id:Name
                                                            </td>
                                                             
                                                            <td style="color: Green;">
                                                               Group Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                               Subject Id:Name
                                                            </td>
                                                            <td style="color: Green;">
                                                                Unit Id:Name
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblprgname" runat="Server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblcatname" runat="Server"></asp:Label>
                                                            </td>
                                                           
                                                            <td>
                                                                <asp:Label ID="lblgrpname" runat="Server"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblsbjname" runat="Server"></asp:Label>
                                                            </td>
                                                             <td>
                                                                <asp:Label ID="lblunitname" runat="Server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                         <div class="container">
                                                        <div class="row">
                                                            <asp:Panel ID="pnlClassInfo" runat="server" Visible="false">
                                                                <div class="col-xs-1">
                                                                </div>
                                                                <div class="col-xs-5">
                                                                    <div class="panel panel-info">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title">
                                                                                Class Information
                                                                            </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <asp:GridView ID="grdclsunits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                ShowHeaderWhenEmpty="true" autopostback="true" Visible="true" HeaderStyle-BackColor="#53B03F"
                                                                                HeaderStyle-ForeColor="white" AllowPaging="true" PageSize="8">
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="Unit ID" DataField="UnitID" HeaderStyle-HorizontalAlign="Center"
                                                                                        ItemStyle-CssClass="style1" />
                                                                                    <asp:BoundField HeaderText="Unit Name" DataField="Unitname" HeaderStyle-HorizontalAlign="Center"
                                                                                        ItemStyle-CssClass="style1" />
                                                                                    <asp:BoundField HeaderText="Class startdate" DataField="startdate" HeaderStyle-HorizontalAlign="Center"
                                                                                        ItemStyle-CssClass="style1" DataFormatString="{0:dd-MM-yyyy}" />
                                                                                    <asp:BoundField HeaderText="Class Time" DataField="classtime" HeaderStyle-HorizontalAlign="Center"
                                                                                        ItemStyle-CssClass="style1" />
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-xs-5" style="top: 0px; left: 14px;">
                                                                    <div class="panel panel-info">
                                                                        <div class="panel-heading">
                                                                            <h3 class="panel-title">
                                                                                SELECT STUDENTS
                                                                            </h3>
                                                                        </div>
                                                                        <div class="panel-body">
                                                                            <div style="margin-top: 20px;">
                                                                                <asp:Label ID="lblmsgerr" runat="server" Visible="false" Style="color: red; font-size: 17px;"
                                                                                    Text="Sorry...!!! No Records Found."></asp:Label>
                                                                                <asp:GridView ID="GVClasses" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                    Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                    Style="width: 72%; margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-CssClass="style">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chklheader" runat="server" onclick="checkAll(this);" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chklchild" runat="server" onclick="Check_Click(this)" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Left" />
                                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="ID" DataField="DetailsId" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                        <asp:BoundField HeaderText="Name" DataField="Studentname" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                                        <asp:BoundField HeaderText="Status" DataField="Publish_Status" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                                        <asp:BoundField HeaderText="StatusDate" DataField="Publish_StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:dd-MM-yyyy}" />
                                                                                        <asp:BoundField HeaderText="S_No" DataField="S_No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" Visible="false" />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                                <br />
                                                                                <asp:GridView ID="Grddata" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                                                    Visible="true" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white"
                                                                                    Style="width: 72%; margin-left: auto;" AllowPaging="true" PageSize="8">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-CssClass="style">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkgrheader" runat="server" onclick="checkAll(this);" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkgrchild" runat="server" onclick="Check_Click(this)" />
                                                                                            </ItemTemplate>
                                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                        <asp:BoundField HeaderText="Name" DataField="UserID" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-CssClass="style1" />
                                                                                            <asp:TemplateField ItemStyle-CssClass="style" HeaderText="Status">
                                                                                            <ItemTemplate>
                                                                                            <asp:Label ID="lblclasSts" runat="server" Text="New"></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                            <br />
                                                                        </div>
                                                                        <br />
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                            </div>
                                                        <table style="margin-left: 7%;">
                                                            <tr>
                                                                <td align="center" colspan="3">
                                                                    <asp:Button ID="btnclassPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                                        Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnclassPublish_Click" />
                                                                    &nbsp;&nbsp;
                                                                    <asp:Button ID="BtnclearClasses" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                                        Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnclearClasses_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <%--<asp:Panel ID="publishPanel" runat="server">
                                            <div id="#publish">
                                                <table id="tblItem" style="width: 30%; margin: auto;">
                                                </table>
                                                <br />
                                                <br />
                                            </div>
                                        </asp:Panel>--%>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
</asp:Content>
