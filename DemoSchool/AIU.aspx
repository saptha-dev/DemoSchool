<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AIU.aspx.cs" Inherits="DemoSchool.AIU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
             activaTab('AIU');
         });

         function activaTab(tab) {
             $('.nav-tabs a[href="#' + tab + '"]').tab('show');
         };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
  <div class="row">
  <table style="width: 68%; margin: auto; margin-top: 20px; margin-bottom: 20px; margin-left: 176px;">
        <tr>
            <td align="center">
                <div class="tabbable">
                    <!-- Only required for left/right tabs -->
                    <div class="tabbable tabs-left" style="border-style: groove;height:500px;">
                        <ul class="nav nav-tabs">
                            <p style="margin-top: 10px; font-size: 16px; font-weight: bold;">
                                ACCREDITIONS</p>
                            <li  style="margin-top: 69px;"><a href="#ISO" data-toggle="tab">ISO-9000-2008</a></li>
                            <li  class="active"><a href="#AIU" data-toggle="tab">AIU- ASSOCIATE OF INDIAN UNIVERSITIES</a></li>
                            <li ><a href="#IAO" data-toggle="tab">IAO-INTERNATIONAL ACCREDITION ORGANIZATION</a></li>
                        </ul>
                        <div class="tab-content" style="border: none;">
                            <div class="tab-pane" id="ISO" style="height: 494px;border-radius: 20px;">
                                <p>
                                    <b>ISO-9000-2008</b><br />
                                 
                                    
                                </p>
                                <p style="text-align: justify;">
                                   ISO-9000-2008 To create desired work culture capable of meeting global challenges through innovative
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
                                
                            </div>
                            <div class="tab-pane active" id="AIU" style="height: 494px;border-radius: 20px;">
                                <p>
                                    <b>AIU- ASSOCIATE OF INDIAN UNIVERSITIES<br /></b>
                                   
                                </p>
                                <p style="text-align: justify;">
                                   AIU- ASSOCIATE OF INDIAN UNIVERSITIES To create desired work culture capable of meeting global challenges through innovative
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
                                
                            </div>
                            <div class="tab-pane" id="IAO" style="height: 494px;border-radius: 20px;">
                                <p>
                                    <b>IAO-INTERNATIONAL ACCREDITION ORGANIZATION</b><br />
                                   
                                </p>
                                <p style="text-align: justify;">
                                    IAO-INTERNATIONAL ACCREDITION ORGANIZATION To create desired work culture capable of meeting global challenges through innovative
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
    
    <div> </div>
  </div>
  <div class="topbar"></div>
</div>
<div class="container footer">
  <div class="container"> © <%=DateTime.Now.Year%> STCIPL INSTITUTE All rights reserved. </div>
</div>

</asp:Content>
