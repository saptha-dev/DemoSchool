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
    public partial class ACMP_RT_report : System.Web.UI.Page
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
            SqlDataReader dr = cmpnyBL.GetSubjects(Convert.ToInt32(ddlProgram.SelectedValue),Convert.ToInt32(ddlCategory.SelectedValue));
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
            GVQstns.DataSource = null;
            GVQstns.DataBind();
            BindStudentBooking();
            BindStudentQstnsToGV();
            //GetRealtestlist();

        }


       
        private void BindStudentBooking()
        {

            SqlDataReader dr1 = cmpnyBL.Geacmprtlist();
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                //lblRTAnsQstns.Text = dt1.Rows[0]["Std_Attempted_Qstns"].ToString();
                //lblRTBkngDate.Text = Convert.ToDateTime(dt1.Rows[0]["BookingDate"]).ToShortDateString();
                //lblRTBkngID.Text = dt1.Rows[0]["S_No"].ToString();
                //lblRTBkngSSN.Text = dt1.Rows[0]["BookingSession"].ToString();
                //lblRTBkngTime.Text = Convert.ToDateTime(dt1.Rows[0]["BookingTime"]).ToShortTimeString();
                //lblRTBnkgSlot.Text = dt1.Rows[0]["Slot_ID"].ToString();
                //lblRTID.Text = dt1.Rows[0]["Result_ID"].ToString();
                //lblRTInCorrectAns.Text = dt1.Rows[0]["Std_Wrong_Ans"].ToString();
                //lblRTCorrectAns.Text = dt1.Rows[0]["Std_Correct_Ans"].ToString();
                //lblRTStatusDate.Text = Convert.ToDateTime(dt1.Rows[0]["StatusDate"]).ToShortDateString();
                //lblRTUnAnsQstns.Text = dt1.Rows[0]["Std_Un_Attempted_Qstns"].ToString();
                //lblRTID.Text = dt1.Rows[0]["S_No"].ToString();
                //lblrtdate.Text = dt1.Rows[0]["ExamDate"].ToString();
                int rtid =Convert.ToInt32(dt1.Rows[0]["Set_Id"].ToString());
                ViewState["Rtid"] = rtid;
                //lblrtstID.Text = rtid.ToString();
                //lblslotsession.Text = dt1.Rows[0]["BookingSession"].ToString();
                //lblCategoryDetails.Text = ddlCategory.SelectedItem.ToString() + ddlGroup.SelectedItem.ToString() +ddlSubject.SelectedItem.ToString();
                GrdRtreport.DataSource = dt1;
                GrdRtreport.DataBind();
               
            }
           
        }

        private void BindStudentQstnsToGV()
        {
            int rid = Convert.ToInt32(ViewState["Rtid"]);
            SqlDataReader dr = cmpnyBL.GetQstnsForStudent(rid);
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


        protected void btnprint_Click(object sender, EventArgs e)
        {
            view.Visible = true;
            Button btn = (Button)sender;
            GridViewRow gvrow = (GridViewRow)btn.NamingContainer;
            if (gvrow != null)
            {
                Label lbl = (Label)gvrow.FindControl("ID");
                string Lid = lbl.Text;
                HiddenField hdhid = (HiddenField)gvrow.FindControl("hdnid");
                string Id = hdhid.Value;
                GetRealtestlist(Id);
            }
        }
        private void GetRealtestlist(string studentID)
        {

            SqlDataReader dr = cmpnyBL.Getrtasdetails(studentID,Convert.ToInt32(ddlSubject.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblRTID.Text = dt.Rows[0]["RTId"].ToString();
                DateTime dst=Convert.ToDateTime(dt.Rows[0]["BookingDate"]);
                lblrtdate.Text = dst.ToString("dd-MM-yyyy");
                lblRTBnkgSlot.Text = dt.Rows[0]["slotname"].ToString();
                lblRTBkngSSN.Text = dt.Rows[0]["BookingSession"].ToString();
                lblRTBkngTime.Text = Convert.ToDateTime(dt.Rows[0]["BookingTime"]).ToShortTimeString();
                lblRTAnsQstns.Text = dt.Rows[0]["Std_Attempted_Qstns"].ToString();
                int a = Convert.ToInt32(lblRTAnsQstns.Text);
                lblRTUnAnsQstns.Text = dt.Rows[0]["Std_Un_Attempted_Qstns"].ToString();
                int b = Convert.ToInt32(lblRTUnAnsQstns.Text);
                lblRTInCorrectAns.Text = dt.Rows[0]["Std_Wrong_Ans"].ToString();
                lblRTCorrectAns.Text = dt.Rows[0]["Std_Correct_Ans"].ToString();
                DateTime dtn = Convert.ToDateTime(dt.Rows[0]["StatusDate"]);
                lblRTStatusDate.Text = dtn.ToString("dd-MM-yyyy");
                lblRTBnkgSlot.Text = dt.Rows[0]["Slot_ID"].ToString();
                DateTime dtm = Convert.ToDateTime(dt.Rows[0]["ExamDate"]);
                lblrtdate.Text = dtm.ToString("dd-MM-yyyy");
                lblStudentName.Text = dt.Rows[0]["studIdname"].ToString();
                lblCategoryDetails.Text = ddlCategory.SelectedItem.ToString()+":"+ ddlGroup.SelectedItem.ToString()+":"+ ddlSubject.SelectedItem.ToString();
                lblslotsession.Text = dt.Rows[0]["BookingSession"].ToString();
                DateTime dts = Convert.ToDateTime(dt.Rows[0]["BookingDate"]);
                lblRTBkngDate.Text = dts.ToString("dd-MM-yyyy");
                lblRTBkngID.Text = dt.Rows[0]["S_No"].ToString();
                lblACMPIDName.Text = dt.Rows[0]["Cmpnyname"].ToString();
                lbltotqns.Text =Convert.ToInt32(a + b).ToString();
                lblACMPName.Text = dt.Rows[0]["branchname"].ToString();
                lblrtstID.Text = lblRTBkngID.Text;
            }
        }

        //protected void GrdRtreport_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}


    }
}