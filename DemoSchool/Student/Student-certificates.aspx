<%@ Page Title="" Language="C#"  AutoEventWireup="true" MasterPageFile="~/Student/StudentMasterPage.Master"
    CodeBehind="Student-certificates.aspx.cs" Inherits="PresentationLayer.Student.Student_certificates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <link href='http://fonts.googleapis.com/css?family=Allura' rel='stylesheet' type='text/css'>
  <link href='http://fonts.googleapis.com/css?family=Great+Vibes' rel='stylesheet' type='text/css'>
  <link href="http://fonts.googleapis.com/css?family=Berkshire+Swash" rel="stylesheet" type="text/css">
   <style type="text/css">
  .certicatefont{ font-family: 'Great Vibes', cursive;}
   .certicatefont h1{ font: 600 40px/1.3 'ARIAL', Helvetica, sans-serif;
  color: #F00;
  text-shadow: 1px 1px 0px #ededed, 4px 4px 0px rgba(0,0,0,0.15);}
  .certicatefont p{font: 100 18px/1.3 'Berkshire Swash', Helvetica, sans-serif;
  color: #0070c0;line-height:42px;
  }
  .certicatetextbox{background: none;
  border: none;font-size:20px; color:#021c30;border-bottom:1px solid #021c30; padding:0px 4px;margin:0px 10px }
  .datetable{ font-family:Arial, Helvetica, sans-serif;}
   .datetable table tbody tr th{border:1px solid #03426f;font-size:12px;background:#0070c0;color:#FFF;padding:5px; }
   .datetable table tbody tr td{border:1px solid #03426f;font-size:11px;background:#fff;color:#FFF;padding:5px; }
   .resultbg{ background-image:url(../StudentImages/resultsbg.jpg); background-repeat:no-repeat; background-position:top center;}
   .gradebg{ background-image:url(../StudentImages/gradebg.jpg); background-repeat:no-repeat; background-position:top center;}
   .gradebg p{color:#5e4503;}
    .trainingbg{ background-image:url(../StudentImages/trainingbg.jpg); background-repeat:no-repeat; background-position:top center;}
   .trainingbg p{color:#246206;}
  </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            MY-CERTIFICATES
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                    data-toggle="tab"><span class="glyphicon glyphicon-file" aria-hidden="true"></span>
                                    TRAINING</a></li>
                                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>RESULTS</a></li>
                                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">
                                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>GRADE</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="home">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="3px" class="formtable">
                                        <tr>
                                            <td width="52%" style="padding: 10px;">
                                                <label for="pwd">
                                                    SELECT CATEGORY
                                                </label>
                                            </td>
                                            <td width="48%" >
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
                                                <label for="pwd2">
                                                    SELECT SUBJECT
                                                </label>
                                            </td>
                                            <td>
                                                <select id="subject3" name="subject2" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select enquiry from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table align="center" width="900" border="1" style="border: 3px solid #246206;">
                                        <tr style="">
                                            <td height="697" align="center" valign="top">
                                                <div class="nobgfortable certicatefont trainingbg">
                                                    <table width="900" border="1">
                                                        <tr>
                                                            <td height="258" align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="90" align="center" valign="top">
                                                                <h1>
                                                                    TRAINING CERTIFICATE</h1>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                <table width="700" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="center">
                                                                            <p align="center">
                                                                                This is to certify that<img src="../StudentImages/photo.gif" width="140" height="158" style="float: right;" /><br />
                                                                                Mr./Ms.<strong>
                                                                                    <input name="textfield21" type="text" class="certicatetextbox" id="textfield21" value="Name"
                                                                                        size="30" />
                                                                                </strong>
                                                                                <br />
                                                                                S/O or D/O Mr./Mrs.<strong>
                                                                                    <input name="textfield21" type="text" class="certicatetextbox" id="textfield22" value="Name"
                                                                                        size="25" />
                                                                                </strong>
                                                                                <br />
                                                                                Registered
                                                                                <br />
                                                                                On<strong>
                                                                                    <input name="textfield22" type="text" class="certicatetextbox" id="textfield23" value="Date"
                                                                                        size="12" />
                                                                                </strong>With Registration- ID<input name="textfield22" type="text" class="certicatetextbox"
                                                                                    id="textfield23" value="Id" size="12" /><br />
                                                                                Have successfully completed the training at
                                                                                <br />
                                                                                Organization<input name="textfield22" type="text" class="certicatetextbox" id="textfield23"
                                                                                    value="Organization" size="12" /><br />
                                                                                Conducted
                                                                                <br />
                                                                                From<input name="textfield22" type="text" class="certicatetextbox" id="textfield23"
                                                                                    value="from" size="12" />
                                                                                To<input name="textfield22" type="text" class="certicatetextbox" id="textfield23"
                                                                                    value="to" size="12" />
                                                                                <br />
                                                                                In the<br />
                                                                                Subject<input name="textfield22" type="text" class="certicatetextbox" id="textfield23"
                                                                                    value="Subject" size="12" /><br />
                                                                                For the<br />
                                                                                Semester/Year
                                                                                <input name="textfield22" type="text" class="certicatetextbox" id="textfield23" value="Sem"
                                                                                    size="12" />of Group<input name="textfield22" type="text" class="certicatetextbox"
                                                                                        id="textfield23" value="Group" size="12" /><br />
                                                                                Under the
                                                                                <br />
                                                                                Category<input name="textfield22" type="text" class="certicatetextbox" id="textfield23"
                                                                                    value="Category" size="12" /></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <p>
                                                                                ISSUED ON:<strong>
                                                                                    <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="ISSUED  ON"
                                                                                        size="14" />
                                                                                </strong>
                                                                            </p>
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            <p>
                                                                                <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="Director Name"
                                                                                    size="20" /></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="448" height="120" align="left" valign="top">
                                                                            <p>
                                                                                MSDAQGRD<strong>
                                                                                    <input name="textfield9" type="text" class="certicatetextbox" id="textfield9" value="no"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <td width="283" align="center" valign="top">
                                                                                    <p style="color: #F00">
                                                                                        DIRECTOR</p>
                                                                                </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
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
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class=" glyphicon glyphicon-list-alt"></span>View
                                                </button>
                                                &nbsp;&nbsp;
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class="glyphicon glyphicon-print"></span>Print
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="profile">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td width="52%">
                                                <label for="pwd">
                                                    SELECT CATEGORY
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
                                                <label for="pwd2">
                                                    SELECT SUBJECT
                                                </label>
                                            </td>
                                            <td>
                                                <select id="subject3" name="subject2" class="form-control" required="required">
                                                    <option value="na" selected="selected">Select enquiry from List</option>
                                                    <option value="service">b</option>
                                                    <option value="suggestions">c</option>
                                                    <option value="product">d</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <table align="center" width="900" border="1" style="border: 3px solid #0d4aa2;">
                                        <tr style="">
                                            <td height="697" align="center" valign="top">
                                                <div class="nobgfortable certicatefont resultbg">
                                                    <table width="900" border="1">
                                                        <tr>
                                                            <td height="258" align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="90" align="center" valign="top">
                                                                <h1>
                                                                    RESULTS CERTIFICATE</h1>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                <table width="700" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="center">
                                                                            <p>
                                                                                <strong>This is to certify that the following result has been awarded to the </strong>
                                                                                <img src="../StudentImages/photo.gif" width="140" height="158" style="float: right;" /><br />
                                                                                <strong>Student
                                                                                    <label>
                                                                                        <input class="certicatetextbox" type="text" name="textfield" id="textfield" value="Name" />
                                                                                    </label>
                                                                                </strong>
                                                                                <br />
                                                                                <strong>With </strong>
                                                                                <br />
                                                                                <strong>Register Number<input name="textfield" type="text" class="certicatetextbox"
                                                                                    id="textfield" value="Number" size="10" />and Registered Date<input name="textfield"
                                                                                        type="text" class="certicatetextbox" id="textfield" value="Date" size="10" /></strong><br />
                                                                                <strong>In the Final Assessment conducted at</strong><br />
                                                                                <strong>Organization:
                                                                                    <input name="textfield3" type="text" class="certicatetextbox" id="textfield3" value="Organization"
                                                                                        size="20" />
                                                                                    on
                                                                                    <input name="textfield4" type="text" class="certicatetextbox" id="textfield4" value="Date"
                                                                                        size="8" />
                                                                                </strong>
                                                                                <br />
                                                                                <strong>In the </strong>
                                                                                <br />
                                                                                <strong>Subject
                                                                                    <input name="textfield2" type="text" class="certicatetextbox" id="textfield2" value="Subject"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <br />
                                                                                <strong>Under the</strong><br />
                                                                                <strong>Category
                                                                                    <input name="textfield7" type="text" class="certicatetextbox" id="textfield7" value="Category"
                                                                                        size="14" />
                                                                                    with Group
                                                                                    <input name="textfield5" type="text" class="certicatetextbox" id="textfield5" value="Group"
                                                                                        size="14" />
                                                                                    for the Semester/Year
                                                                                    <input name="textfield6" type="text" class="certicatetextbox" id="textfield6" value="Semester/Year"
                                                                                        size="14" />
                                                                                </strong>
                                                                            </p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td height="260" colspan="2" align="center" valign="top">
                                                                            <div class="datetable">
                                                                                <table width="760" border="1" align="center" class="datetable">
                                                                                    <tr>
                                                                                        <th width="75">
                                                                                            SUBJECT-NAME
                                                                                        </th>
                                                                                        <th width="108">
                                                                                            COMPLETION
                                                                                        </th>
                                                                                        <th width="57">
                                                                                            TOTAL QSTNS
                                                                                        </th>
                                                                                        <th width="95">
                                                                                            ANSWERED QSTNS
                                                                                        </th>
                                                                                        <th width="82">
                                                                                            CORRECT ANSWERS
                                                                                        </th>
                                                                                        <th width="64">
                                                                                            MARKS PER 100
                                                                                        </th>
                                                                                        <th width="75">
                                                                                            PERCENT
                                                                                        </th>
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
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="left" valign="top">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <p>
                                                                                ISSUED ON:<strong>
                                                                                    <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="ISSUED  ON"
                                                                                        size="14" />
                                                                                </strong>
                                                                            </p>
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            <p>
                                                                                <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="Director Name"
                                                                                    size="20" /></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="448" height="90" align="left" valign="top">
                                                                            <p>
                                                                                CERTIFICATE-ID:<strong>
                                                                                    <input name="textfield9" type="text" class="certicatetextbox" id="textfield9" value="CERTIFICATE"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <td width="283" align="center" valign="top">
                                                                                    <p style="color: #F00">
                                                                                        DIRECTOR</p>
                                                                                </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
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
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class=" glyphicon glyphicon-list-alt"></span>View
                                                </button>
                                                &nbsp;&nbsp;
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class="glyphicon glyphicon-print"></span>Print
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="messages">
                                    <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td width="52%">
                                                <label for="pwd">
                                                    SELECT CATEGORY
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
                                    </table>
                                    <br />
                                    <table align="center" width="900" border="1" style="border: 3px solid #dda108;">
                                        <tr style="">
                                            <td height="697" align="center" valign="top">
                                                <div class="nobgfortable certicatefont gradebg">
                                                    <table width="900" border="1">
                                                        <tr>
                                                            <td height="258" align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="90" align="center" valign="top">
                                                                <h1>
                                                                    GRADE CERTIFICATE</h1>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                <table width="700" border="0" cellpadding="0" cellspacing="0">
                                                                    <tr>
                                                                        <td colspan="2" align="center">
                                                                            <p align="center">
                                                                                This is to certify that<img src="../StudentImages/photo.gif" width="140" height="158" style="float: right;" /><br />
                                                                                Mr./Ms.<strong>
                                                                                    <input name="textfield10" type="text" class="certicatetextbox" id="textfield10" value="Name"
                                                                                        size="30" />
                                                                                </strong>
                                                                                <br />
                                                                                S/O or D/O Mr./Mrs.<strong>
                                                                                    <input name="textfield11" type="text" class="certicatetextbox" id="textfield11" value="Name"
                                                                                        size="25" />
                                                                                </strong>
                                                                                <br />
                                                                                Had been undergone training for the
                                                                                <br />
                                                                                <strong>
                                                                                    <input name="textfield12" type="text" class="certicatetextbox" id="textfield12" value="Training Details"
                                                                                        size="40" />
                                                                                </strong>
                                                                                <br />
                                                                                Through the organization<br />
                                                                                <strong>
                                                                                    <input name="textfield13" type="text" class="certicatetextbox" id="textfield13" value="Orgainzation"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <br />
                                                                                From <strong>
                                                                                    <input name="textfield14" type="text" class="certicatetextbox" id="textfield14" value="date"
                                                                                        size="14" />
                                                                                </strong>To<strong>
                                                                                    <input name="textfield15" type="text" class="certicatetextbox" id="textfield15" value="date"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <br />
                                                                                Vide with register ID<br />
                                                                                <strong>
                                                                                    <input name="textfield16" type="text" class="certicatetextbox" id="textfield16" value="Registered ID"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <br />
                                                                                And has successfully completed Assessments on all subjects of the said category<br />
                                                                                <strong>
                                                                                    <input name="textfield17" type="text" class="certicatetextbox" id="textfield17" value="Assessemnt details"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <br />
                                                                                On<br />
                                                                                <strong>
                                                                                    <input name="textfield18" type="text" class="certicatetextbox" id="textfield18" value="date"
                                                                                        size="20" />
                                                                                </strong>
                                                                                <br />
                                                                                By securing Cumulative Grade Percentage of<br />
                                                                                <strong>
                                                                                    <input name="textfield19" type="text" class="certicatetextbox" id="textfield19" value="Grade Precentage"
                                                                                        size="20" />
                                                                                </strong>
                                                                                <br />
                                                                                With Grade Award<br />
                                                                                <strong>
                                                                                    <input name="textfield20" type="text" class="certicatetextbox" id="textfield20" value="Group"
                                                                                        size="14" />
                                                                                </strong>
                                                                            </p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="left" valign="top">
                                                                            <p>
                                                                                ISSUED ON:<strong>
                                                                                    <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="ISSUED  ON"
                                                                                        size="14" />
                                                                                </strong>
                                                                            </p>
                                                                        </td>
                                                                        <td align="center" valign="top">
                                                                            <p>
                                                                                <input name="textfield8" type="text" class="certicatetextbox" id="textfield8" value="Director Name"
                                                                                    size="20" /></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="448" height="70" align="left" valign="top">
                                                                            <p>
                                                                                MSDAQGRD<strong>
                                                                                    <input name="textfield9" type="text" class="certicatetextbox" id="textfield9" value="no"
                                                                                        size="14" />
                                                                                </strong>
                                                                                <td width="283" align="center" valign="top">
                                                                                    <p style="color: #F00">
                                                                                        DIRECTOR</p>
                                                                                </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
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
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class=" glyphicon glyphicon-list-alt"></span>View
                                                </button>
                                                &nbsp;&nbsp;
                                                <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                    <span class="glyphicon glyphicon-print"></span>Print
                                                </button>
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

</asp:Content>
