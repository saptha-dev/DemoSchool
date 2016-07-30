using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BAL.BE;
using BAL.BL;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

namespace PresentationLayer.Admin
{
    public partial class Admin_CompanyList : System.Web.UI.Page
    {
        #region Declarations
        RegistrationBE objRegistrationEntity = new RegistrationBE();
        RegistrationBL objRegistrationBL = new RegistrationBL();
        DataTable dtGetRegisteredUsers = new DataTable();
        AddProgramsBL objBL = new AddProgramsBL();
        #endregion Declarations

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                   
                //}
                
            }
        }

        private void GetRegisteredUsers()
        {
            SqlDataReader dr = objRegistrationBL.GetCompanyRegisteredUsers();
            dtGetRegisteredUsers.Load(dr);
            if (dtGetRegisteredUsers.Rows.Count>0)
            {
                gvcheckbox.DataSource = dtGetRegisteredUsers;
                gvcheckbox.DataBind();
                DataPanel.Visible = true;
            }
            else
            {
                dtGetRegisteredUsers.Rows.Add(dtGetRegisteredUsers.NewRow());
                GvNodata.DataSource = dtGetRegisteredUsers;
                GvNodata.DataBind();
                int columncount = GvNodata.Rows[0].Cells.Count;
                GvNodata.Rows[0].Cells.Clear();
                GvNodata.Rows[0].Cells.Add(new TableCell());
                GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlCancelUsers.Visible = false;
                DataPanel.Visible = false;
                //  lblNoDataHeading.Text = "Canceled Students";
            }
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            DataTable dtupdate = new DataTable();
            dtupdate.Columns.Add("UserID");
            dtupdate.Columns.Add("Password");
            dtupdate.Columns.Add("DetailsID");
            dtupdate.Columns.Add("RoleName");
            dtupdate.Columns.Add("EmailID");
            foreach (GridViewRow row in gvcheckbox.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        string Password = GenerateTransactionId();
                        string UserName = row.Cells[2].Text;
                        UserName = UserName.Substring(0, 3);
                        string Userid = GenerateUserID();
                        UserName = UserName + Userid;
                        string RoleName = row.Cells[2].Text;
                        string EmailID = row.Cells[5].Text;
                        DataRow dtadd = dtupdate.NewRow();
                        dtadd["UserID"] = UserName;
                        dtadd["Password"] = Password;
                        dtadd["DetailsID"] = id;
                        dtadd["RoleName"] = RoleName;
                        dtadd["EmailID"] = EmailID;
                        dtupdate.Rows.Add(dtadd);

                        string CompanyID = row.Cells[2].Text;
                        string BranchID = row.Cells[3].Text.Substring(0, 3)+"M";
                        string BranchName = row.Cells[3].Text + "-Main";
                        string Location = row.Cells[8].Text;
                        string Area = row.Cells[9].Text;

                        SqlDataReader dr = objRegistrationBL.ActivateCompany(UserName, Password, Convert.ToInt32(id), BranchID, CompanyID, BranchName, Location, Area);
                    }
                }
            }
            if (dtupdate.Rows.Count > 0)
            {
                //objRegistrationEntity.dtroles = dtupdate;
                //SqlDataReader dr = objRegistrationBL.ActivateRegisteredUsers(objRegistrationEntity);
                //ActivateUsersMail(dtupdate);   //To send mail to Activated users(UserName and Password)
                //GetRegisteredUsers();
                //lblActivatedusers.Visible = true;
                //GetActiveusers();
                //btnActivateGV.Visible = true;
                GetRegisteredUsers();
            }

        }

        private void GetActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Company");
            DataTable dt = new DataTable();
            dt.Load(dr);
            Session["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetDeActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetDeActiveUsers();
            dtGetRegisteredUsers.Load(dr);
            GridView1.DataSource = dtGetRegisteredUsers;
            GridView1.DataBind();
        }

        public static string GenerateTransactionId()
        {
            int digit = 8;
            string possibles = "abcdefghijklmnopqrstuvwxyg0123456789!@#$%^&*";
            char[] TranId = new char[digit];
            Random rd = new Random();
            for (int i = 0; i < digit; i++)
            {
                TranId[i] = possibles[rd.Next(0, possibles.Length)];
            }
            return new string(TranId);
        }

        public static string GenerateUserID()
        {
            int digit = 4;
            string possibles = "0123456789";
            char[] TranId = new char[digit];
            Random rd = new Random();
            for (int i = 0; i < digit; i++)
            {
                TranId[i] = possibles[rd.Next(0, possibles.Length)];
            }
            return new string(TranId);
        }

        public void ActivateUsersMail(DataTable dtActivate)
        {
            if (dtActivate.Rows.Count > 0)
            {
                for (int i = 0; i < dtActivate.Rows.Count; i++)
                {
                    string EmailId = dtActivate.Rows[i][4].ToString();
                    string Username = dtActivate.Rows[i][0].ToString();
                    string Password = dtActivate.Rows[i][1].ToString();


                    MailMessage objMailMessage = new MailMessage();
                    string strFpEmail = ConfigurationManager.AppSettings["FPEmail"];
                    string strFpSubject = ConfigurationManager.AppSettings["FPSubject"];
                    objMailMessage.From = new MailAddress(strFpEmail);
                    objMailMessage.To.Add(new MailAddress(EmailId));
                    objMailMessage.Subject = strFpSubject;
                    string strMailBody = String.Empty;
                    strMailBody += "<table width='100%' border='0' cellpadding='2' cellspacing='2' style='background-color: #029D03; border:' #FDCC35'>";
                    strMailBody += "<tr>"
                               + "<td>"
                               + "<span style='color: black;font-family:Tahoma;font-size: 20px;font-weight: bold;'>Login Credentails</span>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td>"
                               + "<span style='color:black;font-family:Tahoma;font-size: 15px;'>Your UserName is : <span style='font-weight: bold;'>" + Username + ",</span> </span>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td>"
                               + "<span>Your password is : <span style='font-weight: bold;'>" + Password + ",</span> </span>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td>"
                               + "<span>Please use this Credentails for login.</span>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td width=20px>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td>"
                               + "</br></br>"
                               + "<span> Thanks,</span>"
                               + "</td>"
                               + "</tr>"
                               + "<tr>"
                               + "<td>"
                               + "<span>Team Online Learning System.</span>"
                               + "</br></br>"
                               + "</td>"
                               + "</tr>"
                               + "</table>";
                    objMailMessage.Body = strMailBody;
                    objMailMessage.IsBodyHtml = true;
                    objMailMessage.Priority = MailPriority.High;
                    SmtpClient objSmptpClient = new SmtpClient("smtpout.secureserver.net");
                    //objSmptpClient.Port = 587;
                    objSmptpClient.Port = 25;
                    objSmptpClient.Credentials = new NetworkCredential("info@smtindia.net", "info@smt");
                    var client = new SmtpClient();
                    client.EnableSsl = true;
                    ServicePointManager.ServerCertificateValidationCallback += (o, c, ch, er) => true;

                    objSmptpClient.Send(objMailMessage);
                }

            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvcheckbox.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        SqlDataReader dr = objRegistrationBL.CompanyRegistrationCancel(Convert.ToInt32(id));
                    }
                }
            }
            GetRegisteredUsers();
        }

        protected void radioUsersList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string DetailsID = "";
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        DetailsID = row.Cells[1].Text;
                    }
                }
            }

            DataTable dt = new DataTable();
            dt = (DataTable)Session["dt"];

            DataRow[] dr = dt.Select("DetailsID = " + DetailsID);
            DataTable dt1 = dr.CopyToDataTable();
            Session["dt"] = dt1;
            Response.Redirect("../Student/Student-Home.aspx?id=Admin");
        }

        protected void btnADeActivate_Click(object sender, EventArgs e)
        {
            DataTable dtupdate = new DataTable();
            dtupdate.Columns.Add("UserID");
            dtupdate.Columns.Add("Password");
            dtupdate.Columns.Add("DetailsID");
            dtupdate.Columns.Add("RoleName");
            dtupdate.Columns.Add("EmailID");
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        string Password = GenerateTransactionId();
                        string UserName = row.Cells[2].Text;
                        UserName = UserName.Substring(0, 3);
                        string Userid = GenerateUserID();
                        UserName = UserName + Userid;
                        string RoleName = row.Cells[2].Text;
                        string EmailID = row.Cells[5].Text;
                        DataRow dtadd = dtupdate.NewRow();
                        dtadd["UserID"] = UserName;
                        dtadd["Password"] = Password;
                        dtadd["DetailsID"] = id;
                        dtadd["RoleName"] = RoleName;
                        dtadd["EmailID"] = EmailID;
                        dtupdate.Rows.Add(dtadd);
                       // SqlDataReader dr = objRegistrationBL.DeActivateCompany(Convert.ToInt32(id));
                    }
                }
            }
            if (dtupdate.Rows.Count > 0)
            {
                //objRegistrationEntity.dtroles = dtupdate;
                //SqlDataReader dr = objRegistrationBL.DeActivateRegisteredUsers(objRegistrationEntity);
                ////  ActivateUsers(dtupdate);   //To send mail to Activated users(UserName and Password)
                //GetRegisteredUsers();
                //lblActivatedusers.Visible = true;
                //lblActivatedusers.Text = "De-Activated Users";
                //GetDeActiveusers();
                //btnActivateGV.Visible = true;
                GetActiveCompanys();
            }
        }

        protected void btnCancelView_Click(object sender, EventArgs e)
        {
            
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedItem.Value=="1")
            {
                NodataPanel.Visible = false;
                pnlActiveUsers.Visible = false;
                pnlAssignDDL.Visible = false;
                pnlCmpnyDDL.Visible = false;
                pnlGVAssign.Visible = false;
                GetRegisteredUsers();
            }
            else if (ddlType.SelectedItem.Value == "2")
            {
                NodataPanel.Visible = false;
                pnlCmpnyDDL.Visible = true;
                DataPanel.Visible = false;
                pnlGVAssign.Visible = false;
                GetActiveCompanys();
            }
             else if (ddlType.SelectedItem.Value == "3")
            {
                NodataPanel.Visible = false;
                pnlCmpnyDDL.Visible = false;
                DataPanel.Visible = false;
                pnlActiveUsers.Visible = false;
                pnlAssignDDL.Visible = false;
                pnlGVAssign.Visible = false;
                GetCancelusers();
            }
        }

        private void GetActiveCompanys()
        {
            SqlDataReader dr = objRegistrationBL.GetActiveCompanys();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCompanyActive.DataSource = dt;
                ddlCompanyActive.DataValueField = "CompanyId";
                ddlCompanyActive.DataTextField = "CompanyName";
                ddlCompanyActive.DataBind();
                ddlCompanyActive.Items.Insert(0, (new ListItem("--Select--", "0")));
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                dt.Rows.Add(dt.NewRow());
                GvNodata.DataSource = dt;
                GvNodata.DataBind();
                int columncount = GvNodata.Rows[0].Cells.Count;
                GvNodata.Rows[0].Cells.Clear();
                GvNodata.Rows[0].Cells.Add(new TableCell());
                GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlActiveUsers.Visible = false;
                pnlAssignDDL.Visible = false;
            }
        }

        private void GetActiveCompanyBranches()
        {
            SqlDataReader dr = objRegistrationBL.GetActiveCompanysBranch(ddlCompanyActive.SelectedItem.Value);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                pnlActiveUsers.Visible = true;
                pnlAssignDDL.Visible = true;
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                LoadNewProgamsDrpdown();
                ddlActiveCategories.Items.Clear();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
                dt.Rows.Add(dt.NewRow());
                GvNodata.DataSource = dt;
                GvNodata.DataBind();
                int columncount = GvNodata.Rows[0].Cells.Count;
                GvNodata.Rows[0].Cells.Clear();
                GvNodata.Rows[0].Cells.Add(new TableCell());
                GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlActiveUsers.Visible = false;
                pnlAssignDDL.Visible = false;
            }
        }

        private void GetCancelusers()
        {
            SqlDataReader dr = objRegistrationBL.GetCompanyCancelUsers();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                gvCancel.DataSource = dt;
                gvCancel.DataBind();
                pnlCancelUsers.Visible = true;
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GvNodata.DataSource = dt;
                GvNodata.DataBind();
                int columncount = GvNodata.Rows[0].Cells.Count;
                GvNodata.Rows[0].Cells.Clear();
                GvNodata.Rows[0].Cells.Add(new TableCell());
                GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlCancelUsers.Visible = false;
                //  lblNoDataHeading.Text = "Canceled Students";
            }
        }

        protected void gvCancel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnCancelActivate_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvCancel.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        SqlDataReader dr = objRegistrationBL.CompanyCancelRegistrationActivate(Convert.ToInt32(id));
                    }
                }
            }
            GetCancelusers();
        }

        protected void gvDeActivate_Click(object sender, ImageClickEventArgs e)
        {
             ImageButton imgbtn = (ImageButton)sender;
                GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
                if (gvrow != null)
                {
                    Label QId = (Label)gvrow.FindControl("ID");
                    int a = Convert.ToInt32(QId.Text);
                  //  SqlDataReader dr = objRegistrationBL.DeActivateCompany(Convert.ToInt32(a));
                    GetActiveCompanys();
                }
        
        }

        public void LoadNewProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlActivePrograms.DataSource = dt;
            ddlActivePrograms.DataValueField = "Program_id";
            ddlActivePrograms.DataTextField = "Program_name";
            ddlActivePrograms.DataBind();
            ddlActivePrograms.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));

        }
        
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            if (btnAssign.Text == "Assign")
            {
                foreach (GridViewRow row in GVAssign.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objRegistrationBL.InsertCompanyBranch_Group(ddlCompanyActive.SelectedValue, id, Convert.ToInt32(ddlActiveCategories.SelectedValue), Convert.ToInt32(ddlActiveBranch.SelectedValue));
                        }
                    }
                }
                AssignGroupToCompamyBranch();
            }
            else if (btnAssign.Text == "De-Assign")
            {
                foreach (GridViewRow row in GVAssign.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objRegistrationBL.CompanyBranchDeactivate(id,Convert.ToInt32(ddlActiveBranch.SelectedValue));
                        }
                    }
                }
                DeAssignGroupToCompamyBranch();
            }
        }

        protected void ddlCompanyActive_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            pnlActiveUsers.Visible = true;
            pnlAssignDDL.Visible = true;
            GetActiveCompanyBranches();
        }

        protected void btnDeActivateCmpny_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = objRegistrationBL.DeActivateCompany(ddlCompanyActive.SelectedValue);
            ddlActiveCategories.Items.Clear();
            pnlActiveUsers.Visible = false;
            pnlAssignDDL.Visible = false;
            GetActiveCompanys();
        }

        protected void ddlActivePrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlActiveCategories.Items.Clear();
            ddlActiveBranch.Items.Clear();
            ddlGroupAssign.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlActivePrograms.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlActiveCategories.DataSource = dt;
                ddlActiveCategories.DataValueField = "Category_Id";
                ddlActiveCategories.DataTextField = "Category_Name";
                ddlActiveCategories.DataBind();
                ddlActiveCategories.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlActiveCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlActiveBranch.Items.Clear();
            ddlGroupAssign.Items.Clear();

            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlActiveCategories.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlActiveBranch.DataSource = dt;
                ddlActiveBranch.DataValueField = "Branch_Id";
                ddlActiveBranch.DataTextField = "Branch_Name";
                ddlActiveBranch.DataBind();
                ddlActiveBranch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlActiveBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            DataTable dt5 = new DataTable();
            dt5.Columns.Add("ID");
            dt5.Columns.Add("Assign");
            DataRow row = dt5.NewRow();
            row["ID"] = "1";
            row["Assign"] = "Assign";
            dt5.Rows.Add(row);
            DataRow row1 = dt5.NewRow();
            row1["ID"] = "2";
            row1["Assign"] = "De-Assign";
            dt5.Rows.Add(row1);
            ddlGroupAssign.DataSource = dt5;
            ddlGroupAssign.DataTextField = "Assign";
            ddlGroupAssign.DataValueField = "ID";
            ddlGroupAssign.DataBind();
            ddlGroupAssign.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        private void AssignGroupToCompamyBranch()
        {
            lblAssignH.Text = "Companys Can Assign";
            SqlDataReader dr = objBL.GetCompanysToBindGroup(Convert.ToInt32(ddlActiveBranch.SelectedItem.Value), ddlCompanyActive.SelectedItem.Value);
            DataTable dt = new DataTable();
            dt.Load(dr);
            System.Data.DataColumn newColumn = new System.Data.DataColumn("GroupID", typeof(System.String));
            newColumn.DefaultValue = ddlActiveBranch.SelectedItem.Text;
            dt.Columns.Add(newColumn);
            if (dt.Rows.Count > 0)
            {
                GVAssign.DataSource = dt;
                GVAssign.DataBind();
                btnAssign.Text = "Assign";
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GVAssign.DataSource = dt;
                GVAssign.DataBind();
                int columncount = GVAssign.Rows[0].Cells.Count;
                GVAssign.Rows[0].Cells.Clear();
                GVAssign.Rows[0].Cells.Add(new TableCell());
                GVAssign.Rows[0].Cells[0].ColumnSpan = columncount;
                GVAssign.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        private void DeAssignGroupToCompamyBranch()
        {
            lblAssignH.Text = "Assigned Companys";

            SqlDataReader dr = objBL.CompanysBranchGroupDeActivate(Convert.ToInt32(ddlActiveBranch.SelectedItem.Value), ddlCompanyActive.SelectedItem.Value);
            DataTable dt = new DataTable();
            dt.Load(dr);
            System.Data.DataColumn newColumn = new System.Data.DataColumn("GroupID", typeof(System.String));
            newColumn.DefaultValue = ddlActiveBranch.SelectedItem.Text;
            dt.Columns.Add(newColumn);
            if (dt.Rows.Count > 0)
            {
                GVAssign.DataSource = dt;
                GVAssign.DataBind();
                btnAssign.Text = "De-Assign";

            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GVAssign.DataSource = dt;
                GVAssign.DataBind();
                int columncount = GVAssign.Rows[0].Cells.Count;
                GVAssign.Rows[0].Cells.Clear();
                GVAssign.Rows[0].Cells.Add(new TableCell());
                GVAssign.Rows[0].Cells[0].ColumnSpan = columncount;
                GVAssign.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        protected void ddlGroupAssign_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlGVAssign.Visible = true;
            if (ddlGroupAssign.SelectedItem.Value == "1")
            {
                AssignGroupToCompamyBranch();
            }
            else if (ddlGroupAssign.SelectedItem.Value == "2")
            {
                DeAssignGroupToCompamyBranch();
            }
        }


    }
}