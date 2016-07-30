<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-PublishAssessment.aspx.cs" Inherits="PresentationLayer.Admin.Admin_PublishAssessment" %>

<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-2.1.4.js" type="text/javascript"></script>
    <%--<script type="text/javascript">

        function toggleChevron(e) {
            $(e.target)
        .prev('.panel-heading')
        }


        $(document).ready(function () {

            var value = $('#<%=ddlItem.ClientID %> option:selected').val();
            var set = $('#<%=ddlTestId.ClientID %> option:selected').val()


            if (value == '1' && set != undefined) {
                $('#collapseOne').addClass('panel-collapse collapse in');
                $('#collapseTwo').addClass('panel-collapse collapse');
            }
            else if (value == '2' && set != undefined) {
                $('#collapseTwo').addClass('panel-collapse collapse in');
                $('#collapseOne').addClass('panel-collapse collapse');
            }
            $('#btnPublishSet').click(function () {
                $('#collapseOne').addClass('panel-collapse collapse in');
            });
            $('#BtnPublishQstn').click(function () {
                $('#collapseTwo').addClass('panel-collapse collapse in');
            });
        });


    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            var totalSession = document.getElementById('<%=txtbkngRemaining.ClientID %>').value;
            var countClicks = 0;
            $("#btnClickIncrement").click(function () {
                countClicks++;
                document.getElementById('<%=hdnDecre.ClientID %>').value = countClicks;
                if (countClicks <= totalSession) {
                    $("#<%=demo.ClientID%>").val(countClicks);
                }
                else {
                    alert("Maximum Sessions Should be " + totalSession);
                }
            });
            $("#btnClickDecrement").click(function () {
                countClicks = document.getElementById('<%=hdnDecre.ClientID %>').value;
                countClicks--;
                document.getElementById('<%=hdnDecre.ClientID %>').value = countClicks;
                if (countClicks > 0) {
                    $("#<%=demo.ClientID%>").val(countClicks);
                }
                else {
                    alert("Minimum Asign Sessions Should be 1");
                }
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
        function checkAll(objRef) {  //Multi Check CheckBox at a time
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
                    //   row.style.backgroundColor = "white";2165
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
        #btnClickIncrement:hover
        {
            cursor: pointer;
        }
        #btnClickDecrement:hover
        {
            cursor: pointer;
        }
        #demo
        {
            border: 0px;
            outline: 0;
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
            margin-top: 3%;
            font-size: 20px;
            background-image: -webkit-gradient( linear, left top, left bottom, color-stop(0.11, rgb(16, 21, 26)), color-stop(0.55, rgb(74, 99, 137)), color-stop(0.87, rgb(58, 80, 95)) );
            color: rgb(229, 236, 134);
            width: 68%;
        }
        #divbody
        {
            border-style: groove;
            width: 86%;
            margin-left: 8%;
            border-radius: 19px;
            border-color: cadetblue;
            height: auto;
        }
        .dropdownlist
        {
            width: 200px;
            height: 5.5em;
            border-radius: 2px;
            top: 0px;
            left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="hdnDecre" runat="server" />
    <div style="margin-bottom: 50px;">
        <center>
            <div id="heading">
                Assessment DashBoard
            </div>
        </center>
        <div id="divbody">
            <table style="width: 100%; margin-top: 3%; margin-bottom: 20px;">
                <tr>
                    <td align="center">
                        <asp:RadioButtonList ID="rdbList" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                            Style="width: 39%; margin-left: 178px;" OnSelectedIndexChanged="rdbList_SelectedIndexChanged">
                            <asp:ListItem Text="Publish" Selected="True" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Un-Publish" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <table id="tblItem" style="width: 29%; margin: auto;">
                <tr style="width: 100%">
                    <td class="tblItem">
                        <b>Select Item </b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlItem" runat="server" class="textusername" AutoPostBack="true"
                            Style="width: 100%;" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged">
                            <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Sample Test" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Real Test" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Results" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Grades" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Booking-Slot" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="tblItem">
                        <b>
                            <asp:Label ID="lblprogram" Text="Select Program" runat="server"></asp:Label></b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPrograms" runat="server" class="textusername" AutoPostBack="true"
                            Style="width: 100%;" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged"
                            ValidationGroup="Required">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="validate"
                            ControlToValidate="ddlPrograms" ErrorMessage="* Select an Option" ForeColor="Red"
                            ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                            CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tblItem">
                        <b>
                            <asp:Label ID="lblCategory" Text="Select Category" runat="server"></asp:Label></b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" class="textusername" Style="width: 100%;"
                            ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validate"
                            ControlToValidate="ddlCategory" ErrorMessage="* Select an Option" ForeColor="Red"
                            ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                            CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tblItem">
                        <b>
                            <asp:Label ID="lblgroup" Text="Select Group" runat="server"></asp:Label></b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlgroup" runat="server" class="textusername" Style="width: 100%;"
                            ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ClientValidationFunction="validate"
                            ControlToValidate="ddlgroup" ErrorMessage="* Select an Option" ForeColor="Red"
                            ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                            CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td class="tblItem">
                        <b>
                            <asp:Label ID="lblsemYear" Text="Select Semister" runat="server"></asp:Label></b>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSemister" runat="server" class="textusername" AutoPostBack="true"
                            ValidationGroup="Required" Style="width: 100%;" OnSelectedIndexChanged="ddlSemister_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="validate"
                            ControlToValidate="ddlSemister" ErrorMessage="* Select an Option" ForeColor="Red"
                            ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                            CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                    </td>
                </tr>
                <asp:Panel ID="pnlSubject" runat="server">
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblSubjects" Text="Select Subject" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSubjects" runat="server" class="textusername" Style="width: 100%;"
                                ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="validate"
                                ControlToValidate="ddlSubjects" ErrorMessage="* Select an Option" ForeColor="Red"
                                ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="PnlTestType" runat="server" Visible="false">
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lbltextType" Text="Select Test Type" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTesttype" runat="server" class="textusername" Style="width: 100%;"
                                ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlTesttype_SelectedIndexChanged">
                                <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Sample Test" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Final Test" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </asp:Panel>
                <asp:Panel ID="pnlBookingSlot" runat="server" Visible="false">
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblBkingDate" Text="Select Bkng-Date" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlbkngDate" runat="server" class="textusername" Style="width: 100%;"
                                ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlbkngDate_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <%-- <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validate"
                                ControlToValidate="ddlSubjects" ErrorMessage="* Select an Option" ForeColor="Red"
                                ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblbkngSlotID" Text="Select SlotID" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlbkngslotID" runat="server" class="textusername" Style="width: 100%;"
                                ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlbkngslotID_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="Label1" Text="Tot-Sessions" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:TextBox ID="txtbkngRemaining" class="textusername" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblmultiCompany" Text="Select Company" Visible="false" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownCheckBoxes ID="ddlsessions" runat="server" AddJQueryReference="false"
                                UseButtons="False" Visible="false" UseSelectAllNode="True" CssClass="dropdownlist"
                                Style="width: 192px;">
                            </asp:DropDownCheckBoxes>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblbkngcompany" Text="Select Company" Visible="false" runat="server"></asp:Label></b>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlBkngCompany" runat="server" Visible="false" class="textusername"
                                Style="width: 100%;" ValidationGroup="Required" AutoPostBack="true" OnSelectedIndexChanged="ddlBkngCompany_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="validate"
                                ControlToValidate="ddlBkngCompany" ErrorMessage="* Select an Option" ForeColor="Red"
                                ValidationGroup="Required" Display="Dynamic" Font-Size="11px" SetFocusOnError="True"
                                CssClass="Validator" Style="margin-left: -56px;"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="tblItem">
                            <b>
                                <asp:Label ID="lblbkngasighSessions" Text="Asign-Sessions" runat="server"></asp:Label></b>
                                
                        </td>
                        <td>
                            <div>
                                <table>
                                    <tr style="border: 1px solid silver;">
                                        <td>
                                            <input type="text" id="demo" readonly="true" runat="server" value="1" />
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <span class="glyphicon glyphicon-triangle-top" id="btnClickIncrement"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <span class="glyphicon glyphicon-triangle-bottom" id="btnClickDecrement"></span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                    <td>
                                     <asp:Label ID="lblbkngErrormsg" Visible="false"  ForeColor="Red" runat="server"></asp:Label>
                                    </td>
                                    </tr>
                                </table>
                            </div>
                            <%--<asp:TextBox ID="TextBox1" class="textusername" runat="server"></asp:TextBox>--%>
                        </td>
                        <td>
                        </td>
                    </tr>
                </asp:Panel>
            </table>
            <asp:Panel ID="pnlBkngGV" Visible="false" runat="server">
                <table style="margin-left: 42%; margin-top: 10px;">
                    <tr>
                        <td>
                            <asp:Button ID="btnBkngPublish" runat="server" Text="Publish" CssClass="btn btn-primary"
                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnBkngPublish_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnBkngCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnBkngCancel_Click" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="gvBookings" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                    autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                    Style="width: 72%; margin-left: 210px;" AllowPaging="true" PageSize="8">
                    <Columns>
                        <asp:BoundField HeaderText="SlotID" DataField="Slot_ID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style1" />
                        <asp:BoundField HeaderText="Name" DataField="Slot_Name" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                        <asp:BoundField HeaderText="Date" DataField="Date" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                        <asp:BoundField HeaderText="Subject" DataField="SubjectID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                        <asp:BoundField HeaderText="CompanyName" DataField="CompanyName" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                        <asp:BoundField HeaderText="Sessions" DataField="Sessions" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="sampletestPanel" runat="server" Visible="false">
                <div class="panel-group" id="accordion" style="width: 90%; margin-left: 5%; margin-top: 5%;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    Publish/Un-Publish Set To Students </a>
                                <%--<i class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>--%>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <asp:Label ID="lblDisplay" runat="server" Visible="true" Style="color: #337ab7; font-weight: bold;"></asp:Label>
                            <div class="panel-body">
                                <table style="margin: auto; width: 80%; margin-bottom: 50px; margin-top: 50px; padding: 10px;
                                    margin-left: 12%;">
                                    <tr style="width: 100%;">
                                        <td align="right">
                                            <div style="border-style: groove; border-radius: 10px; text-align: center; background-color: lightgray;
                                                margin-top: 10px;">
                                                <b>Select Role </b>
                                                <asp:DropDownList ID="ddlRoles" runat="server" class="textusername" AutoPostBack="true"
                                                    Style="margin-top: 20px;" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                                                    <asp:ListItem Text="---Select---" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Student" Value="1"></asp:ListItem>
                                                </asp:DropDownList>
                                                <div style="width: 75%; margin-top: 20px;">
                                                    <asp:Label ID="lblNorecordsStudents" runat="server" Visible="false" Style="color: red;
                                                        font-size: 17px;" Text="Sorry...!!! No Records Found."></asp:Label>
                                                    <asp:GridView ID="GVStudents" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                        autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                                                        Style="width: 72%; margin-left: 210px;" AllowPaging="true" PageSize="8">
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
                                                    <br />
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin-left: 42%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnPublishSet" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnPublishSet_Click" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnPublishSetCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnPublishSetCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    Publish/Un-Publish Set Questions </a>
                                <%--<i class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>--%>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:GridView ID="GVQuestions" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                                    Style="width: 100%;" AllowPaging="true" PageSize="8">
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
                                        <asp:BoundField HeaderText="Qstn_ID" DataField="Qstn_ID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style1" />
                                        <asp:BoundField HeaderText="Question" DataField="Question" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style1" />
                                        <asp:BoundField HeaderText="A" DataField="A" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="B" DataField="B" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="C" DataField="C" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="D" DataField="D" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="E" DataField="E" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="Answer" DataField="Answer" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                        <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" />
                                    </Columns>
                                </asp:GridView>
                                <asp:Label ID="lblNorecordsQstns" runat="server" Text="Sorry...! No Records to disply"
                                    Visible="true" Style="color: Red;"></asp:Label>
                                <br />
                                <table style="margin-left: 40%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnPublishQstn" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnPublishQstn_Click" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnQstnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnQstnCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="PnlResults" runat="server" Visible="false">
                <div class="panel-group" id="accordion1" style="width: 90%; margin-left: 5%; margin-top: 5%;">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapsethree">
                                    Publish/Un-Publish Result Publish </a>
                                <%--<i class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>--%>
                            </h4>
                        </div>
                        <div id="collapsethree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table style="margin: auto; width: 98%; margin-bottom: 29px; margin-top: 18px; padding: 10px;
                                    margin-left: 2%;">
                                    <tr>
                                        <td>
                                            <h4>
                                                <asp:Label ID="lblSubjectResut" runat="server" Text="Publish/Un-Publish Subject Result"
                                                    Visible="true"></asp:Label></h4>
                                        </td>
                                    </tr>
                                    <tr style="width: 100%;">
                                        <td>
                                            <div style="margin-top: 20px;">
                                                <asp:GridView ID="GVResults" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" Visible="false"
                                                    AllowPaging="true">
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
                                                        <asp:BoundField HeaderText="Atmp-Qstns" DataField="Std_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="UnAtmpt-Qstns" DataField="Std_Un_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" />
                                                        <asp:BoundField HeaderText="Correct-Ans" DataField="Std_Correct_Ans" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="InCorrect-Ans" DataField="Std_Wrong_Ans" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Exam StartDate" DataField="Exam_StartDate" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Exam EndDate" DataField="Exam_EndDate" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Std Result" DataField="Std_Result" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:Label ID="lblNoRecordsResult" runat="server" Text="Sorry...! No Records to disply"
                                                    Visible="true" Style="color: Red;"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin-left: 42%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnResultsPunlish" runat="server" Text="Publish Subject" CssClass="btn btn-primary"
                                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnResultsPunlish_Click" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnResultsCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="btnResultsCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin: auto; width: 98%; margin-bottom: 29px; margin-top: 18px; padding: 10px;
                                    margin-left: 2%;">
                                    <tr>
                                        <td>
                                            <h4>
                                                <asp:Label ID="lblResultHCertificate" runat="server" Text="Publish/Un-Publish Certificate"
                                                    Visible="false"></asp:Label></h4>
                                        </td>
                                    </tr>
                                    <tr style="width: 100%;">
                                        <td>
                                            <div style="margin-top: 20px;">
                                                <asp:GridView ID="gvresultCertificate" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" Visible="false"
                                                    AllowPaging="true">
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
                                                        <asp:BoundField HeaderText="Cert-ID" DataField="S_No" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Std-ID" DataField="Student_Id" ItemStyle-HorizontalAlign="Center"
                                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" />
                                                        <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Center"
                                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" />
                                                        <asp:BoundField HeaderText="Cert-RT-ID" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Status" DataField="Certificate_Status" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Publish-Status" DataField="Publish_Status" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" ItemStyle-HorizontalAlign="Center" />
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:Label ID="lblResultCertificate" runat="server" Text="Sorry...! No Records to disply"
                                                    Visible="true" Style="color: Red;"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table style="margin-left: 42%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnPublishCertificate" runat="server" Text="Publish Certificate"
                                                CssClass="btn btn-primary" Visible="false" Style="font-family: Times new Roman;
                                                font-weight: bold;" OnClick="btnPublishCertificate_Click" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="btnCancelCertificate" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Style="font-family: Times new Roman; font-weight: bold;" Visible="false" OnClick="btnCancelCertificate_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                    Students Solutions Publish/Un-Publish</a>
                                <%--<i class="indicator glyphicon glyphicon-chevron-down  pull-right"></i>--%>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                <asp:GridView ID="GVSolutions" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                                    HeaderStyle-BackColor="#53B03F" HeaderStyle-ForeColor="white" AllowPaging="true">
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
                                        <asp:BoundField HeaderText="Id" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style1" />
                                        <asp:BoundField HeaderText="Student_Id" DataField="Student_Id" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style1" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style1" />
                                        <asp:BoundField HeaderText="Subject" DataField="Subject_Name" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                        <asp:BoundField HeaderText="Exam_StartDate" DataField="Exam_StartDate" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                        <asp:BoundField HeaderText="Exam_EndDate" DataField="Exam_EndDate" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                        <asp:BoundField HeaderText="Status" DataField="Solutions_Status" HeaderStyle-HorizontalAlign="Center"
                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <table style="margin-left: 42%;">
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnSoultions" runat="server" Text="Publish" CssClass="btn btn-primary"
                                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnSoultions_Click" />
                                            &nbsp;&nbsp;
                                            <asp:Button ID="BtnSoultionsCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnSoultionsCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="GradesPanel" runat="server" Visible="false">
                <asp:GridView ID="GVGrades" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                    autopostback="true" Visible="true" HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white"
                    Style="width: 72%; margin-left: 14%;" AllowPaging="true" PageSize="8">
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
                        <asp:BoundField HeaderText="StudentID" DataField="StudentID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style1" />
                        <asp:BoundField HeaderText="Student Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" />
                        <asp:BoundField HeaderText="Percentage" DataField="Percentage" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" />
                        <asp:BoundField HeaderText="Grade" DataField="Grade" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" />
                        <asp:BoundField HeaderText="Grade_GeneratedDate" DataField="Grade_GeneratedDate"
                            HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Grade_StatusDate" DataField="Grade_StatusDate" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" DataFormatString="{0:d}" />
                        <asp:BoundField HeaderText="Status" DataField="Publish_Status" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" />
                        <asp:BoundField HeaderText="Remarks" DataField="Grade_Remarks" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-CssClass="style2" />
                    </Columns>
                </asp:GridView>
                <br />
                <table style="margin-left: 42%; margin-top: 20px;">
                    <tr>
                        <td>
                            <asp:Button ID="BtnGrades" runat="server" Text="Publish" CssClass="btn btn-primary"
                                Visible="true" Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnGrades_Click" />
                            &nbsp;&nbsp;
                            <asp:Button ID="BtnGradesCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                Style="font-family: Times new Roman; font-weight: bold;" OnClick="BtnGradesCancel_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
