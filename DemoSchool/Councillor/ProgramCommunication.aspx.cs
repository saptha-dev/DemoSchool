using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.BL;
using BAL.BE;
using System.Text;
using System.Net.Mail;
using System.IO;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
namespace PresentationLayer.Councellor
{
    public partial class ProgramCommunication : System.Web.UI.Page
    {
        DataTable LoadGridview = new DataTable();
        SendSMSBL objSMSBL = new SendSMSBL();
        SendSMSBE objSMSBE = new SendSMSBE();
        string strName = string.Empty;
        string strEmail = string.Empty;
        string strSMSName = string.Empty;
        string strMobile = string.Empty;
        RegistrationBL objrbl = new RegistrationBL();
        AddProgramsBL objBL = new AddProgramsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 
                LoadCategoryDrpdown();
            }
            else
            {
            }

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetEmployeeName(string empName)
        {
           
            List<string> empResult = new List<string>();
            using (SqlConnection con = new SqlConnection(@"Data Source=SMT;Initial Catalog=OLS_Db;User ID=sa;Password=SMT@123"))
            {
                SqlCommand cmdDataTable = new SqlCommand();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select E_FirstName from tbl_Enquiry where E_FirstName LIKE ''+@SearchEmpName+'%' group by E_FirstName"; 
                   
                    cmd.Connection = con;
                    
                    con.Open();
                    cmd.Parameters.AddWithValue("@SearchEmpName", empName);
                     SqlDataReader dr = cmd.ExecuteReader();
               

                    while (dr.Read())
                    {
                        empResult.Add(dr["E_FirstName"].ToString());
                    }
                    con.Close();
                    return empResult;
                }
            }

        }

        protected void CheckAll_Changed(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)grdEnquiryDetails.HeaderRow.FindControl("chkAll");
            foreach (GridViewRow row in grdEnquiryDetails.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkFormdId");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                    Check_Changed(sender, e);
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }
        public void LoadCategoryDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForCategoriesDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlCategory.DataSource = dt;
            ddlCategory.DataValueField = "Category_Id";
            ddlCategory.DataTextField = "Category_Name";
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, "---Select---");

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedvalue = ddlCategory.SelectedItem.Text;
            if (selectedvalue != "---Select---")
            {
                int CategorieID = Convert.ToInt32(ddlCategory.SelectedItem.Value);
                SqlDataReader dr = objBL.GetSubjectBasedOnCategoriesDrpdwn(CategorieID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataValueField = "Subject_Id";
                    ddlSubject.DataTextField = "Subject_Name";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, "---Select---");
                }
                else
                {
                    ddlSubject.Items.Clear();
                  
                    clearItems();
                }
            }
            else
            {
                ddlSubject.Items.Clear();
                
                clearItems();
            }

        }
        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategorieId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            int SubjectId = Convert.ToInt32(ddlSubject.SelectedItem.Value);
            SqlDataReader dr = objrbl.CommunicationsFroms(CategorieId, SubjectId);
            if (dr.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(dr);
                ViewState["FormDatatable"] = dt;
             
                grdEnquiryDetails.DataSource = dt;
                grdEnquiryDetails.DataBind();

                gridViewPhoneEnquiry.DataSource = dt;
                gridViewPhoneEnquiry.DataBind();
            }
           
        }

        protected void Check_Changed(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt =(DataTable)ViewState["FormDatatable"];
       
            int count = 1;
            foreach (GridViewRow gvrow in grdEnquiryDetails.Rows)  
            {
                
                CheckBox chk = (CheckBox)gvrow.FindControl("chkFormdId");
                if (chk != null && chk.Checked)
                {
                if (count == 1)
                {
                        strName += gvrow.Cells[2].Text;
                        strEmail += gvrow.Cells[6].Text;
                        count++;
                    
                }
                else
                {   
                    strName +=";"+ gvrow.Cells[2].Text;
                    strEmail += ";"+ gvrow.Cells[6].Text ;
                    
                }
              }
             
            }
            txtPersonName.Value = strName;
            txtPersonEmail.Value = strEmail;
            txtGroupEmail.Value = strEmail;
            txtCategory.Value = ddlCategory.SelectedItem.Text;
            txtSubject.Value = ddlSubject.SelectedItem.Text;
           
       }

        protected void SMSCheck_Changed(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt =(DataTable)ViewState["FormDatatable"];
       
            int count = 1;
            foreach (GridViewRow gvrow in gridViewPhoneEnquiry.Rows)  
            {

                CheckBox chk = (CheckBox)gvrow.FindControl("chkSMSFormdId");

                if (chk != null & chk.Checked)
                {
                    if (count == 1)
                    {

                        strSMSName += gvrow.Cells[2].Text;
                        strMobile += gvrow.Cells[6].Text;
                        count++;
                    }
                    else
                    {

                        strSMSName += ";" + gvrow.Cells[2].Text;
                        strMobile += ";" + gvrow.Cells[6].Text;

                    }
                }
            }
            txtSMSPersonName.Value = strSMSName;
            txtSMSMobileNumber.Value = strMobile;
            txtSMSGroupMobileNumber.Value = strMobile;
            txtSMSCategory.Value = ddlCategory.SelectedItem.Text;
            txtSMSSubject.Value = ddlSubject.SelectedItem.Text;
           
       }

        

        public void clearItems()
        {
            //txtFormId.Value = "";
            //txtFormSubmitDate.Value = "";
            //txtPersonName.Value = "";
            //txtDOB.Value = "";
            //txtAddress.Value = "";
            //txtLandLinePhone.Value = "";
            //txtMobile.Value = "";
            //txtEmailId.Value = "";
            //txtCategory.Value = "";
            //txtEnquirySubject.Value = "";
            //txtEnquiryInfo.Value = "";
            //txtEnquiryTitle.Value = "";
            //txtStatus.Value = "";
            //txtRemarks.Value = "";
        }

        protected void lnksendMail_Click(object sender, EventArgs e)
        {
      
            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            string splitMails = txtPersonEmail.Value;
            string[] mail = splitMails.Split(';');
            try
            {
                foreach (var singleMail in mail)
                {
                    m.From = new MailAddress("rajesh.nallamotu99@gmail.com");
                    m.To.Add(singleMail);
                    m.Subject = txtTitleInfo.Value + " Enquiry";
             
                    if (fileUpload.HasFile)
                    {
                        String FileName = fileUpload.PostedFile.FileName;
                        
                        m.Attachments.Add(new Attachment(fileUpload.PostedFile.InputStream, FileName));
                    }
                    m.IsBodyHtml = false;
                    m.Body = txtProgramInfo.Value;
                    sc.Host = "smtp.gmail.com";
                    sc.Port = 587;
                    sc.Credentials = new System.Net.NetworkCredential("rajesh.nallamotu99@gmail.com", "62082316");
                    sc.EnableSsl = true;
                    sc.Send(m);
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email Not Sent Please try again.');", true);
            }

        }
        protected void lnksendSMS_Click(object sender, EventArgs e)
        {
            objSMSBE.UserName = ConfigurationManager.AppSettings["SendSms_UserID"];
            objSMSBE.PassWord = ConfigurationManager.AppSettings["SendSms_Password"];
            objSMSBE.strNo = txtSMSMobileNumber.Value; ;
            objSMSBE.strMsg = txtSMSProgramInfo.Value;
            objSMSBE.category = ddlCategory.SelectedItem.Text;
            objSMSBE.subject = ddlSubject.SelectedItem.Text;
            objSMSBE.getRespondentMsg = txtSMSProgramInfo.Value;
            int getValue = objSMSBL.SendGroupSms(objSMSBE);
            if (getValue == 1)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email Not Sent Please try again.');", true);
            }

        }

        protected void lnkBtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(@"Data Source=SMT;Initial Catalog=OLS_Db;User ID=sa;Password=SMT@123"))
            {
                SqlCommand cmdDataTable = new SqlCommand();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select * from tbl_Enquiry where E_FirstName = '" + txtEmpName.Text + "' and E_CategoryId=" + ddlCategory.SelectedValue + " and E_SubjectId=" + ddlSubject.SelectedValue + "";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        LoadGridview.Load(dr);
                        Session["gridbyName"] = LoadGridview;

                        grdEnquiryDetails.DataSource = LoadGridview;
                        grdEnquiryDetails.DataBind();

                        gridViewPhoneEnquiry.DataSource = LoadGridview;
                        gridViewPhoneEnquiry.DataBind();
                    }
                    else
                    {
                        string name = txtEmpName.Text;
                        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Records Not found with " + name + " Please try again.');", true);
                    }

                    con.Close();
                    
                }
            }
        }

        protected void grdEnquiryDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdEnquiryDetails.PageIndex = e.NewPageIndex;
            grdEnquiryDetails.DataSource = (DataTable)ViewState["FormDatatable"];
            grdEnquiryDetails.DataBind();
        }

       
        

    }
}