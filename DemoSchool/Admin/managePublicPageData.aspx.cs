using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using System.Text.RegularExpressions;

namespace PresentationLayer.Admin
{
    public partial class managePublicPageData : System.Web.UI.Page
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
                LoadAffiliations();
                LoadConsulting();
                LoadCareer();
                LoardPrgMethod();
                LoadNews();
                LoadEvents();
            }
            else
            {
                lblMessage.Visible = false;
                lblConsultingMessage.Visible = false;
                lblPrgMethodMessage.Visible = false;
                lblCareerMessage.Visible = false;
                lblNewsMessage.Visible = false;
                lblEventMessage.Visible = false;
            }
            

        }

        public void LoadAffiliations()
        {
            SqlDataReader dr = objContentData.getAffiliationsForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlAffiliation.DataSource = dt;
            ddlAffiliation.DataTextField = "AffName";
            ddlAffiliation.DataValueField = "AffID";
            ddlAffiliation.DataBind();
            ddlAffiliation.Items.Insert(0, new ListItem("--Select--", ""));
        }
        public void LoadConsulting()
        {
            SqlDataReader dr = objContentData.getConsultingsForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlConsulting.DataSource = dt;
            ddlConsulting.DataTextField = "Consult_Name";
            ddlConsulting.DataValueField = "ConsultingID";
            ddlConsulting.DataBind();
            ddlConsulting.Items.Insert(0, new ListItem("--Select--", ""));
        }
        public void LoadCareer()
        {
            SqlDataReader dr = objContentData.getCareersForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlCareer.DataSource = dt;
            ddlCareer.DataTextField = "Career_Name";
            ddlCareer.DataValueField = "CareerId";
            ddlCareer.DataBind();
            ddlCareer.Items.Insert(0, new ListItem("--Select--", ""));
        }
        public void LoardPrgMethod()
        {
            SqlDataReader dr = objContentData.getPrgMethodsForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlPrgMethod.DataSource = dt;
            ddlPrgMethod.DataTextField = "ProgramMethod_Name";
            ddlPrgMethod.DataValueField = "programMethodId";
            ddlPrgMethod.DataBind();
            ddlPrgMethod.Items.Insert(0, new ListItem("--Select--", ""));
        }
        public void LoadNews()
        {
            SqlDataReader dr = objContentData.getNewsForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlNews.DataSource = dt;
            ddlNews.DataTextField = "News_Name";
            ddlNews.DataValueField = "NewsId";
            ddlNews.DataBind();
            ddlNews.Items.Insert(0, new ListItem("--Select--", ""));
        }
        public void LoadEvents()
        {
            SqlDataReader dr = objContentData.getEventsForDropdown();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlEvents.DataSource = dt;
            ddlEvents.DataTextField = "Event_Name";
            ddlEvents.DataValueField = "EventId";
            ddlEvents.DataBind();
            ddlEvents.Items.Insert(0, new ListItem("--Select--", ""));
        }


        protected void btnAffiliationUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["ID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateAffiliationsContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Affiliation Content has updated";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                ClearFields();
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Content Failed";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }

        }

        protected void ddlAffiliation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAffiliation.SelectedItem.Value != "0" && ddlAffiliation.SelectedItem.Value!="")
            {
                int getAffiliationID = int.Parse(ddlAffiliation.SelectedItem.Value);
                SqlDataReader dr = objContentData.getAffiliationsContent(getAffiliationID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                ViewState["ID"] = dt.Rows[0]["AffID"].ToString();
                txtAffiliationContent.Text = dt.Rows[0]["Aff_Content"].ToString();
                
            }
            else
            {
               
                txtAffiliationContent.Text = "";

            }
        }

        protected void ddlConsulting_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlConsulting.SelectedItem.Value != "0" && ddlConsulting.SelectedItem.Value != "")
            {
                int getConsultingID = int.Parse(ddlConsulting.SelectedItem.Value);
                SqlDataReader dr = objContentData.getConsultingContent(getConsultingID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtConsultingContent.Text = dt.Rows[0]["Consult_Content"].ToString();
                ViewState["CID"] = dt.Rows[0]["ConsultingID"].ToString();
            }
            else
            {

                txtConsultingContent.Text = "";

            }
        }

        protected void ddlCareer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCareer.SelectedItem.Value != "0" && ddlCareer.SelectedItem.Value != "")
            {
                int getCareerID = int.Parse(ddlCareer.SelectedItem.Value);
                SqlDataReader dr = objContentData.getCareerContent(getCareerID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtCareerContent.Text = dt.Rows[0]["Career_Content"].ToString();
                ViewState["CRID"] = dt.Rows[0]["CareerId"].ToString();
            }
            else
            {
                txtCareerContent.Text = "";
            }
        }

        protected void ddlPrgMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPrgMethod.SelectedItem.Value != "0" && ddlPrgMethod.SelectedItem.Value != "")
            {
            int getProID = int.Parse(ddlPrgMethod.SelectedItem.Value);
            SqlDataReader dr = objContentData.getProgramMethodContent(getProID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            txtPrgMethodContent.Text = dt.Rows[0]["ProgramMethod_Content"].ToString();
            ViewState["PRGID"] = dt.Rows[0]["programMethodId"].ToString();
            }
             else
             {
                 txtPrgMethodContent.Text = "";
             }
        }

        protected void ddlNews_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlNews.SelectedItem.Value != "0" && ddlNews.SelectedItem.Value != "")
            {
                int getNewsID = int.Parse(ddlNews.SelectedItem.Value);
                SqlDataReader dr = objContentData.getNewsContent(getNewsID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtNewsContent.Text = dt.Rows[0]["News_Content"].ToString();
                ViewState["NID"] = dt.Rows[0]["NewsId"].ToString();
            }
            else
            {
                txtNewsContent.Text = "";
            }
        }

        protected void ddlEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEvents.SelectedItem.Value != "0" && ddlEvents.SelectedItem.Value != "")
            {
                int getEventID = int.Parse(ddlEvents.SelectedItem.Value);
                SqlDataReader dr = objContentData.getEventContent(getEventID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtEventContent.Text = dt.Rows[0]["Event_Content"].ToString();
                ViewState["EID"] = dt.Rows[0]["EventId"].ToString();
                
            }
            else
            {
                txtEventContent.Text = "";
            }

        }

        public void ClearFields()
        {
            txtAffiliationContent.Text = "";
            txtConsultingContent.Text = "";
            txtCareerContent.Text = "";
            txtPrgMethodContent.Text = "";
            txtNewsContent.Text = "";
            txtEventContent.Text = "";
            LoadAffiliations();
            LoadConsulting();
            LoadCareer();
            LoardPrgMethod();
            LoadNews();
            LoadEvents();
        }

        protected void btnConsultingUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["CID"]);
            string Content =txtConsultingContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateConsultingContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblConsultingMessage.Visible = true;
                lblConsultingMessage.Text = "Consulting Content has updated";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
                ClearFields();
            }
            else
            {
                lblConsultingMessage.Visible = true;
                lblConsultingMessage.Text = "Content Failed";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
            }
        }


        protected void btnCareerUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["CRID"]);
            string Content = txtCareerContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateCareerContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblCareerMessage.Visible = true;
                lblCareerMessage.Text = "Career Content updated";
                lblCareerMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
                ClearFields();
            }
            else
            {
                lblCareerMessage.Visible = true;
                lblCareerMessage.Text = "Content Failed";
                lblCareerMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
            }
        }

        protected void btnPrgMethodUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["PRGID"]);
            string Content = txtPrgMethodContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateProgramMethodContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblPrgMethodMessage.Visible = true;
                lblPrgMethodMessage.Text = "ProgramMethod Content updated";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
                ClearFields();
            }
            else
            {
                lblPrgMethodMessage.Visible = true;
                lblPrgMethodMessage.Text = "Content Failed";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
            }
        }

        protected void btnNewsUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["NID"]);
            string Content = txtNewsContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateNewsContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblNewsMessage.Visible = true;
                lblNewsMessage.Text = "News Content updated";
                lblNewsMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
                ClearFields();
            }
            else
            {
                lblNewsMessage.Visible = true;
                lblNewsMessage.Text = "Content Failed";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
                lblNewsMessage.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        protected void btnEventUpdate_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["EID"]);
            string Content = txtEventContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.UpdateEventContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblEventMessage.Visible = true;
                lblEventMessage.Text = "Event Content updated";
                lblEventMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);
                ClearFields();
            }
            else
            {
                lblEventMessage.Visible = true;
                lblEventMessage.Text = "Content Failed";
                lblEventMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);
            }
        }


        //Deletion of Content

        protected void btnAffiliateDelete_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["ID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteAffiliationsContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Affiliation Content Deleted";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                ClearFields();
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Deletion failed";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }

        }

        protected void btnConsultingDelete_Click(object sender, EventArgs e)
        {
            
            int Id = Convert.ToInt32(ViewState["CID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteConsultingContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {
                lblConsultingMessage.Visible = true;
                lblConsultingMessage.Text = "Consulting Content Deleted";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
                ClearFields();
            }
            else
            {
                lblConsultingMessage.Visible = true;
                lblConsultingMessage.Text = "Deletion failed";
                lblConsultingMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel2();", true);
            }
        }

        protected void btnCareerDelete_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["CRID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteCareerContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblCareerMessage.Visible = true;
                lblCareerMessage.Text = "Career Content Deleted";
                lblCareerMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
                ClearFields();
            }
            else
            {
                lblCareerMessage.Visible = true;
                lblCareerMessage.Text = "Deletion failed";
                lblCareerMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel3();", true);
            }
        }

        protected void btnPrgMethodDelete_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["PRGID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteProgramMethodContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblPrgMethodMessage.Visible = true;
                lblPrgMethodMessage.Text = "ProgramMethod Content Deleted";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
                ClearFields();
            }
            else
            {
                lblPrgMethodMessage.Visible = true;
                lblPrgMethodMessage.Text = "Deletion failed";
                lblPrgMethodMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel4();", true);
            }
        }

        protected void btnNewsDelete_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["NID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteNewsContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblNewsMessage.Visible = true;
                lblNewsMessage.Text = " News Content Deleted";
                lblNewsMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
                ClearFields();
            }
            else
            {
                lblNewsMessage.Visible = true;
                lblNewsMessage.Text = "Deletion failed";
                lblNewsMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel5();", true);
            }
        }

        protected void btnEventDelete_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(ViewState["EID"]);
            string Content = txtAffiliationContent.Text;
            string newdescription = Regex.Replace(Content, @"<[^>]*>", string.Empty).Trim();
            SqlDataReader dr = objContentData.DeleteEventContent(Id, newdescription);
            if (dr.RecordsAffected > 0)
            {

                lblEventMessage.Visible = true;
                lblEventMessage.Text = "Event Content Deleted";
                lblEventMessage.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);
                ClearFields();
            }
            else
            {
                lblEventMessage.Visible = true;
                lblEventMessage.Text = "Deletion failed";
                lblEventMessage.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel6();", true);
            }
        }

        protected void btnAffiliationCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnConsultingCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnCareerCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnPrgMethodCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnNewsCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        protected void btnEventCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
        }


       
    }
}