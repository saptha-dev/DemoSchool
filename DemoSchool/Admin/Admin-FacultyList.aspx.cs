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
    public partial class Admin_FacultyList : System.Web.UI.Page
    {
        #region Declarations
        AddProgramsBL objBL = new AddProgramsBL();
        RegistrationBE objRegistrationEntity = new RegistrationBE();
        RegistrationBL objRegistrationBL = new RegistrationBL();
        DataTable dtGetRegisteredUsers = new DataTable();
        #endregion Declarations

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                    //{
                    //    Response.Redirect("../LoginPage.aspx");
                    //}
                    //else
                    //{
                    //GetRegisteredUsers();
                    LoadProgams();
                    LoadUserStatusList();
                    // }

                }
            }
        }

        protected void UserType_Changed(object sender, EventArgs e)
        {
            
        }


        public void LoadProgams()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgram.DataSource = dt;
            ddlProgram.DataValueField = "Program_id";
            ddlProgram.DataTextField = "Program_name";
            ddlProgram.DataBind();
            ddlProgram.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));

        }

        public void LoadUserStatusList()
        {
            SqlDataReader dr = objBL.GetStatusList();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlStatus.Items.Clear();
                ddlStatus.DataSource = dt;
                ddlStatus.DataValueField = "Status_Id";
                ddlStatus.DataTextField = "Status_Text";
                ddlStatus.DataBind();
                ddlStatus.Items.Insert(0, new ListItem("--Select--", "0"));
            }

        }

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            NodataPanel.Visible = false;
            ddlCategory.Items.Clear();
            //ddlType.SelectedIndex = -1;

            int CategorieID = Convert.ToInt32(ddlProgram.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataTextField = "Category_Id_Name";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }

        }

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue != "0")
            {
                selectedCategoryId.Text = ddlCategory.SelectedItem.Text;
                LoadGroups();
                LoadCategorySchdule();
                LoadYearOrSemSchdule();
            }
            else
            {
                ddlGroup.Items.Clear();
                ddlCategorySchedule.Items.Clear();
                ddlYearSemSchedule.Items.Clear();
            }
        }

        private void LoadGroups()
        {
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlGroup.Items.Clear();
                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        private void LoadCategorySchdule()
        {
            SqlDataReader dr = objBL.GetCategorySchdule(Convert.ToInt32(ddlCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategorySchedule.Items.Clear();
                ddlCategorySchedule.DataSource = dt;
                ddlCategorySchedule.DataValueField = "Schedule_Id";
                ddlCategorySchedule.DataTextField = "Schedule_Id_Date";
                ddlCategorySchedule.DataBind();
                ddlCategorySchedule.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        private void LoadYearOrSemSchdule()
        {
            SqlDataReader dr = objBL.GetYearOrSemSchdule(Convert.ToInt32(ddlCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlYearSemSchedule.Items.Clear();
                ddlYearSemSchedule.DataSource = dt;
                ddlYearSemSchedule.DataValueField = "Branch_T_Years";
                ddlYearSemSchedule.DataTextField = "Year_Sem_Date";
                ddlYearSemSchedule.DataBind();
                ddlYearSemSchedule.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlCategorySchedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCategorySchedId.Text = ddlCategorySchedule.SelectedItem.Text;
        }

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedGroupId.Text = ddlGroup.SelectedItem.Text;
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlGroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                selectedGroupId.Text = ddlGroup.SelectedItem.Text;
                ddlYearSem.DataSource = dt;
                ddlYearSem.DataValueField = "Year_Id";
                ddlYearSem.DataTextField = "Branch_Year_No";
                ddlYearSem.DataBind();
                ddlYearSem.Items.Insert(0, new ListItem("--Select--", "0"));
            }

        }
        protected void ddlYearSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedYearSem.Text = ddlYearSem.SelectedItem.Text;
            LoadSubjects();
            LoadSubjectsSchedule();
        }

        private void LoadSubjects()
        {
            int programId = Convert.ToInt32(ddlProgram.SelectedItem.Value);
            int branchId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            SqlDataReader dr = objBL.GetSubjectBasedOnCategoriesDrpdwn(categoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject.DataSource = dt;
                ddlSubject.DataValueField = "Subject_Id";
                ddlSubject.DataTextField = "Subject_Id_Name";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        private void LoadSubjectsSchedule()
        {
            int programId = Convert.ToInt32(ddlProgram.SelectedItem.Value);
            int branchId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);

            SqlDataReader dr = objBL.GetSubjectBasedOnCategoriesDrpdwn(categoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject.DataSource = dt;
                ddlSubject.DataValueField = "Subject_Id";
                ddlSubject.DataTextField = "Subject_Id_Name";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlYearSemSchedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedYearSchedId.Text = ddlYearSemSchedule.SelectedItem.Text;
        }
        protected void ddlSubjectId_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedSubjectId.Text = ddlSubject.SelectedItem.Text;
        }
        protected void ddlSubSchdIdDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedSubSchedId.Text = ddlSubSchdDate.SelectedItem.Text;
        }


        //public void GetAllUsers()
        //{
        //    objRegistrationEntity.RoleName = "Faculty";
        //    SqlDataReader dr = objRegistrationBL.GetAllUsers(objRegistrationEntity);
        //    DataTable dtGetAllUsers = new DataTable();
        //    dtGetAllUsers.Load(dr);
        //    if (dtGetAllUsers.Rows.Count > 0)
        //    {
        //        DataPanel.Visible = false;
        //        NodataPanel.Visible = true;
        //        GvNodata.DataSource = dtGetAllUsers;
        //        GvNodata.DataBind();
        //    }
        //    else
        //    {
        //        DataPanel.Visible = true;
        //        NodataPanel.Visible = false;
        //    }
        //}

        private void GetRegisteredUsers()
        {
            objRegistrationEntity.RoleName = "Faculty";
            SqlDataReader dr = objRegistrationBL.GetFacultyRegisteredUsers();
            dtGetRegisteredUsers.Load(dr);
            if (dtGetRegisteredUsers.Rows.Count > 0)
            {
                DataPanel.Visible = true;
                NodataPanel.Visible = false;
                gvcheckbox.DataSource = dtGetRegisteredUsers;
                gvcheckbox.DataBind();
            }
            else
            {
                dtGetRegisteredUsers = new DataTable();
                GvNodata.DataSource = dtGetRegisteredUsers;
                GvNodata.DataBind();
                //// GetAllUsers();
                // dtGetRegisteredUsers.Rows.Add(dtGetRegisteredUsers.NewRow());
                // GvNodata.DataSource = dtGetRegisteredUsers;
                // GvNodata.DataBind();
                // int columncount = GvNodata.Rows[0].Cells.Count;
                // GvNodata.Rows[0].Cells.Clear();
                // GvNodata.Rows[0].Cells.Add(new TableCell());
                // GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                // GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                lblNoDataHeading.Text = "Faculty Registered List";
                NodataPanel.Visible = true;
                DataPanel.Visible = false;
            }
        }

        private void GetConfirmusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentConfirmUsers(Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                Session["dt"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                //Empty DataTable to execute the “else-condition”  
                dt = new DataTable();
                GvNodata.DataSource = dt;
                GvNodata.DataBind();

                //dt.Rows.Add(dt.NewRow());
                //GvNodata.DataSource = dt;
                //GvNodata.DataBind();
                //int columncount = GvNodata.Rows[0].Cells.Count;
                //GvNodata.Rows[0].Cells.Clear();
                //GvNodata.Rows[0].Cells.Add(new TableCell());
                //GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                //GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlActivatedUsers.Visible = false;
                lblNoDataHeading.Text = "Facult Activated List";
            }
        }

        private void GetCancelusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentCancelUsers(Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                pnlCancelUsers.Visible = true;
                gvCancel.DataSource = dt;
                gvCancel.DataBind();
            }
            else
            {
                dt = new DataTable();
                GvNodata.DataSource = dt;
                GvNodata.DataBind();
                //dt.Rows.Add(dt.NewRow());
                //GvNodata.DataSource = dt;
                //GvNodata.DataBind();
                //int columncount = GvNodata.Rows[0].Cells.Count;
                //GvNodata.Rows[0].Cells.Clear();
                //GvNodata.Rows[0].Cells.Add(new TableCell());
                //GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                //GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                NodataPanel.Visible = true;
                pnlCancelUsers.Visible = false;
                lblNoDataHeading.Text = "Faculty Deactivated List";
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
                        UserName = UserName.Substring(0, 4);
                        string Userid = GenerateUserID();
                        UserName = UserName + Userid;
                        string RoleName = row.Cells[2].Text;
                        string EmailID = row.Cells[5].Text;
                        DataRow dtadd = dtupdate.NewRow();
                        dtadd["UserID"] = UserName;
                        dtadd["Password"] = Password;
                        dtadd["DetailsID"] = id;
                        dtadd["RoleName"] = "Faculty";
                        dtadd["EmailID"] = EmailID;
                        dtupdate.Rows.Add(dtadd);
                        SqlDataReader dr = objRegistrationBL.ActivateStudents(UserName, Password, Convert.ToInt32(id), "Faculty");
                    }
                }
            }
            if (dtupdate.Rows.Count > 0)
            {
               // objRegistrationEntity.dtroles = dtupdate;
               // SqlDataReader dr = objRegistrationBL.ActivateRegisteredUsers(objRegistrationEntity);
              //  ActivateUsersMail(dtupdate);   //To send mail to Activated users(UserName and Password)
               
                lblActivatedusers.Visible = true;
                GetActiveusers();
                btnActivateGV.Visible = true;
                pnlActivatedUsers.Visible = true;
                GetRegisteredUsers();

            }




        }

        //protected void btnDeActivate_Click(object sender, EventArgs e)
        //{
        //    DataTable dtupdate = new DataTable();
        //    dtupdate.Columns.Add("UserID");
        //    dtupdate.Columns.Add("Password");
        //    dtupdate.Columns.Add("DetailsID");
        //    dtupdate.Columns.Add("RoleName");
        //    dtupdate.Columns.Add("EmailID");
        //    foreach (GridViewRow row in gvcheckbox.Rows)
        //    {
        //        if (row.RowType == DataControlRowType.DataRow)
        //        {
        //            CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
        //            if (chkRow.Checked)
        //            {
        //                string id = row.Cells[1].Text;
        //                string Password = GenerateTransactionId();
        //                string UserName = row.Cells[2].Text;
        //                UserName = UserName.Substring(0, 4);
        //                string Userid = GenerateUserID();
        //                UserName = UserName + Userid;
        //                string RoleName = row.Cells[2].Text;
        //                string EmailID = row.Cells[5].Text;
        //                DataRow dtadd = dtupdate.NewRow();
        //                dtadd["UserID"] = UserName;
        //                dtadd["Password"] = Password;
        //                dtadd["DetailsID"] = id;
        //                dtadd["RoleName"] = RoleName;
        //                dtadd["EmailID"] = EmailID;
        //                dtupdate.Rows.Add(dtadd);
        //                SqlDataReader dr = objRegistrationBL.DeActivateFaculty(Convert.ToInt32(id));
        //            }
        //        }
        //    }
        //    if (dtupdate.Rows.Count > 0)
        //    {
        //       // objRegistrationEntity.dtroles = dtupdate;
        //      //  SqlDataReader dr = objRegistrationBL.DeActivateRegisteredUsers(objRegistrationEntity);
        //        //  ActivateUsers(dtupdate);   //To send mail to Activated users(UserName and Password)
        //        GetRegisteredUsers();

        //        GetActivateUsersAfterActivate();
        //    //    lblActivatedusers.Visible = true;
        //    //    lblActivatedusers.Text = "De-Activated Users";
        //      //  GetDeActiveusers();
        //     //   btnActivateGV.Visible = true;
        //    }

        //}

        private void GetActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetFacutlyActiveUsers();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
            Session["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
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
            }
        }

        private void GetDeActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetDeActiveUsers();
            dtGetRegisteredUsers.Load(dr);
            GridView1.DataSource = dtGetRegisteredUsers;
            GridView1.DataBind();
        }

        private void GetActivateUsersAfterActivate()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Faculty");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                pnlActivatedUsers.Visible = true;
                DataPanel.Visible = true;
                NodataPanel.Visible = false;
                Session["dt"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                pnlActivatedUsers.Visible = false;
            }
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
                        UserName = UserName.Substring(0, 4);
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
                        SqlDataReader dr = objRegistrationBL.DeActivateFaculty(Convert.ToInt32(id));
                    }
                }
            }

            if (dtupdate.Rows.Count > 0)
            {
                // objRegistrationEntity.dtroles = dtupdate;
                //  SqlDataReader dr = objRegistrationBL.DeActivateRegisteredUsers(objRegistrationEntity);
                //  ActivateUsers(dtupdate);   //To send mail to Activated users(UserName and Password)
                GetRegisteredUsers();
                GetActivateUsersAfterActivate();
                //    lblActivatedusers.Visible = true;
                //    lblActivatedusers.Text = "De-Activated Users";
                GetDeActiveusers();
                //   btnActivateGV.Visible = true;
            }

        }

        protected void btnCancelView_Click(object sender, EventArgs e)
        {
            
        }

        protected void search_Click(object sender, EventArgs e)
        {
            string searchtext = searchText.Text;
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedStatus.Text = ddlStatus.SelectedItem.Text;
            var status = ddlStatus.SelectedItem.Text.ToUpper();
            switch (status)
            {
                case "COMPLETED":
                    GetRegisteredUsers();
                    DataPanel.Visible = true;
                    NodataPanel.Visible = false;
                    lblActivatedusers.Visible = false;
                    btnActivateGV.Visible = false;
                    pnlActivatedUsers.Visible = false;
                    pnlCancelUsers.Visible = false;
                    break;
                case "ACTIVATED":
                    DataPanel.Visible = false;
                    NodataPanel.Visible = false;
                    lblActivatedusers.Visible = true;
                    btnActivateGV.Visible = true;
                    pnlCancelUsers.Visible = false;
                    pnlActivatedUsers.Visible = true;
                    GetConfirmusers();
                    break;
                case "CANCELLED":
                    DataPanel.Visible = false;
                    NodataPanel.Visible = false;
                    lblActivatedusers.Visible = false;
                    btnActivateGV.Visible = false;
                    pnlActivatedUsers.Visible = false;
                    GetCancelusers();
                    pnlCancelUsers.Visible = true;
                    break;
                case "DEACTIVATED": break;
                case "REACTIVATED": break;

            }

        }
    }
}