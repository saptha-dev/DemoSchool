<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="VisionIbms.aspx.cs" Inherits="DemoSchool.VisionIbms" %>
<asp:Content ID="Styles" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    #homecontent td
    {
       padding:20px;
    }
    hr
    {
        border:1px solid silver;
        width:100%;
    }
    .drop-shadow div
    {
        width:100%;height:30px;background-color:#002290;color:White;
    }
    .innerdiv p
    {
        text-align:center;
        padding-top:5px;
    }
    p
    {
        font-family:Times New Roman;
        font-size:17px;
        text-align: justify;
        margin-right:10px;
    }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
    <table id="homecontent" style="width: 72%; margin-left: 12%;">
        <tr>
            <td>
            <div style="font-weight: bold;font-size: 27px;">IBMS Vision</div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 230px; width:84%; border-style: groove; border-radius: 13px; box-shadow: 11px 13px 17px rgb(128, 119, 119);">
                    <p style="margin-top: 17px; color: Black; margin-left: 12px;">
                        To create desired work culture capable of meeting global challenges through innovative
                        education system integrating industrial requirements. We value the customer utmost
                        and are committed to provide customized and standardized services to customers by
                        creating practices powered by intellectuality and setting standardized models. We
                        creating Professional environment for training and skill development programs to
                        focus on continuous learning and growth. We are committed for giving best industry
                        exposure in projects with regular practical training on evolving methodologies in
                        research and health industries.</p>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="height: 189px; width: 70%;margin-left: 29%; border-style: groove; border-radius: 13px;
                    box-shadow: 11px 13px 17px rgb(128, 119, 119);">
                    <p style="margin-top: 17px; color: Black;">
                        <ul style="color: Black;font-family:Times New Roman;font-size:17px;">
                            <li>Industry and Government recognized.</li>
                            <li>Best study Material. </li>
                            <li>Commitment to continuous improvement. </li>
                            <li>Best training methods and practices.</li>
                            <li>Hands on experience in real life working environment. </li>
                            <li>100% Genuine & dedicated Service to local and global customers.</li>
                        </ul>
                    </p>
                </div>
            </td>
        </tr>
    </table>
      <br />
       
     </div>
      <div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
   
</asp:Content>
