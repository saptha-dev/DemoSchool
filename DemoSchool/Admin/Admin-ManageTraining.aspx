<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-ManageTraining.aspx.cs" Inherits="PresentationLayer.Admin.Admin_ManageTraining" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="RTB" %>
<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <%--<script src="../video/jquery-1.9.1.min.js" type="text/javascript"></script>--%>
    <script src="../video/projekktor-1.3.09.js" type="text/javascript"></script>
    <script src="../video/projekktor-1.3.09.min.js" type="text/javascript"></script>
    <script src="../video/projekktor-1.3.09.pre-min.js" type="text/javascript"></script>
    <link href="../video/projekktor.style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function hideAccordion() {
            $("#accordion").hide();
        }
   
    </script>
    <script type="text/javascript">

        //    $(document).ready(function () {
        //        $("#accordion").collapse("hide");
        //    });

        function getenddate() {
            var tt = $("#<%=txtSchedulestartDate.ClientID%>").val();
            var dur = $("#<%=txtScheduleDuration.ClientID%>").val();

            var arrr = tt.split('-');
            var newdate = new Date(arrr[1] + "-" + arrr[0] + "-" + arrr[2]);

            newdate.setDate(newdate.getDate() + parseInt(dur));
            var dd = newdate.getDate();
            var mm = newdate.getMonth() + 1;
            var y = newdate.getFullYear();
            var eddat = dd + '-' + mm + '-' + y;

            $("#<%=txtScheduleEndDate.ClientID%>").val(eddat);
            //document.getElementById('txtScheduleEndDate').value = eddat;
        }


        function hideframediv() {
            $("#Textdivcontent").hide();
            $("#txtEditor").show();
        }
        function hideEditordiv() {
            $("#Textdivcontent").show();
            $("#DivEditor").hide();
            $("#txtEditor").hide();
        }

        function hidesDivs() {
            $("#textDiv").hide();
            $("#videoDiv").hide();
            $("#audioDiv").hide();
        }

        function hidePdfFrameDiv() {
            $("#Textdivcontent").hide();
            $("#txtEditor").hide();
            $("#DivEditor").hide();
            $("#videoDiv").hide();
            $("#audioDiv").hide();
        }

        function hideVideoDiv() {
            $("#textDiv").show();
            $("#videoDiv").hide();
            $("#audioDiv").hide();
        }
        function hideTextDiv() {
            $("#Textdivcontent").hide();
            $("#audioDiv").hide();
            $("#DivEditor").hide();
            $("#videoDiv").show();
            $("#collapseTwo").collapse("show")
        }
        function showAudiodiv() {
            $("#Textdivcontent").hide();
            $("#videoDiv").hide();
            $("#DivEditor").hide();
            $("#audioDiv").show();
            $("#Div2").collapse("show")
        }

    </script>
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "content";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });

        });
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
    <script type="text/javascript">


        $(document).ready(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            function EndRequestHandler(sender, args) {
                $("#<%= txtSchedulestartDate.ClientID %>, #<%= txtScheduleEndDate.ClientID %>").datepicker({
                    defaultDate: "+1w",
                    dateFormat: "dd-mm-yy",
                    onSelect: function (selectedDate) {
                        if (this.id == '<%= txtSchedulestartDate.ClientID %>') {
                            var dateMin = $('#<%= txtSchedulestartDate.ClientID %>').datepicker("getDate");
                            var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + 1);

                            $('#<%= txtScheduleEndDate.ClientID %>').datepicker("option", "minDate", rMin);
                            $('#<%= txtScheduleEndDate.ClientID %>').datepicker("option", "maxDate", rMax);
                        }

                    }
                });

                $("#<%= txtSchedulestartDate.ClientID %>").datepicker({
                    defaultDate: "+1w",
                    dateFormat: "dd-mm-yy",
                    onSelect: function (selectedDate) {
                        if (this.id == '<%= txtSchedulestartDate.ClientID %>') {
                            var dateMin = $('#<%= txtSchedulestartDate.ClientID %>').datepicker("getDate");
                            var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + 1);

                            var dur = $("#<%=txtScheduleDuration.ClientID%>").val();

                            dateMin.setDate(dateMin.getDate() + parseInt(dur));
                            var dd = dateMin.getDate();
                            var mm = dateMin.getMonth() + 1;
                            var y = dateMin.getFullYear();
                            var eddat = dd + '-' + mm + '-' + y;

                            $("#<%=txtScheduleEndDate.ClientID%>").val(eddat);
                            // $('#<%= txtScheduleEndDate.ClientID %>').datepicker("option", "minDate", rMin);
                        }
                    }
                });
                $("#Img5").click(function () {
                    $("#<%= txtSchedulestartDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');
                });
                $("#Img6").click(function () {
                    $("#<%= txtScheduleEndDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');
                });



                $("#cdrSubReg").click(function () {
                    $("#<%= txtclassStartDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');
                });

                $("#<%= txtclassStartDate.ClientID %>, #<%= txtClassEndDate.ClientID %>").datepicker({
                    defaultDate: "+1w",
                    dateFormat: "dd-mm-yy",
                    onSelect: function (selectedDate) {
                        if (this.id == '<%= txtclassStartDate.ClientID %>') {
                            var dateMin = $('#<%= txtclassStartDate.ClientID %>').datepicker("getDate");
                            var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + 1);

                            $('#<%= txtClassEndDate.ClientID %>').datepicker("option", "minDate", rMin);
                            $('#<%= txtClassEndDate.ClientID %>').datepicker("option", "maxDate", rMax);
                        }

                    }
                });

                $("#Img1").click(function () {
                    $("#<%= txtClassEndDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');
                });
            }
        });

       
    </script>
    <script type="text/javascript">
        function validate(source, args) {
            args.IsValid = true;
            if (args.Value == "---Select---") {
                args.IsValid = false;
            }
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
        .ui-datepicker
        {
            font-size: 12px;
            width: 15em; /*what ever width you want*/
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
        #programstable td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        
        #tblSampleTest td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        #Categoriestable td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
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
        #SubjectsTable td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        #unitsTable td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
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
        .style1
        {
            width: 219px;
        }
        .style2
        {
            width: 203px;
        }
        .dropdownlist
        {
            width: 200px;
            height: 5.5em;
            border-radius: 2px;
            top: 0px;
            left: 0px;
        }
        .conten
        {
            border-style: groove;
        }
    </style>
    <script type="text/javascript">
        function callPath(value) {
            var videocontainer = document.getElementById('videoclip');
            var videosource = document.getElementById('mp4video');
            videocontainer.pause();
            var sour = videosource.setAttribute('src', "../UploadedFile/VideoFiles/" + value);
            videocontainer.load();
            videocontainer.play();
        }

        function callPath1(value) {
            var audiocontainer = document.getElementById('audioclip');
            var audiosource = document.getElementById('mp3audio');
            audiocontainer.pause();
            var sour = audiosource.setAttribute('src', "../UploadedFile/Recordings/" + value);
            audiocontainer.load();
            audiocontainer.play();
        }

    </script>
    <script type="text/javascript">
        function callPathText(value) {
            var txtsource = document.getElementById('pdfFrame');
            txtsource.setAttribute('src', "../UploadedFile/TextFile/" + value);
        }

        function callPathReferences(value) {
            var txtsource = document.getElementById('pdfFrame');
            txtsource.setAttribute('src', "../UploadedFile/References/" + value);
            //var txtsss = document.getElementById('txtEditor');
            //txtsss.s
        }

        function smsPathText(value) {
            var txtsource = document.getElementById('txtEditor');
            txtsource.setAttribute('src', "../UploadedFile/TextFile/" + value);
        }

        function smsPathReferences(value) {
            var txtsource = document.getElementById('txtEditor');
            txtsource.setAttribute('src', "../UploadedFile/References/" + value);
            //var txtsss = document.getElementById('txtEditor');
            //txtsss.s
        }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var pdfPath = $("#" + '<%= srcFile.ClientID %>').val();
            $('#pdfFrame').attr('src', pdfPath);

        });
    
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:ScriptManager ID="scriptMgr" runat="server">
    </asp:ScriptManager>
    <asp:HiddenField ID="getstring" runat="server" />
    <asp:HiddenField ID="TabName" runat="server" />
    <asp:HiddenField ID="srcFile" runat="server" />
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 30%">
                <a href="#">Training</a> &nbsp; > &nbsp;<a href="Admin-ManageTraining.aspx" style="color: #00CCFF">Admin-Manage
                    Training</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <table style="width: 72%; margin: auto;">
        <tr>
            <td align="center">
                <div class="panel panel-default" style="width: 100%; padding: 10px; margin-top: 10px;">
                    <div id="Tabs" role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a href="#content" aria-controls="content" role="tab" data-toggle="tab">CONTENT</a></li>
                            <li><a href="#schedules" aria-controls="schedules" role="tab" data-toggle="tab">SCHEDULES</a></li>
                            <li><a href="#classes" aria-controls="classes" role="tab" data-toggle="tab">CLASSES</a></li>
                            <li><a href="#exercise" aria-controls="exercise" role="tab" data-toggle="tab">TASKS</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="padding-top: 20px">
                            <div role="tabpanel" class="tab-pane active" id="content">
                                <table id="unitsTable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblProgramsForContent" runat="server" Text="Select Program"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlProgramsContent" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlProgramsContent_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlProgramsContent" ErrorMessage="* Select a Program" ForeColor="Red"
                                                ValidationGroup="contentRequi" Display="Dynamic" Style="margin-left: -65px;"
                                                Font-Size="11px" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblCategoriesForContent" runat="server" Text="Select Category"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="updatePanel" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProgramsContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlCategoriesForContent" runat="server" class="textusername"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlCategoriesForContent_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlCategoriesForContent" ErrorMessage="* Select a Category"
                                                ForeColor="Red" ValidationGroup="contentRequi" Display="Dynamic" Font-Size="11px"
                                                SetFocusOnError="True" Style="margin-left: -65px;" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Select Cat-Schedule <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="updatePanel4" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlCategoriesForContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlContentcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlContentcatsch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CVContentcatsch" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlContentcatsch" ErrorMessage="* Select Category Schedule"
                                                ForeColor="Red" ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px"
                                                SetFocusOnError="True" CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblGroupForContent" runat="server" Text="Select Group"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="updatePanel6" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProgramsContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlGroupForContent" runat="server" class="textusername" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlGroupForContent_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cusValGroupForContent" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlGroupForContent" ErrorMessage="* Select a Group" ForeColor="Red"
                                                ValidationGroup="contentRequi" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                Style="margin-left: -65px;" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblYearForContent" runat="server" Text="Select Year-Sem"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="UpdatePanelYear" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlProgramsContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlYearForContent" runat="server" class="textusername" AutoPostBack="true"
                                                        OnSelectedIndexChanged="ddlYearForContent_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cusValYearForContent" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlYearForContent" ErrorMessage="* Select a Year" ForeColor="Red"
                                                ValidationGroup="contentRequi" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                Style="margin-left: -65px;" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="updatePanel1" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlCategoriesForContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlSubjectforContent" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlSubjectforContent_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubjectforContent" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                ValidationGroup="contentRequi" Style="margin-left: -65px;" Display="Dynamic"
                                                Font-Size="11px" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblconsubschid" runat="server" Text="Select Subject Schedule-ID"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="upconsubschid" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlSubjectforContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlconsubschid" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlconsubschid_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cvconsubschid" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlconsubschid" ErrorMessage="* Select Subject Schedule-Id"
                                                ForeColor="Red" ValidationGroup="contentRequi" Display="Dynamic" Font-Size="11px"
                                                Style="margin-left: -65px;" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Select UNIT <font style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="updatepanelUnit" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlSubjectforContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList runat="server" ID="ddlContentUnits" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlContentUnits_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CumValForContentUnits" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlContentUnits" ErrorMessage="* Select a Unit" ForeColor="Red"
                                                ValidationGroup="contentRequi" Style="margin-left: -65px;" Display="Dynamic"
                                                Font-Size="11px" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Select Status<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlConStatus" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlConStatus_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Deleted" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cvConStatus" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlConStatus" ErrorMessage="* Select Status " ForeColor="Red"
                                                ValidationGroup="contentRequi" Display="Dynamic" Font-Size="11px" Style="margin-left: -65px;"
                                                SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Select Content Type <font style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:UpdatePanel ID="updatePanel3" runat="server">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlSubjectforContent" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                        <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Video" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Recording" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="References" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlType" ErrorMessage="* Select Content Type" ForeColor="Red"
                                                ValidationGroup="contentRequi" Display="Dynamic" Style="margin-left: -65px;"
                                                Font-Size="11px" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                        </td>
                                    </tr>
                                </table>
                                <asp:UpdatePanel ID="updatePanel2" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlType" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <div class="panel-group" id="accordion" style="margin-bottom: 100px">
                                            <div class="panel panel-info" id="textDiv">
                                                <asp:Panel ID="Pnl1" runat="server" Visible="false">
                                                    <table class="tblDesign" style="margin: auto; margin-top: 20px">
                                                        <tr align="center">
                                                            <td colspan="6">
                                                                <b>Item Information </b>
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
                                                                Content Path
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: Green;">
                                                                <asp:Label ID="lblconctgname" runat="Server"></asp:Label>
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
                                                                <asp:Label ID="lblconName" runat="Server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <div class="panel-heading" style="height: 30px;">
                                                            <h4 class="panel-title">
                                                                <asp:Label runat="server" ID="lblNewfileDisplay"></asp:Label>
                                                                <br />
                                                                <br />
                                                            </h4>
                                                        </div>
                                                        <div style="text-align: left">
                                                            <div class="col-xs-12" style="text-align: left">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr align="left">
                                                                        <td align="left" style="width: 25%;">
                                                                            <table>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        <asp:CheckBox runat="server" ID="chkboxforFile" Text="Select New File To Replace" />
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="left" style="padding-top: 20px;">
                                                                            <asp:FileUpload ID="fileupdation" runat="server" CssClass="btn btn-success" accept=".txt,.TXT" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <asp:UpdatePanel runat="server" ID="updatePanelForfileupdation">
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="btnUpload" />
                                                                                    <asp:PostBackTrigger ControlID="btnAddFile" />
                                                                                </Triggers>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                        <td align="left">
                                                                            <table>
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Button runat="server" ID="btnAddFile" Text="Added Files" CssClass="btn btn-primary"
                                                                                            OnClick="btnAddFile_Click" />
                                                                                        <td style="width: 15px;">
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:Button runat="server" ID="btnUpload" Text="Upload Files" CssClass="btn btn-primary"
                                                                                                OnClick="btnUpload_Click" />
                                                                                        </td>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" align="center">
                                                                            <asp:GridView ID="GridView1" CssClass="Gridview" Visible="false" runat="server" AutoGenerateColumns="False"
                                                                                PageSize="10" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true">
                                                                                <Columns>
                                                                                    <asp:TemplateField ItemStyle-CssClass="style" HeaderStyle-HorizontalAlign="Center">
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkUnitheader" runat="server" onclick="checkAll(this);" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkUnitchild" runat="server" onclick="Check_Click(this)" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Browsed File">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Eval("Content_Data") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3">
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <%--  <tr>
                                                                        <td align="center" colspan="3">
                                                                            <asp:GridView ID="GridView1" CssClass="Gridview" Visible="false" runat="server" AutoGenerateColumns="False"
                                                                                PageSize="10" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true">
                                                                                <Columns>
                                                                                    <asp:TemplateField ItemStyle-CssClass="style" HeaderStyle-HorizontalAlign="Center">
                                                                                        <HeaderTemplate>
                                                                                            <asp:CheckBox ID="chkUnitheader" runat="server" onclick="checkAll(this);" />
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkUnitchild" runat="server" onclick="Check_Click(this)" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Browsed File">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSno" runat="server" Text='<%#Eval("Content_Data") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>--%>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="col-xs-12">
                                                                <table>
                                                                    <tr align="left">
                                                                        <td align="center">
                                                                            <asp:Button runat="server" ID="btnFileView" Text="View" CssClass="btn btn-primary"
                                                                                OnClick="btnFileView_Click" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button runat="server" ID="btnEdit" Text="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button runat="server" ID="btnFileDelete" Text="Delete" CssClass="btn btn-primary"
                                                                                OnClick="btnFileDelete_Click" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button runat="server" ID="BtnClear" Text="Clear" CssClass="btn btn-primary"
                                                                                OnClick="BtnClear_Click" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                </h4>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 17px;">
                                                            <div id="Textdivcontent" style="width: 100%;" class="col-xs-8">
                                                                <div class="panel panel-default" style="padding: 10px 10px 10px  10px;">
                                                                    <div class="panel-body">
                                                                        <asp:UpdatePanel ID="updatepanelText" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                                            <ContentTemplate>
                                                                                <iframe id='pdfFrame' style="width: 500px; height: 500px;" frameborder="0" name="pdfFrame">
                                                                                </iframe>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="DivEditor" style="width: 100%;">
                                                                <div class="panel panel-default" style="padding: 10px 10px 10px  10px;">
                                                                    <div class="panel-body">
                                                                        <asp:UpdatePanel ID="updateeditor" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                                            <ContentTemplate>
                                                                                <RTB:CKEditorControl ID="txtEditor" class="textusername" runat="server" Width="100%"
                                                                                    Height="180px" EnterMode="BR"></RTB:CKEditorControl>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="panel panel-info" id="videoDiv">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-play">
                                                                        </span>PLAY-CONTENT</a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-xs-12 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin-top: 17px;">
                                                                            <div class="col-xs-8" style="width: 65%">
                                                                                <div class="panel panel-default" style="padding: 0px 10px 10px  10px;">
                                                                                    <div class="panel-body">
                                                                                        <asp:UpdatePanel ID="updateVideo" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                                                            <ContentTemplate>
                                                                                                <video id="videoclip" controls="controls" poster="images/cover.jpg" title="Video title"
                                                                                                    style="margin-top: 10px; volume: loud; width: 100%">
                                                                                        <source id="mp4video" type="video/mp4" />
                                                                                    </video>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                        <%--                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="btnFileView" />
                                                                                       </Triggers>--%>
                                                                                        <%--    <div id="player_a" class="projekktor" style="width: 615px; height: 385px;  margin-top: 3%;">
                                                                                                          </div>--%>
                                                                                        <%--<audio controls="controls" id="audioclip" style="margin-top: 10px;width:100" poster="images/cover.jpg" title="Audio title">
                                                                                      <source id="mp3audio" type="audio/mp3" />
                                                                                    </audio>--%>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="panel panel-info" id="audioDiv">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#Div2"><span class="glyphicon glyphicon-play">
                                                                        </span>PLAY-CONTENT</a>
                                                                    </h4>
                                                                </div>
                                                                <div id="Div2" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <div class="row">
                                                                            <div class="col-xs-12 ">
                                                                            </div>
                                                                        </div>
                                                                        <div class="row" style="margin-top: 17px;">
                                                                            <div class="col-xs-8" style="width: 65%">
                                                                                <div class="panel panel-default" style="padding: 0px 10px 10px  10px;">
                                                                                    <div class="panel-body">
                                                                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                                                                            <ContentTemplate>
                                                                                                <audio controls="controls" id="audioclip" style="margin-top: 10px; width: 100" poster="images/cover.jpg"
                                                                                                    title="Audio title">
                                                                                            <source id="mp3audio" type="audio/mp3" />
                                                                                                  </audio>
                                                                                            </ContentTemplate>
                                                                                        </asp:UpdatePanel>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div role="tabpanel" class="tab-pane" id="schedules">
                                    <asp:Panel ID="SchedulePanel" runat="server">
                                        <asp:RadioButtonList ID="ScheduleRadiolist" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                            Style="width: 40%; margin-left: 10px;" OnSelectedIndexChanged="ScheduleRadiolist_SelectedIndexChanged">
                                            <asp:ListItem Text="Category-Group" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Subject" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:UpdatePanel ID="pnl" runat="server">
                                            <ContentTemplate>
                                                <table id="Categoriestable" style="margin-top: 19px;">
                                                    <tr>
                                                        <td align="left">
                                                            Select Programs <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSubjectPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlSubjectPrograms_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator23" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlSubjectPrograms" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Category <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSubjectCategories" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlSubjectCategories_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlSubjectCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Group <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlScheduleGroup" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlScheduleGroup_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="SubjectsRequired"
                                                                ErrorMessage="* Select a Category" ForeColor="Red" ControlToValidate="ddlScheduleGroup"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0" Style="margin-left: -81px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Year-Sem <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSecheduleYear" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlSecheduleYear_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator16" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlSecheduleYear" ErrorMessage="* Select a subject" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -81px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <asp:Panel ID="pnlSubject" runat="server" Visible="false">
                                                            <tr>
                                                                <td align="left">
                                                                    Subject <font style="color: Red;">*</font>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlScheduleSubject" runat="server" AutoPostBack="true" class="textusername"
                                                                        OnSelectedIndexChanged="ddlScheduleSubject_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:CustomValidator ID="CustomValidator11" runat="server" ClientValidationFunction="validate"
                                                                        ControlToValidate="ddlScheduleSubject" ErrorMessage="* Select a subject" ForeColor="Red"
                                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                        CssClass="Validator" Style="margin-left: -81px;"></asp:CustomValidator>
                                                                </td>
                                                            </tr>
                                                        </asp:Panel>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblcatSchid" runat="server" Text="Cat-Schedule ID"></asp:Label>
                                                            <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlScheduleID" runat="server" AutoPostBack="true" class="textusername"
                                                                ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlScheduleID_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator25" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlScheduleID" ErrorMessage="* Select a ScheduleID" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Status <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlscheduleStatus" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlscheduleStatus_SelectedIndexChanged">
                                                                <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Hold" Value="4"></asp:ListItem>
                                                                <asp:ListItem Text="Deleted" Value="5"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Enter status code" ForeColor="Red" ControlToValidate="txtSubStatus"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblScheduleRegDate" runat="server" Text="Category Reg Date"></asp:Label>
                                                            <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtSubRegDate" runat="server" class="textusername" Enabled="false"
                                                                ValidationGroup="SubjectsRequired" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubRegDate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblScheduleDuration" runat="server" Text="Category Duration"></asp:Label>
                                                            <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtScheduleDuration" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblScheduleStartDate" runat="server" Text="Cat-Schedule Start Date "></asp:Label>
                                                            <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtSchedulestartDate" runat="server" class="textusername datePick"></asp:TextBox>
                                                            <img src="../Images/calender.png" id="Img5" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="SubjectsRequired"
                                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSchedulestartDate"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblScheduleEnddate" runat="server" Text="Cat-Schedule End Date "></asp:Label>
                                                            <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtScheduleEndDate" runat="server" class="textusername datePick"></asp:TextBox>
                                                            <img src="../Images/calender.png" id="Img6" />
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="SubjectsRequired"
                                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtScheduleEndDate"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Status Date <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtSubStatusDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="SubjectsRequired"
                                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubStatusDate"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Remarks <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtSubRemarks" runat="server" class="textusername"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="SubjectsRequired"
                                                                ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtSubRemarks"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr align="center">
                                                        <td colspan="3" align="center">
                                                            <asp:Label ID="lblsmsg" runat="server" Text=""></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="3">
                                                            <asp:Button ID="btnUpdateSchedule" runat="server" Text="Update Schedule" CssClass="btn btn-primary"
                                                                OnClick="btnUpdateSchedule_Click" ValidationGroup="SubjectsRequired" />&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btnScheduleDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                                OnClick="btnScheduleDelete_Click" />&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btnScheduleCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                                OnClick="btnScheduleCancel_Click" />&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <asp:GridView ID="gvCategories" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Category Id" DataField="Category_Id" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Name" DataField="Category_Name" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Reg Date" DataField="Category_Reg_Date" HeaderStyle-HorizontalAlign="Left"
                                                            DataFormatString="{0:dd-MM-yyyy}" />
                                                        <asp:BoundField HeaderText="Total categories" DataField="Category_T_Subjects" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Eligibility" DataField="Category_T_Eligible" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Status Date" DataField="Category_Status_Date" HeaderStyle-HorizontalAlign="Left"
                                                            DataFormatString="{0:dd-MM-yyyy}" />
                                                        <asp:BoundField HeaderText="Branch" DataField="Category_Branch" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Year" DataField="Category_Year" HeaderStyle-HorizontalAlign="Left" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="classes">
                                    <asp:Panel ID="SubjectPanel" runat="server">
                                        <asp:UpdatePanel ID="clsmngpnl" runat="server">
                                            <ContentTemplate>
                                                <table id="SubjectsTable" style="margin-top: 19px;">
                                                    <tr>
                                                        <td align="left">
                                                            Select Programs <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlClassPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlClassPrograms_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlClassPrograms" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Category <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlClassCategories" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlClassCategories_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlClassCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Cat-Schedule<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlcatsch_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator22" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlClassCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Group<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator14" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlBranch" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Year <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlyear_SelectedIndexChanged" ValidationGroup="SubjectsRequired"
                                                                Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator15" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlyear" ErrorMessage="* Select a year" ForeColor="Red" ValidationGroup="ClassRequired"
                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" CssClass="Validator"
                                                                Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Subject <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlclassSubjects" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlclassSubjects_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator9" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlclassSubjects" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select ScheduleID<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlclassesScheduleID" runat="server" AutoPostBack="true" class="textusername"
                                                                OnSelectedIndexChanged="ddlclassesScheduleID_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator10" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlclassesScheduleID" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Class<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlclass" runat="server" class="textusername" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator27" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlClassClass" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Unit<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlClassClass" runat="server" class="textusername" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlClassClass_SelectedIndexChanged" Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator18" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlClassClass" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                                ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Status <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlclassstatus" runat="server" class="textusername" AutoPostBack="true"
                                                                Style="width: 100%;" OnSelectedIndexChanged="ddlclassstatus_SelectedIndexChanged">
                                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Completed" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Started" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Reschedule" Value="4"></asp:ListItem>
                                                                <asp:ListItem Text="Hold" Value="5"></asp:ListItem>
                                                                <asp:ListItem Text="Delete" Value="6"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="ClassRequired"
                                                                ErrorMessage="* Enter status" ForeColor="Red" ControlToValidate="ddlclassstatus"
                                                                InitialValue="0" Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <asp:Panel ID="upnldt" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                Class Type <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlclasstype" runat="server" AutoPostBack="true" class="textusername"
                                                                    Style="width: 100%;">
                                                                    <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="On-Line" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="InClass" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="e-Learning" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:CustomValidator ID="CustomValidatorddlclasstype" runat="server" ClientValidationFunction="validate"
                                                                    ControlToValidate="ddlclasstype" ErrorMessage="* Select an option" ForeColor="Red"
                                                                    ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                    CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Class No <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlclassno" runat="server" AutoPostBack="true" class="textusername"
                                                                    Style="width: 100%;">
                                                                    <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="Class-1" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Class-2" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Class-3" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:CustomValidator ID="CustomValidator24" runat="server" ClientValidationFunction="validate"
                                                                    ControlToValidate="ddlclasstype" ErrorMessage="* Select an option" ForeColor="Red"
                                                                    ValidationGroup="ClassRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                    CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Start Date <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtclassStartDate" runat="server" class="textusername " Style="width: 80%;"></asp:TextBox>
                                                                <img src="../Images/calender.png" id="cdrSubReg" />
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassStartDate"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                End Date <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtClassEndDate" runat="server" class="textusername" Style="width: 80%;"></asp:TextBox>
                                                                <img src="../Images/calender.png" id="Img1" />
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtClassEndDate"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Duration <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtClassDuration" runat="server" class="textusername" Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="*Enter Duration" ForeColor="Red" ControlToValidate="txtClassDuration"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Start Time <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtclassStartTime" runat="server" class="textusername" Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Enter Time" ForeColor="Red" ControlToValidate="txtclassStartTime"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                End Time <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtclassEndTime" runat="server" class="textusername" Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Enter Time" ForeColor="Red" ControlToValidate="txtclassEndTime"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Class Hours <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtclassHours" runat="server" class="textusername" Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Enter hours" ForeColor="Red" ControlToValidate="txtclassHours"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Status Date <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtclassstatusDate" runat="server" class="textusername" ReadOnly="true"
                                                                    Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassstatusDate"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Remarks <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtClassRemarks" runat="server" class="textusername" Style="width: 100%;"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="ClassRequired"
                                                                    ErrorMessage="* Enter remarks" ForeColor="Red" ControlToValidate="txtClassRemarks"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <asp:Panel ID="gdpnl" runat="server" Visible="false">
                                                        <asp:GridView ID="Grdupdate" runat="server" DataKeyNames="ClassId" AutoGenerateColumns="false"
                                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                            PageSize="15" OnRowCancelingEdit="Grdupdate_RowCancelingEdit" OnRowEditing="Grdupdate_RowEditing"
                                                            OnRowUpdating="Grdupdate_RowUpdating" OnRowDeleting="Grdupdate_RowDeleting">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="hdnclsId" runat="server" Value='<%#Eval("ClassId") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="UnitID">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbluntiid" runat="server" Text='<%#Eval("UnitID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="UnitName">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblunitname" runat="server" Text='<%#Eval("unitname") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Class Type">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtclstype" runat="server" Width="100px" Text='<%#Eval("ClassType") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclstype" runat="server" Text='<%#Eval("ClassType") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Start Date">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtclsdtae" runat="server" Width="100px" Text='<%#Eval("startdate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                                        <asp:HiddenField ID="hdnclsdate" runat="server" Value='<%#Eval("startdate") %>' />
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclsdtae" runat="server" Text='<%#Eval("startdate", "{0:dd/MM/yyyy}") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="End Date">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtclsedate" runat="server" Width="100px" Text='<%#Eval("Enddate", "{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclsedate" runat="server" Text='<%#Eval("Enddate", "{0:dd/MM/yyyy}") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Duration">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclsduration" runat="server" Text='<%#Eval("Duration") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Start Time">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtclstime" runat="server" Width="100px" Text='<%#Eval("StartTime") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclstime" runat="server" Text='<%#Eval("StartTime") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="End Time">
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="txtclsetime" runat="server" Width="100px" Text='<%#Eval("EndTime") %>'></asp:TextBox>
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclsetime" runat="server" Text='<%#Eval("EndTime") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Status">
                                                                    <EditItemTemplate>
                                                                        <asp:DropDownList ID="ddlstatus" runat="server">
                                                                            <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                                            <asp:ListItem Value="1" Text="New"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="Started"></asp:ListItem>
                                                                            <asp:ListItem Value="3" Text="Delete"></asp:ListItem>
                                                                            <asp:ListItem Value="4" Text="Completed"></asp:ListItem>
                                                                            <asp:ListItem Value="5" Text="Hold"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:HiddenField ID="hdnclssts" runat="server" Value='<%#Eval("status") %>' />
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclstatus" runat="server" Text='<%#Eval("status") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Status Date">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblclstatusdate" runat="server" Text='<%#Eval("StatusDate", "{0:dd/MM/yyyy}") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <EditItemTemplate>
                                                                        <asp:ImageButton ID="imgedit" ImageUrl="../Images/edit.png" runat="server" CommandName="Update"
                                                                            autopostback="true" ToolTip="Edit" />
                                                                        <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="/Images/Arrow.png"
                                                                            ToolTip="Cancel" Height="20px" Width="20px" />
                                                                    </EditItemTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgedit" ImageUrl="../Images/edit.png" runat="server" CommandName="Edit"
                                                                            autopostback="true" ToolTip="Edit" />
                                                                        <%-- <asp:ImageButton ID="imgDelete" ImageUrl="../Images/delete.png" runat="server" CommandName="Delete"
                                                                    autopostback="true" ToolTip="Delete" />--%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="imgDelete" ImageUrl="../Images/delete.png" runat="server" CommandName="Delete"
                                                                            autopostback="true" ToolTip="Delete" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </asp:Panel>
                                                    <tr>
                                                        <td align="center" colspan="3">
                                                            <asp:Button ID="btnClassUpdate" runat="server" Text="Edit" CssClass="btn btn-primary"
                                                                ValidationGroup="ClassRequired" OnClick="btnClassUpdate_Click" />&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btnClassDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                                ValidationGroup="ClassRequired" OnClick="btnClassDelete_Click" />&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="btnClassCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                                ValidationGroup="ClassRequired" OnClick="btnClassCancel_Click" />&nbsp;&nbsp;&nbsp;
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
                                                <br />
                                                <asp:Panel ID="pnlmsg" runat="server">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblflmsg" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <br />
                                                <asp:GridView ID="gvClass" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                                    <Columns>
                                                        <asp:BoundField HeaderText="Class Id" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Class Name" DataField="Subject_Name" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Reg Date" DataField="Subject_RegDate" HeaderStyle-HorizontalAlign="Left"
                                                            DataFormatString="{0:dd-MM-yyyy}" />
                                                        <asp:BoundField HeaderText="Total Subjects" DataField="Subject_T_Units" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Status" DataField="Subject_Status" HeaderStyle-HorizontalAlign="Left" />
                                                        <asp:BoundField HeaderText="Status Date" DataField="Subject_Status_Date" HeaderStyle-HorizontalAlign="Left"
                                                            DataFormatString="{0:dd-MM-yyyy}" />
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="exercise">
                                    <asp:Panel ID="exercisePanel" runat="server">
                                        <asp:UpdatePanel ID="updpnl" runat="server">
                                            <ContentTemplate>
                                                <table id="tblSampleTest" style="margin-top: 19px; width: 400px;">
                                                    <tr>
                                                        <td align="left">
                                                            Select Program <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlProgramsForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                                Style="width: 100%;" OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged"
                                                                ValidationGroup="ExcerciseRequired">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidatorForUnits" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlProgramsForUnits" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Category <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                                Style="width: 100%;" OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged"
                                                                ValidationGroup="ExcerciseRequired">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlCategoriesForUnits" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Cat-Schedule <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlexctsch" runat="server" AutoPostBack="true" class="textusername"
                                                                Style="width: 100%;" ValidationGroup="ExcerciseRequired" OnSelectedIndexChanged="ddlexctsch_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator28" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlexctsch" ErrorMessage="* Select a Cat_Schedule" ForeColor="Red"
                                                                ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Group<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExerciseGroup" runat="server" AutoPostBack="true" class="textusername"
                                                                Style="width: 100%;" ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlExerciseGroup_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator20" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlExerciseGroup" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Year <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExerciseYear" runat="server" AutoPostBack="true" class="textusername"
                                                                Style="width: 100%;" ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlExerciseYear_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator19" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlExerciseYear" ErrorMessage="* Select a year" ForeColor="Red"
                                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Subjects <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSubject_sampleTest" runat="server" class="textusername"
                                                                Style="width: 100%;" AutoPostBack="true" OnSelectedIndexChanged="ddlSubject_sampleTest_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator13" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlSubject_sampleTest" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Sub-ScheduleId <font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExesubschid" runat="server" class="textusername" Style="width: 100%;"
                                                                AutoPostBack="true" OnSelectedIndexChanged="ddlExesubschid_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlExesubschid" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Select Unit<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlExerciseUnit" runat="server" class="textusername" ValidationGroup="ExcercisesRequired"
                                                                Style="width: 100%;">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator21" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddlExerciseUnit" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                                ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            Task Type<font style="color: Red;">*</font>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddltasktype" runat="server" class="textusername" AutoPostBack="true"
                                                                ValidationGroup="ExcercisesRequired" OnSelectedIndexChanged="ddltasktype_SelectedIndexChanged">
                                                                <asp:ListItem Text="--Select" Value="0"></asp:ListItem>
                                                                <asp:ListItem Text="Exercise" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Assignment" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Case-Study" Value="3"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left">
                                                            <asp:CustomValidator ID="CustomValidator26" runat="server" ClientValidationFunction="validate"
                                                                ControlToValidate="ddltasktype" ErrorMessage="* Select Task Type" ForeColor="Red"
                                                                ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <asp:Panel ID="qtntype" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                Question Type <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlqstnType" runat="server" AutoPostBack="true" class="textusername"
                                                                    OnSelectedIndexChanged="qstnType_SelectedIndexChanged" Style="width: 100%;">
                                                                    <asp:ListItem Text="--Select--" Value="0" Selected="True"></asp:ListItem>
                                                                    <asp:ListItem Text="Radio" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left">
                                                                <asp:CustomValidator ID="CustomValidator17" runat="server" ClientValidationFunction="validate"
                                                                    ControlToValidate="ddlqstnType" ErrorMessage="* Select a Program" ForeColor="Red"
                                                                    ValidationGroup="ExcerciseRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                    CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="stspnl" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                Status <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddlexeStatus" runat="server" class="textusername" Style="width: 100%;"
                                                                    AutoPostBack="true" ValidationGroup="ClassesRequired" OnSelectedIndexChanged="ddlexeStatus_SelectedIndexChanged">
                                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="Hold" Value="4"></asp:ListItem>
                                                                    <asp:ListItem Text="Delete" Value="5"></asp:ListItem>
                                                                    <asp:ListItem Text="Reschedule" Value="6"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="ClassesRequired"
                                                                    InitialValue="0" ErrorMessage="* Enter status" ForeColor="Red" ControlToValidate="ddlexeStatus"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="lblQstnName" runat="server" Text="Enter QSTN-NAME" Visible="false"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtQstnName" runat="server" Visible="false" class="txtQstn"></asp:TextBox>
                                                        </td>
                                                        <td align="left">
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ExcerciseRequired"
                                                                ErrorMessage="* Enter Qstn" ForeColor="Red" ControlToValidate="txtQstnName" Display="Dynamic"
                                                                Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <asp:Panel ID="radioPanel" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                Enter Option-A <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtA" runat="server" class="txtQstn"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Enter option" ForeColor="Red" ControlToValidate="txtA" Display="Dynamic"
                                                                    Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Enter Option-B <font style="color: Red;">*</font>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtB" runat="server" class="txtQstn"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Select option" ForeColor="Red" ControlToValidate="txtB" Display="Dynamic"
                                                                    Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Enter Option-C <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtC" runat="server" class="txtQstn"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Enter Option" ForeColor="Red" ControlToValidate="txtC" Display="Dynamic"
                                                                    Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Enter Option-D <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtD" runat="server" class="txtQstn"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Enter Option" ForeColor="Red" ControlToValidate="txtD" Display="Dynamic"
                                                                    Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                Enter Option-E <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtE" runat="server" class="txtQstn"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Enter Option" ForeColor="Red" ControlToValidate="txtE" Display="Dynamic"
                                                                    Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Select Answer<font style="color: Red;">*</font>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="ddlAns" runat="server" AutoPostBack="true" class="textusername">
                                                                    <asp:ListItem Text="A" Value="0"></asp:ListItem>
                                                                    <asp:ListItem Text="B" Value="1"></asp:ListItem>
                                                                    <asp:ListItem Text="C" Value="2"></asp:ListItem>
                                                                    <asp:ListItem Text="D" Value="3"></asp:ListItem>
                                                                    <asp:ListItem Text="E" Value="4"></asp:ListItem>
                                                                    <%-- <Texts SelectBoxCaption="Residential type" />--%>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left">
                                                                <%-- <asp:CustomValidator ID="CustomValidatorlAns" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlAns" ErrorMessage="* Select a Answer" ForeColor="Red" ValidationGroup="ExcerciseRequired"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" CssClass="Validator"
                                                        Style="margin-left: -83px;"></asp:CustomValidator>--%>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="FillinBlanksPAnel" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lblenterans" runat="server" Text="Enter Answer"></asp:Label>
                                                                <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtFillInAnswer" runat="server" class="txtQstn" TextMode="MultiLine"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtFillInAnswer" runat="server"
                                                                    ValidationGroup="ExcerciseRequired" ErrorMessage="* Enter Topics list" ForeColor="Red"
                                                                    ControlToValidate="txtFillInAnswer" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                                    Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="DescriptivePanel" runat="server" Visible="false">
                                                        <tr>
                                                            <td align="left">
                                                                Enter Answer <font style="color: Red;">*</font>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtDescriptAnswer" runat="server" class="txtQstn" Style="height: 129px;"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ExcerciseRequired"
                                                                    ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtDescriptAnswer"
                                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:Button ID="btnUpdateSampleQuestion" runat="server" Text="Update Question" CssClass="btn btn-primary"
                                                                Visible="false" OnClick="btnUpdateSampleQuestion_Click" ValidationGroup="ExcerciseRequired" />&nbsp;&nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
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
                                                <br />
                                                <asp:Panel ID="Panel1" runat="server">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblexmsg" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <br />
                                                <asp:Panel ID="pnltb" runat="server" Visible="false">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:RadioButton ID="rdbtn" runat="server" Text="Select" OnCheckedChanged="rdbtn_CheckedChanged" />
                                                            </td>
                                                            <td colspan="7">
                                                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 12%">
                                                                <asp:Label ID="Label1" runat="server" Text="Range From" Font-Bold="true"></asp:Label>
                                                                <font style="color: Red;">*</font>
                                                            </td>
                                                            <td align="left" style="width: 10%">
                                                                <asp:TextBox ID="txtfrm" runat="server" class="txtQstn" Width="73px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="txtfrm" ForeColor="Red" ValidationGroup="srch"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td align="left" style="width: 5%">
                                                                <asp:Label ID="Label2" runat="server" Text="To" Font-Bold="true"></asp:Label><font
                                                                    style="color: Red;">*</font>
                                                            </td>
                                                            <td style="width: 10%">
                                                                <asp:TextBox ID="txtto" runat="server" class="txtQstn" align="left" Width="73px"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="txtto" ForeColor="Red" ValidationGroup="srch"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td align="right" style="width: 5%">
                                                                <asp:Button ID="Btnsearch" runat="server" Text="Search" CssClass="btn btn-primary"
                                                                    ValidationGroup="srch" OnClick="Btnsearch_Click" />
                                                            </td>
                                                            &nbsp;&nbsp;
                                                            <td style="width: 10%">
                                                                <asp:Label ID="Label3" runat="server" Text="Upload Data" Font-Bold="true"></asp:Label><font
                                                                    style="color: Red;">*</font>
                                                            </td>
                                                            <td style="width: 25%">
                                                                <asp:FileUpload ID="fileuploadExcel" runat="server" />
                                                            </td>
                                                            <td align="right" style="width: 15%">
                                                                <asp:Button ID="btnExcel" runat="server" Text="UplaodExcel" CssClass="btn btn-primary"
                                                                    OnClick="btnExcel_Click" />&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                                <br />
                                                <asp:GridView ID="gvSampleTest" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                    Style="width: 100%;" PageSize="15" OnPageIndexChanging="gvSampleTest_PageIndexChanging"
                                                    OnSelectedIndexChanged="gvSampleTest_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:Label ID="QstnNAId1" runat="server" Text="QstnNAId"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="QstnNAId" runat="server" Text='<%#Eval("QstnNAId") %>' />
                                                                <asp:HiddenField ID="hdnf" runat="server" Value='<%#Eval("Qstn_ID") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="QuestionType" DataField="Question_Type" />
                                                        <asp:BoundField HeaderText="Question" DataField="Question" />
                                                        <asp:BoundField HeaderText="A" DataField="A" NullDisplayText="NULL" />
                                                        <asp:BoundField HeaderText="B" DataField="B" NullDisplayText="NULL" />
                                                        <asp:BoundField HeaderText="C" DataField="C" NullDisplayText="NULL" />
                                                        <asp:BoundField HeaderText="D" DataField="D" NullDisplayText="NULL" />
                                                        <asp:BoundField HeaderText="E" DataField="E" NullDisplayText="NULL" />
                                                        <asp:BoundField HeaderText="Answer" DataField="Answer" />
                                                        <asp:BoundField HeaderText="Status" DataField="Status" />
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lbl1" runat="server" Text="Action"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="gvSampleTestID" ImageUrl="../Images/edit.png" runat="server"
                                                                    autopostback="true" OnClick="gvSampleTestID_Click" />
                                                                <asp:ImageButton ID="gvSampleTestDelete" ImageUrl="../Images/delete.png" runat="server"
                                                                    autopostback="true" OnClick="gvSampleTestDelete_Click" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <%-- <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lbl2" runat="server" Text="Delete"></asp:Label>
                                                            </HeaderTemplate>
                                                          
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>--%>
                                                    </Columns>
                                                </asp:GridView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btnExcel" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
</asp:Content>
