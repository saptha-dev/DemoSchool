using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.BL;
using System.Net.Mail;
using System.Net;
using BAL.BE;
using System.Configuration;

namespace PresentationLayer.Councellor
{
    public partial class Enquiry : System.Web.UI.Page
    {
        public int getFormIdForStatusUpdate;
        SendSMSBL objSMSBL = new SendSMSBL();
        SendSMSBE objSMSBE = new SendSMSBE();
        RegistrationBL objrbl = new RegistrationBL();
        AddProgramsBL objBL = new AddProgramsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load Programs Dropdwon List
                LoadCategoryDrpdown();
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
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "hideGrid();", true);
                    ddlSubject.Items.Clear();
                    ClearFields();
                }
            }
            else
            {
                ddlSubject.Items.Clear();
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "showTable();", true);  
                //clearItems();
            }

        }

   
        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
           
            RadioButton rdo = (RadioButton)sender; //Get Current Radio Button
            DataTable dt = new DataTable();
            dt =(DataTable)ViewState["FormDatatable"];
            rdo.Checked = true;
            GridViewRow gr = (GridViewRow)rdo.Parent.Parent;
            string strValue = grdEnquiryDetails.DataKeys[gr.RowIndex].Value.ToString();//Get FormId from Current Row
            if (strValue != "" && strValue != null)
            {
                IEnumerable<DataRow> rows = from row in dt.AsEnumerable()             //Get Row value By Filtering DataTable
                           where row.Field<string>("E_FormId").Trim() == strValue     //  
                           select row;
                DataTable boundTable = rows.CopyToDataTable<DataRow>();

                //SMS & Email
                txtSendToformId.Text = boundTable.Rows[0]["E_FormId"].ToString();
                txtSendToFirstName.Text = boundTable.Rows[0]["E_FirstName"].ToString();
                txtSendToCategory.Text= boundTable.Rows[0]["Category_Name"].ToString();
                txtSendToSubject.Value = boundTable.Rows[0]["Subject_Name"].ToString();
                txtSendToEmail.Value = boundTable.Rows[0]["E_Email"].ToString();
                txtSendToMobile.Value = boundTable.Rows[0]["E_MobileNumber"].ToString();
                txtSendToInfo.Value = boundTable.Rows[0]["E_TitleInfo"].ToString();

                //Email
                txtRepsonseMailFormId.Value = boundTable.Rows[0]["E_FormId"].ToString();
                ViewState["FormEmailId"] = txtRepsonseMailFormId.Value;
                txtRepsonseMailPersonName.Value = boundTable.Rows[0]["E_FirstName"].ToString();
                txtRepsonseMailCategory.Value = boundTable.Rows[0]["Category_Name"].ToString();
                txtRepsonseMailSubject.Value = boundTable.Rows[0]["Subject_Name"].ToString();
                txtRepsonseMailEmail.Value = boundTable.Rows[0]["E_Email"].ToString();

                //SMS
                txtSMSformId.Value = boundTable.Rows[0]["E_FormId"].ToString();
                ViewState["FromSMSId"] = txtSMSformId.Value;
                txtSMSpersonName.Value = boundTable.Rows[0]["E_FirstName"].ToString();
                txtSMSCategoryName.Value = boundTable.Rows[0]["Category_Name"].ToString();
                txtSMSSubjectName.Value = boundTable.Rows[0]["Subject_Name"].ToString();
                txtSMSMobileNumber.Value = boundTable.Rows[0]["E_MobileNumber"].ToString();
            }

        }

        /// <summary>
        /// Load Gridview data on Subject Dropdown list on Index Changed Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedvalue = ddlSubject.SelectedItem.Text;
            if (selectedvalue != "---Select---")
            {
                int subjectId = Convert.ToInt32(ddlSubject.SelectedItem.Value);
                SqlDataReader dr = objrbl.GetEnquiryFormDetailsBySubject(subjectId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "hideTable();", true);
                    ViewState["FormDatatable"] = dt;
                    grdEnquiryDetails.DataSource = dt;
                    grdEnquiryDetails.DataBind();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "hideGrid();", true);
                    ClearFields();
                }
            }
            else
            {

                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", " hideGrid();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "hideTable();", true);
    
            }
        }

        /// <summary>
        /// Clear All Fields After Sending Email Or SMS
        /// </summary>

        public void ClearFields()
        {
            //SMS & Email
            txtSendToformId.Text = "";
            txtSendToFirstName.Text = "";
            txtSendToCategory.Text = "";
            txtSendToSubject.Value = "";
            txtSendToEmail.Value = "";
            txtSendToMobile.Value = "";

            //Email
            txtRepsonseMailFormId.Value = "";
            txtRepsonseMailPersonName.Value = "";
            txtRepsonseMailCategory.Value="";
            txtRepsonseMailSubject.Value ="";
            txtRepsonseMailEmail.Value = "";
                                         
            //SMS                        
            txtSMSformId.Value ="";
            txtSMSpersonName.Value = "";
            txtSMSCategoryName.Value = "";
            txtSMSSubjectName.Value = "";
            txtSMSMobileNumber.Value ="";
        }

        /// <summary>
        /// Sending Email On LinkButton Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnSendEmail_Click(object sender, EventArgs e)
        {
            SendMail();
        }

        /// <summary>
        /// Sending Mail Code
        /// </summary>
        public void SendMail()
        {
            
            string str ;
            MailMessage m = new MailMessage();
            SmtpClient sc = new SmtpClient();
            try
            {
                m.From = new MailAddress("rajesh.nallamotu99@gmail.com");
                m.To.Add(txtSendToEmail.Value);
                m.Subject = txtSendToSubject.Value + "Subject Enquiry";
                m.IsBodyHtml = false;
                m.Body = txtSendToInfo.Value;
                sc.Host = "smtp.gmail.com";
                sc.Port = 587;
                sc.Credentials = new System.Net.NetworkCredential("rajesh.nallamotu99@gmail.com", "62082316");
                sc.EnableSsl = true;
                sc.Send(m);
                SqlDataReader dr = saveRespondentInfo("E-Mail");
                if (dr.RecordsAffected == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "SuccessPoPup();", true);
                    if (ViewState["FormEmailId"]!=null)
                    {
                        str = ViewState["FormEmailId"].ToString();
                        getFormIdForStatusUpdate =Convert.ToInt32(str.Remove(0,4));
                     }
                  
                    SqlDataReader drUpdateStatus = objrbl.UpdateEnquiryFormStatus(getFormIdForStatusUpdate);
                    int rowsUpdated=drUpdateStatus.RecordsAffected;
                    
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "FailedPoPup();", true);
                }

             }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
 
        }


        public SqlDataReader saveRespondentInfo(string RespType)
        {
            DataTable dt = (DataTable)Session["CounsellorForRespondent"];
            string str = txtSendToformId.Text.Trim();
            string formId=str.Remove(0, 4);
            objSMSBE.FormId = formId;
            objSMSBE.RespondentName = dt.Rows[0]["C_FName"].ToString();
            objSMSBE.getRespondentMsg = txtSendToInfo.Value;
            objSMSBE.getRespondentEmail = dt.Rows[0]["EmailId"].ToString();
            objSMSBE.getRespondentMobile = dt.Rows[0]["MobileNumber"].ToString();
            objSMSBE.getRespondentR_Type = RespType;
            objSMSBE.getResponseDate = System.DateTime.Now;
            SqlDataReader dr = objSMSBL.insertRespondentInfo(objSMSBE);
            return dr;
        }
        /// <summary>
        /// Sending SMS On LinkButton Click Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnSendSMS_Click(object sender, EventArgs e)
        {
            SendSMS();
        }

        protected void lnkBtnSendIndEmail_Click(object sender, EventArgs e)
        {
            SendMail();
        }
        protected void lnkBtnSendIndSMS_Click(object sender, EventArgs e)
        {
            SendSMS();
        }
       

        /// <summary>
        /// Code for Sending SMS to Mobiles
        /// </summary>
        public void SendSMS()
        {
            string str;
            objSMSBE.UserName = ConfigurationManager.AppSettings["SendSms_UserID"];
            objSMSBE.PassWord = ConfigurationManager.AppSettings["SendSms_Password"];
            objSMSBE.strNo = txtSendToMobile.Value.Trim();
            objSMSBE.strMsg = txtSendToInfo.Value;
            int getValue = objSMSBL.SendSms(objSMSBE);
            if (getValue == 1)
            {
               
                SqlDataReader dr = saveRespondentInfo("SMS");
                if (dr.RecordsAffected == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "SuccessPoPup();", true);
                    if (ViewState["FromSMSId"] != null)
                    {

                        str = ViewState["FromSMSId"].ToString();
                        getFormIdForStatusUpdate = Convert.ToInt32(str.Remove(0, 4));
                    }
                    SqlDataReader drUpdateStatus = objrbl.UpdateEnquiryFormStatus(getFormIdForStatusUpdate);
                    int rowsUpdated = drUpdateStatus.RecordsAffected;
                }
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "FailedPoPup();", true);
            }
        }
    }                                    
}                                        