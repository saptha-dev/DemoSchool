using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using BAL.BE;

namespace PresentationLayer.Admin
{
    public partial class Admin_ManageCore : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        EditProgram objEPBL = new EditProgram();
        Program_Entities objPEBE = new Program_Entities();
        AddCategories objCEBE = new AddCategories();
        AddSubjects_Entities objSEBE = new AddSubjects_Entities();
        AddUnits_BE objunits = new AddUnits_BE();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtStatusDate.Text = DateTime.Now.Date.ToShortDateString();
                txtSubStatusDate.Text = DateTime.Now.Date.ToShortDateString();
                txtUntStatusDat.Text = DateTime.Now.Date.ToShortDateString();
                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                    LoadNewProgamsDrpdown();
               // }
            }


        }

        public void LoadNewProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsNew.DataSource = dt;
            ddlProgramsNew.DataValueField = "Program_id";
            ddlProgramsNew.DataTextField = "Program_name";
            ddlProgramsNew.DataBind();
            ddlProgramsNew.Items.Insert(0, new ListItem("--Select--", "0"));


            ddlPrograms.DataSource = dt;
            ddlPrograms.DataValueField = "Program_id";
            ddlPrograms.DataTextField = "Program_name";
            ddlPrograms.DataBind();
            ddlPrograms.Items.Insert(0, new ListItem("--Select--", "0"));


            ddlGroupProgram.DataSource = dt;
            ddlGroupProgram.DataValueField = "Program_id";
            ddlGroupProgram.DataTextField = "Program_name";
            ddlGroupProgram.DataBind();
            ddlGroupProgram.Items.Insert(0, new ListItem("--Select--", "0"));

            ddlYearProgram.DataSource = dt;
            ddlYearProgram.DataValueField = "Program_id";
            ddlYearProgram.DataTextField = "Program_name";
            ddlYearProgram.DataBind();
            ddlYearProgram.Items.Insert(0, new ListItem("--Select--", "0"));


            ddlSubjectPrograms.DataSource = dt;
            ddlSubjectPrograms.DataValueField = "Program_id";
            ddlSubjectPrograms.DataTextField = "Program_name";
            ddlSubjectPrograms.DataBind();
            ddlSubjectPrograms.Items.Insert(0, new ListItem("--Select--", "0"));

            ddlProgramsForUnits.DataSource = dt;
            ddlProgramsForUnits.DataValueField = "Program_id";
            ddlProgramsForUnits.DataTextField = "Program_name";
            ddlProgramsForUnits.DataBind();
            ddlProgramsForUnits.Items.Insert(0, new ListItem("--Select--", "0"));

        }

        #region Programs

        protected void ddlProgramsNew_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ProgramID =Convert.ToInt32(ddlProgramsNew.SelectedValue);
            SqlDataReader dr = objEPBL.GetProgramDataByID(ProgramID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            txtProgramName.Text = dt.Rows[0]["Program_name"].ToString();
            //txtProgramRegDate.Text = dt.Rows[0]["Program_Red_Date"].ToString();
            DateTime regDate = Convert.ToDateTime(dt.Rows[0]["Program_Red_Date"].ToString());
            txtProgramRegDate.Text = regDate.ToString("dd-MM-yyyy");
            txtProgramCategories.Text = dt.Rows[0]["Program_T_Ctgys"].ToString();
            ddlProgramStatus.SelectedItem.Text = dt.Rows[0]["Program_Status"].ToString();
           // txtStatusDate.Text = dt.Rows[0]["Program_Date"].ToString();
            DateTime prgrmDate = Convert.ToDateTime(dt.Rows[0]["Program_Date"].ToString());
            txtStatusDate.Text = prgrmDate.ToString("dd-MM-yyyy");
            txtRemarks.Text = dt.Rows[0]["Program_Remarks"].ToString();
            btnEditPrograms.Text = "Update";
        }

        private void ClearFielsd()
        {
            txtProgramName.Text = "";
            txtProgramRegDate.Text = "";
            txtProgramCategories.Text = "";
            ddlProgramStatus.SelectedIndex = -1;
            txtRemarks.Text = "";
            btnEditPrograms.Text = "Edit";
        }

        protected void btnEditPrograms_Click(object sender, EventArgs e)
        {
            int ProgramID = Convert.ToInt32(ddlProgramsNew.SelectedValue);
            objPEBE.ProgramId = ProgramID;
            objPEBE.ProgramRegistrationDate =Convert.ToDateTime(txtProgramRegDate.Text);
            objPEBE.ProgramCategories= Convert.ToInt32(txtProgramCategories.Text);
            objPEBE.ProgramStatus = ddlProgramStatus.SelectedItem.Text;
            objPEBE.ProgramStatusDate = Convert.ToDateTime(txtStatusDate.Text);
            objPEBE.ProgramRemarks=txtRemarks.Text;
            SqlDataReader dr = objEPBL.UpdateProgramData(objPEBE);
            ClearFielsd();
            LoadNewProgamsDrpdown();                                      
        }

        protected void btnDeletelPrograms_Click(object sender, EventArgs e)
        {
            int ProgramID = Convert.ToInt32(ddlProgramsNew.SelectedValue);
            SqlDataReader dr = objEPBL.DeleteProgramData(ProgramID);
            ClearFielsd();
            LoadNewProgamsDrpdown();  
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFielsd();
        }

        #endregion Programs

        #region Categories

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {

            txtCateRegDate.Text = "";
            TxtCateSubjects.Text = "";
            txtEligiblty.Text = "";
            txtcateRemarks.Text = "";


            int programId = Convert.ToInt32(ddlPrograms.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoriesOnProgram.DataSource = dt;
                ddlCategoriesOnProgram.DataValueField = "Category_Id";
                ddlCategoriesOnProgram.DataTextField = "Category_Name";
                ddlCategoriesOnProgram.DataBind();
                ddlCategoriesOnProgram.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlCategoriesOnProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategoryID = Convert.ToInt32(ddlCategoriesOnProgram.SelectedValue);
            SqlDataReader dr = objEPBL.GetCategoryDataByProgramIDID(CategoryID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                //txtCateRegDate.Text = dt.Rows[0]["Category_Reg_Date"].ToString();
                DateTime CateRedDate = Convert.ToDateTime(dt.Rows[0]["Category_Reg_Date"].ToString());
                txtCateRegDate.Text = CateRedDate.ToString("dd-MM-yyyy");
                TxtCateSubjects.Text = dt.Rows[0]["Category_T_Group"].ToString();
                //txtCateStatusDate.Text = dt.Rows[0]["Category_Status_Date"].ToString();
                DateTime CateStatusDate = Convert.ToDateTime(dt.Rows[0]["Category_Status_Date"].ToString());
               ddlCateStatus.SelectedItem.Text = dt.Rows[0]["Category_Status"].ToString();
               txtCateStatusDate.Text = CateStatusDate.ToString("dd-MM-yyyy");
                txtEligiblty.Text = dt.Rows[0]["Category_T_Eligible"].ToString();
                txtcateRemarks.Text = dt.Rows[0]["Category_Remarks"].ToString();
                btnCategoriesEdit.Text = "Update";
            }

        }

        protected void btnCategoriesEdit_Click(object sender, EventArgs e)
        {
            if (ddlCategoriesOnProgram.SelectedValue!="")
            {
            int CategoryID = Convert.ToInt32(ddlCategoriesOnProgram.SelectedValue);
            objCEBE.Category_Id = CategoryID;
            objCEBE.CategorRegDate =DateTime.Parse( txtCateRegDate.Text);
            objCEBE.CategorSubjects = Convert.ToInt32(TxtCateSubjects.Text);
            objCEBE.CategoryEligibility = txtEligiblty.Text;
            objCEBE.CategorStatusDate =DateTime.Parse(txtCateStatusDate.Text);
            objCEBE.Remarks = txtcateRemarks.Text;
            objCEBE.Status = ddlCateStatus.SelectedItem.Text;

            SqlDataReader dr = objEPBL.UpdateCategoryData(objCEBE);
            ClearCategoryFielsd();
            LoadNewProgamsDrpdown(); // CategoriesProgamsDrpdown();
            ddlCategoriesOnProgram.Items.Clear();
            btnCategoriesEdit.Text = "Edit";
            }
        }

        private void ClearCategoryFielsd()
        {
            ddlCategoriesOnProgram.Items.Clear();
            ddlPrograms.SelectedIndex = -1;
            txtCateRegDate.Text = "";
            TxtCateSubjects.Text = "";
            txtEligiblty.Text = "";
            //txtCateStatusDate.Text = "";
            txtcateRemarks.Text = "";
            btnCategoriesEdit.Text = "";
        }

        protected void btncateCancel_Click(object sender, EventArgs e)
        {
            ClearCategoryFielsd();
            btnCategoriesEdit.Text = "Edit";
        }

        protected void btnCategoriesDelete_Click(object sender, EventArgs e)
        {
            int CategoryID = Convert.ToInt32(ddlCategoriesOnProgram.SelectedValue);
            SqlDataReader dr = objEPBL.DeleteCategoryData(CategoryID);
            ClearCategoryFielsd();
            LoadNewProgamsDrpdown();// CategoriesProgamsDrpdown();
            ddlCategoriesOnProgram.Items.Clear();
        }


        //private void CategoriesProgamsDrpdown()
        //{

        //    SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    ddlPrograms.DataSource = dt;
        //    ddlPrograms.DataValueField = "Program_id";
        //    ddlPrograms.DataTextField = "Program_name";
        //    ddlPrograms.DataBind();
        //    ddlPrograms.Items.Insert(0, "---Select---");

        //}

        #endregion Categories

        #region Subjects

        //private void SubjectProgamsDrpdown()
        //{

        //    SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    ddlSubjectPrograms.DataSource = dt;
        //    ddlSubjectPrograms.DataValueField = "Program_id";
        //    ddlSubjectPrograms.DataTextField = "Program_name";
        //    ddlSubjectPrograms.DataBind();
        //    ddlSubjectPrograms.Items.Insert(0, new ListItem("---Select---", "0"));

        //}

        protected void ddlSubjectPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectCategories.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();

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
                ddlSubjectCategories.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlSubjectCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();

            int CategoryId = Convert.ToInt32(ddlSubjectCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlBranch.DataSource = dt;
                ddlBranch.DataValueField = "Branch_Id";
                ddlBranch.DataTextField = "Branch_Name";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();

            int BranchId = Convert.ToInt32(ddlBranch.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlyear.DataSource = dt;
                ddlyear.DataValueField = "Year_Id";
                ddlyear.DataTextField = "Branch_Year_No";
                ddlyear.DataBind();
                ddlyear.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectSubject.Items.Clear();

            int yearId = Convert.ToInt32(ddlyear.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectSubject.DataSource = dt;
                ddlSubjectSubject.DataValueField = "Subject_Id";
                ddlSubjectSubject.DataTextField = "SubjectName";
                ddlSubjectSubject.DataBind();
                ddlSubjectSubject.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }       

        protected void ddlSubjectSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClearSubjectFielsd();
            int SubjectID = Convert.ToInt32(ddlSubjectSubject.SelectedValue);
            SqlDataReader dr = objEPBL.GetSubjectDataBySubjectID(SubjectID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                //txtSubRegDate.Text = dt.Rows[0]["Subject_RegDate"].ToString();
                DateTime SubRegDate = Convert.ToDateTime(dt.Rows[0]["Subject_RegDate"].ToString());
                txtSubRegDate.Text = SubRegDate.ToString("dd-MM-yyyy");
                txtsubUnits.Text = dt.Rows[0]["Subject_T_Units"].ToString();
                ddlSubjectStatus.SelectedItem.Text = dt.Rows[0]["Subject_Status"].ToString();
                //txtSubStatusDate.Text = dt.Rows[0]["Subject_Status_Date"].ToString();
                DateTime SubStatusDate = Convert.ToDateTime(dt.Rows[0]["Subject_Status_Date"].ToString());
                txtSubStatusDate.Text = SubStatusDate.ToString("dd-MM-yyyy");
                txtSubRemarks.Text = dt.Rows[0]["Subject_Remarks"].ToString();
                btnSubjectEdit.Text = "Update";

            }
        }

        protected void btnSubjectEdit_Click(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubjectSubject.SelectedValue);
            objSEBE.Subject_Id = SubjectID;
            objSEBE.Subject_RegDate = Convert.ToDateTime(txtSubRegDate.Text);
            objSEBE.Subject_T_Units = Convert.ToInt32(txtsubUnits.Text);
            objSEBE.Subject_Status = ddlSubjectStatus.SelectedValue;
            objSEBE.Subject_Status_Date =Convert.ToDateTime(txtSubStatusDate.Text);
            objSEBE.Subject_Remarks = txtSubRemarks.Text;
            SqlDataReader dr = objEPBL.UpdateSubjectData(objSEBE);           
            ClearSubjectFielsd();
            LoadNewProgamsDrpdown();
            ddlSubjectCategories.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();

            ddlSubjectCategories.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlBranch.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlyear.Items.Insert(0, new ListItem("--Select--", "0"));
            ddlSubjectSubject.Items.Insert(0, new ListItem("--Select--", "0"));

            btnSubjectEdit.Text = "Edit";
        }

        private void ClearSubjectFielsd()
        {
            txtSubRegDate.Text = "";
            txtsubUnits.Text = "";
            ddlSubjectStatus.SelectedIndex = -1;
            txtSubStatusDate.Text = "";
            txtSubRemarks.Text = "";
        }

        protected void btnSubjectDelete_Click(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubjectSubject.SelectedValue);
            SqlDataReader dr = objEPBL.DeleteSubjectData(SubjectID);
            ClearSubjectFielsd();
            LoadNewProgamsDrpdown();
            ddlSubjectCategories.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();

            ddlSubjectCategories.Items.Insert(0, new ListItem("---Select---", "0"));
            ddlBranch.Items.Insert(0, new ListItem("---Select---", "0"));
            ddlyear.Items.Insert(0, new ListItem("---Select---", "0"));
            ddlSubjectSubject.Items.Insert(0, new ListItem("---Select---", "0"));
        }

        protected void btnSubCancel_Click(object sender, EventArgs e)
        {
            ClearSubjectFielsd();
            LoadNewProgamsDrpdown();
            ddlSubjectCategories.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlSubjectSubject.Items.Clear();
        }

        #endregion Subjects

        #region Units

        //private void UnitsProgamsDrpdown()
        //{

        //    SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    ddlProgramsForUnits.DataSource = dt;
        //    ddlProgramsForUnits.DataValueField = "Program_id";
        //    ddlProgramsForUnits.DataTextField = "Program_name";
        //    ddlProgramsForUnits.DataBind();
        //    ddlProgramsForUnits.Items.Insert(0, "---Select---");

        //}

        protected void ddlProgramsForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategoriesForUnits.Items.Clear();
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
                ddlCategoriesForUnits.Items.Insert(0, "---Select---");
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
            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objEPBL.GetSubjectDataByID(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject_forUnits.DataSource = dt;
                ddlSubject_forUnits.DataValueField = "Subject_Id";
                ddlSubject_forUnits.DataTextField = "SubjectName";
                ddlSubject_forUnits.DataBind();
                ddlSubject_forUnits.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubject_forUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectId = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.GetUnitDetails(SubjectId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlUnits.DataSource = dt;
                ddlUnits.DataValueField = "Unit_Id";
                ddlUnits.DataTextField = "Unit_Name";
                ddlUnits.DataBind();
                ddlUnits.Items.Insert(0,new ListItem( "--Select--","0"));
            }
        }

        protected void ddlUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectId = Convert.ToInt32(ddlUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.GetUnitData(SubjectId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                //txtUnitRegDate.Text = dt.Rows[0]["Unit_Reg_Date"].ToString();
                DateTime unitsRegDate = Convert.ToDateTime(dt.Rows[0]["Unit_Reg_Date"].ToString());
                txtUnitRegDate.Text = unitsRegDate.ToString("yyyy-MM-dd");
                txtUnitSecName.Text = dt.Rows[0]["Section_Name"].ToString();
                txtTopicList.Text = dt.Rows[0]["Topics_List"].ToString();
                //txtUntStatusDat.Text = dt.Rows[0]["Unite_Status_Date"].ToString();
                DateTime unitsStatusgDate = Convert.ToDateTime(dt.Rows[0]["Unite_Status_Date"].ToString());
                txtUntStatusDat.Text = unitsStatusgDate.ToString("yyyy-MM-dd");
                ddlUnitStatus.SelectedItem.Text = dt.Rows[0]["Unit_Status"].ToString();
                txtUnitRemarks.Text = dt.Rows[0]["Unit_Remarks"].ToString();
                btnUnitEdit.Text = "Update";
            }
        }

        protected void btnUnitEdit_Click(object sender, EventArgs e)
        {
            objunits.Unit_Reg_Date = Convert.ToDateTime(txtUnitRegDate.Text);
            objunits.Unit_SectionName = txtUnitSecName.Text;
            objunits.Topics_List = txtTopicList.Text;
            objunits.Unit_Status = ddlUnitStatus.SelectedValue;
            objunits.Unite_Status_Date = Convert.ToDateTime(txtUntStatusDat.Text);
            objunits.Unit_Remarks = txtUnitRemarks.Text;
            objunits.Unit_Id = Convert.ToInt32(ddlUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.Update_Units(objunits);
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvUnits.DataSource = dt;
            gvUnits.DataBind();
            ClearUnits();
        }

        private void ClearUnits()
        {
            txtUnitRegDate.Text = "";
            txtUnitSecName.Text="";
            txtTopicList.Text = "";
            ddlUnitStatus.SelectedIndex = -1;
            txtUntStatusDat.Text = "";
            txtUnitRemarks.Text = "";
            ddlUnits.SelectedIndex = -1;

        }

        protected void btnUnitDelete_Click(object sender, EventArgs e)
        {
          
           SqlDataReader dr = objEPBL.DeleteUnit(Convert.ToInt32(ddlUnits.SelectedItem.Value));
           ClearUnits();
           ddlSubject_forUnits.Items.Clear();
           ddlUnits.Items.Clear();
           ddlUnitsYear.SelectedIndex = -1;
        }

        protected void btnUnitCancel_Click(object sender, EventArgs e)
        {
            ClearUnits();
        }

        #endregion Units 

        #region Year

        protected void ddlYearProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            int CategorieID = Convert.ToInt32(ddlYearCategory.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategorieID);
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
            
        }

        protected void ddlYearGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlYearSem.Items.Clear();
            int SubjectID = Convert.ToInt32(ddlYearGroup.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(SubjectID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlYearSem.DataSource = dt;
                ddlYearSem.DataValueField = "Year_Id";
                ddlYearSem.DataTextField = "Branch_Year_No";
                ddlYearSem.DataBind();
                ddlYearSem.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlYearSem_SelectedIndexChanged(object sender, EventArgs e)
        {
            int YearID = Convert.ToInt32(ddlYearSem.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearDetails(YearID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtYearSem.Text = dt.Rows[0]["Branch_Year_No"].ToString();
                txtYearSubjects.Text = dt.Rows[0]["Year_T_Subjects"].ToString();

            }

        }

        protected void btnUpdateYear_Click(object sender, EventArgs e)
        {
            if (ddlYearSem.SelectedItem.Value != "0")
            {
                SqlDataReader dr = objBL.UpdateYearDetails(Convert.ToInt32(ddlYearSem.SelectedItem.Value), txtYearSem.Text.Trim(), Convert.ToInt32(txtYearSubjects.Text));
                DataTable dt = new DataTable();
                dt.Load(dr);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Updated Successfully.');", true);
                ddlYearCategory.Items.Clear();
                ddlYearGroup.Items.Clear();
                ddlYearSem.Items.Clear();
                txtYearSem.Text = "";
                txtYearSubjects.Text = "";
                ddlYearProgram.SelectedIndex = -1;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Please select an Item to Update.');", true);
            }
        }

        protected void btnYearDelete_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = objEPBL.DeleteYearData(Convert.ToInt32(ddlYearSem.SelectedItem.Value));
            ddlyear.SelectedIndex = -1;
            ddlYearCategory.Items.Clear();
            ddlYearGroup.Items.Clear();
            ddlYearSem.Items.Clear();
            txtYearSem.Text = "";
            txtYearSubjects.Text = "";
        }

        protected void btnYearCancel_Click(object sender, EventArgs e)
        {
            ddlYearCategory.Items.Clear();
            ddlYearGroup.Items.Clear();
            ddlYearSem.Items.Clear();
            txtYearSem.Text = "";
            txtYearSubjects.Text = "";
            ddlYearProgram.SelectedIndex = -1;
        }

        #endregion Year

        #region Group

        protected void ddlGroupProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
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

        protected void ddlGroupCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            DDlGroupGroup.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlGroupCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DDlGroupGroup.DataSource = dt;
                DDlGroupGroup.DataValueField = "Branch_Id";
                DDlGroupGroup.DataTextField = "Branch_Name";
                DDlGroupGroup.DataBind();
                DDlGroupGroup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void DDlGroupGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            int GroupID = Convert.ToInt32(DDlGroupGroup.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupDetails(GroupID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtGroupName.Text = dt.Rows[0]["Branch_Name"].ToString();
                txtGroupYearsCount.Text = dt.Rows[0]["Branch_T_Years"].ToString();

            }
        }

        protected void btnEditGroup_Click(object sender, EventArgs e)
        {
            if (DDlGroupGroup.SelectedItem.Value != "0")
            {
                SqlDataReader dr = objBL.UpdateGroupDetails(Convert.ToInt32(DDlGroupGroup.SelectedItem.Value), txtGroupName.Text.Trim(), Convert.ToInt32(txtGroupYearsCount.Text));
                DataTable dt = new DataTable();
                dt.Load(dr);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Updated Successfully.');", true);
                ddlGroupCategories.Items.Clear();
                DDlGroupGroup.Items.Clear();
                txtGroupName.Text = "";
                txtGroupYearsCount.Text = "";
                ddlGroupProgram.SelectedIndex = -1;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Notification : Please select an Item to Update.');", true);
            }
        }

        protected void btnGroupCancel_Click(object sender, EventArgs e)
        {
            ddlGroupCategories.Items.Clear();
            DDlGroupGroup.Items.Clear();
            ddlGroupProgram.SelectedIndex = -1;
            txtGroupName.Text = "";
            txtGroupYearsCount.Text = "";
        }

        protected void btnGroupDelete_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = objEPBL.DeleteGroupsData(Convert.ToInt32(DDlGroupGroup.SelectedItem.Value));
            ddlGroupCategories.Items.Clear();
            DDlGroupGroup.Items.Clear();
            ddlGroupProgram.SelectedIndex = -1;
            txtGroupName.Text = "";
            txtGroupYearsCount.Text = "";
        }


        #endregion Group
    }
}