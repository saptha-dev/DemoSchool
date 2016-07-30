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
    public partial class Student_results_grade : System.Web.UI.Page
    {
        StudentBL objStudentBL = new StudentBL();
        AddProgramsBL objBL = new AddProgramsBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;
                GetCategoryNameForStudent();
                
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

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetYearBasedOnCategory(Convert.ToInt32(ddlCategory.SelectedValue), Session["UserID"].ToString());
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
                ddlSubject.DataSource = dt;
                ddlSubject.DataValueField = "Subject_Id";
                ddlSubject.DataTextField = "Subject_Name";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindStudentDetails();
            CategoryDetails();
            CompanyDetailsForStudent();
            SubjectFullInfo();
            BindResultGV();
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
            }
        }

        private void CompanyDetailsForStudent()
        {
            SqlDataReader dr = objStudentBL.GetCompanyDetailsForStudent(Convert.ToInt32(ddlCategory.SelectedItem.Value), Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtCompanyCNTCTPRSN.Value = dt.Rows[0]["Name"].ToString();
                txtCompanyEmail.Value = dt.Rows[0]["EmailID"].ToString();
                txtCompanyLocation.Value = dt.Rows[0]["BranchLocation"].ToString();
                txtCompanyName.Value = dt.Rows[0]["CompanyName"].ToString();
                txtCompanyPhone.Value = dt.Rows[0]["OfficePhoneNO"].ToString();
                txtCompanyStatusDate.Value = dt.Rows[0]["Status"].ToString() + ":" + dt.Rows[0]["StatusDate"].ToString();
                txtCompanySubRB.Value = dt.Rows[0]["BranchArea"].ToString();

            }
        }

        private void SubjectFullInfo()
        {
            int SubjectID = Convert.ToInt32(ddlSubject.SelectedValue);
            SqlDataReader drSubject = objStudentBL.GetSubjectScheduleDetails(SubjectID, Session["UserID"].ToString(), Convert.ToInt32(ddlCategory.SelectedItem.Value));
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
                txtSCHSubjectEndDate.Value = dtSubject.Rows[0]["Schedule_end_Date"].ToString();
                txtSCHSubjectStatusDate.Value = dtSubject.Rows[0]["Status_date"].ToString();
                txtSCHSubjectRemarks.Value = dtSubject.Rows[0]["Remarks"].ToString();
            }
        }

        private void BindResultGV()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            int SubjectID = Convert.ToInt32(ddlSubject.SelectedValue);
            SqlDataReader drResult = objStudentBL.GetResultInformationForStudentWithACMP(SubjectID, StudentID);
            DataTable dtResult = new DataTable();
            dtResult.Load(drResult);
            if (dtResult.Rows.Count > 0)
            {
                System.Data.DataColumn CLCatName = new System.Data.DataColumn("CategoryName", typeof(System.String));
                CLCatName.DefaultValue = ddlCategory.SelectedValue + ":" + ddlCategory.SelectedItem.Text;
                dtResult.Columns.Add(CLCatName);
                System.Data.DataColumn CLSubName = new System.Data.DataColumn("SubjectName", typeof(System.String));
                CLSubName.DefaultValue = ddlSubject.SelectedValue + ":" + ddlSubject.SelectedItem.Text;
                dtResult.Columns.Add(CLSubName);
                GVSubjectResult.DataSource = dtResult;
                GVSubjectResult.DataBind();
                
            }
        }

        
    }
}