<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-CounsellorList.aspx.cs" Inherits="PresentationLayer.Admin.Admin_CounsellorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Gridview
        {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
            width: 85%;
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
            text-align: center;
            padding: 6px;
        }
        #heading
        {
            margin-top: 3%;
            font-size: 19px;
            font-weight: bold;
        }
        #headingConfirmed
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
            $("#<%=GridView1.ClientID%> input[id*='chkchild']:checkbox").each(function (index) {
                if ($(this).is(':checked'))
                    counter++;
            });
            if (counter == '1') {
                return true
            }
            else {
                alert('Select Only 1 User')
                return false
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
            <td style="width: 20%">
                <a href="#">ADM-OPERATIONS</a> > <a href="#">Users</a> > <a href="Admin-CounsellorList.aspx"
                    style="color: #00CCFF">Counsellor</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <table style="width: 23%; margin: auto; margin-top: 20px;">
        <tr style="width: 100%">
            <td class="style">
                <asp:Label ID="lblStatus" runat="server" Text="Select Type"></asp:Label>
            </td>
            <td align="left">
                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Registered Users" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Confirmed Users" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Cancel Users" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table style="width: 72%; margin: auto;">
        <tr>
            <td>
                <asp:Panel ID="DataPanel" runat="server" Visible="false">
                    <div style="margin-top: 10px; margin-bottom: 250px;">
                        <div id="heading">
                            Registered Counsellors
                        </div>
                        <asp:GridView ID="gvcheckbox" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                            Style="width: 100%" PageSize="8">
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
                                <asp:BoundField HeaderText="ID" DataField="SNo" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="Login Id" DataField="CounsellorId" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="D.O.B" DataField="DOB" HeaderStyle-HorizontalAlign="Center"
                                    DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="Mobile No" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="Email" DataField="EmailId" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" />
                                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField HeaderText="Reg Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center"
                                    DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="Status Date" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                    DataFormatString="{0:d}" />
                                <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center" />
                            </Columns>
                        </asp:GridView>
                        <div style="margin-left: 42%; margin-top: 36px;">
                            <asp:Button ID="btnActivate" CssClass="btn btn-success" runat="server" Text="Activate"
                                OnClick="btnActivate_Click" />&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel"
                                OnClick="btnCancel_Click" />
                        </div>
                </asp:Panel>


                <asp:Panel ID="pnlCancelUsers" runat="server" Visible="false">
                        <div id="Div1">
                            <asp:Label ID="lblHCancelStudents" runat="server" Style="font-weight: bold; font-size: 18px;" Text="Canceled Counsellor"></asp:Label>
                        </div>
                        <asp:GridView ID="gvCancel" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                            Style="width: 100%" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                            AllowPaging="true" PageSize="8" 
                            onpageindexchanging="gvCancel_PageIndexChanging" >
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
                                <asp:BoundField HeaderText="ID" DataField="SNo" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="D.O.B" DataField="DOB" HeaderStyle-HorizontalAlign="Center"
                                    DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Email" DataField="EmailId" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="Reg Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center"
                                    DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                                <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-CssClass="style" />
                            </Columns>
                        </asp:GridView>
                        <div style="margin-left: 40%; margin-top: 36px;">
                            <asp:Button ID="btnCancelActivate" CssClass="btn btn-success" runat="server" 
                                Text="Re-Register" onclick="btnCancelActivate_Click" /> 
                        </div>
                        <br />
                        <br />
                    </asp:Panel>
                <br />
                <br />
                <asp:Panel ID="pnlActiveUsers" runat="server" Visible="false">
                    <asp:Label ID="lblActivatedusers" Text="Activated Users" runat="server" Style="font-weight: bold;
                        font-size: 18px;"></asp:Label>
                    <asp:GridView ID="GridView1" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                        HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                        Width="100%" PageSize="8">
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
                            <asp:BoundField HeaderText="DetailsID" DataField="SNo" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="UserId" DataField="CounsellorId" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="EmailID" DataField="EmailId" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Mobile No" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="ActivationDate" DataField="ActivationDate" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" DataFormatString="{0:d}" />
                            <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                        </Columns> 
                    </asp:GridView>
                    <div id="btnActivateGV" runat="server" style="margin-left: 42%; margin-top: 36px;">
                        <asp:Button ID="btnADeActivate" CssClass="btn btn-warning" runat="server" Text="De-Activate"
                            OnClick="btnADeActivate_Click" />&nbsp;&nbsp;&nbsp;
                    </div>
                </asp:Panel>
                <asp:Panel ID="NodataPanel" runat="server" Visible="false" Style="margin-bottom: 350px;">
                    <div id="headingConfirmed">
                        Confirmed Counsellors
                    </div>
                    <asp:GridView ID="GvNodata" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                        HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                        Style="width: 100%" PageSize="8">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="SNo" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Login Id" DataField="CounsellorId" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Date of Birth" DataField="DOB" HeaderStyle-HorizontalAlign="Center"
                                DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Email" DataField="EmailId" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center"
                                DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                            <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-CssClass="style" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
