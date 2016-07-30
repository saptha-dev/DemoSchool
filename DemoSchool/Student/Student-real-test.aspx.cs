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
    public partial class Student_real_test : System.Web.UI.Page
    {
        StudentBL objStdBL = new StudentBL();
         AddProgramsBL objBL = new AddProgramsBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;
                GetCategoryNameForStudent();
                BindStudentQstnsToGV();
                BindStudentBooking();
                GetCategoryNameForStudentBkng();
            }
        }

        private void GetCategoryNameForStudentBkng()
        {
            SqlDataReader dr = objStdBL.GetCategoryNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoryBkng.DataSource = dt;
                ddlCategoryBkng.DataValueField = "Category_Id";
                ddlCategoryBkng.DataTextField = "Category_Name";
                ddlCategoryBkng.DataBind();
                ddlCategoryBkng.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        protected void ddlCategoryBkng_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetSubjectbasedoncmpletedSCH(Convert.ToInt32(ddlCategoryBkng.SelectedValue), Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                  ddlSubjectBkng.DataSource = dt;
                  ddlSubjectBkng.DataValueField = "Subject_Id";
                  ddlSubjectBkng.DataTextField = "Subject_Name";
                  ddlSubjectBkng.DataBind();
                  ddlSubjectBkng.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubjectBkng_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetStudentBkngDate(Convert.ToInt32(ddlSubjectBkng.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlRTBKDate.DataSource = dt;
                ddlRTBKDate.DataValueField = "Slot_Date";
                ddlRTBKDate.DataTextField = "Slot_Date";
                ddlRTBKDate.DataBind();
                ddlRTBKDate.Items.Insert(0, new ListItem("--Select--", "0"));
            }  
        }

        protected void ddlRTBKDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetStudentBkngSlot(Convert.ToInt32(ddlSubjectBkng.SelectedValue),ddlRTBKDate.SelectedItem.Text.Trim());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlRTBKSlot.DataSource = dt;
                ddlRTBKSlot.DataValueField = "Slot_ID";
                ddlRTBKSlot.DataTextField = "Slot_Name";
                ddlRTBKSlot.DataBind();
                ddlRTBKSlot.Items.Insert(0, new ListItem("--Select--", "0"));
            }  
        }

        protected void ddlRTBKSlot_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetStudentBkngTime(Convert.ToInt32(ddlRTBKSlot.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlRTBKTime.DataSource = dt;
                ddlRTBKTime.DataValueField = "Slot_ID";
                ddlRTBKTime.DataTextField = "Slot_Time";
                ddlRTBKTime.DataBind();
                ddlRTBKTime.Items.Insert(0, new ListItem("--Select--", "0"));
            }  

        }

        protected void ddlRTBKTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetStudentBkngAcmpLocation(Convert.ToInt32(ddlRTBKTime.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlACMPLocation.DataSource = dt;
                ddlACMPLocation.DataValueField = "BranchID";
                ddlACMPLocation.DataTextField = "ACMPLoc";
                ddlACMPLocation.DataBind();
                ddlACMPLocation.Items.Insert(0, new ListItem("--Select--", "0"));
            }  
        }

        protected void ddlACMPLocation_SelectedIndexChanged(object sender, EventArgs e)
        {

        }        

        private void GetCategoryNameForStudent()
        {
            SqlDataReader dr = objStdBL.GetCategoryNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoryRpot.DataSource = dt;
                ddlCategoryRpot.DataValueField = "Category_Id";
                ddlCategoryRpot.DataTextField = "Category_Name";
                ddlCategoryRpot.DataBind();
                ddlCategoryRpot.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        protected void ddlCategoryRpot_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetYearBasedOnCategory(Convert.ToInt32(ddlCategoryRpot.SelectedValue), Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DDlYearRpot.DataSource = dt;
                DDlYearRpot.DataValueField = "Year_Id";
                DDlYearRpot.DataTextField = "Branch_Year_No";
                DDlYearRpot.DataBind();
                DDlYearRpot.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void DDlYearRpot_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStdBL.GetSubjectsForStudent(Session["UserID"].ToString(), Convert.ToInt32(DDlYearRpot.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectRpot.DataSource = dt;
                ddlSubjectRpot.DataValueField = "Subject_Id";
                ddlSubjectRpot.DataTextField = "Subject_Name";
                ddlSubjectRpot.DataBind();
                ddlSubjectRpot.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubjectRpot_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }  

        private void BindStudentBooking()
        {
            SqlDataReader dr = objStdBL.GetStudentBookingScheduleDetails(2, 3);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtRTAnsQstns.Text = dt.Rows[0]["Std_Attempted_Qstns"].ToString();
                txtRTBkngDate.Text = Convert.ToDateTime(dt.Rows[0]["BookingDate"]).ToShortDateString();
                txtRTBkngID.Text = dt.Rows[0]["S_No"].ToString();
                txtRTTotQstns.Text = dt.Rows[0]["Total_Qstns"].ToString();
                txtRTCrctAns.Text = dt.Rows[0]["Std_Correct_Ans"].ToString();
                txtRTBnkgSlot.Text = dt.Rows[0]["Slot_ID"].ToString();
             //   txtRTID.Text = dt.Rows[0]["Result_ID"].ToString();
                txtRTInCorrectAns.Text = dt.Rows[0]["Std_Wrong_Ans"].ToString();
                txtRTStatus.Text = dt.Rows[0]["Status"].ToString();
            //    txtRTStatusDate.Text = Convert.ToDateTime(dt.Rows[0]["StatusDate"]).ToShortDateString();
                txtRTUnAnsQstns.Text = dt.Rows[0]["Std_Un_Attempted_Qstns"].ToString();
            }
        }

        private void BindStudentQstnsToGV()
        {
            SqlDataReader dr = objStdBL.GetQstnsForStudent(1);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVQstns.DataSource = dt;
                GVQstns.DataBind();
                ViewState["qstns"] = dt;
            }
        }

        protected void GVQstns_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVQstns.PageIndex = e.NewPageIndex;
            DataTable dt = (DataTable)ViewState["qstns"];
            GVQstns.DataSource = dt;
            GVQstns.DataBind();
        }

        protected void btnbook_Click(object sender, EventArgs e)
        {
            objStdBL.InsertStudentBkng(Convert.ToInt32(Session["DetailsID"].ToString()), Session["UserID"].ToString(), Convert.ToInt32(ddlSubjectBkng.SelectedValue), Convert.ToInt32(ddlRTBKSlot.SelectedValue), ddlACMPLocation.SelectedItem.Value);
        }
    }
}