<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="R-D Center.aspx.cs" Inherits="DemoSchool.R_D_Center" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    
    </style>
     <link href="Styles/AccreditionsStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .tab-pane
        {
            border: 1px solid silver;
        }
        .nav-tabs li
        {
            width: 150px;
            padding: 5px;
        }
        .nav-tabs li a
        {
            border-radius: 10px;
        }
        p
        {
            font-family: Times New Roman;
            font-size:16px;
        }
         .nav-tabs li a:hover
         {
             background:silver;
             text-shadow:0px 0px 6px white;
             transition:background 0.3s;
             transition-timing-function: ease-in;
         }
        p
        {
            font-family: Times New Roman;
            font-size:16px;
        }
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
        color: white;
        background: #3D5271;
        text-shadow:0px 0px 6px white;
        }
    </style>

    <script type="text/javascript">


        $(document).ready(function () {
            activaTab('RD');
        });

        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
 
    
    <div>
        <table style="width: 80%; margin: auto; margin-top: 10px; margin-bottom: 10px; margin-left: 166px;">
        <tr>
            <td align="center">
                <div class="tabbable">
                    <!-- Only required for left/right tabs -->
                    <div class="tabbable tabs-left" style="border-style: groove;height:620px;">
                        <ul class="nav nav-tabs">
                            <p style="margin-top: 10px; font-size: 16px; font-weight: bold;">
                                AFFILIATIONS</p>
                            <li  style="margin-top: 69px;"><a href="#Govt" data-toggle="tab">GOVERNMENT ORGANIZATIONS</a></li>
                            <li class="active"><a href="#RD" data-toggle="tab">R&D CENTERS</a></li>
                            <li><a href="#UNIV" data-toggle="tab">UNIVERSITIES</a></li>
                        </ul>
                        <div class="tab-content" style="border: none;">
                            <div class="tab-pane" id="Govt" style="height: 591px;">
                                <p>
                                    <b>GOVERNMENT ORGANIZATIONS</b><br />
                                 
                                    
                                </p>
                                <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.
                                </p>
                               <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.
                                </p>
                                <div style="height: 200px; width: 40%; height: 181px; width: 100%; margin-top: 2px;
                                    border-style: groove;">
                                    <p style="text-align: justify;margin-left: 4%;">
                                    <span><b>Address</b>:</span><br />
                                        IBMS<br />
                                        FLATNO-301, 3RD FLOOR,<br />
                                        KAMALA NIVAS H.NO:18-78/A ROAD NO-3,<br />
                                        KAMALANAGAR BESIDE KALANIKETAN CHAITANYAPURI<br />
                                        HYDERABAD<br />
                                        TELANGANA Pin-500 060
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane active" id="RD" style="height: 591px;">
                                <p>
                                    <b>R&D CENTERS<br /></b>
                                   
                                </p>
                                <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.</p>
                                     <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.
                                </p>
                                <div style="height: 200px; width: 40%; height: 181px; width: 100%; margin-top: 2px;
                                    border-style: groove;">
                                    <p style="text-align: justify;margin-left: 4%;">
                                    <span><b>Address</b>:</span><br />
                                        IBMS<br />
                                        FLATNO-301, 3RD FLOOR,<br />
                                        KAMALA NIVAS H.NO:18-78/A ROAD NO-3,<br />
                                        KAMALANAGAR BESIDE KALANIKETAN CHAITANYAPURI<br />
                                        HYDERABAD<br />
                                        TELANGANA Pin-500 060
                                    </p>
                                </div>
                            </div>
                            <div class="tab-pane" id="UNIV" style="height: 591px;">
                                <p>
                                    <b>UNIVERSITIES</b><br />
                                   
                                </p>
                                <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.</p>
                                     <p style="text-align: justify;">
                                    To create desired work culture capable of meeting global challenges through innovative
                                    education system integrating industrial requirements. We value the customer utmost
                                    and are committed to provide customized and standardized services to customers by
                                    creating practices powered by intellectuality and setting standardized models. We
                                    creating Professional environment for training and skill development programs to
                                    focus on continuous learning and growth. We are committed for giving best industry
                                    exposure in projects with regular practical training on evolving methodologies in
                                    research and health industries.
                                </p>
                                <div style="height: 200px; width: 40%; height: 181px; width: 100%; margin-top: 2px;
                                    border-style: groove;">
                                    <p style="text-align: justify;margin-left: 4%;">
                                    <span><b>Address</b>:</span><br />
                                        IBMS<br />
                                        FLATNO-301, 3RD FLOOR,<br />
                                        KAMALA NIVAS H.NO:18-78/A ROAD NO-3,<br />
                                        KAMALANAGAR BESIDE KALANIKETAN CHAITANYAPURI<br />
                                        HYDERABAD<br />
                                        TELANGANA Pin-500 060
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
    </table>
 <br />
    </div>
  </div>
  <div class="topbar"></div>
</div>
<div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>
</asp:Content>
