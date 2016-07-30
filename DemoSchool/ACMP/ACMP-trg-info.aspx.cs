using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;

namespace PresentationLayer.ACMP
{
    public partial class ACMP_trg_info : System.Web.UI.Page
    {
        CompanyBL cmpnyBL = new CompanyBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyBranch();
            }
        }

        public void LoadCompanyBranch()
        {
            lblSubSchMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetBranchByCompany("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlBranch.DataSource = dt;
                ddlBranch.DataValueField = "BranchID";
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubSchMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetBranchProgram(ddlBranch.SelectedValue.Trim());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlProgram.DataSource = dt;
                ddlProgram.DataValueField = "Program_id";
                ddlProgram.DataTextField = "Program_name";
                ddlProgram.DataBind();
                ddlProgram.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubSchMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetBranchCategorybyProgram(ddlBranch.SelectedValue.Trim(), Convert.ToInt32(ddlProgram.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubSchMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetBranchGroupByCategory(ddlBranch.SelectedValue.Trim(), Convert.ToInt32(ddlCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubSchMsg.Text = string.Empty;
            ddlSubject.DataSource = null;

            SqlDataReader dr = cmpnyBL.GetSubjects(Convert.ToInt32(ddlProgram.SelectedValue), Convert.ToInt32(ddlCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject.DataSource = dt;
                ddlSubject.DataValueField = "Subject_Id";
                ddlSubject.DataTextField = "Subject_Name";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubSchMsg.Text = string.Empty;
            GetCategoryDetails();
            GetGroupDetails();
            BindSubjectScheduleInfo();
        }

        private void GetCategoryDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCategoryDetails(Convert.ToInt32(ddlCategory.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                string Id = dt.Rows[0]["Category_Id"].ToString();
                lblCategoryName.Text =Id+":"+ dt.Rows[0]["Category_Name"].ToString();
                lblCategoryDuration.Text = dt.Rows[0]["Category_Duration"].ToString();
                DateTime dm = Convert.ToDateTime(dt.Rows[0]["Category_Srt_Date"]);
                lblCategoryStartDate.Text = dm.ToString("dd-MM-yyyy");
               DateTime dn = Convert.ToDateTime(dt.Rows[0]["Category_End_Date"]);
               lblCategoryEndDate.Text = dn.ToString("dd-MM-yyyy");
                lblCategoryStatus.Text = dt.Rows[0]["Category_Status"].ToString();
                DateTime dl =Convert.ToDateTime(dt.Rows[0]["Category_Status_Date"]);
                lblCategoryStatusDate.Text = dl.ToString("dd-MM-yyyy");
                lblCategorySubjects.Text = dt.Rows[0]["Category_T_Subjects"].ToString();
            }
        }

        private void GetGroupDetails()
        {
            SqlDataReader dr = cmpnyBL.GetGroupDetails(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dn = Convert.ToDateTime(dt.Rows[0]["Branch_End_Date"]);
                lblGroupEndDate.Text = dn.ToString("dd-MM-yyyy");
               DateTime dm = Convert.ToDateTime(dt.Rows[0]["Branch_Srt_Date"]);
               lblGroupStartDate.Text = dm.ToString("dd-MM-yyyy");
                lblGroupStatus.Text = dt.Rows[0]["Branch_Status"].ToString();
                lblGroupYear.Text = dt.Rows[0]["Branch_T_Years"].ToString();
                lblGroupStatusDate.Text = lblCategoryStatusDate.Text;
            }
        }

        private void BindSubjectScheduleInfo()
        {
            lblSubSchMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetSubjectScheduleInfo(Convert.ToInt32(ddlSubject.SelectedValue.Trim()), ddlBranch.SelectedValue);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                System.Data.DataColumn Subject = new System.Data.DataColumn("SubjectName", typeof(System.String));
                Subject.DefaultValue = ddlSubject.SelectedItem.Text.Trim();
                dt.Columns.Add(Subject);
                GVSubjectSchedule.DataSource = dt;
                GVSubjectSchedule.DataBind();
            }
            else
            {
                lblSubSchMsg.Text = "No Records Found";
                lblSubSchMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void BindStudentGVDetails(string ScheduleID)
        {
            SqlDataReader dr = cmpnyBL.GetUnitsScheduleBySubjects(ScheduleID, ddlBranch.SelectedValue);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVUnitsForSubjects.DataSource = dt;
                GVUnitsForSubjects.DataBind();
                ViewState["DTUnits"] = dt;
            }
            else
            {
                lblUnitsForSubjMsg.Text = "No Records Found";
                lblUnitsForSubjMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void gvViewRecord_Click(object sender, ImageClickEventArgs e)
        {
            lblUnitsForSubjMsg.Text = string.Empty;
            pnlViewReport.Visible = true;
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                Label QId = (Label)gvrow.FindControl("ID");
                string ID = QId.Text;
                ViewState["SCHID"] = ID;
                BindStudentGVDetails(ID);
            }
        }

        protected void GVUnitsForSubjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lblUnitsForSubjMsg.Text = string.Empty;
            GVUnitsForSubjects.EditIndex = e.NewEditIndex;
            DataTable dt = (DataTable)ViewState["DTUnits"];
            GVUnitsForSubjects.DataSource = dt;
            GVUnitsForSubjects.DataBind();
            pnlViewReport.Visible = true;
        }

        protected void GVUnitsForSubjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblUnitsForSubjMsg.Text = string.Empty;
            int ID = Convert.ToInt32(GVUnitsForSubjects.DataKeys[e.RowIndex].Value.ToString());
            HiddenField hdnclsid = (HiddenField)GVUnitsForSubjects.Rows[e.RowIndex].FindControl("hdnclasid");
            string id = hdnclsid.Value;
            Label txtUnitEnddate = (Label)GVUnitsForSubjects.Rows[e.RowIndex].FindControl("lblUnitEnddate");
            Label txsrtdate = (Label)GVUnitsForSubjects.Rows[e.RowIndex].FindControl("lblUnitstartdate");
            Label txtremarks = (Label)GVUnitsForSubjects.Rows[e.RowIndex].FindControl("lblUnitRemarks");
            cmpnyBL.UpdateUnitsScheduleEndDate(txtUnitEnddate.Text.Trim(),txsrtdate.Text.Trim(), ID);
            BindStudentGVDetails(ViewState["SCHID"].ToString());
        }

        protected void GVUnitsForSubjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            canclingedit();
        }

        internal void canclingedit()
        {
            lblUnitsForSubjMsg.Text = string.Empty;
            GVUnitsForSubjects.EditIndex = -1;
            DataTable dt = (DataTable)ViewState["DTUnits"];
            GVUnitsForSubjects.DataSource = dt;
            GVUnitsForSubjects.DataBind();
        }

        protected void btnUpdateTrngInfo_Click(object sender, EventArgs e)
        {
            lblUnitsForSubjMsg.Text = string.Empty;
            int ID;
            for (int i = 0; i < GVUnitsForSubjects.Rows.Count; i++)
            {
                ID = Convert.ToInt32(GVUnitsForSubjects.DataKeys[i].Value.ToString());
                TextBox txtUnitEd = (TextBox)GVUnitsForSubjects.Rows[i].FindControl("txtUnitEnddate");
                TextBox txtUnitst = (TextBox)GVUnitsForSubjects.Rows[i].FindControl("txtUnitstartdate");
               
                if (txtUnitEd != null)
                {
                    cmpnyBL.UpdateUnitsScheduleEndDate(txtUnitEd.Text.Trim(),txtUnitst.Text.Trim(),ID);
                   
                }
            }
            GVUnitsForSubjects.DataSource = null;
            GVUnitsForSubjects.DataBind();
            BindStudentGVDetails(ViewState["SCHID"].ToString());
            canclingedit();
        }

    }
}