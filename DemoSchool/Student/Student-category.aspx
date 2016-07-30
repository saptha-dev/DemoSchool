<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Student-category.aspx.cs"
    Inherits="PresentationLayer.Student.Student_category" MasterPageFile="~/Student/StudentMasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showPopup() {
            $("#divSuccess").show();
            setTimeout(function () {
                $('#divSuccess').fadeOut('fast');
            }, 4000);
        }

    </script>
    <script type="text/javascript" src="Script/jquery-1.5.1min.js"></script>
    <script type="text/javascript" language="javascript">

        function toggleSelectionGrid(source) {
            var isChecked = source.checked;
            $("#GirdViewTable input[id*='chkchild']").each(function (index) {
                $(this).attr('checked', false);
            });
            source.checked = isChecked;
        }

    </script>
    <style type="text/css">
        .green
        {
            color: green;
        }
        
        .nav-tabs
        {
            margin: auto;
            width: 73%;
        }
        .style1
        {
            font-size: 14px;
        }
        tr th
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>
    <div class="panel-body">
        <div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                    data-toggle="tab"><span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                    MY-CATEGORY</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>Reg Category</a></li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12  ">
                                <div class="panel panel-info">
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
                                        <div class="panel panel-info">
                                            <div class="panel-heading">
                                                CATEGORY-SUBJECTS</div>
                                            <div class="panel-body">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td width="15%">
                                                            <label for="email46">
                                                                CATEGORY: ID:NAME</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectCategoryName" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email47">
                                                                SUBJECT-ID: NAME</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectName" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email48">
                                                                REG-DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectREGDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                ASND-STATUS: DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectStatusDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                TRNG-TYPE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectTRNGType" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                ACMP-NAME:LOC</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectCMPYName" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email49">
                                                                T-UNITS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectUnitsCount" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email50">
                                                                DURATION</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHDuration" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email51">
                                                                SCH-START DATE
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHStartDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email10">
                                                                SCH-END DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHEndDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email11">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email11">
                                                                STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHStatusDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email10">
                                                                REMARKS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectSCHRemarks" runat="server" readonly="true"
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
                                                        <td colspan="8">
                                                            <h3>
                                                                MY-CATEGORIES-LIST
                                                            </h3>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GVCategorys" CssClass="Gridview" CellPadding="4" runat="server"
                                                        AutoGenerateColumns="False" autopostback="true" Visible="true" HeaderStyle-BackColor="#3479c7"
                                                        HeaderStyle-ForeColor="white" Style="width: 100%; font-size: 13px; margin: auto;"
                                                        AllowPaging="true" PageSize="4" OnSelectedIndexChanged="GVCategorys_SelectedIndexChanged">
                                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="20" />
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-CssClass="style">
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="chkheader" runat="server" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkchild" runat="server" onClientclick="toggleSelectionGrid(this);"
                                                                        AutoPostBack="true" OnCheckedChanged="chkchild_CheckedChanged" />
                                                                </ItemTemplate>
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="CATEGORY:ID" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />
                                                            <asp:BoundField HeaderText="CATEGORY:NAME" DataField="Category_Name" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />
                                                            <%--  <asp:BoundField HeaderText="REGDATE" DataField="Category_Reg_Date" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />--%>
                                                            <asp:BoundField HeaderText="GROUP SEMS/YEARS" DataField="BranchYear" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />
                                                            <%-- <asp:BoundField HeaderText="T-SUBJECTS" DataField="Year_T_Subjects" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style1" />--%>
                                                            <asp:BoundField HeaderText="SCH-STARTDATE" DataField="Schedule_srt_Date" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                            <asp:BoundField HeaderText="SCH-ENDDATE" DataField="Schedule_end_Date" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                            <asp:BoundField HeaderText="Duration" DataField="Duration" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                            <asp:BoundField HeaderText="STATUS:STATUS-DATE" DataField="Status_date" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" DataFormatString="{0:d}" />
                                                            <asp:BoundField HeaderText="GRADE" DataField="Duration" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                            <asp:BoundField HeaderText="GRADE-STATUS:DATE" DataField="Duration" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                            <asp:BoundField HeaderText="REMARKS" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                                                ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                                <div class="table-responsive">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                        <tr>
                                                            <td width="100%" colspan="8">
                                                                <h3>
                                                                    CATEGORY-SUBJECTS</h3>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table id="mytable" class="table table-bordred table-striped">
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="GVSubjectSchedule" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                                    HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="8">
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="ID" runat="server" Text="ID"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="ID" runat="server" Text='<%#Eval("Schedule_ID") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField HeaderText="Subject Name" DataField="SubjectName" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Status date" DataField="Status_date" DataFormatString="{0:d}"
                                                                            HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="StartDate" DataField="Start_Date" DataFormatString="{0:d}"
                                                                            HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="End date" DataField="End_date" DataFormatString="{0:d}"
                                                                            HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Duration" DataField="Duration" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Hours" DataField="Hours" HeaderStyle-HorizontalAlign="Center" />
                                                                        <asp:BoundField HeaderText="Faculty" DataField="Faculty" HeaderStyle-HorizontalAlign="Center" />
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
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable"
                        style="margin-bottom: 100px; margin-top: 50px">
                        <tr>
                            <td width="40%">
                                <label for="pwd">
                                    Select Program</label>
                            </td>
                            <td width="60%">
                                <asp:UpdatePanel ID="updateProgram" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="addProgramBtn" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddladdProgram" runat="server" AutoPostBack="true" class="form-control"
                                            OnSelectedIndexChanged="ddladdProgram_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pwd">
                                    Select Category</label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="addProgramBtn" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddladdCategory" runat="server" AutoPostBack="true" class="form-control"
                                            OnSelectedIndexChanged="ddladdCategory_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pwd3">
                                    Select Category Group</label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="addProgramBtn" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddladdGroup" runat="server" AutoPostBack="true" class="form-control"
                                            OnSelectedIndexChanged="ddladdGroup_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pwd3">
                                    Select Category Year</label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="addProgramBtn" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:DropDownList ID="ddladdsemister" runat="server" AutoPostBack="true" class="form-control">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="addProgramBtn" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                            OnClick="addProgramBtn_Click" Text="Add Program" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <div class="alert alert-success" style="display: none" id="divSuccess">
                                    <strong>Success!</strong> New Program Added Successfully Please wait for Approval...<strong
                                        class="glyphicon glyphicon-ok green"></strong>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
