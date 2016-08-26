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
    public partial class Admin_StudentsList : System.Web.UI.Page
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

                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
               // GetRegisteredUsers();
                LoadNewProgamsDrpdown();
                //}

            }

        }

        protected void ddlProgramsExcercise_SelectedIndexChanged(object sender, EventArgs e)
        {
            NodataPanel.Visible = false;
            ddlCategoriesForExcercises.Items.Clear();
            ddlType.SelectedIndex = -1;

            int CategorieID = Convert.ToInt32(ddlClassPrograms.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoriesForExcercises.DataSource = dt;
                ddlCategoriesForExcercises.DataValueField = "Category_Id";
                ddlCategoriesForExcercises.DataTextField = "Category_Name";
                ddlCategoriesForExcercises.DataBind();
                ddlCategoriesForExcercises.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
           
        }

        protected void ddlCategoriesForExcercisesDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedCategorySchedId.Text = ddlCategoriesForExcercisesDate.SelectedItem.Text;
        }

        protected void ddlCategoriesForExcercises_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlCategoriesForExcercises.SelectedValue != "0")
            {
                selectedCategoryId.Text = ddlCategoriesForExcercises.SelectedItem.Text;
                LoadGroups();
                LoadCategorySchdule();
                LoadYearOrSemSchdule();
            }
            else
            {
                ddlSelectGroup.Items.Clear();
                ddlCategoriesForExcercisesDate.Items.Clear();
                ddlYearSemSchedule.Items.Clear();
            }

            ddlType.SelectedIndex = -1;
            NodataPanel.Visible = false;
        }

        private void LoadGroups()
        {
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlCategoriesForExcercises.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSelectGroup.Items.Clear();
                ddlSelectGroup.DataSource = dt;
                ddlSelectGroup.DataValueField = "Branch_Id";
                ddlSelectGroup.DataTextField = "Branch_Name";
                ddlSelectGroup.DataBind();
                ddlSelectGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        private void LoadCategorySchdule()
        {
            SqlDataReader dr = objBL.GetCategorySchdule(Convert.ToInt32(ddlCategoriesForExcercises.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoriesForExcercisesDate.Items.Clear();
                ddlCategoriesForExcercisesDate.DataSource = dt;
                ddlCategoriesForExcercisesDate.DataValueField = "Schedule_Id";
                ddlCategoriesForExcercisesDate.DataTextField = "Schedule_Id_Date";
                ddlCategoriesForExcercisesDate.DataBind();
                ddlCategoriesForExcercisesDate.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        private void LoadYearOrSemSchdule()
        {
            SqlDataReader dr = objBL.GetYearOrSemSchdule(Convert.ToInt32(ddlCategoriesForExcercises.SelectedValue));
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

        protected void ddlSelectGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedGroupId.Text = ddlSelectGroup.SelectedItem.Text;
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlSelectGroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                selectedGroupId.Text = ddlSelectGroup.SelectedItem.Text;
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
            int programId = Convert.ToInt32(ddlClassPrograms.SelectedItem.Value);
            int branchId = Convert.ToInt32(ddlSelectGroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value);

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
            int programId = Convert.ToInt32(ddlClassPrograms.SelectedItem.Value);
            int branchId = Convert.ToInt32(ddlSelectGroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value);

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

        public void LoadNewProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlClassPrograms.DataSource = dt;
            ddlClassPrograms.DataValueField = "Program_id";
            ddlClassPrograms.DataTextField = "Program_name";
            ddlClassPrograms.DataBind();
            ddlClassPrograms.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "---Select---"));

        }

        public void GetAllUsers()
        {
            objRegistrationEntity.RoleName = "Student";
            SqlDataReader dr = objRegistrationBL.GetAllUsers(objRegistrationEntity);
            dtGetRegisteredUsers.Load(dr);
            if (dtGetRegisteredUsers.Rows.Count > 0)
            {
                //DataPanel.Visible = false;
                NodataPanel.Visible = true;
                GvNodata.DataSource = dtGetRegisteredUsers;
                GvNodata.DataBind();
                ViewState["GvNodata"] = dtGetRegisteredUsers;
            }
            //else
            //{
            //    DataPanel.Visible = true;
            //    NodataPanel.Visible = false;
            //}
        }

        private void GetRegisteredUsers()
        {
            if (ddlCategoriesForExcercises.SelectedItem.Value != "0")
            {
                SqlDataReader dr = objRegistrationBL.GetStudentRegisteredUsers(Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value));
                dtGetRegisteredUsers.Load(dr);
                if (dtGetRegisteredUsers.Rows.Count > 0)
                {
                    DataPanel.Visible = true;
                    NodataPanel.Visible = false;
                    gvcheckbox.DataSource = dtGetRegisteredUsers;
                    gvcheckbox.DataBind();
                    ViewState["RegisteredData"] = dtGetRegisteredUsers;
                }
                else
                {

                    DataPanel.Visible = false;
                    gvcheckbox.DataSource = null;
                    gvcheckbox.DataBind();
                    dtGetRegisteredUsers.Rows.Add(dtGetRegisteredUsers.NewRow());
                    GvNodata.DataSource = dtGetRegisteredUsers;
                    GvNodata.DataBind();
                    int columncount = GvNodata.Rows[0].Cells.Count;
                    GvNodata.Rows[0].Cells.Clear();
                    GvNodata.Rows[0].Cells.Add(new TableCell());
                    GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                    GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                    NodataPanel.Visible = true;
                    lblNoDataHeading.Text = "Registered Students";
                }
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
                        UserName = UserName.Trim()+Userid.Trim();
                        string EmailID = row.Cells[6].Text;
                        DataRow dtadd = dtupdate.NewRow();
                        dtadd["UserID"] = UserName;
                        dtadd["Password"] = Password;
                        dtadd["DetailsID"] = id;
                        dtadd["RoleName"] = "Student";
                        dtadd["EmailID"] = EmailID;
                        dtupdate.Rows.Add(dtadd);
                        SqlDataReader dr = objRegistrationBL.ActivateStudents(UserName, Password, Convert.ToInt32(id), "Student");
                        PublishSubjectsToStudents(Convert.ToInt32(id));
                    }
                }
            }
            if (dtupdate.Rows.Count > 0)
            {
                // objRegistrationEntity.dtroles = dtupdate;
                // SqlDataReader dr = objRegistrationBL.ActivateRegisteredUsers(objRegistrationEntity);
                // ActivateUsersMail(dtupdate);   //To send mail to Activated users(UserName and Password)
                // GetRegisteredUsers();
               
                    //lblActivatedusers.Visible = true;
                    //GetActiveusers();
                    //btnActivateGV.Visible = true;
                    //pnlActivatedUsers.Visible = true;

            }
            GetRegisteredUsers();
        }

        private void PublishSubjectsToStudents(int DetailsID)
        {
            string values = "";
            SqlDataReader dr = objRegistrationBL.GetSubjectIDs(DetailsID);
            DataTable dt = new DataTable();
            dt.Load(dr);

            foreach (DataRow dr1 in dt.Rows)
            {
                int SubjectID = Convert.ToInt32(dr1["Subject_Id"]);
                string UserID = dr1["UserID"].ToString();
                if (values == "")
                {
                    values = "(" + DetailsID + ",'" + UserID + "'," + SubjectID + ",'Publish',getdate(),1)";
                }
                else
                {
                    values = values + "," + "(" + DetailsID + ",'" + UserID + "'," + SubjectID + ",'Publish',getdate(),1)";
                }
                PublishUnitsToStudents(DetailsID, SubjectID);
            }

            if (values != "")
            {
                SqlDataReader dr1 = objRegistrationBL.PublishSubjectsToStudents(values);
            }

        }

        private void PublishUnitsToStudents(int DetailsID,int SubjectID)
        {

            string values = "";
            SqlDataReader dr = objRegistrationBL.GetUnits(SubjectID, DetailsID);
            DataTable dt = new DataTable();
            dt.Load(dr);

            foreach (DataRow dr1 in dt.Rows)
            {
                int UnitID = Convert.ToInt32(dr1["Unit_Id"]);
                string UserID = dr1["UserID"].ToString();
                if (values == "")
                {
                    values = "(" + DetailsID + ",'" + UserID + "'," + UnitID + ",'Publish',getdate(),1)";
                }
                else
                {
                    values = values + "," + "(" + DetailsID + ",'" + UserID + "'," + UnitID + ",'Publish',getdate(),1)";
                }
            }

            if (values != "")
            {
                SqlDataReader dr1 = objRegistrationBL.PublishUnitsToStudents(values);
            }
        }

        private void GetActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Student");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DataPanel.Visible = true;
                NodataPanel.Visible = false;
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
                lblActivatedusers.Text = "Confirmed Students";
            }
        }

        private void GetActiveusersForSingleCategory()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Student");
            DataTable dt = new DataTable();
            dt.Load(dr);
            var rows = from row in dt.AsEnumerable()
                       where row.Field<string>("Category_Name").Trim() == ddlCategoriesForExcercises.SelectedItem.Text.Trim().ToString()
                       select row;
            if (rows.Count() > 0)
            {
                DataPanel.Visible = true;
                NodataPanel.Visible = false;
                Session["dt"] = dt;
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                SqlDataReader dr1 = objRegistrationBL.GetStudentActiveUsers("Studentuuuu");
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                dt1.Rows.Add(dt1.NewRow());
                GvNodata.DataSource = dt1;
                GvNodata.DataBind();
                int columncount = GvNodata.Rows[0].Cells.Count;
                GvNodata.Rows[0].Cells.Clear();
                GvNodata.Rows[0].Cells.Add(new TableCell());
                GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                lblNoDataHeading.Text = "Confirmed Students";
            }
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

        protected void search_Click(object sender, EventArgs e)
        {
            string searchtext = searchText.Text;
            if (string.IsNullOrEmpty(searchtext))
            {
                return;
            }
            else
            {

            }
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
                        SqlDataReader dr = objRegistrationBL.StudentRegistrationCancel(Convert.ToInt32(id));
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
                        SqlDataReader dr = objRegistrationBL.DeActivateStudents(Convert.ToInt32(id));
                        UnPublishSubjectsUnits(Convert.ToInt32(id));
                    }
                }
            }
            if (dtupdate.Rows.Count > 0)
            {
                    //GetRegisteredUsers();
                   // GetActivateUsersAfterActivate();
                    //btnActivateGV.Visible = true;

                    GetConfirmusers();
            }

        }

        private void UnPublishSubjectsUnits(int UserID)
        {
            SqlDataReader dr = objRegistrationBL.UnPublishSubjectsToStudents(UserID);
            SqlDataReader dr1 = objRegistrationBL.UnPublishUnitsToStudents(UserID);
        }

        private void GetActivateUsersAfterActivate()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Student");
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

        protected void gvcheckbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {


        }

        protected void GvNodata_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GvNodata.EditIndex = e.NewPageIndex;
            GvNodata.DataSource = (DataTable)ViewState["GvNodata"];
            GvNodata.DataBind();
        }

        private void GetRegisteredUsersForCategory()
        {
            if (ViewState["RegisteredData"] != null)
            {
                DataTable dt1 = new DataTable();
                DataTable dt = (DataTable)ViewState["RegisteredData"];
                var rows = from row in dt.AsEnumerable()
                           where row.Field<string>("Category_Name").Trim() == ddlCategoriesForExcercises.SelectedItem.Text.Trim().ToString()
                           select row;
                if (rows.Count() > 0)
                {
                    dt1 = rows.CopyToDataTable();
                    DataPanel.Visible = true;
                    NodataPanel.Visible = false;
                    gvcheckbox.DataSource = dt1;
                    gvcheckbox.DataBind();
                }
                else
                {
                    objRegistrationEntity.RoleName = "Studentuuu";
                    SqlDataReader dr1 = objRegistrationBL.GetRegisteredUsers(objRegistrationEntity);
                    dtGetRegisteredUsers.Load(dr1);
                    DataPanel.Visible = false;
                    gvcheckbox.DataSource = null;
                    gvcheckbox.DataBind();
                    //GetAllUsers();
                    dtGetRegisteredUsers.Rows.Add(dtGetRegisteredUsers.NewRow());
                    GvNodata.DataSource = dtGetRegisteredUsers;
                    GvNodata.DataBind();
                    int columncount = GvNodata.Rows[0].Cells.Count;
                    GvNodata.Rows[0].Cells.Clear();
                    GvNodata.Rows[0].Cells.Add(new TableCell());
                    GvNodata.Rows[0].Cells[0].ColumnSpan = columncount;
                    GvNodata.Rows[0].Cells[0].Text = "No Records Found";
                    NodataPanel.Visible = true;
                }
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataPanel.Visible = false;
            NodataPanel.Visible = false;
            pnlActivatedUsers.Visible = false;
            pnlCancelUsers.Visible = false;
            pnlPaymentsList.Visible = false;
            if (ddlType.SelectedValue == "1")
            {
                GetRegisteredUsers();
                DataPanel.Visible = true;
                lblActivatedusers.Visible = false;
                btnActivateGV.Visible = false;
            }
            else if (ddlType.SelectedValue == "2")
            {

                lblActivatedusers.Visible = true;
                GetConfirmusers();
                btnActivateGV.Visible = true;
                pnlActivatedUsers.Visible = true;
            }
            else if (ddlType.SelectedValue == "3")
            {
                lblActivatedusers.Visible = false;
                btnActivateGV.Visible = false;
                GetCancelusers();
            }
            else if (ddlType.SelectedValue == "4")
            {
                lblActivatedusers.Visible = false;
                btnActivateGV.Visible = false;
                GetPaymentusers();

            }
        }

        private void GetConfirmusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentConfirmUsers(Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                Session["dt"] = dt;
                gvActivatedUsers.DataSource = dt;
                gvActivatedUsers.DataBind();
            }
            else
            {
                dt = new DataTable();
                gvActivatedUsers.DataSource = dt;
                gvActivatedUsers.DataBind();
                lblNoDataHeading.Text = "Confirmed Students";
            }
        }

        private void GetCancelusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentCancelUsers(Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value));
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
                gvCancel.DataSource = dt;
                gvCancel.DataBind();
                pnlCancelUsers.Visible = true;
                lblNoDataHeading.Text = "Student Deactivated List";
            }
        }

        private void GetPaymentusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentCancelUsers(Convert.ToInt32("3"));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                pnlPaymentsList.Visible = true;
                gvPayments.DataSource = dt;
                gvPayments.DataBind();
            }
            else
            {
                dt = new DataTable();
                gvPayments.DataSource = dt;
                gvPayments.DataBind();
                pnlPaymentsList.Visible = true;
                lblNoDataHeading.Text = "Canceled Students";
            }
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
                        SqlDataReader dr = objRegistrationBL.StudentCancelRegistrationActive(Convert.ToInt32(id));
                    }
                }
            }
            GetCancelusers();
        }

        protected void gvCancel_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }


    }
}