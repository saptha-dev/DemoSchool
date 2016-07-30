<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="careers.aspx.cs" Inherits="DemoSchool.careers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style></style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow" style="margin-top:30px;background-color:#fff;border-top:5px solid #CCC;">
  <div class="row">
    <div class="col-lg-12">
      <h1>Careers</h1>
      <p>
           We focus on giving our people the opportunity to grow professionally, advancing
            their skills and careers.
            <br />
            On recognizing and rewarding them for their efforts and achievements. But, perhaps
            the most important is an opportunity to make a difference

 </p>
        <p>
          IBMS promotes a culture of continuous learning, team collaboration and individual
            growth. By bringing your expertise to teams with diverse talents and backgrounds,<br />
            you'll gain new insight and experience each day, while contributing to a learning
            environment. 
        <p>
 

      <p>    We help to grow personally and professionally by fostering professional
            development, supporting opportunities to stretch skill sets, and encouraging the
            exploration of various career options Make a Difference: IBMS combines the stability
            of a company with a track record of success with the entrepreneurial atmosphere
            of a small company with an infrastructure of a world class organization.</p>
      <p> We value
            initiative and the sharing of ideas and expertise at all levels of the organization.
            Right from the start, we encourage and expect each member of our team to make a
            significant contribution to the success of our clients. Be Recognized and Rewarded:
            At IBMS, we understand that the efforts and achievements of our people come from
            different sectors</p>
        <p>Our incentive programs are designed to recognize past performance
            as well as to motivate continuing career development. We recognize and reward individual
            contributions, team accomplishments, the mastery of new skills, and the mentoring
            of team members. We expect our people to take ownership for delivering excellent
            results, and to share in the rewards of success.</p> 
     <br />
     <div id="Contactdiv">
    <asp:GridView ID="GrvDetails" CssClass="Gridview" runat="server" AutoGenerateColumns="true"
            HeaderStyle-BackColor="#7779AF" HeaderStyle-ForeColor="white" AllowPaging="true" Width="100%"
            PageSize="8" >
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkheader" runat="server" onclick="checkAll(this);" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkchild" runat="server" onclick="Check_Click(this)" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
              <%--  <asp:BoundField HeaderText="DetailsID" DataField="DetailsID" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="RoleName" DataField="RoleName" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="FirstName" DataField="FirstName" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="LastName" DataField="LastName" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="EmailID" DataField="EmailID" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="MobileNumber" DataField="MobileNumber" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="DateOfBirth" DataField="DateOfBirth" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="AccessCode" DataField="AccessCode" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="DateofRegistration" DataField="DateofRegistration" HeaderStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Status" DataField="Status" HeaderStyle-HorizontalAlign="Center" />--%>
            </Columns>
        </asp:GridView>
           <br />
    <center><asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="btn btn-primary" /></style=center>
    
        </div>
        </div>
      </div>
    </div>
  
        <div class="container footer">
  <div class="container"> © <%=DateTime.Now.Year%> STCIPL All rights reserved. </div>
</div>
    
       

</asp:Content>
