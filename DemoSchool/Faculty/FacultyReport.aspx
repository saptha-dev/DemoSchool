<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.Master"
    AutoEventWireup="true" CodeBehind="FacultyReport.aspx.cs" Inherits="PresentationLayer.Faculty.FacultyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center;">
                            CLASS-REPORT
                        </h3>
                    </div>
                    <div class="panel-body">
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
                                        <option value="service">b</option>
                                        <option value="suggestions">c</option>
                                        <option value="product">d</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="30%" colspan="2" align="center" valign="top">
                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                        VIEW REPORT
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit2">
                                        PRINT-REPORT
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                    <tr>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <h4>
                                                SUBJECT CLASS-INFO</h4>
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
                                                SBJ-ID:NAME
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
                                                T—UNITS
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
                                                CLS-TYPE
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
                                                CLS-START DATE
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
                                                CLS-END DATE
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
                                                CLS-TYPE
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
                                                CLS-DURATION
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
                                                CLS-START TIME
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
                                                CLS-END TIME
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
                                                CLS-HRS
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
                                                CLS-STATUS
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
                                                CLS-STATUS-DATE
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
                                        <td colspan="8">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <h4>
                                                SUBJECT CLASS-ACMP INFORMATION</h4>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="15%">
                                            <label for="email6">
                                                CLS-ACMP
                                            </label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input2" id="input" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td width="2%">
                                            &nbsp;
                                        </td>
                                        <td width="18%">
                                            <label for="email7">
                                                CLS-ACMP-LOCATION
                                            </label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td width="2%">
                                        </td>
                                        <td width="18%">
                                            <label for="email19">
                                                CLS-ACMP-PRSN
                                            </label>
                                        </td>
                                        <td width="15%">
                                            <input type="text" name="input2" id="input" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email20">
                                                CLS-ACMP-PHONE
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email21">
                                                CLS-ACMP-PRSN-MOBILE
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input4" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <label for="email22">
                                                CLS-ACMP-PRSN-EMAIL
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email20">
                                                CLS-T-STUDENTS
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <label for="email21">
                                                CLS-STRTD-T-STUDENTS
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input4" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <label for="email22">
                                                CLS-CMPLTD-T-STUDENTS
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                value="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="email23">
                                                CLS-REMARKS
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" name="input2" id="input7" tabindex="1" class="form-control" placeholder=""
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
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td colspan="8">
                                            <h4>
                                                CLASS STUDENTS LIST</h4>
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
                                                    ID:NAME
                                                </th>
                                                <th>
                                                    STUD-LOC
                                                </th>
                                                <th>
                                                    ACMP
                                                </th>
                                                <th>
                                                    ACMP-LOCATION
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
                                                    xxxx xx
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
                                                    xxx
                                                </td>
                                                <td>
                                                    xxxx xx
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
                                                    xxx
                                                </td>
                                                <td>
                                                    xxxx xx
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
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                    <tr>
                                        <td colspan="8">
                                            <h4>
                                                UNITS-CLASSES LIST
                                            </h4>
                                        </td>
                                    </tr>
                                </table>
                                </td> </tr> </table>
                                <div class="table-responsive">
                                    <table id="mytable" class="table table-bordred table-striped">
                                        <thead>
                                            <tr>
                                                <th>
                                                    CLSNO
                                                </th>
                                                <th>
                                                    UNITNO:NAME
                                                </th>
                                                <th>
                                                    SCTNNO:NAME
                                                </th>
                                                <th>
                                                    TOPICS
                                                </th>
                                                <th>
                                                    CLS-CMNCD-DATE
                                                </th>
                                                <th>
                                                    CLS-FNSHD-DATE
                                                </th>
                                                <th>
                                                    CLS-DURATION
                                                </th>
                                                <th>
                                                    CLS-CMNCD-TIME
                                                </th>
                                                <th>
                                                    CLS-FNSHD-TIME
                                                </th>
                                                <th>
                                                    CLS-CMNCD-HRS
                                                </th>
                                                <th>
                                                    CLS-STATUS
                                                </th>
                                                <th>
                                                    CLS-STATUS-DATE
                                                </th>
                                                <th>
                                                    CLS-CMPLTD-STUDS
                                                </th>
                                                <th>
                                                    CLS-CMPLTD-STUDS-ID:NAME
                                                </th>
                                                <th>
                                                    CLS-INCMPLTD-STUDS
                                                </th>
                                                <th>
                                                    CLS-INCMPLTD-STUDS-ID:NAMES
                                                </th>
                                                <th>
                                                    CLS-REMARKS
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
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
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
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
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
            <!-- Example row of columns -->
        </div>
    </div>
</asp:Content>
