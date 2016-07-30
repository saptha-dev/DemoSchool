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
    public partial class StudentExercise : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        StudentBL objStudentBL = new StudentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;
                GetProgramName();
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
                txtCategoryStartDate.Value = dt.Rows[0]["Schedule_srt_Date"].ToString();
                txtCategoryEndDate.Value = dt.Rows[0]["Schedule_end_Date"].ToString();
                txtCategoryDuration.Value = dt.Rows[0]["Duration"].ToString();
                txtCategoryStatus.Value = dt.Rows[0]["Status"].ToString();
                txtCategoryStatusDate.Value = dt.Rows[0]["Status_date"].ToString();

            }
        }

        private void GetProgramName()
        {
            SqlDataReader dr = objStudentBL.GetProgramNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
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
            ViewState["CatId"] = (ddlCategory.SelectedValue);
            ViewState["CatName"] = ddlCategory.SelectedItem.Text;
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
            SqlDataReader dr = objStudentBL.GetSubjectsForStudent(Session["UserID"].ToString(), Convert.ToInt32(DDlYear.SelectedItem.Value));
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

        protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlUnit.SelectedValue);
            string name = ddlUnit.SelectedItem.Text;
            txt_Cat_Sub_Unit.Value = ViewState["CatId"] + ":" + ViewState["CatName"] + "/" + ViewState["SubId"] + ":" + ViewState["SubName"] + "/" + id + ":" + name;

            SqlDataReader drSubject = objStudentBL.GetStudentSubjectDetails(Convert.ToInt32(ddlSubjects.SelectedValue));
            DataTable dtSubject = new DataTable();
            dtSubject.Load(drSubject);
            if (dtSubject.Rows.Count > 0)
            {
                txtSubjectName.Value = dtSubject.Rows[0]["Subject_Id"].ToString() + ":" + dtSubject.Rows[0]["Subject_Name"].ToString();
                txtSubjectContentType.Value = ddlSubjects.SelectedItem.Text;
                txtSubjectStartDate.Value = dtSubject.Rows[0]["Subject_Start_Date"].ToString();
                txtSubjectEndDate.Value = dtSubject.Rows[0]["Subject_End_Date"].ToString();
                txtSubjectDuration.Value = dtSubject.Rows[0]["Subject_Duration"].ToString();
                txtSubjectStatus.Value = dtSubject.Rows[0]["Subject_Status"].ToString();
                txtSubjectStatusDate.Value = dtSubject.Rows[0]["Subject_Status_Date"].ToString();
            }


            CategoryDetails();
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSubjects.SelectedItem.Text != "--Select--")
            {
                SqlDataReader dr = objStudentBL.GetUnitsForSubject(Convert.ToInt32(ddlSubjects.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlUnit.DataSource = dt;
                    ddlUnit.DataValueField = "Unit_Id";
                    ddlUnit.DataTextField = "Unit_Name";
                    ddlUnit.DataBind();
                    ddlUnit.Items.Insert(0, new ListItem("---Select---", "0")); 
                }
                ViewState["SubId"] = ddlSubjects.SelectedValue;
                ViewState["SubName"] = ddlSubjects.SelectedItem.Text;
               
            }
            else
            {
                ddlSubjects.Items.Clear();
            }
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            pnlExercise.Visible = true;
            btnExerciseExit.Visible = true;
            btnExerciseNext.Visible = true;
            btnExerciseRealAns.Visible = true;

            btnStart.Visible = false;
            SqlDataReader dr = objStudentBL.GetExerciseQstns(Convert.ToInt32(ddlUnit.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ViewState["Qstns"] = dt;
                txtExerciseQstn.Value = dt.Rows[0][0].ToString();
                lblOptA.Text = dt.Rows[0][1].ToString();
                lblOptB.Text = dt.Rows[0][2].ToString();
                lblOptC.Text = dt.Rows[0][3].ToString();
                lblOptD.Text = dt.Rows[0][4].ToString();
                lblOptE.Text = dt.Rows[0][5].ToString();


            }
        }

        protected void btnExerciseSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnExerciseRealAns_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            int Answer = Convert.ToInt32(dt.Rows[RowID][6].ToString());
            lblRealAnswer.Text = dt.Rows[RowID][Answer].ToString();
        }

        protected void btnExerciseNext_Click(object sender, EventArgs e)
        {
            lblRealAnswer.Text = "";
            lblResultCorrect.Visible = false;
            lblResultWrong.Visible = false;
            lblStudentAnswer.Text = "";

            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            RowID++;
            if (dt.Rows.Count > RowID)
            {
                
                txtExerciseQstn.Value = dt.Rows[RowID][0].ToString();
                lblOptA.Text = dt.Rows[RowID][1].ToString();
                lblOptB.Text = dt.Rows[RowID][2].ToString();
                lblOptC.Text = dt.Rows[RowID][3].ToString();
                lblOptD.Text = dt.Rows[RowID][4].ToString();
                lblOptE.Text = dt.Rows[RowID][5].ToString();

                ViewState["RowID"] = RowID;
            }
        }

        protected void btnExerciseExit_Click(object sender, EventArgs e)
        {
            pnlExercise.Visible = false;
            btnExerciseExit.Visible = false;
            btnExerciseNext.Visible = false;
            btnExerciseRealAns.Visible = false;
            btnStart.Visible = true;
        }

        protected void li_OptionA_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            string Answer = dt.Rows[RowID][6].ToString();
            lblStudentAnswer.Text = dt.Rows[RowID][1].ToString();
            if (Answer == "1")
            {
                lblResultCorrect.Visible = true;
                lblResultWrong.Visible = false;
            }
            else
            {
                lblResultCorrect.Visible = false;
                lblResultWrong.Visible = true;
            }
        }

        protected void li_OptionB_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            lblStudentAnswer.Text = dt.Rows[RowID][2].ToString();
            string Answer = dt.Rows[RowID][6].ToString();
            if (Answer == "2")
            {
                lblResultCorrect.Visible = true;
                lblResultWrong.Visible = false;
            }
            else
            {
                lblResultCorrect.Visible = false;
                lblResultWrong.Visible = true;
            }
        }

        protected void li_OptionC_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            lblStudentAnswer.Text = dt.Rows[RowID][3].ToString();
            string Answer = dt.Rows[RowID][6].ToString();
            if (Answer == "3")
            {
                lblResultCorrect.Visible = true;
                lblResultWrong.Visible = false;
            }
            else
            {
                lblResultCorrect.Visible = false;
                lblResultWrong.Visible = true;
            }
        }

        protected void li_OptionD_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            lblStudentAnswer.Text = dt.Rows[RowID][4].ToString();
            string Answer = dt.Rows[RowID][6].ToString();
            if (Answer == "4")
            {
                lblResultCorrect.Visible = true;
                lblResultWrong.Visible = false;
            }
            else
            {
                lblResultCorrect.Visible = false;
                lblResultWrong.Visible = true;
            }
        }

        protected void li_OptionE_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Qstns"];
            int RowID = Convert.ToInt32(ViewState["RowID"]);
            lblStudentAnswer.Text = dt.Rows[RowID][5].ToString();
            string Answer = dt.Rows[RowID][6].ToString();
            if (Answer == "5")
            {
                lblResultCorrect.Visible = true;
                lblResultWrong.Visible = false;
            }
            else
            {
                lblResultCorrect.Visible = false;
                lblResultWrong.Visible = true;
            }
        }
        
    }
}