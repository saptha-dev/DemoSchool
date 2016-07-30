<%@ Page Title="" Language="C#" MasterPageFile="~/Councillor/CouncillorMasterPage.Master"
    AutoEventWireup="true" CodeBehind="ProgramCommunication.aspx.cs" Inherits="PresentationLayer.Councellor.ProgramCommunication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <!-- Latest compiled JavaScript -->
   <%-- <script type="text/javascript">
        function SelectAllCheckboxes1(chk) {

            $('#<%=grdEnquiryDetails.ClientID%>').find("input:checkbox").each(function () {
                if (this != chk) {
                    this.checked = chk.checked;
                }
            });
        }
    </script>--%>
 
  <script type="text/javascript">
      $(document).ready(function () {
          $('#<%=txtEmpName.ClientID %>').autocomplete({
              source: function (request, response) {
                  $.ajax({
                      url: "ProgramCommunication.aspx/GetEmployeeName",
                      data: "{'empName':'" + request.term + "'}",
                      dataType: "json",
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      success: function (data) {
                          response($.map(data.d, function (item) {
                              return { value: item }
                          }))
                      },

                      error: function (XMLHttpRequest, textStatus, errorThrown) {
                          alert(textStatus);
                      }
                  });
              }
          });
         
      });
    </script>  
    <style type="text/css">
    .textusername
        {
            width:100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            padding: 4px 20px 4px 8px;
            font-size: 12px;
            -moz-transition: all .2s linear;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
            font-size: 0.9em;
            font-style: normal;
            font-variant: normal;
            line-height: normal;
            font-family: Lato, Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="scptmgr" runat="server">
    </asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-body">
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                        <tr>
                            <td>
                                <label for="email3">
                                    Select
                                </label>
                            </td>
                            <td>
                                <select id="subject3" name="subject3" class="form-control" required="required">
                                    <option value="na" selected="selected">Select category from List</option>
                                    <option value="service">Training</option>
                                    <option value="suggestions">Consulting</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td width="15%">
                                <label for="email2">
                                    Select Category</label>
                            </td>
                            <td width="15%">
                                <asp:DropDownList ID="ddlCategory" runat="server" class="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
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
                                        <asp:DropDownList ID="ddlSubject" runat="server" class="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
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
                    <div>
                        <div class="row" style="text-align: center; margin-bottom: 30px;margin-top:30px;">
                            <table style="width: 60%; margin: auto; border: none; background-color: #F8F8F8">
                                <tr>
                                    <td style="border: none;">
                                        <h4>
                                            Search Table :</h4>
                                    </td>
                                    <td style="border: none;">
                                        <asp:TextBox ID="txtEmpName" runat="server" Width="100%" Style="height: 30px;" class="textusername" />
                                    </td>
                                    <td style="border: none;">
                                        <asp:LinkButton ID="lnkBtn" runat="server" class="btn btn-primary" OnClick="lnkBtn_Click">Search Name</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="comment-tabs">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon glyphicon-envelope"></span>Email Information</h3>
                                        </a></li>
                                        <li><a href="#add-comment" role="tab" data-toggle="tab">
                                            <h3 class="reviews text-capitalize">
                                                <span class="glyphicon glyphicon glyphicon-phone"></span>SMS Information</h3>
                                        </a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="comments-logout">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="row">
                                                        <table width="50%" align="center" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                            <tr>
                                                                <td width="31%">
                                                                    
                                                                </td>
                                                                <td width="69%">
                                                                    <asp:UpdatePanel ID="autotext" runat="server">
                                                                        <ContentTemplate>
                                                                         
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-xs-11">
                                                        <div class="table-responsive">
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 ">
                                                                            <div class="table-responsive">
                                                                                <asp:GridView ID="grdEnquiryDetails" runat="server" 
                                                                                    HeaderStyle-BackColor="#3AC0F2" AllowPaging="true" PageSize="10"
                                                                                    class="table table-striped" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                                                                                    AlternatingRowStyle-BackColor="White" AutoGenerateColumns="False" DataKeyNames="E_FormId"
                                                                                    EmptyDataText="There are no data records to display." 
                                                                                    onpageindexchanging="grdEnquiryDetails_PageIndexChanging"   >
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-Width="40px">
                                                                                            <HeaderTemplate>
                                                                                                <%--<input id="chkAll" class="cbAll" onclick="javascript:SelectAllCheckboxes1(this);"
                                                                                                    runat="server" type="checkbox" />--%>
                                                                                                    <asp:CheckBox ID="chkAll" AutoPostBack="true" runat="server" OnCheckedChanged="CheckAll_Changed" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkFormdId" AutoPostBack="true" runat="server" OnCheckedChanged="Check_Changed" />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField DataField="SNo" HeaderText="SNo." ReadOnly="True"
                                                                                            SortExpression="SNo" />
                                                                                        <asp:BoundField DataField="E_FirstName" HeaderText="First Name" SortExpression="E_FirstName" />

                                                                                       <asp:BoundField DataField="E_LastName" HeaderText="Last Name" SortExpression="E_LastName"  />

                                                                                        <asp:BoundField DataField="E_DoB" HeaderText="DOB" SortExpression="E_DoB"  ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />

                                                                                        <asp:BoundField DataField="E_StreetName" HeaderText="Location" SortExpression="AddressName"       />
                                                                                       
                                                                                        <asp:BoundField DataField="E_Email" HeaderText="Email-ID" SortExpression="E_Email"   />
                                                                                       
                                                                                        <asp:BoundField DataField="E_MobileNumber" HeaderText="Mobile No." SortExpression="E_MobileNumber"   />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            <asp:UpdatePanel ID="sendGroupMail" runat="server"><ContentTemplate>
                                                            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <label for="email2">
                                                                            Person Name</label>
                                                                    </td>
                                                                    <td width="15%">
                                                                        <input type="text" name="input2" id="txtPersonName" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Email-ID</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input3" id="txtPersonEmail" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Group Email</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input4" id="txtGroupEmail" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Category</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input5" id="txtCategory" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Subject</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input6" id="txtSubject" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Title Info</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input7" id="txtTitleInfo" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Program Information</label>
                                                                    </td>
                                                                    <td>
                                                                        <textarea type="text" name="22" id="txtProgramInfo" runat="server" tabindex="1" rows="3" class="form-control"
                                                                            placeholder="" value="" /></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Attach File</label>
                                                                    </td>
                                                                    <td>
                                                                        <label>
                                                                        <asp:UpdatePanel ID="fileUploadPanel" runat="server">
                                                                        <Triggers>
                                                               <asp:PostBackTrigger ControlID="lnksendMail" />
                                                                        </Triggers>
                                                                        <ContentTemplate>
                                                                         <asp:FileUpload ID="fileUpload" runat="server" />
                                                                        </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                         
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                       <asp:LinkButton ID="lnksendMail" runat="server"  
                                                                            class="btn btn-primary btn-circle text-uppercase" onclick="lnksendMail_Click">Send Email</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </ContentTemplate></asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="add-comment">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="row">
                                                        <table width="50%" align="center" border="0" align="left" cellpadding="0" cellspacing="0"
                                                            class="formtable">
                                                            <tr>
                                                                <td width="31%">
                                                                   
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div class="col-xs-11">
                                                         <div class="table-responsive">
                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="ddlSubject" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 ">
                                                                            <div class="table-responsive">
                                                                                   <asp:GridView ID="gridViewPhoneEnquiry" runat="server" HeaderStyle-BackColor="#3AC0F2"
                                                                                    class="table table-striped" HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2"
                                                                                    AlternatingRowStyle-BackColor="White" AutoGenerateColumns="False" DataKeyNames="E_FormId"
                                                                                    EmptyDataText="There are no data records to display.">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-Width="40px">
                                                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                            <ItemTemplate>
                                                                                            <asp:CheckBox ID="chkSMSFormdId" AutoPostBack="true" runat="server" OnCheckedChanged="SMSCheck_Changed"  />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:BoundField DataField="SNo" HeaderText="SNo." ReadOnly="True"
                                                                                            SortExpression="SNo" />
                                                                                        <asp:BoundField DataField="E_FirstName" HeaderText="First Name" SortExpression="E_FirstName" />

                                                                                       <asp:BoundField DataField="E_LastName" HeaderText="Last Name" SortExpression="E_LastName"  />

                                                                                        <asp:BoundField DataField="E_DoB" HeaderText="DOB" SortExpression="E_DoB"  ItemStyle-CssClass="visible-xs" HeaderStyle-CssClass="visible-xs" />

                                                                                        <asp:BoundField DataField="E_StreetName" HeaderText="Location" SortExpression="AddressName"       />
                                                                                       
                                                                                        <asp:BoundField DataField="E_MobileNumber" HeaderText="Mobile No." SortExpression="E_MobileNumber"   />
                                                                                       
                                                                                        <asp:BoundField DataField="E_Email" HeaderText="Email ID" SortExpression="E_Email"   />
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                            </div>
                                                                            </div>
                                                                           </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>    
                                                            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                                <tr>
                                                                    <td width="15%">
                                                                        <label for="email2">
                                                                            Person Name</label>
                                                                    </td>
                                                                    <td width="15%">
                                                                        <input type="text" name="input2" id="txtSMSPersonName" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Mobile-No</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input3" id="txtSMSMobileNumber" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Group-Mobile</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input4" id="txtSMSGroupMobileNumber" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Category</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input5" id="txtSMSCategory" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Subject</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input6" id="txtSMSSubject" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Title Info</label>
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" name="input7" id="txtSMStitleInfo" runat="server" tabindex="1" class="form-control" placeholder=""
                                                                            value="" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Program Information</label>
                                                                    </td>
                                                                    <td>
                                                                        <textarea type="text" name="22" id="txtSMSProgramInfo" runat="server" tabindex="1" rows="3" class="form-control"
                                                                            placeholder="" value="" /></textarea>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="pwd">
                                                                            Attach File</label>
                                                                    </td>
                                                                    <td>
                                                                        <label>
                                                                            <input type="file" name="fileField" id="fileField" />
                                                                        </label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                      <asp:LinkButton ID="lnkSendSMS" runat="server" class="btn btn-primary btn-circle text-uppercase" onclick="lnksendSMS_Click">Send SMS</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            </ContentTemplate>
                                                            </asp:UpdatePanel>
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
