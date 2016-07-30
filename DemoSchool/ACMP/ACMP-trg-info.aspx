<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="ACMP-trg-info.aspx.cs" Inherits="PresentationLayer.ACMP.ACMP_trg_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=txtUnitEnddate]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: 'http://jqueryui.com/demos/datepicker/images/calendar.gif'
            });
        });
     </script>
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
                                    ACMP TRAINING-INFORMATION
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
                                            <asp:DropDownList ID="ddlBranch" class="form-control" AutoPostBack="true" 
                                                runat="server" onselectedindexchanged="ddlBranch_SelectedIndexChanged"
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
                                <div class="panel panel-default">
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
                                                <%--<asp:TextBox ID="txtCategoryName" runat="server" class="form-control"></asp:TextBox>--%>
                                                <asp:Label ID="lblCategoryName" runat="server" ></asp:Label>
                                            </td>
                                            <td width="2%">
                                                &nbsp;
                                            </td>
                                            <td width="18%">
                                                <label for="email47">
                                                    START-DATE</label>
                                            </td>
                                            <td width="15%">
                                                <%--<asp:TextBox ID="txtCategoryStartDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                <asp:Label ID="lblCategoryStartDate" runat="server" ></asp:Label>
                                            </td>
                                            <td width="2%">
                                            </td>
                                            <td width="18%">
                                                <label for="email48">
                                                    END-DATE</label>
                                            </td>
                                            <td width="15%">
                                                <%--<asp:TextBox ID="txtCategoryEndDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                 <asp:Label ID="lblCategoryEndDate" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="email49">
                                                    DURATION</label>
                                            </td>
                                            <td>
                                                <%--<asp:TextBox ID="txtCategoryDuration" runat="server" class="form-control"></asp:TextBox>--%>
                                              <asp:Label ID="lblCategoryDuration" runat="server" ></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <label for="email50">
                                                    T-SUBJECTS</label>
                                            </td>
                                            <td>
                                                <%--<asp:TextBox ID="txtCategorySubjects" runat="server" class="form-control"></asp:TextBox>--%>
                                                <asp:Label ID="lblCategorySubjects" runat="server" ></asp:Label>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <label for="email51">
                                                    STATUS
                                                </label>
                                            </td>
                                            <td>
                                                <%--<asp:TextBox ID="txtCategoryStatus" runat="server" class="form-control"></asp:TextBox>--%>
                                                 <asp:Label ID="lblCategoryStatus" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="email49">
                                                    STATUS-DATE
                                                </label>
                                            </td>
                                            <td>
                                                <%--<asp:TextBox ID="txtCategoryStatusDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                 <asp:Label ID="lblCategoryStatusDate" runat="server" ></asp:Label>
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
                                                    <%--<asp:TextBox ID="txtGroupYear" runat="server" class="form-control"></asp:TextBox>--%>
                                                     <asp:Label ID="lblGroupYear" runat="server" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        STARTDATE</label>
                                                </td>
                                                <td width="15%">
                                                    <%--<asp:TextBox ID="txtGroupStartDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                    <asp:Label ID="lblGroupStartDate" runat="server" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        END DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <%--<asp:TextBox ID="txtGroupEndDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                     <asp:Label ID="lblGroupEndDate" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email55">
                                                        STATUS
                                                    </label>
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox ID="txtGroupStatus" runat="server" class="form-control"></asp:TextBox>--%>
                                                    <asp:Label ID="lblGroupStatus" runat="server" ></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        STATUS DATE</label>
                                                </td>
                                                <td>
                                                    <%--<asp:TextBox ID="txtGroupStatusDate" runat="server" class="form-control"></asp:TextBox>--%>
                                                     <asp:Label ID="lblGroupStatusDate" runat="server" Text="Unavailable"></asp:Label>
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
                                        <div class="table-responsive">
                                            <asp:Label runat="server" ID="lblSubSchMsg"></asp:Label>
                                            <asp:GridView ID="GVSubjectSchedule" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
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
                                                            <asp:Label ID="ID" runat="server" Text="Subject ID"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="ID" runat="server" Text='<%#Eval("Subject_ScheduleID") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="Subject Name" DataField="SubjectName" HeaderStyle-HorizontalAlign="Center" />
                                                   
                                                    <asp:BoundField HeaderText="Type" DataField="ClassType" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="StartDate" DataField="Start_Date" DataFormatString="{0:dd-MM-yyyy}"
                                                        HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="End date" DataField="End_date" DataFormatString="{0:dd-MM-yyyy}"
                                                        HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Duration" DataField="Duration" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="StartTime" DataField="StartTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                    <asp:BoundField HeaderText="EndTime" DataField="EndTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                    <asp:BoundField HeaderText="Hours" DataField="Hours" HeaderStyle-HorizontalAlign="Center" />
                                                     <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Status date" DataField="Statusdate" DataFormatString="{0:dd-MM-yyyy}"
                                                        HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Faculty" DataField="FacultyName" HeaderStyle-HorizontalAlign="Center" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                            
                                     </td>
                                     </tr>
                                        </table>
                                        <asp:Panel ID="pnlViewReport" runat="server" Visible="false">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                <tr>
                                                    <td width="100%">
                                                        <h4>
                                                            UNIT-TRAINING-INFORMATION</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="table-responsive">
                                                        <asp:Label runat="server" ID="lblUnitsForSubjMsg"></asp:Label>
                                                            <asp:GridView ID="GVUnitsForSubjects" DataKeyNames="S_No" runat="server" AutoGenerateColumns="false"
                                                                HeaderStyle-BackColor="#3479c7" HeaderStyle-ForeColor="white" AllowPaging="true"
                                                                Style="width: 100%" PageSize="8" OnRowEditing="GVUnitsForSubjects_RowEditing"
                                                                OnRowCancelingEdit="GVUnitsForSubjects_RowCancelingEdit" OnRowUpdating="GVUnitsForSubjects_RowUpdating">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <EditItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="/Images/edit.png"
                                                                                ToolTip="Update" Height="20px" Width="20px" />
                                                                            <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="/Images/Arrow.png"
                                                                                ToolTip="Cancel" Height="20px" Width="20px" />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="/Images/edit.png"
                                                                                ToolTip="Edit" Height="20px" Width="20px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                      <asp:TemplateField HeaderText="Unit No" Visible="false">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtS_No" runat="server" Text='<%#Eval("S_No") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblS_No" runat="server" Text='<%#Eval("S_No") %>' />
                                                                            <asp:HiddenField runat="server" ID="hdnSNO" Value='<%#Eval("S_No") %>' />
                                                                              <%-- <asp:HiddenField runat="server" ID="hdnclasid" Value='<%#Eval("ClassID") %>' />--%>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Unit ID:Name">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitUnit_Name" runat="server" Text='<%#Eval("unitname") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitUnit_Name" runat="server" Text='<%#Eval("unitname") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Section ID:Name">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitSection_Name" runat="server" Text='<%#Eval("sectionname") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitSection_Name" runat="server" Text='<%#Eval("sectionname") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Topics List">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitTopics_List" runat="server" Text='<%#Eval("Topics_List") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitTopics_List" runat="server" Text='<%#Eval("Topics_List") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Type">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitClassType" runat="server" Text='<%#Eval("ClassType") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitClassType" runat="server" Text='<%#Eval("ClassType") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StartDate" >
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtUnitstartdate"  runat="server" Text='<%#Eval("startdate", "{0:dd/MM/yyyy}") %>' >
                                                                          </asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate >
                                                                            <asp:Label ID="lblUnitstartdate" runat="server" Text='<%#Eval("startdate", "{0:dd/MM/yyyy}") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EndDate">
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtUnitEnddate" runat="server" Text='<%#Eval("Enddate", "{0:dd/MM/yyyy}") %>' ></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitEnddate" runat="server" Text='<%#Eval("Enddate", "{0:dd/MM/yyyy}") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StartTime">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitStartTime" runat="server" Text='<%#Eval("StartTime") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitStartTime" runat="server" Text='<%#Eval("StartTime") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="EndTime">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitEndTime" runat="server" Text='<%#Eval("EndTime") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitEndTime" runat="server" Text='<%#Eval("EndTime") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="StatusDate">
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="txtUnitStatusDate" runat="server" Text='<%#Eval("StatusDate", "{0:dd/MM/yyyy}") %>' />
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitStatusDate" runat="server" Text='<%#Eval("StatusDate", "{0:dd/MM/yyyy}") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Remarks">
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txtUnitRemarks" runat="server" Text='<%#Eval("Remarks") %>' ></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblUnitRemarks" runat="server" Text='<%#Eval("Remarks") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                       <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                            <%--<button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                UPDATE-TRNG-INFO</button>--%>
                                                           <asp:Button runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                           Text="UPDATE-TRNG-INFO" ID="btnUpdateTrngInfo" 
                                                                onclick="btnUpdateTrngInfo_Click" />
                                                        </td>
                                                    </tr>
                                                </table>


                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
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
