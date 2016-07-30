<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-Training.aspx.cs" Inherits="PresentationLayer.Admin.Admin_Training" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="RTB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <script src="../Scripts/momemt.js" type="text/javascript"></script>
    <script type="text/javascript">
        //  $.noConflict();
        //txtSchedulestartDate

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


        $(document).ready(function () {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

            function EndRequestHandler(sender, args) {
                $("#<%=txtclassStartTime.ClientID%>").timepicker();
                $("#<%=txtclassEndTime.ClientID%>").timepicker();

                $("#Img2").click(function () {
                    $("#<%= txtSubRegDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                });

                $("#img3").click(function () {
                    $("#<%= dateforRecording.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                });



                $("#<%= txtclassStartDate.ClientID %>").datepicker({
                    maxDate: '+1Y+6M',
                    onSelect: function (dateStr) {
                        var min = $(this).datepicker('getDate'); // Get selected date

                        // Set other min, default to today
                        var stdt = $('#<%= lblstdt.ClientID %>').val();
                        var eddt = $('#<%= lbleddt.ClientID %>').val();
                        var txtstdt = Date.parse($('#<%= txtclassStartDate.ClientID %>').val());
                        var arrrstdt = stdt.split('-');
                        var arrreddt = eddt.split('-');

                        var startdate = new Date(arrrstdt[1] + "-" + arrrstdt[0] + "-" + arrrstdt[2]);
                        var enddate = new Date(arrreddt[1] + "-" + arrreddt[0] + "-" + arrreddt[2]);
                        var sssss = moment(txtstdt, "dd-MM-yyyy");

                        var dd = startdate.getDate();
                        var mm = startdate.getMonth() + 1;
                        var y = startdate.getFullYear();
                        var schstartdt = dd + '-' + mm + '-' + y;

                        var dd1 = enddate.getDate();
                        var mm1 = enddate.getMonth() + 1;
                        var y1 = enddate.getFullYear();
                        var schenddt = dd1 + '-' + mm1 + '-' + y1;
                        var lblmesg = document.getElementById("<%=lblflmsg.ClientID%>");

                        if (txtstdt < schstartdt || txtstdt > enddate) {
                            lblmesg.style.color = "red";
                            lblmesg.innerHTML = "StartDate Should be between schedule startdate and enddate";
                            $('#<%= txtclassStartDate.ClientID %>').val('');
                        }
                        else {
                            $('#<%= txtclassStartDate.ClientID %>').datepicker('option', 'minDate');
                            $('#<%= lblflmsg.ClientID %>').empty();
                        }
                    }
                }).datepicker("option", "dateFormat", "dd-mm-yy");


                $('#<%= txtClassEndDate.ClientID %>').datepicker({
                    minDate: '0',
                    maxDate: '+1Y+6M',
                    onSelect: function (dateStr) {
                        var max = $(this).datepicker('getDate'); // Get selected date
                        $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M'); // Set other max, default to +18 months
                        var start = $("#<%= txtclassStartDate.ClientID%>").datepicker("getDate");
                        var end = $("#<%= txtClassEndDate.ClientID %>").datepicker("getDate");
                        var days = (end - start) / (1000 * 60 * 60 * 24);

                        var stdt = $('#<%= lblstdt.ClientID %>').val();
                        var eddt = $('#<%= lbleddt.ClientID %>').val();
                        var txtstdt = Date.parse($('#<%=txtClassEndDate.ClientID %>').val());
                        var arrrstdt = stdt.split('-');
                        var arrreddt = eddt.split('-');

                        var startdate = new Date(arrrstdt[1] + "-" + arrrstdt[0] + "-" + arrrstdt[2]);
                        var enddate = new Date(arrreddt[1] + "-" + arrreddt[0] + "-" + arrreddt[2]);
                        var sssss = moment(txtstdt, "dd-MM-yyyy");

                        var dd = startdate.getDate();
                        var mm = startdate.getMonth() + 1;
                        var y = startdate.getFullYear();
                        var schstartdt = dd + '-' + mm + '-' + y;

                        var dd1 = enddate.getDate();
                        var mm1 = enddate.getMonth() + 1;
                        var y1 = enddate.getFullYear();
                        var schenddt = dd1 + '-' + mm1 + '-' + y1;
                        var lblmesg = document.getElementById("<%=lblflmsg.ClientID%>");

                        if (txtstdt < schstartdt || txtstdt > enddate) {
                            lblmesg.style.color = "red";
                            lblmesg.innerHTML = "EndDate Should be between schedule startdate and enddate";
                            $('#<%= txtClassEndDate.ClientID %>').val('');
                        }
                        else {
                            $("#<%= txtClassDuration.ClientID %>").val(days + " Days");
                            $('#<%= lblflmsg.ClientID %>').empty();
                        }

                    }
                }).datepicker("option", "dateFormat", "dd-mm-yy");

                //, #<%= txtScheduleEndDate.ClientID %>"
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
                    $("#<%= txtSchedulestartDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                });

                //                $("#<%= txtSchedulestartDate.ClientID %>").datepicker({
                //                    defaultDate: "+1w",
                //                    dateFormat: "dd-mm-yy",
                //                    onSelect: function (selectedDate) {
                //                        if (this.id == '<%= txtSchedulestartDate.ClientID %>') {
                //                            var dateMin = $('#<%= txtSchedulestartDate.ClientID %>').datepicker("getDate");
                //                            var rMin = new Date(dateMin.getFullYear(), dateMin.getMonth(), dateMin.getDate() + 1);

                //                            $('#<%= txtScheduleEndDate.ClientID %>').datepicker("option", "minDate", rMin);

                //                        }

                //                    }
                //                });

                //                $("#Img5").click(function () {
                //                    $("#<%= txtSchedulestartDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                //                });

                $("#Img6").click(function () {
                    $("#<%= txtScheduleEndDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                });

                $("#cdrSubReg").click(function () {
                    $("#<%= txtclassStartDate.ClientID %>").datepicker('show');
                });

                $("#img3").click(function () {
                    $("#<%= dateforRecording.ClientID %>").datepicker('show');
                });

                $("#imgEndDate").click(function () {

                    $("#<%= txtClassEndDate.ClientID %>").datepicker('show');

                });


                $("#imgStatusDate").click(function () {
                    $("#<%= txtclassstatusDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');

                });
            }
            getdatepicker();

        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    getdatepicker();
                }
            });
        };
        function getdatepicker() {
            var pickerOpts = {

                dateFormat: "dd-mm-yy"

            };

            function dateDifference() {
            }
            $("#<%=txtclassStartTime.ClientID%>").timepicker();
            $("#<%=txtclassEndTime.ClientID%>").timepicker();

            $("#Img2").click(function () {
                $("#<%= txtSubRegDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

            });


            $("#<%= txtclassStartDate.ClientID %>").datepicker({

                maxDate: '+1Y+6M',
                onSelect: function (dateStr) {
                    var min = $(this).datepicker('getDate'); // Get selected date
                    $('#<%= txtclassStartDate.ClientID %>').datepicker('option', 'minDate'); // Set other min, default to today
                }
            }).datepicker("option", "dateFormat", "dd-mm-yy");

            $("#<%= dateforRecording.ClientID %>").datepicker({
                maxDate: '+1Y+6M',
                onSelect: function (dateStr) {
                    var min = $(this).datepicker('getDate'); // Get selected date
                    $('#<%= dateforRecording.ClientID %>').datepicker('option', 'minDate'); // Set other min, default to today
                }
            }).datepicker("option", "dateFormat", "dd-mm-yy");

            $('#<%= txtClassEndDate.ClientID %>').datepicker({
                minDate: '0',
                maxDate: '+1Y+6M',
                onSelect: function (dateStr) {
                    var max = $(this).datepicker('getDate'); // Get selected date
                    $('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M'); // Set other max, default to +18 months
                    var start = $("#<%= txtclassStartDate.ClientID%>").datepicker("getDate");
                    var end = $("#<%= txtClassEndDate.ClientID %>").datepicker("getDate");
                    var days = (end - start) / (1000 * 60 * 60 * 24);
                    $("#<%= txtClassDuration.ClientID %>").val(days + " Days");
                }
            }).datepicker("option", "dateFormat", "dd-mm-yy");


            //            $("#Img6").click(function () {
            //                $("#<%= txtScheduleEndDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

            //            });

            $("#cdrSubReg").click(function () {
                $("#<%= txtclassStartDate.ClientID %>").datepicker('show', { beforeShowDay: function (date) {
                    var day = date.getDay();
                    return [(day != 0), ''];
                }
                });
            });
            $("#imgEndDate").click(function () {

                $("#<%= txtClassEndDate.ClientID %>").datepicker('show', { beforeShowDay: function (date) {
                    var day = date.getDay();
                    return [(day != 0), ''];
                }
                });

            });


            $("#imgStatusDate").click(function () {
                $("#<%= txtclassstatusDate.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' }).datepicker('show');

            });
        }
       
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
        .ui-timepicker-hours a
        {
            margin: 2px;
        }
        .ui-timepicker-hours td
        {
            padding: 2px;
        }
        .ui-timepicker-minutes
        {
            padding-right: 2px;
        }
        .ui-timepicker-minutes a
        {
            margin: 2px;
        }
        .ui-timepicker-minutes td
        {
            padding: 2px;
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
        #tblSchedules td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
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
        #tblExercise td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        .textusername
        {
            width: 150px;
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
            height: 26px;
        }
        .ui-datepicker
        {
            font-size: 12px;
            width: 15em; /*what ever width you want*/
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
        
        .txtQstn
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            width: 140%;
            padding: 4px 20px 4px 8px;
            font-size: 17px;
            -moz-transition: all .2s linear;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
            font: 700 0.9em Lato, Arial, Helvetica, sans-serif;
        }
        .txtQstn:hover
        {
            outline: none;
            box-shadow: 0px 0px 5px #61C5FA;
            border: 1px solid #5AB0DB;
            border-radius: 0;
        }
        .dropdownlist
        {
            width: 200px;
            height: 5.5em;
            border-radius: 2px;
            top: 0px;
            left: 0px;
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
    <script type="text/javascript">
        $(function () {
            var date = new Date();
            var currentMonth = date.getMonth();
            var currentDate = date.getDate();
            var currentYear = date.getFullYear();
            $('#datepicker').datepicker({
                minDate: new Date(currentYear, currentMonth, currentDate)
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="TabName" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 30%">
                <a href="#">Training</a> &nbsp; > &nbsp;<a href="Admin-Training.aspx" style="color: #00CCFF">Admin-Training</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <table style="width: 72%; margin: auto;">
        <tr>
            <td align="center">
                <div class="panel panel-default" style="width: 99%; padding: 10px; margin-top: 15px;">
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
                                            <asp:Label ID="lblProgramsForExcercises" runat="server" Text="Select Program"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlProgramsExcercise" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlProgramsExcercise_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlProgramsExcercise" ErrorMessage="* Select a Program" ForeColor="Red"
                                                ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                Style="margin-left: -65px;" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblCategoriesForExcercises" runat="server" Text="Select Category"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlCategoriesForExcercises" runat="server" AutoPostBack="true"
                                                class="textusername" OnSelectedIndexChanged="ddlCategoriesForExcercises_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlCategoriesForExcercises" ErrorMessage="* Select a Category"
                                                ForeColor="Red" ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px"
                                                Style="margin-left: -65px;" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Select Cat-Schedule <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlContentcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                ValidationGroup="ClassesRequired" OnSelectedIndexChanged="ddlContentcatsch_SelectedIndexChanged">
                                            </asp:DropDownList>
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
                                        <td>
                                            <asp:DropDownList ID="ddlGroupForContent" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlGroupForContent_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CValidGroupForContent" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlGroupForContent" ErrorMessage="* Select a Group" ForeColor="Red"
                                                ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px" Style="margin-left: -65px;"
                                                SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblYearForContent" runat="server" Text="Select Year-Sem"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlYearForContent" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlYearForContent_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CValidYearForContent" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlYearForContent" ErrorMessage="* Select a Group" ForeColor="Red"
                                                ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px" Style="margin-left: -65px;"
                                                SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectforExcercise" runat="server" AutoPostBack="true"
                                                class="textusername" OnSelectedIndexChanged="ddlSubjectforExcercise_SelectedIndexChanged1">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubjectforExcercise" ErrorMessage="* Select a Subject"
                                                ForeColor="Red" ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px"
                                                Style="margin-left: -65px;" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="lblconsubschid" runat="server" Text="Select Subject Schedule-ID"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlconsubschid" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlconsubschid_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cvconsubschid" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlconsubschid" ErrorMessage="* Select Subject Schedule-Id"
                                                ForeColor="Red" ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px"
                                                Style="margin-left: -65px;" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Select Unit Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnitNameforExcercise" runat="server" AutoPostBack="true"
                                                class="textusername">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlUnitNameforExcercise" ErrorMessage="* Select a Unit Name"
                                                ForeColor="Red" ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px"
                                                Style="margin-left: -65px;" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Select Status<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlConStatus" runat="server" AutoPostBack="true" class="textusername">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                <%--<asp:ListItem Text="Completed" Value="3"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="cvConStatus" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlConStatus" ErrorMessage="* Select Status " ForeColor="Red"
                                                ValidationGroup="ContentRequired" Display="Dynamic" Font-Size="11px" Style="margin-left: -65px;"
                                                SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="style1">
                                            Selct Content Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                                                <asp:ListItem Text="---Select---" Value="---Select---" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Video" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Recording" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="References" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlType" ErrorMessage="* Select Content Type" ForeColor="Red"
                                                ValidationGroup="ContentRequired" Display="Dynamic" Style="margin-left: -65px;"
                                                Font-Size="11px" SetFocusOnError="True" CssClass="Validator"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr runat="server" id="tdforDateRecording" visible="false">
                                        <td align="left" class="style1">
                                            Selct Date<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="dateforRecording" Width="150px"></asp:TextBox>
                                            <img src="../Images/calender.png" id="img3" />
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="rfvDateRecording" runat="server" ValidationGroup="ContentRequired"
                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="dateforRecording"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"> </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%; margin: auto;">
                                    <tr>
                                        <td colspan="3" align="center">
                                            <asp:Panel ID="TextPanel" runat="server" Visible="false">
                                                <RTB:CKEditorControl ID="txtUnitSecName" class="textusername" runat="server" Width="100%"
                                                    Height="180px" EnterMode="BR"></RTB:CKEditorControl>
                                                <div>
                                                    OR</div>
                                                <%--<asp:FileUpload ID="ContentUpload" runat="server" CssClass="btn btn-success" accept=".txt,.TXT" />--%>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 40%;">
                                            <asp:Panel ID="txtPanel" runat="server" Visible="false">
                                                <asp:FileUpload ID="ContentUpload" runat="server" CssClass="btn btn-success" accept=".txt,.TXT" />
                                            </asp:Panel>
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:Panel ID="btnaddpanel" runat="server" Visible="false">
                                                <asp:Button runat="server" ID="btnAddFiles" Text="Add File" CssClass="btn btn-primary"
                                                    Visible="false" OnClick="btnAddFiles_Click" />
                                            </asp:Panel>
                                        </td>
                                        <td align="left" style="padding-left: 48px;">
                                            <asp:Panel ID="gvPanel" runat="server" Visible="false">
                                                <asp:GridView ID="GridView1" CssClass="Gridview" Visible="false" runat="server" AutoGenerateColumns="False"
                                                    PageSize="10" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                    OnPageIndexChanging="GridView1_PageIndexChanging">
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
                                                        <%--<asp:BoundField HeaderText="Browsed File" DataField="Content_Data" />--%>
                                                    </Columns>
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Choose text files to upload"
                                                ForeColor="Red" Style="margin-left: 67%;" ControlToValidate="ContentUpload" Display="Dynamic"
                                                Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <%-- <asp:RegularExpressionValidator runat="server" ID="valUpTest" ControlToValidate="ContentUpload"
                                                Style="margin-left: 67%;" ErrorMessage="* Text Files Only (txt/TXT)" Display="Dynamic"
                                                Font-Size="11px" ForeColor="Red" ValidationExpression=" /^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.txt|.TXT)$/" />--%>
                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="* Choose Excel/CSV file to upload"
                                                ForeColor="Red" Style="margin-left: 67%;" ControlToValidate="ContentUpload" Display="Dynamic"
                                                Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator runat="server" ID="valUpTest" ControlToValidate="ContentUpload"
                                                Style="margin-left: 67%;" ErrorMessage="* Excel Files Only (Excel/CSV)" Display="Dynamic"
                                                Font-Size="11px" ForeColor="Red" ValidationExpression="^.*\.(xls|xlsx|csv)$" />--%>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="3">
                                            <asp:Label ID="LBLERRmSG" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <br />
                                            <asp:Panel ID="VideoPanel" runat="server" Visible="false">
                                                <asp:FileUpload ID="VideoUpload" runat="server" CssClass="btn btn-success" ValidationGroup="ContentRequired" />
                                            </asp:Panel>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="* Choose Video to upload"
                                                        ValidationGroup="ContentRequired" ForeColor="Red" ControlToValidate="VideoUpload"
                                                        Style="margin-left: 65%;" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" Style="margin-left: 65%;"
                                                        ControlToValidate="VideoUpload" ErrorMessage="* Video Files Only (.mp4)" ValidationGroup="ContentRequired"
                                                        Display="Dynamic" Font-Size="11px" ForeColor="Red" ValidationExpression="^([0-9a-zA-Z_\-~ :\\])+(.mp4)$" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:Button ID="btnAddContentdata" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                                ValidationGroup="ContentRequired" OnClick="btnAddContentdata_Click" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancelUnit" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btnCancelUnit_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="3">
                                            <asp:GridView ID="gvContentData" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                PageSize="15" HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Program Id-Name" DataField="Program_Name" />
                                                    <asp:BoundField HeaderText="Category Id-name" DataField="Category_Name" />
                                                    <asp:BoundField HeaderText="Group Id-Name" DataField="Group_Name" />
                                                    <asp:BoundField HeaderText="Year Id-Name" DataField="Year_Name" />
                                                    <asp:BoundField HeaderText="Subject Id-Name" DataField="Subject_Name" />
                                                    <asp:BoundField HeaderText="Unit Id-Name" DataField="Unit_Name" />
                                                    <asp:BoundField HeaderText="Content Data" DataField="BrowsedFilePath" />
                                                </Columns>
                                            </asp:GridView>
                                            -<br />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="schedules">
                                <asp:UpdatePanel runat="server" ID="othpnl" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td align="center" colspan="6">
                                                    <asp:RadioButtonList ID="ScheduleRadiolist" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                        Style="margin-left: 10px;" OnSelectedIndexChanged="ScheduleRadiolist_SelectedIndexChanged"
                                                        Height="24px">
                                                        <asp:ListItem Text="Category" Value="1" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Subject" Value="2"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                        <table id="tblSchedules" style="margin-top: 19px;">
                                            <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>--%>
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
                                                    <asp:CustomValidator ID="CustomValidator13" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlSubjectPrograms" ErrorMessage="* Select a program" ForeColor="Red"
                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Category <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubjectCategories" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlSubjectCategories_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator22" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlSubjectCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="schpnl" runat="server">
                                                <tr>
                                                    <td align="left">
                                                        Category Schedule ID <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlScheduleID" runat="server" AutoPostBack="true" class="textusername"
                                                            OnSelectedIndexChanged="ddlScheduleID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:CustomValidator ID="CustomValidator25" runat="server" ClientValidationFunction="validate"
                                                            ControlToValidate="ddlScheduleID" ErrorMessage="* Select a ScheduleID" ForeColor="Red"
                                                            ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                            CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
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
                                                    <asp:CustomValidator ID="CustomValidator23" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlScheduleGroup" ErrorMessage="* Select a Group" ForeColor="Red"
                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
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
                                                        CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <%-- </ContentTemplate>
                                </asp:UpdatePanel>--%>
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
                                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                                                            ControlToValidate="ddlScheduleSubject" ErrorMessage="* Select a subject" ForeColor="Red"
                                                            ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                            CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="lblScheduleRegDate" runat="server" Text="Category Reg Date"></asp:Label>
                                                    <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubRegDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubRegDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Enter Duration" ForeColor="Red" ControlToValidate="txtScheduleDuration"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td align="left">
                                                    <asp:Label ID="lblScheduleStartDate" runat="server" Text="Category Start Date"></asp:Label>
                                                    <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubjectStartdate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtsubjectStartdate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>--%>
                                            <%--<tr>
                                                <td align="left">
                                                    <asp:Label ID="lblScheduleEnddate" runat="server" Text="Category End Date"></asp:Label>
                                                    <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubjectEnddate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtsubjectEnddate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td align="left">
                                                    Schedule Start Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSchedulestartDate" runat="server" name="txtSchedulestartDate"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="img1" />
                                                    <%--  <asp:ImageButton ID="imgdate" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                                        Height="20" />  txtSchedulestartDate
                                                    <asp:CalendarExtender runat="server" ID="CEDate" PopupButtonID="imgdate" TargetControlID="txtSchedulestartDate"
                                                        PopupPosition="Right" Format="dd-MM-yyyy">
                                                    </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSchedulestartDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Schedule End Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtScheduleEndDate" runat="server" Enabled="false"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="img2" />
                                                    <%-- <asp:imagebutton id="ImageButton1" runat="server" imageurl="~/Images/calender.png"
                                                        width="20" height="20" />
                                                    <asp:calendarextender runat="server" id="CDate" popupbuttonid="ImageButton1" targetcontrolid="txtScheduleEndDate"
                                                        popupposition="Right" format="dd-MM-yyyy"></asp:calendarextender>--%>
                                                    <%--<asp:CalendarExtender runat="server" ID="CDate" PopupButtonID="ImageButton1" TargetControlID="txtScheduleEndDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtScheduleEndDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlscheduleStatus" runat="server" AutoPostBack="true" ValidationGroup="SubjectsRequired"
                                                                class="textusername">
                                                                <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                                <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                                <asp:ListItem Text="Hold" Value="4"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlscheduleStatus" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlscheduleStatus" ErrorMessage="* Select an Option" ForeColor="Red"
                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -39px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubStatusDate" runat="server" class="textusername " ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="SubjectsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubStatusDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
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
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -39px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnEditSubjects" runat="server" Text="Add Schedule" CssClass="btn btn-primary"
                                                        OnClick="btnEditSubjects_Click" ValidationGroup="SubjectsRequired" />&nbsp;&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:GridView ID="gvCategories" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="margin-left: 16%; width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Category Id" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Reg_Date" DataField="Reg_Date" HeaderStyle-HorizontalAlign="Center"
                                                    DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Schedule_srt_Date" DataField="Schedule_srt_Date" HeaderStyle-HorizontalAlign="Center"
                                                    DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Schedule End Date" DataField="Schedule_end_Date" HeaderStyle-HorizontalAlign="Center"
                                                    DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="classes">
                                <asp:UpdatePanel ID="clspnl" runat="server">
                                    <ContentTemplate>
                                        <table id="SubjectsTable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="left">
                                                    Select Programs <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlClassPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlClassPrograms_SelectedIndexChanged"
                                                        s ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator10" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlClassPrograms" ErrorMessage="* Select a Program" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Category <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlClassCategories" runat="server" AutoPostBack="true" class="textusername"
                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlClassCategories_SelectedIndexChanged"
                                                        ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlClassCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Cat-Schedule <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlcatsch" runat="server" AutoPostBack="true" class="textusername"
                                                        Style="width: 100%;" ValidationGroup="ClassesRequired" OnSelectedIndexChanged="ddlcatsch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator27" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlcatsch" ErrorMessage="* Select Category Schedule" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Group<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" class="textusername"
                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                        ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator14" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlBranch" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Sem/Year <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="true" class="textusername"
                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged" ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator15" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlyear" ErrorMessage="* Select a year" ForeColor="Red" ValidationGroup="ClassesRequired"
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
                                                        Style="width: 100%;" OnSelectedIndexChanged="ddlclassSubjects_SelectedIndexChanged"
                                                        ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator9" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlclassSubjects" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Sub-Schedule<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlClassScheduleID" runat="server" class="textusername" ValidationGroup="ClassesRequired"
                                                        Style="width: 100%;" AutoPostBack="true" OnSelectedIndexChanged="ddlClassScheduleID_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator24" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlClassScheduleID" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td align="left">
                                                     Schedule Startdate<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtschsdate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator29" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="txtschsdate" ErrorMessage="*" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>--%>
                                            <%--<tr>
                                                <td align="left">
                                                     Schedule Enddate<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtschedate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator30" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="txtschedate" ErrorMessage="*" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td align="left">
                                                    Class Start Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtclassStartDate" runat="server" class="textusername datePick"
                                                        AutoPostBack="true" Style="width: 85%;" OnTextChanged="txtclassStartDate_TextChanged"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="cdrSubReg" />
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassStartDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr style="height: 4px;">
                                                <td colspan="3">
                                                    <asp:HiddenField runat="server" ID="lblstdt" />
                                                    <asp:HiddenField runat="server" ID="lbleddt" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Class End Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtClassEndDate" runat="server" class="textusername datePick" AutoPostBack="true"
                                                        Style="width: 85%;"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="imgEndDate" />
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtClassEndDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="*Enter Duration" ForeColor="Red" ControlToValidate="txtClassDuration"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Class No <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlclassno" runat="server" class="textusername" ValidationGroup="ClassesRequired"
                                                        Style="width: 100%;">
                                                        <asp:ListItem Text="---Select---" Value="0" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Class-1" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Class-2" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Class-3" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Class-4" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator28" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlclasstype" ErrorMessage="* Select an Option" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <%--  <asp:TextBox ID="txtclassStatus" runat="server" class="textusername" ValidationGroup="ClassesRequired"></asp:TextBox>--%>
                                                    <asp:DropDownList ID="ddlclassStatus" runat="server" class="textusername" Style="width: 100%;"
                                                        ValidationGroup="ClassesRequired">
                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Hold" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="ClassesRequired"
                                                        InitialValue="0" ErrorMessage="* Enter status" ForeColor="Red" ControlToValidate="ddlclassStatus"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Class Type <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlclasstype" runat="server" class="textusername" ValidationGroup="ClassesRequired"
                                                        Style="width: 100%;">
                                                        <asp:ListItem Text="---Select---" Value="---Select---" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="On-Line" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="InClass" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="e-Learning" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator11" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlclasstype" ErrorMessage="* Select an Option" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Unit <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlClassUnits" runat="server" class="textusername" Style="width: 100%;"
                                                        ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <%--<asp:CheckBox runat="server" ID="chkboxcls" Text="Select All" />--%>
                                                    <asp:CustomValidator ID="CustomValidator20" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlClassUnits" ErrorMessage="* Select unit" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassStartTime"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassEndTime"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Enter hours" ForeColor="Red" ControlToValidate="txtclassHours"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td align="left">
                                                    Faculty <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                   
                                                    <asp:DropDownList ID="ddlFaculty" runat="server" class="textusername" ValidationGroup="ClassesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlFaculty" ErrorMessage="* Select an Option" ForeColor="Red"
                                                        ValidationGroup="ClassesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -37px;"></asp:CustomValidator>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td align="left">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtclassstatusDate" runat="server" ReadOnly="true" class="textusername"
                                                        Style="width: 100%;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtclassstatusDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Remarks <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlremarks" runat="server" class="textusername" Style="width: 100%;">
                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Good" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Bad" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="ClassesRequired"
                                                        ErrorMessage="* Select remarks" ForeColor="Red" ControlToValidate="ddlremarks"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -37px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddClass" runat="server" Text="Add Class" CssClass="btn btn-primary"
                                                        ValidationGroup="ClassesRequired" OnClick="btnAddClass_Click" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancelClass" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btnCancelClass_Click" />&nbsp;&nbsp;&nbsp;
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
                                            Style="margin-left: 1%; width: 95%;" PageSize="15">
                                            <Columns>
                                                <%--<asp:BoundField HeaderText="Class Id" DataField="ClassId" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-HorizontalAlign="Center" />--%>
                                                <asp:BoundField HeaderText="start Date" DataField="startdate" HeaderStyle-HorizontalAlign="Left"
                                                    DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="End Date" DataField="Enddate" HeaderStyle-HorizontalAlign="Left"
                                                    DataFormatString="{0:dd-MM-yyyy}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Duration" DataField="Duration" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <%--<asp:BoundField HeaderText="Faculty" DataField="Faculty" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-HorizontalAlign="Center" />--%>
                                                <asp:BoundField HeaderText="status" DataField="status" HeaderStyle-HorizontalAlign="Left"
                                                    ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="exercise">
                                <asp:UpdatePanel ID="panl" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table id="tblSampleTest" style="margin-top: 19px;">
                                            <tr>
                                                <td align="left">
                                                    Select Program <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlProgramsForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged" ValidationGroup="ExcercisesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidatorProgram" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlProgramsForUnits" ErrorMessage="* Select a Program" ForeColor="Red"
                                                        ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Category <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                        class="textusername" OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged"
                                                        ValidationGroup="ExcercisesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidatorCategory" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlCategoriesForUnits" ErrorMessage="* Select a Category"
                                                        ForeColor="Red" ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px"
                                                        SetFocusOnError="True" CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Cat-Schedule <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlexsch" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                        class="textusername" ValidationGroup="ExcercisesRequired" OnSelectedIndexChanged="ddlexsch_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidator31" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlexsch" ErrorMessage="* Select a Cat-Scedule" ForeColor="Red"
                                                        ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Group<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlExerciseGroup" runat="server" AutoPostBack="true" class="textusername"
                                                        ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlExerciseGroup_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator17" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlExerciseGroup" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                        ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Sem/Year <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlExerciseYear" runat="server" AutoPostBack="true" class="textusername"
                                                        ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlExerciseYear_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator18" runat="server" ClientValidationFunction="validate"
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
                                                    <asp:DropDownList ID="ddlSubject_forUnits" runat="server" class="textusername" ValidationGroup="ExcercisesRequired"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSubject_forUnits_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidatorExcercisesRequired" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlSubject_forUnits" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                        ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Sub-ScheduleId <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubSchId" runat="server" class="textusername" ValidationGroup="ExcercisesRequired"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSubSchId_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlSubSchId" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                        ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Unit<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlExerciseUnit" runat="server" class="textusername" ValidationGroup="ExcercisesRequired">
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <asp:CustomValidator ID="CustomValidator19" runat="server" ClientValidationFunction="validate"
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
                                                        <asp:ListItem Text="Exercise" Value="1" Selected="True"></asp:ListItem>
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
                                            <asp:Panel ID="taskpanel" runat="server" Visible="true">
                                                <tr>
                                                    <td align="left">
                                                        Question Type <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlqstnType" runat="server" AutoPostBack="true" class="textusername"
                                                            OnSelectedIndexChanged="qstnType_SelectedIndexChanged" ValidationGroup="ExcercisesRequired">
                                                            <asp:ListItem Text="Radio" Value="1" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="CheckBox" Value="4"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="lblQtn" runat="server" Text=" Enter QSTN-NAME"></asp:Label>
                                                        <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtQstnName" runat="server" class="txtQstn" ValidationGroup="ExcercisesRequired"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtQstnName" runat="server"
                                                            ValidationGroup="ExcercisesRequired" ErrorMessage="* Enter Question Name" ForeColor="Red"
                                                            ControlToValidate="txtQstnName" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                            Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <asp:Panel ID="radioPanel" runat="server" Visible="true">
                                                <tr>
                                                    <td align="left">
                                                        Enter Option-A <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtA" runat="server" class="txtQstn" Style="width: 67%;"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Enter option" ForeColor="Red" ControlToValidate="txtA" Display="Dynamic"
                                                            Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Enter Option-B <font style="color: Red;">*</font>
                                                    </td>
                                                    <td align="left">
                                                        <asp:TextBox ID="txtB" runat="server" class="txtQstn" Style="width: 67%;"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Select option" ForeColor="Red" ControlToValidate="txtB" Display="Dynamic"
                                                            Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Enter Option-C <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtC" runat="server" class="txtQstn" Style="width: 67%;"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Enter option" ForeColor="Red" ControlToValidate="txtC" Display="Dynamic"
                                                            Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Enter Option-D <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtD" runat="server" class="txtQstn" Style="width: 67%;"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Enter option" ForeColor="Red" ControlToValidate="txtD" Display="Dynamic"
                                                            Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        Enter Option-E <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtE" runat="server" class="textusername" Style="width: 67%;"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Enter Option" ForeColor="Red" ControlToValidate="txtE" Display="Dynamic"
                                                            Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="lblDDlAns" runat="server" Text="Select Answer"></asp:Label>
                                                        <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlAns" runat="server" class="textusername" ValidationGroup="ExcercisesRequired">
                                                            <asp:ListItem Text="--Select--" Value="--Select--" Selected="True"></asp:ListItem>
                                                            <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                                            <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                                            <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                                            <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td align="left">
                                                        <asp:CustomValidator ID="CustomValidator21" runat="server" ClientValidationFunction="validate"
                                                            ControlToValidate="ddlAns" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                            ValidationGroup="ExcercisesRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                            CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                                    </td>
                                                </tr>
                                                <%--   <tr>
                    <td>
                        <asp:Label ID="EnterAnswer" runat="server" Text="Select Answer"></asp:Label><font
                            style="color: Red;">*</font>
                    </td>
                    <td>
                        <asp:DropDownCheckBoxes ID="ddlAns" runat="server" AddJQueryReference="false" UseButtons="False"
                            UseSelectAllNode="True" CssClass="dropdownlist" Style="width: 96px;" ValidationGroup="ExcercisesRequired">
                            <asp:ListItem Text="A" Value="1"></asp:ListItem>
                            <asp:ListItem Text="B" Value="2"></asp:ListItem>
                            <asp:ListItem Text="C" Value="3"></asp:ListItem>
                            <asp:ListItem Text="D" Value="4"></asp:ListItem>
                            <asp:ListItem Text="E" Value="5"></asp:ListItem>
                          
                        </asp:DropDownCheckBoxes>
                    </td>
                    <td align="left">
                       
                    </td>
                </tr>--%>
                                            </asp:Panel>
                                            <asp:Panel ID="FillinBlanksPAnel" runat="server" Visible="false">
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="lblenteranswer" runat="server" Text=" Enter Answer"></asp:Label>
                                                        <font style="color: Red;">*</font>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtFillInAnswer" runat="server" class="txtQstn"></asp:TextBox>
                                                    </td>
                                                    <td align="left">
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtFillInAnswer"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>--%>
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
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="ExcercisesRequired"
                                                            ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtDescriptAnswer"
                                                            Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td colspan="3">
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%">
                                            <tr>
                                                <td align="right" style="width: 40%; padding-right: 15px;">
                                                    <b>Select Excel<font style="color: Red;">*</font> </b>
                                                </td>
                                                <td align="left" style="width: 35%;">
                                                    <asp:FileUpload ID="fileuploadExcel" CssClass="btn btn-success" runat="server" />
                                                </td>
                                                <td align="center" style="width: 13%;">
                                                    <asp:Button ID="btnExcel" runat="server" Text="Uplaod" CssClass="btn btn-primary"
                                                        OnClick="btnExcel_Click" />
                                                </td>
                                                <td align="left" style="width: 12;">
                                                    <asp:Button ID="btnSaveQuestion" runat="server" Text="Save" CssClass="btn btn-primary"
                                                        OnClick="btnSaveQuestion_Click" ValidationGroup="ExcercisesRequired" />
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
                                        <asp:GridView ID="gvUnits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="width: 100%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="QuestionID" DataField="QstnNAId" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="A-Option" DataField="A" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="B-Option" DataField="B" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="C-Option" DataField="C" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="D-Option" DataField="D" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="E-Option" DataField="E" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Answer" DataField="Answer" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnExcel" />
                                    </Triggers>
                                </asp:UpdatePanel>
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
