<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="content.aspx.cs" Inherits="PresentationLayer.Student.content"
    MasterPageFile="~/Student/StudentMasterPage.Master" %>

<asp:Content ID="headstyle" runat="server" ContentPlaceHolderID="head">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-ui.js" type="text/javascript"></script>
    <link href="../Styles/jquery-ui.css" rel="stylesheet" type="text/css" />

    <link href="../video/projekktor.style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.table-striped th
{
    text-align:center;
}
</style>
<script type="text/javascript">
    function hideAccordion() {
        $("#accordion").hide();
    }
   
</script>
<script type="text/javascript">
//    $(document).ready(function () {
//        $("#accordion").collapse("hide");

//    });
    function hidesDivs() {
        $("#textDiv").hide();
        $("#videoDiv").hide();
    }
    
    function hideVideoDiv() {
        $("#textDiv").show();
        $("#videoDiv").hide();
    }
    function hideTextDiv() {
        $("#textDiv").hide();
        $("#videoDiv").show();
    }
</script>
<script type="text/javascript">
    function callPath(value) {
    var videocontainer = document.getElementById('videoclip');
    var videosource = document.getElementById('mp4video');
    videocontainer.pause();
    var sour=videosource.setAttribute('src',"../UploadedFile/VideoFiles/" + value);
    videocontainer.load();
    videocontainer.play();
    }
</script>
<script type="text/javascript">
    function callPathText(value) {
        var txtsource = document.getElementById('pdfFrame');
        txtsource.setAttribute('src', "../UploadedFile/TextFile/" + value);
     
    }
</script> 
  
    <script type="text/javascript">
        $(document).ready(function () {
            var pdfPath = $("#" + '<%= srcFile.ClientID %>').val();
            $('#pdfFrame').attr('src', pdfPath);

        });
    
    </script>

</asp:Content>
<asp:Content ID="studentContentBody" runat="server" ContentPlaceHolderID="body">
<asp:HiddenField ID="getstring" runat="server" />
<asp:HiddenField ID="srcFile" runat="server" />
    <asp:ScriptManager ID="smMain" runat="server" />
    <div class="container">
        <div class="row">
            <div class="col-xs-12  ">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            MY-CONTENT
                        </h3>
                    </div>
                    <div class="panel-body">
                        <div>
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <table width="49%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                    <tr>
                                        <td>
                                            <label for="pwd">
                                                Select Category</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" class="form-control"
                                                OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <input type="text" name="input" runat="server" id="txtddlCategory" tabindex="1" readonly="true"
                                                class="form-control" visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd3">
                                                Select Category Group</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" runat="server" AutoPostBack="true" class="form-control"
                                                OnSelectedIndexChanged="ddlGroup_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <input type="text" name="input" runat="server" id="txtddlGroup" tabindex="1" readonly="true"
                                                class="form-control" visible="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="pwd2">
                                                Select Subject</label>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlSubjects" runat="server" AutoPostBack="true" class="form-control"
                                                        OnSelectedIndexChanged="ddlSubjects_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%">
                                            <label for="pwd">
                                                SELECT CONTENT-TYPE:</label>
                                        </td>
                                        <td width="60%">
                                       <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
                                                <ContentTemplate>
                                            <asp:DropDownList ID="ddlContentType" runat="server" AutoPostBack="true" 
                                                class="form-control" 
                                                onselectedindexchanged="ddlContentType_SelectedIndexChanged">
                                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Text" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Video" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                            </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                                <td width="15%">
                                                    <label for="email2">
                                                        CATEGORYID: NAME:GRP:SEM/YR
                                                    </label>
                                                </td>
                                                <td width="15%">
                                                    <input type="text" name="input19" id="txtCategoryName" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                                <td width="2%">
                                                    &nbsp;
                                                </td>
                                                <td width="18%">
                                                    <label for="email4">
                                                        START DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <input type="text" name="input19" id="txtCategoryStartDate" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                                <td width="2%">
                                                </td>
                                                <td width="18%">
                                                    <label for="email5">
                                                        END-DATE</label>
                                                </td>
                                                <td width="15%">
                                                    <input type="text" name="input19" id="txtCategoryEndDate" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="email7">
                                                        DURATION</label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input19" id="txtCategoryDuration" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <label for="email8">
                                                        STATUS</label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input19" id="txtCategoryStatus" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <label for="email8">
                                                        STATUS-DATE</label>
                                                </td>
                                                <td>
                                                    <input type="text" name="input19" id="txtCategoryStatusDate" runat="server" readonly="true"
                                                        tabindex="1" class="form-control" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddlContentType" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                    <tr>
                                                        <td width="15%">
                                                            <label for="email2">
                                                                SUBJ-ID:NAME
                                                            </label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectName" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                            &nbsp;
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email4">
                                                                CONTENT-TYPE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectContentType" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td width="2%">
                                                        </td>
                                                        <td width="18%">
                                                            <label for="email5">
                                                                START DATE</label>
                                                        </td>
                                                        <td width="15%">
                                                            <input type="text" name="input19" id="txtSubjectStartDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                END-DATE</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectEndDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                DURATION</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectDuration" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td>
                                                            <label for="email8">
                                                                STATUS</label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectStatus" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <label for="email7">
                                                                STATUS-DATE
                                                            </label>
                                                        </td>
                                                        <td>
                                                            <input type="text" name="input19" id="txtSubjectStatusDate" runat="server" readonly="true"
                                                                tabindex="1" class="form-control" />
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
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <table id="mytable" class="table table-bordred table-striped">
                                            <thead>
                                                <th>
                                                    <input name="" type="checkbox" value="" />
                                                </th>
                                                <th>
                                                    SUBJ-UNITNO:NAME
                                                </th>
                                                <th>
                                                    SUBJECT-SECTION NO:NAME
                                                </th>
                                                <th>
                                                    STUD-STARTED-DATE
                                                </th>
                                                <th>
                                                    STUD-CMPLTED-DATE
                                                </th>
                                                <th>
                                                    STUD—CNT-STATUS
                                                </th>
                                                <th>
                                                    CNT-STATUS-DATE
                                                </th>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input name="" type="checkbox" value="" />
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input name="" type="checkbox" value="" />
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input name="" type="checkbox" value="" />
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                    <td>
                                                        xxxx xx
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-info" id="textDiv">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-tasks">
                                                        </span>TEXT</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-12 ">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                    <tr>
                                                                        <td width="24%">
                                                                            <label for="email2">
                                                                                CONTENT:CATEGORY:GRP:SEM&nbsp;&nbsp;
                                                                            </label>
                                                                        </td>
                                                                        <td width="21%">
                                                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                value="" />
                                                                        </td>
                                                                        <td width="4%">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="25%">
                                                                            <label for="email4">
                                                                                SUBJECT:UNITNO:UNIT-NAME</label>
                                                                        </td>
                                                                        <td width="26%">
                                                                            <input type="text" name="input2" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                value="" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 17px;">
                                                            <div class="col-xs-4">
                                                                <div class="well text-CENTER">
                                                                    <div class="row">
                                                                        <h4>
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-list"> </span>SELECT SECTION</h4>
                                                                    </div>
                                                                    <%--<ul class="list-group">
                                                                        <li class="list-group-item"><a href="#">SECTION 1</a></li>
                                                                        <li class="list-group-item"><a href="#">SECTION 1</a></li>
                                                                        <li class="list-group-item"><a href="#">SECTION 1</a></li>
                                                                        <li class="list-group-item"><a href="#">SECTION 1</a></li>
                                                                        <li class="list-group-item"><a href="#">SECTION 1</a></li>
                                                                    </ul>--%>
                                                                <asp:UpdatePanel ID="gvsUpdatePaneltext" runat="server">
                                                                   <Triggers>
                                                                   <asp:AsyncPostBackTrigger ControlID="ddlContentType" />
                                                                 
                                                                   </Triggers>
                                                                   <ContentTemplate>
                                                                    <asp:GridView ID="GvstudentUnitInfo" runat="server" HeaderStyle-BackColor="#3AC0F2" class="table table-striped"
                                                                        HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                                                        AlternatingRowStyle-ForeColor="#000" runat="server"  AutoGenerateColumns="false" >
                                                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                                                                        <Columns>
                                                                        <%--   <asp:HyperLinkField DataTextField="BrowsedFilePath" DataNavigateUrlFields="BrowsedFilePath" HeaderStyle-HorizontalAlign="Center"
                                                                                HeaderText="Units" ItemStyle-Width="150" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"/>--%>
                                                                            <asp:TemplateField HeaderText="UNITS">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lbtnBOLNo" runat="server" Text='<%# Eval("BrowsedFilePath") %>' OnClick="PartialPostBack" ></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                               </ContentTemplate>
                                                                   
                                                                   </asp:UpdatePanel>
                                                                   
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-8">
                                                                <div class="panel panel-default" style="padding: 0px 10px 10px  10px;">
                                                                    <div class="panel-body">


                                                                  <asp:UpdatePanel ID="updatepanelText" runat="server"  UpdateMode="Conditional" ChildrenAsTriggers="true" >
                                                                  <ContentTemplate>
                                                                    <iframe id='pdfFrame' style="width:500px; height:500px;" frameborder="0"  name="pdfFrame" ></iframe>
                                                                    </div>
                                                                    </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                            <tr>
                                                                <td width="30%" colspan="2" align="center" valign="top" style="text-align: right">
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class=" glyphicon glyphicon-arrow-left"></span>PREVIOUS</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class="glyphicon glyphicon-arrow-right"></span>NEXT</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class="glyphicon glyphicon-log-out"></span>EXIT</button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel panel-info" id="videoDiv">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-play">
                                                        </span>PLAY-CONTENT</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <div class="row">
                                                            <div class="col-xs-12 ">
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                                                    <tr>
                                                                        <td width="24%">
                                                                            <label for="email2">
                                                                                CONTENT:CATEGORY:GRP:SEM&nbsp;&nbsp;
                                                                            </label>
                                                                        </td>
                                                                        <td width="21%">
                                                                            <input type="text" name="input2" id="input2" tabindex="1" class="form-control" placeholder=""
                                                                                value="" />
                                                                        </td>
                                                                        <td width="4%">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="25%">
                                                                            <label for="email4">
                                                                                SUBJECT:ID:NAME</label>
                                                                        </td>
                                                                        <td width="26%">
                                                                            <input type="text" name="input2" id="input3" tabindex="1" class="form-control" placeholder=""
                                                                                value="" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 17px;">
                                                            <div class="col-xs-4">
                                                                <div class="well text-CENTER">
                                                                    <div class="row">
                                                                        <h4> &nbsp;&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-list"> </span>SELECT UNIT</h4>
                                                                    </div>
                                                                    
                                                                  <asp:UpdatePanel ID="gvsUpdatePanel" runat="server">
                                                                   <Triggers>
                                                                     <asp:AsyncPostBackTrigger ControlID="ddlContentType" />
                                                                   
                                                                   </Triggers>
                                                                   <ContentTemplate>
                                                                    <asp:GridView ID="GvVideoContent" runat="server" HeaderStyle-BackColor="#3AC0F2" class="table table-striped"
                                                                        HeaderStyle-ForeColor="White" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                                                        AlternatingRowStyle-ForeColor="#000" runat="server"  AutoGenerateColumns="false"  >
                                                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                                                                        <Columns>
                                                                        <%--   <asp:HyperLinkField DataTextField="BrowsedFilePath" DataNavigateUrlFields="BrowsedFilePath" HeaderStyle-HorizontalAlign="Center"
                                                                                HeaderText="Units" ItemStyle-Width="150" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center"/>--%>
                                                                        
                                                                        
                                                                          <asp:TemplateField HeaderText="UNITS">
                                                                                <ItemTemplate>
                                                                                 <asp:UpdatePanel ID="gridUpdatePanel" runat="server">
                                                                                  <ContentTemplate>
                                                                                    <asp:LinkButton ID="lbtnBOLNo" runat="server" Text='<%# Eval("BrowsedFilePath") %>' OnClick="PartialPostBack" ></asp:LinkButton>
                                                                             </ContentTemplate>
                                                                           </asp:UpdatePanel>
                                                                              </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                  </ContentTemplate>
                                                                   </asp:UpdatePanel>
                                                             </div>
                                                             </div>
                                                            <div class="col-xs-8" style="width:65%">
                                                                <div class="panel panel-default" style="padding: 0px 10px 10px  10px;" >
                                                                  <div class="panel-body">
                                                                  <asp:UpdatePanel ID="updateVideo" runat="server"  UpdateMode="Conditional" ChildrenAsTriggers="true" >
                                                                  <ContentTemplate>
                                                                 <%--    <div id="player_a" class="projekktor" style="width: 615px; height: 385px;  margin-top: 3%;">
                                                                        </div>--%>
                                                                <video id="videoclip" controls="controls" poster="images/cover.jpg" title="Video title" style="margin-top: 10px;width:100%" >
                                                                  <source id="mp4video"  type="video/mp4"  />
                                                                 </video>
                                                                
                                                                  </ContentTemplate>
                                                                  </asp:UpdatePanel>
                                                                    </div>
                                                               
                                                                 </div>
                                                                  
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="formtable">
                                                            <tr>
                                                                <td width="30%" colspan="2" align="center" valign="top" style="text-align: right">
                                                                    <button class="btn btn-primary btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class=" glyphicon glyphicon-play"></span>PREVIOUS</button>
                                                                    &nbsp;&nbsp;
                                                                    <button class="btn btn-danger btn-circle text-uppercase" type="submit" id="submit">
                                                                        <span class="glyphicon glyphicon-log-out"></span>EXIT</button>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="formtable">
                                            <tr>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav tabs -->
                            <!-- Tab panes -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
