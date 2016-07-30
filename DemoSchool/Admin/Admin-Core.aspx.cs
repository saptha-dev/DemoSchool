using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BE;
using BAL.BL;
using System.Drawing;
namespace PresentationLayer.Admin
{
    public partial class Core : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        AddGroupcs objAGBE = new AddGroupcs();
        AddYear objAYBE = new AddYear();
        string count, Pid, catgrycount;
        string Grpcount, Cid, GroupnameCnt;
        string Yearcount, gid, Yearnamecount;
        string Subjectcnt, Subjectnamecnt;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtStatusDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
            txtCateStatusDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
            txtSubStatusDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
            txtUntStatusDat.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");

            if (!IsPostBack)
            {
                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                TabName.Value = Request.Form[TabName.UniqueID];
                LoadProgamsDrpdown();
                //LoadNewProgamsDrpdown();
                LoadYearsProgamsDrpdown();
                LoadProgramsForUnitsDrpdown();
                LoadSubjectsProgamsDrpdown();
                LoadProgamsDrpdownForGroup();
                EnsureUpdatePanelFixups();
                // }

            }
          ;
        }
        #region




        private void EnsureUpdatePanelFixups()
        {
            this.Page.Title = "<some title>";
            if (this.Page.Form != null)
            {
                string formOnSubmitAtt = this.Page.Form.Attributes["onsubmit"];
                if (formOnSubmitAtt == "return _spFormOnSubmitWrapper();")
                {
                    this.Page.Form.Attributes["onsubmit"] = "_spFormOnSubmitWrapper();";
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(UpdatePanel), "UpdatePanelFixup", "_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;", true);
        }
        #endregion
        public void LoadProgamsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlPrograms.DataSource = dt;
            ddlPrograms.DataValueField = "Program_id";
            ddlPrograms.DataTextField = "Program_name";
            ddlPrograms.DataBind();
            ddlPrograms.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void LoadYearsProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlYearProgram.DataSource = dt;
            ddlYearProgram.DataValueField = "Program_id";
            ddlYearProgram.DataTextField = "Program_name";
            ddlYearProgram.DataBind();
            ddlYearProgram.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void LoadSubjectsProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlSubjectPrograms.DataSource = dt;
            ddlSubjectPrograms.DataValueField = "Program_id";
            ddlSubjectPrograms.DataTextField = "Program_name";
            ddlSubjectPrograms.DataBind();
            ddlSubjectPrograms.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        public void LoadProgramsForUnitsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsForUnits.DataSource = dt;
            ddlProgramsForUnits.DataValueField = "Program_id";
            ddlProgramsForUnits.DataTextField = "Program_name";
            ddlProgramsForUnits.DataBind();
            ddlProgramsForUnits.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void LoadCategoriesForUnitsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForCategoriesDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlCategoriesForUnits.DataSource = dt;
            ddlCategoriesForUnits.DataValueField = "Category_Id";
            ddlCategoriesForUnits.DataTextField = "Category_Name";
            ddlCategoriesForUnits.DataBind();
            ddlCategoriesForUnits.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void LoadSubjectForUnitsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataSubjectsForUnitsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlSubject_forUnits.DataSource = dt;
            ddlSubject_forUnits.DataValueField = "Subject_Id";
            ddlSubject_forUnits.DataTextField = "Subject_Name";
            ddlSubject_forUnits.DataBind();
            ddlSubject_forUnits.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindProgramsGrid()
        {
            SqlDataReader dr = objBL.ProgramsBindGrid();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                gvPrograms.DataSource = dt;
                gvPrograms.DataBind();
            }
            else
            {
                gvPrograms.Visible = false;
            }
        }

        public void BindCategoriesGrid()
        {
            SqlDataReader dr = objBL.CategoriesBindGrid();
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvCategories.DataSource = dt;
            gvCategories.DataBind();
        }

        public void BindGroupsGrid()
        {
            SqlDataReader dr = objBL.GroupBindGrid();
            DataTable dt = new DataTable();
            dt.Load(dr);
            GVGroup.DataSource = dt;
            GVGroup.DataBind();
        }

        public void BindSubjectsGrid()
        {
            SqlDataReader dr = objBL.SubjectsBindGrid();
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvSubjects.DataSource = dt;
            gvSubjects.DataBind();
        }

        public void BindUnitsGrid()
        {
            SqlDataReader dr = objBL.UnitsBindGrid();
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvUnits.DataSource = dt;
            gvUnits.DataBind();
        }

        protected void btnAddPrograms_Click(object sender, EventArgs e)
        {
            Program_Entities obj = new Program_Entities();
            obj.ProgramName = txtProgramName.Text;
            DateTime dtm = DateTime.ParseExact(txtProgramRegDate.Text, "dd-MM-yyyy", null);
            obj.ProgramRegistrationDate = dtm;
            obj.ProgramStatus = txtProgramStatus.Text;
            DateTime d = DateTime.ParseExact(txtStatusDate.Text, "dd-MM-yyyy", null);
            obj.ProgramStatusDate = d;
            obj.ProgramRemarks = txtRemarks.Text;
            obj.ProgramCategories = int.Parse(txtProgramCategories.Text);

            SqlDataReader dr = objBL.InsertNew_Progrm(obj);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : This PROGRAM already added.');", true);
                lblprg.Text = "Program Already Exists";
                lblprg.ForeColor = Color.Red;
            }
            else
            {
                BindProgramsGrid();
            }
            LoadProgamsDrpdown();
            LoadProgamsDrpdownForGroup();
            LoadYearsProgamsDrpdown();
            LoadSubjectsProgamsDrpdown();
            LoadProgramsForUnitsDrpdown();
            Clear();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {

            AddCategories objCategories = new AddCategories();
            objCategories.ProgramId = int.Parse(ddlPrograms.SelectedValue);
            Pid = objCategories.ProgramId.ToString();
            objCategories.Remarks = txtcateRemarks.Text;
            DateTime dtm = DateTime.ParseExact(txtCateStatusDate.Text, "dd-MM-yyyy", null);
            objCategories.CategorStatusDate = dtm;
            objCategories.CategoryName = txtCAteName.Text;
            objCategories.CategoryEligibility = txtEligiblty.Text;
            objCategories.CategorGroups = int.Parse(TxtCateGroups.Text);
            DateTime dml = DateTime.ParseExact(txtCateRegDate.Text, "dd-MM-yyyy", null);
            objCategories.CategorRegDate = dml;
            DateTime dm = DateTime.ParseExact(txtCateStartDate.Text, "dd-MM-yyyy", null);
            objCategories.CategorStartDate = dm;
            DateTime dl = DateTime.ParseExact(txtCateEndDate.Text, "dd-MM-yyyy", null);
            objCategories.CategorEndDate = dl;
            //objCategories.Year = ddlyear.SelectedItem.Text;
            //objCategories.Branch = ddlBranch.SelectedItem.Text;
            string item = ddlPrograms.SelectedItem.Text;
            objCategories.Status = txtCategoryStatus.Text;
            SqlDataReader dr1 = objBL.GetCountCategoryname(Pid);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                count = dt1.Rows[0]["catname"].ToString();
            }
            SqlDataReader dr2 = objBL.GetProgramTcatgry(Pid);
            DataTable dt2 = new DataTable();
            dt2.Load(dr2);
            if (dt2.Rows.Count > 0)
            {
                catgrycount = dt2.Rows[0]["Program_T_Ctgys"].ToString();
            }
            if (count != catgrycount)
            {
                SqlDataReader dr = objBL.InsertNew_Category(objCategories);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : This CATEGORY already added.');", true);
                    lblcat.Text = "Category Already Exists";
                    lblcat.ForeColor = Color.Red;
                }
                else
                {
                    BindCategoriesGrid();
                }
                objBL.ValidateProgram(objCategories.ProgramId);
                LoadProgamsDrpdownForGroup();
                LoadYearsProgamsDrpdown();
                ddlPrograms.SelectedIndex = -1;
                Clear();
            }
            else
            {

            }
        }

        public void Clear()
        {
            txtProgramCategories.Text = "";
            txtProgramName.Text = "";
            txtProgramRegDate.Text = "";

            txtRemarks.Text = "";

            txtCAteName.Text = "";
            txtCateRegDate.Text = "";
            txtcateRemarks.Text = "";
            txtCateStartDate.Text = "";
            txtCateEndDate.Text = "";

            TxtCateGroups.Text = "";
            txtEligiblty.Text = "";

            txtsubjectName.Text = "";
            txtSubRemarks.Text = "";
            txtsubUnits.Text = "";
            txtSubRegDate.Text = "";

            txtSubStatusDate.Text = "";
            //ddlBranch.SelectedIndex = -1;
            //ddlyear.SelectedIndex = -1;
            ddlSubjectCategories.SelectedIndex = -1;
            ddlCategoriesForUnits.SelectedIndex = -1;
            ddlProgramsForUnits.SelectedIndex = -1;
            ddlSubject_forUnits.SelectedIndex = -1;
            ddlSubjectPrograms.SelectedIndex = -1;
            txtUnitName.Text = "";
            txtUnitRemarks.Text = "";
            txtTopicList.Text = "";
            txtUnitSecName.Text = "";
            txtunitRegDate.Text = "";

            ddlGroupCategories.SelectedIndex = -1;
            txtGroupName.Text = "";
            txtGroupYearsCount.Text = "";
            //txtGroupStartDate.Text = "";
            //txtGroupEndDate.Text = "";
            //txtGroupStatus.Text = "";


            ddlYearCategory.SelectedIndex = -1;
            ddlYearGroup.SelectedIndex = -1;
            txtYearSem.Text = "";
            txtYearSubjects.Text = "";
            //txtYearStartdate.Text = "";
            //txtYearenddate.Text = "";
            //txtyearStatus.Text = "";


            ddlSubjectYear.SelectedIndex = -1;
            ddlSubjectGroup.SelectedIndex = -1;
            ddlSubjectCategories.SelectedIndex = -1;
            txtsubjectName.Text = "";
            txtSubRegDate.Text = "";

            txtsubUnits.Text = "";
            txtSubRemarks.Text = "";
            txtSubjectDuration.Text = "";
            txtsubjectStartdate.Text = "";
            txtsubjectEnddate.Text = "";
            lblgrp.Text = "";

            txtStatusDate.Text = DateTime.Now.Date.ToShortDateString();
            txtCateStatusDate.Text = DateTime.Now.Date.ToShortDateString();
            txtSubStatusDate.Text = DateTime.Now.Date.ToShortDateString();
            txtUntStatusDat.Text = DateTime.Now.Date.ToShortDateString();

        }

        #region Units

        protected void ddlProgramsForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategoriesForUnits.Items.Clear();
            ddlSubject_forUnits.Items.Clear();

            int programId = Convert.ToInt32(ddlProgramsForUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoriesForUnits.DataSource = dt;
                ddlCategoriesForUnits.DataValueField = "Category_Id";
                ddlCategoriesForUnits.DataTextField = "Category_Name";
                ddlCategoriesForUnits.DataBind();
                ddlCategoriesForUnits.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlCategoriesForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {

            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlUnitsBranch.DataSource = dt;
                ddlUnitsBranch.DataValueField = "Branch_Id";
                ddlUnitsBranch.DataTextField = "Branch_Name";
                ddlUnitsBranch.DataBind();
                ddlUnitsBranch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlUnitsBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            int BranchId = Convert.ToInt32(ddlUnitsBranch.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlUnitsYear.DataSource = dt;
                ddlUnitsYear.DataValueField = "Year_Id";
                ddlUnitsYear.DataTextField = "Branch_Year_No";
                ddlUnitsYear.DataBind();
                ddlUnitsYear.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlUnitsYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubject_forUnits.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlUnitsYear.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnCountGroups(CategorieID);    //  sp_ProgramUnit
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject_forUnits.DataSource = dt;
                ddlSubject_forUnits.DataValueField = "Subject_Id";
                ddlSubject_forUnits.DataTextField = "Subject_Name";
                ddlSubject_forUnits.DataBind();
                ddlSubject_forUnits.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void btnAddUnit_Click(object sender, EventArgs e)
        {
            if (ddlSubject_forUnits.SelectedItem.Value != "0")
            {
                AddUnits_BE objAddUnits = new AddUnits_BE();
                objAddUnits.Program_id = int.Parse(ddlProgramsForUnits.SelectedValue);
                objAddUnits.Category_Id = int.Parse(ddlCategoriesForUnits.SelectedValue);
                objAddUnits.Subject_Id = int.Parse(ddlSubject_forUnits.SelectedValue);
                objAddUnits.UnitName = txtUnitName.Text;
                DateTime dtl = DateTime.ParseExact(txtunitRegDate.Text, "dd-MM-yyyy", null);
                objAddUnits.Unit_Reg_Date = dtl;
                objAddUnits.Unit_SectionName = txtUnitSecName.Text;
                objAddUnits.Topics_List = txtTopicList.Text;
                objAddUnits.Unit_Status = txtUnitsStatus.Text;
                DateTime d = DateTime.ParseExact(txtUntStatusDat.Text, "dd-MM-yyyy", null);
                objAddUnits.Unite_Status_Date = d;
                objAddUnits.Unit_Remarks = txtUnitRemarks.Text;

                SqlDataReader dr = objBL.InsertNew_Units(objAddUnits);
                DataTable dt = new DataTable();
                dt.Load(dr);
                gvUnits.DataSource = dt;
                gvUnits.DataBind();
                Clear();
                ddlUnitsBranch.Items.Clear();
                ddlUnitsYear.Items.Clear();
                ddlSubject_forUnits.Items.Clear();
                ddlCategoriesForUnits.Items.Clear();
            }
        }

        protected void btnCancelUnit_Click(object sender, EventArgs e)
        {
            Clear();
            ddlUnitsBranch.Items.Clear();
            ddlUnitsYear.Items.Clear();
            ddlSubject_forUnits.Items.Clear();
            ddlCategoriesForUnits.Items.Clear();
        }

        #endregion Units

        protected void btncancelPrograms_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btncancelcate_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void btnCancelSubject_Click(object sender, EventArgs e)
        {
            Clear();
        }

        #region Group

        public void LoadProgamsDrpdownForGroup()
        {

            SqlDataReader dr = objBL.GetDataForProgramsDrpdwnforGroup();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlGroupProgram.DataSource = dt;
            ddlGroupProgram.DataValueField = "Program_id";
            ddlGroupProgram.DataTextField = "Program_name";
            ddlGroupProgram.DataBind();
            ddlGroupProgram.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        protected void ddlGroupProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlGroupCategories.Items.Clear();
            int programId = Convert.ToInt32(ddlGroupProgram.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlGroupCategories.DataSource = dt;
                ddlGroupCategories.DataValueField = "Category_Id";
                ddlGroupCategories.DataTextField = "Category_Name";
                ddlGroupCategories.DataBind();
                ddlGroupCategories.Items.Insert(0, new ListItem("--Select--", "0"));
            }

        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            objAGBE.Category_Id = Convert.ToInt32(ddlGroupCategories.SelectedItem.Value);
            Cid = objAGBE.Category_Id.ToString();
            objAGBE.Branch_Name = txtGroupName.Text.Trim();
            objAGBE.Branch_T_Years = Convert.ToInt32(txtGroupYearsCount.Text);
            objAGBE.Branch_Srt_Date = Convert.ToDateTime(System.DateTime.Now);
            objAGBE.Branch_End_Date = Convert.ToDateTime(System.DateTime.Now);
            objAGBE.Status = "0";
            SqlDataReader dr1 = objBL.GetCountGroupname(Cid);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                Grpcount = dt1.Rows[0]["Grpname"].ToString();

            }
            SqlDataReader dr2 = objBL.GetCategoryTGroup(Cid);
            DataTable dt2 = new DataTable();
            dt2.Load(dr2);
            if (dt2.Rows.Count > 0)
            {
                GroupnameCnt = dt2.Rows[0]["Category_T_Group"].ToString();
            }
            if (Grpcount != GroupnameCnt)
            {
                SqlDataReader dr = objBL.InsertNew_Branch(objAGBE);
                DataTable dt = new DataTable();
                Clear();
                if (dr.HasRows)
                {
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        lblgrp.Text = "Groupname Already Exists";
                        lblgrp.ForeColor = Color.Red;
                    }

                }
                else
                {
                    GVGroup.DataSource = dt;
                    GVGroup.DataBind();

                    LoadYearsProgamsDrpdown();
                }
            }
            else
            {
                lblgrp.Text = "fdhgfhghrhrt";
                lblgrp.ForeColor = Color.Red;
            }
        }

        protected void btnGroupCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        #endregion Group

        #region Year

        protected void ddlYearProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlYearCategory.Items.Clear();
            ddlYearGroup.Items.Clear();

            int programId = Convert.ToInt32(ddlYearProgram.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlYearCategory.DataSource = dt;
                ddlYearCategory.DataValueField = "Category_Id";
                ddlYearCategory.DataTextField = "Category_Name";
                ddlYearCategory.DataBind();
                ddlYearCategory.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlYearCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlYearGroup.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlYearCategory.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupsFilterBasedOnCategoriesDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlYearGroup.DataSource = dt;
                ddlYearGroup.DataValueField = "Branch_Id";
                ddlYearGroup.DataTextField = "Branch_Name";
                ddlYearGroup.DataBind();
                ddlYearGroup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlYearGroup.Items.Insert(0, new ListItem("No Group To Select", "0"));
            }
        }

        protected void btnAddYear_Click(object sender, EventArgs e)
        {
            if (ddlYearGroup.SelectedItem.Value != "0")
            {
                objAYBE.Branch_Id = Convert.ToInt32(ddlYearGroup.SelectedItem.Value);
                gid = objAYBE.Branch_Id.ToString();
                objAYBE.Branch_Year_No = txtYearSem.Text;
                objAYBE.Year_T_Subjects = Convert.ToInt32(txtYearSubjects.Text.Trim());
                objAYBE.Year_Srt_Date = Convert.ToDateTime(System.DateTime.Now);
                objAYBE.Year_End_Date = Convert.ToDateTime(System.DateTime.Now);
                objAYBE.Status = 1;
                SqlDataReader dr1 = objBL.GetCountyearname(gid);
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    Yearcount = dt1.Rows[0]["yearcountname"].ToString();
                }
                SqlDataReader dr2 = objBL.GetGroupTyears(gid);
                DataTable dt2 = new DataTable();
                dt2.Load(dr2);
                if (dt2.Rows.Count > 0)
                {
                    Yearnamecount = dt2.Rows[0]["Branch_T_Years"].ToString();
                }
                if (Yearcount != Yearnamecount)
                {
                    SqlDataReader dr = objBL.InsertNew_Year(objAYBE);
                    Clear();
                    ddlYearGroup.Items.Clear();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvYears.DataSource = dt;
                    gvYears.DataBind();
                }
                else
                {

                }
            }
        }

        protected void btnYearCancel_Click(object sender, EventArgs e)
        {
            Clear();
            ddlYearGroup.Items.Clear();
        }

        #endregion Year

        #region Subjects

        protected void ddlSubjectPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectCategories.Items.Clear();
            ddlSubjectGroup.Items.Clear();
            ddlSubjectYear.Items.Clear();
            int programId = Convert.ToInt32(ddlSubjectPrograms.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectCategories.DataSource = dt;
                ddlSubjectCategories.DataValueField = "Category_Id";
                ddlSubjectCategories.DataTextField = "Category_Name";
                ddlSubjectCategories.DataBind();
                ddlSubjectCategories.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlSubjectCategories.Items.Insert(0, new ListItem("No Group To Select", "0"));
            }
        }

        protected void ddlSubjectCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectGroup.Items.Clear();
            ddlSubjectYear.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlSubjectCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectGroup.DataSource = dt;
                ddlSubjectGroup.DataValueField = "Branch_Id";
                ddlSubjectGroup.DataTextField = "Branch_Name";
                ddlSubjectGroup.DataBind();
                ddlSubjectGroup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            else
            {
                ddlSubjectGroup.Items.Insert(0, new ListItem("No Group To Select", "0"));
            }
        }

        protected void ddlSubjectGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectYear.Items.Clear();
            int SubjectID = Convert.ToInt32(ddlSubjectGroup.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnCountGroups(SubjectID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectYear.DataSource = dt;
                ddlSubjectYear.DataValueField = "Year_Id";
                ddlSubjectYear.DataTextField = "Branch_Year_No";
                ddlSubjectYear.DataBind();
                ddlSubjectYear.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void btnAddSubjects_Click(object sender, EventArgs e)
        {
            AddSubjects_Entities objSubjects = new AddSubjects_Entities();
            objSubjects.Year_Id = Convert.ToInt32(ddlSubjectYear.SelectedValue);
            objSubjects.Branch_Id = Convert.ToInt32(ddlSubjectGroup.SelectedValue);
            objSubjects.Category_Id = int.Parse(ddlSubjectCategories.SelectedValue);
            objSubjects.Program_Id = Convert.ToInt32(ddlSubjectPrograms.SelectedValue);
            objSubjects.Subject_Name = txtsubjectName.Text;
            DateTime dts = DateTime.ParseExact(txtSubRegDate.Text, "dd-MM-yyyy", null);
            objSubjects.Subject_RegDate = dts;
            objSubjects.Subject_Duration = txtSubjectDuration.Text;
            objSubjects.Subject_T_Units = int.Parse(txtsubUnits.Text);
            DateTime dl = DateTime.ParseExact(txtsubjectStartdate.Text, "dd-MM-yyyy", null);
            objSubjects.Subject_Start_Date = dl;
            DateTime dlm = DateTime.ParseExact(txtsubjectEnddate.Text, "dd-MM-yyyy", null);
            objSubjects.Subject_End_Date = dlm;
            objSubjects.Subject_Status = txtSubjectStatus.Text;
            DateTime d = DateTime.ParseExact(txtSubStatusDate.Text, "dd-MM-yyyy", null);
            objSubjects.Subject_Status_Date = d;
            objSubjects.Subject_Remarks = txtSubRemarks.Text;
            SqlDataReader dr1 = objBL.GetCountSubjectname(ddlSubjectCategories.SelectedValue, ddlSubjectPrograms.SelectedValue, ddlSubjectGroup.SelectedValue, ddlSubjectYear.SelectedValue);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                Subjectcnt = dt1.Rows[0]["subjectCntname"].ToString();
            }
            SqlDataReader dr2 = objBL.GetYertSubjects(ddlSubjectGroup.SelectedValue, ddlSubjectYear.SelectedValue);
            DataTable dt2 = new DataTable();
            dt2.Load(dr2);
            if (dt2.Rows.Count > 0)
            {
                Subjectnamecnt = dt2.Rows[0]["Year_T_Subjects"].ToString();
            }
            if (Subjectcnt != Subjectnamecnt)
            {
                SqlDataReader dr = objBL.InsertNew_Subject(objSubjects);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : This Subject already added.');", true);
                    lbls.Text = "Subject Already Exists";
                    lbls.ForeColor = Color.Red;
                }
                objBL.validateCategory(objSubjects.Category_Id);

                BindSubjectsGrid();
                Clear();
                ddlSubjectYear.Items.Clear();
                ddlSubjectGroup.Items.Clear();
                ddlSubjectCategories.Items.Clear();
            }
            else
            {

            }
        }
        #endregion Subjects





    }
}