<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="ACMP-trg-report.aspx.cs" Inherits="PresentationLayer.ACMP.ACMP_trg_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    ACMP TRAINING REPORT
                                </h3>
                            </div>
                            <div class="panel-body">
                                <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td width="40%">
                                            <label for="email">
                                                Select Branch</label>
                                        </td>
                                        <td width="60%">
                                            <asp:DropDownList ID="ddlBranch" class="form-control" AutoPostBack="true" runat="server"
                                                OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%">
                                            <label for="email">
                                                Select Program</label>
                                        </td>
                                        <td width="60%">
                                            <asp:DropDownList ID="ddlProgram" class="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd">
                                                Select Category</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd3">
                                                Select Category Group</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" class="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd">
                                                Select Subject</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject" class="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                    <tr>
                                        <td width="15%">
                                            <label for="email3">
                                                ACMPID:NAME</label>
                                        </td>
                                        <td width="15%">
                                            <asp:Label ID="lblACMPName" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td width="5%">
                                            &nbsp;
                                        </td>
                                        <td width="15%">
                                            <label for="email6">
                                                ACMP-LOC:SUBURB</label>
                                        </td>
                                        <td width="15%">
                                            <asp:Label ID="lblACMPLoc" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email14">
                                                ACMP-PERSON NAME</label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblACMPPName" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email15">
                                                ACMP-STATUS</label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblACMPStatus" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="8">
                                                    <h4>
                                                        CATEGORY-INFORMATION</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email46">
                                                        ID:NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblCtgryName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email47">
                                                        START-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblCtgryStartDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email48">
                                                        END-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblCtgryEndDate" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email49">
                                                        STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email50">
                                                        Group</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryGroup" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email51">
                                                        SEM
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryYearSem" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email49">
                                                        GRPSTRT-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryGrpStartDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email49">
                                                        GRP-END-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryGrpEndDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email49">
                                                        GRP-STATUS
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCtgryGrpStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="8">
                                                    <h4>
                                                        SUBJECT INFORMATION</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email52">
                                                        ID-NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        TRNG-TYPE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubTrngType" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        TRG-START-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubTrgStartDate" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email55">
                                                        TRG-END-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrgEndDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        TRG-DUR</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrgDuration" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        T-UNITS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTotUnits" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email8">
                                                        TRNG-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email9">
                                                        TRNG-STATUS-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubStatusDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email10">
                                                        T-STUDENTS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTotStudents" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email6">
                                                        FCLTY
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubFaculty" runat="server" Text=""></asp:Label>
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
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                <tr>
                                                    <td width="100%">
                                                        <h4>
                                                            TRAINING STUDENTS</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                <tr>
                                                    <td>
                                                        <asp:GridView ID="GvTrngStudents" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                            HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="lbl1" runat="server" Text="Select"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="gvViewRecord" ImageUrl="http://49.207.0.176/OLS/Images-Published/edit.png"
                                                                            runat="server" autopostback="true" OnClick="gvViewRecord_Click" />
                                                                    </ItemTemplate>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="ID" runat="server" Text="Sch-ID"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="ID" runat="server" Text='<%#Eval("Schedule_ID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField HeaderText="student ID-Name" DataField="studIdname" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Mobile" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="ASGND-Date" DataField="Assigned_Date" HeaderStyle-HorizontalAlign="Center"
                                                                    DataFormatString="{0:dd-MM-yyyy}" />
                                                                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Status-Date" DataField="Status_date" HeaderStyle-HorizontalAlign="Center"
                                                                    DataFormatString="{0:dd-MM-yyyy}" />
                                                                <asp:BoundField HeaderText="TRG-Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="TRG-Faculty" DataField="Faculty" HeaderStyle-HorizontalAlign="Center" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                            <tr>
                                                <td width="100%">
                                                    <h4>
                                                        STUDENT TRAINING REPORT</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblmesg" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="GVUnitsForSubjects" runat="server" AutoGenerateColumns="false"
                                                            HeaderStyle-BackColor="#3479c7" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                            Style="width: 100%" PageSize="8">
                                                            <Columns>
                                                                <asp:BoundField HeaderText="Unit ID-Name" DataField="unitname" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Section ID-Name" DataField="sectionname" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Topics" DataField="Topics_List" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StartDate" DataField="startdate" DataFormatString="{0:dd-MM-yyyy}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Enddate" DataField="Enddate" DataFormatString="{0:dd-MM-yyyy}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center"
                                                                    DataFormatString="{0:hh:mm}" />
                                                                <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center"
                                                                    DataFormatString="{0:hh:mm}" />
                                                                <asp:BoundField HeaderText="status" DataField="status" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" DataFormatString="{0:dd-MM-yyyy}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />
                                                            </Columns>
                                                        </asp:GridView>
                                                    </div>
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
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
