<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty/FacultyMasterPage.Master"
    AutoEventWireup="true" CodeBehind="FacultyProfile.aspx.cs" Inherits="PresentationLayer.Faculty.FacultyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            FACULTY PROFILE
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
                                                        </span>FACULTY INFORMATION </a>
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
                                                                        FIRST NAME</label>
                                                                </td>
                                                                <td width="25%">
                                                                    <asp:TextBox ID="txtFirtsname" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td width="2%">
                                                                    &nbsp;
                                                                </td>
                                                                <td width="29%">
                                                                    <label for="pwd14">
                                                                        LAST NAME</label>
                                                                </td>
                                                                <td width="25%">
                                                                    <asp:TextBox ID="txtLName" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email18">
                                                                        FATHER NAME</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtFName" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd13">
                                                                        MOTHER-MAIDEN NAME</label>
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox ID="txtMName" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email15">
                                                                        DOB</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtDOB" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd10">
                                                                        POB</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPOB" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email10">
                                                                        MOBILE NO</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd9">
                                                                        PHONE NO</label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPhoneNo" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email9">
                                                                        EMAIL-ID
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        EDUCATION QUALIFICATON
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtEduQlfication" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email9">
                                                                        TECHNICAL SKILLS
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox ID="txtTechSkills" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        PROGRAM
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtprogram" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd8">
                                                                        TOT-WORK-EXP
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox ID="txtTotWorkExp" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <label for="email8">
                                                                        COMPANY OF WORKING/WORKED
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtCmpnyWorking" runat="server" class="form-control" ></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email8">
                                                                        PLACE OF WORK
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox ID="txtPlaceofwork" runat="server" class="form-control" ></asp:TextBox>
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
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-road">
                                                        </span>FACULTY ADDRESS INFORMATIION</a>
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
                                                                          <asp:TextBox ID="txtFlatNo" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            HNO/DNO/PLOT.NO</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                           <asp:TextBox ID="txtHno" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email18">
                                                                            STRET NAME
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                          <asp:TextBox ID="txtStreetName" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd13">
                                                                            VILLAGE/TOWN/CITY
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                          <asp:TextBox ID="txtVillage" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            MANDAL/TALUK/SUBURB
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                           <asp:TextBox ID="txtMandal" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd10">
                                                                            DISTRICT</label>
                                                                    </td>
                                                                    <td>
                                                                         <asp:TextBox ID="txtDistrict" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            STATE</label>
                                                                    </td>
                                                                    <td>
                                                                         <asp:TextBox ID="txtState" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            COUNTRY</label>
                                                                    </td>
                                                                    <td>
                                                                          <asp:TextBox ID="txtCountry" runat="server" class="form-control" ></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email9">
                                                                            PIN/POST CODE
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                           <asp:TextBox ID="txtPin" runat="server" class="form-control" ></asp:TextBox>
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
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapsefour"><span class="glyphicon glyphicon-log-in">
                                                        </span>FACULTY PROGRAM INFORMATIION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsefour" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            SUBJECT
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="input19" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            &nbsp;</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%">
                                                                        <label for="email19">
                                                                            LOGIN-ID
                                                                        </label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        <input type="text" name="input8" id="input19" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                    <td width="2%">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="20%">
                                                                        <label for="pwd14">
                                                                            &nbsp;</label>
                                                                    </td>
                                                                    <td width="29%">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email18">
                                                                            PASSWORD</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="input17" tabindex="1" class="form-control" placeholder=""
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
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email15">
                                                                            FCLTY ACCESS CODE
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input8" id="input15" tabindex="1" class="form-control" placeholder=""
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
