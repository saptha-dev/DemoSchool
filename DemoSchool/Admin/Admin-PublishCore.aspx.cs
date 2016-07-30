using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL.BL;
using System.Data.SqlClient;
using System.Data;

namespace PresentationLayer.Admin
{
    public partial class Admin_PublishCore : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        PublishBL objPublishBL = new PublishBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DataTable dt = new DataTable();
                GVStudents.DataSource = dt;
                GVStudents.DataBind();

                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}

            }
        }


        public void LoadDefalut()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlPrograms.DataSource = dt;
                ddlPrograms.DataValueField = "Program_id";
                ddlPrograms.DataTextField = "Program_name";

                ddlPrograms.DataBind();
                ddlPrograms.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void rdbList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdbList.SelectedValue == "1")
            {
                BtnPublish.Text = "Publish";
            }
            else if (rdbList.SelectedValue == "2")
            {
                BtnPublish.Text = "Un-Publish";
            }

            ddlItem.SelectedIndex = -1;
            ddlPrograms.Items.Clear();
            ddlCategory.Items.Clear();
            ddlSubjects.Items.Clear();
            ddlgroup.Items.Clear();
            ddlSemister.Items.Clear();
            ddlUnits.Items.Clear();
            clearLables();
            ddlRoles.Items.Clear();
            GVStudents.Visible = false;
            lblNorecords.Visible = false;
        }

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPrograms.Items.Clear();
            ddlCategory.Items.Clear();
            ddlSubjects.Items.Clear();
            ddlgroup.Items.Clear();
            ddlSemister.Items.Clear();
            ddlUnits.Items.Clear();
            lblNorecords.Visible = false;
            ddlRoles.Items.Clear();
            GVStudents.Visible = false;

            if (ddlItem.SelectedValue == "2")
            {
                PnlUnits.Visible = true;
            }
            else if (ddlItem.SelectedValue == "1")
            {
                PnlUnits.Visible = false;
            }

            LoadDefalut();
        }

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            ddlRoles.Items.Clear();
            lblNorecords.Visible = false;

            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(Convert.ToInt32(ddlPrograms.SelectedValue));

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
            GVStudents.Visible = false;
            ddlRoles.Items.Clear();
            lblNorecords.Visible = false;

            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlCategory.SelectedValue));

            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlgroup.DataSource = dt;
                ddlgroup.DataValueField = "Branch_Id";
                ddlgroup.DataTextField = "Branch_Name";

                ddlgroup.DataBind();
                ddlgroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            ddlRoles.Items.Clear();

            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlgroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSemister.DataSource = dt;
                ddlSemister.DataValueField = "Year_Id";
                ddlSemister.DataTextField = "Branch_Year_No";
                ddlSemister.DataBind();
                ddlSemister.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlSemister_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            ddlRoles.Items.Clear();
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(Convert.ToInt32(ddlSemister.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjects.DataSource = dt;
                ddlSubjects.DataValueField = "Subject_Id";
                ddlSubjects.DataTextField = "Subject_Name";
                ddlSubjects.DataBind();
                ddlSubjects.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        //protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    SqlDataReader dr = objBL.GetSubjectBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlCategory.SelectedValue));

        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlSubjects.DataSource = dt;
        //        ddlSubjects.DataValueField = "Subject_Id";
        //        ddlSubjects.DataTextField = "Subject_Name";

        //        ddlSubjects.DataBind();
        //        ddlSubjects.Items.Insert(0, new ListItem("---Select---", "0"));
        //    }
        //}

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            BindRoles();
            if (ddlItem.SelectedValue == "1")
            {

                SqlDataReader drsub = objBL.GetSelectedSubjectData(Convert.ToInt32(ddlSubjects.SelectedValue));
                DataTable dtSub = new DataTable();
                dtSub.Load(drsub);
                if (dtSub.Rows.Count > 0)
                {
                   // PanelUnits.Visible = false; ;
                    //Category Details

                    int id = int.Parse(dtSub.Rows[0]["Category_Id"].ToString());
                    lblValueCategoryName.Text = id + ": " + dtSub.Rows[0]["Category_Name"].ToString();
                    DateTime dts = Convert.ToDateTime(dtSub.Rows[0]["Category_Reg_Date"]);
                    lblvalueCateregDate.Text = dts.ToString("dd-MM-yyyy");
                    lblValuecateTSubjects.Text = dtSub.Rows[0]["Category_T_Subjects"].ToString();
                    lblValueCateEligibil.Text = dtSub.Rows[0]["Category_T_Eligible"].ToString();
                     DateTime dst = Convert.ToDateTime(dtSub.Rows[0]["Category_Srt_Date"].ToString());
                      lblValueCAteStartDate.Text = dst.ToString("dd-MM-yyyy");
                    DateTime dttm = Convert.ToDateTime(dtSub.Rows[0]["Category_End_Date"]);
                     lblvalueCAteEndDate.Text = dttm.ToString("dd-MM-yyyy"); 
                    lblvalueCateDuration.Text = dtSub.Rows[0]["Category_Duration"].ToString();
                    lblvaluecatestatus.Text = dtSub.Rows[0]["Category_Status"].ToString();
                    DateTime dtsm = Convert.ToDateTime(dtSub.Rows[0]["Category_Status_Date"]);
                    lblValuecatestatusDate.Text = dtsm.ToString("dd-MM-yyyy");
                    lblValueName.Text = dtSub.Rows[0]["Subject_Name"].ToString();//
                    DateTime dtlm = Convert.ToDateTime(dtSub.Rows[0]["Subject_RegDate"]);
                    lblValueReg_Date.Text = dtlm.ToString("dd-MM-yyyy");
                    DateTime dm = Convert.ToDateTime(dtSub.Rows[0]["Subject_Start_Date"].ToString());
                    lblValueStart_Date.Text = dm.ToString("dd-MM-yyyy");
                     DateTime dk = Convert.ToDateTime(dtSub.Rows[0]["Subject_End_Date"].ToString());
                    lblValueEnd_Date.Text = dk.ToString("dd-MM-yyyy");
                    lblValueStatus.Text = dtSub.Rows[0]["Subject_Status"].ToString();
                    DateTime dn = Convert.ToDateTime(dtSub.Rows[0]["Subject_Status_Date"].ToString());
                    lblValueStatus_Date.Text =  dn.ToString("dd-MM-yyyy");
                    //displaying Item info
                    //lblDisplay.Visible = true;
                    string Iteminfo = "* " + ddlPrograms.SelectedItem.Text + " / " + ddlCategory.SelectedItem.Text + " / " + ddlSubjects.SelectedItem.Text;

                    //lblDisplay.Text = Iteminfo;

                }
            }
            else if (ddlItem.SelectedValue == "2")
            {

                SqlDataReader dr = objBL.GetUnitDetails(Convert.ToInt32(ddlSubjects.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlUnits.DataSource = dt;
                    ddlUnits.DataValueField = "Unit_Id";
                    ddlUnits.DataTextField = "Unit_Name";

                    ddlUnits.DataBind();
                    ddlUnits.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
        }

        protected void ddlUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;

            SqlDataReader drunit = objBL.GetSelectedUnitsData(Convert.ToInt32(ddlUnits.SelectedValue), Convert.ToInt32(ddlSubjects.SelectedValue));
            DataTable dtUnit = new DataTable();
            dtUnit.Load(drunit);
            if (dtUnit.Rows.Count > 0)
            {

                // PanelUnits.Visible = true;

                //Category Details
                unitTable.Visible = true;
                int id = int.Parse(dtUnit.Rows[0]["Category_Id"].ToString());
                lblValueCategoryName.Text = id + ": " + dtUnit.Rows[0]["Category_Name"].ToString();
                lblvalueCateregDate.Text = dtUnit.Rows[0]["Category_Reg_Date"].ToString().Substring(0, 10);
                lblValuecateTSubjects.Text = dtUnit.Rows[0]["Category_T_Subjects"].ToString();
                lblValueCateEligibil.Text = dtUnit.Rows[0]["Category_T_Eligible"].ToString();
                lblValueCAteStartDate.Text = dtUnit.Rows[0]["Category_Srt_Date"].ToString().Substring(0, 10);
                lblvalueCAteEndDate.Text = dtUnit.Rows[0]["Category_End_Date"].ToString().Substring(0, 10);
                lblvalueCateDuration.Text = dtUnit.Rows[0]["Category_Duration"].ToString();
                lblvaluecatestatus.Text = dtUnit.Rows[0]["Category_Status"].ToString();
                lblValuecatestatusDate.Text = dtUnit.Rows[0]["Category_Status_Date"].ToString().Substring(0, 10);

                //Subject Data
                lblValueName.Text = dtUnit.Rows[0]["Subject_Name"].ToString();
                lblValueReg_Date.Text = dtUnit.Rows[0]["Subject_RegDate"].ToString().Substring(0, 10);
                lblValueStart_Date.Text = dtUnit.Rows[0]["Subject_Start_Date"].ToString().Substring(0, 10);
                lblValueEnd_Date.Text = dtUnit.Rows[0]["Subject_End_Date"].ToString().Substring(0, 10);
                lblValueStatus.Text = dtUnit.Rows[0]["Subject_Status"].ToString();
                lblValueStatus_Date.Text = dtUnit.Rows[0]["Subject_Status_Date"].ToString().Substring(0, 10);

                //Unit Data
                string sectionName = dtUnit.Rows[0]["Section_Name"].ToString();
                int Section_No = Convert.ToInt32(dtUnit.Rows[0]["Unit_Id"].ToString());
                lblValueSectionNoName.Text = Section_No + " ; " + sectionName;
                lblvalueUnitNo.Text = dtUnit.Rows[0]["Unit_Id"].ToString() + ':' + dtUnit.Rows[0]["Unit_Name"].ToString();
                //lblValueUnitName.Text = dtUnit.Rows[0]["Unit_Name"].ToString();
                lblValueUnitRegDate.Text = dtUnit.Rows[0]["Unit_Reg_Date"].ToString().Substring(0, 10);
                lblValueunitStatusDate.Text = dtUnit.Rows[0]["Unite_Status_Date"].ToString().Substring(0, 10);
                lblValueUnitStatus.Text = dtUnit.Rows[0]["Unit_Status"].ToString();
                lblValueTopicsList.Text = dtUnit.Rows[0]["Topics_List"].ToString();


                //displaying Item info
                // lblDisplay.Visible = true;
                string Iteminfo = "* " + ddlPrograms.SelectedItem.Text + " / " + ddlCategory.SelectedItem.Text + " / " + ddlSubjects.SelectedItem.Text + " / " + ddlUnits.SelectedItem.Text; ;

                //  lblDisplay.Text = Iteminfo;

            }
        }

        protected void gvItem_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {

        }

        private void BindPublishSubjectStudents()
        {
            SqlDataReader dr = objPublishBL.GetStudentsIdBySubjects(int.Parse(ddlSubjects.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTSubjectsStudents"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindUnPublishSubjectStudents()
        {
            SqlDataReader dr = objPublishBL.GetUnPublishStudentsIdBySubjects(int.Parse(ddlSubjects.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTSubjectsStudentsUnPublish"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindPublishUnitStudents()
        {
            SqlDataReader dr = objPublishBL.GetStudentsIdByUnits(int.Parse(ddlUnits.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTUnitsStudents"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindunPublishUnitStudents()
        {
            SqlDataReader dr = objPublishBL.GetUnpublishStudentsIdByUnits(int.Parse(ddlUnits.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTUnitsStudentsUnPublish"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindPublishSubjectFaculty()
        {
            SqlDataReader dr = objPublishBL.GetFacultyBySubjects(int.Parse(ddlSubjects.SelectedValue), "UnPublish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTSubjectsFaculty"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindUnPublishSubjectFaculty()
        {
            SqlDataReader dr = objPublishBL.GetFacultyBySubjects(int.Parse(ddlSubjects.SelectedValue), "Publish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTSubjectsFacultyUnPublish"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindPublishUnitFaculty()
        {
            SqlDataReader dr = objPublishBL.GetFacultyByUnits(int.Parse(ddlUnits.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTUnitsFaculty"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void BindUnPublishUnitFaculty()
        {
            SqlDataReader dr = objPublishBL.GetUnpublishFacultyIdByUnits(int.Parse(ddlUnits.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTUnitsFacultyUnPublish"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void GetStudentsAfterPublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsStudents"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetSubjectsStudentsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetStudentsAfterUnPublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsStudentsUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetSubjectsStudentsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetStudentsAfterPublishUnits()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsStudents"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetUnitsStudentsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetStudentsAfterUnPublishUnits()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsStudentsUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetUnitsStudentsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetFacultyAfterPublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsFaculty"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetSubjectsFacultyAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetFacultyAfterUnPublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsFacultyUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetSubjectsFacultyAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetFacultyAfterPublishUnits()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsFaculty"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetUnitsFacultyAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        private void GetFacultyAfterUnPublishUnits()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsFacultyUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][5].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetUnitsFacultyAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVStudents.DataSource = dt;
                    GVStudents.DataBind();
                    GVStudents.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblNorecords.Visible = false;
            GVCompany.Visible = false;
            if (ddlRoles.SelectedValue == "1") //Student
            {
                BtnPublish.Text = "Publish";
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindPublishSubjectStudents();

                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindPublishUnitStudents();

                    }
                }         //PublishRadioButton

                else if (rdbList.SelectedValue == "2") //UnPublishRadioButton
                {
                    BtnPublish.Text = "Un-Publish";
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindUnPublishSubjectStudents();

                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindunPublishUnitStudents();

                    }
                }    //Un-PublishRadioButton
            }
            if (ddlRoles.SelectedValue == "2") //Faculty
            {
                BtnPublish.Text = "Publish";
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindPublishSubjectFaculty();
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindPublishUnitFaculty();
                    }
                }         //PublishRadioButton

                else if (rdbList.SelectedValue == "2")        //UnPublishRadioButton
                {
                    BtnPublish.Text = "Un-Publish";
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindUnPublishSubjectFaculty();
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindUnPublishUnitFaculty();
                    }
                }
            }
            if (ddlRoles.SelectedValue == "3") //Company
            {
                GVStudents.Visible = false;
                if (rdbList.SelectedValue == "1")
                {
                    BindPublishCompanySubject();
                }
                else
                {
                    BindUnPublishCompanySubject();
                }
            }
        }

        private void BindPublishCompanySubject()
        {
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader dr = objPublishBL.GetCompanySubjectsPublish(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVCompany.Visible = true;
                GVCompany.DataSource = dt;
                GVCompany.DataBind();
            }
            else
            {
                lblNorecords.Visible = true;
            }
        }

        private void BindUnPublishCompanySubject()
        {
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader dr = objPublishBL.GetCompanySubjectsUnPublish(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVCompany.Visible = true;
                GVCompany.DataSource = dt;
                GVCompany.DataBind();
            }
            else
            {
                lblNorecords.Visible = true;
            }
        }

        private void PublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsStudents"];
            DataTable dtunitsdata = new DataTable();
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader drUnits = objPublishBL.GetUnitsBySubjectsPublish(ddlSubjects.SelectedValue.Trim());
            DataTable dtUnits = new DataTable();
            dtUnits.Load(drUnits);
            string strUnits = string.Empty;
            for (int i = 0; i < dtUnits.Rows.Count; i++)
            {
                strUnits = strUnits + dtUnits.Rows[i][0].ToString();
                strUnits += (i < dtUnits.Rows.Count - 1) ? "," : string.Empty;
            }


            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);
                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.UpdateStudentPublishBySubjects(StdID, SubjectID);
                        dtunitsdata.Rows.Clear();
                        SqlDataReader drstdntunits = objPublishBL.GetUnitsDataByStudentId(StdID, strUnits);
                        dtunitsdata.Load(drstdntunits);
                        for (int i = 0; i < dtUnits.Rows.Count; i++)
                        {
                            dtUnits.Rows[i][0].ToString();
                            int searchAuthor = Convert.ToInt32(dtUnits.Rows[i][0].ToString());
                            bool contains = dtunitsdata.AsEnumerable()
                                           .Any(rowSearch => searchAuthor == rowSearch.Field<int>("Unit_Id"));
                            if (contains == true)
                            {
                                objPublishBL.PublishUnitsBySubjects(StdID, searchAuthor);
                            }

                        }

                    }
                }
                // ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Subject Published Successfully');", true);
            }

        }

        private void PublishUnit()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsStudents"];
            int UnitID = Convert.ToInt32(ddlUnits.SelectedValue.Trim());
            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);

                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.PublishUnitsBySubjects(StdID, UnitID);

                    }

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);

        }

        private void UnPublishSubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsStudentsUnPublish"];
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader drUnits = objPublishBL.GetUnitsBySubjectsPublish(ddlSubjects.SelectedValue.Trim());
            DataTable dtUnits = new DataTable();
            dtUnits.Load(drUnits);
            string strUnits = string.Empty;
            for (int i = 0; i < dtUnits.Rows.Count; i++)
            {
                strUnits = strUnits + dtUnits.Rows[i][0].ToString();
                strUnits += (i < dtUnits.Rows.Count - 1) ? "," : string.Empty;
            }

            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);
                        int StdID = Convert.ToInt32(dr[0][0]);

                        objPublishBL.UpdateStudentUnPublishBySubjects(StdID, SubjectID);
                        dtUnits.Rows.Clear();
                        SqlDataReader drstdntunits = objPublishBL.GetUnitsDataByStudentIdUnPublish(StdID, strUnits);
                        dtUnits.Load(drstdntunits);
                        for (int i = 0; i < dtUnits.Rows.Count; i++)
                        {
                            dtUnits.Rows[i][0].ToString();
                            int searchAuthor = Convert.ToInt32(dtUnits.Rows[i][0].ToString());
                            objPublishBL.UnPublishUnitsBySubjects(StdID, searchAuthor);

                        }

                    }

                }
            }
            // ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Subject Un-Published Successfully');", true);
        }

        private void UnPublishUnit()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsStudentsUnPublish"];
            int UnitID = Convert.ToInt32(ddlUnits.SelectedValue.Trim());
            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);

                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.UnPublishUnitsBySubjects(StdID, UnitID);

                    }

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);
        }

        private void PublishFacultySubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsFaculty"];
            DataTable dtunitsdata = new DataTable();
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader drUnits = objPublishBL.GetUnitsBySubjectsPublish(ddlSubjects.SelectedValue.Trim());
            DataTable dtUnits = new DataTable();
            dtUnits.Load(drUnits);
            string strUnits = string.Empty;
            for (int i = 0; i < dtUnits.Rows.Count; i++)
            {
                strUnits = strUnits + dtUnits.Rows[i][0].ToString();
                strUnits += (i < dtUnits.Rows.Count - 1) ? "," : string.Empty;
            }


            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);
                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.UpdateFacultyPublishBySubjects(StdID, SubjectID);
                        dtunitsdata.Rows.Clear();
                        SqlDataReader drstdntunits = objPublishBL.GetUnitsDataByStudentId(StdID, strUnits);
                        dtunitsdata.Load(drstdntunits);
                        for (int i = 0; i < dtUnits.Rows.Count; i++)
                        {
                            dtUnits.Rows[i][0].ToString();
                            int searchAuthor = Convert.ToInt32(dtUnits.Rows[i][0].ToString());
                            bool contains = dtunitsdata.AsEnumerable()
                                           .Any(rowSearch => searchAuthor == rowSearch.Field<int>("Unit_Id"));

                            objPublishBL.PublishUnitsBySubjects(StdID, searchAuthor);

                        }

                    }
                }
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Subject Published Successfully');", true);
            }
        }

        private void UnPublishFacultySubject()
        {
            DataTable dtStudents = (DataTable)ViewState["DTSubjectsFacultyUnPublish"];
            int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue.Trim());
            SqlDataReader drUnits = objPublishBL.GetUnitsBySubjectsPublish(ddlSubjects.SelectedValue.Trim());
            DataTable dtUnits = new DataTable();
            dtUnits.Load(drUnits);
            string strUnits = string.Empty;
            for (int i = 0; i < dtUnits.Rows.Count; i++)
            {
                strUnits = strUnits + dtUnits.Rows[i][0].ToString();
                strUnits += (i < dtUnits.Rows.Count - 1) ? "," : string.Empty;
            }

            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);
                        int StdID = Convert.ToInt32(dr[0][0]);

                        objPublishBL.UpdateFacultyUnPublishBySubjects(StdID, SubjectID);
                        dtUnits.Rows.Clear();
                        SqlDataReader drstdntunits = objPublishBL.GetUnitsDataByFacultyIdUnPublish(StdID, strUnits);
                        dtUnits.Load(drstdntunits);
                        for (int i = 0; i < dtUnits.Rows.Count; i++)
                        {
                            dtUnits.Rows[i][0].ToString();
                            int searchAuthor = Convert.ToInt32(dtUnits.Rows[i][0].ToString());
                            objPublishBL.UnPublishUnitsBySubjects(StdID, searchAuthor);

                        }

                    }

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Subject Un-Published Successfully');", true);
        }

        private void PublishFacultyUnit()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsFaculty"];
            int UnitID = Convert.ToInt32(ddlUnits.SelectedValue.Trim());
            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);

                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.PublishUnitsForFaculty(StdID, UnitID);

                    }

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);

        }

        private void UnPublishFacultyUnit()
        {
            DataTable dtStudents = (DataTable)ViewState["DTUnitsFacultyUnPublish"];
            int UnitID = Convert.ToInt32(ddlUnits.SelectedValue.Trim());
            foreach (GridViewRow row in GVStudents.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        string id = row.Cells[1].Text;
                        DataRow[] dr = dtStudents.Select("DetailsID = " + id);

                        int StdID = Convert.ToInt32(dr[0][0]);
                        objPublishBL.UnPublishUnitsFaculty(StdID, UnitID);

                    }

                }
            }
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);
        }

        private void PublishCompanySubject()
        {
            string IDs = "";

            foreach (GridViewRow row in GVCompany.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    Label SNO = (Label)chkRow.FindControl("ID");
                    int a = Convert.ToInt32(SNO.Text);
                    if (IDs == "")
                    {
                        IDs = a.ToString();
                    }
                    else
                    {
                        IDs = IDs + "," + a;
                    }
                    if (chkRow.Checked)
                    {
                        objPublishBL.PublishCompanySubjects(a);
                    }
                }
            }
            if (IDs != "")
            {
                SqlDataReader dr = objPublishBL.GetCompanySubjectsAfterPublish(IDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                GVCompany.DataSource = dt;
                GVCompany.DataBind();
            }


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);
        }

        private void UnPublishCompanySubject()
        {
            string IDs = "";

            foreach (GridViewRow row in GVCompany.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    Label SNO = (Label)chkRow.FindControl("ID");
                    int a = Convert.ToInt32(SNO.Text);
                    if (IDs == "")
                    {
                        IDs = a.ToString();
                    }
                    else
                    {
                        IDs = IDs + "," + a;
                    }
                    if (chkRow.Checked)
                    {
                        objPublishBL.UnPublishCompanySubjects(a);
                    }
                }

            }
            if (IDs != "")
            {
                SqlDataReader dr = objPublishBL.GetCompanySubjectsAfterPublish(IDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                GVCompany.DataSource = dt;
                GVCompany.DataBind();
            }


            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Unit Published Successfully');", true);
        }



        protected void BtnPublish_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlRoles.SelectedValue == "1") //Student
                {
                    if (rdbList.SelectedValue == "1")
                    {
                        if (ddlItem.SelectedValue == "1")
                        {
                            PublishSubject();
                            GetStudentsAfterPublishSubject();
                        }
                        else if (ddlItem.SelectedValue == "2")
                        {
                            PublishUnit();
                            GetStudentsAfterPublishUnits();
                        }
                    }
                    else if (rdbList.SelectedValue == "2")
                    {
                        if (ddlItem.SelectedValue == "1")
                        {
                            UnPublishSubject();
                            GetStudentsAfterUnPublishSubject();
                        }
                        else if (ddlItem.SelectedValue == "2")
                        {
                            UnPublishUnit();
                            GetStudentsAfterUnPublishUnits();
                        }
                    }
                }
                else if (ddlRoles.SelectedValue == "2") //Faculty
                {
                    if (rdbList.SelectedValue == "1")
                    {
                        if (ddlItem.SelectedValue == "1")
                        {
                            PublishFacultySubject();
                            GetFacultyAfterPublishSubject();
                        }
                        else if (ddlItem.SelectedValue == "2")
                        {
                            PublishFacultyUnit();
                            GetFacultyAfterPublishUnits();
                        }
                    }
                    else if (rdbList.SelectedValue == "2")
                    {
                        if (ddlItem.SelectedValue == "1")
                        {
                            UnPublishFacultySubject();
                            GetFacultyAfterUnPublishSubject();
                        }
                        else if (ddlItem.SelectedValue == "2")
                        {
                            UnPublishFacultyUnit();
                            GetFacultyAfterUnPublishUnits();
                        }
                    }
                }
                else if (ddlRoles.SelectedValue == "3") //Company
                {
                    GVStudents.Visible = false;
                    if (rdbList.SelectedValue == "1")
                    {
                        PublishCompanySubject();
                    }
                    else
                    {
                        UnPublishCompanySubject();
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearLables();
        }

        public void clearLables()
        {
            //Category Data
            lblValueCategoryName.Text = "";
            lblvalueCateregDate.Text = "";
            lblValuecateTSubjects.Text = "";
            lblValueCateEligibil.Text = "";
            lblValueCAteStartDate.Text = "";
            lblvalueCAteEndDate.Text = "";
            lblvalueCateDuration.Text = "";
            lblvaluecatestatus.Text = "";
            lblValuecatestatusDate.Text = "";

            //Subject Data
            lblValueName.Text = "";
            lblValueReg_Date.Text = "";
            lblValueStart_Date.Text = "";
            lblValueEnd_Date.Text = "";
            lblValueStatus.Text = "";
            lblValueStatus_Date.Text = "";

            //Unit Data

            lblValueSectionNoName.Text = "";
            lblvalueUnitNo.Text = "";
           // lblValueUnitName.Text = "";
            lblValueUnitRegDate.Text = "";
            lblValueunitStatusDate.Text = "";
            lblValueUnitStatus.Text = "";
            lblValueTopicsList.Text = "";

        }

        private void BindRoles()
        {
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");

            DataRow drStd = dt.NewRow();
            drStd["ID"] = "1";
            drStd["Name"] = "Student";
            dt.Rows.Add(drStd);
            DataRow drFclty = dt.NewRow();
            drFclty["ID"] = "2";
            drFclty["Name"] = "Faculty";
            dt.Rows.Add(drFclty);

            if (ddlItem.SelectedValue != "2")
            {
                DataRow drCmpny = dt.NewRow();
                drCmpny["ID"] = "3";
                drCmpny["Name"] = "Company";
                dt.Rows.Add(drCmpny);
            }

            ddlRoles.DataSource = dt;
            ddlRoles.DataValueField = "ID";
            ddlRoles.DataTextField = "Name";
            ddlRoles.DataBind();
            ddlRoles.Items.Insert(0, new ListItem("--Select--", "0"));

        }

    }
}