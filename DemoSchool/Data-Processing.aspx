<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Data-Processing.aspx.cs" Inherits="DemoSchool.Data_Processing" %>
<asp:Content ID="Design" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        p
        {
            font-family: Times New Roman;
            font-size: 15px;
            text-align: justify;
        }
    </style>
    <script type="text/javascript">


        $(document).ready(function () {
            activaTab('DataProcess');
        });

        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
  <div class="row">
    <div class="col-lg-12">
<table style="width: 90%; margin: auto;  margin-left: 7%; margin-top: 40px; margin-bottom: 20px; border: 1px solid silver">
        <tr>
            <td>
                <h4 style="margin-left: 22px">
                    CONSULTING:</h4>
            </td>
        </tr>
        <tr>
            <td>
                <p style=" margin-left: 20px;  margin-right: 12px; ">
                    IBMS provides consulting services and solutions. IBMS understood the growing need
                    for qualified technicians and consultants in the global or local markets. Based
                    on its Market research, the combination of right people for the right positions
                    makes a company to grow faster and achieve their respective goals. IBMS is ready
                    to offer you its best of breed people to work closely with you. IBMS provides experts
                    to you with the deserved technology and with the required skills and practical knowledge.
                    Our Consulting services to the clients in the areas ranging from:
                </p>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table style="width: 88%; margin: auto; margin-left: 1%;">
                    <tr>
                        <td align="center">
                            <div class="panel panel-default" style="width: 100%; padding: 15px; margin: 12px;  height: 363px;">
                                <div id="Tabs" role="tabpanel">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist" style="background-color: burlywood;">
                                         <li><a href="#Data" aria-controls="Data" role="tab" data-toggle="tab">Data Management</a></li>
                                        <li><a href="#DataProcess" aria-controls="DataProcess" role="tab" data-toggle="tab">Data Processing </a></li>
                                        <li><a href="#DataCollect" aria-controls="DataCollect" role="tab" data-toggle="tab"> Data Collection </a></li>
                                        <li><a href="#Market" aria-controls="Market" role="tab" data-toggle="tab">Market Research</a></li>
                                        <li><a href="#Health" aria-controls="Health" role="tab" data-toggle="tab">Health Research</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content" style="padding-top: 20px">
                                        <div role="tabpanel" class="tab-pane active" id="Data">
                                            <p style=" margin-right: 20px">
                                               Data IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="Health">
                                            <p style=" margin-right: 20px">
                                              Health  IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="Market">
                                            <p style=" margin-right: 20px">
                                              Market  IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="DataProcess">
                                            <p style="margin-right: 20px">
                                               DataProcess IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="DataCollect">
                                            <p style=" margin-right: 20px">
                                                DataCollect IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="Units">
                                            <p style="margin-right: 20px">
                                                Units IBMS provides consulting services and solutions. IBMS understood the growing need
                                                for qualified technicians and consultants in the global or local markets. Based
                                                on its Market research, the combination of right people for the right positions
                                                makes a company to grow faster and achieve their respective goals. IBMS is ready
                                                to offer you its best of breed people to work closely with you. IBMS provides experts
                                                to you with the deserved technology and with the required skills and practical knowledge.
                                                Our Consulting services to the clients in the areas ranging from:
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
    </table>      
</div>
    
    <div> </div>
  </div>
  <div class="topbar"></div>
</div>
<div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
</asp:Content>
