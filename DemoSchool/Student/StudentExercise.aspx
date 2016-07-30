<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentExercise.aspx.cs"
    Inherits="PresentationLayer.Student.StudentExercise" MasterPageFile="~/Student/StudentMasterPage.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .anslabel
        {
            margin-left: 40px;
            font-size: initial;
        }
    </style>
</asp:Content>
<asp:Content ID="studentExcerciseBody" runat="server" ContentPlaceHolderID="body">
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
                            MY-EXERCISE
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <div role="tabpanel" class="tab-pane" id="profile">
                                <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
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
                                    <tr>
                                        <td width="40%">
                                            <label for="pwd">
                                                Select UNIT</label>
                                        </td>
                                        <td width="60%">

                                                    <asp:DropDownList ID="ddlUnit" runat="server" AutoPostBack="true" class="form-control"
                                                        OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged">
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
                                                                CATEGORYID: NAME:GRP:SEM/YR
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtCategoryName" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email4">
                                                                START DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtCategoryStartDate" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email5">
                                                                END-DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input" id="txtCategoryEndDate" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                DURATION</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input" id="txtCategoryDuration" tabindex="1" runat="server"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input" id="txtCategoryStatus" tabindex="1" runat="server"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input" id="txtCategoryStatusDate" tabindex="1" runat="server"
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
                                                        <td width="15%">
                                                            <label for="email2">
                                                                SUBJ-ID:NAME
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input2" id="txtSubjectName" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email4">
                                                                CONTENT-TYPE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input2" id="txtSubjectContentType" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email5">
                                                                START DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input2" id="txtSubjectStartDate" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                END-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input2" id="txtSubjectEndDate" tabindex="1" runat="server"
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
                                                            <input type="text" name="input2" id="txtSubjectDuration" tabindex="1" runat="server"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input2" id="txtSubjectStatus" tabindex="1" runat="server"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                STATUS-DATE
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input2" id="txtSubjectStatusDate" tabindex="1" runat="server"
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
                                <div class="panel panel-info">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-xs-12 ">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td width="35%">
                                                            <label for="email2">
                                                                CATEGORYID:NAME:SUBJECT ID:NAME:UNITNO:UNIT NAME
                                                            </label>
                                                        </td>
                                                        <td width="35%">

                                                                    <input type="text" name="input" id="txt_Cat_Sub_Unit" runat="server" tabindex="1"
                                                                        class="form-control" placeholder="" value="" /></td>

                                                    </tr>
                                                </table>
                                            </div>
                                        </div> 
                                        <asp:Panel ID="pnlExercise" runat="server" Visible="false" >
                                            <div class="well text-CENTER">
                                                <ul class="list-group">
                                                    <li class="list-group-item">
                                                        <p>
                                                            EXERCISE:QNO-NAME<input type="text" name="input" runat="server" id="txtExerciseQstn"
                                                                readonly="true" tabindex="1" class="form-control" /></p>
                                                    </li>
                                                </ul>
                                                <div class="row" style="margin-top: 12px;">
                                                    <div class="col-xs-12">
                                                        <ul class="list-group">
                                                            <li class="list-group-item">
                                                                <asp:LinkButton ID="li_OptionA" runat="server" OnClick="li_OptionA_Click">OPTION-A: </asp:LinkButton>
                                                                <asp:Label ID="lblOptA" runat="server" CssClass="anslabel"></asp:Label>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <asp:LinkButton ID="li_OptionB" runat="server" OnClick="li_OptionB_Click">OPTION-B: </asp:LinkButton>
                                                                <asp:Label ID="lblOptB" runat="server" CssClass="anslabel"></asp:Label>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <asp:LinkButton ID="li_OptionC" runat="server" OnClick="li_OptionC_Click">OPTION-C: </asp:LinkButton>
                                                                <asp:Label ID="lblOptC" runat="server" CssClass="anslabel"></asp:Label>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <asp:LinkButton ID="li_OptionD" runat="server" OnClick="li_OptionD_Click">OPTION-D: </asp:LinkButton>
                                                                <asp:Label ID="lblOptD" runat="server" CssClass="anslabel"></asp:Label>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <asp:LinkButton ID="li_OptionE" runat="server" OnClick="li_OptionE_Click">OPTION-E: </asp:LinkButton>
                                                                <asp:Label ID="lblOptE" runat="server" CssClass="anslabel"></asp:Label>
                                                            </li>
                                                        </ul>
                                                        <ul class="list-group">
                                                            <li class="list-group-item">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                    <tr>
                                                                        <td width="15%">
                                                                            <label for="email2">
                                                                                STUDENT ANSWER
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;<asp:Label ID="lblStudentAnswer" runat="server" CssClass="anslabel"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="email7">
                                                                                RESULT</label>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;<asp:Label ID="lblResultCorrect" runat="server" CssClass="anslabel" Text="Correct"
                                                                                Visible="false" ForeColor="#33CC33"></asp:Label>
                                                                            <asp:Label ID="lblResultWrong" runat="server" CssClass="anslabel" Text="Wrong" Visible="false"
                                                                                ForeColor="Red"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="email7">
                                                                                REAL ANSWER
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;<asp:Label ID="lblRealAnswer" runat="server" CssClass="anslabel"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                            <tr>
                                                <td width="80%" colspan="2" align="center" valign="top" style="text-align: CENTER">
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="btnStart" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                        OnClick="btnStart_Click"> <span class="glyphicon glyphicon-play"></span>Start</asp:LinkButton>
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="btnExerciseRealAns" Visible="false" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                        OnClick="btnExerciseRealAns_Click"> <span class="glyphicon glyphicon-pencil"></span>REAL-ANS</asp:LinkButton>
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="btnExerciseNext" Visible="false" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                        OnClick="btnExerciseNext_Click"> <span class="glyphicon glyphicon-arrow-right"></span>NEXT</asp:LinkButton>
                                                    &nbsp;&nbsp;
                                                    <asp:LinkButton ID="btnExerciseExit" runat="server" Visible="false" class="btn btn-primary btn-circle text-uppercase"
                                                        OnClick="btnExerciseExit_Click"> <span class="glyphicon glyphicon-log-out"></span>EXIT</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav tabs -->
                            <!-- Tab panes -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
