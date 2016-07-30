<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-ManageCore.aspx.cs" Inherits="PresentationLayer.Admin.Admin_ManageCore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "personal";
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
        function validate(source, args) {
            args.IsValid = true;
            if (args.Value == "---Select---") {
                args.IsValid = false;
            }
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
        #Groupstable td
        {
            padding: 6px;
            color: Black;
            font-weight: bold;
        }
        #Yearstable td
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
        }
        
        .textusername:hover
        {
            outline: none;
            box-shadow: 0px 0px 5px #61C5FA;
            border: 1px solid #5AB0DB;
            border-radius: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 20%">
                <a href="#">ADM-OPERATIONS</a> > <a href="#">Core</a> > <a href="Admin-ManageCore.aspx"
                    style="color: #00CCFF">manage-Core</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="TabName" runat="server" />
    <table style="width: 70%; margin: auto;">
        <tr>
            <td align="center">
                <div class="panel panel-default" style="width: 100%; padding: 10px; margin: 10px">
                    <div id="Tabs" role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li><a href="#personal" aria-controls="personal" role="tab" data-toggle="tab">Programs</a></li>
                            <li><a href="#Categories" aria-controls="Categories" role="tab" data-toggle="tab">Categories</a></li>
                            <li><a href="#Group" aria-controls="Group" role="tab" data-toggle="tab">Group</a></li>
                            <li><a href="#Years" aria-controls="Years" role="tab" data-toggle="tab">Years</a></li>
                            <li><a href="#Subjects" aria-controls="Subjects" role="tab" data-toggle="tab">Subjects</a></li>
                            <li><a href="#Units" aria-controls="Units" role="tab" data-toggle="tab">Units</a></li>
                            <%-- <li><a href="#Dashboard" aria-controls="Units" role="tab" data-toggle="tab">DashBoard</a></li>--%>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="padding-top: 20px">
                            <div role="tabpanel" class="tab-pane active" id="personal">
                            <asp:ScriptManager ID="sxcrpt" runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel runat="server" ID="upnl">
                                    <ContentTemplate>
                                        <table id="programstable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="lblprogram" runat="server" Text="Select Programs"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlProgramsNew" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlProgramsNew_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Programe Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Programe Name" ForeColor="Red" ControlToValidate="txtProgramName"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Reg Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramRegDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Reg.code" ForeColor="Red" ControlToValidate="txtProgramRegDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Tot-Categories <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramCategories" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter No.of Categories" ForeColor="Red" ControlToValidate="txtProgramCategories"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlProgramStatus" runat="server" class="textusername" ValidationGroup="RequiredProgram">
                                                        <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Started" Value="2" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Postponed" Value="4"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validate"
                                                        ControlToValidate="ddlProgramStatus" ErrorMessage="* Select an Option" ForeColor="Red"
                                                        ValidationGroup="CateRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                        CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStatusDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* select a Date" ForeColor="Red" ControlToValidate="txtStatusDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    Remarks <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRemarks" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtRemarks"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:Button ID="btnEditPrograms" runat="server" Text="Edit" CssClass="btn btn-primary"
                                                        ValidationGroup="RequiredProgram" OnClick="btnEditPrograms_Click" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnDeletelPrograms" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                        OnClick="btnDeletelPrograms_Click" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btnCancel_Click" />&nbsp;&nbsp;&nbsp;
                                                    <%-- <asp:Button ID="btnUnPublishPrograms" runat="server" Text="Un-Publish" CssClass="btn btn-primary"
                                                OnClick="btnUnPublishPrograms_Click" />--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:GridView ID="gvPrograms" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="margin-left: 16%; width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Program Id" DataField="Program_id" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Name" DataField="Program_name" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Reg Date" DataField="Program_Red_Date" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Total categories" DataField="Program_T_Ctgys" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Status" DataField="Program_Status" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Status Date" DataField="Program_Date" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Categories">
                                <asp:UpdatePanel runat="server" ID="unl">
                                <ContentTemplate>
                                    <table id="Categoriestable" style="margin-top: 19px;">
                                        <tr>
                                            <td align="right">
                                                Select Programs <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlPrograms" runat="server" AutoPostBack="true" ValidationGroup="CateRequired"
                                                    class="textusername" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:CustomValidator ID="Programsddl" runat="server" ClientValidationFunction="validate"
                                                    ControlToValidate="ddlPrograms" ErrorMessage="* Select a Programe" ForeColor="Red"
                                                    ValidationGroup="CateRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                    CssClass="Validator" Style="margin-left: -5px;">
                                                </asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Select Category <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCategoriesOnProgram" runat="server" AutoPostBack="true"
                                                    class="textusername" OnSelectedIndexChanged="ddlCategoriesOnProgram_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="validate"
                                                    ControlToValidate="ddlCategoriesOnProgram" ErrorMessage="* Select a Category"
                                                    ForeColor="Red" ValidationGroup="CateRequired" Display="Dynamic" Font-Size="11px"
                                                    SetFocusOnError="True" CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Reg Date <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCateRegDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="CateRequired"
                                                    ErrorMessage="* Enter Reg Date" ForeColor="Red" ControlToValidate="txtCateRegDate"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Tot-Groups <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TxtCateSubjects" runat="server" onkeypress="return validate(event)"
                                                    class="textusername"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="CateRequired"
                                                    ErrorMessage="* Enter No.of Subjects" ForeColor="Red" ControlToValidate="TxtCateSubjects"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Eligibility <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEligiblty" runat="server" class="textusername"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="CateRequired"
                                                    ErrorMessage="* Enter eligibility" ForeColor="Red" ControlToValidate="txtEligiblty"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Status <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCateStatus" runat="server" class="textusername" ValidationGroup="CateRequired">
                                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                    <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                    <asp:ListItem Text="Postponed" Value="4"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:CustomValidator ID="CustomValidator9" runat="server" ClientValidationFunction="validate"
                                                    ControlToValidate="ddlCateStatus" ErrorMessage="* Select an Option" ForeColor="Red"
                                                    ValidationGroup="CateRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                    CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Status Date <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCateStatusDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="CateRequired"
                                                    ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtCateStatusDate"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                Remarks <font style="color: Red;">*</font>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtcateRemarks" runat="server" class="textusername"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="CateRequired"
                                                    ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtcateRemarks"
                                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:Button ID="btnCategoriesEdit" runat="server" Text="Edit" CssClass="btn btn-primary"
                                                    OnClick="btnCategoriesEdit_Click" ValidationGroup="CateRequired" />&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnCategoriesDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                    OnClick="btnCategoriesDelete_Click" />&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btncateCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                    OnClick="btncateCancel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Group">
                            <asp:UpdatePanel ID="pnl" runat="server">
                            <ContentTemplate>
                                <table id="Groupstable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Programs <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroupProgram" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlGroupProgram_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ValidationGroup="VGGroupCategories"
                                                ErrorMessage="Select Group" ForeColor="Red" ControlToValidate="ddlGroupProgram"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -7px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroupCategories" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlGroupCategories_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ValidationGroup="VGGroupCategories"
                                                ErrorMessage="Select Category" ForeColor="Red" ControlToValidate="ddlGroupCategories"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -7px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Group<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DDlGroupGroup" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="DDlGroupGroup_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="VGGroupCategories"
                                                ErrorMessage="Select Category" ForeColor="Red" ControlToValidate="DDlGroupGroup"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -7px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Group Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGroupName" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ValidationGroup="VGGroupCategories"
                                                ErrorMessage="Enter Group" ForeColor="Red" ControlToValidate="txtGroupName" Display="Dynamic"
                                                Font-Size="11px" Style="margin-left: -7px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Tot-Years <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtGroupYearsCount" runat="server" onkeypress="return validate(event)"
                                                class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ValidationGroup="VGGroupCategories"
                                                ErrorMessage="Enter No. of Years" ForeColor="Red" ControlToValidate="txtGroupYearsCount"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -7px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnEditGroup" runat="server" Text="Update Group" CssClass="btn btn-primary"
                                                ValidationGroup="VGGroupCategories" OnClick="btnEditGroup_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnGroupDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                OnClick="btnGroupDelete_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnGroupCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btnGroupCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="GVGroup" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Id" DataField="Branch_Id" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Group Name" DataField="Branch_Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField HeaderText="Total Years" DataField="Branch_T_Years" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Years">
                            <asp:UpdatePanel ID="up" runat="server">
                            <ContentTemplate>
                                <table id="Yearstable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Programs <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlYearProgram" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlYearProgram_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Select Program Year" ForeColor="Red" ControlToValidate="ddlYearProgram"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -5px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlYearCategory" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlYearCategory_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Select Program Category" ForeColor="Red" ControlToValidate="ddlYearCategory"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -5px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Group <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlYearGroup" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlYearGroup_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Select Group " ForeColor="Red" ControlToValidate="ddlYearGroup"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -5px" InitialValue="0"
                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Year-Sem <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlYearSem" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlYearSem_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Select Group " ForeColor="Red" ControlToValidate="ddlYearSem" Display="Dynamic"
                                                Font-Size="11px" Style="margin-left: -5px" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Year-Sem <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtYearSem" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Enter Semester " ForeColor="Red" ControlToValidate="txtYearSem"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -5px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Tot-Subjects <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtYearSubjects" runat="server" onkeypress="return validate(event)"
                                                class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ValidationGroup="VGYearProgram"
                                                ErrorMessage="Enter No. of Subjects" ForeColor="Red" ControlToValidate="txtYearSubjects"
                                                Display="Dynamic" Font-Size="11px" Style="margin-left: -5px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnUpdateYear" runat="server" Text="Update Year" CssClass="btn btn-primary"
                                                ValidationGroup="VGYearProgram" OnClick="btnUpdateYear_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnYearDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                OnClick="btnYearDelete_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnYearCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btnYearCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Subjects">
                            <asp:UpdatePanel ID="pan" runat="server">
                            <ContentTemplate>
                                <table id="SubjectsTable" style="margin-top: 19px;">
                                    <tr>
                                        <td align="right">
                                            Select Programs <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectPrograms" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectPrograms_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubjectPrograms" ErrorMessage="* Select a Category" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Category <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectCategories" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectCategories_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubjectCategories" ErrorMessage="* Select a Category" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Group <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlBranch" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Year <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlyear_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlyear" ErrorMessage="* Select a year" ForeColor="Red" ValidationGroup="SubjectsRequired"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" CssClass="Validator"
                                                Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Subject Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectSubject" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubjectSubject_SelectedIndexChanged" ValidationGroup="SubjectsRequired">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Enter subject name" ForeColor="Red" ControlToValidate="ddlSubjectSubject"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Reg Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSubRegDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubRegDate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Tot-Units <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsubUnits" runat="server" onkeypress="return validate(event)"
                                                class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Enter No.Of Units" ForeColor="Red" ControlToValidate="txtsubUnits"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubjectStatus" runat="server" class="textusername" ValidationGroup="SubjectsRequired">
                                                <asp:ListItem Text="---Select---" Value="---Select---"></asp:ListItem>
                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Postponed" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator10" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubjectStatus" ErrorMessage="* Select an Option" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSubStatusDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtSubStatusDate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Remarks <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtSubRemarks" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="SubjectsRequired"
                                                ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtSubRemarks"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnSubjectEdit" runat="server" Text="Edit" CssClass="btn btn-primary"
                                                OnClick="btnSubjectEdit_Click" ValidationGroup="SubjectsRequired" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnSubjectDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                OnClick="btnSubjectDelete_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnSubCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btnSubCancel_Click" />
                                            <%--  <asp:Button ID="btnSubjectPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                OnClick="btnSubjectPublish_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnSubjectUnPublish" runat="server" Text="Un-Publish" CssClass="btn btn-primary"
                                                OnClick="btnSubjectUnPublish_Click" />--%>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:GridView ID="gvSubjects" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Subject Id" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Name" DataField="Subject_Name" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Reg Date" DataField="Subject_RegDate" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Total Subjects" DataField="Subject_T_Units" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status" DataField="Subject_Status" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status Date" DataField="Subject_Status_Date" HeaderStyle-HorizontalAlign="Left" />
                                    </Columns>
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Units">
                            <asp:UpdatePanel ID="upnel" runat="server">
                            <ContentTemplate>
                                <table id="unitsTable" style="margin-top: 19px;">
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblProgramsForUnits" runat="server" Text="Select Program"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlProgramsForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlProgramsForUnits" ErrorMessage="* Select a Program" ForeColor="Red"
                                                ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCategoriesForUnits" runat="server" Text="Select Category"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlCategoriesForUnits" ErrorMessage="* Select a Category"
                                                ForeColor="Red" ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px"
                                                SetFocusOnError="True" CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Branch <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnitsBranch" runat="server" AutoPostBack="true" class="textusername"
                                                ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlUnitsBranch_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator13" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlUnitsBranch" ErrorMessage="* Select a Branch" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Select Year <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnitsYear" runat="server" AutoPostBack="true" class="textusername"
                                                ValidationGroup="SubjectsRequired" OnSelectedIndexChanged="ddlUnitsYear_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator14" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlUnitsYear" ErrorMessage="* Select a year" ForeColor="Red"
                                                ValidationGroup="SubjectsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -5px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject_forUnits" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlSubject_forUnits_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlSubject_forUnits" ErrorMessage="* Select a Subject" ForeColor="Red"
                                                ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -83px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Unit Name <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnits" runat="server" AutoPostBack="true" class="textusername"
                                                OnSelectedIndexChanged="ddlUnits_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="UnitsRequired"
                                    ErrorMessage="* Enter unit name" ForeColor="Red" ControlToValidate="txtUnitName"
                                    Display="Dynamic" Font-Size="11px" SetFocusOnError="True" style="margin-left: -83px;"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Reg Date <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUnitRegDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="UnitsRequired"
                                                ErrorMessage="* Enter unit number" ForeColor="Red" ControlToValidate="txtUnitRegDate"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Section NO:Name<font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUnitSecName" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="UnitsRequired"
                                                ErrorMessage="* Enter Section name" ForeColor="Red" ControlToValidate="txtUnitSecName"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Topics List <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTopicList" runat="server" TextMode="MultiLine" class="textusername"
                                                Style="height: 94px; width: 257px;"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="UnitsRequired"
                                                ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtTopicList"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlUnitStatus" runat="server" class="textusername" ValidationGroup="UnitsRequired">
                                                <asp:ListItem Text="---Select---" Value="---Select---"></asp:ListItem>
                                                <asp:ListItem Text="New" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Started" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Completed" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Postponed" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator11" runat="server" ClientValidationFunction="validate"
                                                ControlToValidate="ddlUnitStatus" ErrorMessage="* Select an Option" ForeColor="Red"
                                                ValidationGroup="UnitsRequired" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                                CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Status Date <font style="color: Red;">*</font>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="txtUntStatusDat" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="UnitsRequired"
                                                ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtUntStatusDat"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Remarks <font style="color: Red;">*</font>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtUnitRemarks" runat="server" class="textusername"></asp:TextBox>
                                        </td>
                                        <td align="left">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="UnitsRequired"
                                                ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtUnitRemarks"
                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -5px;"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:Button ID="btnUnitEdit" runat="server" Text="Edit" AutoPostBack="true" CssClass="btn btn-primary"
                                                ValidationGroup="UnitsRequired" OnClick="btnUnitEdit_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnUnitDelete" runat="server" Text="Delete" CssClass="btn btn-primary"
                                                OnClick="btnUnitDelete_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnUnitCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                OnClick="btnUnitCancel_Click" />
                                            <%--<asp:Button ID="btnUnitPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                OnClick="btnUnitPublish_Click" />&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnUnitUnPublish" runat="server" Text="Un-Publish" CssClass="btn btn-primary"
                                                OnClick="btnUnitUnPublish_Click" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="gvUnits" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                    Style="margin-left: 16%; width: 63%;" PageSize="15">
                                    <Columns>
                                        <asp:BoundField HeaderText="Subject Id" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Name" DataField="Unit_Name" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Reg Date" DataField="Unit_Reg_Date" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Total categories" DataField="Topics_List" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status" DataField="Unit_Status" HeaderStyle-HorizontalAlign="Left" />
                                        <asp:BoundField HeaderText="Status Date" DataField="Unite_Status_Date" HeaderStyle-HorizontalAlign="Left" />
                                    </Columns>
                                </asp:GridView>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <%--<div role="tabpanel" class="tab-pane active" id="Dashboard">
                                <table id="dashboard" style="margin-top: 19px;">
                                    <tr>
                                        <td align="center">
                                            Select Item :
                                            <asp:DropDownList ID="ddlItem" runat="server" class="textusername" AutoPostBack="true" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                                             <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Program" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Category" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Subjects" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="Units" Value="4"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%; height: 250px;">
                                    <tr>
                                        <td style="width: 33%;">
                                            <asp:GridView ID="gvItem" CssClass="Gridview" runat="server" AutoGenerateColumns="False"  autopostback="true"
                                                HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true" 
                                                PageSize="8" onpageindexchanging="gvItem_PageIndexChanging1" >
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
                                                    <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-HorizontalAlign="Center"
                                                        ItemStyle-CssClass="style" />
                                                    <asp:BoundField HeaderText="Role Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                                        ItemStyle-CssClass="style" HeaderStyle-Width="50%" />
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                        <td style="width: 33%; background-color: white">
                                        </td>
                                        <td style="width: 33%; background-color: red">
                                        </td>
                                    </tr>
                                </table>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
