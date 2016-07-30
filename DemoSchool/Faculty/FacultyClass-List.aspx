<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.Master"
    AutoEventWireup="true" CodeBehind="FacultyClass-List.aspx.cs" Inherits="PresentationLayer.Faculty.FacultyClass_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    CLASS-LIST</h3>
                            </div>
                            <div class="panel-body">
                                <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td width="40%">
                                            <label for="pwd">
                                                Select Category</label>
                                        </td>
                                        <td width="60%">
                                            <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="8">
                                                    <h4>
                                                        SELECT RECORD FROM TABLE
                                                    </h4>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="table-responsive">
                                            <table id="mytable" class="table table-bordred table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            &nbsp;
                                                        </th>
                                                        <th colspan="2" bgcolor="#990000">
                                                            Subject
                                                        </th>
                                                        <th colspan="6" bgcolor="#009900">
                                                            ACMP
                                                        </th>
                                                        <th colspan="11">
                                                            Subject Class
                                                        </th>
                                                        <tr>
                                                            <th>
                                                                <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>VIEW RECORD
                                                            </th>
                                                            <th bgcolor="#990000">
                                                                CTGY-ID:NAME
                                                            </th>
                                                            <th bgcolor="#990000">
                                                                ID:NAME
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                Name
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                Location
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                EMAIL
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                PHONE
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                PRSN
                                                            </th>
                                                            <th bgcolor="#009900">
                                                                PRSN-MOBILE
                                                            </th>
                                                            <th>
                                                                START DATE
                                                            </th>
                                                            <th>
                                                                END DATE
                                                            </th>
                                                            <th>
                                                                DURATION
                                                            </th>
                                                            <th>
                                                                UNITS
                                                            </th>
                                                            <th>
                                                                START TIME
                                                            </th>
                                                            <th>
                                                                END TIME
                                                            </th>
                                                            <th>
                                                                HRS
                                                            </th>
                                                            <th>
                                                                STATUS
                                                            </th>
                                                            <th>
                                                                STATUS-DATE
                                                            </th>
                                                            <th>
                                                                T-STUDENTS
                                                            </th>
                                                            <th>
                                                                REMARKS
                                                            </th>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <button class="btn btn-sm bg-success btn-circle text-uppercase" type="submit" id="submit">
                                                                <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>View</button>
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
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <button class="btn btn-sm bg-success btn-circle text-uppercase" type="submit" id="submit">
                                                                <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>View</button>
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
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <button class="btn btn-sm bg-success btn-circle text-uppercase" type="submit" id="submit">
                                                                <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>View</button>
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
                                                <td colspan="8">
                                                    <h4>
                                                        SUBJECT CLASS INFORMATION</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email46">
                                                        CTGY-ID:NAME
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
                                                        ID:NAME
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
                                                        CLS-TYPE
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
                                                        CLS-ACMP</label>
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
                                                        CLS-ACMP-ADRS
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
                                                        CLS-ACMP-PRSN
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
                                                        CLS-ACMP-PHONE
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
                                                        ACMP-PRSN-MOBILE
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
                                                        ACMP-EMAIL
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input19" id="input23" tabindex="1" class="form-control"
                                                        placeholder="" value="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email14">
                                                        CLS-START DATE
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
                                                    <label for="email15">
                                                        CLS-END DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input6" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email16">
                                                        CLS-DURATION
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input5" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email11">
                                                        CLS-START TIME
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
                                                    <label for="email12">
                                                        CLS-END TIME
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input4" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email13">
                                                        CLS-HRS
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input3" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email8">
                                                        T—UNITS
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
                                                    <label for="email9">
                                                        CLS-STATUS-DATE
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input2" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email10">
                                                        CLS-STATUS (NEW/ASGND/STRTD /HOLD/CNCLD/CMPLTD)
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email17">
                                                        CLS-T-STUDENTS
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input7" tabindex="1" class="form-control" placeholder=""
                                                        value="" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email18">
                                                        CLS-REMARKS
                                                    </label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input" id="input8" tabindex="1" class="form-control" placeholder=""
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
                                                            <input type="checkbox" class="checkthis" />
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
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                        </div>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                            <tr>
                                                <td width="100%">
                                                    <h4>
                                                        UNITS-CLASS -INFO
                                                    </h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="table-responsive">
                                                        <table id="mytable3" class="table table-bordred table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>
                                                                        <input type="checkbox" id="checkall" />
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
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" class="checkthis" />
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
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" class="checkthis" />
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
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="checkbox" class="checkthis" />
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
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                        <tr>
                                                            <td width="30%" colspan="2" align="center" valign="top">
                                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                                                    START-SUBJECT-CLASS
                                                                </button>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
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
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
