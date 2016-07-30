using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using System.Drawing;

namespace PresentationLayer.ACMP
{
    public partial class ACMP_trg_report : System.Web.UI.Page
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
            GvTrngStudents.DataSource = null;
            GVUnitsForSubjects.DataBind();
            lblmesg.Text = string.Empty;
            lblMsg.Text = string.Empty;
            GetCompanyDetails();
            BindCategoryDetails();
            GetGroupDetails();
            GetSubjectTrngDetails();
            BindStudentsGV();
        }

        private void GetCompanyDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCompanyDetails(ddlBranch.SelectedValue);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblACMPLoc.Text = dt.Rows[0]["BranchLocation"].ToString() + ":" + dt.Rows[0]["BranchOffice"].ToString();
                lblACMPName.Text = dt.Rows[0]["CompanyId"].ToString() + ":" + dt.Rows[0]["CompanyName"].ToString();
                lblACMPPName.Text = dt.Rows[0]["Name"].ToString();
                //txtACMPPName.Text = dt.Rows[0][""].ToString();
                lblACMPStatus.Text = dt.Rows[0]["BranchStatus"].ToString();
                // txtACMPAddress.Text = dt.Rows[0][""].ToString();
                // txtACMPCNTCTPerson.Text = dt.Rows[0][""].ToString();
                //lblACMPIDName.Text = dt.Rows[0]["BranchName"].ToString();
                //lblACMPHLOC.Text = dt.Rows[0]["BranchLocation"].ToString();
                // txtACMPPName.Text = dt.Rows[0][""].ToString();
            }

        }
        private void BindCategoryDetails()
        {
            SqlDataReader dr =cmpnyBL.GetCategoryDetails(Convert.ToInt32(ddlCategory.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
               DateTime dm = Convert.ToDateTime(dt.Rows[0]["Category_End_Date"]);
               lblCtgryEndDate.Text = dm.ToString("dd-MM-yyyy");
               string Id = dt.Rows[0]["Category_Id"].ToString();
                lblCtgryName.Text =Id+":"+ dt.Rows[0]["Category_Name"].ToString();
                DateTime ds = Convert.ToDateTime(dt.Rows[0]["Category_Srt_Date"]);
                lblCtgryStartDate.Text = ds.ToString("dd-MM-yyyy");
                lblCtgryStatus.Text = dt.Rows[0]["Category_Status"].ToString();

                lblCtgryGroup.Text = ddlGroup.SelectedItem.Text;
                lblCtgryYearSem.Text = dt.Rows[0]["Category_Year"].ToString();
                //lblCtgryYearSem.Text = DDlYear.SelectedItem.Text;

            }

        }

        private void GetGroupDetails()
        {
            SqlDataReader dr = cmpnyBL.GetGroupDetails(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dn= Convert.ToDateTime(dt.Rows[0]["Branch_End_Date"]);
                lblCtgryGrpEndDate.Text = dn.ToString("dd-MM-yyyy");
                DateTime ds= Convert.ToDateTime(dt.Rows[0]["Branch_Srt_Date"]);
                lblCtgryGrpStartDate.Text = ds.ToString("dd-MM-yyyy");
                lblCtgryGrpStatus.Text = dt.Rows[0]["Branch_Status"].ToString();
                
            }
        }

        private void GetSubjectTrngDetails()
        {
            lblMsg.Text = string.Empty;
            SqlDataReader dr = cmpnyBL.GetSubjectSchedule(Convert.ToInt32(ddlGroup.SelectedValue.Trim()), Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);


            if (dt.Rows.Count > 0)
            {
                DateTime dn = Convert.ToDateTime(dt.Rows[0]["Schedule_srt_Date"]);
                lblSubTrgStartDate.Text = dn.ToString("dd-MM-yyyy");
                DateTime dm = Convert.ToDateTime(dt.Rows[0]["Schedule_end_Date"]);
                lblSubTrgEndDate.Text = dm.ToString("dd-MM-yyyy");
                string Sid = dt.Rows[0]["Subject_Id"].ToString();
                lblSubTrgDuration.Text = dt.Rows[0]["Duration"].ToString();

                SqlDataReader dr1 = cmpnyBL.GetClassScheduleDetails(dt.Rows[0]["Subject_ScheduleID"].ToString());
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    lblSubFaculty.Text = dt1.Rows[0]["Faculty"].ToString();
                    lblSubTrngStatus.Text = dt1.Rows[0]["status"].ToString();
                     DateTime dl = Convert.ToDateTime(dt1.Rows[0]["StatusDate"]);
                     lblSubStatusDate.Text = dl.ToString("dd-MM-yyyy");
                    lblSubTrngType.Text = dt1.Rows[0]["ClassType"].ToString();
                }
                SqlDataReader dr2 = cmpnyBL.GetScheduleTotalStudents(dt.Rows[0]["Schedule_ID"].ToString());
                DataTable dt2 = new DataTable();
                dt2.Load(dr2);
                if (dt2.Rows.Count > 0)
                {
                    lblSubName.Text = Sid + ":" + ddlSubject.SelectedItem.Text;
                    lblSubTotStudents.Text = dt2.Rows[0][0].ToString();
                }
                SqlDataReader drUnits = cmpnyBL.GetTotUnitsCount(Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
                DataTable dtUnits = new DataTable();
                dtUnits.Load(drUnits);
                if (dtUnits.Rows.Count > 0)
                {
                    lblSubTotUnits.Text = dtUnits.Rows[0][0].ToString();
                }
            }
            else
            {
                lblMsg.Text = "No Records found";
                lblMsg.ForeColor = Color.Red;

            }
        }

        protected void gvViewRecord_Click(object sender, ImageClickEventArgs e)
        {
           // pnlViewReport.Visible = true;
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                Label QId = (Label)gvrow.FindControl("ID");
                string ID = QId.Text;
                BindStudentGVDetails(ID);
            }
        }


        private void BindStudentsGV()
        {
            SqlDataReader dr3 = cmpnyBL.GetCompanyTrainingStudents("ACMPSMT001", Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt3 = new DataTable();
            dt3.Load(dr3);
            if (dt3.Rows.Count > 0)
            {
                GvTrngStudents.DataSource = dt3;
                GvTrngStudents.DataBind();
            }
            else
            {
                GvTrngStudents.DataSource = null;
                GvTrngStudents.DataBind();
                lblMsg.Text = "No Records found";
                lblMsg.ForeColor = Color.Red;

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
            }
            else
            {
                lblmesg.Text = "No Records found";
                lblmesg.ForeColor = Color.Red;
            }
        }

    }
}