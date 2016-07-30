<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="my-class.aspx.cs" Inherits="PresentationLayer.Student.my_class"
    MasterPageFile="~/Student/StudentMasterPage.Master" %>

<asp:Content ID="studentMyClassBody" runat="server" ContentPlaceHolderID="body">

    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            CLASSES DETAILS</h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                    data-toggle="tab"><span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                                    CLASS INFORMATION</a></li>
                                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>CLASS TASK</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="home">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
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
                                                <label for="pwd">
                                                    Select Year</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDlYear" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="DDlYear_SelectedIndexChanged">
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
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td width="15%">
                                                            <label for="email2">
                                                                STUDENT- ID</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtStudentID" runat="server" tabindex="1" readonly="true"
                                                                class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email4">
                                                                NAME</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtStudentName" runat="server" tabindex="1" readonly="true"
                                                                class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email5">
                                                                LOC</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtStudentLocation" runat="server" tabindex="1"
                                                                readonly="true" class="form-control" />
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input" id="txtStudentStatus" runat="server" tabindex="1"
                                                                readonly="true" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input" id="txtStudentStatusDate" runat="server" tabindex="1"
                                                                readonly="true" class="form-control" />
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
                                        <td width="15%">
                                            <label for="email2">
                                                ACMP-NAME</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input" id="txtCompanyName" runat="server" tabindex="1" readonly="true"
                                                class="form-control" />
                                        </td>
                                        <td width="2%">
                                            &nbsp;
                                        </td>
                                        <td width="18%">
                                            <label for="email4">
                                                LOCATION</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input" id="txtCompanyLocation" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
                                        </td>
                                        <td width="2%">
                                        </td>
                                        <td width="18%">
                                            <label for="email5">
                                                SUBURB</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input" id="txtCompanySubRB" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email7">
                                                PHONE</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input" id="txtCompanyPhone" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email8">
                                                EMAIL</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input" id="txtCompanyEmail" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <label for="email8">
                                                CNTCTPRSN</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input" id="txtCompanyCNTCTPRSN" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email7">
                                                STATUS:STATUS-DATE</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input" id="txtCompanyStatusDate" runat="server" tabindex="1"
                                                readonly="true" class="form-control" />
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
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email46">
                                                            CATEGORY: ID:NAME</label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input19" id="txtCategoryName" runat="server" tabindex="1"
                                                            readonly="true" class="form-control" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email47">
                                                            REGDATE</label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input23" id="txtCategoryRegDate" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email48">
                                                            GROUP SEMS/YEARS</label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input19" id="txtCategoryGROUP" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email49">
                                                            T-SUBJECTS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtCategorySubjectsCount" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email50">
                                                            SCH-STARTDATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtSCHStartTime" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email51">
                                                            SCH-ENDDATE
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtSCHEndTime" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email49">
                                                            DURATION</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtSCHDuration" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email50">
                                                            STATUS:STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtSCHStatus" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email51">
                                                            GRADE
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtGrade" runat="server" readonly="true" tabindex="1"
                                                            class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email10">
                                                            GRADE-STATUS:DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtGradeStatus" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email11">
                                                            REMARKS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input19" id="txtGradeRemarks" runat="server" readonly="true"
                                                            tabindex="1" class="form-control" />
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
                                    </tr>
                                    <tr>
                                        <td width="15%">
                                            <label for="email52">
                                                SUBJECT-ID:NAME</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input19" id="txtSubjectName" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td width="2%">
                                            &nbsp;
                                        </td>
                                        <td width="18%">
                                            <label for="email53">
                                                REG-DATE</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input19" id="txtSubjectREGDate" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td width="2%">
                                        </td>
                                        <td width="18%">
                                            <label for="email54">
                                                ASND-STATUS:DATE</label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input19" id="txtSubjectStatusDate" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email55">
                                                T-UNITS
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSubjectUnitsCount" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email56">
                                                DURATION</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHSubjectDuration" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <label for="email56">
                                                SCH-STARTDATE</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHSubjectStartDate" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email13">
                                                SCH-ENDDATE</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHSubjectEndDate" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email16">
                                                STATUS-DATE</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHSubjectStatusDate" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <label for="email16">
                                                REMARKS</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHSubjectRemarks" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
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
                                                        <h4>
                                                            SUBJECT-CLASS-INFORMATION
                                                        </h4>
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
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email2">
                                                            SBJ-ID:NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtSCNAME" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            SBJ-DURATIION
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtSCDURATIION" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            SBJ-UNITS</label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtSCSBJUNITS" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            SBJ-TRCLS-TYPE
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCTRCLSTYPE" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS--START-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCSTARTDATE" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS-END-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCENDDATE" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            SBJ-CLS-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCSTATUSDATE" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            CMPLTD-UNITS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCCMPLTDUNITS" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            TBC-UNITS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCUNITS" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            TRNG-LOC
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCLOC" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            TRNG-ASCMP</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCASCMP" tabindex="1" class="form-control" readonly="true"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            FCLTY-NAME</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCFCLTYNAME" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            FCLTY-STATUS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCFCLTYSTATUS" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            FCLTY-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCFCLTYSTATUSDATE" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS-REMARKS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtSCTRCLSREMARKS" tabindex="1" readonly="true"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <h4>
                                                            UNIT-CLASSES-LIST
                                                        </h4>
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
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:GridView ID="GVUnitsForStudents" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                            HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8">
                                            <Columns>
                                                <asp:BoundField HeaderText="Unit Name" DataField="Unit_Name" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Section Name" DataField="Section_Name" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Topics" DataField="Topics_List" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StartDate" DataField="startdate" DataFormatString="{0:d}" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="Enddate" DataField="Enddate" DataFormatString="{0:d}" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="status" DataField="status" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" DataFormatString="{0:d}" HeaderStyle-HorizontalAlign="Center" />
                                                 <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="profile">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td width="52%">
                                                <label for="pwd">
                                                    SELECT CATEGORY-NAME
                                                </label>
                                            </td>
                                            <td width="48%">
                                                <select id="ddlcat" runat="server" name="subject" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select subject from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="pwd">
                                                    SELECT SBJ-ID:SBJ-NAME
                                                </label>
                                            </td>
                                            <td>
                                                <select id="ddlsub" runat="server" name="subject2" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select enquiry from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email2">
                                                            ONELINE: STUDENT-INFO: ID
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" runat="server" name="input" id="txtTaskONLINE" tabindex="1" class="form-control"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" runat="server" name="input" id="txtTaskNAME" tabindex="1" class="form-control"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            LOC
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" runat="server" name="input" id="txtTaskLOC" tabindex="1" class="form-control"
                                                            placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            STATUS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSTATUS" tabindex="1" class="form-control"
                                                            placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
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
                                                    <td width="15%">
                                                        <label for="email2">
                                                            ACMP-NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPNAME" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            LOCATION
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPLOCATION" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            SUBURB
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPSUBURB" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            PHONE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPPHONE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            EMAIL</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPEMAIL" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            CNTCTPRSN</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPCNTCTPRSN" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            STATUS:STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskACMPSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
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
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email2">
                                                            CATEGORY: ID:NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYNAME" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            REGDATE
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYREGDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            GROUP SEMS/YEARS
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYGROUP" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            T-SUBJECTS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYSUBJECTS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SCH-STARTDATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYSTARTDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SCH-ENDDATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYENDDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            DURATION</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYDURATION" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            STATUS:STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            GRADE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYGRADE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            GRADE-STATUS:DATE REMARKS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskCATEGORYDATEREMARKS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
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
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email2">
                                                            SUBJECT-ID:NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTNAME" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            REG-DATE
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTREGDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            ASND-STATUS:DATE
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input" runat="server" id="txtTaskASNDSUBJECTSTATUSDATE"
                                                            tabindex="1" class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            T-UNITS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTUNITS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            DURATION</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTDURATION" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SCH-STARTDATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTSTARTDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            SCH-ENDDATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTENDDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            REMARKS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" runat="server" id="txtTaskSUBJECTREMARKS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
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
                                                        <h4>
                                                            SUBJECT-CLASS-INFORMATION
                                                        </h4>
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
                                                <tr>
                                                    <td width="15%">
                                                        <label for="email2">
                                                            SBJ-ID:NAME
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCSBJNAME" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                        &nbsp;
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email4">
                                                            SBJ-DURATIION
                                                        </label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCSBJDURATIION" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td width="2%">
                                                    </td>
                                                    <td width="18%">
                                                        <label for="email5">
                                                            SBJ-UNITS</label>
                                                    </td>
                                                    <td width="15%">
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCSBJUNITS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            SBJ-TRCLS-TYPE
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCTRCLSTYPE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS--START-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCSTARTDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS-END-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCENDDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            SBJ-CLS-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCCLSSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            CMPLTD-UNITS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCCMPLTDUNITS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            TBC-UNITS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCTBCUNITS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            TRNG-LOC
                                                        </label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCTRNGLOC" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            TRNG-ASCMP</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCTRNGASCMP" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            FCLTY-NAME</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCFCLTYNAME" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="email7">
                                                            FCLTY-STATUS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCFCLTYSTATUS" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            FCLTY-STATUS-DATE</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" runat="server" id="txtTaskSCSTATUSDATE" tabindex="1"
                                                            class="form-control" placeholder="" value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td>
                                                        <label for="email8">
                                                            SBJ-TRCLS-REMARKS</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input2" id="txtTaskSCREMARKS" tabindex="1" class="form-control"
                                                            placeholder="" value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <h4>
                                                            UNIT-CLASSES-LIST
                                                        </h4>
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
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                            <table id="txtTaskmytable" class="table table-bordred table-striped">
                                                <thead>
                                                    <th>
                                                        CLS-ID UNITNO:NAME
                                                    </th>
                                                    <th>
                                                        SECTION-NO:NAME:-TOPICS
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-START-DATE
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-END-DATE
                                                    </th>
                                                    <th>
                                                        UNIT-CLS
                                                    </th>
                                                    <th>
                                                        START-TIME
                                                    </th>
                                                    <th>
                                                        UNIT-CLS END-TIME
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-DURATION
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-END-DATE
                                                    </th>
                                                    <th>
                                                        UNIT-TOT-CLSS
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-STATUS
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-STATUS-DATE
                                                    </th>
                                                    <th>
                                                        UNIT-CLS-REMARKS
                                                    </th>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                        <td>
                                                            xxxx xx
                                                        </td>
                                                    </tr>
                                                </tbody>
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
