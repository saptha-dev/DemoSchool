<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-Core.aspx.cs" Inherits="PresentationLayer.Admin.Core" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" />
   
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
        $(document).ready(function () {

            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
            function EndRequestHandler(sender, args) {
                $("#<%=txtProgramRegDate.ClientID%>").datepicker({ minDate: 1, dateFormat: 'dd-mm-yy' });

                $("#<%=txtCateStartDate.ClientID%>").datepicker({ dateFormat: 'dd-mm-yy' });

                $("#<%=txtCateEndDate.ClientID%>").datepicker({
                    minDate: 1,
                    dateFormat: 'dd-mm-yy'
                });


                //            $("#cdrprogreg").click(function () {
                //                $("#<%= txtProgramRegDate.ClientID %>").datepicker('show', { dateFormat: 'dd-mm-yy' }).datepicker('show');

                //            });
                $("#<%=txtCateRegDate.ClientID%>").datepicker({ minDate: 1, dateFormat: 'dd-MM-yy' });

                $("#Img3").click(function () {

                    $("#<%=txtunitRegDate.ClientID%>").datepicker({ minDate: 1, dateFormat: 'dd-mm-yy' });
                });

                $("#Imga").click(function () {
                    //                alert("jlkjjk");
                    $("#<%= txtSubRegDate.ClientID %>").datepicker({ minDate: 1, dateFormat: 'dd-mm-yy' }).datepicker('show');

                });

                $("#Imgb").click(function () {
                    $("#<%= txtsubjectStartdate.ClientID %>").datepicker({ minDate: 1, dateFormat: 'dd-mm-yy' }).datepicker('show');

                });
                $("#Imgc").click(function () {
                    $("#<%= txtsubjectEnddate.ClientID %>").datepicker({dateFormat: 'dd-mm-yy' }).datepicker('show');

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
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="TabName" runat="server" />
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 20%">
                <a href="#">ADM-OPERATIONS</a> > <a href="#">Core</a> > <a href="Admin-Core.aspx"
                    style="color: #00CCFF">ADD-Core</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
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
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="padding-top: 20px">
                            <div role="tabpanel" class="tab-pane active" id="personal">
                                <asp:ScriptManager ID="scrpt" runat="server">
                                </asp:ScriptManager>
                                <asp:UpdatePanel ID="upl" runat="server">
                                    <ContentTemplate>
                                        <table id="programstable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lblprg" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Programe Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Programe Name" ForeColor="Red" ControlToValidate="txtProgramName"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Reg Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramRegDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="cdrprogreg" />
                                                    <%-- <asp:ImageButton ID="imgdate" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CEDate" PopupButtonID="imgdate" TargetControlID="txtProgramRegDate"  PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Reg.code" ForeColor="Red" ControlToValidate="txtProgramRegDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Tot-Categories <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramCategories" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter No.of Categories" ForeColor="Red" ControlToValidate="txtProgramCategories"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtProgramStatus" runat="server" class="textusername" Text="New"
                                                        ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtStatusDate" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* select a Date" ForeColor="Red" ControlToValidate="txtStatusDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -56px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Remarks <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtRemarks" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RequiredProgram"
                                                        ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtRemarks"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -83px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:Button ID="btnAddPrograms" runat="server" Text="Add Program" CssClass="btn btn-primary"
                                                        OnClick="btnAddPrograms_Click" ValidationGroup="RequiredProgram" />&nbsp;&nbsp;&nbsp;
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
                                        <asp:GridView ID="gvPrograms" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            HeaderStyle-HorizontalAlign="Center" Style="width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Program Id" DataField="Program_id" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Name" DataField="Program_name" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Reg Date" DataField="Program_Red_Date" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Total categories" DataField="Program_T_Ctgys" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status" DataField="Program_Status" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status Date" DataField="Program_Date" HeaderStyle-HorizontalAlign="Center"
                                                    DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Categories">
                                <asp:UpdatePanel ID="pnls" runat="server">
                                    <ContentTemplate>
                                        <table id="Categoriestable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lblcat" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Programs <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlPrograms" runat="server" AutoPostBack="true" class="textusername">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="rvfddlPrograms" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Program" ForeColor="Red" ControlToValidate="ddlPrograms"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -30px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Category Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCAteName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Category Name" ForeColor="Red" ControlToValidate="txtCAteName"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Reg Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCateRegDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="cdrcatReg" />
                                                    <%--  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender1" PopupButtonID="ImageButton1" TargetControlID="txtCateRegDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Date" ForeColor="Red" ControlToValidate="txtCateRegDate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Tot-Groups <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TxtCateGroups" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Category Group" ForeColor="Red" ControlToValidate="TxtCateGroups"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Eligibility <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtEligiblty" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Eligiblty" ForeColor="Red" ControlToValidate="txtEligiblty"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Start Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCateStartDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Img1" />
                                                    <%-- <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender2" PopupButtonID="ImageButton2" TargetControlID="txtCateStartDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select Start Date" ForeColor="Red" ControlToValidate="txtCateStartDate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    End Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCateEndDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Img2" />
                                                    <%-- <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender3" PopupButtonID="ImageButton3" TargetControlID="txtCateEndDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Select End Date" ForeColor="Red" ControlToValidate="txtCateEndDate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCategoryStatus" runat="server" class="textusername" Text="New"
                                                        ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCateStatusDate" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Enter Category Status Date" ForeColor="Red" ControlToValidate="txtCateStatusDate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Remarks <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtcateRemarks" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="VGPrograms"
                                                        ErrorMessage="Enter Remarks Date" ForeColor="Red" ControlToValidate="txtcateRemarks"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-primary"
                                                        OnClick="btnAddCategory_Click" ValidationGroup="VGPrograms" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btncancelcate" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btncancelcate_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:GridView ID="gvCategories" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Id" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="    Name    " DataField="Category_Name" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Reg Date" DataField="Category_Reg_Date" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Total Groups" DataField="Category_T_Group" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Eligibility" DataField="Category_T_Eligible" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status" DataField="Category_Status" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status Date" DataField="Category_Status_Date" HeaderStyle-HorizontalAlign="Center"
                                                    DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Remarks" DataField="Category_Remarks" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Group">
                                <asp:UpdatePanel ID="updnl" runat="server">
                                    <ContentTemplate>
                                        <table id="Groupstable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lblgrp" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
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
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Category <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlGroupCategories" runat="server" AutoPostBack="true" class="textusername">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ValidationGroup="VGGroupCategories"
                                                        ErrorMessage="Select Category" ForeColor="Red" ControlToValidate="ddlGroupCategories"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Group Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtGroupName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ValidationGroup="VGGroupCategories"
                                                        ErrorMessage="Enter Group" ForeColor="Red" ControlToValidate="txtGroupName" Display="Dynamic"
                                                        Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Tot-Years/Sem <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtGroupYearsCount" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ValidationGroup="VGGroupCategories"
                                                        ErrorMessage="Enter No. of Years" ForeColor="Red" ControlToValidate="txtGroupYearsCount"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddGroup" runat="server" Text="Add Group" CssClass="btn btn-primary"
                                                        OnClick="btnAddGroup_Click" ValidationGroup="VGGroupCategories" />&nbsp;&nbsp;&nbsp;
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
                                <asp:UpdatePanel ID="unl" runat="server">
                                    <ContentTemplate>
                                        <table id="Yearstable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="left">
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
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
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
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Group <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlYearGroup" runat="server" AutoPostBack="true" class="textusername">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ValidationGroup="VGYearProgram"
                                                        ErrorMessage="Select Group " ForeColor="Red" ControlToValidate="ddlYearGroup"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Year-Sem <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtYearSem" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ValidationGroup="VGYearProgram"
                                                        ErrorMessage="Enter Semester " ForeColor="Red" ControlToValidate="txtYearSem"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Tot-Subjects(Year/Sem)<font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtYearSubjects" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ValidationGroup="VGYearProgram"
                                                        ErrorMessage="Enter No. of Subjects" ForeColor="Red" ControlToValidate="txtYearSubjects"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddYear" runat="server" Text="Add Year" CssClass="btn btn-primary"
                                                        OnClick="btnAddYear_Click" ValidationGroup="VGYearProgram" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnYearCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btnYearCancel_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:GridView ID="gvYears" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="margin-left: 16%; width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Id" DataField="Year_Id" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Year Name" DataField="Branch_Year_No" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Total Subjects" DataField="Year_T_Subjects" HeaderStyle-HorizontalAlign="Center"
                                                    ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Subjects">
                                <asp:UpdatePanel ID="pnl" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table id="SubjectsTable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="center" colspan="3">
                                                    <asp:Label ID="lbls" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Programs <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubjectPrograms" runat="server" AutoPostBack="true" class="textusername" EnableViewState="true"
                                                        OnSelectedIndexChanged="ddlSubjectPrograms_SelectedIndexChanged">
                                                        <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="Others" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Select Program" ForeColor="Red" ControlToValidate="ddlSubjectPrograms"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Category <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubjectCategories" runat="server" AutoPostBack="true" class="textusername" EnableViewState="true"
                                                        OnSelectedIndexChanged="ddlSubjectCategories_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Select Category" ForeColor="Red" ControlToValidate="ddlSubjectCategories"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Group <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubjectGroup" runat="server" AutoPostBack="true" class="textusername" EnableViewState="true"
                                                        OnSelectedIndexChanged="ddlSubjectGroup_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Select Group" ForeColor="Red" ControlToValidate="ddlSubjectGroup"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Year-Sem <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubjectYear" runat="server" AutoPostBack="true" class="textusername" EnableViewState="true">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Select Year" ForeColor="Red" ControlToValidate="ddlSubjectYear"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" InitialValue="0"
                                                        SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Subject Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubjectName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter Subject Name" ForeColor="Red" ControlToValidate="txtsubjectName"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Reg Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubRegDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Imga" />
                                                    <%--  <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender4" PopupButtonID="ImageButton4" TargetControlID="txtSubRegDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>
                                        </td>--%>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ValidationGroup="VGSubjects"
                                                            ErrorMessage="Enter Reg. Date" ForeColor="Red" ControlToValidate="txtSubRegDate"
                                                            Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Duration <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubjectDuration" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter Duration" ForeColor="Red" ControlToValidate="txtSubjectDuration"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Tot-Units <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubUnits" runat="server" onkeypress="return validate(event)"
                                                        class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter No. Of units" ForeColor="Red" ControlToValidate="txtsubUnits"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Start Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubjectStartdate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Imgb" />
                                                    <%-- <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender5" PopupButtonID="ImageButton5" TargetControlID="txtsubjectStartdate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter Start Date" ForeColor="Red" ControlToValidate="txtsubjectStartdate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    End Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubjectEnddate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Imgc" />
                                                    <%--  <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender6" PopupButtonID="ImageButton6" TargetControlID="txtsubjectEnddate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter End Date" ForeColor="Red" ControlToValidate="txtsubjectEnddate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtSubjectStatus" runat="server" class="textusername" Text="New"
                                                        ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter Subject status date" ForeColor="Red" ControlToValidate="txtSubStatusDate"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
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
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="VGSubjects"
                                                        ErrorMessage="Enter Remarks" ForeColor="Red" ControlToValidate="txtSubRemarks"
                                                        Display="Dynamic" Font-Size="11px" Style="margin-left: -50px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddSubjects" runat="server" Text="Add Subject" CssClass="btn btn-primary"
                                                        ValidationGroup="VGSubjects" OnClick="btnAddSubjects_Click" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancelSubject" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btnCancelSubject_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:GridView ID="gvSubjects" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                            HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true"
                                            Style="width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Subject Id" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Name" DataField="Subject_Name" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Reg Date" DataField="Subject_RegDate" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Total Units" DataField="Subject_T_Units" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status" DataField="Subject_Status" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Status Date" DataField="Subject_Status_Date" HeaderStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>

                                </asp:UpdatePanel>
                            </div>
                            <div role="tabpanel" class="tab-pane active" id="Units">
                                <asp:UpdatePanel ID="panl" runat="server">
                                    <ContentTemplate>
                                        <table id="unitsTable" style="margin-top: 19px;">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="lblProgramsForUnits" runat="server" Text="Select Program"></asp:Label><font
                                                        style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlProgramsForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlProgramsForUnits_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="Select Program name" ForeColor="Red" ControlToValidate="ddlProgramsForUnits"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="lblCategoriesForUnits" runat="server" Text="Select Category"></asp:Label><font
                                                        style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategoriesForUnits" runat="server" AutoPostBack="true" class="textusername"
                                                        OnSelectedIndexChanged="ddlCategoriesForUnits_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="Select Category name" ForeColor="Red" ControlToValidate="ddlCategoriesForUnits"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Select Group <font style="color: Red;">*</font>
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
                                                <td align="left">
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
                                                <td align="left">
                                                    <asp:Label ID="lblSubjects" runat="server" Text="Select Subjects"></asp:Label><font
                                                        style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSubject_forUnits" runat="server" AutoPostBack="true" class="textusername">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="Select unit name" ForeColor="Red" ControlToValidate="ddlSubject_forUnits"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" InitialValue="0" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Unit Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUnitName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td align="left">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Enter unit name" ForeColor="Red" ControlToValidate="txtUnitName"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Reg Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtunitRegDate" runat="server" class="textusername"></asp:TextBox>
                                                    <img src="../Images/calender.png" id="Img3" />
                                                    <%-- <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"  />
                                        <asp:CalendarExtender runat="server" ID="CalendarExtender7" PopupButtonID="ImageButton7" TargetControlID="txtunitRegDate" PopupPosition="Right" Format="dd-MM-yyyy">
                                        </asp:CalendarExtender>--%>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Enter unit number" ForeColor="Red" ControlToValidate="txtunitRegDate"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Section NO:Name <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUnitSecName" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Enter Section name" ForeColor="Red" ControlToValidate="txtUnitSecName"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Topics List <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTopicList" runat="server" class="textusername" TextMode="MultiLine"
                                                        Style="height: 94px; width: 257px;"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Enter Topics list" ForeColor="Red" ControlToValidate="txtTopicList"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: 10px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUnitsStatus" runat="server" class="textusername" Text="New" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Status Date <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUntStatusDat" runat="server" class="textusername" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Select a Date" ForeColor="Red" ControlToValidate="txtUntStatusDat"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Remarks <font style="color: Red;">*</font>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUnitRemarks" runat="server" class="textusername"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ValidationGroup="UnitsRequired"
                                                        ErrorMessage="* Enter Remarks" ForeColor="Red" ControlToValidate="txtUnitRemarks"
                                                        Display="Dynamic" Font-Size="11px" SetFocusOnError="True" Style="margin-left: -50px;"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:Button ID="btnAddUnit" runat="server" Text="Add Unit" CssClass="btn btn-primary"
                                                        OnClick="btnAddUnit_Click" ValidationGroup="UnitsRequired" />&nbsp;&nbsp;&nbsp;
                                                    <asp:Button ID="btnCancelUnit" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                        OnClick="btnCancelUnit_Click" />
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
                                            Style="width: 63%;" PageSize="15">
                                            <Columns>
                                                <asp:BoundField HeaderText="Subject Id" DataField="Subject_Id" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Name" DataField="Unit_Name" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Reg Date" DataField="Unit_Reg_Date" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Topics List" DataField="Topics_List" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Status" DataField="Unit_Status" HeaderStyle-HorizontalAlign="Left" />
                                                <asp:BoundField HeaderText="Status Date" DataField="Unite_Status_Date" HeaderStyle-HorizontalAlign="Left" />
                                            </Columns>
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
             
                </div>
            </td>
        </tr>
    </table>
    <br />
    <%-- </ContentTemplate>
     </asp:UpdatePanel>--%>
</asp:Content>
