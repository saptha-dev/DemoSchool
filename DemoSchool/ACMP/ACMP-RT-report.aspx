<%@ Page Title="" Language="C#" MasterPageFile="~/ACMP/ACMPMaster.Master" AutoEventWireup="true"
    CodeBehind="ACMP-RT-report.aspx.cs" Inherits="PresentationLayer.ACMP.ACMP_RT_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="update" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    ACMP-RT-REPORT
                                </h3>
                            </div>
                            <div class="panel-body">
                                <div class="panel-body">
                                    <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                        <tr>
                                            <td width="40%">
                                                <label for="email">
                                                    Select Branch</label>
                                            </td>
                                            <td width="60%">
                                                <asp:DropDownList ID="ddlBranch" class="form-control" AutoPostBack="true" runat="server"
                                                    OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="40%">
                                                <label for="email">
                                                    Select Program</label>
                                            </td>
                                            <td width="60%">
                                                <asp:DropDownList ID="ddlProgram" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="pwd">
                                                    Select Category</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlCategory" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="pwd3">
                                                    Select Category Group</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlGroup" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label for="pwd">
                                                    Select Subject</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlSubject" class="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td>
                                                <label for="pwd3">
                                                    SEELECT STUDENT- NAME</label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlstudentname" runat="server" class="form-control" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlstudentname_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>--%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12  ">
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                <tr>
                                                    <td width="100%">
                                                        <h4>
                                                            ACMP REAL TEST LIST</h4>
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                <asp:GridView ID="GrdRtreport" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" 
                                                PageSize="8" >
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <HeaderTemplate>
                                                            <asp:Label ID="lbl1" runat="server" Text="Select"></asp:Label>
                                                            
                                                        </HeaderTemplate>
                                                   <ItemTemplate>
                                                            <asp:Button runat="server" ID="btnprint" Text="View/Print" 
                                                            class="btn btn-sm bg-success btn-circle text-uppercase" OnClick="btnprint_Click" />
                                                        </ItemTemplate>
                                                       
                                                    </asp:TemplateField>
                                                    <asp:TemplateField >
                                                     <ItemTemplate>
                                                        <asp:HiddenField ID="hdnid" runat="server" Value='<%#Eval("DetailsID") %>' />
                                                         <asp:Label ID="ID" runat="server" Text='<%#Eval("UserID") %>' Visible="false"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="  STUD-ID-Name" DataField="studIdname" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Mobile" DataField="MobileNumber"
                                                        HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Email" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText=" Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Status-Date" DataField="StatusDate" DataFormatString="{0:dd:MM:yyy}"
                                                        HeaderStyle-HorizontalAlign="Center" />
                                                   <%-- <asp:BoundField HeaderText="RT-ACMP-NAME" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />--%>
                                                   <%-- <asp:BoundField HeaderText="RT-ACMP-LOC" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />--%>
                                                    <asp:BoundField HeaderText="ASMT-Date" DataField="BookingDate"  DataFormatString="{0:dd:MM:yyy}" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="ASMT-Time" DataField="BookingTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                    <asp:BoundField HeaderText="ASMT-Status-Date" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd:MM:yyy}"/>
                                                    <asp:BoundField HeaderText="RT-BKID" DataField="S_No" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="RT-BKD-Date:Slot:SSN:Time" DataField="bkgIDslotsession" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="ASMT-Time" DataField="BookingTime" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:hh:mm}"/>
                                                    <asp:BoundField HeaderText="RT-Status" DataField="Publish_Status" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="RT-Status-Date" DataField="StatusDate" HeaderStyle-HorizontalAlign="Center" DataFormatString="{0:dd:MM:yyy}"/>
                                                    <asp:BoundField HeaderText="RT-Remarks" DataField="Remarks" HeaderStyle-HorizontalAlign="Center" />
                                                </Columns>
                                            </asp:GridView>
                                                </td>
                                                </tr>
                                            </table>
                                            
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel ID="view" runat="server" Visible="false">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="8">
                                                    <h4 style="text-align: center;">
                                                        STUDENT REAL TEST REPORT</h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email46">
                                                        RT-ID</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblRTID" runat="server"></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email47">
                                                        STUDENT-ID-NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblStudentName" runat="server" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email48">
                                                        ACMP-ID-NAME</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblACMPIDName" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email49">
                                                        ACMP-LOC</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblACMPName" runat="server" ></asp:Label>
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
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td colspan="5">
                                                    <h4>
                                                        CATEGORY-ID:NAME:GROUP:SEMISTER/YEAR:SUBJECT-ID:NAME
                                                    </h4>
                                                </td>
                                                <td colspan="3">
                                                    <asp:Label ID="lblCategoryDetails" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="15%">
                                                    <label for="email52">
                                                        RT-BOOKING-ID</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblRTBkngID" runat="server" ></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        RT-BOOKING-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblRTBkngDate" runat="server"></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        BOOKING-SLOT</label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblRTBnkgSlot" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email55">
                                                        RT-BOOKING-SSN
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTBkngSSN" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        RT-BOOKING-TIME</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTBkngTime" runat="server" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        RT-ANSWERED-QSTNS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTAnsQstns" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email2">
                                                        RT-UNANSWERED-QSTNS
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTUnAnsQstns" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email4">
                                                        RT-INCORRECT-ANSWERS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTInCorrectAns" runat="server" ></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email4">
                                                        RT-CORRECT-ANSWERS</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTCorrectAns" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email5">
                                                        RT-STATUS-DATE</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblRTStatusDate" runat="server" ></asp:Label>
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
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td width="15%">
                                                    <label for="email52">
                                                        REAL-TEST ID:
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblrtstID" runat="server" Text="Unavilable"></asp:Label>
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email53">
                                                        REAL TEST-DATE:
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblrtdate" runat="server" Text="Unavilable"></asp:Label>
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email54">
                                                        REAL TEST-SLOT: SSN:TIME
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <asp:Label ID="lblslotsession" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email55">
                                                        RT-TOT-QSTNS:
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbltotqns" runat="server"></asp:Label>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email56">
                                                        STATUS:</label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lblsts" runat="server" Text="Unavilable"></asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="table-responsive">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="formtable">
                                                <tr>
                                                    <td width="100%">
                                                        <h4>
                                                            RT QUESTIONS</h4>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:GridView ID="GVQstns" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#3479c7"
                                                HeaderStyle-ForeColor="white" AllowPaging="true" Style="width: 100%" PageSize="10"
                                                OnPageIndexChanging="GVQstns_PageIndexChanging">
                                                <HeaderStyle Height="35px" Font-Size="14px" HorizontalAlign="Center" />
                                                <Columns>
                                                    <asp:BoundField HeaderText="Qstn Name" DataField="Question" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Option-A" DataField="A" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Option-B" DataField="B" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Option-C" DataField="C" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Option-D" DataField="D" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="Option-E" DataField="E" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="STD-ANSR" DataField="Ans" HeaderStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField HeaderText="CRCT-ANSR" DataField="RealAns" HeaderStyle-HorizontalAlign="Center" />
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
