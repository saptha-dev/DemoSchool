<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin-AssessmentManage.aspx.cs"
    Inherits="PresentationLayer.Admin.Admin_AssessmentManage" MasterPageFile="~/AdminMaster.Master" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "bookings";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
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
        #Categoriestable td
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
        #tblFinal td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        .txtQstn
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            width: 186%;
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
        #gradetable td
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
        .style1
        {
            width: 219px;
        }
        .style2
        {
            width: 203px;
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
                width: 100%;
            margin-left:0px;
            margin-top: 20px
        }
        #map a
        {
            color: White;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="TabName" runat="server" />
     <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 30%">
                <a href="#">ASSESSMENT</a> &nbsp; > &nbsp;<a href="Admin-AssessmentManage.aspx" style="color: #00CCFF">Admin-Assessment Manage</a>
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
                            <li><a href="#bookings" aria-controls="bookings" role="tab" data-toggle="tab">BOOKINGS</a></li>
                            <li><a href="#sampletest" aria-controls="sampletest" role="tab" data-toggle="tab">SAMPLE-TEST</a></li>
                            <li><a href="#realtest" aria-controls="realtest" role="tab" data-toggle="tab">REAL-TEST</a></li>
                            <li><a href="#result" aria-controls="result" role="tab" data-toggle="tab">RESULT</a></li>
                            <li><a href="#grade" aria-controls="grade" role="tab" data-toggle="tab">GRADE</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="padding-top: 20px">
                            <div role="tabpanel" class="tab-pane active" id="bookings">
                                <table id="unitsTable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblProgramsForExcercises" runat="server" Text="Select Program"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlBookingsPrograms_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Programs" ForeColor="Red" ControlToValidate="ddlBookingsPrograms"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblCategoriesForExcercises" runat="server" Text="Select Category"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsCategories" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlBookingsCategories_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Category" ForeColor="Red" ControlToValidate="ddlBookingsCategories"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblbookingGroup" runat="server" Text="Select Group"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlbookingGroup" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlbookingGroup_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Group" ForeColor="Red" ControlToValidate="ddlbookingGroup"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblbookingYear" runat="server" Text="Select Year-Semester"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlbookingYear" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlbookingYear_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Semester Year" ForeColor="Red" ControlToValidate="ddlbookingYear"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsSubject" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlBookingsSubject_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Subject" ForeColor="Red" ControlToValidate="ddlBookingsSubject"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label1" runat="server" Text="Select Date"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlbkngDate" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlbkngDate_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Subject" ForeColor="Red" ControlToValidate="ddlbkngDate"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Slot Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSlotName" runat="server" class="textusername" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlSlotName_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Slot Name " ForeColor="Red" ControlToValidate="ddlSlotName"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Slot Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSlotDate" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Enter Slot Date " ForeColor="Red" ControlToValidate="txtSlotDate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Slot Time <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSlotTime" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Slot Time " ForeColor="Red" ControlToValidate="txtSlotTime"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Slot Status <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSlotStatus" runat="server" class="textusername" Width="192px">
                                                <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Changed" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Hold" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Canceled" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Slot Status " ForeColor="Red" ControlToValidate="ddlSlotStatus"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBookingStatusdate" ReadOnly="true" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Select Status Date" ForeColor="Red" ControlToValidate="txtBookingStatusdate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Remarks <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBookingsRemarks" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ValidationGroup="Requiredbookings"
                                                ErrorMessage="* Enter Remarks " ForeColor="Red" ControlToValidate="txtBookingsRemarks"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnAddSlot" runat="server" Text="Update Slot" CssClass="btn btn-primary"
                                                OnClick="btnAddSlot_Click" ValidationGroup="Requiredbookings" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                 <asp:Button ID="btnDeleteSlot" runat="server" Text="Delete Slot" CssClass="btn btn-primary"
                                                 ValidationGroup="Requiredbookings" onclick="btnDeleteSlot_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvUpdateBookings" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Slot_Date" DataField="Slot_Date" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Slot_Time" DataField="Slot_Time" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Slot_Status" DataField="Slot_Status" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Left" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="sampletest">
                                <table id="tblSampleTest" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Program <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProgramsForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="* Select Program" ForeColor="Red" ControlToValidate="ddlProgramsForUnits"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                class="textusername" OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged"
                                                Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="* Select Category" ForeColor="Red" ControlToValidate="ddlCategoriesForUnits"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject_sampleTest" runat="server" class="textusername"
                                                Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="* Select Subject" ForeColor="Red" ControlToValidate="ddlSubject_sampleTest"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Question Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlqstnType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="qstnType_SelectedIndexChanged" Width="192px">
                                                <asp:ListItem Text="--Select--" Value="0" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Radio" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="* Select Question Type " ForeColor="Red" ControlToValidate="ddlqstnType"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblSampleTestQstn" runat="server" Visible="false" Text="Enter QSTN-NAME"></asp:Label>
                                            <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtQstnName" runat="server" Visible="false" class="txtQstn"></asp:TextBox>
                                        </td>
                                        <td align="right">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="* Select Question Name " ForeColor="Red" ControlToValidate="txtQstnName"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                            <td align="right">
                                                Enter Option-A <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtA" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                             <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtA"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-B <font style="color: Red;">*</font>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtB" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                             <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtB"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-C <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtC" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                              <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtC"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                           <tr>
                                            <td align="right">
                                                Enter Option-D <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtD" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                              <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtD"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                           <tr>
                                            <td align="right">
                                                Enter Option-E <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtE" runat="server" class="textusername"></asp:TextBox>
                                            </td>
                                              <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtE"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                            <tr>
                                            <td>
                                                <asp:Label ID="EnterAnswer" runat="server" Text="Select Answer"></asp:Label><font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlAns" runat="server" AutoPostBack="true" 
                                                    class="textusername" >
                                                   <asp:ListItem Text="---Select---" Value=""></asp:ListItem>
                                                    <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                                     <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td align="left">
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                                                    ControlToValidate="ddlAns" ErrorMessage="* Select a Answer" ForeColor="Red"
                                                    ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                    CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                            </td>
                                        </tr>--%>
                                    <asp:Panel ID="radioPanel" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Option-A <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtA" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Option-A " ForeColor="Red" ControlToValidate="txtA" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-B <font style="color: Red;">*</font>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtB" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Option-B " ForeColor="Red" ControlToValidate="txtB" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-C <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtC" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Option-C" ForeColor="Red" ControlToValidate="txtC" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-D <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtD" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Option-D " ForeColor="Red" ControlToValidate="txtD" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-E <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtE" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Option-E " ForeColor="Red" ControlToValidate="txtE" Display="Dynamic"
                                                    Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="EnterAnswer" runat="server" Text="Select Answer"></asp:Label><font
                                                    style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownCheckBoxes ID="ddlAns" runat="server" AddJQueryReference="false" UseButtons="False"
                                                    UseSelectAllNode="True" CssClass="dropdownlist" Style="width: 192px;">
                                                    <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                                    <%-- <Texts SelectBoxCaption="Residential type" />--%>
                                                </asp:DropDownCheckBoxes>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="FillinBlanksPAnel" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Answer <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFillInAnswer" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Enter Answer " ForeColor="Red" ControlToValidate="txtFillInAnswer"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="DescriptivePanel" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Answer <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDescriptAnswer" runat="server" class="txtQstn" Style="height: 129px;"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="* Select Enter Answer " ForeColor="Red" ControlToValidate="txtDescriptAnswer"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                                OnClick="btnUpdateSampleQuestion_Click" Visible="false" ValidationGroup="Requiredsampletest" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Panel ID="pnlGVSearch" runat="server" Visible="false">
                                    <table style="width: 100%; margin: auto;">
                                        <tr>
                                            <td>
                                                Search Qust. Id
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQuistId" class="textusername" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                Qust. Name
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtQustName" class="textusername" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnSearch" class="btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:GridView ID="gvSampleTest" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15" OnPageIndexChanging="gvSampleTest_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lblQstnID" runat="server" Text="Qstn_ID"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Qstn_ID" runat="server" Text='<%#Eval("Qstn_ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:BoundField HeaderText="Qstn_ID" DataField="Qstn_ID" HeaderStyle-HorizontalAlign="Left" />--%>
                                        <asp:BoundField HeaderText="Cat-Id" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                        <%--<asp:BoundField HeaderText="Total Subjects" DataField="Subject_T_Units" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status" DataField="Subject_Status" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status Date" DataField="Subject_Status_Date" HeaderStyle-HorizontalAlign="Left" />--%>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text="Edit"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="gvSampleTestID" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    runat="server" autopostback="true" OnClick="gvSampleTestID_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lbl2" runat="server" Text="Delete"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="gvSampleTestDelete" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    runat="server" autopostback="true" OnClick="gvSampleTestDelete_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="realtest">
                                <table id="tblFinal" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Program <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFinalProgram" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlFinalProgram_SelectedIndexChanged" Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Program " ForeColor="Red" ControlToValidate="ddlFinalProgram"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFinalCategory" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                class="textusername" OnSelectedIndexChanged="ddlFinalCategory_SelectedIndexChanged"
                                                Width="192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Category " ForeColor="Red" ControlToValidate="ddlFinalCategory"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFinalSubject" runat="server" AutoPostBack="true" Width="192px"
                                                class="textusername">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Subject " ForeColor="Red" ControlToValidate="ddlFinalSubject"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Question Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlRealTestQstnType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlRealTestQstnType_SelectedIndexChanged" Width="192px">
                                                <asp:ListItem Text="--Select--" Value="0" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Radio" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select  Question Type" ForeColor="Red" ControlToValidate="ddlRealTestQstnType"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                          <asp:Label ID="lblFinalTestQstn" runat="server" Text="Enter QSTN-NAME" Visible="false"></asp:Label> <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFinalqstnName" runat="server" Visible="false" class="txtQstn"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select QSTN-NAME" ForeColor="Red" ControlToValidate="txtFinalqstnName"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="radioPanelFinal" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Option-A <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalA" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Option-A" ForeColor="Red" ControlToValidate="txtFinalA"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-B <font style="color: Red;">*</font>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="txtFinalB" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Option-B" ForeColor="Red" ControlToValidate="txtFinalB"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-C <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalC" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Option-C" ForeColor="Red" ControlToValidate="txtFinalC"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-D <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalD" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Option-D" ForeColor="Red" ControlToValidate="txtFinalD"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Enter Option-E <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalE" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Option-E" ForeColor="Red" ControlToValidate="txtFinalE"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblanswr" runat="server" Text="Select Answer"></asp:Label><font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownCheckBoxes ID="ddlFinalAns" runat="server" AddJQueryReference="false"
                                                    UseButtons="False" UseSelectAllNode="True" CssClass="dropdownlist" Style="width: 192px;">
                                                    <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                                    <%-- <Texts SelectBoxCaption="Residential type" />--%>
                                                </asp:DropDownCheckBoxes>
                                            </td>
                                            <td align="left">
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="FillinBlanksPAnelFinal" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Answer <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalQstnAns" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Enter Answer " ForeColor="Red" ControlToValidate="txtFinalQstnAns"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="DescriptivePanelFinal" runat="server" Visible="false">
                                        <tr>
                                            <td align="right">
                                                Enter Answer <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFinalDiscriptiveAns" runat="server" class="txtQstn" Style="height: 129px;"></asp:TextBox>
                                            </td>
                                            <td align="left">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Discriptive Answer " ForeColor="Red" ControlToValidate="txtFinalDiscriptiveAns"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                            <asp:Button ID="btnFinalUpdateQstn" runat="server" Visible="false" Text="Update Question" CssClass="btn btn-primary"
                                                OnClick="btnFinalUpdateQstn_Click" ValidationGroup="Requiredrealtest" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                 <asp:Panel ID="pnlGVFTSearch" runat="server" Visible="false">
                                    <table style="width: 100%; margin: auto;">
                                        <tr>
                                            <td>
                                                Search Qust. Id
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFTQstnID" class="textusername" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                Qust. Name
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFTQstnName" class="textusername" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button ID="btnFTSearch" class="btn-primary" runat="server" Text="Search" 
                                                    onclick="btnFTSearch_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:GridView ID="gvFinalTest" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: -2%; width: 98%;" PageSize="15" 
                                    onpageindexchanging="gvFinalTest_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Qstn_ID" runat="server" Text='<%#Eval("Qstn_ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:BoundField HeaderText="Qstn_ID" DataField="Qstn_ID" HeaderStyle-HorizontalAlign="Left" />--%>
                                        <asp:BoundField HeaderText="Category_Id" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                        <%--<asp:BoundField HeaderText="Total Subjects" DataField="Subject_T_Units" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status" DataField="Subject_Status" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status Date" DataField="Subject_Status_Date" HeaderStyle-HorizontalAlign="Left" />--%>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lbl1" runat="server" Text="Edit"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="gvFinalTestID" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    runat="server" autopostback="true" OnClick="gvFinalTestID_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:Label ID="lbl3" runat="server" Text="Delete"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="gvRealTestDelete" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    runat="server" autopostback="true" OnClick="gvRealTestDelete_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="result">
                                <table id="programstable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Program <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultProgram" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlResultProgram_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Program  " ForeColor="Red" ControlToValidate="ddlResultProgram"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultCategory" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                class="textusername" OnSelectedIndexChanged="ddlResultCategory_SelectedIndexChanged"
                                                Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Category" ForeColor="Red" ControlToValidate="ddlResultCategory"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultSubject" runat="server" AutoPostBack="true" class="textusername"
                                                Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Subject  " ForeColor="Red" ControlToValidate="ddlResultSubject"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Test Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultQstnType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlResultQstnType_SelectedIndexChanged" Style="width: 192px">
                                                <asp:ListItem Text="--Select--" Value="0" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="SampleTest" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="RealTest" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Question Type " ForeColor="Red" ControlToValidate="ddlResultQstnType"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnResultSubmit" runat="server" Text="Submit" CssClass="btn btn-primary"
                                                ValidationGroup="Requiredresult" OnClick="btnResultSubmit_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btncancelPrograms" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btncancelPrograms_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvResult" DataKeyNames="Result_ID,Student_Name" runat="server"
                                    autopostback="true" AutoGenerateColumns="false" HeaderStyle-BackColor="#53B03F"
                                    HeaderStyle-ForeColor="white" AllowPaging="true" Style="margin: auto; width: 100%;"
                                    PageSize="15" OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowDeleting="gvDetails_RowDeleting"
                                    OnRowEditing="gvDetails_RowEditing" OnRowUpdating="gvDetails_RowUpdating">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Result_ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblitemUsr" runat="server" Text='<%#Eval("Result_ID") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="lbleditusr" runat="server" Text='<%#Eval("Result_ID") %>' />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Student_Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcity" runat="server" Text='<%#Eval("Student_Name") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtcity" runat="server" Text='<%#Eval("Student_Name") %>' />
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Std_Attempted_Qstns">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtAttemptQstns" runat="server" Text='<%#Eval("Std_Attempted_Qstns") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblAttemptQstns" runat="server" Text='<%#Eval("Std_Attempted_Qstns") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Std_Correct_Ans">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCorrectAns" runat="server" Text='<%#Eval("Std_Correct_Ans") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCorrectAns" runat="server" Text='<%#Eval("Std_Correct_Ans") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Std_Result">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtResult" runat="server" Text='<%#Eval("Std_Result") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblResult" runat="server" Text='<%#Eval("Std_Result") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtRemarks" runat="server" Text='<%#Eval("Remarks") %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblRemarks" runat="server" Text='<%#Eval("Remarks") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    ToolTip="Update" Height="20px" Width="20px" />
                                                <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    ToolTip="Cancel" Height="20px" Width="20px" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                    ToolTip="Edit" Height="20px" Width="20px" />
                                                <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                                    ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png" ToolTip="Delete"
                                                    Height="20px" Width="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="grade">
                               <table id="gradetable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Programs <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectPrograms_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="Requiredgrade"
                                                ErrorMessage="* Select Programs" ForeColor="Red" ControlToValidate="ddlSubjectPrograms"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectCategories" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectCategories_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="Requiredgrade"
                                                ErrorMessage="* Select Category" ForeColor="Red" ControlToValidate="ddlSubjectCategories"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Group <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectGroup" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectGroup_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="Requiredgrade"
                                                ErrorMessage="* Select Group" ForeColor="Red" ControlToValidate="ddlSubjectGroup"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="GVGrade" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: -5%; width: 89%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Id" DataField="StudentID" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                          <asp:BoundField HeaderText="Percentage" DataField="Percentage" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Avg Marks" DataField="Avg" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                         <asp:BoundField HeaderText="Total" DataField="Total_Marks" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                           <asp:BoundField HeaderText="Grade" DataField="Grade" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="GeneratedDate" DataField="Grade_GeneratedDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="StatusDate" DataField="Grade_StatusDate" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />                                   
                                    </Columns>
                                </asp:GridView>
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
