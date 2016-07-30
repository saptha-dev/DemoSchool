<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-CompanyList.aspx.cs" Inherits="PresentationLayer.Admin.Admin_CompanyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Gridview
        {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
            width: 100%;
        }
        .textusername
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            width: 22%;
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
        .style
        {
            text-align: right;
            padding: 6px;
        }
        #heading
        {
            margin-top: 10px;
            font-size: 19px;
            font-weight: bold;
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
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        function GetCount() {
            var counter = 0;
            $("#<%=GVAssign.ClientID%> input[id*='chkchild']:checkbox").each(function (index) {
                if ($(this).is(':checked'))
                    counter++;
            });
            if (counter == '0') {
                alert('Select AtLeast 1 Branch')
                return false
            }
            else {

                return true
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 20px;">
        <tr>
            <td style="width: 100%; text-align: left">
                <a href="#">ADM-OPERATIONS</a> > <a href="#">Users</a> > <a href="Admin-CompanyList.aspx"
                    style="color: #00CCFF">ACT-Company</a>
            </td>
        </tr>
    </table>
    <table style="width: 28%; margin: auto; margin-top: 20px;">
        <tr style="width: 100%">
            <td class="style">
                <asp:Label ID="lblStatus" runat="server" Text="Select Type"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Registered ACMP" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Confirmed ACMP" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Cancel ACMP" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <asp:Panel ID="pnlCmpnyDDL" runat="server" Visible="false">
            <tr style="width: 100%">
                <td class="style">
                    <asp:Label ID="lblCompanyActive" runat="server" Text="Select Company"></asp:Label>
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlCompanyActive" runat="server" AutoPostBack="true" class="textusername"
                        Width="200" OnSelectedIndexChanged="ddlCompanyActive_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <table style="width: 72%; margin: auto;">
        <tr>
            <td>
                <div style="width: 100%; margin: auto; margin-bottom: 200px;">
                    <asp:Panel ID="DataPanel" runat="server" Visible="false">
                        <div id="heading">
                            Registered Companies
                        </div>
                        <asp:GridView ID="gvcheckbox" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                            PageSize="8">
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
                                <asp:BoundField HeaderText="" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" />
                                 <asp:BoundField HeaderText="ID" DataField="CompanyId" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="ACMP Name" DataField="CompanyName" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg. NO" DataField="RegistrationNO" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg.Date" DataField="ROC_RegistrationDate" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="Branches" DataField="Branch_Count" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="EmailID" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Location" DataField="Location" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Area" DataField="SubUrban_Area" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="Office Phone" DataField="OfficePhoneNO" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="CPN" DataField="FirstName" HeaderStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                        <div style="margin-left: 42%; margin-top: 36px;">
                            <asp:Button ID="btnActivate" CssClass="btn btn-success" runat="server" Text="Activate"
                                OnClick="btnActivate_Click" />&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel"
                                OnClick="btnCancel_Click" />
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="pnlCancelUsers" runat="server" Visible="false">
                        <div id="Div1">
                            <asp:Label ID="lblHCancelStudents" runat="server" Style="font-weight: bold; font-size: 18px;"
                                Text="Canceled Companys"></asp:Label>
                        </div>
                        <asp:GridView ID="gvCancel" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                            Style="width: 100%" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                            AllowPaging="true" PageSize="8" OnPageIndexChanging="gvCancel_PageIndexChanging">
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
                                <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="ACMP Name" DataField="CompanyName" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg. NO" DataField="RegistrationNO" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg.Date" DataField="ROC_RegistrationDate" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="No.of.Branchs" DataField="Branch_Count" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right" />
                                <asp:BoundField HeaderText="EmailID" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Office Phone" DataField="OfficePhoneNO" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="CPN" DataField="FirstName" HeaderStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                        <div style="margin-left: 40%; margin-top: 36px;">
                            <asp:Button ID="btnCancelActivate" CssClass="btn btn-success" runat="server" Text="Re-Register"
                                OnClick="btnCancelActivate_Click" />
                        </div>
                        <br />
                        <br />
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="pnlActiveUsers" runat="server" Visible="false">
                        <asp:Label ID="lblActivatedusers" Text="Activated Users" runat="server" Visible="false"
                            Style="font-weight: bold; font-size: 18px;"></asp:Label>
                        <asp:GridView ID="GridView1" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                            PageSize="8">
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
                                <asp:BoundField HeaderText="ID" DataField="BranchID" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="ACMP Name" DataField="CompanyName" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="BranchName" DataField="BranchName" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Location" DataField="BranchLocation" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Area" DataField="BranchArea" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Office" DataField="BranchOffice" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg Date" DataField="RegistrationDate" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="NodataPanel" runat="server" Visible="false">
                        <div id="headingConfirmed">
                            <asp:Label ID="lblNoDataH" runat="server" Visible="false" Style="font-weight: bold;
                                font-size: 18px;"></asp:Label>
                        </div>
                        <asp:GridView ID="GvNodata" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="true"
                            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                            Style="width: 100%" PageSize="8">
                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="pnlAssignDDL" runat="server" Visible="false">
                        <div id="btnActivateGV" runat="server" style="margin: auto; margin-top: 36px;">
                            <table style="width: 40%; margin: auto; margin-top: 20px;">
                                <tr style="width: 100%">
                                    <td class="style">
                                        <asp:Label ID="lblProgram" runat="server" Text="Select Program"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlActivePrograms" runat="server" AutoPostBack="true" class="textusername"
                                            Width="200" OnSelectedIndexChanged="ddlActivePrograms_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style">
                                        <asp:Label ID="lblSelectCategory" runat="server" Text="Select Category"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlActiveCategories" runat="server" AutoPostBack="true" Width="200"
                                            class="textusername" OnSelectedIndexChanged="ddlActiveCategories_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style">
                                        <asp:Label ID="lblBranch" runat="server" Text="Select Branch"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlActiveBranch" AutoPostBack="true" runat="server" Width="200" 
                                            class="textusername" 
                                            onselectedindexchanged="ddlActiveBranch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style">
                                        <asp:Label ID="Label1" runat="server" Text="Select "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlGroupAssign" AutoPostBack="true" runat="server" Width="200" 
                                            class="textusername" onselectedindexchanged="ddlGroupAssign_SelectedIndexChanged" >
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                             </div>
                                </asp:Panel>
                                <asp:Panel ID="pnlGVAssign" runat="server" Visible="false">
                             <div id="Div3">
                           <b> <asp:Label ID="lblAssignH" runat="server" ></asp:Label>  </b>
                        </div>
                        <asp:GridView ID="GVAssign" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                            PageSize="8">
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
                                 <asp:BoundField HeaderText="ID" DataField="BranchID" HeaderStyle-HorizontalAlign="Center" />
                                  <asp:BoundField HeaderText="CompanyID" DataField="CompanyID" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="BranchName" DataField="BranchName" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Location" DataField="BranchLocation" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg.Date" DataField="RegistrationDate" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="GroupID" DataField="GroupID" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" />
                            </Columns>
                        </asp:GridView>
                            <div style="margin-left: 42%; margin-top: 36px;">
                                <asp:Button ID="btnAssign" CssClass="btn btn-success" runat="server" Text="Assign"
                                    OnClientClick="return GetCount()" OnClick="btnAssign_Click" />&nbsp;&nbsp;
                                <asp:Button ID="btnDeActivateCmpny" CssClass="btn btn-danger" runat="server" Text="De-Activate ACMP"
                                    OnClick="btnDeActivateCmpny_Click" />
                            </div>
                              </asp:Panel>
                       
            </td>
        </tr>
    </table>
</asp:Content>
