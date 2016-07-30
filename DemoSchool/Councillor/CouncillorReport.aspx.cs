using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.BL;
namespace PresentationLayer.Councellor
{
    public partial class CouncillorReport : System.Web.UI.Page
    {
        RegistrationBL objrbl = new RegistrationBL();
        AddProgramsBL objBL = new AddProgramsBL(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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
            if (selectedvalue!="---Select---")
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
                    ddlForm.Items.Clear();
                    clearItems();
                }
            }
            else
            {
                ddlSubject.Items.Clear();
                ddlForm.Items.Clear();
                clearItems();
            }
      
        }
        public void clearItems()
        {
             txtFormId.Value = "";
             txtFormSubmitDate.Value = "";
             txtPersonName.Value = "";
             txtDOB.Value = "";
             txtAddress.Value = "";
             txtLandLinePhone.Value = "";
             txtMobile.Value = "";
             txtEmailId.Value = "";
             txtCategory.Value = "";
             txtEnquirySubject.Value = "";
             txtEnquiryInfo.Value = "";
             txtEnquiryTitle.Value = "";
             txtStatus.Value = "";
             txtRemarks.Value = "";
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategorieId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            int SubjectId = Convert.ToInt32(ddlSubject.SelectedItem.Value);
            SqlDataReader dr = objrbl.getEnquiryFroms(CategorieId, SubjectId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlForm.DataSource = dt;
            ddlForm.DataTextField = "E_FormId";
            ddlForm.DataValueField = "E_FormId";
            ddlForm.DataBind();
            ddlForm.Items.Insert(0, "---Select---");
        }

        protected void lnkViewReport_Click(object sender, EventArgs e)
        {
            string getSubjectDDLValue = (ddlSubject.SelectedItem.Text);
            if (getSubjectDDLValue != "---Select---")
            {
                int formId = Convert.ToInt32(ddlForm.SelectedItem.Value);
                SqlDataReader dr = objrbl.getFormDetailsByFormId(formId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtFormId.Value = dt.Rows[0]["E_FormId"].ToString();
                txtFormSubmitDate.Value = dt.Rows[0]["E_EnquiryDate"].ToString();
                txtPersonName.Value = dt.Rows[0]["E_FirstName"].ToString() + " " + dt.Rows[0]["E_LastName"].ToString();
                txtDOB.Value = dt.Rows[0]["E_DoB"].ToString();
                txtAddress.Value = dt.Rows[0]["E_HNo_DNo_PNo"].ToString() + " " + dt.Rows[0]["E_StreetNo"].ToString() + " " + dt.Rows[0]["E_StreetName"].ToString();
                txtLandLinePhone.Value = dt.Rows[0]["E_LandLine"].ToString();
                txtMobile.Value = dt.Rows[0]["E_MobileNumber"].ToString();
                txtEmailId.Value = dt.Rows[0]["E_Email"].ToString();
                txtCategory.Value = dt.Rows[0]["Category_Name"].ToString();
                txtEnquirySubject.Value = dt.Rows[0]["Subject_Name"].ToString();
                txtEnquiryInfo.Value = dt.Rows[0]["E_TitleInfo"].ToString();
                txtEnquiryTitle.Value = dt.Rows[0]["Subject_Name"].ToString();
                txtStatus.Value = dt.Rows[0]["E_Status"].ToString();
                txtRemarks.Value = dt.Rows[0]["E_StatusDate"].ToString() + "/" + dt.Rows[0]["E_Remarks"].ToString();

                SqlDataReader dr1 = objrbl.getFormRespondentDetailsByFormId(formId);
                if (dr1.HasRows)
                {
                    DataTable dtRespondentInfo = new DataTable();
                    dtRespondentInfo.Load(dr1);
                    txtRespondentName.Value = dtRespondentInfo.Rows[0]["R_PersonName"].ToString();
                    txtRespondentMsg.Value = dtRespondentInfo.Rows[0]["R_ResponseMessage"].ToString();
                    txtRespondentEmail.Value = dtRespondentInfo.Rows[0]["R_Email"].ToString();
                    txtRespondentMobile.Value = dtRespondentInfo.Rows[0]["R_MobileNumber"].ToString();
                    txtResponseType.Value = dtRespondentInfo.Rows[0]["R_ResponseType"].ToString();
                    txtResponseDate.Value = dtRespondentInfo.Rows[0]["R_ResponseDate"].ToString();
                }
                else
                {
                    txtRespondentName.Value = "";
                    txtRespondentMsg.Value = "";
                    txtRespondentEmail.Value = "";
                    txtRespondentMobile.Value = "";
                    txtResponseType.Value = "";
                    txtResponseDate.Value = "";
                }
            }
            else
            {
                clearItems();
            }

        }
    }
}