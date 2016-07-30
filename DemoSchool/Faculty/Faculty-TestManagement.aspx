<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Faculty-TestManagement.aspx.cs" Inherits="PresentationLayer.Faculty.Faculty_TestManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            CLASS TASKS
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="comment-tabs" style="width: 902px;">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                                <h3 class="reviews text-capitalize">
                                                    <span class="glyphicon glyphicon glyphicon-tasks"></span>Task Creation</h3>
                                            </a></li>
                                            <li><a href="#add-comment" role="tab" data-toggle="tab">
                                                <h3 class="reviews text-capitalize">
                                                    <span class="glyphicon glyphicon glyphicon-tasks"></span>Task Assignment</h3>
                                            </a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="comments-logout">
                                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td colspan="2">
                                                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="60%" height="40" colspan="2" align="center" valign="middle">
                                                                        <h4>
                                                                            <input type="radio" name="radio" id="radio" value="radio" />
                                                                            <label for="pwd2">
                                                                                ADD</label>
                                                                            <input type="radio" name="radio" id="radio" value="radio" />
                                                                            <label for="pwd2">
                                                                                EDIT</label>
                                                                            <input type="radio" name="radio" id="radio" value="radio" />
                                                                            <label for="pwd2">
                                                                                DELETE</label>
                                                                        </h4>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                SELECT CATEGORY
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                <option value="service">b</option>
                                                                <option value="suggestions">c</option>
                                                                <option value="product">d</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                SELECT CLASS
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                <option value="service">b</option>
                                                                <option value="suggestions">c</option>
                                                                <option value="product">d</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                SELECT TASK-TYPE
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <select id="subject" name="subject" class="form-control" required="required">
                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                <option value="service">PROJECT</option>
                                                                <option value="suggestions">CASE STUDY</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER TASK – NAME
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER START-DATE
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER END-DATE
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER DURATION
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER STATUS
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER STATUS-DATE
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                ENTER TASK-DESCRIPTION
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <textarea type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                placeholder="" value="" /></textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td colspan="2" align="center" valign="top">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                            <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                SAVE
                                                            </button>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="tab-pane active" id="add-comment">
                                                <br />
                                                <div class="panel panel-default">
                                                    <div class="panel-body">
                                                        <br />
                                                        <div class="table-responsive">
                                                            <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="40%">
                                                                        <label for="pwd">
                                                                            SELECT CATEGORY
                                                                        </label>
                                                                    </td>
                                                                    <td width="60%">
                                                                        <select id="subject" name="subject" class="form-control" required="required">
                                                                            <option value="na" selected="selected">Select subject from List</option>
                                                                            <option value="service">b</option>
                                                                            <option value="suggestions">c</option>
                                                                            <option value="product">d</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="40%">
                                                                        <label for="pwd">
                                                                            SELECT SUBJECT
                                                                        </label>
                                                                    </td>
                                                                    <td width="60%">
                                                                        <select id="subject" name="subject" class="form-control" required="required">
                                                                            <option value="na" selected="selected">Select subject from List</option>
                                                                            <option value="service">PROJECT</option>
                                                                            <option value="suggestions">CASE STUDY</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="40%">
                                                                        <label for="pwd">
                                                                            SELECT TASK TYPE
                                                                        </label>
                                                                    </td>
                                                                    <td width="60%">
                                                                        <select id="subject" name="subject" class="form-control" required="required">
                                                                            <option value="na" selected="selected">Select subject from List</option>
                                                                            <option value="service">PROJECT</option>
                                                                            <option value="suggestions">CASE STUDY</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="40%">
                                                                        <label for="pwd">
                                                                            SELECT TASK-NAME
                                                                        </label>
                                                                    </td>
                                                                    <td width="60%">
                                                                        <select id="subject" name="subject" class="form-control" required="required">
                                                                            <option value="na" selected="selected">Select subject from List</option>
                                                                            <option value="service">xxx</option>
                                                                            <option value="suggestions">xxxxx</option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="30%" colspan="2" align="center" valign="top">
                                                                        <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                            Display
                                                                        </button>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="center" valign="top">
                                                                        <h4>
                                                                            ASSIGN TASK TO STUDENTS
                                                                        </h4>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col-xs-4">
                                                                        <div class="panel panel-info">
                                                                            <div class="panel-heading">
                                                                                <h3 class="panel-title">
                                                                                    CATEGORY DETAILS
                                                                                </h3>
                                                                            </div>
                                                                            <div class="panel-body">
                                                                                <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                CATEGORY NAME</label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                                                <option value="service">b</option>
                                                                                                <option value="suggestions">c</option>
                                                                                                <option value="product">d</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                SUBJECT NAME
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                                                <option value="service">b</option>
                                                                                                <option value="suggestions">c</option>
                                                                                                <option value="product">d</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                TASK-TYPE
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                TASK NAME
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                START-DATE
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                END-DATE
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                DURATION
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                STATUS</label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="40%">
                                                                                            <label for="pwd5">
                                                                                                TASK-DESCRIPTION
                                                                                            </label>
                                                                                        </td>
                                                                                        <td width="60%">
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="service">PROJECT</option>
                                                                                                <option value="suggestions">CASE STUDY</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-2">
                                                                        <div style="margin-top: 250px; width: 90%; text-align: center;">
                                                                            <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submit">
                                                                                ASSIGN-TASK
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-xs-4" style="width: 300px">
                                                                        <div class="panel panel-info">
                                                                            <div class="panel-heading">
                                                                                <h3 class="panel-title">
                                                                                    SELECT STUDENTS
                                                                                </h3>
                                                                            </div>
                                                                            <div class="panel-body" style="height: 445PX;">
                                                                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                                    <tr>
                                                                                        <td width="7%" align="left" valign="middle">
                                                                                            <input type="checkbox" id="checkall" />
                                                                                        </td>
                                                                                        <td width="93%" align="left" valign="middle">
                                                                                            <label for="pwd4">
                                                                                                Student Name</label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="7%" align="left" valign="middle">
                                                                                            <input type="checkbox" id="checkall2" />
                                                                                        </td>
                                                                                        <td width="93%" align="left" valign="middle">
                                                                                            <label for="pwd4">
                                                                                                Student Name</label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="7%" align="left" valign="middle">
                                                                                            <input type="checkbox" id="checkall3" />
                                                                                        </td>
                                                                                        <td width="93%" align="left" valign="middle">
                                                                                            <label for="pwd4">
                                                                                                Student Name</label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td width="7%" align="left" valign="middle">
                                                                                            <input type="checkbox" id="checkall4" />
                                                                                        </td>
                                                                                        <td width="93%" align="left" valign="middle">
                                                                                            <label for="pwd4">
                                                                                                Student Name</label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="8">
                                                                        <h4>
                                                                            STUDENT-TASK-ASSIGNED-LIST
                                                                        </h4>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table id="mytable" class="table table-bordred table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            STUD-ID:NAME
                                                                        </th>
                                                                        <th>
                                                                            STUD-CTGY
                                                                        </th>
                                                                        <th>
                                                                            STUD-SUBJECT
                                                                        </th>
                                                                        <th>
                                                                            STUD-TASK-TYPE
                                                                        </th>
                                                                        <th>
                                                                            STUD-TASK-NAME
                                                                        </th>
                                                                        <th>
                                                                            STUD-ASND-DATE
                                                                        </th>
                                                                        <th>
                                                                            STUD-TASK-STATUS
                                                                        </th>
                                                                        <th>
                                                                            STUD-TASK-STATUS-DATE
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
                                                                            xxxx
                                                                        </td>
                                                                        <td>
                                                                            xxxx xx
                                                                        </td>
                                                                        <td>
                                                                            xxxx xx
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
                                                                    </tr>
                                                                    <tr>
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
                                                                    </tr>
                                                                    <tr>
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
            </div>
        </div>
    </div>
    </div> </div> </div>
</asp:Content>
