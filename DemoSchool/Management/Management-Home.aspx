<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Management-Home.aspx.cs" Inherits="PresentationLayer.Director.Management_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #main-content
        {
            margin-top: 20px;
        }
        .divwell
        {
           min-height: 20px;
  padding: 19px;
  margin-bottom: 20px;
  background-color: white;
  border: 1px solid #81AFC3;
  border-radius: 29px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
  box-shadow: inset 0 18px 23px rgba(5, 5, 5, 0.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<div class='container' id='main-content' style="margin-top: 10.5%;">
        <table style="width: 100%; margin-left: 50px;">
            <tr>
                <td style="width: 30%;">
                    <div class='divwell' style="width: 70%; height: 160px;">
                       <center> <b>OPERATIONS</b></center>  <br />
                       <ul type="square"
                       <li>
                       <a href="Admin-Home.aspx"><font style="color:blue;">Activate Users</font></a>
                       </li>
                       </ul>   
                    </div>
                </td>
                <td style="width: 30%;">
                    <div class='divwell' style="width: 70%; height: 160px;">
                        <center><b>ASSESSMENT</b></center>  
                    </div>
                </td>
                <td style="width: 30%;">
                    <div class='divwell' style="width: 70%; height: 160px;">
                    <center><b>REPORTS</b></center>    
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
