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
using System.IO;
using System.Text;
using System.Data.OleDb;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text.RegularExpressions;
using System.Drawing;

namespace PresentationLayer.Admin
{
    public partial class Admin_Training : System.Web.UI.Page
    {
        AddContentBE objAddContent = new AddContentBE();
        AddContentBEList addcontlist = new AddContentBEList();
        AddProgramsBL objBL = new AddProgramsBL();
        Training objTraining = new Training();
        QstnAnsBE objQABE = new QstnAnsBE();
        EditProgram objEPBL = new EditProgram();
        Schedules objSchedulesBE = new Schedules();
        static int Flag = 0;
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        string readfiledata, chkeditdata, QstNAid;
        int Duration, UnitCnt, days;
        static string eddat = string.Empty;
        static DateTime startDate, endDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtclassstatusDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");
                txtSubStatusDate.Text = DateTime.Now.Date.ToString("dd-MM-yyyy");

                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                LoadProgamsDrpdown();
                LoadNewProgamsDrpdown();
                ProgamsDrpdown();
                ScheduleProgamsDrpdown();
                // }
            }
        }

        public void LoadProgamsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsExcercise.DataSource = dt;
            ddlProgramsExcercise.DataValueField = "Program_id";
            ddlProgramsExcercise.DataTextField = "Program_name";
            ddlProgramsExcercise.DataBind();
            ddlProgramsExcercise.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
        }

        #region Content

        protected void ddlProgramsExcercise_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            LBLERRmSG.Text = string.Empty;
            ddlCategoriesForExcercises.Items.Clear();
            ddlSubjectforExcercise.Items.Clear();
            ddlUnitNameforExcercise.Items.Clear();

            int CategorieID = Convert.ToInt32(ddlProgramsExcercise.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategoriesForExcercises.DataSource = dt;
                ddlCategoriesForExcercises.DataValueField = "Category_Id";
                ddlCategoriesForExcercises.DataTextField = "Category_Name";
                ddlCategoriesForExcercises.DataBind();
                ddlCategoriesForExcercises.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
        }

        protected void ddlCategoriesForExcercises_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            int CategoryId = Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlContentcatsch.DataSource = dt;
                ddlContentcatsch.DataValueField = "S_NO";
                ddlContentcatsch.DataTextField = "Schedule_ID";
                ddlContentcatsch.DataBind();
                ddlContentcatsch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }

        }

        protected void ddlContentcatsch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            if (ddlContentcatsch.SelectedItem.Text != "---Select---")
            {
                int CategoryId = Convert.ToInt32(ddlCategoriesForExcercises.SelectedItem.Value);
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlGroupForContent.DataSource = dt;
                    ddlGroupForContent.DataValueField = "Branch_Id";
                    ddlGroupForContent.DataTextField = "Branch_Name";
                    ddlGroupForContent.DataBind();
                    ddlGroupForContent.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
                }
            }
        }

        protected void ddlGroupForContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            int BranchId = Convert.ToInt32(ddlGroupForContent.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlYearForContent.DataSource = dt;
                ddlYearForContent.DataValueField = "Year_Id";
                ddlYearForContent.DataTextField = "Branch_Year_No";
                ddlYearForContent.DataBind();
                ddlYearForContent.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlYearForContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            int yearId = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectforExcercise.DataSource = dt;
                ddlSubjectforExcercise.DataValueField = "Subject_Id";
                ddlSubjectforExcercise.DataTextField = "SubjectName";
                ddlSubjectforExcercise.DataBind();
                ddlSubjectforExcercise.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubjectforExcercise_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubjectforExcercise.SelectedItem.Value);
            //SqlDataReader dr1 = objBL.getcontsubSchId(SubjectID);
            SqlDataReader dr1 = objBL.GetcontScheduleBySubject(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlconsubschid.DataSource = dt1;
                ddlconsubschid.DataValueField = "Subject_Id";
                ddlconsubschid.DataTextField = "Subject_ScheduleID";
                ddlconsubschid.DataBind();
                ddlconsubschid.Items.Insert(0, "--Select--");
            }
        }

        protected void ddlconsubschid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            LBLERRmSG.Text = string.Empty;
            ddlUnitNameforExcercise.Items.Clear();
            int CategorieID = Convert.ToInt32(ddlSubjectforExcercise.SelectedItem.Value);
            SqlDataReader dr = objBL.GetUnitsForContent(CategorieID);
            DataTable dt = new DataTable();
            dt.Load(dr);

            if (dt.Rows.Count > 0)
            {
                ddlUnitNameforExcercise.DataSource = dt;
                ddlUnitNameforExcercise.DataValueField = "Unit_Id";
                ddlUnitNameforExcercise.DataTextField = "Unit_Name";
                ddlUnitNameforExcercise.DataBind();
                ddlUnitNameforExcercise.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            LBLERRmSG.Text = string.Empty;
            GridView1.DataSource = null;
            if (ddlType.SelectedItem.Value == "4")
            {
                VideoPanel.Visible = false;
                TextPanel.Visible = true;
                txtPanel.Visible = true;
                btnaddpanel.Visible = true;
                gvPanel.Visible = true;
                txtUnitSecName.Visible = false;
                tdforDateRecording.Visible = false;
            }
            else if (ddlType.SelectedItem.Value == "3")
            {
                VideoPanel.Visible = true;
                TextPanel.Visible = false;
                txtPanel.Visible = false;
                btnaddpanel.Visible = false;
                gvPanel.Visible = false;
                tdforDateRecording.Visible = true;
                //getstring.Value = "video3.mp4";
            }
            else if (ddlType.SelectedItem.Value == "2")
            {
                VideoPanel.Visible = true;
                TextPanel.Visible = false;
                txtPanel.Visible = false;
                btnaddpanel.Visible = false;
                gvPanel.Visible = false;
                tdforDateRecording.Visible = false;
                //getstring.Value = "video3.mp4";
            }
            else if (ddlType.SelectedItem.Value == "1")
            {
                VideoPanel.Visible = false;
                TextPanel.Visible = true;
                txtPanel.Visible = true;
                btnaddpanel.Visible = true;
                gvPanel.Visible = true;
                tdforDateRecording.Visible = false;
                btnAddFiles.Visible = true;
            }
            else
            {
                VideoPanel.Visible = false;
                TextPanel.Visible = false;
                tdforDateRecording.Visible = false;
                txtPanel.Visible = false;
                btnaddpanel.Visible = false;
                gvPanel.Visible = false;
            }
        }

        private void gridVIEWData()
        {
            dt1.Columns.Add("Content_Data", typeof(string));
            Session["dtInSession"] = dt1;     //Saving Datatable To Session 
        }

        internal void bindgrid()
        {
            LBLERRmSG.Text = string.Empty;
            TextPanel.Visible = true;
            string finame = string.Empty;
            btnAddFiles.Visible = true;
            string textPa = Server.MapPath("/img/uploadfiles");
            gridVIEWData();
            //DataRow dr;
            if (ContentUpload.HasFile)
            {
                if (ContentUpload.PostedFile.ContentType == "txt/TXT" || ContentUpload.PostedFile.ContentType == "text/plain")
                {
                    if (ContentUpload.FileContent.Length > 0)
                    {
                        //sb.AppendFormat(" Uploading file: {0}", ContentUpload.FileName);
                        string filname = Path.GetFileName(ContentUpload.PostedFile.FileName);
                        string dg = ddlUnitNameforExcercise.SelectedItem.Text;
                        string dts = System.DateTime.Now.ToString("dd-MM-yyyy");
                        finame = dts + "-" + dg + "-" + filname;

                        foreach (GridViewRow gvRow in GridView1.Rows)
                        {
                            DataRow dr = dt1.NewRow();
                            dr["Content_Data"] = ((Label)gvRow.FindControl("lblSno")).Text;
                            dt1.Rows.Add(dr);
                        }
                        if (Session["dtInSession"] != null)
                        {
                            dt1 = (DataTable)Session["dtInSession"];
                            DataRow dr = dt1.NewRow();
                            dr["Content_Data"] = finame;
                            dt1.Rows.Add(dr);
                        }
                        if (!Directory.Exists(textPa))
                        {
                            Directory.CreateDirectory(textPa);
                        }

                        if ((System.IO.File.Exists(textPa + "\\" + finame)))
                        {
                            LBLERRmSG.Text = "File already added";
                            LBLERRmSG.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            ContentUpload.SaveAs(textPa + "\\" + finame);
                            objAddContent.Content_Data = finame;
                            //DataRow dtr = dt1.NewRow();
                            //dtr["Content_Data"] = finame;
                            //dt1.Rows.Add(dtr);
                        }
                    }
                }
            }
            Session["dtInSession"] = dt1;
            GridView1.Visible = true;
            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            bindgrid();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void btnAddFiles_Click(object sender, EventArgs e)
        {
            bindgrid();
        }

        protected void btnAddContentdata_Click(object sender, EventArgs e)
        {
            LBLERRmSG.Text = string.Empty;
            try
            {
                Flag = 0;
                InsertTextFile();
                if (Flag == 1)
                {
                    LBLERRmSG.Text = "This File Already Existed";
                    LBLERRmSG.ForeColor = System.Drawing.Color.Red;
                }
                else
                    if (Flag == 2)
                    {
                        LBLERRmSG.Text = "Please Select Files To Upload";
                        LBLERRmSG.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        objAddContent.Program_Id = int.Parse(ddlProgramsExcercise.SelectedItem.Value);
                        objAddContent.Category_Id = int.Parse(ddlCategoriesForExcercises.SelectedItem.Value);
                        objAddContent.Subject_Id = int.Parse(ddlSubjectforExcercise.SelectedItem.Value);
                        objAddContent.Unit_Id = int.Parse(ddlUnitNameforExcercise.SelectedItem.Value);
                        objAddContent.Content_Type = ddlType.SelectedItem.Text;
                        objAddContent.Group_Id = int.Parse(ddlGroupForContent.SelectedItem.Value);
                        objAddContent.Year_Id = int.Parse(ddlYearForContent.SelectedItem.Value);
                        string[] ctscname = ddlContentcatsch.SelectedItem.Text.Split('(');
                        objAddContent.CategorySchedule_Name = ctscname[0];
                        string[] ctsuscid = ddlconsubschid.SelectedItem.Text.Split('(');
                        objAddContent.SubjectScheduleID = ctsuscid[0];
                        objAddContent.status = ddlConStatus.SelectedItem.Text;
                        if (ddlType.SelectedValue == "1")
                        {
                            objAddContent.Content_Data = txtUnitSecName.Text;
                            //objAddContent.BrowsedFilePath = "";
                        }
                        else
                        {
                            objAddContent.Content_Data = "";
                            // objAddContent.BrowsedFilePath = "";
                        }
                        addcontlist.List.Add(new AddContentBE()
                        {
                            Program_Name = ddlProgramsExcercise.SelectedItem.Value + "-" + ddlProgramsExcercise.SelectedItem.Text,
                            Category_Name = ddlCategoriesForExcercises.SelectedItem.Value + "-" + ddlCategoriesForExcercises.SelectedItem.Text,
                            Group_Name = ddlGroupForContent.SelectedItem.Value + "-" + ddlGroupForContent.SelectedItem.Text,
                            Year_Name = ddlYearForContent.SelectedItem.Value + "-" + ddlYearForContent.SelectedItem.Text,
                            Subject_Name = ddlSubjectforExcercise.SelectedItem.Text,
                            Unit_Name = ddlUnitNameforExcercise.SelectedItem.Value + "-" + ddlUnitNameforExcercise.SelectedItem.Text,
                            BrowsedFilePath = objAddContent.BrowsedFilePath
                        });

                        SqlDataReader dr = objTraining.AddContent(objAddContent);
                        //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Inserted Successfully')", true);
                        LBLERRmSG.Text = "Inserted Successfully";
                        LBLERRmSG.ForeColor = System.Drawing.Color.Green;
                        //LoadContentdata();
                        ClearFields();
                        GridView1.DataSource = null;
                        GridView1.DataBind();
                        gvContentData.DataSource = addcontlist.List;
                        gvContentData.DataBind();
                    }
            }
            catch
            {
                //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Insertion Failed')", true);
                LBLERRmSG.Text = "Insertion Failed";
                LBLERRmSG.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnCancelUnit_Click(object sender, EventArgs e)
        {
            LBLERRmSG.Text = string.Empty;
            GridView1.DataSource = null;
            ContentUpload.Dispose();
            ClearFields();
        }

        public void ClearFields()
        {
            GridView1.DataSource = null;
            ddlProgramsExcercise.SelectedIndex = 0;
            ddlCategoriesForExcercises.Items.Clear();
            ddlContentcatsch.Items.Clear();
            ddlGroupForContent.Items.Clear();
            ddlYearForContent.Items.Clear();
            ddlSubjectforExcercise.Items.Clear();
            ddlUnitNameforExcercise.Items.Clear();
            txtUnitSecName.Text = "";
            ddlType.SelectedIndex = 0;
            ddlconsubschid.SelectedIndex = 0;
            ddlConStatus.SelectedIndex = 0;
            GridView1.Visible = false;
        }

        public void LoadContentdata()
        {
            SqlDataReader dr = objTraining.LoadContentDataGridView();
            DataTable dt = new DataTable();
            dt.Load(dr);
            gvContentData.DataSource = dt;
            gvContentData.DataBind();
        }

        //inserting theTextFile or Video File
        public void InsertTextFile()
        {
            StringBuilder sb = new StringBuilder();
            string textPath = string.Empty;
            string gvfilename = string.Empty;
            Flag = 0;

            if (ddlType.SelectedItem.Text == "Text")
            {
                textPath = Server.MapPath("/UploadedFile/TextFile");
                if (!Directory.Exists(textPath))
                {
                    Directory.CreateDirectory(textPath);
                }
                string fnam = ddlUnitNameforExcercise.SelectedItem.Value + "-" + ddlUnitNameforExcercise.SelectedItem.Text;
                string fullpath = Server.MapPath("/img/uploadfiles");
                objAddContent.BrowsedFilePath = "TextFile\\" + fnam + ".txt";
                if (txtUnitSecName.Text == string.Empty)
                {
                    chkeditdata = "";
                }
                else
                {
                    chkeditdata = txtUnitSecName.Text.Trim();
                }
                foreach (GridViewRow grdvi in GridView1.Rows)
                {
                    CheckBox cbkbo = (CheckBox)grdvi.FindControl("chkUnitchild");
                    if (cbkbo.Checked == true)
                    {
                        gvfilename = ((Label)grdvi.FindControl("lblSno")).Text;
                        using (StreamReader streamReader = new StreamReader(fullpath + "\\" + gvfilename, Encoding.UTF8))
                        {
                            readfiledata += streamReader.ReadToEnd() + Environment.NewLine;
                        }
                    }
                    else
                    {
                        readfiledata = "";
                    }
                }
                if (readfiledata != "")
                {
                    System.IO.FileStream fst = new FileStream(textPath + "\\" + fnam + ".txt", FileMode.Create);
                    //string result = txtUnitSecName.Text;
                    string resultf = Regex.Replace(readfiledata + Environment.NewLine + chkeditdata, @"<[^>]*>", string.Empty);
                    //string result = txtUnitSecName.Text.Trim();
                    string str2 = Server.HtmlEncode(resultf);
                    Byte[] txtt = new UTF8Encoding(true).GetBytes(str2);
                    fst.Write(txtt, 0, txtt.Length);
                    GridView1.DataSource = null;
                }
                else
                {
                    Flag = 2;
                }
            }
            else
                if (ddlType.SelectedItem.Text == "References")
                {
                    textPath = Server.MapPath("/UploadedFile/References");
                    if (!Directory.Exists(textPath))
                    {
                        Directory.CreateDirectory(textPath);
                    }
                    string filename = ddlUnitNameforExcercise.SelectedItem.Value + "-" + ddlUnitNameforExcercise.SelectedItem.Text;
                    if (ContentUpload.HasFile)
                    {
                        if (ContentUpload.PostedFile.ContentType == "txt/TXT" || ContentUpload.PostedFile.ContentType == "text/plain")
                        {
                            if (ContentUpload.FileContent.Length > 0)
                            {
                                sb.AppendFormat(" Uploading file: {0}", ContentUpload.FileName);
                                string finame = Path.GetFileName(ContentUpload.PostedFile.FileName);
                                //string txtpat = Server.MapPath(finame);
                                string textPa = Server.MapPath("/img/uploadfiles");
                                if (!Directory.Exists(textPa))
                                {
                                    Directory.CreateDirectory(textPa);
                                }
                                ContentUpload.SaveAs(textPa + "\\" + finame);
                                using (StreamReader streamReader = new StreamReader(textPa + "\\" + finame, Encoding.UTF8))
                                {
                                    readfiledata = streamReader.ReadToEnd();
                                }

                                if ((System.IO.File.Exists(textPa + "\\" + finame)))
                                {
                                    System.IO.File.Delete(textPa + "\\" + finame);
                                }
                            }
                        }
                    }
                    else
                    {
                        readfiledata = "";
                    }

                    objAddContent.BrowsedFilePath = "References\\" + filename + ".txt";

                    if (File.Exists(textPath + "\\" + filename + ".txt"))
                    {
                        Flag = 1;
                    }
                    else
                    {
                        System.IO.FileStream fs = new FileStream(textPath + "\\" + filename + ".txt", FileMode.Create);
                        //string result = txtUnitSecName.Text;
                        string result = Regex.Replace(readfiledata, @"<[^>]*>", string.Empty);
                        //string result = txtUnitSecName.Text.Trim();
                        string str1 = Server.HtmlEncode(result);
                        Byte[] txt = new UTF8Encoding(true).GetBytes(str1);
                        fs.Write(txt, 0, txt.Length);
                    }
                }
                else
                    if (VideoUpload.FileContent.Length > 0)
                    {
                        try
                        {

                            //UploadVideo obj = new UploadVideo();
                            // string filename = VideoUpload.FileName;
                            string finame = ddlUnitNameforExcercise.SelectedItem.Text;
                            //string getdat = System.DateTime.Now.ToString("dd-MM-yyyy");

                            string videoPath = string.Empty;
                            if (ddlType.SelectedItem.Text == "Recording")
                            {
                                videoPath = Server.MapPath("/UploadedFile//Recordings");
                            }
                            else
                            {
                                videoPath = Server.MapPath("/UploadedFile//VideoFiles");
                            }
                            //string path = "C:\\Users\\admin\\Desktop\\OLSManage\\OLS_MAnage\\PresentationLayer\\video";//Server.MapPath("Uploads4");
                            //string videoPath = Server.MapPath("/UploadedFile/VideoFiles");

                            if (!Directory.Exists(videoPath))
                            {
                                Directory.CreateDirectory(videoPath);
                            }
                            string strFinalFileName = Path.GetFileName(VideoUpload.FileName);
                            string filename = ddlUnitNameforExcercise.SelectedItem.Value + "-" + finame;
                            long FileLength = VideoUpload.PostedFile.ContentLength;
                            long uploadchunklimit;
                            int SizeLimit = (int)FileLength;
                            if (FileLength <= 1024)
                            {
                                uploadchunklimit = 1;
                                SizeLimit = (int)FileLength;
                            }
                            else if (FileLength > 1024)
                            {
                                uploadchunklimit = FileLength / 1024;
                                SizeLimit = 10;
                            }
                            else if (FileLength <= 10240 && FileLength > 1024)
                            {
                                uploadchunklimit = FileLength / 1024;
                            }
                            else
                            {
                                uploadchunklimit = FileLength / 1024;
                            }

                            long lngSize = (long)SizeLimit;
                            lngSize = 1024 * 1024;
                            string ext = Path.GetExtension(VideoUpload.PostedFile.FileName);

                            if (ddlType.SelectedItem.Text == "Recording")
                            {
                                if (File.Exists(videoPath + "\\" + filename + ext))
                                {
                                    Flag = 1;
                                }
                                else
                                {
                                    VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
                                    objAddContent.BrowsedFilePath = "Recordings\\" + filename + ext;
                                    Flag = 0;
                                }
                            }
                            else
                            {
                                if (File.Exists(videoPath + "\\" + filename + ext))
                                {
                                    Flag = 1;
                                }
                                else
                                {
                                    VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
                                    objAddContent.BrowsedFilePath = "VideoFiles\\" + filename + ext;
                                    Flag = 0;
                                }
                            }

                            //VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
                            //objAddContent.BrowsedFilePath = "VideoFiles\\" + filename + ext;
                            //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('" + path + "')", true);

                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.ToString());
                        }

                    }
        }

        //if (ContentUpload.HasFile)
        //{
        //    if (ContentUpload.PostedFile.ContentType == "txt/TXT" ||ContentUpload.PostedFile.ContentType == "text/plain" )
        //    {
        //        if (ContentUpload.FileContent.Length > 0)
        //        {
        //            try
        //            {
        //                sb.AppendFormat(" Uploading file: {0}", ContentUpload.FileName);

        //                string textPath = Server.MapPath("/UploadedFile/TextFile");

        //                if (!Directory.Exists(textPath))
        //                {
        //                    Directory.CreateDirectory(textPath);
        //                }
        //                //saving the file
        //                //string filename = ddlUnitNameforExcercise.SelectedItem.Text;
        //                //string getdat = System.DateTime.Now.ToString();
        //                string finame = Path.GetFileName(ContentUpload.PostedFile.FileName);
        //                string fileName = ddlUnitNameforExcercise.SelectedItem.Value + "-" +ddlUnitNameforExcercise.SelectedItem.Text+"-"+ finame;
        //                string getExt = Path.GetExtension(fileName);
        //                if (File.Exists(textPath + "\\" + fileName))
        //                {
        //                    Flag = 1;
        //                }
        //                else
        //                {
        //                    ContentUpload.SaveAs(textPath + "\\" + fileName);
        //                    objAddContent.BrowsedFilePath = "TextFile\\" + fileName;
        //                    Flag=0;
        //                    //Showing the file information
        //                    //sb.AppendFormat("<br/> Save As: {0}", ContentUpload.PostedFile.FileName);
        //                    //sb.AppendFormat("<br/> File type: {0}", ContentUpload.PostedFile.ContentType);
        //                    //sb.AppendFormat("<br/> File length: {0}", ContentUpload.PostedFile.ContentLength);
        //                    //sb.AppendFormat("<br/> File name: {0}", ContentUpload.PostedFile.FileName);
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                sb.Append("<br/> Error <br/>");
        //                sb.AppendFormat("Unable to save file <br/> {0}", ex.Message);
        //            }
        //        }
        //    }
        //    else
        //    {
        //        LBLERRmSG.Text = "Accept Text Files Only";
        //        LBLERRmSG.ForeColor = System.Drawing.Color.Red;
        //    }
        //}
        //else if (VideoUpload.FileContent.Length > 0)
        //{
        //    try
        //    {

        //        //UploadVideo obj = new UploadVideo();
        //        // string filename = VideoUpload.FileName;
        //        string finame = ddlUnitNameforExcercise.SelectedItem.Text;
        //        //string getdat = System.DateTime.Now.ToString("dd-MM-yyyy");

        //        string videoPath = string.Empty;
        //        if (ddlType.SelectedItem.Text == "Recording")
        //        {
        //            videoPath = Server.MapPath("/UploadedFile//Recordings");
        //        }
        //        else
        //        {
        //            videoPath = Server.MapPath("/UploadedFile//VideoFiles");
        //        }
        //        //string path = "C:\\Users\\admin\\Desktop\\OLSManage\\OLS_MAnage\\PresentationLayer\\video";//Server.MapPath("Uploads4");
        //        //string videoPath = Server.MapPath("/UploadedFile/VideoFiles");

        //        if (!Directory.Exists(videoPath))
        //        {
        //            Directory.CreateDirectory(videoPath);
        //        }
        //        string strFinalFileName = Path.GetFileName(VideoUpload.FileName);
        //        string filename = ddlUnitNameforExcercise.SelectedItem.Value + "-" + finame + "-" + strFinalFileName;
        //        long FileLength = VideoUpload.PostedFile.ContentLength;
        //        long uploadchunklimit;
        //        int SizeLimit = (int)FileLength;
        //        if (FileLength <= 1024)
        //        {
        //            uploadchunklimit = 1;
        //            SizeLimit = (int)FileLength;
        //        }
        //        else if (FileLength > 1024)
        //        {
        //            uploadchunklimit = FileLength / 1024;
        //            SizeLimit = 10;
        //        }
        //        else if (FileLength <= 10240 && FileLength > 1024)
        //        {
        //            uploadchunklimit = FileLength / 1024;
        //        }
        //        else
        //        {
        //            uploadchunklimit = FileLength / 1024;
        //        }

        //        long lngSize = (long)SizeLimit;
        //        lngSize = 1024 * 1024;
        //        string ext = Path.GetExtension(VideoUpload.PostedFile.FileName);

        //        if (ddlType.SelectedItem.Text == "Recording")
        //        {
        //            if (File.Exists(videoPath + "\\" + filename + ext))
        //            {
        //                Flag = 1;
        //            }
        //            else
        //            {
        //                VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
        //                objAddContent.BrowsedFilePath = "Recordings\\" + filename + ext;
        //                Flag=0;
        //            }
        //        }
        //        else
        //        {
        //             if (File.Exists(videoPath + "\\" + filename + ext))
        //            {
        //                Flag = 1;
        //            }
        //            else
        //            {
        //               VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
        //               objAddContent.BrowsedFilePath = "VideoFiles\\" + filename + ext;
        //               Flag=0;
        //             }
        //        }

        //        //VideoUpload.PostedFile.SaveAs(videoPath + "\\" + filename + ext);
        //        //objAddContent.BrowsedFilePath = "VideoFiles\\" + filename + ext;
        //        //Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('" + path + "')", true);

        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.ToString());
        //    }

        //}
        //else
        //{
        //    // objAddContent.BrowsedFilePath = "";
        //string textPath = Server.MapPath("/UploadedFile/TextFile");
        //if (!Directory.Exists(textPath))
        //{
        //    Directory.CreateDirectory(textPath);
        //}
        //string finame = ddlUnitNameforExcercise.SelectedItem.Text;
        //string getdat = System.DateTime.Now.ToString("dd-MM-yyyy");
        //string filename = ddlUnitNameforExcercise.SelectedItem.Value + "-" + finame + "-" + getdat;
        //System.IO.FileStream fs = new FileStream(textPath + "\\" + filename + ".txt", FileMode.Create);
        ////string result = txtUnitSecName.Text;
        //string result = Regex.Replace(txtUnitSecName.Text.Trim(), @"<[^>]*>", string.Empty);
        ////string result = txtUnitSecName.Text.Trim();
        //string str1 = Server.HtmlEncode(result);

        //Byte[] txt = new UTF8Encoding(true).GetBytes(str1);
        //fs.Write(txt, 0, txt.Length);

        ////StreamWriter _testData = new StreamWriter(textPath + "\\" + filename + ".txt", true);
        ////_testData.WriteLine(str1);
        ////File.WriteAllLines(textPath + "\\" + filename + ".txt", str1);


        //objAddContent.BrowsedFilePath = "TextFile\\" + filename + ".txt";

        //@"[^a-zA-Z0-9_.]+"
        //Document document = new Document(PageSize.A4, 25, 25, 30, 30);
        //PdfWriter writer = PdfWriter.GetInstance(document, fs);
        //using (MemoryStream ms = new MemoryStream())
        //{
        //    document.Open();
        //    //String result = Regex.Replace(txtUnitSecName.Text, @"<[^>]*>", String.Empty);
        //    string result = Regex.Replace(txtUnitSecName.Text, @"<[^>]*>", String.Empty);
        //    string str1 = Server.HtmlEncode(result);

        //    // String result1 = Regex.Replace(outputString, @"&nbsp;", String.Empty);
        //    //String result2 = Regex.Replace(result, @"'", String.Empty);
        //    document.Add(new Paragraph(str1));
        //    objAddContent.BrowsedFilePath = "TextFile\\" + filename + ".pdf";
        //    document.Close();
        //    writer.Close();
        //    Response.ContentType = "pdf/application";
        //    Response.AddHeader("content-disposition",
        //    "attachment;filename=" + filename + ".pdf");
        //    Response.OutputStream.Write(ms.GetBuffer(), 0, ms.GetBuffer().Length);
        //}
        //}


        #endregion Content

        //Classes tab
        #region Classes

        public void LoadNewProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlClassPrograms.DataSource = dt;
            ddlClassPrograms.DataValueField = "Program_id";
            ddlClassPrograms.DataTextField = "Program_name";
            ddlClassPrograms.DataBind();
            ddlClassPrograms.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "---Select---"));

        }

        protected void ddlClassPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlClassCategories.Items.Clear();
            ddlclassSubjects.Items.Clear();

            int programId = Convert.ToInt32(ddlClassPrograms.SelectedItem.Value);
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlClassCategories.DataSource = dt;
                ddlClassCategories.DataValueField = "Category_Id";
                ddlClassCategories.DataTextField = "Category_Name";
                ddlClassCategories.DataBind();
                ddlClassCategories.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "--Select--"));
            }
        }

        protected void ddlClassCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlcatsch.Items.Clear();
            ddlyear.Items.Clear();
            ddlclassSubjects.Items.Clear();

            int CategoryId = Convert.ToInt32(ddlClassCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlcatsch.DataSource = dt;
                ddlcatsch.DataValueField = "S_NO";
                ddlcatsch.DataTextField = "Schedule_ID";
                ddlcatsch.DataBind();
                ddlcatsch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlcatsch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlclassSubjects.Items.Clear();

            int CategoryId = Convert.ToInt32(ddlClassCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlBranch.DataSource = dt;
                ddlBranch.DataValueField = "Branch_Id";
                ddlBranch.DataTextField = "Branch_Name";
                ddlBranch.DataBind();
                ddlBranch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }

            int scid = Convert.ToInt32(ddlcatsch.SelectedItem.Value);
            SqlDataReader sdr = objBL.Getschsteddates(scid);
            DataTable dtdt = new DataTable();
            dtdt.Load(sdr);
            if (dtdt.Rows.Count > 0)
            {
                lblstdt.Value = dtdt.Rows[0]["Schedule_srt_Date"].ToString();
                lbleddt.Value = dtdt.Rows[0]["Schedule_end_Date"].ToString();
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlyear.Items.Clear();
            ddlclassSubjects.Items.Clear();

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
                ddlyear.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlyear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlclassSubjects.Items.Clear();

            int yearId = Convert.ToInt32(ddlyear.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclassSubjects.DataSource = dt;
                ddlclassSubjects.DataValueField = "Subject_Id";
                ddlclassSubjects.DataTextField = "SubjectName";
                ddlclassSubjects.DataBind();
                ddlclassSubjects.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlclassSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlFaculty.Items.Clear();
            //SqlDataReader dr = objBL.GetPublishedFaculties(Convert.ToInt32(ddlclassSubjects.SelectedValue));
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //ddlFaculty.DataSource = dt;
            //ddlFaculty.DataValueField = "DetailsID";
            //ddlFaculty.DataTextField = "Name";
            //ddlFaculty.DataBind();
            //ddlFaculty.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));


            SqlDataReader dr1 = objBL.GetUnitDetails(Convert.ToInt32(ddlclassSubjects.SelectedValue));
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            UnitCnt = Convert.ToInt32(dt1.Rows.Count.ToString());
            ViewState["unitcnt"] = UnitCnt;
            if (dt1.Rows.Count > 0)
            {
                ddlClassUnits.DataSource = dt1;
                ddlClassUnits.DataValueField = "Unit_Id";
                ddlClassUnits.DataTextField = "Unit_Name";
                ddlClassUnits.DataBind();
                ddlClassUnits.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));
                ddlClassUnits.Items.Insert(1, new System.Web.UI.WebControls.ListItem("Select All", "1"));
            }

            ddlClassScheduleID.Items.Clear();
            SqlDataReader drSch = objBL.GetScheduleBySubject(Convert.ToInt32(ddlclassSubjects.SelectedValue));
            DataTable dtSch = new DataTable();
            dtSch.Load(drSch);
            ddlClassScheduleID.DataSource = dtSch;
            ddlClassScheduleID.DataValueField = "Schedule_ID";
            ddlClassScheduleID.DataTextField = "Subject_ScheduleID";
            ddlClassScheduleID.DataBind();
            ddlClassScheduleID.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
           
        }

        protected void ddlClassUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panelcls.Visible = true;
            lblprgname.Text = ddlClassPrograms.SelectedValue + ":" + ddlClassPrograms.SelectedItem.Text;
            lblcatname.Text = ddlClassCategories.SelectedValue + ":" + ddlClassCategories.SelectedItem.Text;
            //lblcatsch.Text = ddlcatsch.SelectedItem.Text;
            lblgrpname.Text = ddlBranch.SelectedValue + ":" + ddlBranch.SelectedItem.Text;
            lblsbjname.Text = ddlclassSubjects.SelectedItem.Text;
            lblunitname.Text = ddlClassUnits.SelectedItem.Text;
        }
        protected void ddlClassScheduleID_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SqlDataReader dr = objBL.GetDatesByschedule(ddlClassScheduleID.SelectedItem.Text,Convert.ToInt32(ddlclassSubjects.SelectedValue));
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //if(dt.Rows.Count>0)
            //{
            //    DateTime dtm=Convert.ToDateTime( dt.Rows[0]["Schedule_srt_Date"]);
            //    txtschsdate.Text = dtm.ToString("dd-MM-yyyy");
            //    DateTime dts = Convert.ToDateTime(dt.Rows[0]["Schedule_end_Date"]);
            //    txtschedate.Text = dts.ToString("dd-MM-yyyy");
            //}
        }

        private void gridVData()
        {
            //dt2.Columns.Add("ClassId", typeof(string));
            dt2.Columns.Add("Startdate", typeof(string));
            dt2.Columns.Add("Enddate", typeof(string));
            dt2.Columns.Add("Duration", typeof(string));
            dt2.Columns.Add("Status", typeof(string));
            ViewState["dt2Session"] = dt2;     //Saving Datatable To Session 
        }

        //protected void txtclassStartDate_TextChanged(object sender, EventArgs e)
        //{
        //    string[] catscid = ddlcatsch.SelectedItem.Text.Split('(');
        //    string catschid = catscid[0];
        //    string[] catscid1 = catscid[0].Split(':');
        //    string catschid1 = catscid1[0];

        //}

        protected void txtclassStartDate_TextChanged(object sender, EventArgs e)
        {
            string[] catscid = ddlcatsch.SelectedItem.Text.Split('(');
            string catschid = catscid[0];
            string[] catscid1 = catscid[0].Split(':');
            string catschid1 = catscid1[0];
        }

        protected void txtClassEndDate_TextChanged(object sender, EventArgs e)
        {
            string[] catscid = ddlcatsch.SelectedItem.Text.Split('(');
            string catschid = catscid[0];
        }

        protected void btnAddClass_Click(object sender, EventArgs e)
        {
            string[] catscid = ddlcatsch.SelectedItem.Text.Split('(');
            string catschid = catscid[0];
            string[] SubschId = ddlClassScheduleID.SelectedItem.Text.Split('(');
            string Subschid = SubschId[0];
            string stst = DateTime.Now.ToString("dd-MM-yyyy");
            gridVData();
            if (ddlClassUnits.SelectedItem.Text == "Select All")
            {
                SqlDataReader drt = objBL.GetSSubjectDuration(Convert.ToInt32(ddlclassSubjects.SelectedValue));
                DataTable dtt = new DataTable();
                dtt.Load(drt);
                Duration = Convert.ToInt32(dtt.Rows[0]["Subject_Duration"]);
                UnitCnt = Convert.ToInt32(ViewState["unitcnt"]);
                days = 1;

                DateTime endsDate = Convert.ToDateTime(txtclassStartDate.Text);

                // DateTime startdate = System.DateTime.Now.AddDays(days).ToString();
                for (int i = 0; i < UnitCnt; i++)
                {
                    int workingDaysToAdd = days;
                    if (i == 0)
                    {
                        startDate = Convert.ToDateTime(txtclassStartDate.Text);
                    }
                    else
                    {
                        startDate = endsDate.AddDays(1);
                        endsDate = startDate;
                    }
                    string name = ddlClassUnits.Items[i + 2].Value;
                    while (workingDaysToAdd > 0)
                    {
                        if (endsDate.DayOfWeek != DayOfWeek.Saturday && endsDate.DayOfWeek != DayOfWeek.Sunday)
                            workingDaysToAdd--;
                        if (workingDaysToAdd > 0)
                            endsDate = endsDate.AddDays(1);
                    }

                    AddClass objClass = new AddClass();
                    //lblcls.Text = "Category-Id:Name:" + ddlClassCategories.SelectedValue + " :" + ddlClassCategories.SelectedItem + "  " + "GROUP:" + " " + ddlBranch.SelectedItem + " " + "Year/Sem:" + " " + ddlyear.SelectedItem + " " + "Subject-Id:Name:" + " " + ddlclassSubjects.SelectedItem + " " + ddlScheduleID.SelectedValue + " " + "Unit-Id:Name:" + " " + ddlClassUnits.SelectedItem;
                    objClass.CategoryId = int.Parse(ddlClassCategories.SelectedItem.Value);
                    objClass.ScheduleID = Subschid;
                    objClass.ClassType = ddlclasstype.SelectedItem.Text;
                    objClass.Duration = days.ToString();
                    objClass.Enddate = Convert.ToDateTime(endsDate);
                    objClass.EndTime = txtclassEndTime.Text;
                    objClass.Hours = int.Parse(txtclassHours.Text);
                    objClass.programId = int.Parse(ddlClassPrograms.SelectedItem.Value);
                    objClass.Remarks = ddlremarks.SelectedItem.Text;
                    objClass.StatusDate = Convert.ToDateTime(txtclassstatusDate.Text);
                    objClass.startdate = Convert.ToDateTime(startDate);
                    objClass.StartTime = txtclassStartTime.Text;
                    objClass.status = ddlclassStatus.SelectedItem.Text;
                    objClass.SubjectId = int.Parse(ddlclassSubjects.SelectedItem.Value);
                    objClass.Units = int.Parse(name);
                    objClass.CatSchedule = catschid;
                    objClass.Classno = ddlclassno.SelectedItem.Text;
                    SqlDataReader dr1 = objTraining.GetClsDataexist(catschid, Convert.ToInt16(ddlclassSubjects.SelectedItem.Value), ddlclassno.SelectedItem.Text, Subschid, Convert.ToInt32(ddlClassUnits.SelectedValue));
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr1);
                    if (dt1.Rows.Count == UnitCnt)
                    {
                        lblflmsg.Text = "Class already exists";
                        lblflmsg.ForeColor = Color.Red;
                    }
                    else
                    {
                        SqlDataReader dr3 = objTraining.InsertNew_Class(objClass);
                        if (dr3.RecordsAffected > 0)
                        {
                            lblflmsg.Text = "Added sucessfully";
                            lblflmsg.ForeColor = Color.Green;
                            SqlDataReader dr = objTraining.GetClassInsertedData();

                            foreach (GridViewRow gvRow in gvClass.Rows)
                            {
                                DataRow drr = dt2.NewRow();
                                //drr["Content_Data"] = ((Label)gvRow.FindControl("lblSno")).Text;
                                 drr["Startdate"] =gvRow.Cells[0].Text;
                                 drr["Enddate"] = gvRow.Cells[1].Text;
                                 drr["Duration"] = gvRow.Cells[2].Text;
                                 drr["Status"] = gvRow.Cells[3].Text;
                                 dt2.Rows.Add(drr);
                            }
                            if (ViewState["dt2Session"] != null)
                            {
                                dt2 = (DataTable)ViewState["dt2Session"];
                                DataRow drn = dt2.NewRow();
                                drn["Startdate"] = startDate.ToString("dd-MM-yyyy");
                                drn["Enddate"] = endsDate.ToString("dd-MM-yyyy");
                                drn["Duration"] = days;
                                drn["Status"] = ddlclassStatus.SelectedItem.Text;
                                dt2.Rows.Add(drn);
                            }

                        }

                        else
                        {
                            lblflmsg.Text = "Failed";
                            lblflmsg.ForeColor = Color.Red;
                        }
                    }                  

                }
                gvClass.DataSource = dt2;
                gvClass.DataBind();
            }
            else
            {
                AddClass objsClass = new AddClass();
                //lblcls.Text = "Category-Id:Name:" + ddlClassCategories.SelectedValue + " :" + ddlClassCategories.SelectedItem + "  " + "GROUP:" + " " + ddlBranch.SelectedItem + " " + "Year/Sem:" + " " + ddlyear.SelectedItem + " " + "Subject-Id:Name:" + " " + ddlclassSubjects.SelectedItem + " " + "SCH-ID:" + " " + ddlScheduleID.SelectedValue + " " + "Unit-Id:Name:" + " " + ddlClassUnits.SelectedItem;
                objsClass.CategoryId = int.Parse(ddlClassCategories.SelectedItem.Value);
                objsClass.ScheduleID = Subschid;
                objsClass.ClassType = ddlclasstype.SelectedItem.Text;
                objsClass.Duration = txtClassDuration.Text;
                objsClass.Enddate = Convert.ToDateTime(txtClassEndDate.Text);
                objsClass.EndTime = txtclassEndTime.Text;
                //objsClass.FacultyName = ddlFaculty.SelectedItem.Text;
                //objsClass.FacultyID = Convert.ToInt32(ddlFaculty.SelectedItem.Value);
                objsClass.Hours = int.Parse(txtclassHours.Text);
                objsClass.programId = int.Parse(ddlClassPrograms.SelectedItem.Value);
                objsClass.Remarks = ddlremarks.SelectedItem.Text;
                objsClass.StatusDate = Convert.ToDateTime(txtclassstatusDate.Text);
                objsClass.startdate = Convert.ToDateTime(txtclassStartDate.Text);
                objsClass.StartTime = txtclassStartTime.Text;
                objsClass.status = ddlclassStatus.SelectedItem.Text;
                objsClass.SubjectId = int.Parse(ddlclassSubjects.SelectedItem.Value);
                objsClass.Units = int.Parse(ddlClassUnits.SelectedItem.Value);
                objsClass.CatSchedule = catschid;
                objsClass.Classno = ddlclassno.SelectedItem.Text;
                SqlDataReader dr1 = objTraining.GetClsDataexist(catschid, Convert.ToInt32(ddlclassSubjects.SelectedItem.Value), ddlclassno.SelectedItem.Text, Subschid, Convert.ToInt32(ddlClassUnits.SelectedValue));
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count == UnitCnt)
                {
                    lblflmsg.Text = "Class already exists";
                    lblflmsg.ForeColor = Color.Red;
                }
                else
                {
                    SqlDataReader dr3 = objTraining.InsertNew_Class(objsClass);
                    if (dr3.RecordsAffected > 0)
                    {
                        lblflmsg.Text = "Added sucessfully";
                        lblflmsg.ForeColor = Color.Green;
                        SqlDataReader dr = objTraining.GetClassInsertedData();
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        gvClass.DataSource = dt;
                        gvClass.DataBind();
                        clearClass();
                    }
                    else
                    {
                        lblflmsg.Text = "Failed";
                        lblflmsg.ForeColor = Color.Red;
                    }



                }
            }


        }



        protected void btnCancelClass_Click(object sender, EventArgs e)
        {
            clearClass();
        }

        public void clearClass()
        {
            ddlclassSubjects.SelectedIndex = -1;
            ddlClassUnits.Items.Clear();
            ddlclassStatus.SelectedIndex = -1;
            txtclassStartTime.Text = "";
            txtclassStartDate.Text = "";
            //   txtclassstatusDate.Text = "";
            //txtClassRemarks.Text = "";
            ddlClassPrograms.SelectedIndex = -1;
            txtclassHours.Text = "";
            //ddlFaculty.SelectedIndex = -1;
            txtclassEndTime.Text = "";
            txtClassEndDate.Text = "";
            txtClassDuration.Text = "";
            ddlclasstype.SelectedValue = "1";
            ddlClassCategories.SelectedIndex = -1;
            ddlType.SelectedIndex = -1;
            ddlyear.Items.Clear();
            ddlBranch.Items.Clear();
            ddlcatsch.Items.Clear();
            ddlclassno.Items.Clear();
        }

        #endregion Classes

        #region Exercise

        private void ProgamsDrpdown()
        {

            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsForUnits.DataSource = dt;
            ddlProgramsForUnits.DataValueField = "Program_id";
            ddlProgramsForUnits.DataTextField = "Program_name";
            ddlProgramsForUnits.DataBind();
            ddlProgramsForUnits.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "---Select---"));

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
                ddlCategoriesForUnits.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "---Select---"));
            }
        }

        protected void ddlCategoriesForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexsch.DataSource = dt;
                ddlexsch.DataValueField = "S_NO";
                ddlexsch.DataTextField = "Schedule_ID";
                ddlexsch.DataBind();
                ddlexsch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }

        }

        protected void ddlexsch_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlExerciseGroup.Items.Clear();
            ddlExerciseYear.Items.Clear();
            ddlSubject_forUnits.Items.Clear();

            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlExerciseGroup.DataSource = dt;
                ddlExerciseGroup.DataValueField = "Branch_Id";
                ddlExerciseGroup.DataTextField = "Branch_Name";
                ddlExerciseGroup.DataBind();
                ddlExerciseGroup.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }
        protected void ddlExerciseGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlExerciseYear.Items.Clear();
            ddlSubject_forUnits.Items.Clear();

            int BranchId = Convert.ToInt32(ddlExerciseGroup.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlExerciseYear.DataSource = dt;
                ddlExerciseYear.DataValueField = "Year_Id";
                ddlExerciseYear.DataTextField = "Branch_Year_No";
                ddlExerciseYear.DataBind();
                ddlExerciseYear.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlExerciseYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubject_forUnits.Items.Clear();

            int yearId = Convert.ToInt32(ddlExerciseYear.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject_forUnits.DataSource = dt;
                ddlSubject_forUnits.DataValueField = "Subject_Id";
                ddlSubject_forUnits.DataTextField = "SubjectName";
                ddlSubject_forUnits.DataBind();
                ddlSubject_forUnits.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlSubject_forUnits_SelectedIndexChanged(object sender, EventArgs e)
        {

            int SubjectID = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
            SqlDataReader dr1 = objBL.GetcontScheduleBySubject(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlSubSchId.DataSource = dt1;
                ddlSubSchId.DataValueField = "Subject_Id";
                ddlSubSchId.DataTextField = "Subject_ScheduleID";
                ddlSubSchId.DataBind();
                ddlSubSchId.Items.Insert(0, "--Select--");
            }
        }

        protected void ddlSubSchId_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetUnitDetails(Convert.ToInt32(ddlSubject_forUnits.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);

            if (dt.Rows.Count > 0)
            {
                ddlExerciseUnit.DataSource = dt;
                ddlExerciseUnit.DataValueField = "Unit_Id";
                ddlExerciseUnit.DataTextField = "Unit_Name";
                ddlExerciseUnit.DataBind();
                ddlExerciseUnit.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));

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
                taskpanel.Visible = true;
                FillinBlanksPAnel.Visible = true;
                DescriptivePanel.Visible = false;
            }
            else if (ddlqstnType.SelectedValue == "3")
            {
                radioPanel.Visible = false;
                FillinBlanksPAnel.Visible = false;
                taskpanel.Visible = true;
                DescriptivePanel.Visible = true;
            }
        }

        private string GetMax()
        {
            SqlDataReader dr1 = objEPBL.GetmaxId();
            while (dr1.Read())
            {
                QstNAid = dr1["QID"].ToString();
            }
            return QstNAid;
        }

        protected void btnSaveQuestion_Click(object sender, EventArgs e)
        {
            string Mid = GetMax();
            string[] Catschid = ddlexsch.SelectedItem.Text.Split('(');
            string excshid = Catschid[0];

            try
            {
                if (ddlExerciseUnit.SelectedValue != "--Select--")
                {
                    if (ddltasktype.SelectedItem.Text == "Exercise")
                    {
                        if (ddlqstnType.SelectedItem.Text.Trim() == "Radio")
                        {

                            objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                            objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                            objQABE.Unit_Id = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                            objQABE.Test_Type = "Exercise";
                            objQABE.CatSchedule = excshid;
                            objQABE.SubSchId = ddlSubSchId.SelectedItem.Text;
                            objQABE.Question = txtQstnName.Text.Trim();
                            objQABE.A = txtA.Text.Trim();
                            objQABE.B = txtB.Text.Trim();
                            objQABE.C = txtC.Text.Trim();
                            objQABE.D = txtD.Text.Trim();
                            objQABE.E = txtE.Text.Trim();
                            //string Answer = "";
                            //for (int i = 0; i < ddlAns.Items.Count; i++)
                            //{

                            //    if (ddlAns.Items[i].Selected)
                            //    {
                            //        if (Answer == "")
                            //        {
                            //            Answer = ddlAns.Items[i].Value;
                            //        }
                            //        else
                            //        {
                            //            Answer = Answer + "," + ddlAns.Items[i].Value;
                            //        }
                            //    }
                            //}
                            //objQABE.Answer = Answer;
                            objQABE.QstnId = Convert.ToInt32(Mid);
                            objQABE.Answer = ddlAns.SelectedItem.Text;
                            objQABE.Question_Type = ddlqstnType.SelectedItem.ToString();
                            SqlDataReader dr = objEPBL.InsertExercisedata(objQABE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblexmsg.Text = "Added Sucessfully";
                                lblexmsg.ForeColor = Color.Green;
                            }
                            ClearControls();
                            DataTable dt = new DataTable();
                            dt.Load(dr);
                            gvUnits.DataSource = dt;
                            gvUnits.DataBind();
                        }
                        else if (ddlqstnType.SelectedItem.Text.Trim() == "Fill In Blanks")
                        {
                            objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                            objQABE.CatSchedule = excshid;
                            objQABE.SubSchId = ddlSubSchId.SelectedItem.Text;
                            objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                            objQABE.Question = txtQstnName.Text.Trim();
                            objQABE.Answer = txtFillInAnswer.Text.Trim();
                            objQABE.Test_Type = "Exercise";
                            objQABE.QstnId = Convert.ToInt32(Mid);
                            objQABE.Question_Type = ddlqstnType.SelectedItem.ToString();
                            SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblexmsg.Text = "Added Sucessfully";
                                lblexmsg.ForeColor = Color.Green;
                            }
                            ClearControls();
                            DataTable dt = new DataTable();
                            dt.Load(dr);
                            gvUnits.DataSource = dt;
                            gvUnits.DataBind();
                        }
                        else if (ddlqstnType.SelectedItem.Text.Trim() == "Descriptive")
                        {
                            objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                            objQABE.CatSchedule = excshid;
                            objQABE.SubSchId = ddlSubSchId.SelectedItem.Text;
                            objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                            objQABE.Question = txtQstnName.Text.Trim();
                            objQABE.Answer = txtDescriptAnswer.Text.Trim();
                            objQABE.Test_Type = "Exercise";
                            objQABE.Unit_Id = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                            objQABE.QstnId = Convert.ToInt32(Mid);
                            objQABE.Question_Type = ddlqstnType.SelectedItem.ToString();
                            SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblexmsg.Text = "Added Sucessfully";
                                lblexmsg.ForeColor = Color.Green;
                            }
                            ClearControls();
                            DataTable dt = new DataTable();
                            dt.Load(dr);
                            gvUnits.DataSource = dt;
                            gvUnits.DataBind();
                        }
                    }

                    else if (ddltasktype.SelectedItem.Text.Trim() == "Assignment")
                    {
                        objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                        objQABE.CatSchedule = excshid;
                        objQABE.SubSchId = ddlSubSchId.SelectedItem.Text;
                        objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                        objQABE.Question = txtQstnName.Text.Trim();
                        objQABE.Answer = txtDescriptAnswer.Text.Trim();
                        objQABE.Unit_Id = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                        objQABE.Test_Type = "Assignment";
                        objQABE.Question_Type = "Assignment";
                        objQABE.QstnId = Convert.ToInt32(Mid);
                        //objQABE.Question_Type = ddlqstnType.SelectedItem.ToString();
                        SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                        if (dr.RecordsAffected > 0)
                        {
                            lblexmsg.Text = "Added Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                        }
                        ClearControls();
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        gvUnits.DataSource = dt;
                        gvUnits.DataBind();
                    }
                    else if (ddltasktype.SelectedItem.Text.Trim() == "Case-Study")
                    {
                        objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                        objQABE.CatSchedule = excshid;
                        objQABE.SubSchId = ddlSubSchId.SelectedItem.Text;
                        objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                        objQABE.Question = txtQstnName.Text.Trim();
                        objQABE.Answer = txtDescriptAnswer.Text.Trim();
                        objQABE.Unit_Id = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                        objQABE.Test_Type = "Case-Study";
                        objQABE.QstnId = Convert.ToInt32(Mid);
                        objQABE.Question_Type = "Case-Study";
                        SqlDataReader dr = objEPBL.InsertSampleTestFillBlanksdata(objQABE);
                        if (dr.RecordsAffected > 0)
                        {
                            lblexmsg.Text = "Added Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                        }
                        ClearControls();
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        gvUnits.DataSource = dt;
                        gvUnits.DataBind();
                    }
                }
            }
            catch (Exception)
            {
            }

        }

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

        private void gridData()
        {
            //dt2.Columns.Add("ClassId", typeof(string));
            dt2.Columns.Add("Question", typeof(string));
            dt2.Columns.Add("A", typeof(string));
            dt2.Columns.Add("B", typeof(string));
            dt2.Columns.Add("C", typeof(string));
            dt2.Columns.Add("D", typeof(string));
            dt2.Columns.Add("E", typeof(string));
            dt2.Columns.Add("Answer", typeof(string));
            ViewState["dtExSession"] = dt2;     //Saving Datatable To Session 
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
                    gridData();
                    System.Data.DataColumn newColumn = new System.Data.DataColumn("Category_Id", typeof(int));
                    newColumn.DefaultValue = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn);

                    System.Data.DataColumn newColumn1 = new System.Data.DataColumn("Subject_Id", typeof(int));
                    newColumn1.DefaultValue = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                    dt.Columns.Add(newColumn1);

                    System.Data.DataColumn clmUnit_Id = new System.Data.DataColumn("Unit_Id", typeof(int));
                    clmUnit_Id.DefaultValue = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                    dt.Columns.Add(clmUnit_Id);

                    System.Data.DataColumn newColumn2 = new System.Data.DataColumn("Test_Type", typeof(string));
                    newColumn2.DefaultValue = "SampleTest";
                    dt.Columns.Add(newColumn2);

                    conn.Close();
                    string fileName = ViewState["filename"].ToString();
                    File.Delete(Server.MapPath("~/App_Data/" + fileName));

                    objQABE.dtExcelUpload = dt;
                    // SqlDataReader dr = objEPBL.InsertExcelSampleTestdata(objQABE);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string Mid = GetMax();
                        objQABE.Category_Id = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
                        objQABE.Subject_Id = Convert.ToInt32(ddlSubject_forUnits.SelectedItem.Value);
                        objQABE.Test_Type = ddltasktype.SelectedItem.Text;
                        objQABE.Unit_Id = Convert.ToInt32(ddlExerciseUnit.SelectedItem.Value);
                        objQABE.Question = dt.Rows[i]["Question"].ToString();
                        objQABE.A = dt.Rows[i]["A"].ToString();
                        objQABE.B = dt.Rows[i]["B"].ToString();
                        objQABE.C = dt.Rows[i]["C"].ToString();
                        objQABE.D = dt.Rows[i]["D"].ToString();
                        objQABE.E = dt.Rows[i]["E"].ToString();
                        objQABE.Answer = dt.Rows[i]["Answer"].ToString();
                        objQABE.QstnId = Convert.ToInt32(Mid);
                        SqlDataReader dr = objEPBL.InsertSampleTestdata(objQABE);
                        //DataTable dt1 = new DataTable();
                        //dt1.Load(dr);
                        if(dr.RecordsAffected>0)
                        {
                            lblexmsg.Text = "Added Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                            foreach (GridViewRow gvRow in gvUnits.Rows)
                            {
                                DataRow drr = dt2.NewRow();
                                //drr["Content_Data"] = ((Label)gvRow.FindControl("lblSno")).Text;
                                drr["Question"] = gvRow.Cells[1].Text;
                                drr["A"] = gvRow.Cells[2].Text;
                                drr["B"] = gvRow.Cells[3].Text;
                                drr["C"] = gvRow.Cells[4].Text;
                                drr["D"] = gvRow.Cells[5].Text;
                                drr["E"] = gvRow.Cells[6].Text;
                                drr["Answer"] = gvRow.Cells[7].Text;
                                dt2.Rows.Add(drr);
                            }
                            if (ViewState["dtExSession"] != null)
                            {
                                dt2 = (DataTable)ViewState["dtExSession"];
                                DataRow drn = dt2.NewRow();
                                drn["Question"] = objQABE.Question;
                                drn["A"] = objQABE.A;
                                drn["B"] = objQABE.B;
                                drn["C"] = objQABE.C;
                                drn["D"] = objQABE.D;
                                drn["E"] = objQABE.E;
                                drn["Answer"] = objQABE.Answer;
                                dt2.Rows.Add(drn);
                            }
                        }
                      
                    }
                    gvUnits.Columns[0].Visible = false;
                    gvUnits.DataSource = dt2;
                    gvUnits.DataBind();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ddltasktype_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblpnl.Visible = true;
            //lblstrmsg.Text = "Category-Id:Name :" + ddlProgramsForUnits.SelectedValue + ":" + ddlProgramsForUnits.SelectedItem.ToString() + "Subject-Id;Name :" + ":" + ddlSubject_forUnits.SelectedItem.ToString() + "Unit-Id:Name :" + ddlExerciseUnit.SelectedValue + ":" + ddlExerciseUnit.SelectedItem.ToString();

            Panelexe.Visible = true;
            lbleprgname.Text = ddlProgramsForUnits.SelectedValue + ":" + ddlProgramsForUnits.SelectedItem.Text;
            lblecatname.Text = ddlCategoriesForUnits.SelectedValue + ":" + ddlCategoriesForUnits.SelectedItem.Text;
            //lblecatsch.Text = ddlexsch.SelectedItem.Text;
            lblegrpname.Text = ddlExerciseGroup.SelectedValue + ":" + ddlExerciseGroup.SelectedItem.Text;
            lblesbjname.Text = ddlSubject_forUnits.SelectedItem.Text;
            lbleunitname.Text = ddlExerciseUnit.SelectedItem.Text;
            if (ddltasktype.SelectedItem.Text == "Exercise")
            {
                radioPanel.Visible = true;
                taskpanel.Visible = true;
                DescriptivePanel.Visible = false;
            }
            else if (ddltasktype.SelectedItem.Text == "Assignment")
            {
                DescriptivePanel.Visible = true;
                lblQtn.Text = "Title";
                lblenteranswer.Text = "Solution";
                taskpanel.Visible = true;
                radioPanel.Visible = false;
            }
            else if (ddltasktype.SelectedItem.Text == "Case-Study")
            {
                DescriptivePanel.Visible = true;
                lblQtn.Text = "Title";
                lblenteranswer.Text = "Solution";
                taskpanel.Visible = true;
                radioPanel.Visible = false;

            }
        }

        #endregion Exercise

        #region Schedule

        private void ScheduleProgamsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlSubjectPrograms.DataSource = dt;
            ddlSubjectPrograms.DataValueField = "Program_id";
            ddlSubjectPrograms.DataTextField = "Program_name";
            ddlSubjectPrograms.DataBind();
            ddlSubjectPrograms.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "---Select---"));

        }

        protected void ddlSubjectPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectCategories.Items.Clear();
            ddlScheduleSubject.Items.Clear();

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
                ddlSubjectCategories.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "---Select---"));
            }
        }

        protected void ddlSubjectCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlScheduleGroup.Items.Clear();
            ddlSecheduleYear.Items.Clear();
            ddlScheduleSubject.Items.Clear();
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";
            // txtsubjectStartdate.Text = "";
            // txtsubjectEnddate.Text = "";
            SqlDataReader dr1 = objBL.LoadScheduleForSubject(Convert.ToInt32(ddlSubjectCategories.SelectedItem.Value));
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlScheduleID.DataSource = dt1;
                ddlScheduleID.DataValueField = "S_NO";
                ddlScheduleID.DataTextField = "Schedule_ID";
                ddlScheduleID.DataBind();
                ddlScheduleID.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }



        }

        protected void ddlScheduleID_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategoryId = Convert.ToInt32(ddlSubjectCategories.SelectedItem.Value);
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlScheduleGroup.DataSource = dt;
                ddlScheduleGroup.DataValueField = "Branch_Id";
                ddlScheduleGroup.DataTextField = "Branch_Name";
                ddlScheduleGroup.DataBind();
                ddlScheduleGroup.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));
            }


        }

        protected void ddlScheduleGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSecheduleYear.Items.Clear();
            ddlScheduleSubject.Items.Clear();
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";
            //txtsubjectStartdate.Text = "";
            // txtsubjectEnddate.Text = "";                          
            ddlScheduleSubject.Items.Clear();
            int BranchId = Convert.ToInt32(ddlScheduleGroup.SelectedItem.Value);
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSecheduleYear.DataSource = dt;
                ddlSecheduleYear.DataValueField = "Year_Id";
                ddlSecheduleYear.DataTextField = "Branch_Year_No";
                ddlSecheduleYear.DataBind();
                ddlSecheduleYear.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));
            }


        }

        protected void ddlSecheduleYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlScheduleSubject.Items.Clear();
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";
            // txtsubjectStartdate.Text = "";
            //txtsubjectEnddate.Text = "";
            if (ScheduleRadiolist.SelectedValue == "1")
            {
                int CategoryID = Convert.ToInt32(ddlSubjectCategories.SelectedValue);
                SqlDataReader dr = objEPBL.GetCategoryDataByProgramIDID(CategoryID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    //txtSubRegDate.Text = dt.Rows[0]["Category_Reg_Date"].ToString();
                    DateTime CateRegDate = Convert.ToDateTime(dt.Rows[0]["Category_Reg_Date"].ToString());
                    txtSubRegDate.Text = CateRegDate.ToString("yyyy-MM-dd");

                    txtScheduleDuration.Text = dt.Rows[0]["Category_Duration"].ToString();
                    //txtsubjectStartdate.Text = dt.Rows[0]["Category_Srt_Date"].ToString();
                    DateTime CatestartDate = Convert.ToDateTime(dt.Rows[0]["Category_Srt_Date"].ToString());
                    // txtsubjectStartdate.Text = CatestartDate.ToString("yyyy-MM-dd");

                    DateTime CateEndDate = Convert.ToDateTime(dt.Rows[0]["Category_End_Date"].ToString());
                    //  txtsubjectEnddate.Text = CateEndDate.ToString("yyyy-MM-dd");
                    // txtsubjectEnddate.Text = dt.Rows[0]["Category_End_Date"].ToString();
                }
            }
            else if (ScheduleRadiolist.SelectedValue == "2")
            {
                int yearId = Convert.ToInt32(ddlSecheduleYear.SelectedItem.Value);
                SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlScheduleSubject.DataSource = dt;
                    ddlScheduleSubject.DataValueField = "Subject_Id";
                    ddlScheduleSubject.DataTextField = "SubjectName";
                    ddlScheduleSubject.DataBind();
                    ddlScheduleSubject.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));
                }
            }
        }

        protected void ddlScheduleSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlScheduleSubject.SelectedValue);
            SqlDataReader dr = objEPBL.GetSubjectDataBySubjectID(SubjectID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime SubjectRegDate = Convert.ToDateTime(dt.Rows[0]["Subject_RegDate"].ToString());
                txtSubRegDate.Text = SubjectRegDate.ToString("dd-MM-yyyy");

                //txtSubRegDate.Text = dt.Rows[0]["Subject_RegDate"].ToString();
                txtScheduleDuration.Text = dt.Rows[0]["Subject_Duration"].ToString();
                DateTime SubjectStartDate = Convert.ToDateTime(dt.Rows[0]["Subject_Start_Date"].ToString());
                // txtsubjectStartdate.Text = SubjectStartDate.ToString("dd-MM-yyyy");

                // txtsubjectStartdate.Text = dt.Rows[0]["Subject_Start_Date"].ToString();
                DateTime SubjectEndDate = Convert.ToDateTime(dt.Rows[0]["Subject_End_Date"].ToString());
                //  txtsubjectEnddate.Text = SubjectEndDate.ToString("dd-MM-yyyy");

                // txtsubjectEnddate.Text = dt.Rows[0]["Subject_End_Date"].ToString();
            }
        }

        //protected void txtSchstDate_TextChanged(object sender, EventArgs e)
        //{
        //    int dur = Convert.ToInt32(txtScheduleDuration.Text);
        //    DateTime stdta = DateTime.ParseExact(txtSchedulestartDate.Text, "dd-MM-yyyy", null);
        //    stdta = stdta.AddDays(dur);
        //    txtScheduleEndDate.Text = stdta.ToString("dd-MM-yyyy");
        //}

        protected void btnEditSubjects_Click(object sender, EventArgs e)
        {
            objSchedulesBE.Category_Id = Convert.ToInt32(ddlSubjectCategories.SelectedValue);
            objSchedulesBE.Branch_Id = Convert.ToInt32(ddlScheduleGroup.SelectedValue);
            //string st = txtSubRegDate.Text.Trim();
            objSchedulesBE.Reg_Date = txtSubRegDate.Text;
            objSchedulesBE.Duration = txtScheduleDuration.Text.Trim();
            // string sts = txtsubjectStartdate.Text.Trim();
            // objSchedulesBE.Start_Date = DateTime.ParseExact(sts, "dd-MM-yyyy", null); ;
            //  string stss = txtsubjectEnddate.Text.Trim();
            // objSchedulesBE.End_date = DateTime.ParseExact(stss, "dd-MM-yyyy", null); 
            //DateTime dtm = DateTime.ParseExact(txtSchedulestartDate.Text.Trim(), "dd-MM-yyyy", null);
            objSchedulesBE.Schedule_srt_Date = txtSchedulestartDate.Text.Trim();
            //DateTime dts = DateTime.ParseExact(txtScheduleEndDate.Text, "dd-MM-yyyy", null);
            objSchedulesBE.Schedule_end_Date = txtScheduleEndDate.Text;
            objSchedulesBE.Status = ddlscheduleStatus.SelectedItem.Text;
            string sss = txtSubStatusDate.Text.Trim();
            //DateTime dmt = DateTime.ParseExact(sss, "dd-MM-yyyy", null);
            objSchedulesBE.Status_date = sss;
            objSchedulesBE.Remarks = txtSubRemarks.Text.Trim();
            objSchedulesBE.YearId = ddlSecheduleYear.SelectedItem.Text;
            //objSchedulesBE.Status=
            SqlDataReader dr;
            SchedulesList sl = new SchedulesList();
            sl.List.Add(new Schedules()
            {
                Category_Id = objSchedulesBE.Category_Id,
                Reg_Date = objSchedulesBE.Reg_Date,
                Schedule_srt_Date = objSchedulesBE.Schedule_srt_Date,
                Schedule_end_Date = objSchedulesBE.Schedule_end_Date,
                Remarks = objSchedulesBE.Remarks
            });         

            if (ScheduleRadiolist.SelectedValue == "1")  //Insert Category Schedule
            {
                objSchedulesBE.Subject_Id = 0;
                dr = objEPBL.InsertCategoryScheduleData(objSchedulesBE);
                DataTable dt = new DataTable();
                dt.Load(dr);
                gvCategories.DataSource = dt;
                gvCategories.DataBind();
            }
            else    ///Insert subject  Schedule 
            {
                objSchedulesBE.Subject_Id = Convert.ToInt32(ddlScheduleSubject.SelectedValue);
                objSchedulesBE.Schedule_ID = ddlScheduleID.SelectedItem.Text.Trim();
                dr = objEPBL.InsertSubjectScheduleData(objSchedulesBE);
                ddlScheduleSubject.Items.Clear();
                //DataTable dtr = new DataTable();
                //dtr.Load(dr);
                gvCategories.DataSource = sl.List;
                gvCategories.DataBind();
            }
            
            ClearScheduleData();
        }

        private void ClearScheduleData()
        {
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";
            //  txtsubjectStartdate.Text = "";
            //  txtsubjectEnddate.Text = "";
            txtSchedulestartDate.Text = "";
            txtScheduleEndDate.Text = "";
            ddlscheduleStatus.SelectedValue = "0";
            ddlScheduleID.SelectedValue = "0";
            txtSubRemarks.Text = "";
            ddlSubjectCategories.Items.Clear();
            ScheduleProgamsDrpdown();
            ddlScheduleGroup.Items.Clear();
            ddlSecheduleYear.Items.Clear();
        }

        protected void ScheduleRadiolist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ScheduleRadiolist.SelectedValue == "1")
            {
                pnlSubject.Visible = false;
                //schpnl.Visible = false;
                ddlScheduleSubject.Items.Clear();
                ddlSubjectCategories.Items.Clear();
                ClearScheduleData();
                lblScheduleDuration.Text = "Category Duration";
                lblScheduleRegDate.Text = "Category Reg Date";
                // lblScheduleStartDate.Text = "Category Start Date";
                // lblScheduleEnddate.Text = "Category End Date";
            }
            else
            {
                pnlSubject.Visible = true;
                //schpnl.Visible = true;
                ddlScheduleSubject.Items.Clear();
                ddlSubjectCategories.Items.Clear();
                ClearScheduleData();
                lblScheduleDuration.Text = "Subject Duration";
                lblScheduleRegDate.Text = "Subject Reg Date";
                //lblScheduleStartDate.Text = "Subject Start Date";
                //lblScheduleEnddate.Text = "Subject End Date";
            }
        }

        #endregion Schedule

       







    }
}