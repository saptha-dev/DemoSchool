using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;

namespace PresentationLayer.Student
{
    public partial class StudentSubjects : System.Web.UI.Page
    {
        StudentBL objStudentBL = new StudentBL();
        AddProgramsBL objBL = new AddProgramsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;
                GetProgramName();
               
               
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

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue);
            SqlDataReader drSubject = objStudentBL.GetSubjectScheduleDetails(SubjectID, Session["UserID"].ToString(),Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dtSubject = new DataTable();
            dtSubject.Load(drSubject);
            if (dtSubject.Rows.Count > 0)
            {
                txtSubjectName.Value = dtSubject.Rows[0]["Subject_Id"].ToString() + ":" + dtSubject.Rows[0]["Subject_Name"].ToString();
                txtSubjectREGDate.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();
                txtSubjectStatusDate.Value = dtSubject.Rows[0]["Subject_Status_Date"].ToString();
                txtSubjectUnitsCount.Value = dtSubject.Rows[0]["Subject_T_Units"].ToString();
                txtSCHSubjectDuration.Value = dtSubject.Rows[0]["Duration"].ToString();
                txtSCHSubjectStartDate.Value = dtSubject.Rows[0]["Schedule_srt_Date"].ToString();
                txtSCHSubjectStatus.Value = dtSubject.Rows[0]["Status"].ToString();
                txtSCHSubjectStatusDate.Value = dtSubject.Rows[0]["Status_date"].ToString();
                txtSCHSubjectRemarks.Value = dtSubject.Rows[0]["Remarks"].ToString();

                


                txtTrainingStartDate.Value = dtSubject.Rows[0]["Subject_Start_Date"].ToString();
                txtTrainingEndDate.Value = dtSubject.Rows[0]["Subject_End_Date"].ToString();
                txtTrainingDuration.Value = dtSubject.Rows[0]["Duration"].ToString();
                txtTrainingType.Value = "On-Line";  // dtSubject.Rows[0]["Subject_RegDate"].ToString();
                //  txtTrainingACMP.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();
                txtTrainingStartTime.Value = dtSubject.Rows[0]["Schedule_srt_Date"].ToString();
                txtTrainingEndTime.Value = dtSubject.Rows[0]["Schedule_end_Date"].ToString();
                txtTrainingHours.Value = dtSubject.Rows[0]["Subject_Duration"].ToString();
                txtTrainingFaculty.Value = dtSubject.Rows[0]["Faculty"].ToString();
                txtTrainingStatus.Value = dtSubject.Rows[0]["Status"].ToString();
                txtTrainingStatusDate.Value = dtSubject.Rows[0]["Status_date"].ToString();
                //  txtTrainingCRTID.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();
                //  txtTrainingCRTDate.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();
                //  txtTrainingCRTStatus.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();
                //  txtTrainingRemarks.Value = dtSubject.Rows[0]["Subject_RegDate"].ToString();

            }
            BingUnitsGV();
            BindResultGV();
            CategoryDetails();
            BindStudentDetails();
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
                txtSCHCategoryStartTime.Value = dt.Rows[0]["Schedule_srt_Date"].ToString();
                txtSCHCategoryEndTime.Value = dt.Rows[0]["Schedule_end_Date"].ToString();
                txtSCHCategoryDuration.Value = dt.Rows[0]["Duration"].ToString();
                txtSCHCategoryStatus.Value = dt.Rows[0]["Status"].ToString() + ":" + dt.Rows[0]["Status_date"].ToString();
                //txtSubjectCategoryName.Value = dt.Rows[0]["Category_Id"].ToString() + ":" + dt.Rows[0]["Category_Name"].ToString();

                txtCategoryGROUP.Value = ddlGroup.SelectedItem.Text + ":" + DDlYear.SelectedItem.Text;
                SqlDataReader dr1 = objStudentBL.GetSubjectsCountForCategory(Convert.ToInt32(ddlGroup.SelectedItem.Value));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    txtCategorySubjectsCount.Value = dt1.Rows[0][0].ToString();
                }
            }
        }

        private void BingUnitsGV()
        {
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue);
            SqlDataReader drSubject = objStudentBL.GetUnitsForSubject(SubjectID);
            DataTable dtSubject = new DataTable();
            dtSubject.Load(drSubject);
            if (dtSubject.Rows.Count > 0)
            {
                GVUnits.DataSource = dtSubject;
                GVUnits.DataBind();
            }
        }

        private void BindResultGV()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue);
            SqlDataReader drResult = objStudentBL.GetResultInformationForStudent(SubjectID, StudentID);
            DataTable dtResult = new DataTable();
            dtResult.Load(drResult);
            if (dtResult.Rows.Count > 0)
            {

                txtAssesmentBKID.Value = dtResult.Rows[0]["S_No"].ToString();
                txtAssesmentBKDate.Value = dtResult.Rows[0]["BookingDate"].ToString();
                txtAssesmentSSNTime.Value = dtResult.Rows[0]["Slot_ID"].ToString();
                txtAssesmentStatus.Value = dtResult.Rows[0]["Status"].ToString();
                txtAssesmentRTDate.Value = dtResult.Rows[0]["BookingTime"].ToString();
                // txtAssesmentCompany.Value = dtResult.Rows[0][""].ToString();
                txtAssesmentRTQstns.Value = dtResult.Rows[0]["Total_Qstns"].ToString();
                txtAssesmentAnsQstns.Value = dtResult.Rows[0]["Std_Attempted_Qstns"].ToString();
                txtAssesmentUnAnsQstns.Value = dtResult.Rows[0]["Std_Un_Attempted_Qstns"].ToString();
                txtAssesmentCorrectAns.Value = dtResult.Rows[0]["Std_Correct_Ans"].ToString();
                txtAssesmentInCorrectAns.Value = dtResult.Rows[0]["Std_Wrong_Ans"].ToString();
                txtAssesmentResult.Value = dtResult.Rows[0]["Std_Result"].ToString();
                txtAssesmentResultStatusDate.Value = dtResult.Rows[0]["Publish_StatusDate"].ToString();
                txtAssesmentRemarks.Value = dtResult.Rows[0]["Remarks"].ToString();

            }
        }

       


    }
}