<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Student-real-test.aspx.cs" Inherits="PresentationLayer.Student.Student_real_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            REAL TEST
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12  ">
                                <div class="comment-tabs">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon-th-list"></span>RT-BOOKING</h3>
                                        </a></li>
                                        <li><a href="#add-comment" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon-blackboard"></span>RT-COMMENCE
                                            </h3>
                                        </a></li>
                                        <li><a href="#report" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon-list-alt"></span>RT-REPORT
                                            </h3>
                                        </a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="comments-logout">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-xs-11">
                                                        <br />
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading text-center">
                                                                REAL TEST-BOOKING
                                                            </div>
                                                            <div class="panel-body">
                                                                <table width="42%" height="35" border="0" align="center" cellpadding="0" cellspacing="0"
                                                                    class="formtable">
                                                                    <tr>
                                                                        <td width="35%" valign="middle">
                                                                            <asp:RadioButtonList ID="rdbBooking" runat="server" RepeatDirection="Horizontal"
                                                                                AutoPostBack="true">
                                                                                <asp:ListItem Text="New-booking" Selected="True" Value="1"></asp:ListItem>
                                                                                <asp:ListItem Text="Update-booking" Value="2"></asp:ListItem>
                                                                            </asp:RadioButtonList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="46%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                    <tr>
                                                                        <td width="50%">
                                                                            <label for="pwd">
                                                                                Select Category</label>
                                                                        </td>
                                                                        <td width="50%">
                                                                            <asp:DropDownList ID="ddlCategoryBkng" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlCategoryBkng_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                Select Subject</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlSubjectBkng" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlSubjectBkng_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd3">
                                                                                SELECT RT-BK-DATE</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlRTBKDate" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlRTBKDate_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT RT-BK-SLOT</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlRTBKSlot" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlRTBKSlot_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT RT-BK-TIME
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlRTBKTime" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlRTBKTime_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT RT- ACMP LOCATION
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlACMPLocation" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlACMPLocation_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT RT-BKG-STATUS
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                                <option value="na" selected="selected">Select enquiry from List</option>
                                                                                <option value="service">NEW BK</option>
                                                                                <option value="suggestions">CHANGE-BK</option>
                                                                                <option value="product">CANCEL-BK</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT NEW BK-DATE</label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                                <option value="na" selected="selected">IF DIFFERENT FROM ACMP</option>
                                                                                <option value="product">d</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                SELECT NEW BK-SLOT
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                                <option value="na" selected="selected">Select enquiry from List</option>
                                                                                <option value="service">NEW BK</option>
                                                                                <option value="suggestions">CHANGE-BK</option>
                                                                                <option value="product">CANCEL-BK</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                    <tr>
                                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                                            <asp:Button ID="btnbook" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                                                Text="Book" OnClick="btnbook_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                    <tr>
                                                                        <td>
                                                                            <h4>
                                                                                BOOKING LIST</h4>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div class="table-responsive">
                                                                    <table id="mytable2" class="table table-bordred table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>
                                                                                    <input name="" type="checkbox" value="" />
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK ID:NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-SBJ ID:NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-DATE:SLOT:SSN:TIME
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-LOCN
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-ACMP
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-STATUS
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-STATUS DATE
                                                                                </th>
                                                                                <th>
                                                                                    RT-NEW-BK-DATE
                                                                                </th>
                                                                                <th>
                                                                                    RT-NEW BK SLOT:SSN:TIME
                                                                                </th>
                                                                                <th>
                                                                                    RT-STATUS:DATE
                                                                                </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                        <tr>
                                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit4">
                                                                                    UPDATE</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading text-center">
                                                                REAL TEST LOGIN</div>
                                                            <div class="panel-body">
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                            <tr>
                                                                                <td width="15%">
                                                                                    <label for="email2">
                                                                                        CMP-ID
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
                                                                                        CMP-NAME
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
                                                                                        CMP-STATUS</label>
                                                                                </td>
                                                                                <td width="15%">
                                                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                                        value="" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                                <table width="46%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                    <tr>
                                                                        <td width="50%">
                                                                            <label for="email">
                                                                                STD-RT-BK ID
                                                                            </label>
                                                                        </td>
                                                                        <td width="50%">
                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                <option value="na" selected="selected">Select category from List</option>
                                                                                <option value="service">b</option>
                                                                                <option value="suggestions">c</option>
                                                                                <option value="product">d</option>
                                                                                <option value="product">d</option>
                                                                                <option value="product">d</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                STD-LOGIN ID
                                                                            </label>
                                                                        </td>
                                                                        <td>
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
                                                                            <label for="pwd3">
                                                                                CMP-LOGIN-ID</label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject3" name="subject3" class="form-control" required="required">
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
                                                                                CMP-PWD</label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                                <option value="na" selected="selected">Select enquiry from List</option>
                                                                                <option value="service">b</option>
                                                                                <option value="suggestions">c</option>
                                                                                <option value="product">d</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="email">
                                                                                RT-BK-AUTH-CODE
                                                                            </label>
                                                                        </td>
                                                                        <td>
                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                <option value="na" selected="selected">Select category from List</option>
                                                                                <option value="service">b</option>
                                                                                <option value="suggestions">c</option>
                                                                                <option value="product">d</option>
                                                                                <option value="product">d</option>
                                                                                <option value="product">d</option>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                    <tr>
                                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                                            <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit3">
                                                                                <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span>LOGIN</button>
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit4">
                                                                                <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>CANCEL</button>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div class="table-responsive">
                                                                    <table id="mytable2" class="table table-bordred table-striped">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>
                                                                                    <input name="" type="checkbox" value="" />
                                                                                </th>
                                                                                <th>
                                                                                    RT-ID
                                                                                </th>
                                                                                <th>
                                                                                    RT-STUD-ID:NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-CMP-NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-SBJ-CTGYID:NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-SBJ-ID:RT-SBJ-NAME
                                                                                </th>
                                                                                <th>
                                                                                    RT-BK-ID
                                                                                </th>
                                                                                <th>
                                                                                    RT-BKG-DATE
                                                                                </th>
                                                                                <th>
                                                                                    RT-BKG-SLOT:SSN:TIME
                                                                                </th>
                                                                                <th>
                                                                                    RT-STATUS
                                                                                </th>
                                                                                <th>
                                                                                    RT-STATUS-DATE
                                                                                </th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                                    <input name="" type="checkbox" value="" />
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
                                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                        <tr>
                                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit4">
                                                                                    LOAD RT</button>
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
                                        <div class="tab-pane" id="add-comment">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-xs-11">
                                                        <br />
                                                        <table width="48%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                            <tr>
                                                                <td width="48%">
                                                                    <label for="pwd">
                                                                        SELECT CATEGORY
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
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd">
                                                                        SELECT SUBJECT
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <select id="subject" name="subject" class="form-control" required="required">
                                                                        <option value="na" selected="selected">Select enquiry from List</option>
                                                                        <option value="service">b</option>
                                                                        <option value="suggestions">c</option>
                                                                        <option value="product">d</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
                                                                <td>
                                                                    <h4>
                                                                        BOOKING LIST</h4>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <div class="table-responsive">
                                                            <table id="mytable2" class="table table-bordred table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <input name="" type="checkbox" value="" />
                                                                        </th>
                                                                        <th>
                                                                            RT-BK ID:NAME
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-SBJ ID:NAME
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-DATE:SLOT:SSN:TIME
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-LOCN
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-ACMP
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-STATUS
                                                                        </th>
                                                                        <th>
                                                                            RT-BK-STATUS DATE
                                                                        </th>
                                                                        <th>
                                                                            RT-NEW-BK-DATE
                                                                        </th>
                                                                        <th>
                                                                            RT-NEW BK SLOT:SSN:TIME
                                                                        </th>
                                                                        <th>
                                                                            RT-STATUS:DATE
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input name="" type="checkbox" value="" />
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
                                                                            <input name="" type="checkbox" value="" />
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
                                                                            <input name="" type="checkbox" value="" />
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
                                                            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="30%" colspan="2" align="center" valign="top">
                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit4">
                                                                            LOAD</button>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading text-center">
                                                                REAL TEST LOADING
                                                            </div>
                                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                                <div class="panel-body">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                        style="background-color: #CCC;">
                                                                        <tr>
                                                                            <td width="25%">
                                                                                <label for="email7">
                                                                                    RT-STUD-ID: NAME
                                                                                </label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input6" id="input4" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="20%">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="25%">
                                                                                <label for="email8">
                                                                                    RT-CMP ID:NAME
                                                                                </label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input4" id="input5" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <hr />
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                        style="background-color: #CCC;">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <label for="email10">
                                                                                    RT-BK-ID</label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="2%">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="18%">
                                                                                <label for="email11">
                                                                                    RT-BK-DATE</label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input7" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="2%">
                                                                            </td>
                                                                            <td width="18%">
                                                                                <label for="email12">
                                                                                    BK-SLOT:</label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <hr />
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                        style="background-color: #CCC;">
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <label for="email10">
                                                                                    BK-SESSON: RT-BK-TIME</label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="2%">
                                                                                &nbsp;
                                                                            </td>
                                                                            <td width="18%">
                                                                                <label for="email11">
                                                                                    RT-CTGY ID:NAME
                                                                                </label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input7" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="2%">
                                                                            </td>
                                                                            <td width="18%">
                                                                                <label for="email12">
                                                                                    RT-SBJ ID:NAME</label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input5" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <hr />
                                                                    <table width="72%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                        <tr>
                                                                            <td width="38%">
                                                                                <label for="pwd8">
                                                                                    RT-ID</label>
                                                                            </td>
                                                                            <td width="31%">
                                                                                <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td width="31%">
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="pwd8">
                                                                                    RT-ALLOWED TIME</label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input3" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="pwd10">
                                                                                    RT-QSTNS</label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input7" id="input8" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="pwd9">
                                                                                    RT-TYPE</label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input7" id="input8" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                        <tr>
                                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit3">
                                                                                    RT-COMMENCE</button>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit3">
                                                                                    CANCEL</button>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-road">
                                                                    </span>REAL TEST</a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                                style="background-color: #CCC;">
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email7">
                                                                                            RT-STUD-ID:NAME
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input4" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <label for="email8">
                                                                                            RT-CMP ID:NAME</label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input4" id="input7" tabindex="1" class="form-control" placeholder=""
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
                                                                                <tr>
                                                                                    <td width="15%">
                                                                                        <label for="email14">
                                                                                            RT-BK-ID</label>
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        <input type="text" name="input10" id="input15" tabindex="1" class="form-control"
                                                                                            placeholder="" value="" />
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td width="18%">
                                                                                        <label for="email15">
                                                                                            RT-BK-DATE</label>
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        <input type="text" name="input10" id="input16" tabindex="1" class="form-control"
                                                                                            placeholder="" value="" />
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                    </td>
                                                                                    <td width="18%">
                                                                                        <label for="email16">
                                                                                            BK-SLOT</label>
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        <input type="text" name="input10" id="input15" tabindex="1" class="form-control"
                                                                                            placeholder="" value="" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email2">
                                                                                            BK-SESSION</label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input4" id="input4" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <label for="email5">
                                                                                            BK-TIME</label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input4" id="input5" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                    <td>
                                                                                    </td>
                                                                                    <td>
                                                                                        <label for="email6">
                                                                                            BK-STATUS</label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input4" id="input4" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="4">
                                                                                        <label for="email2">
                                                                                            RT CATEGORY ID:NAME:GROUP:SEM:SUBJECT</label>
                                                                                    </td>
                                                                                    <td colspan="4">
                                                                                        <input type="text" name="input5" id="input8" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                                style="background-color: #CCC;">
                                                                                <tr>
                                                                                    <td width="15%">
                                                                                        <label for="email26">
                                                                                            RT-ID:
                                                                                        </label>
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        <input type="text" name="input2" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td width="18%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                    </td>
                                                                                    <td width="18%">
                                                                                        <label for="email28">
                                                                                            RT-TIME
                                                                                        </label>
                                                                                    </td>
                                                                                    <td width="15%">
                                                                                        <input type="text" name="input2" id="input3" tabindex="1" class="form-control" placeholder="3 Hours"
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
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
                                                                                    </td>
                                                                                    <td>
                                                                                        <label for="email28">
                                                                                            RT-SYS TIME:00:00:00
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input3" id="input19" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-default">
                                                                        <div class="panel-body">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                                style="background-color: #CCC;">
                                                                                <tr>
                                                                                    <td width="21%">
                                                                                        <label for="email29">
                                                                                            <strong>RT-QSN-NO:NAME </strong>
                                                                                        </label>
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email29">
                                                                                            [OPTION-(A)]:
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email29">
                                                                                            [OPTION-(B)]:
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email29">
                                                                                            [OPTION-(C)]:
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email29">
                                                                                            [OPTION-(D)]:
                                                                                        </label>
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <label for="email29">
                                                                                            [OPTION-(E)]:
                                                                                        </label>
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
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                                                style="background-color: #CCC;">
                                                                                <tr>
                                                                                    <td width="21%">
                                                                                        <label for="email31">
                                                                                            <strong>STD-RT-ANSWER: </strong>
                                                                                        </label>
                                                                                    </td>
                                                                                    <td width="2%">
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="text" name="input12" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                            value="" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        &nbsp;
                                                                                    </td>
                                                                                    <td>
                                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                                            <span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>Previous</button>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                                            <span class="glyphicon glyphicon-play" aria-hidden="true"></span>Start</button>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                                            <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>Save</button>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                                            <span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>Next</button>
                                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                        <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit2">
                                                                                            <span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>Exit</button>
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
                                        <div class="tab-pane" id="report">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div class="container">
                                                        <div class="row">
                                                            <div class="col-xs-11">
                                                                <br />
                                                                <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                Select Category</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlCategoryRpot" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlCategoryRpot_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                Select Year</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DDlYearRpot" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="DDlYearRpot_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="pwd">
                                                                                Select Subject</label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlSubjectRpot" class="form-control" runat="server" AutoPostBack="true"
                                                                                OnSelectedIndexChanged="ddlSubjectRpot_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div class="panel panel-info">
                                                                    <div class="panel-heading text-center">
                                                                        REAL TEST REPORT</div>
                                                                    <div class="panel-body">
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-body">
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                                    <tr>
                                                                                        <td width="15%">
                                                                                            <label for="email2">
                                                                                                RT-ID
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
                                                                                                RT-CTGY ID:NAME</label>
                                                                                        </td>
                                                                                        <td width="15%">
                                                                                            <input type="text" name="input" id="input9" tabindex="1" class="form-control" placeholder=""
                                                                                                value="" />
                                                                                        </td>
                                                                                        <td width="2%">
                                                                                        </td>
                                                                                        <td width="18%">
                                                                                            <label for="email5">
                                                                                                RT-SBJ ID:NAME</label>
                                                                                        </td>
                                                                                        <td width="15%">
                                                                                            <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                                                value="" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <label for="email12">
                                                                                                RT-BK ID:SLOT
                                                                                            </label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTBkngID" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email14">
                                                                                                RT-DATE</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTBkngDate" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email17">
                                                                                                RT-SLOT</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTBnkgSlot" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <label for="email20">
                                                                                                RT-T-QSTNS</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTTotQstns" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email21">
                                                                                                RT-ANSRD-QSTNS
                                                                                            </label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTAnsQstns" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email22">
                                                                                                RT-UNANSRD-QSTNS</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTUnAnsQstns" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <label for="email20">
                                                                                                RT-CRCT-ANS</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTCrctAns" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email21">
                                                                                                RT-INCRCT-ANS</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTInCorrectAns" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                        <td>
                                                                                        </td>
                                                                                        <td>
                                                                                            <label for="email22">
                                                                                                RT-STATUS</label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:TextBox ID="txtRTStatus" runat="server" class="form-control"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <div class="table-responsive">
                                                                                    <asp:GridView ID="GVQstns" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                                                        HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="10"
                                                                                        OnPageIndexChanging="GVQstns_PageIndexChanging">
                                                                                        <HeaderStyle Height="35px" Font-Size="14px" HorizontalAlign="Center" />
                                                                                        <Columns>
                                                                                            <asp:BoundField HeaderText="Qstn Name" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="Option-A" DataField="A" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="Option-B" DataField="B" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="Option-C" DataField="C" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="Option-D" DataField="D" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="Option-E" DataField="E" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="STD-ANSR" DataField="Ans" HeaderStyle-HorizontalAlign="Center" />
                                                                                            <asp:BoundField HeaderText="CRCT-ANSR" DataField="RealAns" HeaderStyle-HorizontalAlign="Center" />
                                                                                        </Columns>
                                                                                    </asp:GridView>
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
