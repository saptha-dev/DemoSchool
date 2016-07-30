using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BAL.BL;
using BAL.BE;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Data.OleDb;
using System.Text;

namespace PresentationLayer.Admin
{
    public partial class Admin_Assessment : System.Web.UI.Page
    {

        AddProgramsBL objBL = new AddProgramsBL();
        EditProgram objEPBL = new EditProgram();
        QstnAnsBE objQABE = new QstnAnsBE();
        Slot objSBE = new Slot();
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
                    ProgamsDrpdown();
                    FinalProgamsDrpdown();
                    LoadProgamsDrpdown();
                    ResultProgamsDrpdown();
                    GradeProgamsDrpdown();
                //}
              
            }
        }


        #region SampleTest

        private void ProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsForUnits.DataSource = dt;
            ddlProgramsForUnits.DataValueField = "Program_id";
            ddlProgramsForUnits.DataTextField = "Program_name";
            ddlProgramsForUnits.DataBind();
            ddlProgramsForUnits.Items.Insert(0, new ListItem("--Select --", "0"));

        }

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
                ddlCategoriesForUnits.Items.Insert(0, new ListItem("--Select --", "0"));
            }
        }

        protected void ddlCategoriesForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubject_forUnits.Items.Clear();

            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objEPBL.GetSubjectDataByID(CategoryId);
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

        protected void qstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
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
        }

        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlqstnType.SelectedItem.Text.Trim() == "Radio")
                {

                    objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    objQABE.Test_Type = "SampleTest";
                    objQABE.Question_Type = "Radio";
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
                    objQABE.Answer = Answer;
                    // objQABE.Answer = ddlAns.SelectedItem.Text.Trim();
                    SqlDataReader dr = objEPBL.InsertSampleTestdata(objQABE);
                    ClearControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvUnits.DataSource = dt;
                    gvUnits.DataBind();
                }
                else if (ddlqstnType.SelectedItem.Text.Trim() == "Fill In Blanks")
                {
                    objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    objQABE.Question = txtQstnName.Text.Trim();
                    objQABE.Answer = txtFillInAnswer.Text.Trim();
                    objQABE.Test_Type = "SampleTest";
                    objQABE.Question_Type = "FillBlanks";
                    SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                    ClearControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvUnits.DataSource = dt;
                    gvUnits.DataBind();
                }
                else if (ddlqstnType.SelectedItem.Text.Trim() == "Descriptive")
                {
                    objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    objQABE.Question = txtQstnName.Text.Trim();
                    objQABE.Answer = txtDescriptAnswer.Text.Trim();
                    objQABE.Test_Type = "SampleTest";
                    objQABE.Question_Type = "Descriptive";
                    SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                    ClearControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvUnits.DataSource = dt;
                    gvUnits.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }    

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Display_Data();

        }

        private string GetData_Excel()
        {
            String connectionString = "Database";

            string newname = "Template";
            if (fileuploadExcel.FileName == "")
            {
                connectionString = "NoData";
                return connectionString;
            }
            else
            {
                string fileName = newname + fileuploadExcel.FileName;
                ViewState["filename"] = fileName;
                fileuploadExcel.SaveAs(Server.MapPath("~/App_Data/" + fileName));
                string filePath = Server.MapPath("~/App_Data/" + fileName);

                if (Path.GetExtension(filePath).Equals(".xls"))                             // for 97-03 Excel file //
                    connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1;\"";
                else if (Path.GetExtension(filePath).Equals(".xlsx"))                       // for 2007 Excel file  //
                    connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=1;\"";

                return connectionString;
            }

        }

        public void Display_Data()
        {
            try
            {
                string connectionString = GetData_Excel();

                if (connectionString == "NoData")
                {
                    // ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "NoExcel();", true);
                }
                else
                {

                    OleDbConnection conn = new OleDbConnection(connectionString);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    string query = "SELECT * FROM [Sheet1$] where [Question] IS NOT NULL";
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    OleDbDataReader dReader;
                    dReader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dReader);



                    System.Data.DataColumn newColumn = new System.Data.DataColumn("Category_Id", typeof(int));
                    newColumn.DefaultValue = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn);

                    System.Data.DataColumn newColumn1 = new System.Data.DataColumn("Subject_Id", typeof(int));
                    newColumn1.DefaultValue = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn1);

                    System.Data.DataColumn clmUnit_Id = new System.Data.DataColumn("Unit_Id", typeof(int));
                    clmUnit_Id.DefaultValue = 0;
                    dt.Columns.Add(clmUnit_Id);

                    System.Data.DataColumn newColumn2 = new System.Data.DataColumn("Test_Type", typeof(string));
                    newColumn2.DefaultValue = "SampleTest";
                    dt.Columns.Add(newColumn2);

                    //System.Data.DataColumn newColumn3 = new System.Data.DataColumn("Status_date", typeof(DateTime));
                    //newColumn3.DefaultValue = "2015/06/12";
                    //dt.Columns.Add(newColumn3);
                    conn.Close();
                    string fileName = ViewState["filename"].ToString();
                    File.Delete(Server.MapPath("~/App_Data/" + fileName));

                    objQABE.dtExcelUpload = dt;
                    // SqlDataReader dr = objEPBL.InsertExcelSampleTestdata(objQABE);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                        objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                        objQABE.Test_Type = "SampleTest";
                        //objQABE.Exercise_ID = Convert.ToInt32(txtexeID.Text.Trim());
                        objQABE.Question = dt.Rows[i]["Question"].ToString();
                        objQABE.A = dt.Rows[i]["A"].ToString();
                        objQABE.B = dt.Rows[i]["B"].ToString();
                        objQABE.C = dt.Rows[i]["C"].ToString();
                        objQABE.D = dt.Rows[i]["D"].ToString();
                        objQABE.E = dt.Rows[i]["E"].ToString();
                        objQABE.Answer = dt.Rows[i]["Answer"].ToString();
                        SqlDataReader dr = objEPBL.InsertSampleTestdata(objQABE);
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void lnkDExcel_Click(object sender, EventArgs e)
        {
            try
            {
                string XlsPath = "";
                if (ddlqstnType.SelectedItem.Text == "Radio")
                {
                    XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
                }
                else if (ddlqstnType.SelectedItem.Text == "Fill In Blanks")
                {
                    XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
                }
                else if (ddlqstnType.SelectedItem.Text == "Descriptive")
                {
                    XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
                }

                if (XlsPath != "")
                {
                    FileInfo fileDet = new System.IO.FileInfo(XlsPath);
                    Response.Clear();
                    Response.Charset = "UTF-8";
                    Response.ContentEncoding = Encoding.UTF8;
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fileDet.Name));
                    Response.AddHeader("Content-Length", fileDet.Length.ToString());
                    Response.ContentType = "application/ms-excel";
                    Response.WriteFile(fileDet.FullName);
                    Response.End();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnExcelView_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = GetData_Excel();

                if (connectionString == "NoData")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "NoExcel();", true);
                }
                else
                {

                    OleDbConnection conn = new OleDbConnection(connectionString);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    string query = "SELECT * FROM [Sheet1$] where [Question] IS NOT NULL";
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    OleDbDataReader dReader;
                    dReader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dReader);

                    gvUnits.DataSource = dt;
                    gvUnits.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        #endregion SampleTest

        private void ClearControls()
        {
            ddlAns.SelectedIndex = -1;
            txtA.Text = "";
            txtB.Text = "";
            txtC.Text = "";
            txtD.Text = "";
            txtE.Text = "";
            //txtexeID.Text = "";
            txtQstnName.Text = "";
            txtFillInAnswer.Text = "";

            txtBookingSessions.Text = "";
            txtSlotTime.Text = "";
            txtSlotDate.Text = "";
          
           // txtStatusDate.Text = "";
            txtBookingsRemarks.Text = "";
            ddlbookingGroup.SelectedIndex = -1;
            ddlBookingsCategories.SelectedIndex = -1;
            ddlBookingsSubject.SelectedIndex = -1;
            ddlbookingYear.SelectedIndex = -1;
            ddlBookingSlotId.SelectedIndex = -1;
        }

        #region FinalTest

        private void FinalProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlFinalProgram.DataSource = dt;
            ddlFinalProgram.DataValueField = "Program_id";
            ddlFinalProgram.DataTextField = "Program_name";
            ddlFinalProgram.DataBind();
            ddlFinalProgram.Items.Insert(0,new ListItem("---Select---","0"));

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
                ddlFinalCategory.Items.Insert(0, new ListItem("---Select---", "0"));
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
                ddlFinalSubject.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlRealTestQstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
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
        }

        private void ClearFinalControls()
        {
            ddlFinalAns.SelectedIndex = -1;
            txtFinalA.Text = "";
            txtFinalB.Text = "";
            txtFinalC.Text = "";
            txtFinalD.Text = "";
            txtFinalE.Text = "";
            //txtFinalExId.Text = "";
            txtFinalqstnName.Text = "";
        }

        private string GetData_ExcelFinalTest()
        {
            String connectionString = "Database";

            string newname = "Template";
            if (fileupload1.FileName == "")
            {
                connectionString = "NoData";
                return connectionString;
            }
            else
            {
                string fileName = newname + fileupload1.FileName;
                ViewState["filename"] = fileName;
                fileupload1.SaveAs(Server.MapPath("~/App_Data/" + fileName));
                string filePath = Server.MapPath("~/App_Data/" + fileName);

                if (Path.GetExtension(filePath).Equals(".xls"))                             // for 97-03 Excel file //
                    connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1;\"";
                else if (Path.GetExtension(filePath).Equals(".xlsx"))                       // for 2007 Excel file  //
                    connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=1;\"";

                return connectionString;
            }

        }

        protected void btnFinalSaveQstn_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlRealTestQstnType.SelectedItem.Text.Trim() == "Radio")
                {
                    objQABE.Category_Id = Convert.ToInt32(ddlFinalCategory.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlFinalSubject.SelectedItem.Value);
                    objQABE.Test_Type = "RealTest";
                    objQABE.Question_Type = "Radio";
                    objQABE.Unit_Id = 0;
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
                    SqlDataReader dr = objEPBL.InsertSampleTestdata(objQABE);
                    ClearFinalControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvFinalExcelView.DataSource = dt;
                    gvFinalExcelView.DataBind();
                }
                else if (ddlRealTestQstnType.SelectedItem.Text.Trim() == "Fill In Blanks")
                {
                    objQABE.Category_Id = Convert.ToInt32(ddlFinalCategory.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlFinalSubject.SelectedItem.Value);
                    objQABE.Question = txtQstnName.Text.Trim();
                    objQABE.Answer = txtFinalQstnAns.Text.Trim();
                    objQABE.Test_Type = "RealTest";
                    objQABE.Question_Type = "FillBlanks";
                    SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                    ClearControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvFinalExcelView.DataSource = dt;
                    gvFinalExcelView.DataBind();
                }
                else if (ddlRealTestQstnType.SelectedItem.Text.Trim() == "Descriptive")
                {
                    objQABE.Category_Id = Convert.ToInt32(ddlFinalCategory.SelectedItem.Value);
                    objQABE.Subject_Id = Convert.ToInt32(ddlFinalSubject.SelectedItem.Value);
                    objQABE.Question = txtQstnName.Text.Trim();
                    objQABE.Answer = txtFinalDiscriptiveAns.Text.Trim();
                    objQABE.Test_Type = "RealTest";
                    objQABE.Question_Type = "Descriptive";
                    SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                    ClearControls();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvFinalExcelView.DataSource = dt;
                    gvFinalExcelView.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnFinalExcelUpload_Click(object sender, EventArgs e)
        {
            Display_DataFinal();
        }

        public void Display_DataFinal()
        {
            try
            {

                string connectionString = GetData_ExcelFinalTest();

                if (connectionString == "NoData")
                {
                    // ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "NoExcel();", true);
                }
                else
                {

                    OleDbConnection conn = new OleDbConnection(connectionString);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    string query = "SELECT * FROM [Sheet1$] where [Question] IS NOT NULL";
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    OleDbDataReader dReader;
                    dReader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dReader);


                    System.Data.DataColumn newColumn = new System.Data.DataColumn("Category_Id", typeof(int));
                    newColumn.DefaultValue = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn);

                    System.Data.DataColumn newColumn1 = new System.Data.DataColumn("Subject_Id", typeof(int));
                    newColumn1.DefaultValue = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn1);

                    System.Data.DataColumn clmUnit_Id = new System.Data.DataColumn("Unit_Id", typeof(int));
                    clmUnit_Id.DefaultValue = 0;
                    dt.Columns.Add(clmUnit_Id);

                    System.Data.DataColumn newColumn2 = new System.Data.DataColumn("Test_Type", typeof(string));
                    newColumn2.DefaultValue = "SampleTest";
                    dt.Columns.Add(newColumn2);

                    //System.Data.DataColumn newColumn3 = new System.Data.DataColumn("Status_date", typeof(DateTime));
                    //newColumn3.DefaultValue = "2015/06/12";
                    //dt.Columns.Add(newColumn3);
                    conn.Close();
                    string fileName = ViewState["filename"].ToString();
                    File.Delete(Server.MapPath("~/App_Data/" + fileName));

                    objQABE.dtExcelUpload = dt;
                    // SqlDataReader dr = objEPBL.InsertExcelSampleTestdata(objQABE);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                        objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                        objQABE.Test_Type = "RealTest";
                        //objQABE.Exercise_ID = Convert.ToInt32(txtexeID.Text.Trim());
                        objQABE.Question = dt.Rows[i]["Question"].ToString();
                        objQABE.A = dt.Rows[i]["A"].ToString();
                        objQABE.B = dt.Rows[i]["B"].ToString();
                        objQABE.C = dt.Rows[i]["C"].ToString();
                        objQABE.D = dt.Rows[i]["D"].ToString();
                        objQABE.E = dt.Rows[i]["E"].ToString();
                        objQABE.Answer = dt.Rows[i]["Answer"].ToString();
                        SqlDataReader dr = objEPBL.InsertSampleTestdata(objQABE);
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void lnkbtnFTExcel_Click(object sender, EventArgs e)
        {
            string XlsPath = "";
            if (ddlRealTestQstnType.SelectedItem.Text == "Radio")
            {
                XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
            }
            else if (ddlRealTestQstnType.SelectedItem.Text == "Fill In Blanks")
            {
                XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
            }
            else if (ddlRealTestQstnType.SelectedItem.Text == "Descriptive")
            {
                XlsPath = Server.MapPath(@"~/Excel_Sheet_File/RadioQstns.xlsx");
            }

            if (XlsPath != "")
            {
                FileInfo fileDet = new System.IO.FileInfo(XlsPath);
                Response.Clear();
                Response.Charset = "UTF-8";
                Response.ContentEncoding = Encoding.UTF8;
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fileDet.Name));
                Response.AddHeader("Content-Length", fileDet.Length.ToString());
                Response.ContentType = "application/ms-excel";
                Response.WriteFile(fileDet.FullName);
                Response.End();
            }
        }

        protected void btnFinalViewExcel_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = GetData_ExcelFinalTest();

                if (connectionString == "NoData")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "NoExcel();", true);
                }
                else
                {

                    OleDbConnection conn = new OleDbConnection(connectionString);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    string query = "SELECT * FROM [Sheet1$] where [Question] IS NOT NULL";
                    OleDbCommand cmd = new OleDbCommand(query, conn);

                    OleDbDataReader dReader;
                    dReader = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dReader);

                    gvFinalExcelView.DataSource = dt;
                    gvFinalExcelView.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        #endregion FinalTest 

        #region Bookings

     
        public void LoadProgamsDrpdown()
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

        protected void ddlBookingsPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBookingsCategories.Items.Clear();
            ddlbookingYear.Items.Clear();
            ddlbookingGroup.Items.Clear();
            ddlBookingsSubject.Items.Clear();
          
            int programId = Convert.ToInt32(ddlBookingsPrograms.SelectedItem.Value);
            if (programId != 0)
            {
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
            else
            {
               
                ddlBookingsCategories.Items.Insert(0,new ListItem("--Select--","0"));               
                ddlbookingYear.Items.Insert(0, new ListItem("--Select--", "0"));                
                ddlbookingGroup.Items.Insert(0, new ListItem("--Select--", "0"));                
                ddlBookingsSubject.Items.Insert(0, new ListItem("--Select--", "0"));  
            }
        }

        protected void ddlBookingsCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlbookingYear.Items.Clear();
            ddlbookingGroup.Items.Clear();
            ddlBookingsSubject.Items.Clear();
           
            int CategorieID = Convert.ToInt32(ddlBookingsCategories.SelectedItem.Value);
            if (CategorieID != 0)
            {
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategorieID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlbookingGroup.DataSource = dt;
                    ddlbookingGroup.DataValueField = "Branch_Id";
                    ddlbookingGroup.DataTextField = "Branch_Name";
                    ddlbookingGroup.DataBind();
                    ddlbookingGroup.Items.Insert(0, new ListItem("--Select--","0"));
                }
            }
            else
            {
                
                ddlbookingYear.Items.Insert(0, new ListItem("--Select--", "0"));               
                ddlbookingGroup.Items.Insert(0, new ListItem("--Select--", "0"));               
                ddlBookingsSubject.Items.Insert(0, new ListItem("--Select--", "0"));  
            }
        }

        protected void ddlbookingGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlbookingYear.Items.Clear();
            ddlBookingsSubject.Items.Clear();
            
            int SubjectID = Convert.ToInt32(ddlbookingGroup.SelectedItem.Value);
            if (SubjectID != 0)
            {
                SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(SubjectID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlbookingYear.DataSource = dt;
                    ddlbookingYear.DataValueField = "Year_Id";
                    ddlbookingYear.DataTextField = "Branch_Year_No";
                    ddlbookingYear.DataBind();
                    ddlbookingYear.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
            else
            {
               
                ddlbookingYear.Items.Insert(0, new ListItem("--Select--", "0"));                
                ddlBookingsSubject.Items.Insert(0, new ListItem("--Select--", "0"));  
            }
        }

        protected void ddlbookingYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBookingsSubject.Items.Clear();
           
            int YearID = Convert.ToInt32(ddlbookingYear.SelectedItem.Value);
            if (YearID != 0)
            {
                SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(YearID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlBookingsSubject.DataSource = dt;
                    ddlBookingsSubject.DataValueField = "Subject_Id";
                    ddlBookingsSubject.DataTextField = "Subject_Name";
                    ddlBookingsSubject.DataBind();
                    ddlBookingsSubject.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
            else
            {               
                ddlBookingsSubject.Items.Insert(0, new ListItem("--Select--", "0"));                
            }
        }

        //protected void ddlBookingsSubject_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int UnitID = Convert.ToInt32(ddlBookingsSubject.SelectedItem.Value);
        //    if (UnitID != 0)
        //    {
        //        SqlDataReader dr = objBL.GetUnitBasedOnSubjectDrpdwn(UnitID);
        //        DataTable dt = new DataTable();
        //        dt.Load(dr);
        //        if (dt.Rows.Count > 0)
        //        {
        //            ddlBookingsUnit.DataSource = dt;
        //            ddlBookingsUnit.DataValueField = "Unit_Id";
        //            ddlBookingsUnit.DataTextField = "Unit_Name";
        //            ddlBookingsUnit.DataBind();
        //            ddlBookingsUnit.Items.Insert(0,new ListItem("---Select---","0"));
        //        }
        //    }
        //}

        protected void btnAddSlot_Click(object sender, EventArgs e)
        {
            string FlexField = ddlBookingsPrograms.SelectedItem.Value + "-" + ddlBookingsCategories.SelectedItem.Value + "-" + ddlbookingGroup.SelectedItem.Value + "-" + ddlbookingYear.SelectedItem.Value + "-" + ddlBookingsSubject.SelectedItem.Value;
            objSBE.FlexField = FlexField;
            objSBE.Subject_Id = Convert.ToInt32(ddlBookingsSubject.SelectedItem.Value);
            objSBE.Slot_Name = ddlBookingSlotId.SelectedItem.Text.Trim();
            objSBE.Slot_Date = Convert.ToDateTime(txtSlotDate.Text.Trim());
            objSBE.Slot_Time=txtSlotTime.Text.Trim();
            objSBE.Slot_Status = txtBookongStatus.Text;
            objSBE.Slot_Sessions = Convert.ToInt32(txtBookingSessions.Text.Trim());
            objSBE.StatusDate = Convert.ToDateTime(txtBookingStatusdate.Text.Trim());
            objSBE.Remarks = txtBookingsRemarks.Text.Trim();
            SqlDataReader dr = objBL.InsertNew_Slot(objSBE);
            ClearControls();
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvUpdateBookings.DataSource = dt;
            gvUpdateBookings.DataBind();

            ddlBookingsCategories.Items.Clear();
            ddlbookingGroup.Items.Clear();
            ddlbookingYear.Items.Clear();
            ddlBookingsSubject.Items.Clear();
            ddlBookingsPrograms.SelectedIndex = -1;
        }

        #endregion Bookings

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
            PnlTesttype.Visible = false;
            ddlResultQstnType.SelectedIndex = -1;

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
            PnlTesttype.Visible = false;
            ddlResultQstnType.SelectedIndex = -1;

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

        protected void ddlResultSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PnlTesttype.Visible = true;
        }

        protected void ddlResultQstnType_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblResultHView.Visible = true;
            lblResultHGenerated.Visible = true;
            lblResultHToGenerate.Visible = true;

            gvResult.DataSource = null;
            gvResult.DataBind();
            if (ddlResultQstnType.SelectedValue == "2")
            {
                LoadResultGV();
            }
            else if (ddlResultQstnType.SelectedValue == "1")
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
                    btnResultSubmit.Visible = true;
                    btncancelResultSubmit.Visible = true;
                    lblResult.Visible = false;
                }
                else
                {
                    btnResultSubmit.Visible = false;
                    btncancelResultSubmit.Visible = false;
                    lblResult.Visible = true;
                }
            }
            
        }

        protected void btnResultSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string Answer = "";

                foreach (GridViewRow row in gvResult.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            if (Answer == "")
                            {
                                Answer = id;
                            }
                            else
                            {
                                Answer = Answer + "," + id;
                            }
                        }
                    }
                }
                if (Answer != "")
                {
                    int programId = Convert.ToInt32(ddlResultProgram.SelectedItem.Value);
                    int CategoryId = Convert.ToInt32(ddlResultCategory.SelectedItem.Value);
                    int SubjectID = Convert.ToInt32(ddlResultSubject.SelectedItem.Value);
                    string QstnType = ddlResultQstnType.SelectedItem.Text;

                    if (ddlResultQstnType.SelectedValue == "2")
                    {

                        SqlDataReader dr = objEPBL.ActivateResult(Answer, programId, CategoryId, SubjectID, QstnType);
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        if (dt.Rows.Count > 0)
                        {
                            gvResultActivate.DataSource = dt;
                            gvResultActivate.DataBind();
                            btnGenerateCertificate.Visible = true;
                            btnCancelGenerateCertificate.Visible = true;
                            lblResultActive.Visible = false;
                        }
                        else
                        {
                            btnGenerateCertificate.Visible = false;
                            btnCancelGenerateCertificate.Visible = false;
                            lblResultActive.Visible = true;
                        }


                        SqlDataReader dr1 = objEPBL.ResultData(programId, CategoryId, SubjectID, QstnType);
                        DataTable dt1 = new DataTable();
                        dt1.Load(dr1);
                        if (dt1.Rows.Count > 0)
                        {
                            gvResult.DataSource = dt1;
                            gvResult.DataBind();
                            btnResultSubmit.Visible = true;
                            btncancelResultSubmit.Visible = true;
                            lblResult.Visible = false;
                        }
                        else
                        {
                            btnResultSubmit.Visible = false;
                            btncancelResultSubmit.Visible = false;
                            lblResult.Visible = true;
                        }
                    }

                    //else if (ddlResultQstnType.SelectedValue == "1")
                    //{
                    //    SqlDataReader dr1 = objEPBL.ResultData(programId, CategoryId, SubjectID, QstnType);
                    //    DataTable dt1 = new DataTable();
                    //    dt1.Load(dr1);
                    //    if (dt1.Rows.Count > 0)
                    //    {
                    //        gvResult.DataSource = dt1;
                    //        gvResult.DataBind();
                    //        btnResultSubmit.Visible = true;
                    //        btncancelResultSubmit.Visible = true;
                    //    }
                    //    else
                    //    {
                    //        btnResultSubmit.Visible = false;
                    //        btncancelResultSubmit.Visible = false;
                    //    }
                    //}

                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnGenerateCertificate_Click(object sender, EventArgs e)
        {
            try
            {
                string Answer = "";

                foreach (GridViewRow row in gvResultActivate.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objEPBL.ActivateCertificate(Convert.ToInt32(row.Cells[1].Text));
                            if (Answer == "")
                            {
                                Answer = id;
                            }
                            else
                            {
                                Answer = Answer + "," + id;
                            }
                        }
                    }
                }
                if (Answer != "")
                {
                    LoadResultGV();
                    SqlDataReader dr = objEPBL.GetActivatedCertificates(Answer);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    gvresultCertificate.DataSource = dt;
                    gvresultCertificate.DataBind();
                    btnResultView.Visible = true;
                    btnResultViewCancel.Visible = true;
                }
            }
            catch (Exception)
            {
            }
        }

        private void LoadResultGV()
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
                btnResultSubmit.Visible = true;
                btncancelResultSubmit.Visible = true;
                lblResult.Visible = false;
            }
            else
            {
                gvResult.DataSource = null;
                gvResult.DataBind();
                btnResultSubmit.Visible = false;
                btncancelResultSubmit.Visible = false;
                lblResult.Visible = true;
            }
           
            SqlDataReader dr1 = objEPBL.GeneratedResultData(programId, CategoryId, SubjectID, QstnType);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                gvResultActivate.DataSource = dt1;
                gvResultActivate.DataBind();
                btnGenerateCertificate.Visible = true;
                btnCancelGenerateCertificate.Visible = true;
                lblResultActive.Visible = false;
            }
            else
            {
                gvResultActivate.DataSource = null;
                gvResultActivate.DataBind();
                btnGenerateCertificate.Visible = false;
                btnCancelGenerateCertificate.Visible = false;
                lblResultActive.Visible = true;
            }
           
        }

        protected void btnResultView_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in gvresultCertificate.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {

                            string id = row.Cells[1].Text;
                            bindCertificate();
                        }
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        private void bindCertificate()
        {
            PnlSubjectCertificate.Visible = true;


            lblCertificateCategory.Text = "";
            lblCertificateGroup.Text = "";
            lblcertificateName.Text = "";
            lblCertificateOnDate.Text = "";
            lblCertificateOrg.Text = "";
            lblCertificateRegDate.Text = "";
            lblCertificateRegNo.Text = "";
            lblCertificateSubject.Text = "";
            lblCertificateYear.Text = "";
            
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
            GetCategoryGrade();
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string Answer = "";
                foreach (GridViewRow row in GVGrade.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;
                            SqlDataReader dr = objBL.GenerateCategoryGrade(row.Cells[1].Text);
                            Answer = row.Cells[1].Text;
                        }
                    }
                }
                if (Answer != "")
                {
                    GetCategoryGrade();
                }
            }
            catch (Exception)
            {
            }
        }

        private void GetCategoryGrade()
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


        #endregion Grade

       

       

       

      

        

        

       

       

      
    }
}