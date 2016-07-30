<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin-Assessment.aspx.cs"
    Inherits="PresentationLayer.Admin.Admin_Assessment" MasterPageFile="~/AdminMaster.Master" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href='http://fonts.googleapis.com/css?family=Allura' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Great+Vibes' rel='stylesheet'
        type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Berkshire+Swash" rel="stylesheet"
        type="text/css">
         <style type="text/css">
  .certicatefont{ font-family: 'Great Vibes', cursive;}
   .certicatefont h1{ font: 600 40px/1.3 'ARIAL', Helvetica, sans-serif;
  color: #F00;
  text-shadow: 1px 1px 0px #ededed, 4px 4px 0px rgba(0,0,0,0.15);}
  .certicatefont p{font: 100 18px/1.3 'Berkshire Swash', Helvetica, sans-serif;
  color: #0070c0;line-height:42px;
  }
  .certicatetextbox{background: none;
  border: none;font-size:20px; color:#021c30;border-bottom:1px solid #021c30; padding:0px 4px;margin:0px 10px }
  .datetable{ font-family:Arial, Helvetica, sans-serif;}
   .datetable table tbody tr th{border:1px solid #03426f;font-size:12px;background:#0070c0;color:#FFF;padding:5px; }
   .datetable table tbody tr td{border:1px solid #03426f;font-size:11px;background:#fff;color:#FFF;padding:5px; }
   .resultbg{ background-image:url(../StudentImages/resultsbg.jpg); background-repeat:no-repeat; background-position:top center;}
   .gradebg{ background-image:url(../StudentImages/gradebg.jpg); background-repeat:no-repeat; background-position:top center;}
   .gradebg p{color:#5e4503;}
    .trainingbg{ background-image:url(../StudentImages/trainingbg.jpg); background-repeat:no-repeat; background-position:top center;}
   .trainingbg p{color:#246206;}
  </style>
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
         //Function to allow only numbers to textbox
         function validate(key) {
             //getting key code of pressed key
             var keycode = (key.which) ? key.which : key.keyCode;
             //comparing pressed keycodes
             if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                 return false;
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
        #tblSampleTest td
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
        #tblFinal td
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
        
        .txtQstn
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            width: 150%;
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
                <a href="#">ASSESSMENT</a> &nbsp; > &nbsp;<a href="Admin-Assessment.aspx" style="color: #00CCFF">add-ASSESSMENT</a>
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
                                                OnSelectedIndexChanged="ddlBookingsPrograms_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Programe Name" ForeColor="Red" ControlToValidate="ddlBookingsPrograms"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblCategoriesForExcercises" runat="server" Text="Select Category"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsCategories" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlBookingsCategories_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Category Name" ForeColor="Red" ControlToValidate="ddlBookingsCategories"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblbookingGroup" runat="server" Text="Select Group"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlbookingGroup" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlbookingGroup_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Group Name" ForeColor="Red" ControlToValidate="ddlbookingGroup"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblbookingYear" runat="server" Text="Select Year-Semester"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlbookingYear" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlbookingYear_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Year-Semester" ForeColor="Red" ControlToValidate="ddlbookingYear"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsSubject" runat="server" class="textusername" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Subjects" ForeColor="Red" ControlToValidate="ddlBookingsSubject"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <%--        <tr>
                                        <td align="right" class="style1">
                                            Select Unit <font style="color: Red;">*</font>
                                        </td>
                                        <td class="style2">
                                            <asp:DropDownList ID="ddlBookingsUnit" runat="server" class="textusername" style="width:192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td >
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Unit" ForeColor="Red" ControlToValidate="ddlBookingsUnit"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td align="right">
                                            Slot Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlBookingSlotId" runat="server" class="textusername" Style="width: 192px">
                                             <asp:ListItem Text="--Select--" Value="0" Selected="True" ></asp:ListItem>
                                            <asp:ListItem Text="Slot-A" Value="1"></asp:ListItem>
                                             <asp:ListItem Text="Slot-B" Value="2"></asp:ListItem>
                                              <asp:ListItem Text="Slot-C" Value="3"></asp:ListItem>
                                               <asp:ListItem Text="Slot-D" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Select Slot" ForeColor="Red" ControlToValidate="ddlBookingSlotId"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Enter Slot Date" ForeColor="Red" ControlToValidate="txtSlotDate"
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
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Enter Slot Time" ForeColor="Red" ControlToValidate="txtSlotTime"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                           Tot-Sessions<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBookingSessions" onkeypress="return validate(event)" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Enter Sessions" ForeColor="Red" ControlToValidate="txtBookingSessions"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Slot Status <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBookongStatus" runat="server" class="textusername" ReadOnly="true"
                                                Text="New"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBookingStatusdate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage=" Status Date " ForeColor="Red" ControlToValidate="txtBookingStatusdate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"> </asp:RequiredFieldValidator>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="RequiredProgram"
                                                ErrorMessage="Enter Temarks " ForeColor="Red" ControlToValidate="txtBookingsRemarks"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnAddSlot" runat="server" Text="Save Slot" CssClass="btn btn-primary"
                                                OnClick="btnAddSlot_Click" ValidationGroup="RequiredProgram" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvUpdateBookings" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: 4%; width: 87%;" PageSize="15">
                                    <Columns>
                                      <asp:BoundField HeaderText="Slot_ID" DataField="Slot_Name" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Slot_Date" DataField="Slot_Date" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Slot_Time" DataField="Slot_Time" HeaderStyle-HorizontalAlign="Left" />
                                          <asp:BoundField HeaderText="Tot-Sessions" DataField="Slot_Sessions" HeaderStyle-HorizontalAlign="Left" />
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
                                                OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="Select Programe Name" ForeColor="Red" ControlToValidate="ddlProgramsForUnits"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" AppendDataBoundItems="true"
                                                class="textusername" OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged"
                                                Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="Select Category " ForeColor="Red" ControlToValidate="ddlCategoriesForUnits"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject_forUnits" runat="server" class="textusername" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="Select Subjects " ForeColor="Red" ControlToValidate="ddlSubject_forUnits"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Question Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlqstnType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="qstnType_SelectedIndexChanged" Style="width: 192px">
                                                <asp:ListItem Text="Radio" Value="1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="Select Question Type " ForeColor="Red" ControlToValidate="ddlqstnType"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Enter QSTN-NAME <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtQstnName" runat="server" class="txtQstn"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Requiredsampletest"
                                                ErrorMessage="Enter QSTN-NAME " ForeColor="Red" ControlToValidate="txtQstnName"
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
                                    <asp:Panel ID="radioPanel" runat="server" Visible="true">
                                        <tr>
                                            <td align="right">
                                                Enter Option-A <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtA" runat="server" class="txtQstn"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="Enter  Option-A " ForeColor="Red" ControlToValidate="txtA" Display="Dynamic"
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
                                                    ErrorMessage="Enter  Option-B " ForeColor="Red" ControlToValidate="txtB" Display="Dynamic"
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
                                                    ErrorMessage="Enter  Option-C " ForeColor="Red" ControlToValidate="txtC" Display="Dynamic"
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
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="Enter  Option-D " ForeColor="Red" ControlToValidate="txtD" Display="Dynamic"
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
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="Enter  Option-E " ForeColor="Red" ControlToValidate="txtE" Display="Dynamic"
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
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ValidationGroup="Requiredsampletest"
                                                    ErrorMessage="Enter Answer " ForeColor="Red" ControlToValidate="txtFillInAnswer"
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
                                                    ErrorMessage="Enter Description " ForeColor="Red" ControlToValidate="txtDescriptAnswer"
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
                                            <asp:Button ID="btnSaveQuestion" runat="server" Text="Save Question" CssClass="btn btn-primary"
                                                OnClick="btnSaveQuestion_Click" ValidationGroup="Requiredsampletest" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <span style="color: #000000"><b>Please</b></span>
                                            <asp:LinkButton ID="lnkDExcel" runat="server" ForeColor="red" CssClass="cancel" UseSubmitBehavior="false"
                                                Font-Italic="True" OnClick="lnkDExcel_Click">Download</asp:LinkButton>
                                            <span style="color: #000000"><b>&nbsp;Excel and Fill Questions</b></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Upload Excel<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="fileuploadExcel" runat="server" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnExcelView" runat="server" Text="View Uplaoded Excel" CssClass="btn btn-primary"
                                                OnClick="btnExcelView_Click" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnExcel" runat="server" Text="UplaodExcel" CssClass="btn btn-primary"
                                                OnClick="btnExcel_Click" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="gvUnits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="A-Option" DataField="A" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="B-Option" DataField="B" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="C-Option" DataField="C" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="D-Option" DataField="D" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="E-Option" DataField="E" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Answer" DataField="Answer" HeaderStyle-HorizontalAlign="Center" />
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
                                                OnSelectedIndexChanged="ddlFinalProgram_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Program  " ForeColor="Red" ControlToValidate="ddlFinalProgram"
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
                                                Style="width: 192px;">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Category  " ForeColor="Red" ControlToValidate="ddlFinalCategory"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlFinalSubject" runat="server" class="textusername" Style="width: 192px;">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Subject  " ForeColor="Red" ControlToValidate="ddlFinalSubject"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Question Type <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlRealTestQstnType" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlRealTestQstnType_SelectedIndexChanged">
                                                <asp:ListItem Text="Radio" Value="1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="Fill In Blanks" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Descriptive" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Select Question Type" ForeColor="Red" ControlToValidate="ddlRealTestQstnType"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Enter QSTN-NAME <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtFinalqstnName" runat="server" class="txtQstn"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="Requiredrealtest"
                                                ErrorMessage="* Enter Question Name" ForeColor="Red" ControlToValidate="txtFinalqstnName"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="radioPanelFinal" runat="server" Visible="true">
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
                                            <td>
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
                                                    UseButtons="False" UseSelectAllNode="True" CssClass="dropdownlist" Style="width: 96px;">
                                                    <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                                    <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                                    <%-- <Texts SelectBoxCaption="Residential type" />--%>
                                                </asp:DropDownCheckBoxes>
                                            </td>
                                            <td align="left">
                                                <%--<asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                                                    ControlToValidate="ddlAns" ErrorMessage="* Select a Answer" ForeColor="Red"
                                                    ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                    CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>--%>
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
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Answer" ForeColor="Red" ControlToValidate="txtFinalQstnAns"
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
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ValidationGroup="Requiredrealtest"
                                                    ErrorMessage="* Enter Answer" ForeColor="Red" ControlToValidate="txtFinalDiscriptiveAns"
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
                                            <asp:Button ID="btnFinalSaveQstn" runat="server" Text="Save Question" CssClass="btn btn-primary"
                                                OnClick="btnFinalSaveQstn_Click" ValidationGroup="Requiredrealtest" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <span style="color: #000000"><b>Please</b></span>
                                            <asp:LinkButton ID="lnkbtnFTExcel" runat="server" ForeColor="red" CssClass="cancel"
                                                UseSubmitBehavior="false" Font-Italic="True" OnClick="lnkbtnFTExcel_Click">Download</asp:LinkButton>
                                            <span style="color: #000000"><b>&nbsp;Excel and Fill Questions</b></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Upload Excel<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="fileupload1" runat="server" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnFinalViewExcel" runat="server" Text="View Uplaoded Excel" CssClass="btn btn-primary"
                                                OnClick="btnFinalViewExcel_Click" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnFinalExcelUpload" runat="server" Text="UplaodExcel" CssClass="btn btn-primary"
                                                OnClick="btnFinalExcelUpload_Click" />&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="gvFinalExcelView" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="A-Option" DataField="A" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="B-Option" DataField="B" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="C-Option" DataField="C" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="D-Option" DataField="D" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="E-Option" DataField="E" HeaderStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Answer" DataField="Answer" HeaderStyle-HorizontalAlign="Center" />
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ValidationGroup="Requiredresult"
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Category  " ForeColor="Red" ControlToValidate="ddlResultCategory"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlResultSubject" runat="server" AutoPostBack="true" class="textusername"
                                                Style="width: 192px" 
                                                onselectedindexchanged="ddlResultSubject_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Subject  " ForeColor="Red" ControlToValidate="ddlResultSubject"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="PnlTesttype" runat="server" Visible="false">
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ValidationGroup="Requiredresult"
                                                ErrorMessage="* Select Question Type " ForeColor="Red" ControlToValidate="ddlResultQstnType"
                                                Display="Dynamic" Font-Size="11px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <table align="left">
                                    <tr>
                                        <td>
                                            <h4>
                                                <asp:Label ID="lblResultHToGenerate" runat="server" Text="RT-Subjects To Generate :"
                                                    Visible="false"></asp:Label></h4>
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvResult" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="RT-ID" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Name" DataField="Student_Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="T_Qstns" DataField="Total_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Ans_Qstns" DataField="Std_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Un-Ans_Qstns" DataField="Std_Un_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Correct_Ans" DataField="Std_Correct_Ans" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="In-Correct_Ans" DataField="Std_Wrong_Ans" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Status" DataField="Activity" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnResultSubmit" runat="server" Text="Generate Result" CssClass="btn btn-primary"
                                                ValidationGroup="Requiredresult" OnClick="btnResultSubmit_Click" Visible="false" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btncancelResultSubmit" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Visible="false" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table align="center">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblResult" runat="server" Text="No Records To Display" Visible="false"
                                                Style="color: Red;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table align="left">
                                    <tr>
                                        <td>
                                            <h4>
                                                <asp:Label ID="lblResultHGenerated" runat="server" Text="RT-Certificate To Generate :"
                                                    Visible="false"></asp:Label></h4>
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvResultActivate" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="RT-ID" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Name" DataField="Student_Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="T_Qstns" DataField="Total_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Ans_Qstns" DataField="Std_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Un-Ans_Qstns" DataField="Std_Un_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Correct_Ans" DataField="Std_Correct_Ans" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="In-Correct_Ans" DataField="Std_Wrong_Ans" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Status" DataField="Activity" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnGenerateCertificate" runat="server" Text="Generate Certificate"
                                                Visible="false" CssClass="btn btn-primary" ValidationGroup="Requiredresult" OnClick="btnGenerateCertificate_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnCancelGenerateCertificate" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Visible="false" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table align="center">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblResultActive" runat="server" Text="No Records To Display" Visible="false" Style="color: Red;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table align="left">
                                    <tr>
                                        <td>
                                            <h4>
                                                <asp:Label ID="lblResultHView" runat="server" Text="View Certificate :" Visible="false"></asp:Label></h4>
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvresultCertificate" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="width: 100%;" PageSize="15">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Cert-ID" DataField="CertificateID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Id" DataField="Student_Id" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="RT-ID" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Cert-Status" DataField="Certificate_Status" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                                <table>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btnResultView" runat="server" Text="View Certificate" Visible="false"
                                                CssClass="btn btn-primary" ValidationGroup="Requiredresult" OnClick="btnResultView_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnResultViewCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Visible="false" />
                                        </td>
                                    </tr>
                                </table>
                                <table align="center">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCertificate" runat="server" Text="No Records To Display" Visible="false"
                                                Style="color: Red;"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="grade">
                                <table id="gradetable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            List of Programs <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectPrograms_SelectedIndexChanged" Style="width: 192px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ValidationGroup="Requiredgrade"
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ValidationGroup="Requiredgrade"
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ValidationGroup="Requiredgrade"
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
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)"  />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="Cat-RT-Id" DataField="S_No" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Std-Id" DataField="StudentID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Percentage" DataField="Percentage" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Avg Marks" DataField="Avg" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Total" DataField="Total_Marks" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Grade" DataField="Grade" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="GeneratedDate" DataField="Grade_GeneratedDate" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Status" DataField="Activity" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="StatusDate" DataField="Grade_StatusDate" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <br />
                                <table>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="BtnSubmit" runat="server" Text="Generate Certificate" CssClass="btn btn-primary"
                                                ValidationGroup="Requiredgrade"  OnClick="BtnSubmit_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-primary" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
  

  <asp:Panel ID="PnlSubjectCertificate" runat="server" Visible="false">
    <div id="div1" style="height: 300px; position: relative;">
        <div id="div2" style="max-height: 100%; overflow: auto; border: 1px solid red;width:72%;margin:auto;">
            <div id="div3" style="height: 100%; border: 5px solid yellow;">
               
                <table align="center" width="900" border="1" style="border: 3px solid #0d4aa2;">
                    <tr style="">
                        <td height="697" align="center" valign="top">
                            <div class="nobgfortable certicatefont resultbg">
                                <table width="900" border="1">
                                    <tr>
                                        <td height="258" align="center" valign="top">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="90" align="center" valign="top">
                                            <h1>
                                                RESULTS CERTIFICATE</h1>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            <table width="700" border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="2" align="center">
                                                        <p>
                                                            <strong>This is to certify that the following result has been awarded to the </strong>
                                                            <img src="../StudentImages/photo.gif" width="140" height="158" style="float: right;" /><br />
                                                            <strong>Student
                                                                
                                                                <asp:Label ID="lblcertificateName" runat="server" name="textfield" class="certicatetextbox" Text="Ramesh" ></asp:Label>                                          
                                                              
                                                            </strong>
                                                            <br />
                                                            <strong>With </strong>
                                                            <br />
                                                            <strong>Register Number<asp:Label ID="lblCertificateRegNo" runat="server" size="10" name="textfield" class="certicatetextbox"  ></asp:Label>      
                                                              and Registered Date<asp:Label ID="lblCertificateRegDate" runat="server" size="10" name="textfield" class="certicatetextbox"  ></asp:Label></strong><br />
                                                            <strong>In the Final Assessment conducted at</strong><br />
                                                            <strong>Organization:
                                                               <asp:Label ID="lblCertificateOrg" runat="server"  size="20"  name="textfield" class="certicatetextbox"  ></asp:Label>  
                                                                on
                                                                 <asp:Label ID="lblCertificateOnDate" runat="server"  size="8"  name="textfield" class="certicatetextbox"  ></asp:Label> 
                                                            </strong>
                                                            <br />
                                                            <strong>In the </strong>
                                                            <br />
                                                            <strong>Subject
                                                                 <asp:Label ID="lblCertificateSubject" runat="server"  size="14"  name="textfield" class="certicatetextbox"  ></asp:Label> 
                                                            </strong>
                                                            <br />
                                                            <strong>Under the</strong><br />
                                                            <strong>Category
                                                                  <asp:Label ID="lblCertificateCategory" runat="server"  size="14"  name="textfield" class="certicatetextbox"  ></asp:Label> 
                                                                with Group
                                                                <asp:Label ID="lblCertificateGroup" runat="server"  size="14"  name="textfield" class="certicatetextbox"  ></asp:Label> 
                                                                for the Semester/Year
                                                                 <asp:Label ID="lblCertificateYear" runat="server"  size="20"  name="textfield" class="certicatetextbox"  ></asp:Label> 
                                                            </strong>
                                                        </p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="260" colspan="2" align="center" valign="top">
                                                        <div class="datetable">
                                                            <table width="760" border="1" align="center" class="datetable">
                                                                <tr>
                                                                    <th width="75">
                                                                        SUBJECT-NAME
                                                                    </th>
                                                                    <th width="108">
                                                                        COMPLETION
                                                                    </th>
                                                                    <th width="57">
                                                                        TOTAL QSTNS
                                                                    </th>
                                                                    <th width="95">
                                                                        ANSWERED QSTNS
                                                                    </th>
                                                                    <th width="82">
                                                                        CORRECT ANSWERS
                                                                    </th>
                                                                    <th width="64">
                                                                        MARKS PER 100
                                                                    </th>
                                                                    <th width="75">
                                                                        PERCENT
                                                                    </th>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                               <%-- <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>--%>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" valign="top">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top">
                                                        <p>
                                                            ISSUED ON:<strong>
                                                                <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="ISSUED  ON"
                                                                    size="14" />
                                                            </strong>
                                                        </p>
                                                    </td>
                                                    <td align="center" valign="top">
                                                        <p>
                                                            <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="Director Name"
                                                                size="20" /></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="448" height="90" align="left" valign="top">
                                                        <p>
                                                            CERTIFICATE-ID:<strong>
                                                                <input name="textfield9" type="text" class="certicatetextbox" id="textfield9" value="CERTIFICATE"
                                                                    size="14" />
                                                            </strong>
                                                            <td width="283" align="center" valign="top">
                                                                <p style="color: #F00">
                                                                    DIRECTOR</p>
                                                            </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" valign="top">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
               
            </div>
        </div>
    </div>
    </asp:Panel>
    <br />
</asp:Content>
