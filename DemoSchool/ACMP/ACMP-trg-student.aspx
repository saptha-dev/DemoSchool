<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="ACMP-trg-student.aspx.cs" Inherits="PresentationLayer.ACMP.ACMP_trg_student" %>

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
                                    ACMP TRAINING -STUDENTS
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
                                            <asp:DropDownList ID="ddlbranch" class="form-control" runat="server" 
                                                AutoPostBack="true" onselectedindexchanged="ddlbranch_SelectedIndexChanged" 
                                                >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%">
                                            <label for="email">
                                                Select Program</label>
                                        </td>
                                        <td width="60%">
                                            <asp:DropDownList ID="ddlProgram" class="form-control" runat="server" 
                                                AutoPostBack="true" onselectedindexchanged="ddlProgram_SelectedIndexChanged1"
                                                >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd">
                                                Select Category</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" 
                                                AutoPostBack="true" onselectedindexchanged="ddlCategory_SelectedIndexChanged"
                                              >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd3">
                                                Select Category Group</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" class="form-control" runat="server" 
                                                AutoPostBack="true" onselectedindexchanged="ddlGroup_SelectedIndexChanged1"
                                               >
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            <label for="pwd">
                                                Select Subject</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlSubject" class="form-control" runat="server" 
                                                AutoPostBack="true" onselectedindexchanged="ddlSubject_SelectedIndexChanged1"
                                               >
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
                                           
                                            <asp:Label ID="lblACMPName" runat="server" Text="" ></asp:Label>
                                        </td>
                                        <td width="5%">
                                            &nbsp;
                                        </td>
                                        <td width="15%">
                                            <label for="email6">
                                                ACMP-LOC:SUBURB</label>
                                        </td>
                                        <td width="15%">
                                            <asp:Label ID="lblACMPLoc" runat="server" Text="" ></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email14">
                                                ACMP-PERSON NAME</label>
                                        </td>
                                        <td>
                                             <asp:Label ID="lblACMPPName" runat="server" Text="" ></asp:Label>
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
                                                    <asp:Label ID="lblCategoryName" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email47">
                                                        START-DATE</label>
                                                </td>
                                                <td width="15%">
                                                     <asp:Label ID="lblCategoryStartDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email48">
                                                        END-DATE</label>
                                                </td>
                                                <td width="15%">
                                                   
                                                    <asp:Label ID="lblCategoryEndDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email49">
                                                        DURATION</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCategoryDuration" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email51">
                                                        STATUS
                                                    </label>
                                                </td>
                                                <td>
                                                    
                                                    <asp:Label ID="lblCategoryStatus" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email49">
                                                        STATUS-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                     <asp:Label ID="lblCategoryStatusDate" runat="server" Text=""></asp:Label>
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
                                                        CATEGORY-GROUP INFORMATION</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email52">
                                                        SEMISTER/YEAR</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblGroupYear" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        STARTDATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblGroupStartDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        END DATE</label>
                                                </td>
                                                <td width="15%">
                                                     <asp:Label ID="lblGroupEndDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email50">
                                                        T-SUBJECTS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblCategorySubjects" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email55">
                                                        STATUS
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblGroupStatus" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        STATUS DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblGroupStatusDate" runat="server" Text="" ></asp:Label>
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
                                                        SUBJECT-INFORMATON</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email63">
                                                        ID:NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubName" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email64">
                                                        ASSIGNED-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubAssinedDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email65">
                                                        T-STUDENTS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSubTotStudents" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email66">
                                                        T-UNITS
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTotUnits" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email67">
                                                        TRNG-TYPE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngType" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email67">
                                                        TRNG-START DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStartDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email70">
                                                        TRNG-END DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngEndDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email71">
                                                        TRNG-DURATION</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngDuration" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email72">
                                                        TRNG-START-TIME</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStartTime" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email68">
                                                        TRNG-END-TIME
                                                    </label>
                                                </td>
                                                <td>
                                                     <asp:Label ID="lblSubTrngEndTime" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email69">
                                                        TRNG-HRS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngHrs" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email69">
                                                        TRNG-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStatus" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email75">
                                                        TRNG-STATUS-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngStatusDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email76">
                                                        TRNG-FACULTY</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSubTrngFaculty" runat="server" Text="" ></asp:Label>
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
                                ACMP- TRAINING-STUDENTS</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td>
                                             <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                                                <asp:GridView ID="GvNodata" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
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
                                                               <%-- <asp:Label ID="ID" runat="server" Text="ID"></asp:Label>--%>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="ID" runat="server" Text='<%#Eval("UserID") %>' visible="false"/>
                                                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("DetailsID") %>' visible="false"/>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="Id-Name" DataField="studIdname" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Mobile" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="ASGND-Date" DataField="Assigned_Date" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd:MM:yyyy}"/>
                                                        <asp:BoundField HeaderText="Status" DataField="Clsstatus" HeaderStyle-HorizontalAlign="Center" />
                                                       <asp:BoundField HeaderText="Status-Date" DataField="ClsStatusDate" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd:MM:yyyy}"/>
                                                       <asp:BoundField HeaderText="TRG-Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="TRG-Faculty" DataField="Faculty" HeaderStyle-HorizontalAlign="Center" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="pnlViewReport" runat="server" Visible="false">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                STUDENT TRAINING INFORMATION</div>
                            <div class="panel-body">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td width="15%">
                                                    <label for="email83">
                                                        STUD-ID: NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblStudName" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email84">
                                                        STUD-STATUS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblStudStatus" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email85">
                                                        STUD-STATUS-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblStudStatusDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email86">
                                                        ACMP-ID:NAME
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStudAcmpName" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email87">
                                                        ACMP-LOC-SUBURB</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblStudAcmpLoc" runat="server" Text="" ></asp:Label>
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
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="4">
                                                    <label for="email83">
                                                        <strong>CATEGORY-ID:NAME:GROUP:SEMISTER/YEAR:SUBJECT-ID:NAME</strong></label>
                                                </td>
                                                <td colspan="4">
                                                   <asp:Label ID="lblSchStdntTitle" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email86">
                                                        T-UNITS
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSchStdntTUnits" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email87">
                                                        TYPE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSchStdntType" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email87">
                                                        CTD-UNITS</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblSchStdntCTDUnits" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email93">
                                                        TBC-UNITS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSchStdntTBCUnits" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email94">
                                                        START-DATE</label>
                                                </td>
                                                <td>
                                                     <asp:Label ID="lblSchStdntStartDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email94">
                                                        END-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSchStdntEndDate" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email97">
                                                        DURATION</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblSchStdntDuration" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email98">
                                                        FACULTY</label>
                                                </td>
                                                <td>
                                                       <asp:Label ID="lblSchStdntFaculty" runat="server" Text="" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email98">
                                                        STATUS</label>
                                                </td>
                                                <td>
                                                      <asp:Label ID="lblSchStdntStatus" runat="server" Text="" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email95">
                                                        STATUS-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                       <asp:Label ID="lblSchStdntStatusDate" runat="server" Text="" ></asp:Label>
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
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td>
                                        <asp:GridView ID="GVUnitsForStudents" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                            HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8">
                                            <Columns>
                                                <asp:TemplateField Visible="false">
                                                            <HeaderTemplate>
                                                                <asp:Label ID="ID" runat="server" Text="ID"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                              <%--  <asp:Label ID="ID" runat="server" Text='<%#Eval("UserID") %>' />--%>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                <asp:BoundField HeaderText="Unit ID-Name" DataField="unitname" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Section ID-Name" DataField="sectionname" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Topics" DataField="Topics_List" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StartDate" DataField="startdate" DataFormatString="{0:dd-MM-yyyy}" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Enddate" DataField="Enddate" DataFormatString="{0:dd-MM-yyyy}" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                <asp:BoundField HeaderText="status" DataField="status" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" DataFormatString="{0:dd-MM-yyyy}" HeaderStyle-HorizontalAlign="Center" />
                                                 <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
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
            </asp:Panel>
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
