<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student-sample-test.aspx.cs" Inherits="PresentationLayer.Student.Student_sample_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
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
                            SAMPLE TEST</h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                    data-toggle="tab"><span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                                    SAMPLE TEST</a></li>
                                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                                    <span class="glyphicon glyphicon-blackboard" aria-hidden="true"></span>SAMPLE RESULT</a></li>
                                <li role="presentation"><a href="#report" aria-controls="report" role="tab" data-toggle="tab">
                                    <span class="glyphicon glyphicon-list" aria-hidden="true"></span>SAMPLE REPORT</a></li>
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
                                                    <td>
                                                        <label for="email2">
                                                            CTGY ID:NAME:GROUP:SEM
                                                        </label>
                                                    </td>
                                                    <td width="22%">
                                                        <input type="text" name="input8" id="input16" tabindex="1" class="form-control" placeholder=""
                                                            value="" />
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td width="16%">
                                                        <label for="email4">
                                                            SBJ ID:SBJ NAME
                                                        </label>
                                                    </td>
                                                    <td colspan="3">
                                                        <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                            value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="17%">
                                                        <label for="email4">
                                                            SYSTEM TIME:</label>
                                                    </td>
                                                    <td>
                                                        <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                            value="" />
                                                    </td>
                                                    <td width="3%">
                                                        &nbsp;
                                                    </td>
                                                    <td colspan="3">
                                                        <label for="email4">
                                                            ST-TIME</label>
                                                    </td>
                                                    <td width="18%">
                                                        <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                            value="30MINUTES" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" align="left">
                                                        <h4>
                                                            SAMPLE QST NO:NAME
                                                        </h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                 <td colspan="7" align="center">
                                                      <input type="text" name="input9" id="input17" tabindex="1" class="form-control" placeholder=""
                                                            value="" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" align="center">
                                                        <table width="95%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td align="center">
                                                                    [OPTION-(A)]:SMPLANSWER-A]
                                                                </td>
                                                                <td align="center">
                                                                    [OPTION-(B)]:SMPLANSWER-B]
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">
                                                                    [OPTION-(A)]:SMPLANSWER-C]
                                                                </td>
                                                                <td align="center">
                                                                    [OPTION-(B)]:SMPLANSWER-D]
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" align="center">
                                                        <h4>
                                                            ANSWER
                                                            <input type="text" name="input10" id="input18" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="7" align="center">
                                                        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                            <tr>
                                                                <td width="80%" colspan="2" align="center" valign="top" style="text-align: CENTER">
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class=" glyphicon glyphicon-arrow-left"></span>PREVIOUS</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class=" glyphicon glyphicon-play"></span>START</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class="glyphicon glyphicon-floppy-save"></span>SAVE</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class=" glyphicon glyphicon-pencil"></span>REAL-ANS</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        NEXT <span class="glyphicon glyphicon-arrow-right"></span>
                                                                    </button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class="glyphicon glyphicon-log-out"></span>EXIT</button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="profile">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td>
                                                <label for="pwd">
                                                    Select Category</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="true"
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
                                                <asp:DropDownList ID="DropDownList2" class="form-control" runat="server" AutoPostBack="true"
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
                                                <asp:DropDownList ID="DropDownList3" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>


                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            SAMPLE TEST RESULT
                                        </div>
                                        <div class="panel-body">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%">
                                                                <label for="email2">
                                                                    STUD ID:STUD-NAME
                                                                </label>
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
                                                                    SAMPLE TEST-DATE
                                                                </label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td width="2%">
                                                            </td>
                                                            <td width="18%">
                                                                <label for="email5">
                                                                    SAMPLE TEST -TIME
                                                                </label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email7">
                                                                    ST-STATUS</label>
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
                                            <div class="table-responsive">
                                                <%--<table id="mytable" class="table table-bordred table-striped">
                        <thead>
                          <tr>
                            <th>ST-ID </th>
                            <th> ST-CATEGORYID:NAME:ST-SBJ-ID:NAME</th>
                            <th>ST-T-QSTNS</th>
                            <th>ST-ANSRD-QSTNS</th>
                            <th>ST-UN ANSRD-QSTNS</th>
                            <th>ST-CRCT-ANS</th>
                            <th>ST-INCRCT-ANS</th>
                            <th>ST-RESULT</th>
                            <th>ST-QSTN-STATUS</th>
                            <th>ST-QSTN-REMARKS</th>
                        </thead>
                        <tbody>
                          <tr>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxxx</td>
                            <td>xxxx xx</td>
                          </tr>
                          <tr>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxxx</td>
                            <td>xxxx xx</td>
                          </tr>
                          <tr>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxx</td>
                            <td>xxxx</td>
                            <td>xxxx xx</td>
                          </tr>
                        </tbody>
                      </table>--%>
                                                <asp:GridView ID="GVSampleTest" CssClass="Gridview" CellPadding="4" runat="server"
                                                    AutoGenerateColumns="False" autopostback="true" Visible="true" HeaderStyle-BackColor="#3479c7"
                                                    HeaderStyle-ForeColor="white" Style="width: 100%; font-size: 13px; margin: auto;"
                                                    AllowPaging="true" PageSize="4">
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
                                                        <%-- <asp:BoundField HeaderText="CATEGORY:ID:NAME" DataField="Category_Id" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style1" />--%>
                                                        <asp:BoundField HeaderText="ST-T-QSTNS" DataField="Total_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style1" />
                                                        <asp:BoundField HeaderText="ST-ANSRD-QSTNS" DataField="Std_Attempted_Qstns" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-UN ANSRD-QSTNS" DataField="Std_Un_Attempted_Qstns"
                                                            HeaderStyle-HorizontalAlign="Center" ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-CRCT-ANS" DataField="Std_Correct_Ans" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-INCRCT-ANS" DataField="Std_Wrong_Ans" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-RESULT" DataField="Std_Result" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-QSTN-STATUS" DataField="Solutions_Status" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                        <asp:BoundField HeaderText="ST-QSTN-REMARKS" DataField="Remarks" HeaderStyle-HorizontalAlign="Center"
                                                            ItemStyle-CssClass="style2" HeaderStyle-Width="50%" />
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="report">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td width="52%">
                                                <label for="pwd">
                                                    SELECT CATEGORY-NAME
                                                </label>
                                            </td>
                                            <td width="48%">
                                                <select id="subject" name="subject" class="form-control" required="required">
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
                                                <select id="subject" name="subject2" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select enquiry from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="pwd">
                                                    SELECT SAMPLE TEST
                                                </label>
                                            </td>
                                            <td>
                                                <select id="subject" name="subject2" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select enquiry from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            SAMPLE TEST REPORT
                                        </div>
                                        <div class="panel-body">
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td width="15%">
                                                                <label for="email2">
                                                                    STUD ID:STUD-NAME
                                                                </label>
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
                                                                    SAMPLE TEST-DATE
                                                                </label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td width="2%">
                                                            </td>
                                                            <td width="18%">
                                                                <label for="email5">
                                                                    SAMPLE TEST -TIME
                                                                </label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email7">
                                                                    ST-STATUS</label>
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
                                            <div class="panel panel-default">
                                                <div class="panel-body">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                        <tr>
                                                            <td width="15%">
                                                                <label for="email2">
                                                                    ST-CATEGORYID:NAME
                                                                </label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input3" id="input11" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td width="2%">
                                                                &nbsp;
                                                            </td>
                                                            <td width="18%">
                                                                <label for="email4">
                                                                    ST-SUBJECT ID</label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td width="2%">
                                                            </td>
                                                            <td width="18%">
                                                                <label for="email5">
                                                                    ST-SBJ-NAME</label>
                                                            </td>
                                                            <td width="15%">
                                                                <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email3">
                                                                    ST-DATE</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input4" id="input12" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <label for="email6">
                                                                    ST-TIME</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <label for="email7">
                                                                    ST-ID
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email8">
                                                                    ST-T-QSTNS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input5" id="input13" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <label for="email9">
                                                                    ST-ANSRD-QSTNS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input4" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <label for="email10">
                                                                    ST-ANSRD-QSTNS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input5" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email11">
                                                                    ST-UNANSRD-QSTNS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input6" id="input14" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <label for="email12">
                                                                    ST-CRCT-ANS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <label for="email13">
                                                                    ST-INCRCT-ANS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input7" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label for="email14">
                                                                    ST-RESULT</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input7" id="input15" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <label for="email15">
                                                                    ST-STATUS</label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input8" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                                <label for="email16">
                                                                    ST-REMARKS
                                                                </label>
                                                            </td>
                                                            <td>
                                                                <input type="text" name="input2" id="input10" tabindex="1" class="form-control" placeholder=""
                                                                    value="" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table id="mytable" class="table table-bordred table-striped">
                                                    <thead>
                                                        <tr>
                                                            <th>
                                                                ST-QSTN-NO
                                                            </th>
                                                            <th>
                                                                ST-QSTN NAME
                                                            </th>
                                                            <th>
                                                                OPTION-A
                                                            </th>
                                                            <th>
                                                                OPTION-B
                                                            </th>
                                                            <th>
                                                                OPTION-C
                                                            </th>
                                                            <th>
                                                                OPTION-D
                                                            </th>
                                                            <th>
                                                                OPTION-E
                                                            </th>
                                                            <th>
                                                                STD-ANSWR
                                                            </th>
                                                            <th>
                                                                CRCT-ANSWR
                                                            </th>
                                                            <th>
                                                                ST-QSTN-STATUS
                                                            </th>
                                                            <th>
                                                                REMARKS
                                                            </th>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxxx
                                                            </td>
                                                            <td>
                                                                xxxx xx
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxxx
                                                            </td>
                                                            <td>
                                                                xxxx xx
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxx
                                                            </td>
                                                            <td>
                                                                xxxx
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
   </ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>
