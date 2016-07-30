<%@ Page Title="" Language="C#" MasterPageFile="~/Councillor/CouncillorMasterPage.Master"
    AutoEventWireup="true" CodeBehind="CouncillorProfile.aspx.cs" Inherits="PresentationLayer.Councellor.CouncillorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).redy(function () {
            var path = $("#" + '<%= aspImagePath.ClientID %>').val();
            alert(path);
        });

    </script>
    <script type="text/javascript">
        function SuccessPoPup() {
            alert("Successfully Updated");
        }
        function FailedPoPup() {

            alert("Update Failed");
        }

        function validateEmail(lnkUpdate) {
            var obj = document.getElementById('<%= txtEmail.ClientID %>');
            var regex = /^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$/;
            if (regex.test(obj.value)) {
                obj.style.backgroundColor = '';
                obj.style.backgroundColor = '';
                return true;
            }
            else {

                obj.style.backgroundColor = '#FD5E53';
                obj.style.borderColor = '#CD4A4A';
                alert("Update Failed");
                return false;
            }
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:HiddenField ID="aspImagePath" runat="server" />
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            Counsellor Profile</h3>
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-3  " align="center">
                                <asp:Image ID="ImagePath" runat="server" class="img-rounded img-responsive" Width="150"
                                    Height="150" />
                            </div>
                            <div class=" col-xs-9">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-th-list">
                                                        </span>COUNSELLOR INFORMATION </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                        </div>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                            <tr>
                                                                <td>
                                                                    <label for="counsellorId">
                                                                        <strong>Counsellor ID</strong></label>
                                                                </td>
                                                                <td>
                                                                    <label id="lblCounsellorId" runat="server" text="">
                                                                    </label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="42%">
                                                                    <label for="email">
                                                                        First Name</label>
                                                                </td>
                                                                <td width="58%">
                                                                    <input type="text" name="" id="txtFirstName" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd">
                                                                        Last Name</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="" id="txtLastName" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email2">
                                                                        Father's Name</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="2" id="txtFatherName" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd2">
                                                                        Mothers-Maiden Name</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="2" id="txtMotherName" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email4">
                                                                        Date of Birth</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="22" id="txtDOB" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd4">
                                                                        Place of Birth</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="22" id="txtPOB" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email3">
                                                                        Phone
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="22" id="txtLandLine" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="pwd3">
                                                                        Mobile</label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="22" id="txtMobile" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="email5">
                                                                        E-Mail
                                                                    </label>
                                                                </td>
                                                                <td>
                                                                    <input type="text" name="224" id="txtEmail" runat="server" tabindex="1" class="form-control"
                                                                        placeholder="" value="" />
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
                                                        </span>COUNSELLOR ADDRESS INFORMATIION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td colspan="2" style="border-bottom: solid 1px #CCC; height: 45px; padding-top: 25px;">
                                                                        <label for="email6">
                                                                            <strong>Address</strong></label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email13">
                                                                            Unit-No/Flat-No</label>
                                                                    </td>
                                                                    <td width="58%">
                                                                        <input type="text" name="input4" id="txtUnit_FlatNo" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd12">
                                                                            H.No/D.No/Plot-No</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input4" id="txtHouseNo_Plotno" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email7">
                                                                            Building-Name</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input" id="txtBuildingName" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="42%">
                                                                        <label for="pwd6">
                                                                            Street-No</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input" id="txtStreetNo" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd7">
                                                                            Street-Name</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="23" id="txtStreetName" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email8">
                                                                            Village/Town/City</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="23" id="txtVillage" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd8">
                                                                            Mandal/Taluk/Suburb</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="222" id="txtSubUrb" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email9">
                                                                            District</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="222" id="txtDistrict" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd9">
                                                                            State</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="223" id="txtState" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email10">
                                                                            Country
                                                                        </label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="223" id="txtCountry" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd10">
                                                                            Pin-Code</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="222" id="txtPinCode" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
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
                                                        </span>COUNSELLOR QUALIFICATION INFORMATIION</a>
                                                    </h4>
                                                </div>
                                                <div id="collapsefour" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="table-responsive">
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                <tr>
                                                                    <td colspan="2" style="border-bottom: solid 1px #CCC; height: 45px; padding-top: 25px;">
                                                                        <label for="email11">
                                                                            <strong>Education Details</strong></label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email14">
                                                                            Education</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input5" id="txtEducation" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="42%">
                                                                        <label for="email11">
                                                                            Technical</label>
                                                                    </td>
                                                                    <td width="58%">
                                                                        <input type="text" name="input2" id="txtTechnicalSkills" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="email12">
                                                                            Work-Experience</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="232" id="txtWorkExp" runat="server" tabindex="1" class="form-control"
                                                                            placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd11">
                                                                            Work-Company</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input2" id="txtEmployerName" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd11">
                                                                            Work-Phone</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input2" id="txtEmployerPhone" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd11">
                                                                            Work-Company-Address</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input2" id="txtEmployerAddress" runat="server" tabindex="1"
                                                                            class="form-control" placeholder="" value="" />
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
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapsefive"><span class="glyphicon glyphicon-pushpin">
                                            </span>COUNSELLOR MORE INFORMATIION</a>
                                        </h4>
                                    </div>
                                    <div id="collapsefive" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td colspan="2" style="border-bottom: solid 1px #CCC; height: 45px; padding-top: 25px;">
                                                            <label for="email16">
                                                                <strong>Counsellor Details</strong></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email16">
                                                                Counsellor-Location</label>
                                                        </td>
                                                        <td width="58%">
                                                            <input type="text" name="input3" id="txtConsellorLocation" runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd16">
                                                                Counsellor-Regist Date</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input3" id="txtCousellorRegistrationDate" readonly runat="server"
                                                                tabindex="1" class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="42%">
                                                            <label for="email16">
                                                                Counsellor-Status</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input3" id="txtCounsellorStatus" readonly runat="server"
                                                                tabindex="1" class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd17">
                                                                Counselleor-Status-Date</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="233" id="txtCounsellerStatusDate" readonly runat="server"
                                                                tabindex="1" class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email17">
                                                                Counsellor-Remarks</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="233" id="txtCounsellorRemarks" readonly runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td colspan="2" style="border-bottom: solid 1px #CCC; height: 45px; padding-top: 25px;">
                                                            <label for="email11">
                                                                <label for="email21">
                                                                    <strong>Counsellor Login Details</strong></label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="42%">
                                                            <label for="email22">
                                                                Counsellor-Login</label>
                                                        </td>
                                                        <td colspan="4">
                                                            <input type="text" name="2332" id="txtCounsellorId" readonly runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email22">
                                                                Counsellor-PWD</label>
                                                        </td>
                                                        <td colspan="4">
                                                            <input type="text" name="2332" id="txtCounsellorPWD" readonly runat="server" tabindex="1"
                                                                class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="pwd22">
                                                                Counsellor-Access-Code</label>
                                                        </td>
                                                        <td colspan="4">
                                                            <input type="text" name="2332" id="txtCousellorAccessCode" readonly runat="server"
                                                                tabindex="1" class="form-control" placeholder="" value="" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td colspan="4">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table>
                                    <tr>
                                        <td colspan="4">
                                            <asp:LinkButton ID="lnkUpdate" runat="server" class="btn btn-primary" Text="Update"
                                                OnClick="lnkUpdate_Click" OnClientClick="return validateEmail(this);"></asp:LinkButton>&nbsp;&nbsp;<asp:LinkButton
                                                    ID="lnkCancel" runat="server" class="btn btn-primary" Text="Cancel"></asp:LinkButton>
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
