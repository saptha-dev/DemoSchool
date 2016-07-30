<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-PublishCore.aspx.cs" Inherits="PresentationLayer.Admin.Admin_PublishCore" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
                        // row.style.backgroundColor = "aqua";
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
    <script type="text/javascript" language="javascript">
        function validateCheckBoxes() {
            var isValid = false;
            var gridView = document.getElementById('<%= GVStudents.ClientID %>');
            for (var i = 1; i < gridView.rows.length; i++) {
                var inputs = gridView.rows[i].getElementsByTagName('input');
                if (inputs != null) {
                    if (inputs[0].type == "checkbox") {
                        if (inputs[0].checked) {
                            isValid = true;
                            return true;
                        }
                    }
                }
            }
            alert("Please select atleast one checkbox");
            return false;
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
        #heading
        {
            margin-top: 1%;
            font-size: 20px;
            background-image: -webkit-gradient( linear, left top, left bottom, color-stop(0.11, rgb(16, 21, 26)), color-stop(0.55, rgb(74, 99, 137)), color-stop(0.87, rgb(58, 80, 95)) );
            background-image: -moz-transition-gradient( linear, left top, left bottom, color-stop(0.11, rgb(16, 21, 26)), color-stop(0.55, rgb(74, 99, 137)), color-stop(0.87, rgb(58, 80, 95)) );
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
            width: 72%;
            margin: auto;
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
        #map a
        {
            color: White;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="content" runat="server">
    <asp:ScriptManager ID="scrop" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="updnl" runat="server">
        <ContentTemplate>
            <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
                <tr>
                    <td style="width: 20%">
                        <a href="#">ADM-OPERATIONS</a> > <a href="#">Core</a> > <a href="Admin-PublishCore.aspx"
                            style="color: #00CCFF">DashBoard</a>
                    </td>
                    <td style="width: 50%; text-align: left">
                    </td>
                </tr>
            </table>
            <center>
                <div id="heading">
                    &nbsp;&nbsp;&nbsp;DashBoard</div>
            </center>
            <div id="divbody">
                <table style="width: 100%; margin-top: 3%; margin-bottom: 20px;">
                    <tr>
                        <td align="center">
                            <asp:RadioButtonList ID="rdbList" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                Style="width: 39%; margin-left: 175px;" OnSelectedIndexChanged="rdbList_SelectedIndexChanged">
                                <asp:ListItem Text="Publish" Selected="True" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Un-Publish" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <table id="tblItem" style="width: 38%; margin: auto;">
                    <tr style="width: 100%">
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblitem" Text="Select Item" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlItem" runat="server" class="textusername" AutoPostBack="true"
                                Style="width: 100%;" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                                <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Subjects" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Units" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlItem" Display="Dynamic"
                                InitialValue="0" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblprogram" Text="Select Program" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPrograms" runat="server" class="textusername" AutoPostBack="true"
                                Style="width: 100%;" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlPrograms"
                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblCategory" Text="Select Category" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" class="textusername" Style="width: 100%;"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlCategory"
                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblgroup" Text="Select Group" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlgroup" runat="server" class="textusername" Style="width: 100%;"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlgroup" Display="Dynamic"
                                Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblsemYear" Text="Select Semister" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSemister" runat="server" class="textusername" AutoPostBack="true"
                                Style="width: 100%;" OnSelectedIndexChanged="ddlSemister_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSemister"
                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblSubjects" Text="Select Subject" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSubjects" runat="server" class="textusername" Style="width: 100%;"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="RequiredProgram"
                                ErrorMessage="* Select Item" ForeColor="Red" ControlToValidate="ddlSubjects"
                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -3px;"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <asp:Panel ID="PnlUnits" runat="server" Visible="false">
                        <tr>
                            <td class="tblItem">
                                <b>
                                    <asp:Label ID="lblUnits" Text="Select Unit" runat="server"></asp:Label></b>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnits" runat="server" class="textusername" Style="width: 100%;"
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlUnits_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td class="tblItem">
                            <b>Select Role</b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRoles" runat="server" class="textusername" AutoPostBack="true"
                                Style="width: 100%;" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        CATEGORY DETAILS
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <table class="tblDesign" style="width: 80%; margin: auto;">
                                        <tr>
                                            <td width="40%">
                                                Category ID/Name
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueCategoryName" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Reg.Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblvalueCateregDate" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Subjects
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValuecateTSubjects" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Eligibility
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueCateEligibil" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Start-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueCAteStartDate" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                End-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblvalueCAteEndDate" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Duration
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblvalueCateDuration" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Status
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblvaluecatestatus" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Status-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValuecatestatusDate" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="tblDesign" style="width: 80%; margin: auto; margin-top: 30px;">
                                        <tr>
                                            <td width="40%">
                                                Subject Name
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueName" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Reg.Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueReg_Date" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Start-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueStart_Date" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                End-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueEnd_Date" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Status
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueStatus" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                Status-Date
                                            </td>
                                            <td width="60%">
                                                <asp:Label ID="lblValueStatus_Date" runat="Server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Panel ID="unitTable" runat="server" Visible="false">
                                        <table class="tblDesign" style="width: 70%; margin: auto; margin-top: 30px;">
                                            <tr>
                                                <th>
                                                    Units
                                                </th>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Unit No
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblvalueUnitNo" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Section No./Name
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblValueSectionNoName" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Topic List
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblValueTopicsList" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Unit-Reg. Date
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblValueUnitRegDate" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Unit-Status
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblValueUnitStatus" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="40%">
                                                    Unit-Status-Date
                                                </td>
                                                <td width="60%">
                                                    <asp:Label ID="lblValueunitStatusDate" runat="Server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-1">
                        </div>
                        <div class="col-xs-6" style="width: 475px; height: 725px; top: 0px; left: 0px;">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        SELECT STUDENTS
                                    </h3>
                                </div>
                                <div class="panel-body" style="height: 445PX;">
                                    <asp:Label ID="lblNorecords" runat="server" Visible="false" Style="color: red; font-size: 17px;"
                                        Text="Sorry...!!! No Records Found."></asp:Label>
                                    <asp:GridView ID="GVStudents" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                        ShowHeaderWhenEmpty="true" autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF"
                                        HeaderStyle-ForeColor="white" Style="width: 60%;" AllowPaging="true" PageSize="8"
                                        OnPageIndexChanging="gvItem_PageIndexChanging1">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-CssClass="style">
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
                                            <asp:BoundField HeaderText="UserID" DataField="UserID" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                            <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style1" />
                                            <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                            <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="GVCompany" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                        autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                                        Style="width: 72%;" AllowPaging="true" PageSize="8">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-CssClass="style">
                                                <HeaderTemplate>
                                                    <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="CompanyID" DataField="CompanyID" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style1" />
                                            <asp:BoundField HeaderText="BranchID" DataField="Company_BranchID" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                            <asp:BoundField HeaderText="Name" DataField="BranchName" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style1" />
                                            <asp:BoundField HeaderText="Status" DataField="PublishStatus" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                            <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                            <asp:TemplateField Visible="false">
                                                <HeaderTemplate>
                                                    <asp:Label ID="ID" runat="server" Text="ID"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Id" runat="server" Text='<%#Eval("S_No") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <table style="margin-left: 45%;">
                    <tr>
                        <td>
                            <asp:Button ID="BtnPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                ValidationGroup="RequiredProgram" OnClick="BtnPublish_Click" Visible="true" Style="font-family: Times new Roman;
                                font-weight: bold;" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnCancel_Click" />
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
