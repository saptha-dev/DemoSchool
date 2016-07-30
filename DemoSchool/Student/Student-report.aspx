<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student-report.aspx.cs" Inherits="PresentationLayer.Student.Student_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="body" runat="server">
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
                            MY-REPORT
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="40%">
                                    <label for="pwd">
                                        Select Program</label>
                                </td>
                                <td width="60%">
                                    <asp:DropDownList ID="DDLProgram" runat="server" AutoPostBack="true" class="form-control"
                                        OnSelectedIndexChanged="DDLProgram_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd">
                                        Select Category</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" class="form-control"
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
                                    <asp:DropDownList ID="ddlGroup" runat="server" AutoPostBack="true" class="form-control"
                                        OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
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
                                    <label for="pwd2">
                                        Select Subject</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="true" class="form-control"
                                        OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
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
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
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
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
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
                                            <input type="text" name="input19" id="txtSCHCategoryStartTime" runat="server" readonly="true"
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
                                            <input type="text" name="input19" id="txtSCHCategoryEndTime" runat="server" readonly="true"
                                                tabindex="1" class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email49">
                                                DURATION</label>
                                        </td>
                                        <td>
                                            <input type="text" name="input19" id="txtSCHCategoryDuration" runat="server" readonly="true"
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
                                            <input type="text" name="input19" id="txtSCHCategoryStatus" runat="server" readonly="true"
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
                                                        STATUS</label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input19" id="txtSCHSubjectStatus" runat="server" readonly="true"
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
                        <div class="comment-tabs">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                    <h3 class="reviews text-capitalize">
                                        <span class="glyphicon glyphicon glyphicon glyphicon-th-list"></span>TRAINING-REPORT</h3>
                                </a></li>
                                <li><a href="#add-comment" role="tab" data-toggle="tab">
                                    <h3 class="reviews text-capitalize">
                                        <span class="glyphicon glyphicon glyphicon glyphicon-th-list"></span>ASSESSMENT-REPORT
                                    </h3>
                                </a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="comments-logout">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-11">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td colspan="8">
                                                            <h4>
                                                                SUBJECT-TRAINING</h4>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="15%">
                                                            <label for="email46">
                                                                START-DATE
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtTrainingStartDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email47">
                                                                END-DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtTrainingEndDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email48">
                                                                DURATION</label>
                                                        </td>
                                                        <td width="15%">
                                                           <input type="text" name="input19" id="txtTrainingDuration" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                TYPE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingType" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                ACMP-NAME:LOC</label>
                                                        </td>
                                                        <td>
                                                           <input type="text" name="input19" id="txtTrainingACMP" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                START-TIME
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingStartTime" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                END-TIME</label>
                                                        </td>
                                                        <td>
                                                             <input type="text" name="input19" id="txtTrainingEndTime" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                T-HRS</label>
                                                        </td>
                                                        <td>
                                                         <input type="text" name="input19" id="txtTrainingHours" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                FACULTY
                                                            </label>
                                                        </td>
                                                        <td>
                                                              <input type="text" name="input19" id="txtTrainingFaculty" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email13">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                              <input type="text" name="input19" id="txtTrainingStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email14">
                                                                STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                              <input type="text" name="input19" id="txtTrainingStatusDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email15">
                                                                CRT-ID
                                                            </label>
                                                        </td>
                                                        <td>
                                                           <input type="text" name="input19" id="txtTrainingCRTID" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email6">
                                                                CRT-DATE</label>
                                                        </td>
                                                        <td>
                                                          <input type="text" name="input19" id="txtTrainingCRTDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email9">
                                                                CRT-STATUS:STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                      <input type="text" name="input19" id="txtTrainingCRTStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email12">
                                                                REMARKS
                                                            </label>
                                                        </td>
                                                        <td>
                                                             <input type="text" name="input19" id="txtTrainingRemarks" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="8">
                                                            <h4>
                                                                UNITS-TRAINING LIST</h4>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="table-responsive">
                                                    <table id="mytable" class="table table-bordred table-striped">
                                                       <tr>
                                                       <td>
                                                       <asp:GridView ID="GVUnitsForSubjects" runat="server" AutoGenerateColumns="false"
                                                            HeaderStyle-BackColor="#3479c7" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                            Style="width: 100%" PageSize="8">
                                                            <Columns> 
                                                                <asp:BoundField HeaderText="Unit Name" DataField="Unit_Name" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Section Name" DataField="Section_Name" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Topics" DataField="Topics_List" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StartDate" DataField="startdate" DataFormatString="{0:d}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Enddate" DataField="Enddate" DataFormatString="{0:d}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="status" DataField="status" HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="StatusDate" DataField="StatusDate" DataFormatString="{0:d}"
                                                                    HeaderStyle-HorizontalAlign="Center" />
                                                                <asp:BoundField HeaderText="Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />
                                                            </Columns>
                                                        </asp:GridView>
                                                       </td>
                                                       </tr>
                                                    </table>
                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                        <tr>
                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                    <span class=" glyphicon glyphicon-list-alt"></span>View Report</button>
                                                                &nbsp;&nbsp;
                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                    <span class="glyphicon glyphicon-print"></span>Print Report</button>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="add-comment">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-11">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td colspan="8">
                                                            <h4>
                                                                SUBJECT-ASSESSMENT</h4>
                                                        </td>
                                                    </tr>
                                                    <%-- <tr>
                                                        <td width="15%">
                                                            <label for="email46">
                                                                BK-ID
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email47">
                                                                BK-DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input23" id="input23" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email48">
                                                                BK-SLOT:SSN:TIME</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                BK-STATUS:STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                RT-ID</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                RT-DATE:TIME</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                RT-ACMP-NAME:LOC</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                ,RT-QSTNS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                ANSWERED-QSTNS
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email13">
                                                                CORRECT-ANS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input8" id="input11" tabindex="1" class="form-control" placeholder=""
                                                                value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email14">
                                                                INCORRECT-ANS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input8" id="input15" tabindex="1" class="form-control" placeholder=""
                                                                value="" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email15">
                                                                RT-RESULT
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input8" id="input11" tabindex="1" class="form-control" placeholder=""
                                                                value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email6">
                                                                RESULT-STATUS:DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input8" id="input8" tabindex="1" class="form-control" placeholder=""
                                                                value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email9">
                                                                REMARKS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input8" id="input10" tabindex="1" class="form-control" placeholder=""
                                                                value="" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td width="15%">
                                                            <label for="email63">
                                                                BK-ID
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtAssesmentBKID" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email64">
                                                                BK-DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtAssesmentBKDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email65">
                                                                BK-SLOT:SSN:TIME</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtAssesmentSSNTime" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email66">
                                                                BK-STATUS:STATUS-DATE
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email67">
                                                                RT-DATE:TIME</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentRTDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email67">
                                                                RT-ACMP-NAME:LOC</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentCompany" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email70">
                                                                RT-QSTNS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentRTQstns" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email71">
                                                                ANSWERED-QSTNS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentAnsQstns" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email72">
                                                                UNANSWERED-QSTNS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentUnAnsQstns" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email68">
                                                                CORRECT-ANS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentCorrectAns" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email69">
                                                                INCORRECT-ANS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentInCorrectAns" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email69">
                                                                RT-RESULT</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentResult" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email75">
                                                                RESULT-STATUS:DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentResultStatusDate" runat="server"
                                                                readonly="true" tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email76">
                                                                REMARKS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtAssesmentRemarks" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                RT-ID</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input23" id="Text1" tabindex="1" class="form-control" placeholder="" readonly="true"
                                                                value="" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                            <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                <span class=" glyphicon glyphicon-list-alt"></span>View Report</button>
                                                            &nbsp;&nbsp;
                                                            <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                <span class="glyphicon glyphicon-print"></span>Print Report</button>
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
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
