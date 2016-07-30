<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="RealTest-booking.aspx.cs" Inherits="PresentationLayer.ACMP.RealTest_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
 <%--<asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>--%>
    <asp:ToolkitScriptManager ID="tscrptmgr" runat="server"></asp:ToolkitScriptManager>
    
<asp:UpdatePanel ID="UpdatePanel" runat="server">
<ContentTemplate>
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            BOOKING INFORMATION
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <%--<tr>
                                <td width="65%">
                                    <label for="email">
                                        SELECT BRANCH</label>
                                </td>
                                <td width="35%">
                                   <asp:DropDownList ID="ddlbranch" runat="server" class="form-control" 
                                        AutoPostBack="true" 
                                       AppendDataBoundItems="true" 
                                        onselectedindexchanged="ddlbranch_SelectedIndexChanged1" >
                                    </asp:DropDownList>
                                </td> 
                            </tr>--%>
                            <tr>
                                <td width="65%">
                                    <label for="email">
                                        SELECT CATEGORY</label>
                                </td>
                                <td width="35%">
                                    <asp:DropDownList ID="ddlcategory" runat="server" class="form-control" 
                                        AutoPostBack="true" AppendDataBoundItems="true" 
                                        onselectedindexchanged="ddlcategory_SelectedIndexChanged" >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd12">
                                        SELECT GROUP:SEM</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlGroup" runat="server" class="form-control" AppendDataBoundItems="true" 
                                        AutoPostBack="true" onselectedindexchanged="ddlGroup_SelectedIndexChanged"
                                      >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd">
                                        SELECT SUBJECT</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlsubject" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="ddlsubject_SelectedIndexChanged"
                                    AppendDataBoundItems="true"   >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd3">
                                        SELECT STUD- NAME</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlstudentname" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="ddlstudentname_SelectedIndexChanged"
                                       >
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <label for="pwd">
                                        SELECT BK-ID</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlBkId" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="ddlBkId_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>--%>
                            <tr>
                                <td>
                                    <label for="pwd5">
                                        BKD-DATE</label>
                                </td>
                                <td>
                                    <%--<asp:DropDownList ID="ddlbkDate" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="ddlbkDate_SelectedIndexChanged">
                                    </asp:DropDownList>--%>
                                    <%--<asp:TextBox runat="server" ID="txtbkDate" class="form-control" ></asp:TextBox>--%>
                                    <asp:Label runat="server" ID="lblbkDate"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd8">
                                        BKD-SLOT</label>
                                </td>
                                <td>
                                    <%--<asp:DropDownList ID="DDlbookslot" runat="server" class="form-control" 
                                        AutoPostBack="true" onselectedindexchanged="DDlbookslot_SelectedIndexChanged">
                                    </asp:DropDownList>--%>
                                    <%--<asp:TextBox runat="server" ID="txtbookslot" class="form-control" ></asp:TextBox>--%>
                                    <asp:Label runat="server" ID="lblbookslot"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd9">
                                        BKD-SESSION</label>
                                </td>
                                <td>
                                    <%--<asp:DropDownList ID="ddlbooksession" runat="server" class="form-control" 
                                        AutoPostBack="true" 
                                        onselectedindexchanged="ddlbooksession_SelectedIndexChanged">
                                    </asp:DropDownList>--%>
                                    <%-- <asp:TextBox runat="server" ID="txtbooksession" class="form-control" ></asp:TextBox>--%>
                                    <asp:Label runat="server" ID="lblbooksession"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd4">
                                        BKD-TIME</label>
                                </td>
                                <td>
                                   <%-- <asp:DropDownList ID="ddlBooktime" runat="server" class="form-control" 
                                        AutoPostBack="true" 
                                        onselectedindexchanged="ddlBooktime_SelectedIndexChanged" >
                                    </asp:DropDownList>--%>
                                     <%--<asp:TextBox runat="server" ID="txtBooktime" class="form-control" ></asp:TextBox>--%>
                                      <asp:Label runat="server" ID="lblBooktime"></asp:Label>
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
        <div class="col-xs-12 ">
        <div class="panel panel-info">
                   <div class="panel-heading">
                        <h3 class="panel-title">
                            BOOKING UPDATION
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="52%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                        <tr>
                        <td colspan="2" align="center">
                        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
                        </td>
                        </tr>
                            <tr>
                                <td>
                                    <label for="pwd7">
                                        SELECT NEW-BKG-DATE</label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtcal" runat="server" class="form-control" PlaceHolder="Date(dd-MM-yyyy)"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtcal" ValidationGroup="UPLD"></asp:RequiredFieldValidator>
                                   <%-- <asp:ImageButton ID="imgcal" runat="server" ImageUrl="~/Images/calender.png" Width="20"
                                            Height="20"/>
                                    <asp:CalendarExtender runat="server" ID="CEDate" Enabled="true" PopupButtonID="imgcal" TargetControlID="txtcal" PopupPosition="Right" Format="dd-MM-yyyy"></asp:CalendarExtender>--%>
                                <%--  <asp:TextBox ID="txtcal" runat="server" class="textusername datePick" 
                                        Width="128px"></asp:TextBox>
                                            <img src="../Images/calender.png" id="Img5" /--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd10">
                                        SELECT NEW-SLOT</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlnewbklot" runat="server" class="form-control" AutoPostBack="true">
                                     <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                   <asp:ListItem Text="Slot-A" Value="1"></asp:ListItem>
                                   <asp:ListItem Text="Slot-B" Value="2"></asp:ListItem>
                                   <asp:ListItem Text="Slot-C" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddlnewbklot" InitialValue="0" ValidationGroup="UPLD"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="pwd6">
                                        SELECT NEW-BKG-SESSION</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlnewbksion" runat="server" class="form-control" AutoPostBack="true">
                                      <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                   <asp:ListItem Text="Morning" Value="1"></asp:ListItem>
                                   <asp:ListItem Text="Afternoon" Value="2"></asp:ListItem>
                                   <asp:ListItem Text="Evening" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ForeColor="Red" ControlToValidate="ddlnewbksion" InitialValue="0" ValidationGroup="UPLD"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="65%">
                                    <label for="pwd2">
                                        SELECT BK-TIME</label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlnwbktime" runat="server" class="form-control" AutoPostBack="true">
                                   <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                   <asp:ListItem Text="10:00" Value="1"></asp:ListItem>
                                   <asp:ListItem Text="12:00" Value="2"></asp:ListItem>
                                   <asp:ListItem Text="14:00" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="16:00" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ForeColor="Red" ControlToValidate="ddlnwbktime" InitialValue="0" ValidationGroup="UPLD"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="30%" colspan="2" align="center" valign="top">
                                    <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-circle text-uppercase"
                                        Text="UPDATE" onclick="Button1_Click" ValidationGroup="UPLD"/>
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
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            ACMP-RT-BOOKINGS
                        </h3>
                    </div>
                    <div class="panel-body">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                            style="background-color: #CCC;">
                            <tr>
                                <td width="15%">
                                    <label for="email2">
                                        ACMP:NAME
                                    </label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblAcmpName" runat="server" Text=""></asp:Label>
                                </td>
                                <td width="2%">
                                    &nbsp;
                                </td>
                                <td width="18%">
                                    <label for="email3">
                                        ACMP-LOCATION</label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblAcmpLoc" runat="server" Text=""></asp:Label>
                                </td>
                                <td width="2%">
                                </td>
                                <td width="18%">
                                    <label for="email4">
                                        ACMP-STATUS</label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblAcmpStatus" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <hr />
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable"
                            style="background-color: #CCC;">
                            <tr>
                                <td width="15%">
                                    <label for="email46">
                                        CTGY-ID
                                    </label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblCatId" runat="server" Text=""></asp:Label>
                                </td>
                                <td width="2%">
                                    &nbsp;
                                </td>
                                <td width="18%">
                                    <label for="email47">
                                        CTGRY-NAME</label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblctaname" runat="server" Text=""></asp:Label>
                                </td>
                                <td width="2%">
                                </td>
                                <td width="18%">
                                    <label for="email48">
                                        CTGRY-STATUS</label>
                                </td>
                                <td width="15%">
                                    <asp:Label ID="lblcatstatus" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                            <tr>
                                <td width="100%">
                                    <h4>
                                        ACMP BOOKINGS LIST</h4>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <asp:GridView ID="GVbooking" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                    HeaderStyle-ForeColor="white" Enabled="true" AllowPaging="true" Style="width: 100%" PageSize="5">
                                                    <Columns>
                                                        <%--<asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <asp:Label ID="lbl1" runat="server" Text="Select"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chkbx" runat="server" />
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>--%>
                                                        <asp:BoundField HeaderText=" BK-ID " DataField="S_No" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" BK-DATE" DataField="BookingDate" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd-MM-yyyy}"/>
                                                        <asp:BoundField HeaderText="SUBJECT-NAME" DataField="subjectname" DataFormatString="{0:d}"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" STUD-ID:NAME" DataField="UserID" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" BK-STATUS" DataField="Status" DataFormatString="{0:d}"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText="BK-STATUS-DATE" DataField="StatusDate" DataFormatString="{0:dd-MM-yyyy}"
                                                            HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" BK-NEW DATE" DataField="Newbooking_date" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd-MM-yyyy}"/>
                                                        <asp:BoundField HeaderText="BK-NEW-SLOT" DataField="NewBK_Slot" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" BK-NEW-SSN" DataField="NewBK_Session" HeaderStyle-HorizontalAlign="Center" />
                                                        <asp:BoundField HeaderText=" BK-NEW-TIME" DataField="Newbooking_Time" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                    <%--    <asp:BoundField HeaderText=" BK-REMARKS" DataField="Subject_Remarks" HeaderStyle-HorizontalAlign="Center" />--%>
                                                    </Columns>
                                                </asp:GridView>
                                                <%--<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                    <tr>
                                                        <td width="30%" colspan="2" align="center" valign="top">
                                                            <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                RT-COMMENCE</button>
                                                        </td>
                                                    </tr>
                                                </table>--%>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
      </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
