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
    public partial class Admin_AssessmentManage : System.Web.UI.Page
    {

        AddProgramsBL objBL = new AddProgramsBL();
        EditProgram objEPBL = new EditProgram();
        QstnAnsBE objQABE = new QstnAnsBE();
        Slot objSBE = new Slot();
        PublishBL objPublishBL = new PublishBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtBookingStatusdate.Text = DateTime.Now.ToShortDateString();
                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                    LoadProgamsDrpdown();
                    FinalProgamsDrpdown();
                    ResultProgamsDrpdown();
                    ProgamsDrpdown();
                    GradeProgamsDrpdown();
               // }

              
            }
        }

        #region SampleTest

        private void ProgamsDrpdown()
        {
            try
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
            catch (Exception)
            {
            }
        }

        protected void ddlProgramsForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategoriesForUnits.Items.Clear();
            ddlSubject_sampleTest.Items.Clear();
            txtQstnName.Visible = false;
            lblSampleTestQstn.Visible = false;
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
            ddlSubject_sampleTest.Items.Clear();
            txtQstnName.Visible = false;
            lblSampleTestQstn.Visible = false;
            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objEPBL.GetSubjectDataByID(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject_sampleTest.DataSource = dt;
                ddlSubject_sampleTest.DataValueField = "Subject_Id";
                ddlSubject_sampleTest.DataTextField = "Subject_Name";
                ddlSubject_sampleTest.DataBind();
                ddlSubject_sampleTest.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void qstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtQstnName.Visible = false;
            lblSampleTestQstn.Visible = false;
            radioPanel.Visible = false;
            pnlGVSearch.Visible = true;
            FillinBlanksPAnel.Visible = false;
            DescriptivePanel.Visible = false;
            BindsampleGrid();
           
        }

        protected void gvSampleTestID_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                txtQstnName.Visible = true;
                lblSampleTestQstn.Visible = true;
                btnUpdateSampleQuestion.Visible = true;

                ImageButton imgbtn = (ImageButton)sender;
                GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
                if (gvrow != null)
                {
                    Label QId = (Label)gvrow.FindControl("Qstn_ID");
                    int a = Convert.ToInt32(QId.Text);
                    ViewState["SampleQstnID"] = a;
                    DataTable dt = (DataTable)ViewState["SampleTestDt"];
                    EnumerableRowCollection<DataRow> query_new = from order in dt.AsEnumerable()
                                                                 where order.Field<int>("Qstn_ID").Equals(a)
                                                                 select order;

                    DataTable dtEditRow = query_new.CopyToDataTable<DataRow>();


                    if (ddlqstnType.SelectedValue == "1")
                    {
                        radioPanel.Visible = true;
                        FillinBlanksPAnel.Visible = false;
                        DescriptivePanel.Visible = false;
                    }
                    else if (ddlqstnType.SelectedValue == "2")
                    {
                        radioPanel.Visible = false;
                        FillinBlanksPAnel.Visible = true;
                        DescriptivePanel.Visible = false;
                    }
                    else if (ddlqstnType.SelectedValue == "3")
                    {
                        radioPanel.Visible = false;
                        FillinBlanksPAnel.Visible = false;
                        DescriptivePanel.Visible = true;
                    }

                    txtQstnName.Text = dtEditRow.Rows[0]["Question"].ToString();
                    txtA.Text = dtEditRow.Rows[0]["A"].ToString();
                    txtB.Text = dtEditRow.Rows[0]["B"].ToString();
                    txtC.Text = dtEditRow.Rows[0]["C"].ToString();
                    txtD.Text = dtEditRow.Rows[0]["D"].ToString();
                    txtE.Text = dtEditRow.Rows[0]["E"].ToString();
                    string splitAns = dtEditRow.Rows[0]["Answer"].ToString();
                    string[] splitArray = splitAns.Split(',');
                    for (int i = 0; i < splitArray.Length; i++)
                    {
                        ddlAns.Items[Convert.ToInt32(splitArray[i]) - 1].Selected = true;
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnUpdateSampleQuestion_Click(object sender, EventArgs e)
        {
            try
            {
                //int SubjectId = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                objQABE.Qstn_ID = (int)ViewState["SampleQstnID"];
                objQABE.Question = txtQstnName.Text.Trim();
                objQABE.A = txtA.Text.Trim();
                objQABE.B = txtB.Text.Trim();
                objQABE.C = txtC.Text.Trim();
                objQABE.D = txtD.Text.Trim();
                objQABE.E = txtE.Text.Trim();
                string Answer = "";

                for (int i = 0; i < ddlAns.Items.Count; i++)
                {
                    if (ddlAns.Items[i].Selected)
                    {
                        if (Answer == "")
                        {
                            Answer = ddlAns.Items[i].Value;
                        }
                        else
                        {
                            Answer = Answer + "," + ddlAns.Items[i].Value;
                        }
                    }
                }
                if (Answer != "")
                {
                    objQABE.Answer = Answer;
                    // objQABE.Answer = ddlFinalAns.SelectedItem.Text.Trim();
                    SqlDataReader dr = objEPBL.UpdateQuestion(objQABE);
                    ClearFinalControls();
                    radioPanel.Visible = false;
                    FillinBlanksPAnel.Visible = false;
                    DescriptivePanel.Visible = false;
                    txtQstnName.Visible = false;
                    lblSampleTestQstn.Visible = false;
                    BindsampleGrid();
                    btnUpdateSampleQuestion.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Please Select Answer Option');", true);
                }
            }
            catch (Exception)
            {

            }
        }

        protected void gvSampleTestDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton imgbtn = (ImageButton)sender;
                GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
                if (gvrow != null)
                {
                    Label QId = (Label)gvrow.FindControl("Qstn_ID");
                    int a = Convert.ToInt32(QId.Text);
                    SqlDataReader dr = objEPBL.DeleteQuestion(a);
                    ClearFinalControls();
                    radioPanel.Visible = false;
                    FillinBlanksPAnel.Visible = false;
                    DescriptivePanel.Visible = false;
                    txtQstnName.Visible = false;
                    lblSampleTestQstn.Visible = false;
                    BindsampleGrid();
                }
            }
            catch (Exception)
            {
            }
        }

        private void BindsampleGrid()
        {
            try
            {
                SqlDataReader dr = objBL.Getgv(Convert.ToInt32(ddlSubject_sampleTest.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                gvSampleTest.DataSource = dt;
                gvSampleTest.DataBind();
                ViewState["SampleTestDt"] = dt;
            }
            catch (Exception)
            {
            }
        }

        protected void gvSampleTest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                if (ViewState["SampleTestDt"] != null)
                {
                    DataTable dt = (DataTable)ViewState["SampleTestDt"];
                    gvSampleTest.PageIndex = e.NewPageIndex;
                    gvSampleTest.DataSource = dt;
                    gvSampleTest.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable)ViewState["SampleTestDt"];
                DataTable dt1;
                if (txtQustName.Text != "" && txtQuistId.Text != "")
                {
                    var details = from addresses in dt.AsEnumerable() where addresses.Field<int>("Qstn_ID").Equals(Convert.ToInt32(txtQuistId.Text)) || addresses.Field<string>("Question").Contains(txtQustName.Text) select addresses;
                    var result = details.FirstOrDefault();  // catch running past end of table
                    if (result != null)
                    {
                        dt1 = details.CopyToDataTable<DataRow>();
                        gvSampleTest.DataSource = dt1;
                        gvSampleTest.DataBind();
                    }
                }
                else if (txtQuistId.Text != "")
                {
                    var details = from addresses in dt.AsEnumerable() where addresses.Field<int>("Qstn_ID").Equals(Convert.ToInt32(txtQuistId.Text)) select addresses;
                    var result = details.FirstOrDefault();  // catch running past end of table
                    if (result != null)
                    {
                        dt1 = details.CopyToDataTable<DataRow>();
                        gvSampleTest.DataSource = dt1;
                        gvSampleTest.DataBind();
                    }
                }
                else if (txtQustName.Text != "")
                {
                    var details = from addresses in dt.AsEnumerable() where addresses.Field<string>("Question").Contains(txtQustName.Text) select addresses;
                    var result = details.FirstOrDefault();  // catch running past end of table
                    if (result != null)
                    {
                        dt1 = details.CopyToDataTable<DataRow>();
                        gvSampleTest.DataSource = dt1;
                        gvSampleTest.DataBind();
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        #endregion SampleTest

        #region Bookings

        public void LoadProgamsDrpdown()
        {
            try
            {
                SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
                DataTable dt = new DataTable();
                dt.Load(dr);
                ddlBookingsPrograms.DataSource = dt;
                ddlBookingsPrograms.DataValueField = "Program_id";
                ddlBookingsPrograms.DataTextField = "Program_name";
                ddlBookingsPrograms.DataBind();
                ddlBookingsPrograms.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception)
            {
            }

        }

        protected void ddlBookingsPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlBookingsCategories.Items.Clear();
                ddlbookingGroup.Items.Clear();
                ddlbookingYear.Items.Clear();
                ddlBookingsSubject.Items.Clear();
                ddlSlotName.Items.Clear();

                int programId = Convert.ToInt32(ddlBookingsPrograms.SelectedItem.Value);
                SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlBookingsCategories.DataSource = dt;
                    ddlBookingsCategories.DataValueField = "Category_Id";
                    ddlBookingsCategories.DataTextField = "Category_Name";
                    ddlBookingsCategories.DataBind();
                    ddlBookingsCategories.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ddlBookingsCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlbookingGroup.Items.Clear();
                ddlbookingYear.Items.Clear();
                ddlBookingsSubject.Items.Clear();
                ddlSlotName.Items.Clear();
                int CategorieID = Convert.ToInt32(ddlBookingsCategories.SelectedItem.Value);
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategorieID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlbookingGroup.DataSource = dt;
                    ddlbookingGroup.DataValueField = "Branch_Id";
                    ddlbookingGroup.DataTextField = "Branch_Name";
                    ddlbookingGroup.DataBind();
                    ddlbookingGroup.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ddlbookingGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlbookingYear.Items.Clear();
                ddlBookingsSubject.Items.Clear();
                ddlSlotName.Items.Clear();

                int SubjectID = Convert.ToInt32(ddlbookingGroup.SelectedItem.Value);
                SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(SubjectID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlbookingYear.DataSource = dt;
                    ddlbookingYear.DataValueField = "Year_Id";
                    ddlbookingYear.DataTextField = "Branch_Year_No";
                    ddlbookingYear.DataBind();
                    ddlbookingYear.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ddlbookingYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlBookingsSubject.Items.Clear();
                ddlSlotName.Items.Clear();

                int YearID = Convert.ToInt32(ddlbookingYear.SelectedItem.Value);
                SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(YearID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlBookingsSubject.DataSource = dt;
                    ddlBookingsSubject.DataValueField = "Subject_Id";
                    ddlBookingsSubject.DataTextField = "Subject_Name";
                    ddlBookingsSubject.DataBind();
                    ddlBookingsSubject.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ddlBookingsSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlSlotName.Items.Clear();

                SqlDataReader dr = objPublishBL.GetDateforBooking(Convert.ToInt32(ddlBookingsSubject.SelectedValue.Trim()));
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
            catch (Exception)
            {
            }
        }

        protected void ddlbkngDate_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlDataReader dr = objPublishBL.GetBookingIDsFromDate(Convert.ToInt32(ddlBookingsSubject.SelectedValue.Trim()), Convert.ToDateTime(ddlbkngDate.SelectedItem.Text));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSlotName.DataSource = dt;
                ddlSlotName.DataTextField = "Slot_Name";
                ddlSlotName.DataValueField = "Slot_ID";
                ddlSlotName.DataBind();
                ddlSlotName.Items.Insert(0, "--Select--");
            }
        }

        protected void ddlSlotName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int SlotID = Convert.ToInt32(ddlSlotName.SelectedItem.Value);
                SqlDataReader dr = objBL.GetSlotDataBasedOnSlotDrpdwn(SlotID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                txtSlotDate.Text = dt.Rows[0]["Slot_Date"].ToString();
                txtSlotTime.Text = dt.Rows[0]["Slot_Time"].ToString();
                ddlSlotStatus.SelectedItem.Text = dt.Rows[0]["Slot_Status"].ToString();
                txtBookingStatusdate.Text = dt.Rows[0]["StatusDate"].ToString();
                txtBookingsRemarks.Text = dt.Rows[0]["Remarks"].ToString();
            }
            catch (Exception)
            {
            }
        }

        protected void btnAddSlot_Click(object sender, EventArgs e)
        {
            try
            {
                objSBE.Slot_ID = Convert.ToInt32(ddlSlotName.SelectedItem.Value);
                objSBE.Slot_Date = Convert.ToDateTime(txtSlotDate.Text.Trim());
                objSBE.Slot_Time = txtSlotTime.Text.Trim();
                objSBE.Slot_Status = ddlSlotStatus.SelectedItem.Text;
                objSBE.StatusDate = Convert.ToDateTime(txtBookingStatusdate.Text.Trim());
                objSBE.Remarks = txtBookingsRemarks.Text.Trim();
                SqlDataReader dr = objBL.Update_Slot(objSBE);
                ClearControls();
                DataTable dt = new DataTable();
                dt.Load(dr);
                gvUpdateBookings.DataSource = dt;
                gvUpdateBookings.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void btnDeleteSlot_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataReader dr = objBL.DeleteSlot(Convert.ToInt32(ddlSlotName.SelectedItem.Value));
                ClearControls();
                ddlbookingGroup.Items.Clear();
                ddlBookingsCategories.Items.Clear();
                ddlBookingsPrograms.SelectedIndex = -1;
                ddlBookingsSubject.Items.Clear();
                ddlbookingYear.Items.Clear();
            }
            catch (Exception)
            {
            }
        }

        private void ClearControls()
        {

            txtSlotDate.Text = "";
            txtSlotTime.Text = "";
            txtBookingStatusdate.Text = "";
            txtBookingsRemarks.Text = "";


        }

        #endregion Bookings

        #region FinalTest

        protected void gvFinalTestID_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                lblFinalTestQstn.Visible = true;
                txtFinalqstnName.Visible = true;
                btnFinalUpdateQstn.Visible = true;
                ImageButton imgbtn = (ImageButton)sender;
                GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
                if (gvrow != null)
                {
                    Label QId = (Label)gvrow.FindControl("Qstn_ID");
                    int a = Convert.ToInt32(QId.Text);
                    ViewState["QstnID"] = a;
                    DataTable dt = (DataTable)ViewState["Datatable"];
                    EnumerableRowCollection<DataRow> query_new = from order in dt.AsEnumerable()
                                                                 where order.Field<int>("Qstn_ID").Equals(a)
                                                                 select order;

                    DataTable dtEditRow = query_new.CopyToDataTable<DataRow>();


                    if (ddlRealTestQstnType.SelectedValue == "1")
                    {
                        radioPanelFinal.Visible = true;
                        FillinBlanksPAnelFinal.Visible = false;
                        DescriptivePanelFinal.Visible = false;
                    }
                    else if (ddlRealTestQstnType.SelectedValue == "2")
                    {
                        radioPanelFinal.Visible = false;
                        FillinBlanksPAnelFinal.Visible = true;
                        DescriptivePanelFinal.Visible = false;
                    }
                    else if (ddlRealTestQstnType.SelectedValue == "3")
                    {
                        radioPanelFinal.Visible = false;
                        FillinBlanksPAnelFinal.Visible = false;
                        DescriptivePanelFinal.Visible = true;
                    }

                    txtFinalqstnName.Text = dtEditRow.Rows[0]["Question"].ToString();
                    txtFinalA.Text = dtEditRow.Rows[0]["A"].ToString();
                    txtFinalB.Text = dtEditRow.Rows[0]["B"].ToString();
                    txtFinalC.Text = dtEditRow.Rows[0]["C"].ToString();
                    txtFinalD.Text = dtEditRow.Rows[0]["D"].ToString();
                    txtFinalE.Text = dtEditRow.Rows[0]["E"].ToString();
                    string splitAns = dtEditRow.Rows[0]["Answer"].ToString();
                    string[] splitArray = splitAns.Split(',');
                    for (int i = 0; i < splitArray.Length; i++)
                    {
                        ddlFinalAns.Items[Convert.ToInt32(splitArray[i]) - 1].Selected = true;
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        private void FinalProgamsDrpdown()
        {
            try
            {
                SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
                DataTable dt = new DataTable();
                dt.Load(dr);
                ddlFinalProgram.DataSource = dt;
                ddlFinalProgram.DataValueField = "Program_id";
                ddlFinalProgram.DataTextField = "Program_name";
                ddlFinalProgram.DataBind();
                ddlFinalProgram.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            catch (Exception)
            {
            }
        }

        protected void ddlFinalProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlFinalCategory.Items.Clear();
            ddlFinalSubject.Items.Clear();
            int programId = Convert.ToInt32(ddlFinalProgram.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlFinalCategory.DataSource = dt;
                ddlFinalCategory.DataValueField = "Category_Id";
                ddlFinalCategory.DataTextField = "Category_Name";
                ddlFinalCategory.DataBind();
                ddlFinalCategory.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlFinalCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlFinalSubject.Items.Clear();
            int CategoryId = Convert.ToInt32(ddlFinalCategory.SelectedItem.Value);
            SqlDataReader dr = objEPBL.GetSubjectDataByID(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlFinalSubject.DataSource = dt;
                ddlFinalSubject.DataValueField = "Subject_Id";
                ddlFinalSubject.DataTextField = "Subject_Name";
                ddlFinalSubject.DataBind();
                ddlFinalSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlRealTestQstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblFinalTestQstn.Visible = false;
            txtFinalqstnName.Visible = false;
            pnlGVFTSearch.Visible = true;
            radioPanelFinal.Visible = false;
            FillinBlanksPAnelFinal.Visible = false;
            DescriptivePanelFinal.Visible = false;
            BindGrid();
        }

        private void BindGrid()
        {
            SqlDataReader dr = objBL.GetgvFinalTest(Convert.ToInt32(ddlFinalSubject.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvFinalTest.DataSource = dt;
            gvFinalTest.DataBind();
            ViewState["Datatable"] = dt;       
        }

        private void ClearFinalControls()
        {
            ddlFinalAns.SelectedIndex = -1;
            ddlAns.SelectedIndex = -1;
            txtFinalA.Text = "";
            txtFinalB.Text = "";
            txtFinalC.Text = "";
            txtFinalD.Text = "";
            txtFinalE.Text = "";
            txtFinalqstnName.Text = "";
            txtA.Text = "";
            txtB.Text = "";
            txtC.Text = "";
            txtD.Text = "";
            txtE.Text = "";
            txtQstnName.Text = "";
            
        }

        protected void btnFinalUpdateQstn_Click(object sender, EventArgs e)
        {
            try
            {
                lblFinalTestQstn.Visible = false;
                txtFinalqstnName.Visible = false;
                btnFinalUpdateQstn.Visible = false;

                objQABE.Qstn_ID = (int)ViewState["QstnID"];
                objQABE.Question = txtFinalqstnName.Text.Trim();
                objQABE.A = txtFinalA.Text.Trim();
                objQABE.B = txtFinalB.Text.Trim();
                objQABE.C = txtFinalC.Text.Trim();
                objQABE.D = txtFinalD.Text.Trim();
                objQABE.E = txtFinalE.Text.Trim();
                string Answer = "";

                for (int i = 0; i < ddlFinalAns.Items.Count; i++)
                {
                    if (ddlFinalAns.Items[i].Selected)
                    {
                        if (Answer == "")
                        {
                            Answer = ddlFinalAns.Items[i].Value;
                        }
                        else
                        {
                            Answer = Answer + "," + ddlFinalAns.Items[i].Value;
                        }
                    }
                }
                objQABE.Answer = Answer;
                // objQABE.Answer = ddlFinalAns.SelectedItem.Text.Trim();
                SqlDataReader dr = objEPBL.UpdateQuestion(objQABE);
                ClearFinalControls();
                pnlGVFTSearch.Visible = true;
                radioPanelFinal.Visible = false;
                FillinBlanksPAnelFinal.Visible = false;
                DescriptivePanelFinal.Visible = false;
                BindGrid();
            }
            catch (Exception)
            {
            }
        }

        protected void gvRealTestDelete_Click(object sender, ImageClickEventArgs e)
        {
             lblFinalTestQstn.Visible=false;
             txtFinalqstnName.Visible = false;

             ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                Label QId = (Label)gvrow.FindControl("Qstn_ID");
                int a = Convert.ToInt32(QId.Text);
                SqlDataReader dr = objEPBL.DeleteQuestion(a);
                pnlGVFTSearch.Visible = false;
                radioPanelFinal.Visible = false;
                FillinBlanksPAnelFinal.Visible = false;
                DescriptivePanelFinal.Visible = false;
                BindGrid();
            }
        }

        protected void btnFTSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Datatable"];
            DataTable dt1;
            if (txtFTQstnName.Text != "" && txtFTQstnID.Text != "")
            {
                var details = from addresses in dt.AsEnumerable() where addresses.Field<int>("Qstn_ID").Equals(Convert.ToInt32(txtFTQstnID.Text)) || addresses.Field<string>("Question").Contains(txtFTQstnName.Text.Trim()) select addresses;
                var result = details.FirstOrDefault();  // catch running past end of table
                if (result != null)
                {
                    dt1 = details.CopyToDataTable<DataRow>();
                    gvFinalTest.DataSource = dt1;
                    gvFinalTest.DataBind();
                }
            }
            else if (txtFTQstnID.Text != "")
            {
                var details = from addresses in dt.AsEnumerable() where addresses.Field<int>("Qstn_ID").Equals(Convert.ToInt32(txtFTQstnID.Text)) select addresses;
                var result = details.FirstOrDefault();  // catch running past end of table
                if (result != null)
                {
                    dt1 = details.CopyToDataTable<DataRow>();
                    gvFinalTest.DataSource = dt1;
                    gvFinalTest.DataBind();
                }
            }
            else if (txtFTQstnName.Text != "")
            {
                var details = from addresses in dt.AsEnumerable() where addresses.Field<string>("Question").Contains(txtFTQstnName.Text) select addresses;
                var result = details.FirstOrDefault();  // catch running past end of table
                if (result != null)
                {
                    dt1 = details.CopyToDataTable<DataRow>();
                    gvFinalTest.DataSource = dt1;
                    gvFinalTest.DataBind();
                }
            }
        }

        protected void gvFinalTest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Datatable"];
            gvFinalTest.PageIndex = e.NewPageIndex;
            gvFinalTest.DataSource = dt;
            gvFinalTest.DataBind();

        }

        #endregion FinalTest 

        #region Result

        private void ResultProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlResultProgram.DataSource = dt;
            ddlResultProgram.DataValueField = "Program_id";
            ddlResultProgram.DataTextField = "Program_name";
            ddlResultProgram.DataBind();
            ddlResultProgram.Items.Insert(0, new ListItem("---Select---", "0"));

        }

        protected void ddlResultProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlResultCategory.Items.Clear();
            ddlResultSubject.Items.Clear();
            int programId = Convert.ToInt32(ddlResultProgram.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlResultCategory.DataSource = dt;
                ddlResultCategory.DataValueField = "Category_Id";
                ddlResultCategory.DataTextField = "Category_Name";
                ddlResultCategory.DataBind();
                ddlResultCategory.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlResultCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlResultSubject.Items.Clear();
            int CategoryId = Convert.ToInt32(ddlResultCategory.SelectedItem.Value);
            SqlDataReader dr = objEPBL.GetSubjectDataByID(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlResultSubject.DataSource = dt;
                ddlResultSubject.DataValueField = "Subject_Id";
                ddlResultSubject.DataTextField = "Subject_Name";
                ddlResultSubject.DataBind();
                ddlResultSubject.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlResultQstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int programId = Convert.ToInt32(ddlResultProgram.SelectedItem.Value);
            int CategoryId = Convert.ToInt32(ddlResultCategory.SelectedItem.Value);
            int SubjectID = Convert.ToInt32(ddlResultSubject.SelectedItem.Value);
            string QstnType = ddlResultQstnType.SelectedItem.Text;
            BindStudentResults();
            //SqlDataReader dr = objEPBL.ResultData(programId, CategoryId, SubjectID, QstnType);
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //ViewState["ResultDT"] = dt;
            //gvResult.DataSource = dt;
            //gvResult.DataBind();
        }

        protected void BindStudentResults()
        {
            int programId = Convert.ToInt32(ddlResultProgram.SelectedItem.Value);
            int CategoryId = Convert.ToInt32(ddlResultCategory.SelectedItem.Value);
            int SubjectID = Convert.ToInt32(ddlResultSubject.SelectedItem.Value);
            string QstnType = ddlResultQstnType.SelectedItem.Text;
            SqlDataReader dr = objEPBL.ResultData(programId, CategoryId, SubjectID, QstnType);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                gvResult.DataSource = dt;
                gvResult.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                gvResult.DataSource = dt;
                gvResult.DataBind();
                int columncount = gvResult.Rows[0].Cells.Count;
                gvResult.Rows[0].Cells.Clear();
                gvResult.Rows[0].Cells.Add(new TableCell());
                gvResult.Rows[0].Cells[0].ColumnSpan = columncount;
                gvResult.Rows[0].Cells[0].Text = "No Records Found";
            }
        }
        protected void btnResultSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void btncancelPrograms_Click(object sender, EventArgs e)
        {

        }
    
        //protected void EditResult_Click(object sender, ImageClickEventArgs e)
        //{
        //     ImageButton imgbtn = (ImageButton)sender;
        //    GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
        //    if (gvrow != null)
        //    {
        //        Label QId = (Label)gvrow.FindControl("Result_ID");
        //        int a = Convert.ToInt32(QId.Text);
        //        DataTable dt = (DataTable)ViewState["ResultDT"];
        //        EnumerableRowCollection<DataRow> query_new = from order in dt.AsEnumerable()
        //                                                     where order.Field<int>("Result_ID").Equals(a)
        //                                                     select order;

        //        DataTable dtEditRow = query_new.CopyToDataTable<DataRow>();

        //    }
        //}

        //protected void DeleteResult_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvResult.EditIndex = e.NewEditIndex;
            BindStudentResults();
        }
        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Result_ID = Convert.ToInt32(gvResult.DataKeys[e.RowIndex].Value.ToString());
            TextBox txtAttemptQstns = (TextBox)gvResult.Rows[e.RowIndex].FindControl("txtAttemptQstns");
            TextBox txtCorrectAns = (TextBox)gvResult.Rows[e.RowIndex].FindControl("txtCorrectAns");
            TextBox txtStdResult = (TextBox)gvResult.Rows[e.RowIndex].FindControl("txtResult");
            TextBox txtRemarks = (TextBox)gvResult.Rows[e.RowIndex].FindControl("txtRemarks");
            int AttemptQstns = Convert.ToInt32(txtAttemptQstns.Text.Trim());
            int CorrectAns = Convert.ToInt32(txtCorrectAns.Text.Trim());
            string StdResult =txtStdResult.Text.Trim();
            string Remarks =txtRemarks.Text.Trim();
            SqlDataReader dr = objEPBL.UpdateResult(Result_ID, AttemptQstns,CorrectAns, StdResult, Remarks);

            gvResult.EditIndex = -1;
            BindStudentResults();
        }
        protected void gvDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvResult.EditIndex = -1;
            BindStudentResults();
        }
        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userid = Convert.ToInt32(gvResult.DataKeys[e.RowIndex].Values["UserId"].ToString());
        }

        #endregion Result

        #region Grade

        private void GradeProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlSubjectPrograms.DataSource = dt;
            ddlSubjectPrograms.DataValueField = "Program_id";
            ddlSubjectPrograms.DataTextField = "Program_name";
            ddlSubjectPrograms.DataBind();
            ddlSubjectPrograms.Items.Insert(0, new ListItem("---Select---", "0"));

        }

        protected void ddlSubjectPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectCategories.Items.Clear();
            ddlSubjectGroup.Items.Clear();
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
            ddlSubjectGroup.Items.Clear();

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
                ddlSubjectGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlSubjectGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            int BranchID = Convert.ToInt32(ddlSubjectGroup.SelectedValue);
            int CatrgoryID = Convert.ToInt32(ddlSubjectCategories.SelectedValue);
            if (BranchID != 0 && CatrgoryID != 0)
            {
                SqlDataReader dr = objBL.GetGradeBasedOnYear(CatrgoryID, BranchID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                GVGrade.DataSource = dt;
                GVGrade.DataBind();
            }
        }

        protected void ddlSubjectYear_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        #endregion Grade

       

    }
}