<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Facutly-org-Class.aspx.cs" Inherits="PresentationLayer.Faculty.Facutly_org_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            ORGANIZING CLASS</h3>
                    </div>
                    <div class="panel-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="comment-tabs" style="width: 902px;">
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                                <h3 class="reviews text-capitalize">
                                                    <span class="glyphicon glyphicon glyphicon-th-list"></span>Class Information</h3>
                                            </a></li>
                                            <li><a href="#add-comment" role="tab" data-toggle="tab">
                                                <h3 class="reviews text-capitalize">
                                                    <span class="glyphicon glyphicon glyphicon-list"></span>Class Updation</h3>
                                            </a></li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="comments-logout">
                                                <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td width="40%">
                                                            <label for="pwd">
                                                                SELECT CATEGORY
                                                            </label>
                                                        </td>
                                                        <td width="60%">
                                                            <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd2">
                                                                SELECT SUBJECT
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSubject" class="form-control" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd2">
                                                                SELECT SCHEDULE
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlSchedule" class="form-control" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlSchedule_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd2">
                                                                SELECT COMPANY
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlCompany" class="form-control" runat="server" AutoPostBack="true"
                                                                OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <div class="panel panel-default">
                                                    <div class="panel-body">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
                                                            </tr>
                                                            <tr>
                                                                <td width="15%">
                                                                    <label for="email46">
                                                                        CTGY-ID:NAME
                                                                    </label>
                                                                </td>
                                                                <td width="15%">
                                                                  <asp:TextBox ID="txtCatIDName" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email47">
                                                                        SBJ-ID:NAME
                                                                    </label>
                                                                </td>
                                                                <td width="15%">
                                                                      <asp:TextBox ID="txtCatSubName" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td width="2%">
                                                                </td>
                                                                <td width="18%">
                                                                    <label for="email48">
                                                                        SBJ-CLS-TYPE
                                                                    </label>
                                                                </td>
                                                                <td width="15%">
                                                                      <asp:TextBox ID="txtCatClassType" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email49">
                                                                        SBJ-CLS-ACMP
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClassACMP" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email50">
                                                                        ACMP-LOC</label>
                                                                </td>
                                                                <td>
                                                                       <asp:TextBox ID="txtCatAcmpLOC" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email51">
                                                                        ACMP-PRSN
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatAcmpPerson" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email49">
                                                                        ACMP-PHONE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatAcmpPhone" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email50">
                                                                        ACMP-PRSN-MOBILE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatAcmpPrsnMobile" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email51">
                                                                        ACMP-EMAIL
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                       <asp:TextBox ID="txtCatAcmpEmail" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email8">
                                                                        CLS-START DATE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClsStartDate" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email9">
                                                                        CLS-END DATE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                       <asp:TextBox ID="txtCatClsEndDate" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email10">
                                                                        CLS-HRS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClsHrs" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email5">
                                                                        T—UNITS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                       <asp:TextBox ID="txtCatTotUnits" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email6">
                                                                        CLS-STATUS-DATE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClsStatusDate" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email7">
                                                                        CLS-STATUS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClsStatus" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email2">
                                                                        CLS-T-STUDENTS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                      <asp:TextBox ID="txtCatClsTotStudents" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email3">
                                                                        CLS-REMARKS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                       <asp:TextBox ID="txtCatClsRemarks" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                </td>
                                                                <td>
                                                                    <label for="email4">
                                                                        &nbsp;
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <div class="table-responsive">
                                                            <table id="mytable" class="table table-bordred table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <input type="checkbox" id="checkall" />
                                                                        </th>
                                                                        <th>
                                                                            STUD-ID:NAME
                                                                        </th>
                                                                        <th>
                                                                            STUD-LOC
                                                                        </th>
                                                                        <th>
                                                                            MOBILE
                                                                        </th>
                                                                        <th>
                                                                            PHONE
                                                                        </th>
                                                                        <th>
                                                                            EMAIL-ID
                                                                        </th>
                                                                        <th>
                                                                            STATUS
                                                                        </th>
                                                                        <th>
                                                                            STATUS-DATE
                                                                        </th>
                                                                        <th>
                                                                            T-CLSS
                                                                        </th>
                                                                        <th>
                                                                            CMPLTD-CLS
                                                                        </th>
                                                                        <th>
                                                                            INCMPLTED-CLSS
                                                                        </th>
                                                                        <th>
                                                                            REMARKS
                                                                        </th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="checkbox" id="checkall" />
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
                                                                        <td>
                                                                            xxxx xx
                                                                        </td>
                                                                        <td>
                                                                            xxxx xx
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
                                                                        <td>
                                                                            <input type="checkbox" id="checkall" />
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
                                                                        <td>
                                                                            xxxx xx
                                                                        </td>
                                                                        <td>
                                                                            xxxx xx
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
                                                                        <td>
                                                                            <input type="checkbox" id="checkall" />
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
                                                                        <td>
                                                                            xxxx xx
                                                                        </td>
                                                                        <td>
                                                                            xxxx xx
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
                                                                </tbody>
                                                            </table>
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                        <tr>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="8">
                                                                                <h4>
                                                                                    UNITS-CLASS -INFO
                                                                                </h4>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <div class="table-responsive">
                                                                        <table id="mytable" class="table table-bordred table-striped">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>
                                                                                        <input type="checkbox" id="checkall" />
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-NO
                                                                                    </th>
                                                                                    <th>
                                                                                        UNITNO:NAME
                                                                                    </th>
                                                                                    <th>
                                                                                        SCTN-NO:NAME :TOPICS
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS –CMNCED-DATE
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-FINSHD-DATE
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-DURATION
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS -CMNCD-TIME
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS -FNSHD-TIME
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-CMNCD-HRS
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-STATUS
                                                                                    </th>
                                                                                    <th>
                                                                                        CLS-STATUS DATE
                                                                                    </th>
                                                                                    <th>
                                                                                        REMARKS
                                                                                    </th>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>
                                                                                        <input type="checkbox" class="checkthis" />
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
                                                                                    <td>
                                                                                        xxxx xx
                                                                                    </td>
                                                                                    <td>
                                                                                        xxxx xx
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
                                                                                    <td>
                                                                                        <input type="checkbox" class="checkthis" />
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
                                                                                    <td>
                                                                                        xxxx xx
                                                                                    </td>
                                                                                    <td>
                                                                                        xxxx xx
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
                                                                                    <td>
                                                                                        <input type="checkbox" class="checkthis" />
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
                                                                                    <td>
                                                                                        xxxx xx
                                                                                    </td>
                                                                                    <td>
                                                                                        xxxx xx
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
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane active" id="add-comment">
                                                <br />
                                                <div class="panel panel-default">
                                                    <div class="panel-body">
                                                        <br />
                                                        <div class="table-responsive">
                                                            <table id="mytable" class="table table-bordred table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th>
                                                                            <input type="checkbox" id="checkall" />
                                                                        </th>
                                                                        <th>
                                                                            STUD-ID:NAME
                                                                        </th>
                                                                        <th>
                                                                            STUD-CLS-TYPE
                                                                        </th>
                                                                        <th>
                                                                            STUD-UNIT-CLS-STATUS
                                                                        </th>
                                                                        <th>
                                                                            STUD-UNIT-CLS-STATUS-DATE
                                                                        </th>
                                                                        <th>
                                                                            STUD-STATUS-REASON
                                                                        </th>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="checkbox" id="checkall" />
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
                                                                        <th>
                                                                            <input type="checkbox" id="checkall" />
                                                                        </th>
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
                                                                        <th>
                                                                            <input type="checkbox" id="checkall" />
                                                                        </th>
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
                                                                </tbody>
                                                            </table>
                                                            <div class="panel panel-default">
                                                                <div class="panel-body">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                        <tr>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="8">
                                                                                <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <label for="pwd2">
                                                                                                SELECT UNIT
                                                                                            </label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                                                <option value="service">b</option>
                                                                                                <option value="suggestions">c</option>
                                                                                                <option value="product">d</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <label for="pwd2">
                                                                                                SELECT CLS-NO
                                                                                            </label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <select id="subject2" name="subject2" class="form-control" required="required">
                                                                                                <option value="na" selected="selected">Select subject from List</option>
                                                                                                <option value="service">b</option>
                                                                                                <option value="suggestions">c</option>
                                                                                                <option value="product">d</option>
                                                                                            </select>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                        <tr>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="15%">
                                                                                <label for="email46">
                                                                                    CLS-T-STUDENTS
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
                                                                                    UNITNO:NAME
                                                                                </label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input23" id="input23" tabindex="1" class="form-control"
                                                                                    placeholder="" value="" />
                                                                            </td>
                                                                            <td width="2%">
                                                                            </td>
                                                                            <td width="18%">
                                                                                <label for="email48">
                                                                                    SCTN-NO:NAME
                                                                                </label>
                                                                            </td>
                                                                            <td width="15%">
                                                                                <input type="text" name="input19" id="input20" tabindex="1" class="form-control"
                                                                                    placeholder="" value="" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="email49">
                                                                                    SCTN-TOPICS
                                                                                </label>
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
                                                                                    CLS –CMNCED-DATE
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                                    placeholder="" value="" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <label for="email51">
                                                                                    CLS-FINSHD-DATE
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
                                                                                    CLS-DURATION
                                                                                </label>
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
                                                                                    CLS -CMNCD-TIME
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input23" id="input25" tabindex="1" class="form-control"
                                                                                    placeholder="" value="" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <label for="email51">
                                                                                    CLS -FNSHD-TIME
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                                                    placeholder="" value="" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="email8">
                                                                                    CLS-CMNCD-HRS
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input5" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <label for="email9">
                                                                                    CLS-STATUS
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input6" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <label for="email10">
                                                                                    CLS-STATUS DATE
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input5" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="email5">
                                                                                    CLS-NEW-START-DATE
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <label for="email6">
                                                                                    CLS-NEW-END-DATE
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input4" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <label for="email7">
                                                                                    CLS-NEW-START-TIME
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <label for="email2">
                                                                                    CLS-NEW-END-TIME
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <label for="email3">
                                                                                    CLS-NEW-CMNCD-HRS
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                            <td>
                                                                                <label for="email4">
                                                                                    CLS-REMARKS
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <input type="text" name="input" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                    value="" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                        <tr>
                                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                                    SAVE Record
                                                                                </button>
                                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    </td> </tr> </table>
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
        </div>
    </div>
</asp:Content>
