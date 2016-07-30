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
    public partial class ACMP_trg_student : System.Web.UI.Page
    {
        CompanyBL cmpnyBL = new CompanyBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyProgram();
            }
        }

        public void LoadCompanyProgram()
        {
            SqlDataReader dr = cmpnyBL.GetBranchByCompany("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlbranch.DataSource = dt;
                ddlbranch.DataValueField = "BranchID";
                ddlbranch.DataTextField = "BranchName";
                ddlbranch.DataBind();
                ddlbranch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlbranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpnyBL.GetBranchProgram(ddlbranch.SelectedValue.Trim());
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
        protected void ddlProgram_SelectedIndexChanged1(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpnyBL.GetBranchCategorybyProgram(ddlbranch.SelectedValue.Trim(), Convert.ToInt32(ddlProgram.SelectedValue));
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
            SqlDataReader dr = cmpnyBL.GetBranchGroupByCategory(ddlbranch.SelectedValue.Trim(), Convert.ToInt32(ddlCategory.SelectedValue));
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

        protected void ddlGroup_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ddlSubject.SelectedIndex = -1;
            ddlSubject.DataSource = null;
            ddlSubject.DataBind();
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

        protected void ddlSubject_SelectedIndexChanged1(object sender, EventArgs e)
        {
            clear();
            GetCompanyDetails();
            GetCategoryDetails();
            GetGroupDetails();
            GetSubjectTrngDetails();
        }


       
        private void GetCategoryDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCategoryDetails(Convert.ToInt32(ddlCategory.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblCategoryDuration.Text = dt.Rows[0]["Category_Duration"].ToString();
                DateTime dtm= Convert.ToDateTime(dt.Rows[0]["Category_End_Date"]);
                lblCategoryEndDate.Text = dtm.ToString("dd-MM-yyyy");
                string Id = dt.Rows[0]["Category_Id"].ToString();
                lblCategoryName.Text =Id+":"+ dt.Rows[0]["Category_Name"].ToString();
                DateTime dtme = Convert.ToDateTime(dt.Rows[0]["Category_Srt_Date"]);
                lblCategoryStartDate.Text = dtme.ToString("dd-MM-yyyy");
                lblCategoryStatus.Text = dt.Rows[0]["Category_Status"].ToString();
               DateTime dtim =  Convert.ToDateTime(dt.Rows[0]["Category_Status_Date"]);
               lblCategoryStatusDate.Text = dtim.ToString("dd-MM-yyyy");
                lblGroupYear.Text = dt.Rows[0]["Category_Year"].ToString();
              
                // txtCategorySubjects.Text = dt.Rows[0][""].ToString();
            }
        }

        private void GetCompanyDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCompanyDetails(ddlbranch.SelectedValue);
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
        private void GetGroupDetails()
        {
            SqlDataReader dr = cmpnyBL.GetGroupDetails(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dtm= Convert.ToDateTime(dt.Rows[0]["Branch_End_Date"]);
                lblGroupEndDate.Text = dtm.ToString("dd-MM-yyyy");
                DateTime dtme = Convert.ToDateTime(dt.Rows[0]["Branch_Srt_Date"]);
                lblGroupStartDate.Text = dtme.ToString("dd-MM-yyyy");
                lblGroupStatus.Text = lblCategoryStatus.Text;
                lblGroupStatusDate.Text = lblCategoryStatusDate.Text;
                 //lblGroupYear.Text = dt.Rows[0]["[Branch_T_Years]"].ToString();;
            }
            SqlDataReader dr1 = cmpnyBL.GetTotSubjectsCount(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                lblCategorySubjects.Text = dt1.Rows[0][0].ToString();
            }

        }

        private void GetSubjectTrngDetails()
        {
            DataTable dt1 = new DataTable();
            SqlDataReader dr = cmpnyBL.GetSubjectSchedule(Convert.ToInt32(ddlGroup.SelectedValue.Trim()), Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dm= Convert.ToDateTime(dt.Rows[0]["Schedule_srt_Date"]);
                lblSchStdntStartDate.Text = dm.ToString("dd-MM-yyyy");
               DateTime dtm = Convert.ToDateTime(dt.Rows[0]["Schedule_end_Date"]);
               lblSchStdntEndDate.Text = dtm.ToString("dd-MM-yyyy");
                lblSchStdntDuration.Text = dt.Rows[0]["Duration"].ToString();
                string Sid = dt.Rows[0]["Subject_Id"].ToString();
               DateTime dmt = Convert.ToDateTime(dt.Rows[0]["Assigned_Date"]);
               lblSubAssinedDate.Text = dmt.ToString("dd-MM-yyyy");
                lblSubTrngDuration.Text = dt.Rows[0]["Duration"].ToString(); 


                SqlDataReader dr1 = cmpnyBL.GetClassScheduleDetails(dt.Rows[0]["Subject_ScheduleID"].ToString());

                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    lblSubTrngEndDate.Text = dt1.Rows[0]["EndTime"].ToString();
                    lblSubTrngFaculty.Text = dt1.Rows[0]["Faculty"].ToString();
                    lblSubTrngHrs.Text = dt1.Rows[0]["Hours"].ToString();
                    DateTime dit = Convert.ToDateTime(dt1.Rows[0]["startdate"]);
                    lblSubTrngStartDate.Text = dit.ToString("dd-MM-yyyy");
                    DateTime d =  Convert.ToDateTime(dt1.Rows[0]["Enddate"]);
                    lblSubTrngEndDate.Text = d.ToString("dd-MM-yyyy");
                    lblSubTrngEndTime.Text = Convert.ToDateTime(dt1.Rows[0]["EndTime"]).ToShortDateString();
                    lblSubTrngStartTime.Text = Convert.ToDateTime(dt1.Rows[0]["StartTime"]).ToShortDateString();
                    lblSubTrngStatus.Text = dt1.Rows[0]["status"].ToString();
                    DateTime ds = Convert.ToDateTime(dt1.Rows[0]["StatusDate"]);
                    lblSubTrngStatusDate.Text = ds.ToString("dd-MM-yyyy");
                    lblSubTrngType.Text = dt1.Rows[0]["ClassType"].ToString();
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
                SqlDataReader dr3 = cmpnyBL.GetStudentsForSchedule("ACMPSMT001", Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
                DataTable dt3 = new DataTable();
                dt3.Load(dr3);
                if (dt3.Rows.Count > 0)
                {
                    System.Data.DataColumn ClmAssignedDate = new System.Data.DataColumn("Assigned_Date", typeof(System.String));
                    ClmAssignedDate.DefaultValue = Convert.ToDateTime(dt.Rows[0]["Assigned_Date"]).ToShortDateString();
                    dt3.Columns.Add(ClmAssignedDate);
                    System.Data.DataColumn ClmStatus = new System.Data.DataColumn("Clsstatus", typeof(System.String));
                    ClmStatus.DefaultValue = dt.Rows[0]["Status"].ToString();
                    dt3.Columns.Add(ClmStatus);
                    if (dt1.Rows.Count > 0)
                    {
                        System.Data.DataColumn ClmStatusDate = new System.Data.DataColumn("ClsStatusDate", typeof(System.DateTime));
                        ClmStatusDate.DefaultValue = Convert.ToDateTime(dt1.Rows[0]["StatusDate"]).ToShortDateString();
                        dt3.Columns.Add(ClmStatusDate);
                        System.Data.DataColumn ClmClassType = new System.Data.DataColumn("ClassType", typeof(System.String));
                        ClmClassType.DefaultValue = dt1.Rows[0]["ClassType"].ToString();
                        dt3.Columns.Add(ClmClassType);
                        System.Data.DataColumn ClmFaculty = new System.Data.DataColumn("Faculty", typeof(System.String));
                        ClmFaculty.DefaultValue = dt1.Rows[0]["Faculty"].ToString();
                        dt3.Columns.Add(ClmFaculty);
                        GvNodata.DataSource = dt3;
                        GvNodata.DataBind();
                        ViewState["StudentDetails"] = dt3;
                        lblmsg.Text = string.Empty;
                    }
                    else
                    {
                        lblmsg.Text = "No Records found";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                        GvNodata.DataSource = null;
                        GvNodata.DataBind();
                        GVUnitsForStudents.DataSource = null;
                        GVUnitsForStudents.DataBind();

                    }
                }
            }
            else
            {
                lblmsg.Text = "No Records found";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                GvNodata.DataSource = null;
                GvNodata.DataBind();
                GVUnitsForStudents.DataSource = null;
                GVUnitsForStudents.DataBind();
            }
           
        }

        protected void gvViewRecord_Click(object sender, ImageClickEventArgs e)
        {
            pnlViewReport.Visible = true;
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                Label QId = (Label)gvrow.FindControl("ID");
                string ID = QId.Text;
                DataTable dt = (DataTable)ViewState["StudentDetails"];
                var rows =
                    from row in dt.AsEnumerable()
                    where row.Field<string>("UserID") == ID
                    select row;
                DataTable dt1 = rows.CopyToDataTable();

                lblStudName.Text = dt1.Rows[0]["studIdname"].ToString();
                lblStudAcmpLoc.Text = lblACMPLoc.Text;
                lblStudAcmpName.Text = lblACMPName.Text;
                lblStudStatus.Text = dt1.Rows[0]["Status"].ToString();
                DateTime dtm = Convert.ToDateTime(dt1.Rows[0]["StatusDate"]);
                lblStudStatusDate.Text = dtm.ToString("dd-MM-yyyy");
                string ScheduleID = dt1.Rows[0]["Schedule_ID"].ToString();

                BindStudentGVDetails(ScheduleID, ID);
                bindStudentScheduledata(ScheduleID);
            }
        }

        private void bindStudentScheduledata(string ScheduleID)
        {
            SqlDataReader dr = cmpnyBL.GetSubjectScheduleStudent(Convert.ToInt32(ddlSubject.SelectedValue.Trim()), ScheduleID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
               // txtSchStdntCTDUnits.Text = dt.Rows[0][""].ToString();
                lblSchStdntDuration.Text = dt.Rows[0]["Duration"].ToString();
                 DateTime d =  Convert.ToDateTime(dt.Rows[0]["End_date"]);
                 lblSchStdntEndDate.Text = d.ToString("dd-MM-yyyy");
                lblSchStdntFaculty.Text = dt.Rows[0]["Faculty"].ToString();
               DateTime ds =  Convert.ToDateTime(dt.Rows[0]["Start_Date"]);
               lblSchStdntStartDate.Text = ds.ToString("dd-MM-yyyy");
                lblSchStdntStatus.Text = dt.Rows[0]["Status"].ToString();
                DateTime dm =  Convert.ToDateTime(dt.Rows[0]["Status_date"]);
                lblSchStdntStatusDate.Text = dm.ToString("dd-MM-yyyy");
               // txtSchStdntTBCUnits.Text = dt.Rows[0][""].ToString();
               // txtSchStdntTitle.Text = dt.Rows[0][""].ToString();
              //  txtSchStdntTUnits.Text = dt.Rows[0][""].ToString();
                lblSchStdntType.Text = dt.Rows[0]["ClassType"].ToString();
                lblSchStdntTUnits.Text = lblSubTotUnits.Text;
                SqlDataReader dr1 = cmpnyBL.Getsubtotremunits(Convert.ToInt32(ddlSubject.SelectedValue));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    int a =Convert.ToInt32(dt1.Rows[0]["Subject_T_Units"]);
                    lblSchStdntTUnits.Text =a.ToString();
                    int b = Convert.ToInt32(dt1.Rows[0]["Rem_Units"]);
                    lblSchStdntCTDUnits.Text = b.ToString();
                    lblSchStdntTBCUnits.Text = Convert.ToInt32(a - b).ToString();
                }
            }
        }

        internal void clear()
        {
            lblSchStdntDuration.Text = string.Empty;
            lblSchStdntEndDate.Text = string.Empty;
            lblSchStdntFaculty.Text = string.Empty;
            lblSchStdntStartDate.Text = string.Empty;
            lblSchStdntStatus.Text = string.Empty;
            lblSchStdntStatusDate.Text = string.Empty;
            lblSchStdntType.Text = string.Empty;
            lblStudName.Text = string.Empty;
            lblStudAcmpLoc.Text = string.Empty;
            lblStudAcmpName.Text = string.Empty;
            lblStudStatus.Text = string.Empty;
            lblStudStatusDate.Text = string.Empty;
        }
        private void BindStudentGVDetails(string ScheduleID, string UserID)
        {
            SqlDataReader dr = cmpnyBL.GetStudentsUnitsBySchedule(ScheduleID, UserID, Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVUnitsForStudents.DataSource = dt;
                GVUnitsForStudents.DataBind();
            }

        }

       
    }
}