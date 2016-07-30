<%@ Page Title="" Language="C#" MasterPageFile="~/Student/StudentMasterPage.Master"
    AutoEventWireup="true" CodeBehind="student-profile.aspx.cs" Inherits="PresentationLayer.Student.student_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            STUDENT PROFILE
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-3  " align="center">
                                <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive"
                                    width="200px" height="250px;" /></div>
                            <!--<div class="col-xs-10 col-sm-10 hidden-xs hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                            <div class=" col-xs-9">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-th-list">
                                                        </span>PERSONEL - INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                        </div>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
                                                                <td width="29%">
                                                                    <label for="email19">
                                                                        STUDENT - ID
                                                                    </label>
                                                                </td>
                                                                <td width="25%">
                                                                    <input type="text" name="input8" id="txtStudentID" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="29%">
                                                                    <label for="pwd14">
                                                                        FIRST NAME</label>
                                                                </td>
                                                                <td width="25%">
                                                                     <input type="text" name="input8" id="txtStudentFName" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email18">
                                                                        LAST NAME</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentLName" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd13">
                                                                        FATHER NAME</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentFatherName" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email15">
                                                                        MOTHER-MAIDEN NAME</label>
                                                                </td>
                                                                <td>
                                                                     <input type="text" name="input8" id="txtStudentMName" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd10">
                                                                        DOB</label>
                                                                </td>
                                                                <td>
                                                                     <input type="text" name="input8" id="txtStudentDOB" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email10">
                                                                        PLACE OF BIRTH</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentPOB" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd9">
                                                                        PHOTO-ID-TYPE</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentPIT" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email9">
                                                                        PHOTO - ID - NUMBER</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentIDNumber" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        EDUCATION</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentEducation" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email9">
                                                                        TECH - SKILLS</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentTechSkills" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        MOBILE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                     <input type="text" name="input8" id="txtStudentMobile" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        PHONE
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentPhone" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email8">
                                                                        EMAIL ID</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="input8" id="txtStudentEmail" tabindex="1" class="form-control" runat="server" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-road">
                                                        </span>ADDRESS - INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            UNIT/FLATNO
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                       <input type="text" name="input8" id="txtAddressFlatNO" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            HNO/DNO/PLOT.NO</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtAddressPlotNO" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email18">
                                                                            STRET NO
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                         <input type="text" name="input8" id="txtAddressStreetNo" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd13">
                                                                            STREET-NAME
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="txtAddressStreetName" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            BLDG-NAME/L-MARK</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="txtAddressBLDGLMark" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd10">
                                                                            VILLAGE/TOWN/CITY</label>
                                                                    </td>
                                                                    <td>
                                                                       <input type="text" name="input8" id="txtAddressVillage" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            MANDAL/TALUK/SUBURB</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="txtAddressMandal" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            DISTRICT</label>
                                                                    </td>
                                                                    <td>
                                                                       <input type="text" name="input8" id="txtAddressDistrict" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            STATE</label>
                                                                    </td>
                                                                    <td>
                                                                       <input type="text" name="input8" id="txtAddressState" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            COUNTRY</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="txtAddressCountry" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            PIN/POST-CODE</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="txtAddressPinCode" tabindex="1" class="form-control" runat="server" />
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
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsethree"><span class="glyphicon glyphicon-log-in">
                                                        </span>PROGRAM INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsethree" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            LOGIN ID
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                         <input type="text" name="input8" id="Text1" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            REG DATE</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text2" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            STATUS</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                         <input type="text" name="input8" id="Text3" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            STATUS DATE</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text4" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            REG CATEGORY</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text5" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            REG SUBJECTS</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text6" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            REG - LOC</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text7" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            ACCESS - CODE</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="Text8" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsefour"><span class="glyphicon glyphicon-log-in">
                                                        </span>STUDENT COMPANY INFORMATION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsefour" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            ACMP - ID</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                         <input type="text" name="input8" id="txtCompanyID" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            ACMP - NAME</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyName" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            ACMP-ADDRESS
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyAddress" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            ACMP - PHONE</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyPhone" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            ACMP - EMAIL
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                       <input type="text" name="input8" id="txtCompanyEmail" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            ACMP - ASND - DATE</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyASNDDate" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            ACMP - ASND - STATUS</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyASNDStatus" tabindex="1" class="form-control" runat="server" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            ACCESS - REMARKS</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="txtCompanyRemarks" tabindex="1" class="form-control" runat="server" />
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
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                    <tr>
                                        <td width="100%" colspan="2">
                                            <a href="#" class="btn btn-primary">Update</a>&nbsp;&nbsp;<a href="#" class="btn btn-primary">Cancel</a>
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
</asp:Content>
