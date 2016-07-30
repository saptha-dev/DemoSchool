<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="Assesment-Students.aspx.cs" Inherits="PresentationLayer.ACMP.Assesment_Students" %>

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
                                    ASSESSMENT STUDENTS
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
                                        <td colspan="8">
                                            <h4>
                                                ACMP DETAILS</h4>
                                        </td>
                                    </tr>
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
                                                        CATEGORY DETAILS</h4>
                                                </td>
                                            </tr>
                                            <%-- <tr>--%>
                                            <%-- <td width="15%">
                                                    <label for="email46">
                                                        ACMP-ID-NAME</label>
                                                </td>--%>
                                            <%--  <td width="15%">
                                                    <asp:Label ID="lblACMPIDName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email47">
                                                        ACMP-LOC</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblACMPHLOC" runat="server" Text=""></asp:Label>
                                                </td>--%>
                                            <%--<td width="2%">
                                                </td>--%>
                                            <%-- <td width="18%">
                                                    <label for="email48">
                                                        ACMP-ADDRESS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblACMPAddress" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <%-- <td>
                                                    <label for="email49">
                                                        ACMP-CNTCT-PRSN</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCNTCTPerson" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email50">
                                                        PRG-NAME</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPPrgName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>--%>
                                                <%--  <td>
                                                    <label for="email51">
                                                        CTRY-GRP
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtryGroup" runat="server" Text=""></asp:Label>
                                                </td>--%>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email2">
                                                        CTGY-ID-NAME</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCTGYName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email3">
                                                        CTGY-GRP-SEM</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCGS" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email4">
                                                        CTGY-START-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyStartDate" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email5">
                                                        CTGY-END –DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyEnddate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email6">
                                                        CTGY-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email7">
                                                        CTGY-GRPSTRT-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyGrpStartDate" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email8">
                                                        CTGY-GRP-END-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyGrpEndDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email9">
                                                        CTGY-GRP-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtgyGrpStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email51">
                                                        CTRY-GRP
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPCtryGroup" runat="server" Text=""></asp:Label>
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
                                                        SUBJECT ASSESSMENT DETAILS</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email52">
                                                        SUBJECT-ID-NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubName" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        T-UNITS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubTotUnits" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        TRNG-STATUS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubTrngStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email55">
                                                        TRNG-STATUS-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStatusDate" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        ASMT-TYPE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubAsmntType" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        ASMT-TIME</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubAsmtTime" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email13">
                                                        ASMNT-T-STUDENTS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTotStudents" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email14">
                                                        ASMNT-DUR</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubAsmntDuration" runat="server" Text=""></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email15">
                                                        ASMNT-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubAsmtStatus" runat="server" Text=""></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email11">
                                                        ASMNT-STATUS-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubAsmntStatus" runat="server" Text=""></asp:Label>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    ASSESMENT STUDENTS
                                </h3>
                            </div>
                            <div class="panel-body">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td>
                                            <div class="table-responsive">
                                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                                <asp:GridView ID="GvTrngStudents" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                    HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" 
                                                    PageSize="8" >
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
                                                               <%-- <asp:Label ID="ID" runat="server" Text="ID"></asp:Label>--%>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:HiddenField ID="hdnid" runat="server" Value='<%#Eval("DetailsID") %>' />
                                                                <asp:Label ID="ID" runat="server" Text='<%#Eval("UserID") %>' Visible="false"/>
                                                                 <asp:Label ID="Label1" runat="server" Text='<%#Eval("DetailsID") %>' Visible="false"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Student Id-Name" DataField="studIdname" HeaderStyle-HorizontalAlign="Center" />
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
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="pnlViewInfo" runat="server" Visible="false">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td colspan="8">
                                                        <h4>
                                                            VIEW STUDENT ASMT INFORMATION</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <%-- <td width="15%">
                                                        <label for="email52">
                                                            STUD-ID</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblStudentID" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>--%>
                                                    <td width="18%">
                                                        <label for="email53">
                                                            STUD-NAME</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email54">
                                                            STUD-F-NAME</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblStudentFName" runat="server" Text=""></asp:Label>
                                                    </td>
                                                         <td>
                                                        <label for="email19">
                                                            STUD-ASMNT-LOC</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentAsmntLoc" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email55">
                                                            STUD-DOB</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentDOB" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email56">
                                                            STUD-LOCATION</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentLocation" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    
                                                    <td>
                                                        <label for="email56">
                                                            STUD-MOBILE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentMobile" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email13">
                                                            STD-EMAIL</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentEmail" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email14">
                                                            STUD-ASGND-DATE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentAsgndDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    
                                                    <td>
                                                        <label for="email15">
                                                            STUD-STATUS</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentStatus" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email11">
                                                            STUD-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentStatusDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email11">
                                                            STUD-TRG-STATUS
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentTrgStatus" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    
                                                    <td>
                                                        <label for="email11">
                                                            STUD-TRNG-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentTrngDtatusDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                     <td>
                                                        <label for="email16">
                                                            STUD-ASMNT-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentAsmntStatusDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email16">
                                                            STUD-ASMNT-STATUS</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblStudentAsmntStatus" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
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
                                                            REAL TEST INFORMATION</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email20">
                                                            RT-BK-ID</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblSdntBkngID" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email21">
                                                            RT-BKD-DATE</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblSdntBkngDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email22">
                                                            RT-BKD-SLOT</label>
                                                    </td>
                                                    <td width="15%">
                                                        <asp:Label ID="lblSdntBkngSlot" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email23">
                                                            RT-BKD-TIME</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSdntBkngTime" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email24">
                                                            RT-ACMP-NAME</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSdntBkngAcmpName" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email24">
                                                            RT-ACMP-LOC</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSdntBkngAcmpLoc" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email25">
                                                            RT-STATUS</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSdntBkngStatus" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email26">
                                                            RT-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblSdntBkngStatusDate" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td>
                                                    </td>
                                                   
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
