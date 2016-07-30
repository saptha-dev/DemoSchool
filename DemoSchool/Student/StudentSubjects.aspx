<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="StudentSubjects.aspx.cs" Inherits="PresentationLayer.Student.StudentSubjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            MY-SUBJECTS
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
                                    </tr>
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
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-th-list">
                                                </span>SUBJECT-TRAINING </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                </div>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td width="25%">
                                                            <label for="email19">
                                                                START-DATE
                                                            </label>
                                                        </td>
                                                        <td width="25%">
                                                            <input type="text" name="input19" id="txtTrainingStartDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="25%">
                                                            <label for="pwd14">
                                                                END-DATE</label>
                                                        </td>
                                                        <td width="25%">
                                                            <input type="text" name="input19" id="txtTrainingEndDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email18">
                                                                DURATION</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingDuration" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="pwd13">
                                                                TYPE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingType" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email15">
                                                                ACMP-NAME:LOC</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingACMP" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="pwd10">
                                                                START-TIME</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingStartTime" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email10">
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
                                                            <label for="pwd9">
                                                                T-HRS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingHours" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email9">
                                                                FACULTY</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingFaculty" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="pwd8">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingStatusDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="pwd8">
                                                                CRT-ID</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingCRTID" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email3">
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
                                                            <label for="pwd2">
                                                                CRT-STATUS:STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingCRTStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email6">
                                                                REMARKS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtTrainingRemarks" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
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
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td>
                                                            <h4>
                                                                UNITS-TRAINING LIST</h4>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="table-responsive">
                                                    
                                                    <asp:GridView ID="GVUnits" CssClass="Gridview" CellPadding="4" runat="server" AutoGenerateColumns="False"
                                                        autopostback="true" Visible="true" HeaderStyle-BackColor="#3479c7" HeaderStyle-ForeColor="white"
                                                        Style="width: 100%; font-size: 13px; margin: auto;" AllowPaging="true" PageSize="4">
                                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="20" />
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
                                                            <asp:BoundField HeaderText="Unit Name" DataField="Unit_Name" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />
                                                            <asp:BoundField HeaderText="Section_Name" DataField="Section_Name" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />
                                                            <asp:BoundField HeaderText="Topics" DataField="Topics_List" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                            <asp:BoundField HeaderText="Status" DataField="Unit_Status" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                            <asp:BoundField HeaderText="Status_Date" DataField="Unite_Status_Date" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                            <asp:BoundField HeaderText="Remarks" DataField="Unit_Remarks" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-th-list">
                                                </span>SUBJECT-ASSESSMENT</a>
                                            </h4>
                                        </div>
                                        <div id="collapseTwo" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <div class="table-responsive">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="8">
                                                                <h4>
                                                                    SUBJECT-ASSESSMENT</h4>
                                                            </td>
                                                        </tr>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
