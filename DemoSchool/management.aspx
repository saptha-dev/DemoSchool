<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="management.aspx.cs" Inherits="DemoSchool.Programs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
        p
        {
            font-family: Times New Roman;
            font-size: 17px;
            text-align: justify;
        }
    </style>
    <script type="text/javascript">


        $(document).ready(function () {
            activaTab('Training');
        });

        function activaTab(tab) {
            $('.nav-tabs a[href="#' + tab + '"]').tab('show');
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
     <table style="width: 69%; margin: auto; margin-left: 12%;">
        <tr>
            <td align="center">
                <div class="panel panel-default" style="width: 100%; padding: 10px; margin: 10px;">
                    <div id="Tabs" role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist" style="background-color: #63A9C7;">
                            <li><a href="#Training" aria-controls="Training" role="tab" data-toggle="tab">TRAINING</a></li>
                            <li><a href="#Assesment" aria-controls="Assesment" role="tab" data-toggle="tab">ASSESSMENT
                            </a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" style="padding-top: 20px">
                            <div role="tabpanel" class="tab-pane active" id="Training">
                                <p style="margin-left: 10px">
                                    <b>TRAINING:</b>
                                    <br />
                                    <br />
                                    In basic level training to Young, ambitious learners with zero industry working
                                    experience that is having good education qualifications and basic technical skills
                                    can prepare for greater responsibility through process management training, skills
                                    training in basic statistics, data management concepts for different research project
                                    functions.
                                    <br />
                                    <br />
                                    For quality management and professional team management training, IBMS Training
                                    can help to functional working people in different industries. IBMS Training builds
                                    skills for developing and implementing strategies, skills, practices in the projects
                                    to be working while general training courses provide essential skills for smooth
                                    running of projects in the organization.
                                    <br />
                                    <br />
                                    A personal development program is also helpful for getting team management and leading
                                    skills, such as conflict resolution, negotiation, motivating, inspiring and leading
                                    team members. This stage is a good step to consider for management levels.
                                    <br />
                                    <br />
                                    Managerial training for new aspiring or working managers and experienced project
                                    leaders, data management working people benefit from IBMS management training programs
                                    <br />
                                    <br />
                                    Best management gives best result to the company or organization. We are at IBMS
                                    can help data managers and project managers to better managing risk, identifying
                                    the right solutions to the project issues they will face and meet the challenges
                                    of the data management and project business environment through training.
                                    <br />
                                    <br />
                                    Training-organizing Methods: In the classroom, in your company or at home - courses
                                    that fit your learning style, budget and schedule.
                                    <br />
                                    <br />
                                    <p style="margin-left: 10px">
                                        <b>Classroom Training:</b> Study at one of our IBMS Training Centers or branch location.
                                        All classroom courses are developed and delivered by best experienced IBMS faculties.
                                        <br />
                                        <br />
                                        <b>Online Training:</b>We are giving using best online training methodologies for
                                        learners with high standard training and networking products. We also providing
                                        the best tutor interactions for learners to clear the questions.
                                        <br />
                                        <br />
                                        <b>Corporate:</b>Maximize your training budget by bringing training to your workplace.
                                        All in-company courses are developed and delivered by IBMS Instructors and can be
                                        customized to fit your company's training need.
                                        <br />
                                        <br />
                                        <b>Distance Learning:</b>Get flexible and affordable training with our se lf-study
                                        programs. Distance learning courses can also be followed at IBMS Authorized associated
                                        training centers.
                                        <br />
                                        <br />
                                        <b>Associated Companies:</b>Study distance learning and classroom courses at partner
                                        company locations specified by IBMS
                                    </p>
                                </p>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="Assesment">
                                <p style="margin-left: 10px">
                                    <b>ASSESSMENT:</b>
                                    <br />
                                    <br />
                                    IBMS Structured assessment management process provides the necessary skilled workforce
                                    for any organization
                                    <br />
                                    <br />
                                    As one of the best institutes, IBMS has a deep understanding of new learning and
                                    education needs and best practicing assessment methods for thorough knowledge of
                                    learning concepts and skill professionalization through Management Assessment Program
                                    for every program learners to get on board as per client requirements.
                                    <br />
                                    <br />
                                    That’s why here IBMS is offering specific assessment planning and programs addressing
                                    policies, challenges, industry concepts and issues facing to people in the organization.
                                    Assessment is the process of conducting concept information in multiple ways for
                                    what students know, understand, and can do the tasks with their knowledge from their
                                    training programs.
                                    <br />
                                    <br />
                                    IBMS Assessment is the systematic basis for making inferences about the learning
                                    and skills knowledge of students. We have standard and customized, selective, interpreted
                                    process of assessment to improve skills and knowledge for students in various programs
                                    they attending. To know whether student achieved or not the intended learning outcomes
                                    have been met, At IBMS we have different Assessment techniques :
                                    <br />
                                    <br />
                                    Sample Test
                                    <br />
                                    Projects
                                    <br />
                                    Case Studies
                                    <br />
                                    Oral Exams
                                    <br />
                                    <p style="margin-left: 10px">
                                        <b>Assessment-Process:</b> IBMS assessment process is methodical and thorough. This
                                        ensures we perform our duties to the highest standards on behalf of the clients.
                                        This includes playing a key role in promoting the global standard assessment process
                                        by ensuring high standards of education system. The assessment team in our IBMS
                                        handles all skills assessments of different category programs. We systematically
                                        follow the steps when processing of skills assessment. The Assessment process can
                                        be taken in IBMS office or its branch locations and IBMS associated Assessment or
                                        Training organizations.
                                    </p>
                                    <p style="margin-left: 10px">
                                        Register for Assessment for completed Training Course
                                        <br />
                                        Book for Assessment Real Test of category and its subject
                                        <br />
                                        Complete the Assessment in corresponding Training course
                                        <br />
                                        Get the Assessment Result and grade certificates
                                        <br />
                                    </p>
                                    <p style="margin-left: 10px">
                                        <b>Steps of Assessment Process:</b> Note that you will need to complete online system
                                        for completing Assessment in your category subjects after you completed the corresponding
                                        training program in IBMS or its branches and any of its associated Training organizations.
                                        The steps for Assessment are:
                                    </p>
                                    <p style="margin-left: 10px">
                                        <b>Step-1</b>: Go to Assessment section in registered course program on IBMS web
                                        site<br />
                                        <b>Step-2</b>: Register for Assessment category and its subjects on IBMS website
                                        first with your personal information.<br />
                                        <b>Step-3</b>: Select your Assessment Company and its location information.<br />
                                        <b>Step-4</b>: Book for the Assessment Real Test of your category program and its
                                        subject.<br />
                                        <b>Step-5</b>: Get booking reference number from your email.<br />
                                        <b>Step-6</b>: Attend the Assessment Real Test as per your booking slot with your
                                        booking information.<br />
                                        <b>Step-7</b>: Complete the Assessment Real Test at the Assessment company location.<br />
                                        <b>Step-8</b>: Get the result into your Assessment account after valuation completed
                                        by the IBMS.<br />
                                    </p>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
          </div>
     <div class="container footer">
  <div class="container"> © 2016 REDYSUNS INSTITUTE All rights reserved. </div>
</div>

</asp:Content>
