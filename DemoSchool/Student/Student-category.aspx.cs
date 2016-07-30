using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BAL.BL;

namespace PresentationLayer.Student  
{
    public partial class Student_category : System.Web.UI.Page
    {
        RegistrationBL objRegistrationBL = new RegistrationBL();
        StudentBL objStudentBL = new StudentBL();
        AddProgramsBL objBL = new AddProgramsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Label lblMasterStudentId = (Label)Master.FindControl("lblMasterStudentId");
                lblMasterStudentId.Text = "1";// Session["DetailsID"].ToString();

                Label lblMasterUserId = (Label)this.Master.FindControl("lblMasterUserId");
                lblMasterUserId.Text = "Ramesh";// Session["UserID"].ToString();

                Label Label3 = (Label)this.Master.FindControl("Label3");
                Label3.Text = "User Id";

                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;

                GetProgramName();             
                addNewPogram();
              
            }
        }


        private void GetProgramName()
        {
            SqlDataReader dr = objStudentBL.GetProgramNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count >0)
            {
                DDLProgram.DataSource = dt;
                DDLProgram.DataValueField = "Program_id";
                DDLProgram.DataTextField = "Program_name";
                DDLProgram.DataBind();
                DDLProgram.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        private void GetCategoryNameForStudent()
        {
            SqlDataReader dr = objStudentBL.GetCategoryNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        private void GetGroupNameForStudent()
        {
            SqlDataReader dr = objStudentBL.GetGroupNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {

                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        protected void DDLProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCategoryNameForStudent();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetGroupNameForStudent();
        }

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlGroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DDlYear.DataSource = dt;
                DDlYear.DataValueField = "Year_Id";
                DDlYear.DataTextField = "Branch_Year_No";
                DDlYear.DataBind();
                DDlYear.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void DDlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStudentBL.GetSubjectsForStudent(Session["UserID"].ToString(),Convert.ToInt32(DDlYear.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjects.DataSource = dt;
                ddlSubjects.DataValueField = "Subject_Id";
                ddlSubjects.DataTextField = "Subject_Name";
                ddlSubjects.DataBind();
                ddlSubjects.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue);
            SqlDataReader dr = objStudentBL.GetSubjectScheduleDetails(SubjectID, Session["UserID"].ToString(), Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                // txtSubjectCategoryName.Value = dt.Rows[0][""].ToString();
                txtSubjectName.Value = dt.Rows[0]["Subject_Id"].ToString() + ":" + dt.Rows[0]["Subject_Name"].ToString();
                txtSubjectREGDate.Value = dt.Rows[0]["Subject_RegDate"].ToString();
                txtSubjectStatusDate.Value = dt.Rows[0]["Subject_Status_Date"].ToString();
                txtSubjectTRNGType.Value = "On-Line"; //dt.Rows[0][""].ToString();
                // txtSubjectCMPYName.Value = dt.Rows[0][""].ToString();
                txtSubjectUnitsCount.Value = dt.Rows[0]["Subject_T_Units"].ToString();
                txtSubjectSCHDuration.Value = dt.Rows[0]["Duration"].ToString();
                txtSubjectSCHStartDate.Value = dt.Rows[0]["Schedule_srt_Date"].ToString();
                txtSubjectSCHEndDate.Value = dt.Rows[0]["Schedule_end_Date"].ToString();
                txtSubjectSCHStatus.Value = dt.Rows[0]["Status"].ToString();
                txtSubjectSCHStatusDate.Value = dt.Rows[0]["Status_date"].ToString();
                txtSubjectSCHRemarks.Value = dt.Rows[0]["Remarks"].ToString();

                BindStudentDetails();
                BindCategoryGV();
                CategoryDetails();
                BindSubjectScheduleInfo();
            }
        }
      
        private void BindStudentDetails()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objStudentBL.GetStudentDetails(StudentID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtStudentID.Value = dt.Rows[0]["DetailsID"].ToString();
                txtStudentName.Value = dt.Rows[0]["FirstName"].ToString() + " " + dt.Rows[0]["LastName"].ToString();
                txtStudentLocation.Value = dt.Rows[0]["LocationID"].ToString();
                txtStudentStatus.Value = dt.Rows[0]["Status"].ToString();
                txtStudentStatusDate.Value = dt.Rows[0]["StatusDate"].ToString();
            }
        }

        private void CategoryDetails()
        {
            SqlDataReader dr = objStudentBL.GetCategoryScheduleDetails(Convert.ToInt32(ddlCategory.SelectedItem.Value), Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtCategoryName.Value = dt.Rows[0]["Category_Id"].ToString() + ":" + dt.Rows[0]["Category_Name"].ToString();
                txtCategoryRegDate.Value = dt.Rows[0]["Category_Reg_Date"].ToString();
                txtSCHStartTime.Value = dt.Rows[0]["Schedule_srt_Date"].ToString();
                txtSCHEndTime.Value = dt.Rows[0]["Schedule_end_Date"].ToString();
                txtSCHDuration.Value = dt.Rows[0]["Duration"].ToString();
                txtSCHStatus.Value = dt.Rows[0]["Status"].ToString() + ":" + dt.Rows[0]["Status_date"].ToString();
                txtSubjectCategoryName.Value = dt.Rows[0]["Category_Id"].ToString() + ":" + dt.Rows[0]["Category_Name"].ToString();

                txtCategoryGROUP.Value = ddlGroup.SelectedItem.Text + ":" + DDlYear.SelectedItem.Text;
                SqlDataReader dr1 = objStudentBL.GetSubjectsCountForCategory(Convert.ToInt32(ddlGroup.SelectedItem.Value));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    txtCategorySubjectsCount.Value=dt1.Rows[0][0].ToString();
                }

            }
        }

        private void BindCategoryGV()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objStudentBL.GetCategoryScheduleDetails(Convert.ToInt32(ddlCategory.SelectedItem.Value), Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                System.Data.DataColumn ClmBranchYear = new System.Data.DataColumn("BranchYear", typeof(System.String));
                ClmBranchYear.DefaultValue = ddlGroup.SelectedItem.Text;
                dt.Columns.Add(ClmBranchYear);
                GVCategorys.DataSource = dt;
                GVCategorys.DataBind();
            }
        }

        private void BindSubjectScheduleInfo()
        {
            SqlDataReader dr = objStudentBL.GetSubjectScheduleInfo(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), Session["UserID"].ToString(), Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                System.Data.DataColumn Subject = new System.Data.DataColumn("SubjectName", typeof(System.String));
                Subject.DefaultValue = ddlSubjects.SelectedItem.Text.Trim();
                dt.Columns.Add(Subject);
                GVSubjectSchedule.DataSource = dt;
                GVSubjectSchedule.DataBind();
            }
        }

        #region AddCategory

        public void addNewPogram()
        {
            SqlDataReader dr = objRegistrationBL.GetProgram();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddladdProgram.DataSource = dt;
            ddladdProgram.DataTextField = "Program_name";
            ddladdProgram.DataValueField = "Program_id";
            ddladdProgram.DataBind();
            // ddlProgram.Items.Insert(0, "--Select--");
            ddladdProgram.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void ddladdProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            int programId = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
            if (programId != 0)
            {
                SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddladdCategory.DataSource = dt;
                    ddladdCategory.DataValueField = "Category_Id";
                    ddladdCategory.DataTextField = "Category_Name";
                    ddladdCategory.DataBind();
                    ddladdCategory.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            else
            {
                ddladdCategory.Items.Clear();
                ddladdGroup.Items.Clear();
                ddladdsemister.Items.Clear();
            }
        }

        protected void addProgramBtn_Click(object sender, EventArgs e)
        {
            string UserID = "ramesh";
            int ProgramId = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
            int CategoryId = Convert.ToInt32(ddladdCategory.SelectedValue);
            int GroupId = Convert.ToInt32(ddladdGroup.SelectedValue);
            string Year = ddladdsemister.SelectedItem.Text;
            string conn = ConfigurationManager.ConnectionStrings["Database"].ConnectionString;
            string Query = "insert into tbl_StudentRegPrograms(UserID,ProgramID,CategoryID,BranchID,SemId,ActiveStatus)values('" + UserID + "'," + ProgramId + "," + CategoryId + "," + GroupId + ",'" + Year + "',0)";
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand(Query, con);
            int getvalue = cmd.ExecuteNonQuery();
            con.Close();
            if (getvalue == 1)
            {
                ddladdProgram.SelectedIndex = -1;
                ddladdCategory.Items.Clear();
                ddladdGroup.Items.Clear();
                ddladdsemister.Items.Clear();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Anyname", "showPopup();", true);
            }
            else
            {

            }

        }

        public void ddladdCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddladdCategory.SelectedValue != "0")
            {
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddladdCategory.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddladdGroup.DataSource = dt;
                    ddladdGroup.DataValueField = "Branch_Id";
                    ddladdGroup.DataTextField = "Branch_Name";
                    ddladdGroup.DataBind();
                    ddladdGroup.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
            else
            {
                ddladdGroup.Items.Clear();
                ddladdsemister.Items.Clear();
            }
        }

        public void ddladdGroup_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddladdGroup.SelectedValue != "0")
            {
                SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddladdGroup.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddladdsemister.DataSource = dt;
                    ddladdsemister.DataValueField = "Year_Id";
                    ddladdsemister.DataTextField = "Branch_Year_No";
                    ddladdsemister.DataBind();
                    ddladdsemister.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }

            else
            {
                ddladdsemister.Items.Clear();

            }
        }

        #endregion AddCategory

        protected void chkchild_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GVCategorys.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                    }
                }
            }
        }

        protected void GVCategorys_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GVCategorys.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                    }
                }
            }
        }

    }
}