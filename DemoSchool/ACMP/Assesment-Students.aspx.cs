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
    public partial class Assesment_Students : System.Web.UI.Page
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
            lblmsg.Text = string.Empty;
            pnlViewInfo.Visible = false;
            GetCompanyDetails();
            GetGroupDetails();
            BindCategoryDetails();
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
                lblACMPLoc.Text = dt.Rows[0]["BranchLocation"].ToString()+":"+ dt.Rows[0]["BranchOffice"].ToString();
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

            lblACMPCGS.Text = ddlCategory.SelectedItem.Text + ":" + ddlGroup.SelectedItem.Text;
            //lblACMPPrgName.Text = ddlProgram.SelectedItem.Text;
            lblACMPCtryGroup.Text =  ddlGroup.SelectedItem.Text;

        }

        private void BindCategoryDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCategoryDetails(Convert.ToInt32(ddlCategory.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dettm = Convert.ToDateTime(dt.Rows[0]["Category_End_Date"]);
                lblACMPCtgyEnddate.Text = dettm.ToString("dd-MM-yyyy");
                string Id = dt.Rows[0]["Category_Id"].ToString();
                lblACMPCTGYName.Text = Id + " : " + dt.Rows[0]["Category_Name"].ToString();
                DateTime dtm= Convert.ToDateTime(dt.Rows[0]["Category_Srt_Date"]);
                lblACMPCtgyStartDate.Text = dtm.ToString("dd-MM-yyyy");
                lblACMPCtgyStatus.Text = dt.Rows[0]["Category_Status"].ToString();
               
            }
        }

        private void GetGroupDetails()
        {
            SqlDataReader dr = cmpnyBL.GetGroupDetails(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime date = Convert.ToDateTime(dt.Rows[0]["Branch_End_Date"]);
                lblACMPCtgyGrpEndDate.Text = date.ToString("dd-MM-yyyy");
                DateTime dttm = Convert.ToDateTime(dt.Rows[0]["Branch_Srt_Date"]);
                lblACMPCtgyGrpStartDate.Text = dttm.ToString("dd-MM-yyyy");
                lblACMPCtgyGrpStatus.Text = lblACMPCtgyStatus.Text;
            }
        }

        private void GetSubjectTrngDetails()
        {
            SqlDataReader dr = cmpnyBL.GetSubjectSchedule(Convert.ToInt32(ddlGroup.SelectedValue.Trim()), Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblSubAsmntDuration.Text = dt.Rows[0]["Duration"].ToString();
                string Sid = dt.Rows[0]["Subject_Id"].ToString();
                lblSubAsmtStatus.Text = dt.Rows[0]["Status_date"].ToString();
                SqlDataReader dr1 = cmpnyBL.GetClassScheduleDetails(dt.Rows[0]["Subject_ScheduleID"].ToString());
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    lblSubTrngStatus.Text = dt.Rows[0]["status"].ToString();
                    DateTime dtm=Convert.ToDateTime(dt1.Rows[0]["StatusDate"]);
                    lblSubTrngStatusDate.Text = dtm.ToString("dd-MM-yyyy");
                    lblSubAsmntType.Text = dt1.Rows[0]["ClassType"].ToString();
                    //lblSubAsmtTime.Text = dt.Rows[0]["StartTime"].ToString();
                    lblSubAsmtStatus.Text = dt.Rows[0]["status"].ToString();
                    lblSubAsmntStatus.Text = lblSubTrngStatusDate.Text;
                }

                SqlDataReader dr2 = cmpnyBL.GetScheduleTotalStudents(dt.Rows[0]["Schedule_ID"].ToString());
                DataTable dt2 = new DataTable();
                dt2.Load(dr2);
                if (dt2.Rows.Count > 0)
                {
                    lblSubName.Text =Sid+":"+ ddlSubject.SelectedItem.Text;
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
        }

        private void BindStudentsGV()
        {

            GvTrngStudents.DataSource = null;
            GvTrngStudents.DataBind();
            SqlDataReader dr = cmpnyBL.GetCompanyTrainingStudents("ACMPSMT001", Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {

                GvTrngStudents.DataSource = dt;
                GvTrngStudents.DataBind();


            }
            else
            {
                //dt.Rows.Add(dt.NewRow());
                //GvTrngStudents.DataSource = dt;
                //GvTrngStudents.DataBind();
                //int columncount = GvTrngStudents.Rows[0].Cells.Count;
                //GvTrngStudents.Rows[0].Cells.Clear();
                //GvTrngStudents.Rows[0].Cells.Add(new TableCell());
                //GvTrngStudents.Rows[0].Cells[0].ColumnSpan = columncount;
                //GvTrngStudents.Rows[0].Cells[0].Text = "No Records Found";
                lblmsg.Text = "No Records Found";
                lblmsg.ForeColor = Color.Red;
                pnlViewInfo.Visible = false;

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
                HiddenField hdid = (HiddenField)gvrow.FindControl("hdnid");
                string Id = hdid.Value;
                string ID = QId.Text;
                BindStudentDataOnGV(ID);
                BindBookingDetails(ID);
                GetRealtestdata(Id);
                pnlViewInfo.Visible = true;
            }
        }
        private void GetRealtestdata(string ID)
        {
            SqlDataReader dr = cmpnyBL.GeRtdata(Convert.ToInt32(ID), Convert.ToInt32(ddlSubject.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblSdntBkngID.Text = dt.Rows[0]["S_No"].ToString();
                DateTime dtm = Convert.ToDateTime(dt.Rows[0]["BookingDate"]);
                lblSdntBkngDate.Text = dtm.ToString("dd-MM-yyyy");
                lblSdntBkngSlot.Text = dt.Rows[0]["Slotname"].ToString();
                //DateTime dtmm = Convert.ToDateTime(dt.Rows[0]["BookingTime"].ToString());
                //lblSdntBkngTime.Text = dtm.ToString("H:mm");
                lblSdntBkngStatus.Text = dt.Rows[0]["Status"].ToString();
                 DateTime dttm= Convert.ToDateTime(dt.Rows[0]["StatusDate"]);
                 lblSdntBkngStatusDate.Text = dttm.ToString("dd-MM-yyyy");
               // lblSdntBkngRemarks.Text = dt.Rows[0][""].ToString();
            }
        }
        private void BindStudentDataOnGV(string ID)
        {
            SqlDataReader dr = cmpnyBL.GetStudentScheduleDetails(ID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dtm = Convert.ToDateTime(dt.Rows[0]["ActivationDate"]);
                lblStudentAsgndDate.Text = dtm.ToString("dd-MM-yyyy");
                //   txtStudentAsmntDate.Text = dt.Rows[0][""].ToString();
                //   txtStudentAsmntLoc.Text = dt.Rows[0][""].ToString();
                //   txtStudentAsmntStatus.Text = dt.Rows[0][""].ToString();
                //    txtStudentAsmntStatusDate.Text = dt.Rows[0][""].ToString();
                //    txtStudentAsmntTime.Text = dt.Rows[0][""].ToString();
                 DateTime dttme = Convert.ToDateTime(dt.Rows[0]["DateOfBirth"]);
                 lblStudentDOB.Text = dttme.ToString("dd-MM-yyyy");
                lblStudentEmail.Text = dt.Rows[0]["EmailID"].ToString();
                lblStudentFName.Text = dt.Rows[0]["Father_GaurdainName"].ToString();
                //lblStudentID.Text = dt.Rows[0]["DetailsID"].ToString();
                lblStudentLocation.Text = dt.Rows[0]["LocationID"].ToString();
                lblStudentMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
                lblStudentName.Text = dt.Rows[0]["studIdname"].ToString();
                lblStudentStatus.Text = dt.Rows[0]["Status"].ToString();
                 DateTime dttm = Convert.ToDateTime(dt.Rows[0]["StatusDate"]);
                 lblStudentStatusDate.Text = dttm.ToString("dd-MM-yyyy");
                lblStudentTrgStatus.Text = dt.Rows[0]["schStatus"].ToString();
                DateTime dttim = Convert.ToDateTime(dt.Rows[0]["SchStatus_date"]);
                lblStudentTrngDtatusDate.Text = dttim.ToString("dd-MM-yyyy");
                lblStudentAsmntLoc.Text = lblACMPLoc.Text;
                lblStudentAsmntStatus.Text = lblSubAsmtStatus.Text;
                lblStudentAsmntStatusDate.Text = lblSubAsmntStatus.Text;
            }

        }

        private void BindBookingDetails(string ID)
        {
            SqlDataReader dr = cmpnyBL.GetBookingDetailsOfStudent(ID, Convert.ToInt32(ddlSubject.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblSdntBkngAcmpLoc.Text = dt.Rows[0]["Location"].ToString();
                lblSdntBkngAcmpName.Text = dt.Rows[0]["CompanyID"].ToString();
                lblSdntBkngDate.Text = dt.Rows[0]["BookingDate"].ToString();
                lblSdntBkngID.Text = dt.Rows[0]["S_No"].ToString();
                //  txtSdntBkngRemarks.Text = dt.Rows[0][""].ToString();
                lblSdntBkngSlot.Text = dt.Rows[0]["Slot_ID"].ToString();
                lblSdntBkngStatus.Text = dt.Rows[0]["Status"].ToString();
                 DateTime dttm = Convert.ToDateTime(dt.Rows[0]["StatusDate"].ToString());
                lblSdntBkngStatusDate.Text =dttm.ToString("dd-MM-yyyy");
               DateTime dtm = Convert.ToDateTime(dt.Rows[0]["BookingTime"].ToString());
               lblSdntBkngTime.Text = dtm.ToString("HH:mm");
            }
        }

        //protected void GvTrngStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    GridViewRow row = (GridViewRow)(((CheckBox)e.CommandSource).NamingContainer);
        //    CheckBox chkbx = (CheckBox)GvTrngStudents.Rows[row.RowIndex].FindControl("Chkselect");
        //    if(chkbx.Checked==true)
        //    {
        //        if (row != null)
        //        {
        //            Label QId = (Label)row.FindControl("ID");
        //            HiddenField hdid = (HiddenField)row.FindControl("hdnid");
        //            string Id = hdid.Value;
        //            string ID = QId.Text;
        //            BindStudentDataOnGV(ID);
        //            BindBookingDetails(ID);
        //            GetRealtestdata(Id);
        //            pnlViewInfo.Visible = true;
        //        }
        //    }

        //}


    }
}