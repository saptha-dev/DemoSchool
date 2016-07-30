<%@ Page Title="" Language="C#" MasterPageFile="~/Councillor/CouncillorMasterPage.Master"
    AutoEventWireup="true" CodeBehind="CouncillorReport.aspx.cs" Inherits="PresentationLayer.Councellor.CouncillorReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


<script type="text/javascript">
    function myFunction() {
        window.print();
    }
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<asp:ScriptManager ID="scptmgr" runat="server"></asp:ScriptManager>
    <div class="container">
        <h2>
            <span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>ENQUIRY REPORT</h2>
        <div class="row">
            <!-- Example row of columns -->
            <div class="panel panel-info">
                <div class="panel-body">
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                        <tr>
                            <td width="15%">
                                <label for="email">
                                    Select Category</label>
                            </td>
                            <td width="15%">
                               <%-- <select id="subject2" name="subject2" class="form-control" required="required">
                                    <option value="na" selected="">Select category from List</option>
                                    <option value="service">b</option>
                                    <option value="suggestions">c</option>
                                    <option value="product">d</option>
                                    <option value="product">d</option>
                                    <option value="product">d</option>
                                </select>--%>

                                <asp:DropDownList ID="ddlCategory" runat="server" class="form-control"  AutoPostBack="true"
                                    onselectedindexchanged="ddlCategory_SelectedIndexChanged">
                                
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pwd">
                                    Select Subject</label>
                            </td>
                            <td>
                              <%--  <select id="subject" name="subject" class="form-control" required="required">
                                    <option value="na" selected="selected">Select subject from List</option>
                                    <option value="service">b</option>
                                    <option value="suggestions">c</option>
                                    <option value="product">d</option>
                                </select>--%>
                                <asp:UpdatePanel ID="ddlSub" runat="server">
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlCategory" />
                              
                                </Triggers>
                                <ContentTemplate>
                                 <asp:DropDownList ID="ddlSubject" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="ddlSubject_SelectedIndexChanged">
                                
                                </asp:DropDownList>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="pwd">
                                    Select Enquiry-Form</label>
                            </td>
                            <td>
                               <%-- <select id="subject" name="subject" class="form-control" required="required">
                                    <option value="na" selected="selected">Select enquiry from List</option>
                                    <option value="service">b</option>
                                    <option value="suggestions">c</option>
                                    <option value="product">d</option>
                                </select>--%>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
                              
                                </Triggers>
                                <ContentTemplate>
                                <asp:DropDownList ID="ddlForm" runat="server" class="form-control">
                                
                                </asp:DropDownList>
                                </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right" valign="top">
                             <asp:LinkButton ID="lnkViewReport" runat="server" 
                                    class="btn btn-primary btn-circle text-uppercase" Text="" 
                                    onclick="lnkViewReport_Click" ><span class=" glyphicon glyphicon-list-alt"></span>View Report</asp:LinkButton>
                                                            &nbsp;&nbsp;

                                  <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="prindBtn" onclick="myFunction()">
                                    <span class="glyphicon glyphicon-print"></span>Print Report</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkViewReport" />
        </Triggers>
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                <tr>
                                    <td width="15%">
                                        <label for="email">
                                            Form-ID</label>
                                    </td>
                                    <td width="15%">
                                        <input type="text" name="" id="txtFormId" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="">
                                    </td>
                                    <td width="5%">
                                        &nbsp;
                                    </td>
                                    <td width="15%">
                                        <label for="pwd">
                                            Form-Date</label>
                                    </td>
                                    <td width="15%">
                                        <input type="text" name="" id="txtFormSubmitDate" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="email2">
                                            Person-Name</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtPersonName" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <label for="email2">
                                            DOB</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtDOB" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="email2">
                                            Address</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtAddress" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <label for="pwd2">
                                            Phone</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtLandLinePhone" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="email2">
                                            Mobile</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtMobile" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <label for="pwd2">
                                            Email-ID</label>
                                    </td>
                                    <td>
                                        <input type="text" name="2" id="txtEmailId" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                <tr>
                                    <td width="15%">
                                        <label for="email">
                                            Enquiry-Category</label>
                                    </td>
                                    <td width="15%">
                                        <input type="text" name="" id="txtCategory" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="">
                                    </td>
                                    <td width="5%">
                                        &nbsp;
                                    </td>
                                    <td width="15%">
                                        <label for="email3">
                                            Enquiry - Info</label>
                                    </td>
                                    <td width="15%" rowspan="3" align="left" valign="top">
                                        <textarea type="text" name="22" id="txtEnquiryInfo" runat="server" tabindex="1" rows="3"
                                            class="form-control" placeholder="" value="" /></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="pwd">
                                            Enquiry-Subject</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtEnquirySubject" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
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
                                        <label for="pwd">
                                            Enquiry Title</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtEnquiryTitle" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
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
                                        <label for="email">
                                            Status</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtStatus" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <label for="email">
                                            Satus-Date-Remarks</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtRemarks" runat="server" tabindex="1" class="form-control"
                                            placeholder="" value="" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <!-- Example row of columns -->
                    <div class="panel panel-info">
                        <div class="panel-body">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                <tr>
                                    <td width="15%">
                                        <label for="email">
                                            Respondent Name</label>
                                    </td>
                                    <td width="15%">
                                        <input type="text" name="" id="txtRespondentName" runat="server"  tabindex="1" class="form-control" placeholder=""
                                            value="">
                                    </td>
                                    <td width="5%">
                                        &nbsp;
                                    </td>
                                    <td width="15%">
                                        <label for="pwd">
                                            Response Message</label>
                                    </td>
                                    <td width="15%">
                                        <textarea type="text" name="23" id="txtRespondentMsg" runat="server" tabindex="1" rows="3" class="form-control"
                                            placeholder="" value="" /></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="pwd">
                                            Respondant-Email</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtRespondentEmail" runat="server" tabindex="1" class="form-control" placeholder=""
                                            value="" />
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        <label for="email2">
                                            Respondant-Mobile</label>
                                    </td>
                                    <td>
                                        <input type="text" name="3" id="txtRespondentMobile" runat="server" tabindex="1" class="form-control" placeholder=""
                                            value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="email">
                                            Response-Type</label>
                                    </td>
                                    <td>
                                        <input type="text" name="" id="txtResponseType" runat="server" tabindex="1" class="form-control" placeholder=""
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
                                        <label for="email2">
                                            Response-Date</label>
                                    </td>
                                    <td>
                                        <input type="text" name="input" id="txtResponseDate" runat="server" tabindex="1" class="form-control" placeholder=""
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
