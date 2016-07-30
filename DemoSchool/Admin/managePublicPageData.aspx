<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="managePublicPageData.aspx.cs" Inherits="PresentationLayer.Admin.managePublicPageData" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="RTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/adminStyle.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.js"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#tabs').tabs({
                activate: function () {
                    var newIdx = $('#tabs').tabs('option', 'active');
                    $('#<%=hidLastTab.ClientID%>').val(newIdx);
                },
                active: previouslySelectedTab,
                show: { effect: "fade", duration: 500 }
            });
        });
    </script>
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);

        };

        function HideLabel2() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblConsultingMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function HideLabel3() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblCareerMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function HideLabel4() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblPrgMethodMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function HideLabel5() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblNewsMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function HideLabel6() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblEventMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

    </script>
    <style type="text/css">
         #map td
        {
            color: White;
            font-size: 10px;
            background-color: #2E2E2E;
            padding: 10px;
        }
        #tabs
        {
            background: none;
                width: 100%;
            margin-left:0px;
            margin-top: 20px
        }
        #map a
        {
            color: White;
            text-transform: uppercase;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
    <table id="map" style="width: 72%; margin-left: auto; margin-right: auto; margin-top: 10px;">
        <tr>
            <td style="width: 30%">
                <a href="#">ADM-PUBLIC</a> &nbsp; > &nbsp;<a href="managePublicPageData.aspx" style="color: #00CCFF">manage Public Page Data</a>
            </td>
            <td style="width: 50%; text-align: left">
            </td>
        </tr>
    </table>
    <table style="width: 70%; margin: auto;">
        <tr>
            <td align="center">
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">AFFILIATIONS</a></li>
                        <li><a href="#tabs-2">CONSULTING</a></li>
                        <li><a href="#tabs-3">CAREERS</a></li>
                        <li><a href="#tabs-4">PRG-METHOD</a></li>
                        <li><a href="#tabs-5">NEWS</a></li>
                        <li><a href="#tabs-6">EVENTS</a></li>
                    </ul>
                    <div id="tabs-1">
                        <asp:Label ID="lblMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <br />
                        <div class="divContentLeft">
                            <asp:Label ID="lblAffiliationName" runat="server" Text="Affiliation Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;
                            <asp:DropDownList ID="ddlAffiliation" runat="server" class="textusername" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlAffiliation_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rvfAffiliation" runat="server" ValidationGroup="Required"
                                ErrorMessage="Select Affiliation" ForeColor="Red" ControlToValidate="ddlAffiliation"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblAffiliationContent" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" runat="server" ValidationGroup="Required" ErrorMessage="Affiliation Content Required"
                                ForeColor="Red" ControlToValidate="txtAffiliationContent" Display="Dynamic" Font-Size="14px"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtAffiliationContent" class="textusername" runat="server"
                                Width="100%" Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnAffiliationUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                OnClick="btnAffiliationUpdate_Click" ValidationGroup="Required" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnAffiliateDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="Required" OnClick="btnAffiliateDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnAffiliationCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnAffiliationCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-2">
                        <asp:Label ID="lblConsultingMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblConsulting" runat="server" Text="Consulting Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:DropDownList ID="ddlConsulting" runat="server" class="textusername"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlConsulting_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="RqConsulting"
                                ErrorMessage="Select Consulting" ForeColor="Red" ControlToValidate="ddlConsulting"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="RqConsulting"
                                ErrorMessage="Consulting Content Required" ForeColor="Red" ControlToValidate="txtConsultingContent"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtConsultingContent" class="textusername" runat="server"
                                Width="100%" Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnConsultingUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                ValidationGroup="RqConsulting" OnClick="btnConsultingUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnConsultingDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="RqConsulting" OnClick="btnConsultingDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnConsultingCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnConsultingCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-3">
                        <asp:Label ID="lblCareerMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblCareer" runat="server" Text="Career Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:DropDownList ID="ddlCareer" runat="server" class="textusername"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlCareer_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="RqCareer"
                                ErrorMessage="Career Required" ForeColor="Red" ControlToValidate="ddlCareer"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Content  :"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="RqCareer"
                                ErrorMessage="Career Content  Required" ForeColor="Red" ControlToValidate="txtCareerContent"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtCareerContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCareerUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                ValidationGroup="RqCareer" OnClick="btnCareerUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCareerDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="RqCareer" OnClick="btnCareerDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCareerCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnCareerCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-4">
                        <asp:Label ID="lblPrgMethodMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblPrgMethod" runat="server" Text="PRG-Method Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:DropDownList ID="ddlPrgMethod" runat="server" class="textusername"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlPrgMethod_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="RqPrgMethod"
                                ErrorMessage="ProgramMethod Required" ForeColor="Red" ControlToValidate="ddlPrgMethod"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblPrgMethodContent" runat="server" Text="Content  :"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="RqPrgMethod"
                                ErrorMessage="ProgramMethod Content  Required" ForeColor="Red" ControlToValidate="txtPrgMethodContent"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtPrgMethodContent" class="textusername" runat="server"
                                Width="100%" Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnPrgMethodUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                ValidationGroup="RqPrgMethod" OnClick="btnPrgMethodUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnPrgMethodDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="RqPrgMethod" OnClick="btnPrgMethodDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnPrgMethodCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnPrgMethodCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-5">
                        <asp:Label ID="lblNewsMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblNews" runat="server" Text="News Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:DropDownList ID="ddlNews" runat="server" class="textusername"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlNews_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="RqNews"
                                ErrorMessage="News Required" ForeColor="Red" ControlToValidate="ddlNews" Display="Dynamic"
                                Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Content  :"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="RqNews"
                                ErrorMessage="News Content Required" ForeColor="Red" ControlToValidate="txtNewsContent"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtNewsContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnNewsUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                ValidationGroup="RqNews" OnClick="btnNewsUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnNewsDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="RqNews" OnClick="btnNewsDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnNewsCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnNewsCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-6">
                        <asp:Label ID="lblEventMessage" runat="server" Text="" Visible="false"></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblEvents" runat="server" Text="Event Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:DropDownList ID="ddlEvents" runat="server" class="textusername"
                                AutoPostBack="true" OnSelectedIndexChanged="ddlEvents_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="RqEvents"
                                ErrorMessage="Event Required" ForeColor="Red" ControlToValidate="ddlEvents" Display="Dynamic"
                                Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label8" runat="server" Text="Content  :"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="RqEvents"
                                ErrorMessage="Event Content Required" ForeColor="Red" ControlToValidate="txtEventContent"
                                Display="Dynamic" Font-Size="14px" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtEventContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnEventUpdate" runat="server" Text="Update " CssClass="btn btn-primary"
                                ValidationGroup="RqEvents" OnClick="btnEventUpdate_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnEventDelete" runat="server" Text="Delete " CssClass="btn btn-primary"
                                ValidationGroup="RqEvents" OnClick="btnEventDelete_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnEventCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnEventCancel_Click" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
