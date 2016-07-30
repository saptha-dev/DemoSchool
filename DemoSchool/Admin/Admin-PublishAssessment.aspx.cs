using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;

namespace PresentationLayer.Admin
{
    public partial class Admin_PublishAssessment : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        PublishBL objPublishBL = new PublishBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


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

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPrograms.Items.Clear();
            ddlCategory.Items.Clear();
            ddlSubjects.Items.Clear();
            ddlgroup.Items.Clear();
            ddlSemister.Items.Clear();
            GVStudents.Visible = false;
            ddlRoles.SelectedIndex = -1;
            GVGrades.Visible = false;
            GVQuestions.Visible = false;
            lblNorecordsQstns.Visible = false;
            ddlSemister.Visible = true;
            lblsemYear.Visible = true;
            pnlBkngGV.Visible = false;

            LoadDefalut();
            pnlSubject.Visible = true;
            PnlTestType.Visible = false;
            pnlBookingSlot.Visible = false;

            sampletestPanel.Visible = false;
            PnlResults.Visible = false;
            GradesPanel.Visible = false;

            if (ddlItem.SelectedValue == "4")
            {
                 PnlTestType.Visible = false;
                // pnlSet.Visible = false;
                sampletestPanel.Visible = false;
                PnlResults.Visible = false;
                pnlSubject.Visible = false;
                ddlSemister.Visible = false;
                lblsemYear.Visible = false;
            }
            else if (ddlItem.SelectedValue == "5")
            {
                sampletestPanel.Visible = false;
                PnlResults.Visible = false;
                GradesPanel.Visible = false;
                pnlBookingSlot.Visible = true;
                pnlBkngGV.Visible = true;

                if (rdbList.SelectedItem.Value == "1")
                {
                    lblmultiCompany.Visible = true;
                    ddlsessions.Visible = true;
                    lblbkngcompany.Visible = false;
                    ddlBkngCompany.Visible = false;
                    btnBkngPublish.Text = "Publish";
                    lblbkngasighSessions.Text = "Asign-Sessions";
                }
                else
                {
                    lblmultiCompany.Visible = false;
                    ddlsessions.Visible = false;
                    lblbkngcompany.Visible = true;
                    ddlBkngCompany.Visible = true;
                    btnBkngPublish.Text = "Un-Publish";
                    lblbkngasighSessions.Text = "Minus-Sessions";
                }

            }

        } 

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
            GVGrades.Visible = false;
            GVQuestions.Visible = false;


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
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
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
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;

            if (ddlItem.SelectedValue == "4")
            {
                if (rdbList.SelectedValue == "1")
                {
                    SqlDataReader dr = objPublishBL.GetGradeToPublishData(Convert.ToInt32(ddlgroup.SelectedValue), "Publish");
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        GradesPanel.Visible = true;
                        GVGrades.DataSource = dt;
                        ViewState["DTGrades"] = dt;
                        GVGrades.Visible = true;
                        GVGrades.DataBind();
                    }
                    else
                    {
                        GradesPanel.Visible = false;
                    }
                }
                else if (rdbList.SelectedValue == "2")
                {
                    SqlDataReader dr = objPublishBL.GetGradeToPublishData(Convert.ToInt32(ddlgroup.SelectedValue), "UnPublish");
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        GradesPanel.Visible = true;
                        GVGrades.DataSource = dt;
                        ViewState["DTGrades"] = dt;
                        GVGrades.Visible = true;
                        GVGrades.DataBind();
                    }
                    else
                    {
                        GradesPanel.Visible = false;
                    }
                }
            }
            else
            {
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
        }

        protected void ddlSemister_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
            if (ddlItem.SelectedValue == "4")
            {
                if (rdbList.SelectedValue == "1")
                {
                    SqlDataReader dr = objPublishBL.GetGradeToPublishData(Convert.ToInt32(ddlSemister.SelectedValue),"Publish");
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        GradesPanel.Visible = true;
                        GVGrades.DataSource = dt;
                        ViewState["DTGrades"] = dt;
                        GVGrades.Visible = true;
                        GVGrades.DataBind();
                    }
                    else
                    {
                        GradesPanel.Visible = false;
                    }
                }
                else if (rdbList.SelectedValue == "2")
                {
                    SqlDataReader dr = objPublishBL.GetGradeToPublishData(Convert.ToInt32(ddlSemister.SelectedValue), "UnPublish");
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        GradesPanel.Visible = true;
                        GVGrades.DataSource = dt;
                        ViewState["DTGrades"] = dt;
                        GVGrades.Visible = true;
                        GVGrades.DataBind();
                    }
                    else
                    {
                        GradesPanel.Visible = false;
                    }
                }
            }
            else
            {
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
        }

        private void BindPublishSampleTestStudents()
        {

            SqlDataReader dr = objPublishBL.GetStudentToPublishTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTTestStudents"] = dt;
                lblNorecordsStudents.Visible = false;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecordsStudents.Visible = true;
                GVStudents.Visible = false;
            }

            SqlDataReader dr1 = objPublishBL.GetStudentToPublishQstns(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "UnPublish");
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                GVQuestions.DataSource = dt1;
                GVQuestions.DataBind();
                ViewState["DTTestQstnsStudents"] = dt1;
                GVQuestions.Visible = true;
                lblNorecordsQstns.Visible = false;
            }
            else
            {
                lblNorecordsQstns.Visible = true;
                GVQuestions.Visible = false;
            }

        }

        private void BindPublishFinalTestStudents()
        {
            SqlDataReader dr = objPublishBL.GetStudentToPublishTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest");

            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTTestStudents"] = dt;
                lblNorecordsStudents.Visible = false;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecordsStudents.Visible = true;
                GVStudents.Visible = false;
            }

            SqlDataReader dr1 = objPublishBL.GetStudentToPublishQstns(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "UnPublish");
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                GVQuestions.DataSource = dt1;
                GVQuestions.DataBind();
                ViewState["DTTestQstnsStudents"] = dt1;
                GVQuestions.Visible = true;
                lblNorecordsQstns.Visible = false;
            }
            else
            {
                lblNorecordsQstns.Visible = true;
                GVQuestions.Visible = false;
            }
        }

        private void BindUnPublishSampleTestStudents()
        {
            SqlDataReader dr = objPublishBL.GetStudentToUnPublishTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTTestStudents"] = dt;
                lblNorecordsStudents.Visible = false;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecordsStudents.Visible = true;
                GVStudents.Visible = false;
            }
            SqlDataReader dr1 = objPublishBL.GetStudentToPublishQstns(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "Publish");
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                GVQuestions.DataSource = dt1;
                GVQuestions.DataBind();
                ViewState["DTTestQstnsStudents"] = dt1;
                GVQuestions.Visible = true;
                lblNorecordsQstns.Visible = false;
            }
            else
            {
                lblNorecordsQstns.Visible = true;
                GVQuestions.Visible = false;
            }
        }

        private void BindUnPublishFinalTestStudents()
        {

            SqlDataReader dr = objPublishBL.GetStudentToUnPublishTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTTestStudents"] = dt;
                lblNorecordsStudents.Visible = false;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecordsStudents.Visible = true;
                GVStudents.Visible = false;
            }
            SqlDataReader dr1 = objPublishBL.GetStudentToPublishQstns(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "Publish");
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                GVQuestions.DataSource = dt1;
                GVQuestions.DataBind();
                ViewState["DTTestQstnsStudents"] = dt1;
                GVQuestions.Visible = true;
                lblNorecordsQstns.Visible = false;
            }
            else
            {
                lblNorecordsQstns.Visible = true;
                GVQuestions.Visible = false;
            }
        }

        private void GetStudentTestAfterPublish()
        {

            DataTable dtStudents = (DataTable)ViewState["DTTestStudents"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentAfterPublishTest(strIDs);
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
                    //lblNorecords.Visible = true;
                    GVStudents.Visible = false;
                }
            }
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;



            if (ddlItem.SelectedValue == "1")
            {
                //pnlSet.Visible = true;
                sampletestPanel.Visible = true;
                PnlResults.Visible = false;
                GradesPanel.Visible = false;
                pnlBookingSlot.Visible = false;
            }
            else if (ddlItem.SelectedValue == "2")
            {
                //pnlSet.Visible = true;
                sampletestPanel.Visible = true;
                PnlResults.Visible = false;
                GradesPanel.Visible = false;
                pnlBookingSlot.Visible = false;
            }
            else if (ddlItem.SelectedValue == "3")
            {
                PnlTestType.Visible = true;
                // pnlSet.Visible = true;

                sampletestPanel.Visible = false;
                PnlResults.Visible = true;
                GradesPanel.Visible = false;
                pnlBookingSlot.Visible = false;
            }
            else if (ddlItem.SelectedValue == "4")
            {
                PnlTestType.Visible = false;
                // pnlSet.Visible = false;
                sampletestPanel.Visible = false;
                PnlResults.Visible = false;
                pnlSubject.Visible = false;
                ddlSemister.Visible = false;
                lblsemYear.Visible = false;
                pnlBookingSlot.Visible = false;
            }
            else if (ddlItem.SelectedValue == "5")
            {
                GetBkngDates();
                
            }
        }   

        protected void ddlTesttype_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;

            if (ddlPrograms.SelectedItem.Text != "" && ddlCategory.SelectedItem.Text != "" && ddlgroup.SelectedItem.Text != "")
            {
                lblDisplay.Visible = true;
                string display = ddlPrograms.SelectedItem.Text + " / " + ddlCategory.SelectedItem.Text + " / " + ddlgroup.SelectedItem.Text + " / " ;
                lblDisplay.Text = display;
                if (ddlItem.SelectedValue == "3")
                {
                    GetResultData();
                }
            }
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedValue == "1") //Student
            {
                // BtnPublish.Text = "Publish";
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindPublishSampleTestStudents();
                        GVStudents.Visible = true;
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindPublishFinalTestStudents();
                        GVStudents.Visible = true;
                    }
                }         //PublishRadioButton

                else if (rdbList.SelectedValue == "2") //UnPublishRadioButton
                {
                    // BtnPublish.Text = "Un-Publish";
                    if (ddlItem.SelectedValue == "1")
                    {
                        BindUnPublishSampleTestStudents();
                        GVStudents.Visible = true;
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        BindUnPublishFinalTestStudents();
                        GVStudents.Visible = true;
                    }
                }    //Un-PublishRadioButton
            }

        }

        private void UpdateQstn()
        {
            string SelectedIDs = "";
            foreach (GridViewRow row in GVQuestions.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        if (SelectedIDs == "")
                        {
                            SelectedIDs = row.Cells[1].Text;
                        }
                        else
                        {
                            SelectedIDs = SelectedIDs + "," + row.Cells[1].Text;
                        }
                    }
                }
            }
            if (SelectedIDs != "")
            {
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlItem.SelectedValue == "1")
                    {
                        SqlDataReader dr = objPublishBL.UpdateQstnsPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()),  "SampleTest", "Publish", SelectedIDs);
                        GetQstnsAfterPublish();
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        SqlDataReader dr = objPublishBL.UpdateQstnsPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "Publish", SelectedIDs);
                        GetQstnsAfterPublish();
                    }
                }         //PublishRadioButton

                else if (rdbList.SelectedValue == "2") //UnPublishRadioButton
                {
                    // BtnPublish.Text = "Un-Publish";
                    if (ddlItem.SelectedValue == "1")
                    {
                        SqlDataReader dr = objPublishBL.UpdateQstnsPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "UnPublish", SelectedIDs);
                        GetQstnsAfterPublish();
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        SqlDataReader dr = objPublishBL.UpdateQstnsPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "UnPublish", SelectedIDs);
                        GetQstnsAfterPublish();
                    }
                } 
            }
        }

        private void GetQstnsAfterPublish()
        {
            DataTable dtStudents = (DataTable)ViewState["DTTestQstnsStudents"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][0].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetQstnsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVQuestions.DataSource = dt;
                    GVQuestions.DataBind();
                    GVQuestions.Visible = true;
                }
                else
                {
                    lblNorecordsQstns.Visible = true;
                    GVQuestions.Visible = false;
                }
            }

        }

        protected void BtnPublishQstn_Click(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedValue == "1") //Student
            {
                // BtnPublish.Text = "Publish";
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlItem.SelectedValue == "1")
                    {
                        UpdateQstn();
                        GVQuestions.Visible = true;
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                        UpdateQstn();
                        GVQuestions.Visible = true;
                    }
                }         //PublishRadioButton

                else if (rdbList.SelectedValue == "2") //UnPublishRadioButton
                {
                    // BtnPublish.Text = "Un-Publish";
                    if (ddlItem.SelectedValue == "1")
                    {
                       UpdateQstn();
                        GVQuestions.Visible = true;
                    }
                    else if (ddlItem.SelectedValue == "2")
                    {
                       UpdateQstn();
                        GVQuestions.Visible = true;
                    }
                }    //Un-PublishRadioButton
            }
        }           

        protected void btnQstnCancel_Click(object sender, EventArgs e)
        {

        }

        private void GetResultData()
        {
            
            DataTable dt = new DataTable();
             if (rdbList.SelectedValue == "1")
                {
                    BtnSoultions.Text = "Publish";
                    if (ddlTesttype.SelectedValue == "1")   //SampleTest
                    {
                        SqlDataReader dr = objPublishBL.ResultPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "UnPublish");
                        dt.Load(dr);
                        if (dt.Rows.Count > 0)
                        {
                            GVResults.DataSource = dt;
                            GVResults.DataBind();
                            GVResults.Visible = true;
                            lblNoRecordsResult.Visible = false;
                        }
                        else
                        {
                            lblNoRecordsResult.Visible = true;
                        }


                        SqlDataReader dr1 = objPublishBL.GetStudentSolutionsToTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "UnPublish");
                        DataTable dtSolutions = new DataTable();
                        dtSolutions.Load(dr1);
                        if (dtSolutions.Rows.Count > 0)
                        {
                            GVSolutions.DataSource = dtSolutions;
                            GVSolutions.DataBind();
                            ViewState["TestResult"] = dt;
                            GVSolutions.Visible = true;
                            lblNoRecordsResult.Visible = false;
                        }
                        else
                        {
                            lblNoRecordsResult.Visible = true;
                        }
                    }
                    else if (ddlTesttype.SelectedValue == "2")
                    {
                        SqlDataReader dr = objPublishBL.ResultPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "UnPublish");
                        dt.Load(dr);
                        if (dt.Rows.Count > 0)
                        {
                            GVResults.DataSource = dt;
                            GVResults.DataBind();
                            GVResults.Visible = true;
                            lblNoRecordsResult.Visible = false;
                        }
                        else
                        {
                            lblNoRecordsResult.Visible = true;
                        }

                        SqlDataReader dr2 = objPublishBL.GetDataResultCertificatePublish(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "UnPublish");
                        DataTable dt2 = new DataTable();
                        dt2.Load(dr2);
                        if (dt2.Rows.Count > 0)
                        {
                            gvresultCertificate.DataSource = dt2;
                            gvresultCertificate.DataBind();
                            gvresultCertificate.Visible = true;
                            lblResultCertificate.Visible = false;
                            btnPublishCertificate.Visible = true;
                            btnCancelCertificate.Visible = true;
                        }
                        else
                        {
                            lblResultCertificate.Visible = true;
                            btnPublishCertificate.Visible = false;
                            btnCancelCertificate.Visible = false;
                        }



                        SqlDataReader dr1 = objPublishBL.GetStudentSolutionsToTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "UnPublish");
                        DataTable dtSolutions = new DataTable();
                        dtSolutions.Load(dr1);
                        if (dtSolutions.Rows.Count > 0)
                        {
                            GVSolutions.DataSource = dtSolutions;
                            GVSolutions.DataBind();
                            ViewState["TestResult"] = dt;
                            GVSolutions.Visible = true;
                            lblNoRecordsResult.Visible = false;
                        }
                        else
                        {
                            lblNoRecordsResult.Visible = true;
                        }
                    }
                }         //PublishRadioButton

             else if (rdbList.SelectedValue == "2") //UnPublishRadioButton
             {
                 BtnSoultions.Text = "Un-Publish";
                 if (ddlTesttype.SelectedValue == "1")
                 {
                     SqlDataReader dr = objPublishBL.ResultPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "Publish");
                     dt.Load(dr);
                     if (dt.Rows.Count > 0)
                     {
                         GVResults.DataSource = dt;
                         GVResults.DataBind();
                         GVResults.Visible = true;
                     }
                     SqlDataReader dr1 = objPublishBL.GetStudentSolutionsToTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest", "Publish");
                     DataTable dtSolutions = new DataTable();
                     dtSolutions.Load(dr1);
                     if (dtSolutions.Rows.Count > 0)
                     {
                         GVSolutions.DataSource = dtSolutions;
                         GVSolutions.DataBind();
                         ViewState["TestResult"] = dt;
                         GVSolutions.Visible = true;
                         lblNoRecordsResult.Visible = false;

                     }
                     else
                     {
                         lblNoRecordsResult.Visible = true;
                     }


                 }
                 else if (ddlTesttype.SelectedValue == "2")
                 {
                     SqlDataReader dr = objPublishBL.ResultPublish(Convert.ToInt32(ddlCategory.SelectedValue.Trim()), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "Publish");
                     dt.Load(dr);
                     if (dt.Rows.Count > 0)
                     {
                         GVResults.DataSource = dt;
                         GVResults.DataBind();
                         GVResults.Visible = true;
                     }

                     SqlDataReader dr2 = objPublishBL.GetDataResultCertificatePublish(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "Publish");
                     DataTable dt2 = new DataTable();
                     dt2.Load(dr2);
                     if (dt2.Rows.Count > 0)
                     {
                         gvresultCertificate.DataSource = dt2;
                         gvresultCertificate.DataBind();
                         gvresultCertificate.Visible = true;
                         lblResultCertificate.Visible = false;
                         btnPublishCertificate.Visible = true;
                         btnCancelCertificate.Visible = true;
                     }
                     else
                     {
                         lblResultCertificate.Visible = true;
                         btnPublishCertificate.Visible = false;
                         btnCancelCertificate.Visible = false;
                     }


                     SqlDataReader dr1 = objPublishBL.GetStudentSolutionsToTest(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest", "Publish");
                     DataTable dtSolutions = new DataTable();
                     dtSolutions.Load(dr1);
                     if (dtSolutions.Rows.Count > 0)
                     {
                         GVSolutions.DataSource = dtSolutions;
                         GVSolutions.DataBind();
                         ViewState["TestResult"] = dt;
                         GVSolutions.Visible = true;
                         lblNoRecordsResult.Visible = false;
                     }
                     else
                     {
                         lblNoRecordsResult.Visible = true;
                     }
                 }
             }
        }

        protected void btnResultsPunlish_Click(object sender, EventArgs e)
        {

        }

        protected void btnResultsCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnPublishSet_Click(object sender, EventArgs e)
        {
            if (rdbList.SelectedValue=="1")
            {
                if (ddlItem.SelectedValue == "1")
                {
                    foreach (GridViewRow row in GVStudents.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                SqlDataReader dr = objPublishBL.UpdateSampleTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest");
                            }
                        }
                    }
                    GetStudentTestAfterPublish();
                }
                else if (ddlItem.SelectedValue == "2")
                {
                    foreach (GridViewRow row in GVStudents.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                SqlDataReader dr = objPublishBL.UpdateSampleTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest");
                            }
                        }
                    }
                    GetStudentTestAfterPublish();
                } 
            }
            else if (rdbList.SelectedValue == "2")
            {
                if (ddlItem.SelectedValue == "1")
                {
                    foreach (GridViewRow row in GVStudents.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                SqlDataReader dr = objPublishBL.UpdateSampleTestStudentUnPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "SampleTest");
                            }
                        }
                    }
                    GetStudentTestAfterPublish();
                }
                else if (ddlItem.SelectedValue == "2")
                { 
                    foreach (GridViewRow row in GVStudents.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                SqlDataReader dr = objPublishBL.UpdateSampleTestStudentUnPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlSubjects.SelectedValue.Trim()), "RealTest");
                            }
                        }
                    }
                    GetStudentTestAfterPublish();
                }
            }
        }

        protected void btnPublishSetCancel_Click(object sender, EventArgs e)
        {

        }

        protected void rdbList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            ddlPrograms.Items.Clear();
            ddlCategory.Items.Clear();
            ddlSubjects.Items.Clear();
            ddlgroup.Items.Clear();
            ddlItem.SelectedIndex = -1;
            ddlSemister.Items.Clear();
            GVStudents.Visible = false;
            ddlRoles.SelectedIndex = -1;
            GVQuestions.Visible = false;
            lblNoRecordsResult.Visible = false;
            GVResults.Visible = false;
            gvresultCertificate.Visible = false;
            pnlBkngGV.Visible = false;

            sampletestPanel.Visible = false;
            PnlResults.Visible = false;
            GradesPanel.Visible = false;

            if(rdbList.SelectedValue=="1")
            {
                btnPublishSet.Text = "Publish";
                BtnPublishQstn.Text = "Publish";
                btnResultsPunlish.Text = "Publish";
                btnPublishCertificate.Text = "Publish";
            }
            else if (rdbList.SelectedValue == "2")
            {
                btnPublishSet.Text = "Un-Publish";
                BtnPublishQstn.Text = "Un-Publish";
                btnResultsPunlish.Text = "Un-Publish";
                btnPublishCertificate.Text = "Un-Publish";
            }
            else if (ddlItem.SelectedValue == "5")
            {
                sampletestPanel.Visible = false;
                PnlResults.Visible = false;
                GradesPanel.Visible = false;
                pnlBookingSlot.Visible = true;
                pnlBkngGV.Visible = true;
                if (rdbList.SelectedItem.Value == "1")
                {
                    lblmultiCompany.Visible = true;
                    ddlsessions.Visible = true;
                    lblbkngcompany.Visible = false;
                    ddlBkngCompany.Visible = false;
                    btnBkngPublish.Text = "Publish";
                    lblbkngasighSessions.Text = "Asign-Sessions";
                    lblbkngErrormsg.Visible = false;
                    txtbkngRemaining.Text = ""; 
                }
                else
                {
                    lblmultiCompany.Visible = false;
                    ddlsessions.Visible = false;
                    lblbkngcompany.Visible = true;
                    ddlBkngCompany.Visible = true;
                    btnBkngPublish.Text = "Un-Publish";
                    lblbkngasighSessions.Text = "Minus-Sessions";
                    lblbkngErrormsg.Visible = false;
                    txtbkngRemaining.Text = "";
                }

            }
        }

        protected void BtnSoultions_Click(object sender, EventArgs e)
        {
            if (rdbList.SelectedValue == "1")
            {

                foreach (GridViewRow row in GVSolutions.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objPublishBL.UpdateStudentSolutionsToTest("Publish", Convert.ToInt32(id));
                        }
                    }
                }
                GetStudentResultsAfterPublish();
            }
            else if (rdbList.SelectedValue == "2")
            {

                foreach (GridViewRow row in GVSolutions.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objPublishBL.UpdateStudentSolutionsToTest("UnPublish", Convert.ToInt32(id));
                        }
                    }
                }
                GetStudentResultsAfterPublish();
            }
        }

        private void GetStudentResultsAfterPublish()
        {
           
            DataTable dtStudents = (DataTable)ViewState["TestResult"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][0].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentSolutionsAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVSolutions.DataSource = dt;
                    GVSolutions.DataBind();
                    GVSolutions.Visible = true;
                }
                else
                {
                    //lblNorecords.Visible = true;
                    GVSolutions.Visible = false;
                }
            }
        }

        protected void BtnSoultionsCancel_Click(object sender, EventArgs e)
        {

        }

        protected void BtnGrades_Click(object sender, EventArgs e)
        {
            if (rdbList.SelectedValue == "1")
            {

                foreach (GridViewRow row in GVGrades.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objPublishBL.UpdatePublishSudentGrade(Convert.ToInt32(id),"Publish");
                        }
                    }
                }
                GetStudentGradesAfterPublish();
            }
            else if (rdbList.SelectedValue == "2")
            {

                foreach (GridViewRow row in GVGrades.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objPublishBL.UpdatePublishSudentGrade(Convert.ToInt32(id), "UnPublish");
                        }
                    }
                }
                GetStudentGradesAfterPublish();
            }
        }

        private void GetStudentGradesAfterPublish()
        {

            DataTable dtStudents = (DataTable)ViewState["DTGrades"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][0].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetSudentGradeAfterPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVGrades.DataSource = dt;
                    GVGrades.DataBind();
                    GVGrades.Visible = true;
                }
                else
                {
                    //lblNorecords.Visible = true;
                    GVGrades.Visible = false;
                }
            }
        }

        protected void BtnGradesCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnPublishCertificate_Click(object sender, EventArgs e)
        {
             string SelectedIDs = "";
            foreach (GridViewRow row in gvresultCertificate.Rows)
            {
               
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                    if (chkRow.Checked)
                    {
                        if (SelectedIDs == "")
                        {
                            SelectedIDs = row.Cells[1].Text;
                        }
                        else
                        {
                            SelectedIDs = SelectedIDs + "," + row.Cells[1].Text;
                        }
                    }
                }
            }
            if (SelectedIDs!="")
            {
                SqlDataReader dr = objPublishBL.PublishCertificateData(SelectedIDs, "Publish");
            }

        }

        protected void btnCancelCertificate_Click(object sender, EventArgs e)
        {

        }

        #region Bookings

        private void GetBkngDates()
        {
            lblbkngErrormsg.Visible = false;
            txtbkngRemaining.Text = "";
            SqlDataReader dr = objPublishBL.GetDateforBooking(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlbkngDate.DataSource = dt;
                ddlbkngDate.DataTextField = "Slot_Date";
                ddlbkngDate.DataValueField = "Slot_Date";
                ddlbkngDate.DataBind();
                ddlbkngDate.Items.Insert(0, "--Select--");
            }
        }

        protected void ddlbkngDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblbkngErrormsg.Visible = false;
            gvBookings.Visible = false;
            SqlDataReader dr = objPublishBL.GetBookingIDsFromDate(Convert.ToInt32(ddlSubjects.SelectedValue.Trim()),Convert.ToDateTime(ddlbkngDate.SelectedItem.Text));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlbkngslotID.DataSource = dt;
                ddlbkngslotID.DataTextField = "Slot_Name";
                ddlbkngslotID.DataValueField = "Slot_ID";
                ddlbkngslotID.DataBind();
                ddlbkngslotID.Items.Insert(0, "--Select--");
            }
        }
       
        protected void ddlbkngslotID_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblbkngErrormsg.Visible = false;
           
            if (rdbList.SelectedItem.Value == "1")
            {
                SqlDataReader dr = objPublishBL.GetCompanysList(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlsessions.DataSource = dt;
                    ddlsessions.DataTextField = "CompanyName";
                    ddlsessions.DataValueField = "DetailsID";
                    ddlsessions.DataBind();
                }

                SqlDataReader dr1 = objPublishBL.GetRemainingSessions(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    txtbkngRemaining.Text = dt1.Rows[0][0].ToString();
                }
            }
            else if (rdbList.SelectedItem.Value == "2")
            {
                SqlDataReader dr = objPublishBL.GetCompanysList(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlBkngCompany.DataSource = dt;
                    ddlBkngCompany.DataTextField = "CompanyName";
                    ddlBkngCompany.DataValueField = "DetailsID";
                    ddlBkngCompany.DataBind();
                    ddlBkngCompany.Items.Insert(0, "--Select--");
                }
                SqlDataReader dr1 = objPublishBL.GetRemainingSessions(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    txtbkngRemaining.Text = dt1.Rows[0][0].ToString();
                }
            }

        }

        protected void ddlBkngCompany_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                demo.Value = "1";
                string[] words = ddlBkngCompany.SelectedItem.Text.Split('-');
                txtbkngRemaining.Text = words[words.Length - 1].ToString();
            }
            catch (Exception)
            {

            }
        }

        protected void btnBkngPublish_Click(object sender, EventArgs e)
        {
            string Answer = "";
            if (rdbList.SelectedItem.Value == "1")
            {
                for (int i = 0; i < ddlsessions.Items.Count; i++)
                {
                    if (ddlsessions.Items[i].Selected)
                    {

                        string[] words = ddlsessions.Items[i].Text.Split('-');
                        int val = Convert.ToInt32(words[words.Length - 1]) + Convert.ToInt32(demo.Value);
                        if (Convert.ToInt32(txtbkngRemaining.Text) >= val)
                        {
                            SqlDataReader dr1 = objPublishBL.InsertCompanySessions(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()), ddlbkngslotID.SelectedItem.Text.Trim(), Convert.ToInt32(ddlsessions.Items[i].Value), Convert.ToInt32(demo.Value));
                        }
                        else
                        {
                            lblbkngErrormsg.Visible = true;
                            if (lblbkngErrormsg.Text =="")
                            {
                                lblbkngErrormsg.Text = lblbkngErrormsg.Text + words[0].ToString();
                            }
                            else
                            {
                                lblbkngErrormsg.Text = lblbkngErrormsg.Text +","+ words[0].ToString();
                            }
                        }
                        if (Answer == "")
                        {
                            Answer = ddlsessions.Items[i].Value;
                        }
                        else
                        {
                            Answer = Answer + "," + ddlsessions.Items[i].Value;
                        }

                    }
                }

                lblbkngErrormsg.Text = lblbkngErrormsg.Text + "Exceeded Limit Sessions";

                if (Answer != "")
                {
                    SqlDataReader dr1 = objPublishBL.GetBookingGV(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()), Answer);
                    DataTable dt = new DataTable();
                    dt.Load(dr1);

                    DataColumn dcRec1 = new DataColumn("Date", typeof(string));
                    dcRec1.DefaultValue = ddlbkngDate.SelectedItem.Text.ToString();
                    dt.Columns.Add(dcRec1);
                    DataColumn dcRec = new DataColumn("SubjectID", typeof(string));
                    dcRec.DefaultValue = ddlSubjects.SelectedItem.Text.ToString();
                    dt.Columns.Add(dcRec);
                    gvBookings.Visible = true;

                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();

                    ddlSubjects.SelectedIndex = -1;
                    ddlbkngDate.Items.Clear();
                    ddlbkngslotID.Items.Clear();
                    txtbkngRemaining.Text = "";
                    ddlsessions.Items.Clear();
                    demo.Value = "";
                }
            }
            else if (rdbList.SelectedItem.Value == "2")
            {
                if (ddlBkngCompany.SelectedItem.Value != "0")
                {
                    SqlDataReader dr1 = objPublishBL.EditCompanySessions(Convert.ToInt32(ddlbkngslotID.SelectedValue.Trim()), ddlbkngslotID.SelectedItem.Text.Trim(), Convert.ToInt32(ddlBkngCompany.SelectedValue.Trim()), Convert.ToInt32(demo.Value));
                    DataTable dt = new DataTable();
                    dt.Load(dr1);

                    DataColumn dcRec1 = new DataColumn("Date", typeof(string));
                    dcRec1.DefaultValue = ddlbkngDate.SelectedItem.Text.ToString();
                    dt.Columns.Add(dcRec1);
                    DataColumn dcRec = new DataColumn("SubjectID", typeof(string));
                    dcRec.DefaultValue = ddlSubjects.SelectedItem.Text.ToString();
                    dt.Columns.Add(dcRec);

                    gvBookings.DataSource = dt;
                    gvBookings.DataBind();

                    ddlSubjects.SelectedIndex = -1;
                    ddlbkngDate.Items.Clear();
                    ddlbkngslotID.Items.Clear();
                    txtbkngRemaining.Text = "";
                    ddlsessions.Items.Clear();
                    ddlBkngCompany.Items.Clear();
                    demo.Value = "";

                }
            }  
        }

        protected void btnBkngCancel_Click(object sender, EventArgs e)
        {

        }

        #endregion Bookings
    }
}