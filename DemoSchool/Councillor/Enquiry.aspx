<%@ Page Title="" Language="C#" MasterPageFile="~/Councillor/CouncillorMasterPage.Master"
    AutoEventWireup="true" CodeBehind="Enquiry.aspx.cs" Inherits="PresentationLayer.Councellor.Enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link href="../font-awesome/css/font-awesome.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <link href="../StudentStyles/style.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>  
<script type = "text/javascript">
    function RadioCheck(rb) {
        var gv = document.getElementById("<%=grdEnquiryDetails.ClientID%>");
        var rbs = gv.getElementsByTagName("input");

        var row = rb.parentNode.parentNode;
        for (var i = 0; i < rbs.length; i++) {
            if (rbs[i].type == "radio") {
                if (rbs[i].checked && rbs[i] != rb) {
                    rbs[i].checked = false;
                    break;
                }
            }
        }
    }    
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".email-link").click(function () {
            $(".nav li").removeClass("active");
            $($(this).attr("data-toggle-tab")).parent("li").addClass("active");
        });
        $(".sms-link").click(function () {
            $(".nav li").removeClass("active");
            $($(this).attr("data-toggle-tab")).parent("li").addClass("active");
        });

    });
</script>

 <script type="text/javascript">
         function SuccessPoPup() {
                alert("Mail sent successfully");
         }
         function FailedPoPup() {

             alert("Failed Mail to sent");
         }
         </script>
<script type="text/javascript">
    function hideTable() {
        $('#mytable').hide();
    }
    function hideGrid() {
        $('#<%=grdEnquiryDetails.ClientID %>').hide();
    }
    function showTable() {
        $('#mytable').show();
        $('#<%=grdEnquiryDetails.ClientID %>').hide();
    }
   

</script>
<!-- Latest compiled JavaScript -->

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
<asp:ScriptManager ID="scptmgr" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-body">
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                        <tr>
                            <td width="15%">
                                <label for="email2">
                                    Select Category</label>
                            </td>
                            <td width="15%">
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
                                <asp:UpdatePanel ID="ddlSub" runat="server">
                                <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlCategory" />
                              
                                </Triggers>
                                <ContentTemplate>
                                 <asp:DropDownList ID="ddlSubject" runat="server" class="form-control" 
                                        AutoPostBack="true" 
                                        onselectedindexchanged="ddlSubject_SelectedIndexChanged" >
                                
                                </asp:DropDownList>
                                </ContentTemplate>
                                </asp:UpdatePanel>
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
                    <h2>
                        Select Enq-Forms From Following List</h2>
                    <div class="table-responsive">
                       

                       
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-12 ">
                                        <div class="table-responsive">
                                            <asp:GridView ID="grdEnquiryDetails" runat="server" HeaderStyle-BackColor="#3AC0F2" 
                                                class="table table-striped" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                                                AlternatingRowStyle-BackColor="White" AutoGenerateColumns="False" DataKeyNames="E_FormId"
                                                EmptyDataText="There are no data records to display.">
                                                <Columns>
                                                    <asp:TemplateField ItemStyle-Width="40px">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        <ItemTemplate>
                                                            <asp:RadioButton ID="RadioButton1" GroupName="test" AutoPostBack="true" onclick = "RadioCheck(this);" OnCheckedChanged="RadioButton1_CheckedChanged"
                                                                runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="E_FormId" HeaderText="Enquiry Form ID" ReadOnly="True"
                                                        SortExpression="E_FormId" />
                                                    <asp:BoundField DataField="E_EnquiryDate" HeaderText="Enquiry Date" SortExpression="E_EnquiryDate"
                                                        HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                                                    <asp:BoundField DataField="E_FirstName" HeaderText="Person Name" SortExpression="E_FirstName"
                                                        ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />
                                                    <asp:BoundField DataField="E_DoB" HeaderText="DOB" SortExpression="E_DoB" HeaderStyle-CssClass="visible-md"
                                                        ItemStyle-CssClass="visible-md" />
                                                    <asp:BoundField DataField="AddressName" HeaderText="Address" SortExpression="AddressName"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_LandLine" HeaderText="Phone" SortExpression="E_LandLine"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_MobileNumber" HeaderText="Mobile" SortExpression="E_MobileNumber"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_Email" HeaderText="Email-ID" SortExpression="E_Email"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="Subject_Name" HeaderText="Enquiry-Title" SortExpression="Subject_Name"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_TitleInfo" HeaderText="Enquiry-Info" SortExpression="E_TitleInfo"
                                                         ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="Category_Name" HeaderText="Enquiry- Category" SortExpression="Category_Name"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs"/>
                                                    <asp:BoundField DataField="Subject_Name" HeaderText="Enquiry- Subject" SortExpression="Subject_Name"
                                                         ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_Status" HeaderText="Status" SortExpression="E_Status"
                                                        ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs" />
                                                    <asp:BoundField DataField="E_StatusDate" HeaderText="Status-Date" SortExpression="E_StatusDate"
                                                         ItemStyle-CssClass="hidden-xs" HeaderStyle-CssClass="hidden-xs"/>
                                                    
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <br />
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="comment-tabs">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon glyphicon-th-list"></span>View Enquiry Info</h3>
                                        </a></li>
                                        <li><a href="#add-comment" class="email-link" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon glyphicon-envelope"></span>Response Email</h3>
                                        </a></li>
                                        <li><a href="#account-settings" class="sms-link" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon glyphicon-phone"></span>Response SMS</h3>
                                        </a></li>
                                    </ul>
                                    <div class="tab-content">
                                       
                                        <div class="tab-pane active" id="comments-logout">
                                            <form action="#" method="post" class="form-horizontal" id="accountSetForm" role="form">
                                            <p>
                                                &nbsp;<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div class="form-group" style="margin-bottom:5px;">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Id</label>
                                                    <div class="col-xs-6">
                                                          <asp:TextBox ID="txtSendToformId" runat="server"  class="form-control" placeholder="Enquiry Id"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group"  style="margin-bottom:5px;">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Person Name</label>
                                                    <div class="col-xs-6">
                                                      <asp:TextBox ID="txtSendToFirstName" runat="server"  class="form-control" placeholder="Enquiry Id"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group"  style="margin-bottom:5px;">
                                                    <label for="nickName" class="col-xs-4 control-label">
                                                        Enquiry Category</label>
                                                    <div class="col-xs-6">
                                                     <asp:TextBox ID="txtSendToCategory" runat="server"  class="form-control" placeholder="Enquiry Id"></asp:TextBox>
                                                       
                                                    </div>
                                                </div>
                                                <div class="form-group"  style="margin-bottom:5px;">
                                                    <label for="email" class="col-xs-4 control-label">
                                                        Enquiry Subject</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="email" id="txtSendToSubject" runat="server" placeholder="Enquiry Subject">
                                                    </div>
                                                </div>
                                                <div class="form-group"  style="margin-bottom:5px;">
                                                    <label for="email" class="col-xs-4 control-label">
                                                        Enquiry Person Email</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="email" id="txtSendToEmail" runat="server" placeholder="Enquiry Person Email">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newPassword" class="col-xs-4 control-label">
                                                        Enquiry Person Mobile</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="newPassword" id="txtSendToMobile" runat="server"
                                                            placeholder="Enquiry Person  Mobile">
                                                    </div>
                                                </div>
                                                <div class="form-group"  style="margin-bottom:5px;">
                                                    <label for="newPassword" class="col-xs-4 control-label">
                                                        Enquiry Information/Query</label>
                                                    <div class="col-xs-6">
                                                        <textarea class="form-control" name="addComment" id="txtSendToInfo" runat="server" rows="5"></textarea>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <div class="form-group" >
                                                    <div class="col-xs-offset-4 col-xs-8">
                                                    <table style="margin-top:20px"><tr><td>
                                                      <a href="#add-comment" data-toggle="tab" data-toggle-tab=".email-link" class="email-link btn btn-primary" ><span class="glyphicon glyphicon glyphicon-envelope"></span>Send Email</a>&nbsp;&nbsp;&nbsp;
                                                       <%-- <asp:LinkButton ID=""  runat="server" 
                                                            class="btn btn-primary btn-circle text-uppercase"  ><span class="glyphicon glyphicon glyphicon-envelope"></span>Send Email</asp:LinkButton>&nbsp;&nbsp;&nbsp;--%>
                                                  <a href="#account-settings" data-toggle="tab" data-toggle-tab=".sms-link" class="sms-link btn btn-primary"><span class="glyphicon glyphicon glyphicon-phone"></span>Send SMS</a>
                                           
                                                
                                                 
                                                 
                                            <%-- <asp:LinkButton ID=""  runat="server" 
                                                            class="btn btn-primary btn-circle text-uppercase" > <span class="glyphicon glyphicon glyphicon-phone"></span>Send Message</asp:LinkButton>--%>
                                                    </td></tr></table>
                                                 
                                                       
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="add-comment">

                                            <form action="#" method="post" class="form-horizontal" id="accountSetForm" role="form">
                                            <p>
                                                &nbsp;<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <div class="form-group">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Id</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="name" id="txtRepsonseMailFormId" runat="server" placeholder="Enquiry Id">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Person Name</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="name" id="txtRepsonseMailPersonName" runat="server" placeholder="Enquiry Person Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="nickName" class="col-xs-4 control-label">
                                                        Enquiry Category</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="nickName" id="txtRepsonseMailCategory" runat="server" placeholder="Enquiry Category">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-xs-4 control-label">
                                                        Enquiry Subject</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="email" id="txtRepsonseMailSubject" runat="server" placeholder="Enquiry Subject">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-xs-4 control-label">
                                                        Enquiry Person Email</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="email" id="txtRepsonseMailEmail" runat="server" placeholder="Enquiry Person Email">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newPassword" class="col-xs-4 control-label">
                                                        Response Information</label>
                                                    <div class="col-xs-6">
                                                        <textarea class="form-control" name="addComment" id="txtRepsonseMailInfo" runat="server" rows="5"></textarea>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <div class="form-group">
                                                    <div class="col-xs-offset-4 col-xs-8">
                                                       <asp:LinkButton ID="lnkBtnSendOnlyMail"  runat="server" onclick="lnkBtnSendIndEmail_Click"
                                                            class="btn btn-primary btn-circle text-uppercase"  ><span class="glyphicon glyphicon glyphicon-envelope"></span>Send Email</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="account-settings">
                                            <form action="#" method="post" class="form-horizontal" id="accountSetForm" role="form">
                                              <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                            <p>
                                                <div class="form-group">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Id</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="name" id="txtSMSformId" runat="server" placeholder="Enquiry Id">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="name" class="col-xs-4 control-label">
                                                        Enquiry Person Name</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="name" id="txtSMSpersonName" runat="server" placeholder="Enquiry Person Name">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="nickName" class="col-xs-4 control-label">
                                                        Enquiry Category</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="nickName" id="txtSMSCategoryName" runat="server" placeholder="Enquiry Category">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email" class="col-xs-4 control-label">
                                                        Enquiry Subject</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="email" id="txtSMSSubjectName" runat="server" placeholder="Enquiry Subject">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newPassword" class="col-xs-4 control-label">
                                                        Enquiry Person Mobile</label>
                                                    <div class="col-xs-6">
                                                        <input type="text" class="form-control" name="newPassword" id="txtSMSMobileNumber" runat="server" placeholder="Enquiry Person  Mobile">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newPassword" class="col-xs-4 control-label">
                                                        Response Information</label>
                                                    <div class="col-xs-6">
                                                        <textarea class="form-control" name="addComment" id="addComment" rows="5"></textarea>
                                                    </div>
                                                </div>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>
                                                <div class="form-group">
                                                    <div class="col-xs-offset-4 col-xs-8">
                                                 <asp:LinkButton ID="lnkBtnSendOnlySMS"  runat="server" onclick="lnkBtnSendIndSMS_Click"
                                                            class="btn btn-primary btn-circle text-uppercase"> <span class="glyphicon glyphicon glyphicon-phone"></span>Send Message</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </form>
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
