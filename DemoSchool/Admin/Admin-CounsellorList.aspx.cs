using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using BAL.BE;
using BAL.BL;

namespace PresentationLayer.Admin
{
    public partial class Admin_CounsellorList : System.Web.UI.Page
    {
        #region Declarations
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
                   
                   // }

                }


            }
        }

        public void GetAllUsers()
        {
            objRegistrationEntity.RoleName = "Counsellor";
            SqlDataReader dr = objRegistrationBL.GetAllUsers(objRegistrationEntity);
            DataTable dtGetAllUsers = new DataTable();
            dtGetAllUsers.Load(dr);
            if (dtGetAllUsers.Rows.Count > 0)
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = true;
                GvNodata.DataSource = dtGetAllUsers;
                GvNodata.DataBind();
            }
            else
            {
                DataPanel.Visible = true;
                NodataPanel.Visible = false;
            }
        }

        private void GetRegisteredUsers()
        {
            SqlDataReader dr = objRegistrationBL.GetCounsellorRegisteredUsers();
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
                        SqlDataReader dr = objRegistrationBL.ActivateCounsellor(UserName, Password, Convert.ToInt32(id));
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
            }

            GetRegisteredUsers();
        }

        private void GetActiveusers()
        {
            SqlDataReader dr = objRegistrationBL.GetStudentActiveUsers("Counsellor");
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
                        SqlDataReader dr = objRegistrationBL.CounsellorRegistrationCancel(Convert.ToInt32(id));
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
                        SqlDataReader dr = objRegistrationBL.DeActivateCounsellor(Convert.ToInt32(id));
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
                GetActiveCounsellerUsers();
            }

        }

        protected void btnCancelView_Click(object sender, EventArgs e)
        {

        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedItem.Value == "1")
            {
                NodataPanel.Visible = false;
                pnlActiveUsers.Visible = false;
                pnlCancelUsers.Visible = false;
                GetRegisteredUsers();
            }
            else if (ddlType.SelectedItem.Value == "2")
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                pnlCancelUsers.Visible = false;
                GetActiveCounsellerUsers();
            }
            else if (ddlType.SelectedItem.Value == "3")
            {
                DataPanel.Visible = false;
                NodataPanel.Visible = false;
                pnlActiveUsers.Visible = false;
                GetCancelusers();
            }
        }

        private void GetActiveCounsellerUsers()
        {
            SqlDataReader dr = objRegistrationBL.GetCounsellorActiveUsers();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                pnlActiveUsers.Visible = true;
                DataPanel.Visible = false;
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
            }
        }

        private void GetCancelusers()
        {
            SqlDataReader dr = objRegistrationBL.GetCounsellorCancelUsers();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                pnlCancelUsers.Visible = true;
                gvCancel.DataSource = dt;
                gvCancel.DataBind();
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
                        SqlDataReader dr = objRegistrationBL.CounsellorCancelRegistrationActivate(Convert.ToInt32(id));
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