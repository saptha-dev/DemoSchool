<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="ACMP-CMP-PROFILE.aspx.cs" Inherits="PresentationLayer.ACMP.ACMP_CMP_PROFILE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validate(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            var phn = document.getElementById('txtAddBrSessions');
            //comparing pressed keycodes
            if (!(keycode == 8 || keycode == 46) && (keycode < 48 || keycode > 57)) {
                return false;
            }
        }
    </script>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .Grid th
        {
        }
        /* CSS to change the GridLines color */
        .Grid, .Grid th, .Grid td
        {
            border: 1px solid #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            ACMP CMP-PROFILE
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-3  " align="center">
                                <img src="~/Images/Mohan_Mic.jpg" alt="" class="img-rounded img-responsive" width="200px"
                                    height="250px;" /></div>
                            <!--<div class="col-xs-10 col-sm-10 hidden-xs hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                            <div class=" col-xs-9">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-th-list">
                                                        </span>ASSOCIATE-COMPANY INFORMATION </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                        </div>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
                                                                <td width="29%">
                                                                    <label for="email19">
                                                                        ACMP-ID</label>
                                                                </td>
                                                                <td width="25%">
                                                                    <asp:TextBox ID="txtACMPID" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="29%">
                                                                    <label for="pwd14">
                                                                        ACMP-NAME</label>
                                                                </td>
                                                                <td width="25%">
                                                                    <asp:TextBox ID="txtACMPName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email18">
                                                                        ROC-REG-NO</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPROCRegNo" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd13">
                                                                        ROC-REG DATE</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPROCRegDate" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email15">
                                                                        ACMP-PHONE</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPPHONE" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd10">
                                                                        ACMP-MOBILE</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPMOBILE" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email10">
                                                                        ACMP-EMAIL</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPEmail" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd9">
                                                                        ACMP-OTHR-EMAIL</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPOtherEmail" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email9">
                                                                        ACMP-REG-DATE</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPRegDate" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        ACMP-STATUS</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPStatus" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email8">
                                                                        ACMP-STATUS-DATE</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtACMPStatusDate" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
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
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th-list">
                                                        </span>ASSOCIATE-COMPANY ADDRESS</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            FLATNO/UNIT-NO/SUITNO
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <asp:TextBox ID="txtACMPFlatNo" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            HNO/DNO/PLOT.NO</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <asp:TextBox ID="txtACMPHNo" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email18">
                                                                            BUILDING/LAND-MARK</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPLandMark" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd13">
                                                                            STREET-NO</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPStreetNo" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            STREET-NAME</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPStreetName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd10">
                                                                            VILLAGE/SUBURB/AREA</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPVillage" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            MANDAL/TALUK/SUBURB</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPMandal" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            DISTRICT</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPDistrict" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email9">
                                                                            STATE</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPState" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd8">
                                                                            COUNTRY</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCountry" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email8">
                                                                            POST/PIN CODE</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPPincode" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
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
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-th-list">
                                                        </span>ASSOCIATE-COMPANY BRANCHES INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseThree" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseAdd"><span class="glyphicon glyphicon-th-list">
                                                                        </span>ADD BRANCHES</a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapseAdd" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <div class="table-responsive">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                                <tr>
                                                                                    <td width="29%">
                                                                                        <label for="email19">
                                                                                            Rem-Branches</label>
                                                                                    </td>
                                                                                    <td width="25%">
                                                                                        <asp:TextBox ID="txtAddRemBranches" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td width="29%">
                                                                                        <asp:Button ID="btnAddBranchCount" runat="server" Text="Add Branch" class="btn btn-primary"
                                                                                            OnClick="btnAddBranchCount_Click" />
                                                                                    </td>
                                                                                    <td width="25%">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:Panel ID="pnlAddBranch" runat="server" Visible="false">
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                                    <tr>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                BRANCH-NAME</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBranchName" class="form-control" runat="server"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter Name" ForeColor="Red" ControlToValidate="txtAddBranchName"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                BRANCH-LOC</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBranchLoc" class="form-control" runat="server"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter Loc" ForeColor="Red" ControlToValidate="txtAddBranchLoc"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                BRANCH-AREA</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBranchArea" class="form-control" runat="server"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter Area" ForeColor="Red" ControlToValidate="txtAddBranchArea"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                BRANCH-OFFICE</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBranchOffice" class="form-control" runat="server"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter Office" ForeColor="Red" ControlToValidate="txtAddBranchOffice"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                BRANCH-STATUS</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBranchStatus" class="form-control" runat="server"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter Status" ForeColor="Red" ControlToValidate="txtAddBranchStatus"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td width="29%">
                                                                                            <label for="email19">
                                                                                                Sessions</label>
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                            <asp:TextBox ID="txtAddBrSessions" class="form-control" runat="server" MaxLength="2"
                                                                                                onkeypress="return validate(event)"></asp:TextBox>
                                                                                            <asp:RequiredFieldValidator ID="rfvAddBrSessions" runat="server" ValidationGroup="Required"
                                                                                                ErrorMessage="*Enter No of Sessions" ForeColor="Red" ControlToValidate="txtAddBrSessions"
                                                                                                Display="Dynamic" Font-Size="11px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="29%">
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td width="29%">
                                                                                            <asp:Button ID="btnAddBranchSubmit" runat="server" Text="Submit" ValidationGroup="Required"
                                                                                                class="btn btn-primary" OnClick="btnAddBranchSubmit_Click" />
                                                                                        </td>
                                                                                        <td width="25%">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </asp:Panel>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td>
                                                                        <h4>
                                                                            TOTAL BRANCHES
                                                                        </h4>
                                                                    </td>
                                                                    <td width="18%">
                                                                        <asp:TextBox ID="txtTotalBranches" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td width="15%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="15%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="18%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="15%">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="6">
                                                                        <asp:GridView ID="GvNodata" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                                            HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8">
                                                                            <Columns>
                                                                                <asp:BoundField HeaderText="ID" DataField="BranchID" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:BoundField HeaderText="BranchName" DataField="BranchName" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:BoundField HeaderText="Location" DataField="BranchLocation" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:BoundField HeaderText="Area" DataField="BranchArea" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:BoundField HeaderText="Office" DataField="BranchOffice" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:BoundField HeaderText="Status" DataField="BranchStatus" HeaderStyle-HorizontalAlign="Center"
                                                                                    ItemStyle-BorderColor="Black" />
                                                                                <asp:TemplateField>
                                                                                    <HeaderTemplate>
                                                                                        <asp:Label ID="lbl1" runat="server" Text="View Record"></asp:Label>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:ImageButton ID="gvViewRecord" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                                                            runat="server" autopostback="true" OnClick="gvViewRecord_Click" />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsefour"><span class="glyphicon glyphicon-th-list">
                                                        </span>ACMP- CONTACT PERSON INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsefour" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            NAME
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <asp:TextBox ID="txtACMPCPIName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            DESIGNATION</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <asp:TextBox ID="txtACMPCPIDesg" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email18">
                                                                            FATHER NAME</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIFName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd13">
                                                                            MOTHER MAIDEN NAME</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIMName" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            DOB</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIDOB" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd10">
                                                                            PLACE OF BIRTH</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIPOB" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            PHONE</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIPhone" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            MOBILE</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIMobile" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email9">
                                                                            EMAIL-ID</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIEmail" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd8">
                                                                            OTHER-EMAIL</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtACMPCPIOtherEmail" ReadOnly="true" class="form-control" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsesix"><span class="glyphicon glyphicon-th-list">
                                                        </span>ACMP-CHANGE PASSWORD</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsesix" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            LOGIN-ID
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <asp:TextBox ID="txtLoginID" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            &nbsp;</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            ACCESS CODE
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtAccesscode" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
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
                                                                        <label for="email18">
                                                                            PASSWORD</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control"></asp:TextBox>
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
                                                                        <label for="email18">
                                                                            ENTER NEW-PASSWORD</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtNewPassword" runat="server" class="form-control"></asp:TextBox>
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
                                                                        <label for="email18">
                                                                            CONFIRM-PASSWORD</label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="txtConfirmPassword" runat="server" class="form-control"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <asp:CompareValidator runat="server" ID="cvpwd" ControlToValidate="txtConfirmPassword"
                                                                            ControlToCompare="txtNewPassword" Operator="Equal" ErrorMessage="Confirm password didnt match " />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#Div1"><span class="glyphicon glyphicon-th-list">
                                                        </span>ASSESMENT AUTHORIZATION</a>
                                                    </h4>
                                                </div>
                                                <%--heading--%>
                                                <div id="Div1" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr style="padding-bottom:8px;">
                                                                    <td align="right" width="20%">
                                                                        <label for="email18">
                                                                            SELECT-BRANCH</label>
                                                                    </td>
                                                                    <td align="left" width="24%" style="padding-left: 8px;">
                                                                        <asp:DropDownList runat="server" ID="ddlselBr" AutoPostBack="true" class="form-control"
                                                                            OnSelectedIndexChanged="ddlselBr_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td align="right" width="25%">
                                                                        <label for="email18">
                                                                            TOTAL-SESSIONS</label>
                                                                    </td>
                                                                    <td align="left" style="padding-left: 8px;">
                                                                        <asp:TextBox runat="server" ID="txttotSess" class="form-control" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="40%">
                                                                        <h4>
                                                                            Enter Systems MacAddress
                                                                        </h4>
                                                                    </td>
                                                                    <td width="18%" align="left">
                                                                        <asp:TextBox ID="txtNoOfExams" class="form-control" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                                                            ControlToValidate="txtNoOfExams" ValidationGroup="mac" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <td width="15%">
                                                                        <asp:ImageButton runat="server" ID="imgbtnGo" ValidationGroup="mac" Height="70%" Width="50%" ImageUrl="~/Images/GO.png"
                                                                            OnClick="imgbtnGo_Click" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4">
                                                                        <asp:GridView ID="gvMACaddress" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                                            HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8"
                                                                            AllowSorting="true">
                                                                            <%--  <EmptyDataTemplate >
                                                                           <asp:TextBox runat="server" ID="txtgdMacaddr"></asp:TextBox>
                                                                          </EmptyDataTemplate> --%>
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="Mac Address">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label runat="server" ID="lblgdMacaddr" Text='<%#Eval("Mac_addres") %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </asp:GridView>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4">
                                                                        <asp:Button ID="btnmacaddressSubmit" Visible="false" runat="server" Text="Submit"
                                                                            class="btn btn-primary" OnClick="btnmacaddressSubmit_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td width="100%" colspan="2">
                                                        <asp:Button ID="UpdatePassword" runat="server" Text="Update" class="btn btn-primary"
                                                            OnClick="UpdatePassword_Click" />&nbsp;&nbsp;
                                                        <asp:Button ID="btnCancelUpdatepwd" runat="server" Text="Cancel" class="btn btn-primary"
                                                            OnClick="btnCancelUpdatepwd_Click" />
                                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn btn-primary" OnClick="btnEdit_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
