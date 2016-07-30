<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student-results-grade.aspx.cs" Inherits="PresentationLayer.Student.Student_results_grade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            RESULTS & GRADES</h3>
                    </div>
                    <div class="panel-body">
                        <div class="comment-tabs">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                    <h3 class="reviews text-capitalize">
                                        <span class="glyphicon glyphicon glyphicon glyphicon-th-list"></span>REAL TEST RESULT</h3>
                                </a></li>
                                <li><a href="#add-comment" role="tab" data-toggle="tab">
                                    <h3 class="reviews text-capitalize">
                                        <span class="glyphicon glyphicon glyphicon glyphicon glyphicon-list-alt"></span>
                                        REAL TEST GRADE
                                    </h3>
                                </a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="comments-logout">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-11">
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
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
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
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
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
                                                                <td width="15%">
                                                                    <label for="email46">
                                                                        RT-SBJ-ID:NAME
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
                                                                        RT-DATE</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input23" id="input23" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                                <td width="2%">
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email48">
                                                                        RT-SLOT:SSN:TIME</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email49">
                                                                        RT-STATUS:DATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
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
                                                        <div class="table-responsive">
                                                       
                                                            <asp:GridView ID="GVSubjectResult" CssClass="Gridview" CellPadding="4" runat="server"
                                                                AutoGenerateColumns="False" autopostback="true" Visible="true" HeaderStyle-BackColor="#3479c7"
                                                                HeaderStyle-ForeColor="white" Style="width: 100%; font-size: 13px; margin: auto;"
                                                                AllowPaging="true" PageSize="4">
                                                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="20" />
                                                                <Columns>
                                                                    <asp:BoundField HeaderText="RT ID" DataField="Result_ID" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style1" />
                                                                    <asp:BoundField HeaderText="CTGY ID:NAME" DataField="CategoryName" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style1" />
                                                                    <asp:BoundField HeaderText="SBJ-ID:NAME" DataField="SubjectName" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="ACMP-NAME" DataField="BranchName" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-LOC" DataField="BranchLocation" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="CMPLTD-DATE" DataField="Exam_EndDate" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}"  />
                                                                    <asp:BoundField HeaderText="RT-T-QSTNS" DataField="Total_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-ANSRD-QSTNS" DataField="Std_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-UN ANSRD-QSTNS" DataField="Std_Un_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-CRCT-ANS" DataField="Std_Correct_Ans" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-INCRCT-ANS" DataField="Std_Wrong_Ans" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-RESULT-STATUS:DATE" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                                    <asp:BoundField HeaderText="RT-SBJ-RESULT" DataField="Std_Result" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-SBJ-STATUS:DATE" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                    <asp:BoundField HeaderText="RT-REMARKS" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                                                        ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="add-comment">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-xs-11">
                                                <table width="48%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td width="48%">
                                                            <label for="pwd">
                                                                SELECT CATEGORY ID:NAME
                                                            </label>
                                                        </td>
                                                        <td width="52%">
                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                <option value="na" selected="selected">Select subject from List</option>
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
                                                            </tr>
                                                            <tr>
                                                                <td width="15%">
                                                                    <label for="email2">
                                                                        STUDENT- ID</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email4">
                                                                        NAME</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td width="2%">
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email5">
                                                                        LOC</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email7">
                                                                        STATUS</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email8">
                                                                        STATUS-DATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input12" tabindex="1" class="form-control" placeholder=""
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
                                                            </tr>
                                                        </table>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
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
                                                                    <label for="email2">
                                                                        ACMP-NAME</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email4">
                                                                        LOCATION</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td width="2%">
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email5">
                                                                        SUBURB</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email7">
                                                                        PHONE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email8">
                                                                        EMAIL</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input12" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email8">
                                                                        CNTCTPRSN</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input12" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email7">
                                                                        STATUS:STATUS-DATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
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
                                                            <tr>
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
                                                                    <label for="email46">
                                                                        CATEGORY: ID:NAME</label>
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
                                                                        REGDATE</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input23" id="input23" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                                <td width="2%">
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email48">
                                                                        GROUP SEMS/YEARS</label>
                                                                </td>
                                                                <td width="15%">
                                                                    <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email49">
                                                                        T-SUBJECTS</label>
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
                                                                        SCH-STARTDATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email51">
                                                                        SCH-ENDDATE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email49">
                                                                        DURATION</label>
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
                                                                        STATUS:STATUS-DATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email51">
                                                                        GRADE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email10">
                                                                        GRADE-STATUS:DATE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input13" tabindex="1" class="form-control" placeholder=""
                                                                        value="" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email11">
                                                                        REMARKS</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input" id="input14" tabindex="1" class="form-control" placeholder=""
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
                                                            </tr>
                                                        </table>
                                                        <div class="table-responsive">
                                                            <table id="mytable" class="table table-bordred table-striped">
                                                                <thead>
                                                                    <th>
                                                                        SBJ-ID:NAME
                                                                    </th>
                                                                    <th>
                                                                        STATUS:STATUS-DATE
                                                                    </th>
                                                                    <th>
                                                                        START-DATE
                                                                    </th>
                                                                    <th>
                                                                        END-DATE
                                                                    </th>
                                                                    <th>
                                                                        RT-ID
                                                                    </th>
                                                                    <th>
                                                                        RT-LOC
                                                                    </th>
                                                                    <th>
                                                                        RT-DATE:SLOT:SSN:TIME
                                                                    </th>
                                                                    <th>
                                                                        RT-STATUS
                                                                    </th>
                                                                    <th>
                                                                        RT-STATUS-DATE
                                                                    </th>
                                                                    <th>
                                                                        RESULT
                                                                    </th>
                                                                    <th>
                                                                        RESULT-STATUS:DATE
                                                                    </th>
                                                                    <th>
                                                                        SBJ-RESULT
                                                                    </th>
                                                                    <th>
                                                                        REMARKS
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
                </div>
            </div>
        </div>
    </div>
</asp:Content>
