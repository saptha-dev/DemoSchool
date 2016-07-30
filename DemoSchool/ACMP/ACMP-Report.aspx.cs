using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using System.IO;

namespace PresentationLayer.ACMP
{
    public partial class ACMP_Report : System.Web.UI.Page
    {
        CompanyBL cmpnyBL = new CompanyBL();
        DataSet ds = new DataSet();

        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        DataTable dt6 = new DataTable();
        DataTable dt7 = new DataTable();
        DataTable dt8 = new DataTable();
        DataTable dt9 = new DataTable();
        DataTable dt10 = new DataTable();
        DataTable dt11 = new DataTable();
        DataTable dt12 = new DataTable();
        DataTable dt13 = new DataTable();

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
            SqlDataReader dr = cmpnyBL.GetBranchGroupByCategory(ddlBranch.SelectedValue.Trim(), Convert.ToInt32(ddlProgram.SelectedValue));
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
            GetCompanyDetails();
            GetCategoryDetails();
            GetGroupDetails();
            GetSubjectTrngDetails();
            BindStudentsGV();

        }

        private void GetCategoryDetails()
        {
            SqlDataReader dr = cmpnyBL.GetCategoryDetails(Convert.ToInt32(ddlCategory.SelectedValue.Trim()));
            //DataTable dt = new DataTable();
            dt1.Load(dr);
            ds.Tables.Add(dt1);
            //ds.Tables[1].Load(dr);
            if (dt1.Rows.Count > 0)
            {
                lblCategoryDuration.Text = dt1.Rows[0]["Category_Duration"].ToString();
                DateTime dst= Convert.ToDateTime(dt1.Rows[0]["Category_End_Date"]);
                lblCategoryEndDate.Text = dst.ToString("dd-MM-yyyy");
                string Id = dt1.Rows[0]["Category_Id"].ToString();
                lblCategoryName.Text =Id+":"+ dt1.Rows[0]["Category_Name"].ToString();
                DateTime dm = Convert.ToDateTime(dt1.Rows[0]["Category_Srt_Date"]);
                lblCategoryStartDate.Text = dm.ToString("dd-MM-yyyy");
                lblCategoryStatus.Text = dt1.Rows[0]["Category_Status"].ToString();
                DateTime dtm = Convert.ToDateTime(dt1.Rows[0]["Category_Status_Date"]);
                lblCategoryStatusDate.Text = dtm.ToString("dd-MM-yyyy");
                lblGroupYear.Text = dt1.Rows[0]["Category_Year"].ToString();
            }
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

        private void GetGroupDetails()
        {
            SqlDataReader dr = cmpnyBL.GetGroupDetails(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            //DataTable dt = new DataTable();
            dt3.Load(dr);
            ds.Tables.Add(dt3);
        
            if (dt3.Rows.Count > 0)
            {
               DateTime dm = Convert.ToDateTime(dt3.Rows[0]["Branch_End_Date"]);
               lblGroupEndDate.Text = dm.ToString("dd-MM-yyyy");
               DateTime dn = Convert.ToDateTime(dt3.Rows[0]["Branch_Srt_Date"]);
               lblGroupStartDate.Text = dn.ToString("dd-MM-yyyy");
               lblGroupStatus.Text = lblCategoryStatus.Text;
               lblGroupStatusDate.Text = lblCategoryStartDate.Text;
                //lblGroupYear.Text = DDlYear.SelectedItem.Text.Trim();
            }
            SqlDataReader dr1 = cmpnyBL.GetTotSubjectsCount(Convert.ToInt32(ddlGroup.SelectedValue.Trim()));
            //DataTable dt1 = new DataTable();
            dt4.Load(dr1);
            ds.Tables.Add(dt4);
          
            if (dt4.Rows.Count > 0)
            {
                lblCategorySubjects.Text = dt4.Rows[0][0].ToString();
            }

        }

        private void GetSubjectTrngDetails()
        {
            SqlDataReader dr = cmpnyBL.GetSubjectSchedule(Convert.ToInt32(ddlGroup.SelectedValue.Trim()), Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            //DataTable dt = new DataTable();
            dt5.Load(dr);
            ds.Tables.Add(dt5);
           
            if (dt5.Rows.Count > 0)
            {
                DateTime dn = Convert.ToDateTime(dt5.Rows[0]["Schedule_srt_Date"]);
                lblSubTrngStartDate.Text = dn.ToString("dd-MM-yyyy");
                DateTime dm = Convert.ToDateTime(dt5.Rows[0]["Schedule_end_Date"]);
                lblSubTrngEndDate.Text = dm.ToString("dd-MM-yyyy");
                lblSubTrngDuration.Text = dt5.Rows[0]["Duration"].ToString();
                string Sid = dt5.Rows[0]["Subject_Id"].ToString();
                DateTime dtm = Convert.ToDateTime(dt5.Rows[0]["Assigned_Date"]);
                lblSubAssinedDate.Text = dtm.ToString("dd-MM-yyyy");
                SqlDataReader dr1 = cmpnyBL.GetClassScheduleDetails(dt5.Rows[0]["Subject_ScheduleID"].ToString());
                //DataTable dt1 = new DataTable();
                dt6.Load(dr1);
                ds.Tables.Add(dt6);
               
                if (dt6.Rows.Count > 0)
                {
                     DateTime dsn = Convert.ToDateTime(dt6.Rows[0]["EndTime"]);
                     lblSubTrngEndTime.Text = dsn.ToString("dd-MM-yyyy");
                    lblSubTrngFaculty.Text = dt6.Rows[0]["Faculty"].ToString();
                    lblSubTrngHrs.Text = dt6.Rows[0]["Hours"].ToString();
                    lblSubTrngStartTime.Text = dt6.Rows[0]["StartTime"].ToString();
                    lblSubTrngStatus.Text = dt6.Rows[0]["status"].ToString();
                    DateTime dmt = Convert.ToDateTime(dt6.Rows[0]["StatusDate"]);
                    lblSubTrngStatusDate.Text = dmt.ToString("dd-MM-yyyy");
                    lblSubTrngType.Text = dt6.Rows[0]["ClassType"].ToString();
                }

                SqlDataReader dr2 = cmpnyBL.GetScheduleTotalStudents(dt5.Rows[0]["Schedule_ID"].ToString());
                //DataTable dt2 = new DataTable();
                dt7.Load(dr2);
                ds.Tables.Add(dt7);
               
                if (dt7.Rows.Count > 0)
                {
                    lblSubName.Text =Sid+":"+ ddlSubject.SelectedItem.Text;
                    lblSubTotStudents.Text = dt7.Rows[0][0].ToString();
                }
            }
            SqlDataReader drUnits = cmpnyBL.GetTotUnitsCount(Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            //DataTable dtUnits = new DataTable();
            dt8.Load(drUnits);
            ds.Tables.Add(dt8);
            
            if (dt8.Rows.Count > 0)
            {
                lblSubTotUnits.Text = dt8.Rows[0][0].ToString();
            }
        }

        protected void gvViewRecord_Click(object sender, ImageClickEventArgs e)
        {
            // pnlViewReport.Visible = true;
            Grdassmntrepoert.DataSource = null;
            Grdassmntrepoert.DataBind();
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                Label QId = (Label)gvrow.FindControl("ID");
                HiddenField Did = (HiddenField)gvrow.FindControl("hdnid");
                string ID = QId.Text;
                string StID = Did.Value;
                DataTable dt = (DataTable)ViewState["StudentDetails"];
                var rows =
                    from row in dt.AsEnumerable()
                    where row.Field<string>("UserID") == ID
                    select row;
                DataTable dt1 = rows.CopyToDataTable();
                string ScheduleID = dt1.Rows[0]["Schedule_ID"].ToString();
                BindStudentGVDetails(ScheduleID, ID);
                BindassessmentReport(StID);
            }
        }

        private void BindStudentsGV()
        {
            StudentBL stbl = new StudentBL();
            SqlDataReader dr3 = cmpnyBL.GetCompanyTrainingStudents("ACMPSMT001", Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            //DataTable dt3 = new DataTable();
            dt9.Load(dr3);
            ds.Tables.Add(dt9);
            
            ViewState["data"] = ds;
            if (dt9.Rows.Count > 0)
            {
                GvTrngStudents.DataSource = dt9;
                ViewState["StudentDetails"] = dt9;
                GvTrngStudents.DataBind();

            }

        }

        private void BindStudentGVDetails(string ScheduleID, string UserID)
        {
            SqlDataReader dr = cmpnyBL.GetStudentsUnitsBySchedule(ScheduleID, UserID, Convert.ToInt32(ddlSubject.SelectedValue.Trim()));
            //DataTable dt = new DataTable();
            dt10.Load(dr);
            if (dt10.Rows.Count > 0)
            {
                GVUnitsForSubjects.DataSource = dt10;
                GVUnitsForSubjects.DataBind();
            }

        }
        private void BindassessmentReport(string UserID)
        {
            SqlDataReader dr = cmpnyBL.GetBranchByCompany("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                SqlDataReader dr1 = cmpnyBL.Getrtasdetails(UserID, Convert.ToInt32(ddlSubject.SelectedValue));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    System.Data.DataColumn ClmAcmpid = new System.Data.DataColumn("BranchID", typeof(System.String));
                    ClmAcmpid.DefaultValue = dt.Rows[0]["BranchID"].ToString();
                    dt1.Columns.Add(ClmAcmpid);
                    System.Data.DataColumn Clmcat = new System.Data.DataColumn("Category_Id", typeof(System.String));
                    Clmcat.DefaultValue = ddlCategory.SelectedValue.ToString();
                    dt1.Columns.Add(Clmcat);
                    System.Data.DataColumn Clmgroup = new System.Data.DataColumn("Branch_Name", typeof(System.String));
                    Clmgroup.DefaultValue = ddlGroup.SelectedItem.ToString();
                    dt1.Columns.Add(Clmgroup);
                    System.Data.DataColumn Clmsub = new System.Data.DataColumn("Subject_Name", typeof(System.String));
                    Clmsub.DefaultValue = ddlSubject.SelectedItem.ToString();
                    dt1.Columns.Add(Clmsub);
                    //System.Data.DataColumn Clmstname = new System.Data.DataColumn("studIdname", typeof(System.String));
                    //Clmstname.DefaultValue = dt1.Rows[0]["studIdname"].ToString(); ;
                    //dt1.Columns.Add(Clmstname);
                    Grdassmntrepoert.DataSource = dt1;
                    Grdassmntrepoert.DataBind();
                }
            }
        }

        protected void submit3_Click(object sender, EventArgs e)
        {
            //GridView GridView1 = new GridView();
            //GridView GridView2 = new GridView();
            //GridView GridView3 = new GridView();
            //GridView GridView4 = new GridView();
            //GridView GridView5 = new GridView();
            //GridView GridView6 = new GridView();
            //GridView GridView7 = new GridView();
            //GridView GridView8 = new GridView();
            //GridView GridView9 = new GridView();


            //DataSet ds1 = (DataSet)ViewState["data"];
            ////DataTable dtAll = ds1.Tables[0].Copy();
            ////for (var i = 1; i < ds1.Tables.Count; i++)
            ////{
            ////    dtAll.Merge(ds1.Tables[i]);
            ////}
            //GridView1.DataSource = ds1.Tables[0];
            //GridView1.DataBind();
            //GridView2.DataSource = ds1.Tables[1];
            //GridView2.DataBind();
            //GridView3.DataSource = ds1.Tables[2];
            //GridView3.DataBind();
            //GridView4.DataSource = ds1.Tables[3];
            //GridView4.DataBind();
            //GridView5.DataSource = ds1.Tables[4];
            //GridView5.DataBind();
            //GridView6.DataSource = ds1.Tables[5];
            //GridView6.DataBind();
            //GridView7.DataSource = ds1.Tables[6];
            //GridView7.DataBind();
            //GridView8.DataSource = ds1.Tables[7];
            //GridView8.DataBind();
            //GridView9.DataSource = ds1.Tables[8];
            //GridView9.DataBind();

            //Response.Clear();
            //Response.Buffer = true;
            //Response.AddHeader("content-disposition",
            //    "attachment;filename=DataTable.doc");
            //Response.Charset = "";
            //Response.ContentType = "application/vnd.ms-word ";
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter hw = new HtmlTextWriter(sw);
            //GridView1.RenderControl(hw);
            //GridView2.RenderControl(hw);
            //GridView3.RenderControl(hw);
            //GridView4.RenderControl(hw);
            //GridView5.RenderControl(hw);
            //GridView6.RenderControl(hw);
            //GridView7.RenderControl(hw);
            //GridView8.RenderControl(hw);
            //GridView9.RenderControl(hw);
            //Response.Output.Write(sw.ToString());
            //Response.Flush();
            //Response.End();
        }

    }
}