<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="addPublicPageData.aspx.cs" Inherits="PresentationLayer.Admin.addPublicPageData" %>

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
        span.cke_skin_kama
        {
            margin: auto;
            width: 100%;
        }
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
                <a href="#">ADM-PUBLIC</a> &nbsp; > &nbsp;<a href="addPublicPageData.aspx" style="color: #00CCFF">add
                    Public Page Data</a>
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
                        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        <br />
                        <div class="divContentLeft">
                            <asp:Label ID="lblAffiliationStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblAffiliationName" runat="server" Text="Affiliation Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtAffiliationsName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="rfvtxtAffiliationsName" ControlToValidate="txtAffiliationsName" runat="server"
                                ValidationGroup="Required" Style="color: red;" ErrorMessage="Enter Affiliations Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblAffiliationContent" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" ControlToValidate="txtAffiliationContent" runat="server"
                                ValidationGroup="Required" Style="color: red;" ErrorMessage="Enter Affiliation Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtAffiliationContent" class="textusername" runat="server"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnAffiliationContent" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                OnClick="btnAffiliationContent_Click" ValidationGroup="Required" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnAffiliationCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnAffiliationCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-2">
                        <asp:Label ID="lblConsultingMessage" runat="server" Text=""></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblConsultingStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblConsulting" runat="server" Text="Consulting Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtConsultingName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" ControlToValidate="txtConsultingName" runat="server"
                                ValidationGroup="ConsultingRequired" Style="color: red;" ErrorMessage="Enter Consulting Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblConsultingMsgContentStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" ControlToValidate="txtConsultingContent" runat="server"
                                ValidationGroup="ConsultingRequired" Style="color: red;" ErrorMessage="Enter Consulting Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtConsultingContent" class="textusername" runat="server"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnConsulting" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                ValidationGroup="ConsultingRequired" OnClick="btnConsulting_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnConsultingCancel" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnConsultingCancel_Click" />
                        </div>
                    </div>
                    <div id="tabs-3">
                        <asp:Label ID="lblCareerMessage" runat="server" Text=""></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblCareerStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblCareer" runat="server" Text="Career Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtCareerName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator8" ControlToValidate="txtCareerName" runat="server"
                                ValidationGroup="CareerRequired" Style="color: red;" ErrorMessage="Enter Career Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblCareerContentStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4" ControlToValidate="txtCareerContent" runat="server"
                                ValidationGroup="CareerRequired" Style="color: red;" ErrorMessage="Enter Career Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtCareerContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnAddCareerContent" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                ValidationGroup="CareerRequired" OnClick="btnAddCareerContent_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelCareer" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnCancelCareer_Click" />
                        </div>
                    </div>
                    <div id="tabs-4">
                        <asp:Label ID="lblPrgMethodMessage" runat="server" Text=""></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblPreMethodStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblPrgMethod" runat="server" Text="PRG-Method Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtPrgMethodName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator9" ControlToValidate="txtPrgMethodName" runat="server"
                                ValidationGroup="PrgMethodNameRequired" Style="color: red;" ErrorMessage="Enter Program Method Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblPrgMethodContentStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblPrgMethodContent" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5" ControlToValidate="txtPrgMethodContent" runat="server"
                                ValidationGroup="PrgMethodNameRequired" Style="color: red;" ErrorMessage="Enter Program Method Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtPrgMethodContent" class="textusername" runat="server"
                                Width="100%" Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnAddPrgMethodContent" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                ValidationGroup="PrgMethodNameRequired" OnClick="btnAddPrgMethodContent_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelPrgMethod" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnCancelPrgMethod_Click" />
                        </div>
                    </div>
                    <div id="tabs-5">
                        <asp:Label ID="lblNewsMessage" runat="server" Text=""></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblNewsStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblNews" runat="server" Text="News Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtNewsName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator10" ControlToValidate="txtNewsName" runat="server"
                                ValidationGroup="NewsNameRequired" Style="color: red;" ErrorMessage="Enter News Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblNewsContentStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator6" ControlToValidate="txtNewsContent" runat="server"
                                ValidationGroup="NewsNameRequired" Style="color: red;" ErrorMessage="Enter News Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtNewsContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnAddNews" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                ValidationGroup="NewsNameRequired" OnClick="btnAddNews_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelNews" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnCancelNews_Click" />
                        </div>
                    </div>
                    <div id="tabs-6">
                        <asp:Label ID="lblEventMessage" runat="server" Text=""></asp:Label>
                        <div class="divContentLeft">
                            <asp:Label ID="lblEventStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="lblEvents" runat="server" Text="Event Name"></asp:Label>&nbsp;&nbsp;
                            : &nbsp;&nbsp;<asp:TextBox ID="txtEventName" runat="server" class="textusername"></asp:TextBox>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator11" ControlToValidate="txtEventName" runat="server"
                                ValidationGroup="EventNameRequired" Style="color: red;" ErrorMessage="Enter Event Name"
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:Label ID="lblEventContentStar" runat="server" Text="*" Style="color: red"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text="Content  :"></asp:Label>&nbsp;&nbsp;<asp:RequiredFieldValidator
                                ID="RequiredFieldValidator7" ControlToValidate="txtEventContent" runat="server"
                                ValidationGroup="EventNameRequired" Style="color: red;" ErrorMessage="Enter Event Content."
                                Display="Dynamic" SetFocusOnError="True"> </asp:RequiredFieldValidator>
                            <br />
                            <RTB:CKEditorControl ID="txtEventContent" class="textusername" runat="server" Width="100%"
                                Height="180px"></RTB:CKEditorControl>
                            <br />
                            <asp:Button ID="btnAddEvent" runat="server" Text="Add Content" CssClass="btn btn-primary"
                                ValidationGroup="EventNameRequired" OnClick="btnAddEvent_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnCancelEvent" runat="server" Text="Cancel" CssClass="btn btn-primary"
                                OnClick="btnCancelEvent_Click" />
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
