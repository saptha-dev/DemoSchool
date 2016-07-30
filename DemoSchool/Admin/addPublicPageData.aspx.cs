using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using BAL.BL;
using System.Text.RegularExpressions;

namespace PresentationLayer.Admin
{
    public partial class addPublicPageData : System.Web.UI.Page
    {
        publicPageContentData objContentData = new publicPageContentData();
        protected void Page_Load(object sender, EventArgs e)
        {
            String hiddenFieldValue = hidLastTab.Value;
            StringBuilder js = new StringBuilder();
            js.Append("<script type='text/javascript'>");
            js.Append("var previouslySelectedTab = ");
            js.Append(hiddenFieldValue);
            js.Append(";</script>");
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "acttab", js.ToString());

            if (!IsPostBack)
            {
               
            }
        }

        protected void btnAffiliationContent_Click(object sender, EventArgs e)
        {
            string txtName = txtAffiliationsName.Text;
            string txtContent = txtAffiliationContent.Text;
           // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getAffiliationName(txtName);
            if (dr.HasRows)
            {
                lblMessage.Text = "Affiliation Name " + txtName + " Already Exists";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
            else
            {
               
                dr = objContentData.saveAffilicationContentToDatabase(txtName, newdescription);
                lblMessage.Text =  txtName + " Inserted Successfully ";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
           
        }

        protected void btnConsulting_Click(object sender, EventArgs e)
        {
            
            string txtName = txtConsultingName.Text;
            string txtContent =txtConsultingContent.Text;
           // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getConstultingName(txtName);
            if (dr.HasRows)
            {
                lblConsultingMessage.Text = "Consulting Name " + txtName + " Already Exists";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
            }
            else
            {

                dr = objContentData.saveConsultingContentToDatabase(txtName, newdescription);
                lblConsultingMessage.Text = txtName + " Inserted Successfully ";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
            }
            ClearFields();
        }

        protected void btnAddCareerContent_Click(object sender, EventArgs e)
        {

            string txtName = txtCareerName.Text;
            string txtContent =txtCareerContent.Text;
            // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getCareerName(txtName);
            if (dr.HasRows)
            {
                lblCareerMessage.Text = "Career Name " + txtName + " Already Exists";
                lblCareerMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
            }
            else
            {
                dr = objContentData.saveCareerContentToDatabase(txtName, newdescription);
                lblCareerMessage.Text = txtName + " Inserted Successfully ";
                lblCareerMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
            }
            ClearFields();
        }

        protected void btnAddPrgMethodContent_Click(object sender, EventArgs e)
        {
            string txtName = txtPrgMethodName.Text;
            string txtContent =txtPrgMethodContent.Text;
            // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getProgramMethodName(txtName);
            if (dr.HasRows)
            {
                lblPrgMethodMessage.Text = "ProgramMethod Name " + txtName + " Already Exists";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
            }
            else
            {
                dr = objContentData.saveProgramMethodContentToDatabase(txtName, newdescription);
                lblPrgMethodMessage.Text = txtName + " Inserted Successfully ";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
            }
            ClearFields();
        }

        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            string txtName = txtNewsName.Text ;
            string txtContent = txtNewsContent.Text;
            // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getNewsName(txtName);
            if (dr.HasRows)
            {
                lblNewsMessage.Text = "News Name " + txtName + " Already Exists";
                lblNewsMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
               
            }
            else
            {
                dr = objContentData.saveNewsContentToDatabase(txtName, newdescription);
                lblNewsMessage.Text = txtName + " Inserted Successfully ";
                lblNewsMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
               
            }
            ClearFields();
        }

        protected void btnAddEvent_Click(object sender, EventArgs e)
        {
            string txtName =txtEventName.Text;
            string txtContent = txtEventContent.Text;
            // string newdescription = Regex.Replace(txtContent, @"<[^>]*>&lt;.+?&gt;|&nbsp;", "").Trim();
            string newdescription = Regex.Replace(txtContent, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.getEventName(txtName);
            if (dr.HasRows)
            {
                lblEventMessage.Text = "Event Name " + txtName + " Already Exists";
                lblEventMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);
            }
            else
            {
                dr = objContentData.saveEventContentToDatabase(txtName, newdescription);
                lblEventMessage.Text = txtName + " Inserted Successfully ";
                lblEventMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);

                
            }
            ClearFields();
        }

        public void ClearFields()
        {
            txtAffiliationsName.Text = "";
            txtConsultingName.Text = "";
            txtCareerName.Text = "";
            txtEventName.Text = "";
            txtPrgMethodName.Text = "";
            txtNewsName.Text = "";
            txtAffiliationContent.Text = "";
            txtConsultingContent.Text = "";
            txtCareerContent.Text = "";
            txtPrgMethodContent.Text = "";
            txtNewsContent.Text = "";
            txtEventContent.Text = "";
        }

        protected void btnAffiliationCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            
        }

        protected void btnConsultingCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
           
        }

        protected void btnCancelCareer_Click(object sender, EventArgs e)
        {
            ClearFields();
          
        }

        protected void btnCancelPrgMethod_Click(object sender, EventArgs e)
        {
            ClearFields();
           
        }

        protected void btnCancelNews_Click(object sender, EventArgs e)
        {
            ClearFields();
           
        }

        protected void btnCancelEvent_Click(object sender, EventArgs e)
        {
            ClearFields();
            
        }


    }
}