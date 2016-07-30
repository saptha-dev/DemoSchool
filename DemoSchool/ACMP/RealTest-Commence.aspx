<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true" 
    CodeBehind="RealTest-Commence.aspx.cs" EnableViewStateMac="false" Inherits="PresentationLayer.ACMP.RealTest_Commence" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .csspager span
        {
            padding-left: 10px;
            padding-right: 10px;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
        }
    </style>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">

     $(document).ready(function () {
            $(window).bind("beforeunload", function () {
                
            });
        });

        function showDiv() {
            document.getElementById('collapseTwo').style.display = "block";
        }

        var tim;
        var txtime = document.getElementById('txtrttime').value;
        var n = txtime.substr(0, 2);
        var min = n;
        var sec = 0;
        var f = new Date();

        function customSubmit(someValue) {
            document.questionForm.minute.value = min;
            document.questionForm.second.value = sec;
            document.questionForm.submit();
        }

        function examTimer() {
            if (parseInt(sec) > 0) {

                document.getElementById("dateTimeDisplay").value = "" + min + " Minutes ," + sec + " Seconds";
                sec = parseInt(sec) - 1;
                tim = setTimeout("examTimer()", 1000);
            }
            else {

                if (parseInt(min) == 0 && parseInt(sec) == 0) {
                    document.getElementById("dateTimeDisplay").value = "" + min + " Minutes ," + sec + " Seconds";
                    alert("Time Up");
                    document.questionForm.minute.value = 0;
                    document.questionForm.second.value = 0;
                    document.questionForm.submit();

                }

                if (parseInt(sec) == 0) {
                    document.getElementById("dateTimeDisplay").value = "" + min + " Minutes ," + sec + " Seconds";
                    min = parseInt(min) - 1;
                    sec = 59;
                    tim = setTimeout("examTimer()", 1000);
                }

            }
        }
        //window.onload = examTimer;

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div runat="server" class="container" id="closediv">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            REAL TEST COMMENCE
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="65%">
                                    <label for="email">
                                        SELECT CTGY-NAME</label>
                                </td>
                                <td width="35%">
                                    <asp:DropDownList ID="ddlcategory" runat="server" class="form-control" AutoPostBack="true"
                                        AppendDataBoundItems="true" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd">
                                        SELECT SBJ-NAME</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlsubject" runat="server" class="form-control" AutoPostBack="true"
                                        AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd3">
                                        SEELECT STUDENT-NAME</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlstudentname" runat="server" class="form-control" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlstudentname_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:HiddenField runat="server" ID="hdnfstdId" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <%--<table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                        style="background-color: #CCC;">
                        <tr>
                            <td width="15%">
                                <label for="email46">
                                    ACMP-ID:NAME
                                </label>
                            </td>
                            <td width="15%">
                                <asp:Label ID="lblAcmpName" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="2%">
                                &nbsp;
                            </td>
                            <td width="18%">
                                <label for="email47">
                                    ACMP CITY-LOCATION</label>
                            </td>
                            <td width="15%">
                                <asp:Label ID="lblAcmpLoc" runat="server" Text=""></asp:Label>
                            </td>
                            <td width="2%">
                            </td>
                            <td width="18%">
                                <label for="email48">
                                    ACMP-STATUS</label>
                            </td>
                            <td width="15%">
                                <asp:Label ID="lblAcmpsts" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="container" runat="server" id="pnlcls">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center;">
                            REAL TEST LOGIN
                        </h3>
                    </div>
                    <div class="panel-body">
                        <%-- <hr />--%>
                        <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="65%">
                                    <label for="email2">
                                        STUDENT-RT-BK-ID</label>
                                </td>
                                <td width="35%">
                                    <asp:TextBox ID="txtstbkid" runat="server" class="form-control"></asp:TextBox>
                                    <asp:HiddenField ID="hdnfstRTid" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd2">
                                        STUDENT-LOG IN-ID</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtstlogid" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd4">
                                        ACMP-RT-BK-AUTH-CODE</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtauthcode" runat="server" class="form-control"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                        <tr>
                            <td width="30%" colspan="2" align="center" valign="top">
                                <asp:Button ID="btnlogin" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                    Text="LOGIN" OnClick="btnlogin_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp
                                <asp:Button ID="btncancel" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                    Text="CANCEL" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="container" runat="server" id="divcls">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            REAL TEST INFORMATION</h3>
                    </div>
                    <div class="panel-body">
                        <table align="center">
                            <tr>
                                <td>
                                    <div class="table-responsive">
                                        <asp:GridView ID="GVcommence" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                            HeaderStyle-ForeColor="white" Enabled="true" AllowPaging="true" Style="width: 100%"
                                            class="table table-bordred table-striped" PageSize="5">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lbl1" runat="server" Text="
                                                        Select"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkbx" runat="server" />
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false">
                                                    <ItemTemplate>
                                                        <asp:HiddenField runat="server" ID="hdfstubokID" Value='<%#Eval("rtid")%>' />
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText=" ID " DataField="rtid" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText=" STUD-ID:NAME" DataField="studentname" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText=" CMP-NAME" DataField="companyame" DataFormatString="{0:d}"
                                                    HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText=" CTGY ID:NAME" DataField="categoryname" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText=" SBJ-ID:NAME" DataField="subjname" DataFormatString="{0:d}"
                                                    HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="BKG-DATE" DataField="bookingdate" DataFormatString="{0:d}"
                                                    HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="BKG-SLOT:SSN:TIME" DataField="bkgIDslotsession" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="STATUS" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                                <asp:BoundField HeaderText="STATUS-DATE" DataField="statusdate" HeaderStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td colspan="2" align="center" valign="top">
                                                <asp:Button ID="btnRTload" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                                    Text="RT LOAD" OnClick="btnRTload_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-th-list">
                                </span>REAL TEST LOADING </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" runat="server">
                            <div class="panel-body">
                                <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td width="65%">
                                            <label for="email7">
                                                RT-STUD-ID: NAME
                                            </label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtstudidname" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%">
                                            <label for="email8">
                                                RT-CMP ID:NAME
                                            </label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtcmpnyidname" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%">
                                            <label for="email10">
                                                RT-BK-ID</label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtbkid" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%">
                                            <label for="email11">
                                                RT-BK-DATE</label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtbkdate" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%">
                                            <label for="email12">
                                                BK-SLOT:SSN:TIME</label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtbksessiontime" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="65%">
                                            <label for="email13">
                                                RT-CTGY ID:NAME:GRP:SEM</label>
                                        </td>
                                        <td width="35%">
                                            <asp:TextBox ID="txtgrpsem" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd7">
                                                RT-SBJ ID:NAME</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtsbjidnmae" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd8">
                                                RT-ID
                                            </label>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtrtid" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd8">
                                                RT-ALLOWED TIME
                                            </label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtrtallowtime" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd10">
                                                RT-QSTNS</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtrtqtns" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd9">
                                                RT-TYPE</label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txttype" runat="server" class="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td width="30%" colspan="2" align="center" valign="top">
                                            <%--<button  type="submit" id="submit3">
                                                RT-COMMENCE</button>--%>
                                            <asp:Button runat="server" ID="btnCommence" Text="RT-COMMENCE" class="btn btn-primary btn-circle text-uppercase"
                                                OnClick="btnCommence_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <%--<button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit3">
                                                CANCEL</button>--%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"><span class="glyphicon glyphicon-road">
                                </span>REAL TEST</a>
                            </h4>
                        </div>
                        <div>
                            <div class="panel-body">
                                <div class="panel panel-default" runat="server" id="clspnldiv">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                            style="background-color: #CCC;">
                                            <tr>
                                                <td width="15%">
                                                    <label for="email7">
                                                        RT-STUD-ID:NAME
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtstidname" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td width="5%">
                                                    <label for="email8">
                                                        RT-CMP ID:NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtcmpidname" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td width="15%">
                                                    <label for="email14">
                                                        RT:BK:ID:DATE:SLT:SSN:TIME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtrtbkid" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                               
                                                <td>
                                                    <label for="email6">
                                                        BK-STATUS</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtbkstatus" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                              <td>
                                                    &nbsp;
                                                </td>
                                                <td  width="15%">
                                                    <label for="email2">
                                                        RT CTGRY:GRP:SEM:SUB</label>
                                                </td>
                                                <td  width="15%">
                                                    <asp:TextBox ID="txtcatidname" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                 <td width="10%">
                                                    <label for="email28">
                                                        RT-TIME
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtrttime" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td>
                                                    <label for="email2">
                                                        GROUP:SEM:SUBJECT</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtsubject" runat="server" class="form-control"></asp:TextBox>
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
                                            </tr>--%>
                                        </table>
                                    </div>
                                </div>
                                <%--<div class="panel panel-default" id="collpsediv" runat="server">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                            style="background-color: #CCC;">
                                            <tr>
                                                <td width="15%">
                                                    <label for="email26">
                                                        RT-ID:
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtrtqid" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email28">
                                                        RT-TIME
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtrttime" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                   <td width="18%">
                                                    <label for="email28">
                                                        RT-SYS TIME:00:00:00
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:TextBox ID="txtrtsystime" runat="server" class="form-control"></asp:TextBox>
                                                    <input type="text" id="dateTimeDisplay" class="date" readonly="readonly" />
                                                </td>
                                                <td width="15%">
                                                    &nbsp;
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="2%">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>--%>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                            style="background-color: #CCC;">
                                            <tr>
                                                <td>
                                                    <%--<asp:ModalPopupExtender ID="mdlpop" runat="server" TargetControlID="btnStart" PopupControlID="pnl"
                                                        BackgroundCssClass="modalBackground">
                                                    </asp:ModalPopupExtender>--%>
                                                    <div>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                                                            style="background-color: #CCC;">
                                                            <tr>
                                                                <td>
                                                                    <div>
                                                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                        </asp:ScriptManager>
                                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                            <ContentTemplate>
                                                                                <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="1000" runat="server">
                                                                                </asp:Timer>
                                                                                <asp:Label ID="Label3" runat="server"></asp:Label>
                                                                            </ContentTemplate>
                                                                        </asp:UpdatePanel>
                                                                        <hr />
                                                                        <asp:GridView PageSize="1" AllowPaging="True" Width="100%" ID="GridView1" runat="server"
                                                                            AutoGenerateColumns="False" ShowHeader="False" HeaderStyle-BackColor="#3479c7"
                                                                            class="table table-bordred table-striped" HeaderStyle-ForeColor="white" CellPadding="4"
                                                                            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound"
                                                                            OnRowCreated="GridView1_RowCreated" >
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderStyle-BorderWidth="0" ControlStyle-BorderWidth="0">
                                                                                    <HeaderTemplate>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table style="width: 90%" align="center" border="0">
                                                                                            <tr>
                                                                                                <td valign="top">
                                                                                                    <asp:Label ID="Label1" runat="server" Text='<%#GetID(Container.DataItem)%>'></asp:Label><asp:Label
                                                                                                        ID="Label2" runat="server" Text='<%#Eval("Question") %>' />
                                                                                                         <asp:HiddenField runat="server" ID="hdQuestionid" Value='<%#Eval("Qstn_ID")%>' />
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataTextField="Text" DataValueField="Value">
                                                                                                    </asp:RadioButtonList>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <ControlStyle BorderWidth="0px" />
                                                                                    <HeaderStyle BorderWidth="0px" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField Visible="false">
                                                                                    <ItemTemplate>
                                                                                       
                                                                                     <asp:HiddenField runat="server" ID="hdID" Value='<%#Eval("ID")%>' />

                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <PagerStyle ForeColor="Black" BackColor="#CCCCCC" HorizontalAlign="Left" CssClass="csspager"
                                                                                Font-Bold="true" />
                                                                            <FooterStyle BackColor="#CCCCCC" />
                                                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                                            <PagerSettings Position="Bottom" />
                                                                            <PagerTemplate>
                                                                                <asp:Button ID="btnPrevious" Width="100px" Height="40px" CssClass="btn btn-primary btn-circle text-uppercase"
                                                                                    OnClick="btnPrevious_Click" PostBackUrl="~/ACMP/RealTest-Commence.aspx" runat="server"
                                                                                    Text="Previous" CommandName="Page" CommandArgument="Previous" />&nbsp;&nbsp;&nbsp;
                                                                                <asp:Button ID="btnNext" Width="60px" Height="40px" CssClass="btn btn-primary btn-circle text-uppercase"
                                                                                    OnClick="btnNext_Click" PostBackUrl="~/ACMP/RealTest-Commence.aspx" runat="server"
                                                                                    Text="Next" CommandName="Page" CommandArgument="Next" />&nbsp;&nbsp;&nbsp;
                                                                                <asp:Button ID="btnSave" Width="60px" Height="40px" CssClass="btn btn-primary btn-circle text-uppercase"
                                                                                     OnClick="btnSave_Click"  PostBackUrl="~/ACMP/RealTest-Commence.aspx" runat="server"
                                                                                    Text="SAVE" CommandName="save" CommandArgument='<%#Eval("Qstn_ID") %>' />
                                                                                 <asp:HiddenField runat="server" visible="false"  ID="hdQID" Value='<%#Eval("ID")%>' />   
                                                                                    &nbsp;&nbsp;&nbsp;
                                                                                <asp:Button ID="btnExit" Width="60px" Height="40px" class="btn btn-danger btn-circle text-uppercase"
                                                                                    OnClick="btnExit_Click" PostBackUrl="~/ACMP/RealTest-Commence.aspx" runat="server"
                                                                                    Text="EXIT" CommandName="Page" CommandArgument="EXIT" />&nbsp;&nbsp;&nbsp;
                                                                                   
                                                                              
                                                                            </PagerTemplate>
                                                                            <RowStyle BackColor="White" />
                                                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                           
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="btnStart"
                                                        runat="server" onserverclick="btnStart_Click">
                                                        <span class="glyphicon glyphicon-floppy-saved" aria-hidden="true"></span>Start</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                   <%-- <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="Button2"
                                                        runat="server" onserverclick="btnSave_Click">
                                                        Save</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="Button3"
                                                        runat="server" onserverclick="btnExit_Click">
                                                        Exit</button>--%>
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
 
    </div>
</asp:Content>
