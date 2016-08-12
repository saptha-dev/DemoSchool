<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Admin-FacultyList.aspx.cs" Inherits="PresentationLayer.Admin.Admin_FacultyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Gridview
        {
            font-family: Verdana;
            font-size: 10pt;
            font-weight: normal;
            color: black;
            width: 87%;
            margin-left: -6%;
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
            text-align: left;
            padding: 6px;
        }
        #heading
        {
            margin-top:10px;
            font-size: 19px;
            font-weight: bold;
        }
        #headingConfirmed
        {
            margin-top: 10px;
            font-size: 19px;
            font-weight: bold;
            margin-left: 0%;
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

        .paymentButton{
        font-weight:bold; 
        font-family:"Courier New"; 
        font-size:16px; 
        color:Navy;
        margin-right:30px;
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
    <script language="javascript" type="text/javascript">
        $("#<%=btnView.ClientID %>").click(function () {
            var check = $("#<%=GridView1.ClientID %>").find('input[type=checkbox]:checked"]').length;
            alert(check);
            return false;
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 20%">
                <a href="#">ADM-OPERATIONS</a> > <a href="#">Users</a> > <a href="Admin-FacultyList.aspx"
                    style="color: #00CCFF">Faculty</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>


    <table style="width: 40%; margin: auto; margin-top: 20px; vertical-align:central"  >
        <tr style="width: 100%">
            <td  class="style" align="left"><asp:Label ID="lblProgram" runat="server" Text="Select Program"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlProgram" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged="ddlPrograms_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style" align="left"><asp:Label ID="lblSelectCategory" runat="server" Text="Select Category"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true"
                    Width="200" class="textusername" OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style" align="left"><asp:Label ID="lblCategorySchedule" runat="server" Text="Select Category Schedule"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlCategorySchedule" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" onselectedindexchanged="ddlCategorySchedule_SelectedIndexChanged" >
                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style" align="left"><asp:Label ID="lblGroup" runat="server" Text="Select Group"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlGroup" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style" align="left" ><asp:Label ID="lblYearSem" runat="server" Text="Select Year-Sem"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlYearSem" runat="server" AutoPostBack="true"
                    Width="200" class="textusername" OnSelectedIndexChanged="ddlYearSem_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style" align="left"><asp:Label ID="lblYearSemSchedule" runat="server" Text="Select Year-Sem Sched Date"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlYearSemSchedule" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" onselectedindexchanged="ddlYearSemSchedule_SelectedIndexChanged" >
                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style" align="left"><asp:Label ID="lblSubject" runat="server" Text="Select Subject-ID-Name"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged ="ddlSubjectId_SelectedIndexChanged" >
                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style" align="left"><asp:Label ID="lblSubSchdDate" runat="server" Text="Select SUB-SCHID-DATE"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlSubSchdDate" runat="server" AutoPostBack="true" class="textusername"
                    Width="200" OnSelectedIndexChanged ="ddlSubSchdIdDate_SelectedIndexChanged" >
                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="style"><asp:Label ID="lblStatus" runat="server" Text="Select Status"></asp:Label></td>
            <td align="left">
                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" class="textusername" Width="200"  OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" >
                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>


    </table>

    <br />
    <table style="width: 72%; margin: auto; margin-top: 10px;" class="table">
        
        <tr>
            <td>CTGY-ID:NAME</td><td>CTGY-SCH ID;DATES</td><td>GROUPD</td><td>YEAR-SEM</td>
            <td>YEAR-SCH ID:DATE</td><td>SUB-ID:NAME</td><td>SUB-SCH ID:DATES</td><td>Status</td>
        </tr>
        <tr>
            <td><asp:Label runat="server" ID="selectedCategoryId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedCategorySchedId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedGroupId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedYearSem" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedYearSchedId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedSubjectId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedSubSchedId" ClientIDMode="static" Text=""></asp:Label></td>
            <td><asp:Label runat="server" ID="selectedStatus" ClientIDMode="static" Text=""></asp:Label></td>
        </tr>
    </table>


    <table style="width: 72%; margin: auto; margin-top: 10px;">
        <tr>
            <td>
            <div style="margin-bottom: 200px;">
        <%--<table>
            <tr>
                    <td><asp:RadioButton ID="registerFaculty" runat="server" Text="Registered Faculty" checked="true" OnCheckedChanged="UserType_Changed" GroupName="paymentType" AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton></td>
                    <td></td>
                    <td><asp:RadioButton ID="confirmedFaculty" runat="server" Text="Confirmed Faculty" checked="false" OnCheckedChanged="UserType_Changed" GroupName="paymentType" AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton></td>
                    <td></td>
                    <td><asp:RadioButton ID="cancelFaculty" runat="server" Text="Cancel Faculty" Checked="false" OnCheckedChanged="UserType_Changed" GroupName="paymentType"  AutoPostBack="true" cssClass="paymentButton"></asp:RadioButton></td>
                    <td></td>
            </tr>
        </table>--%>

        <br />
            <div class="row">
                
                <asp:Button runat="server" Text="Search" OnClick="search_Click" CssClass="btn btn-primary" />
                <div class="col-md-4 pull-left">
                    <asp:TextBox runat="server" cssClass="form-control" ID="searchText" ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>
                <div class="clearfix"></div>
            
        <asp:Panel ID="NodataPanel" runat="server" Visible="false">
            
            <div id="headingConfirmed">
                <asp:Label runat="server" ID="lblNoDataHeading" Text="Faculty Registered List"></asp:Label>
            </div>
            
            <asp:GridView ID="GvNodata" CssClass="GridviewConfirm" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true" style="width:100%;"
                PageSize="8">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Login Id" DataField="UserId" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Date of Birth" DataField="DateOfBirth" HeaderStyle-HorizontalAlign="Center"
                        DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center"
                        DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center"
                        ItemStyle-CssClass="style" />
                </Columns>
                <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
            </asp:GridView>
        </asp:Panel>
        <br />
        
        <asp:Panel ID="DataPanel" runat="server" Visible="false">
            <div id="heading">
                <asp:Label ID="lblRegStnds" runat="server" Text=" Faculty Registered List"></asp:Label>
            </div>
            <asp:Label ID="lblRegisteredusers" Text="Faculty Registered List" runat="server" Visible="false" Style="font-weight: bold; font-size: 18px;"></asp:Label>
            
            <asp:GridView ID="gvcheckbox" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true" style="width:100%"
                PageSize="8" >
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
                    <asp:BoundField HeaderText="ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass ="style" />
                    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Login Id" DataField="UserId" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Address" DataField="AddressId" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Reg Location" DataField="Location" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Reg Date" DataField="DateOfRegistration" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="CTGY-GROUP-SEM" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />                    
                    <asp:BoundField HeaderText="SUBJECT" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="SUBJECT Status" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="SUBJECT Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REMARKS" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Date of Birth" DataField="DateOfBirth" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                </Columns>
            </asp:GridView>
            <div style="margin-left: 40%; margin-top: 36px;">
                <%-- <asp:Button ID="btnActivate" CssClass="btn btn-success" runat="server" Text="Activate"
                OnClick="btnActivate_Click" />&nbsp;&nbsp;&nbsp;--%>
                <asp:Button ID="btnActivate" CssClass="btn btn-success" runat="server" Text="Activate"
                    OnClick="btnActivate_Click" />
                <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel"
                    OnClick="btnCancel_Click" />
            </div>
           
        </asp:Panel>
        <asp:Panel ID="pnlActivatedUsers" runat="server" Visible="false">
            <asp:Label ID="lblActivatedusers" Text="Faculty Activated List" runat="server" Visible="false"
                Style="font-weight: bold; font-size: 18px;"></asp:Label>
            <asp:GridView ID="GridView1" CssClass="Gridview" runat="server" AutoGenerateColumns="False"
                HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true"
                Width="100%" PageSize="8" style="margin-left:0px;" >

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
                    <asp:BoundField HeaderText="FCLTY-ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="LOGIN-ID" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass ="style" />
                    <asp:BoundField HeaderText="LOGIN-CODE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Address" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REG-LOC" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REG-DATE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="CTGY:GRP:YEARSEM" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="SUBJ-STATUS:STS-DATE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REMARKS" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Date of Birth" DataField="DateOfBirth" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    
                </Columns>
            </asp:GridView>
            <div id="btnActivateGV" runat="server" visible="false" style="margin-left: 28%; margin-top: 36px;">
                <asp:Button ID="btnView" CssClass="btn btn-success" runat="server" Text="View Profile"
                    OnClick="btnView_Click" OnClientClick="return GetCount()" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnADeActivate" CssClass="btn btn-warning" runat="server" Text="De-Activate"
                    OnClick="btnADeActivate_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancelView" CssClass="btn btn-danger" runat="server" Text="Cancel"
                    OnClick="btnCancelView_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCancelUsers" runat="server" Visible="false">
            <div id="heading">
                <asp:Label ID="Label1" runat="server" Text=" Faculty Deactivated List"></asp:Label>
            </div>
            <asp:Label ID="Label2" Text="Registered Users" runat="server" Visible="false" Style="font-weight: bold; font-size: 18px;"></asp:Label>
            
            <asp:GridView ID="gvCancel" CssClass="GridviewConfirm" runat="server" AutoGenerateColumns="False"
                HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true" style="width:100%"
                PageSize="8" >
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
                    <asp:BoundField HeaderText="FCLTY-ID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Name" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="LOGIN-ID" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass ="style" />
                    <asp:BoundField HeaderText="LOGIN-CODE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Mobile Number" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Address" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REG-LOC" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REG-DATE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Status Date" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="CTGY:GRP:YEARSEM" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="SUBJ-STATUS:STS-DATE" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="REMARKS" DataField="Name" HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style" />
                    <asp:BoundField HeaderText="Date of Birth" DataField="DateOfBirth" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:d}" ItemStyle-CssClass="style" />
                    

                </Columns>
            </asp:GridView>
            <div style="margin-left: 40%; margin-top: 36px;">
                <%-- <asp:Button ID="btnActivate" CssClass="btn btn-success" runat="server" Text="Activate"
                OnClick="btnActivate_Click" />&nbsp;&nbsp;&nbsp;--%>
                <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Activate"
                    OnClick="btnActivate_Click" />
                <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Cancel"
                    OnClick="btnCancel_Click" />
            </div>
           
        </asp:Panel>
    </div>
    </td>
    </tr>
    </table>
</asp:Content>
