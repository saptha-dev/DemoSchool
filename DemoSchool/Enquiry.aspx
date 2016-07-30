<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Enquiry.aspx.cs" Inherits="DemoSchool.Enquiry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .textusername
        {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
            padding: 4px 20px 4px 8px;
            font-size: 17px;
            -moz-transition: all .2s linear;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
            font: 700 0.9em Lato, Arial, Helvetica, sans-serif;
        }
        
        .textusername:hover
        {
            outline: none;
            box-shadow: 0px 0px 5px #61C5FA;
            border: 1px solid #5AB0DB;
            border-radius: 0;
        }
        #tblPadding td
        {
            padding-top: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
  <div class="row">
    <div class="col-lg-12">
      <h1>Enquiry</h1>
      <div class="form-body registration col-lg-10 col-lg-offset-1 ">
        <h3> <span class="glyphicon glyphicon-user" aria-hidden="true" style="color:#202a5c;"></span> Please fill in the details below</h3>
        <hr>
           <table id="tblPadding" style="margin: auto; width: 80%; color: Black;">
             <tr>
                            <td>
                                <asp:Label ID="lblFName" runat="server" Text="First Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                 

                            <td>
                                <asp:Label ID="lblAddress1" runat="server" Text="Address 1 " Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress1" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblLastName" runat="server" Text="Last Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblempPhone" runat="server" Text="Address 2" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress2" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>
                                <asp:Label ID="lblFatherName" runat="server" Text="Father Name" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFatherName" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                              <td>
                            </td>
                              <td>
                                <asp:Label ID="lblAddress3" runat="server" Text="Address 3" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress3" class="textusername" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                              
                            <td>
                                <asp:Label ID="lblMobile" runat="server" Text="Mobile" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMObile" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                             </td>
                                <td>
                             </td>
                             <td>
                                <asp:Label ID="lblMandalTalukSubUrb" runat="server" Text="Mandal/Taluk/SubUrb" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMandal" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 100%;">
                                    <asp:ListItem Text="Mandal/Taluk/SubUrb" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="TELANGANA" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                 <tr>
                            <td>
                                <asp:Label ID="lblphone" runat="server" Text="Phone" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtphone" class="textusername" runat="server"></asp:TextBox>
                            </td>
                              <td>
                                  </td>
                            <td>
                                    </td>
                            <td>
                                <asp:Label ID="lblVillageTownCity" runat="server" Text="Village/Town/City" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlVillage" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 100%;">
                                    <asp:ListItem Text="Village/Town/City" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="TELANGANA" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="AP" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                                  </tr>

                  <tr>
                            <td>
                                <asp:Label ID="lblemail" runat="server" Text="Email-Id" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtemail" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lbldistrict" runat="server" Text="District" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtdistrict" class="textusername" runat="server"></asp:TextBox>
                            </td>
                      </tr>

                  <tr>
                           <td>
                                <asp:Label ID="lblEducation" runat="server" Text="Education/Qualification" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEduction" runat="server" class="textusername" AppendDataBoundItems="true"
                                    Style="width: 100%;">
                                    <asp:ListItem Text="Education" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblstate" runat="server" Text="State" Style="color: black; font-weight: bold;"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtState" class="textusername" runat="server"></asp:TextBox>
                            </td>
                         <tr>
                            <td>
                                <asp:Label ID="lbltechnical" runat="server" Text="Technical Skill" Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txttechnical" class="textusername" runat="server"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                 

                            <td>
                                <asp:Label ID="lblcountry" runat="server" Text="Country " Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtcountry" class="textusername" runat="server"></asp:TextBox>
                            </td>
                             <tr>
                                 <td>
                                <asp:Label ID="lblpin" runat="server" Text="PIN/Post Code " Style="color: black;
                                    font-weight: bold;"></asp:Label><font style="color: Red;">*</font>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpin" class="textusername" runat="server"></asp:TextBox>
                            </td>

                      </tr>
                              </table>
          <hr>
          </div>
       
    <div> </div>
  </div>
  <div class="topbar"></div>
</div>
<div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
</asp:Content>
