using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL;
using System.Net;
using System.Net.NetworkInformation;
using BAL.BE;
using System.Text.RegularExpressions;
using System.Text;
using Microsoft.Win32;
using System.Web.Services;

namespace PresentationLayer.ACMP
{
    public partial class RealTest_Commence : System.Web.UI.Page
    {
        CmpBL cmpbl = new CmpBL();
        QstnAnsBE qstans = new QstnAnsBE();
        QstnAnsBEList qstanslist = new QstnAnsBEList();
        string stdanswer;
        static string rtexamtime,BSTID,CSTBKRTID,SUBId,rtCntTime;
        public int marks = 0;
        DataTable dtable;
        //DataTable dtpending;     /////getting Questions have Answer F
        static DataTable dtforPending;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyBranch();
            }
            //SystemEvents.SessionEnding += SystemEvents_SessionEnding;
            dtable = new DataTable();
            dtable = ((DataTable)Session["datatable"]);
        }
        public void LoadCompanyBranch()
        {
            SqlDataReader dr = cmpbl.GetCategory();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlcategory.DataSource = dt;
                ddlcategory.DataValueField = "Category_Id";
                ddlcategory.DataTextField = "Category_Name";
                ddlcategory.DataBind();
                ddlcategory.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpbl.GetSubjects(Convert.ToInt32(ddlcategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlsubject.DataSource = dt;
                ddlsubject.DataValueField = "Subject_Id";
                ddlsubject.DataTextField = "Subject_Name";
                ddlsubject.DataBind();
                ddlsubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpbl.GetStudentDetails(Convert.ToInt32(ddlsubject.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlstudentname.DataSource = dt;
                ddlstudentname.DataValueField = "Student_Id";
                ddlstudentname.DataTextField = "studentname";
                ddlstudentname.DataBind();
                ddlstudentname.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlstudentname_SelectedIndexChanged(object sender, EventArgs e)
        {
            hdnfstdId.Value = ddlstudentname.SelectedValue;

            GetCompanyDetails();
            GetStudentBookingId();
            closediv.Visible = false;
        }

        private void GetCompanyDetails()
        {
            SqlDataReader dr = cmpbl.GetCompanyBranchDetails("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                string brloc = dt.Rows[0]["BranchLocation"].ToString();
                string broff = dt.Rows[0]["BranchOffice"].ToString();
                // lblAcmpLoc.Text = brloc + ':' + broff;
                string brname = dt.Rows[0]["BranchName"].ToString();
                // lblAcmpName.Text = "ACMPSMT001" + ':' + brname;
                //lblAcmpsts.Text = dt.Rows[0]["BranchStatus"].ToString();
            }
        }

        private void GetStudentBookingId()
        {
            int stid = Convert.ToInt32(ddlstudentname.SelectedValue);
            SqlDataReader dr = cmpbl.GetStudentbookingID(stid);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtstbkid.Text = dt.Rows[0]["studentbookingid"].ToString();
                hdnfstRTid.Value = txtstbkid.Text;
                txtstbkid.ReadOnly = true;
            }
        }

        //private void Getdata()
        //{
        //    SqlDataReader dr = cmpbl.GetRTcommenceInfo(Convert.ToInt16(ddlstudentname.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if(dt.Rows.Count>0)
        //    {
        //        GVcommence.DataSource = dt;
        //        GVcommence.DataBind();
        //    }
        //}

        public string GetMACAddress()
        {
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            String sMacAddress = string.Empty;
            foreach (NetworkInterface adapter in nics)
            {
                if (sMacAddress == String.Empty)// only return MAC Address from first card  
                {
                    IPInterfaceProperties properties = adapter.GetIPProperties();
                    sMacAddress = adapter.GetPhysicalAddress().ToString();
                }
            }
            return sMacAddress;
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            int stid = Convert.ToInt32(ddlstudentname.SelectedValue);
            int stbkid = Convert.ToInt32(txtstbkid.Text);
            string stlgid = txtstlogid.Text;
            string authco = txtauthcode.Text;
            string smacadd = GetMACAddress();
            string sysmacadd = authco + smacadd;
            SqlDataReader datareader = cmpbl.getmacaddress(smacadd);
            DataTable datatable = new DataTable();
            datatable.Load(datareader);
            if (datatable.Rows.Count > 0)
            {
                SqlDataReader dr = cmpbl.RTcommenceInfodata(stbkid, stlgid);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVcommence.DataSource = dt;
                    GVcommence.DataBind();
                    pnlcls.Visible = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Your Login Detailes Are Not Correct!');", true);
                    //Response.Redirect("RealTest-Commence.aspx");
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Your System Is Not Registered For Examination');", true);
            }

        }

        protected void btnRTload_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GVcommence.Rows.Count; i++)
            {
                CheckBox box1 = (CheckBox)GVcommence.Rows[i].Cells[0].FindControl("chkbx");
                if (box1.Checked == true)
                {
                    int stid = Convert.ToInt32(ddlstudentname.SelectedValue);
                    int subid = Convert.ToInt32(ddlsubject.SelectedValue);
                    SqlDataReader chkStatus = cmpbl.cheqStatusofStdExam(stid, subid);
                     DataTable dtStatus = new DataTable();
                    dtStatus.Load(chkStatus);
                    if (dtStatus.Rows[0]["Status"].ToString() == "Pending" || dtStatus.Rows[0]["Status"].ToString() == "New")
                    {
                        SqlDataReader dr = cmpbl.GetRTcommenceInfo(Convert.ToInt32(ddlstudentname.SelectedValue), Convert.ToInt32(txtstbkid.Text));
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        if (dt.Rows.Count > 0)
                        {
                            txtstudidname.Text = dt.Rows[0]["studentname"].ToString();
                            txtcmpnyidname.Text = dt.Rows[0]["companyame"].ToString();
                            txtbkid.Text = dt.Rows[0]["rtbookingid"].ToString();
                            txtbkdate.Text = dt.Rows[0]["bookingdate"].ToString();
                            txtbksessiontime.Text = dt.Rows[0]["bkgIDslotsession"].ToString();
                            txtsbjidnmae.Text = dt.Rows[0]["subjname"].ToString();
                            txtrtid.Text = dt.Rows[0]["rtid"].ToString();
                            Session["retestid"] = dt.Rows[0]["rtid"].ToString();
                            CSTBKRTID = dt.Rows[0]["rtid"].ToString();
                            txtgrpsem.Text = dt.Rows[0]["categoryname"].ToString();
                        }

                        SqlDataReader datar = cmpbl.getrtdata(Convert.ToInt32(ddlstudentname.SelectedValue), Convert.ToInt32(ddlsubject.SelectedValue));
                        DataTable dat = new DataTable();
                        dat.Load(datar);
                        if (dat.Rows.Count > 0)
                        {
                            txtrtallowtime.Text = dat.Rows[0]["RT_Time"].ToString();
                            txtrtqtns.Text = dat.Rows[0]["NoofQuetions"].ToString();
                            txttype.Text = dat.Rows[0]["Question_type"].ToString();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('You Are Already Wrote Exam');", true);
                        Response.Redirect("RealTest-Commence.aspx");
                    }
                    if (dtStatus.Rows[0]["Status"].ToString() == "Pending")
                    {
                        SqlDataReader gettingTime = cmpbl.gettingTime(stid,Convert.ToInt32(txtstbkid.Text), subid);
                        DataTable dtTime = new DataTable();
                        dtTime.Load(gettingTime);
                        if (dtTime.Rows.Count > 0)
                        {
                            string[] stim = dtTime.Rows[0]["Rem_Time"].ToString().Split(' ');
                            string[] strim = stim[1].Split(':');
                            if (strim[0] == "12")
                            {
                                strim[0] = "00";
                            }
                            txtrtallowtime.Text = strim[0] + ":" + strim[1] + ":" + strim[2];
                            //txtrtallowtime.Text = dtTime.Rows[0]["Rem_Time"].ToString();
                        }
                        
                    }
                }
            }
           Session["stdID"] = ddlstudentname.SelectedValue;
           BSTID = ddlstudentname.SelectedValue;
           string[] sbid = txtsbjidnmae.Text.Split(':');
           SUBId = sbid[0];
            divcls.Visible = false;
        }

        protected void btnCommence_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpbl.GetRTcommenceInfo(Convert.ToInt32(ddlstudentname.SelectedValue), Convert.ToInt32(txtstbkid.Text));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtstidname.Text = dt.Rows[0]["studentname"].ToString();
                txtcmpidname.Text = dt.Rows[0]["companyame"].ToString();
                txtrtbkid.Text = dt.Rows[0]["rtbookingid"].ToString();
                // txtrtbkdate.Text = dt.Rows[0]["bookingdate"].ToString();
                string bkslotidsess = dt.Rows[0]["bkgIDslotsession"].ToString();
                string[] ss = bkslotidsess.Split(':');
                // txtbkslot.Text = ss[0];
                // txtbksession.Text = ss[1];
                // txtbktime.Text = ss[2];
                txtbkstatus.Text = dt.Rows[0]["Status"].ToString();
                txtcatidname.Text = dt.Rows[0]["categoryname"].ToString();
                // txtsubject.Text = dt.Rows[0]["subjname"].ToString();
                // txtrtqid.Text = dt.Rows[0]["rtid"].ToString();
            }
           
            txtrttime.Text = txtrtallowtime.Text;
            rtexamtime = txtrttime.Text;
            collapseOne.Visible = false;
            //clspnldiv.Visible = false;
            //collpsediv.Visible = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = Session["datatable"];
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
            int suid = Convert.ToInt32(SUBId);
            DataTable dtforanns = new DataTable();
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    RadioButtonList hdnvalue = (RadioButtonList)row.FindControl("RadioButtonList1");
                    HiddenField hdfi = (HiddenField)row.FindControl("hdQuestionid");
                    SqlDataReader sqlgetqueANS = cmpbl.getQuestionAnswer(stid, rtid, suid, Convert.ToInt32(hdfi.Value));
                    dtforanns.Load(sqlgetqueANS);
                    string abcd = dtforanns.Rows[0]["Question_Answer"].ToString().Trim();
                    if (abcd == "A")
                    {
                        hdnvalue.SelectedIndex = 0;
                    }
                    else
                        if (abcd == "B")
                        {
                            hdnvalue.SelectedIndex = 1;
                        }
                        else
                            if (abcd == "C") { hdnvalue.SelectedIndex = 2; }
                            else
                                if (abcd == "D") { hdnvalue.SelectedIndex = 3; }
                                else
                                    if (abcd == "E") { hdnvalue.SelectedIndex = 4; }
                }
            }
            
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButtonList rbl = (RadioButtonList)e.Row.FindControl("RadioButtonList1");
                int i = e.Row.DataItemIndex;
                rbl.Items.Add("A" + " . " + dtable.Rows[i][3].ToString());
                rbl.Items.Add("B" + " . " + dtable.Rows[i][4].ToString());
                rbl.Items.Add("C" + " . " + dtable.Rows[i][5].ToString());
                rbl.Items.Add("D" + " . " + dtable.Rows[i][6].ToString());
                rbl.Items.Add("E" + " . " + dtable.Rows[i][7].ToString());
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (GridView1.PageIndex == GridView1.PageCount - 1)
            {
                if (e.Row.RowType == DataControlRowType.Pager)
                {

                    Button b = (Button)(e.Row.FindControl("btnSave"));
                    ////Button b2 = (Button)(e.Row.FindControl("Button2"));
                    b.Click += delegate
                    {
                        Session["CountdownTimer"] = null;
                        //saveexamquestionAns();
                        Response.Redirect("RealTest-Commence.aspx");
                    };
                    //b.Text = "Submit";
                    //b.CommandArgument = "";
                    //b.CommandName = "";
                    //b2.Click += delegate
                    //{
                    //    Session["CountdownTimer"] = null;
                    //   // Response.Redirect("rEport.aspx");
                    //};
                   
                    //b2.Text = "Submit";
                    //b2.CommandArgument = "";
                    //b2.CommandName = "";
                }
            }
        }

        protected void btnStart_Click(object sender, EventArgs e)       //////To Start Exam
        {
            QstnAnsBEList qlist = new QstnAnsBEList();
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
            int suid = Convert.ToInt32(SUBId);
            string QuestionId = string.Empty;
            string AnswerID = string.Empty;
            string cntTime = string.Empty;
            int  AnswerF = 0;
            SqlDataReader checkquedr = cmpbl.CheckforAttemptExamOrNot(stid, rtid, suid);
            DataTable dtcheckQue = new DataTable();
            dtcheckQue.Load(checkquedr);
            if (dtcheckQue.Rows.Count > 0)
            {
                ////gettting question ID's from tbl_Save_Student_ans_backup
                SqlDataReader sqdr = cmpbl.getquestionswithAnswer_F(stid, rtid, suid, "F");
                DataTable dtdr = new DataTable();
                dtdr.Load(sqdr);
                for (int m = 0; m < dtdr.Rows.Count; m++)
                {
                    qlist.List.Add(new QstnAnsBE()
                    {
                        Qstn_ID = Convert.ToInt32(dtdr.Rows[m]["Qustion_ID"]),
                        remTime = dtdr.Rows[m]["Rem_Time"].ToString()
                    });
                }
                DataColumn Id = new DataColumn("Id", typeof(int));
                Id.ReadOnly = true;
                Id.Caption = "ID";
                Id.AllowDBNull = false;
                Id.Unique = true;
                Id.AutoIncrement = true;
                Id.AutoIncrementSeed = 1;
                Id.AutoIncrementStep = 1;
                dtable = new DataTable("tabb");
                dtable.Columns.AddRange(new DataColumn[] 
                {
                    Id
                });

                for (int c = 0; c < qlist.List.Count; c++)
                {
                    AnswerF = qlist.List[c].Qstn_ID;
                    SqlDataReader remque = cmpbl.getremainingQuestions(suid, AnswerF);
                    dtable.Load(remque);
                }

                Session["datatable"] = dtable;
                ViewState["datat"] = Session["datatable"];
                dtable = ViewState["datat"] as DataTable;
                dtforPending = ((DataTable)Session["datatable"]);
                GridView1.DataSource = Session["datatable"];
                GridView1.DataBind();

                SqlDataReader gettingTime = cmpbl.gettingTime(stid, rtid, suid);
                DataTable dtTime = new DataTable();
                dtTime.Load(gettingTime);
                if (dtTime.Rows.Count>0)
                {
                    cntTime = dtTime.Rows[0]["Rem_Time"].ToString();
                }
                string[] stim = cntTime.Split(' ');
                string[] strim= stim[1].Split(':');
                if (strim[0] == "12")
                {
                    strim[0] = "00";
                }
                cntTime = strim[0] + ":" + strim[1] + ":" + strim[2];
                if (Session["CountdownTimer"] == null)
                {
                    Session["CountdownTimer"] = new CountDown(TimeSpan.Parse(cntTime));
                    (Session["CountdownTimer"] as CountDown).Start();
                }

                //ScriptManager.RegisterStartupScript(this, this.GetType(), "RealTest-Commence", "examTimer();", true);
                //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>main();</script>", false);
            }
            else
            {
                DataTable dtsees = new DataTable();
                SqlDataReader cgstatus = cmpbl.ChangeStdExamStatuswhenTermination(stid, suid, "Pending");
                DataTable dtst = new DataTable();
                dtst.Load(cgstatus);
                if (cgstatus.RecordsAffected > 0)
                {
                    string remtm = "00:19:59:00";
                    string[] ctid = txtcatidname.Text.Split(':');
                    int ctgid = Convert.ToInt32(ctid[0]);
                    string[] sbid = txtsbjidnmae.Text.Split(':');
                    int subid = Convert.ToInt32(sbid[0]);
                    string qtype = txttype.Text;
                    SqlDataReader drque = cmpbl.getquestions(ctgid, subid, qtype);
                    //DataTable dtpending = new DataTable();
                    DataColumn ID = new DataColumn("ID", typeof(int));
                    ID.ReadOnly = true;
                    ID.Caption = "ID";
                    ID.AllowDBNull = false;
                    ID.Unique = true;
                    ID.AutoIncrement = true;
                    ID.AutoIncrementSeed = 1;
                    ID.AutoIncrementStep = 1;
                    dtsees = new DataTable("tab1");
                    dtsees.Columns.AddRange(new DataColumn[] 
                    {
                      ID
                    });
                    dtsees.Load(drque);

                    for (int i = 0; i < dtsees.Rows.Count; i++)
                    {
                        qlist.List.Add(new QstnAnsBE()
                        {
                            Qstn_ID = Convert.ToInt32(dtsees.Rows[i]["Qstn_ID"]),
                            StudentAnswer = ans(Convert.ToInt32(dtsees.Rows[i]["ID"]))
                        });
                    }
                    for (int k = 0; k < qlist.List.Count; k++)        /////to store all Questions with Answer as F
                    {
                        QuestionId = qlist.List[k].Qstn_ID.ToString();
                        AnswerID = qlist.List[k].StudentAnswer.ToString();
                        SqlDataReader dr = cmpbl.savestudentanswersbackup(stid, rtid, suid, QuestionId, AnswerID, remtm);
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                    }
                    qlist.List.Clear();
                }

                Session["datatable"] = dtsees;
                ViewState["datat"] = Session["datatable"];
                dtable = ViewState["datat"] as DataTable;
                dtforPending = ((DataTable)Session["datatable"]);
                GridView1.DataSource = Session["datatable"];
                GridView1.DataBind();

                string newString = Regex.Replace(rtexamtime, "[^0-9]", "");
                int b = Convert.ToInt32(newString);
                if (Session["CountdownTimer"] == null)
                {
                    Session["CountdownTimer"] = new CountDown(TimeSpan.Parse("00:" + newString + ":00"));
                    (Session["CountdownTimer"] as CountDown).Start();
                }
 
            }
            
            btnStart.Visible = false;

            Response.Cache.SetNoStore();
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);            
          
        }       

        public class CountDown
        {
            public TimeSpan TimeLeft;
            System.Threading.Thread thread;
            public CountDown(TimeSpan original)
            {
                this.TimeLeft = original;
            }
            public void Start()
            {
                System.Threading.ThreadStart threadDelegate = delegate
                {
                    while (true)
                    {
                        System.Threading.Thread.Sleep(1000);
                        TimeLeft = TimeLeft.Subtract(TimeSpan.Parse("00:00:01"));
                    }

                };
                thread = new System.Threading.Thread(threadDelegate);
                thread.Start();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Session["CountdownTimer"] != null)
            {
                if (TimeSpan.Compare((Session["CountdownTimer"] as CountDown).TimeLeft, TimeSpan.Zero) > 0)
                {
                    Label3.ForeColor = System.Drawing.Color.Black;
                    Label3.Text = "Time Remaining:" + ' ' + (Session["CountdownTimer"] as CountDown).TimeLeft.ToString();
                    rtCntTime = (Session["CountdownTimer"] as CountDown).TimeLeft.ToString();
                }
                else
                {
                    Session["CountdownTimer"] = null;
                    savestudentANS();
                    savestudentANSBackup();                   
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "err_msg", "alert('Your Time is Completed. ');", true);
                    Response.Redirect("RealTest-Commence.aspx");                 
                }
            }
            else
            {

            }
        }     

        protected string GetID(object ob)
        {
            return DataBinder.Eval(ob, "Id").ToString() + ".";
        }

        protected void btnPrevious_Click(object sender, EventArgs e)      //////Completed
        {
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
             int suid =Convert.ToInt32(SUBId);
            string ct = rtCntTime;       
            string queid = string.Empty;
            DataTable dtforQueans = new DataTable();
            DataTable SesDt = ((DataTable)Session["datatable"]);
            QstnAnsBEList qlist = new QstnAnsBEList();


            GridView1.DataSource = Session["datatable"];
            GridView1.PageIndex = GridView1.PageIndex - 1;
            GridView1.DataBind();
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    HiddenField hdfi = (HiddenField)row.FindControl("hdQuestionid");
                    queid = hdfi.Value;
                    SqlDataReader sqlgetqueANS = cmpbl.getQuestionAnswer(stid, rtid, suid, Convert.ToInt32(queid));
                    dtforQueans.Load(sqlgetqueANS);
                    RadioButtonList hdrbi = (RadioButtonList)row.FindControl("RadioButtonList1");
                    //int i = row.DataItemIndex;
                   string abcd = dtforQueans.Rows[0]["Question_Answer"].ToString().Trim();
                   if (abcd == "A")
                   {
                       hdrbi.SelectedIndex = 0;
                   }else
                       if(abcd == "B")
                    {
                        hdrbi.SelectedIndex = 1;
                    }
                       else
                           if (abcd == "C") { hdrbi.SelectedIndex = 2; }
                           else
                   if (abcd == "D") { hdrbi.SelectedIndex = 3; }else
                   if (abcd == "E") { hdrbi.SelectedIndex = 4; }
                }
            }
           

        }

        protected void btnNext_Click(object sender, EventArgs e)    /////completed
        {           
            savestudentANS();
        }

        protected void btnSave_Click(object sender, EventArgs e)   /////completed
        {
            savestudentANS();
            savestudentANSBackup();
            Response.Redirect("RealTest-Commence.aspx");
        }

        protected void btnExit_Click(object sender, EventArgs e)    ////Completed
        {
            savestudentANS();
            savestudentANSBackup();
            Response.Redirect("RealTest-Commence.aspx");
        }

        internal void savestudentANS()    /////EachTime Update Answer
        {
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
            int suid = Convert.ToInt32(SUBId);
            string ct = rtCntTime;
            string QuestionId = string.Empty;
            string AnswerID = string.Empty;
            string queid = string.Empty;
            DataTable SesDt = dtforPending;
            DataTable dtforanns = new DataTable();
            QstnAnsBEList qlist = new QstnAnsBEList();
            for (int m = 0; m < SesDt.Rows.Count; m++)
            {
                qlist.List.Add(new QstnAnsBE()
                {
                    Qstn_ID = Convert.ToInt32(SesDt.Rows[m]["Qstn_ID"])
                });
            }
            int iiiid = qlist.List.Last().Qstn_ID;
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    RadioButtonList hdnvalue = (RadioButtonList)row.FindControl("RadioButtonList1");
                    HiddenField hdfi = (HiddenField)row.FindControl("hdQuestionid");
                    Button btnNex = (Button)row.FindControl("btnNext");
                    queid = hdnvalue.Text;
                  
                    if (!string.IsNullOrEmpty(queid))
                    {
                        AnswerID = (queid.Split('.'))[0].ToString();
                    }
                    if (string.IsNullOrEmpty(queid))
                    {
                        AnswerID = "F";
                    }
                    QuestionId = hdfi.Value;
                    if (iiiid == Convert.ToInt32(QuestionId))
                    {
                        btnNex.Enabled = false;
                    }

                   
                }
            }
            
            SqlDataReader dr = cmpbl.saveAnswer(stid, rtid, Convert.ToInt32(ddlsubject.SelectedValue), QuestionId, AnswerID, ct);
            DataTable dt = new DataTable();
            dt.Load(dr);

        }

        internal void savestudentANSBackup()      /////After Completion Of all Questions to Finish Exam
        {
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
            int suid =Convert.ToInt32(SUBId);
            string stas = "Completed";
            SqlDataReader dr = cmpbl.savestudentanswer(stid, rtid, suid, stas);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dr.RecordsAffected > 0)
             {
                 SqlDataReader cgstatus = cmpbl.ChangeStdExamStatuswhenTermination(stid, suid, "Completed");
                 Session["CountdownTimer"] = null;
             }
        }

        public string ans(int id)    /////for getting Answer 
        {
            int i = id;
            string s;
            if (((Dictionary<int, string>)Session["res"]).TryGetValue(i, out s))
                if (!string.IsNullOrEmpty(s))
                {
                    s = (s.Split('.'))[0].ToString();
                }
            if (string.IsNullOrEmpty(s))
            {
                s = "F";
            }
            return s;
        }    

        internal void updatetime()       /////if system shutdown/logoff to capture time
        {
            QstnAnsBEList qlist = new QstnAnsBEList();
            int stid = Convert.ToInt32(BSTID);
            int rtid = Convert.ToInt32(CSTBKRTID);
            int suid = Convert.ToInt32(SUBId);
            string ct = rtCntTime;
            SqlDataReader de = cmpbl.updatetimecount(stid, rtid, suid, ct);
        }  


        //protected void Button1_Click(object sender, EventArgs e)   ///next
        //{
        //    int i = GridView1.PageIndex;

        //    Label l1 = (Label)GridView1.Rows[0].FindControl("Label1");
        //    RadioButtonList rbl = (RadioButtonList)GridView1.Rows[0].FindControl("RadioButtonList1");
        //    ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l1.Text.TrimEnd('.'))] = rbl.SelectedValue; ;

        //    try
        //    {
        //        Label l2 = (Label)GridView1.Rows[1].FindControl("Label1");
        //        RadioButtonList rbl2 = (RadioButtonList)GridView1.Rows[1].FindControl("RadioButtonList1");
        //        ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l2.Text.TrimEnd('.'))] = rbl2.SelectedValue;

        //        Label l3 = (Label)GridView1.Rows[2].FindControl("Label1");
        //        RadioButtonList rbl3 = (RadioButtonList)GridView1.Rows[2].FindControl("RadioButtonList1");
        //        ((Dictionary<Int32, string>)Session["res"])[Int32.Parse(l3.Text.TrimEnd('.'))] = rbl3.SelectedValue;
        //    }
        //    catch (ArgumentOutOfRangeException) { }
        //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>main();</script>", false);
        //}

        ////protected void Button2_Click(object sender, EventArgs e)     /////forward
        ////{
        ////    this.mdlpop.Show();
        ////    int i = GridView1.PageIndex - 1;
        ////    DataTable dv = new DataTable();
        ////    dv = ((DataTable)Session["datatable"]);

        ////    Label l4 = (Label)GridView1.Rows[0].FindControl("Label1");
        ////    RadioButtonList rbl4 = (RadioButtonList)GridView1.Rows[0].FindControl("RadioButtonList1");
        ////    ((Dictionary<Int32, string>)Session["res2"])[Int32.Parse(l4.Text.TrimEnd('.'))] = rbl4.SelectedValue;

        ////    try
        ////    {
        ////        Label l5 = (Label)GridView1.Rows[1].FindControl("Label1");

        ////        RadioButtonList rbl5 = (RadioButtonList)GridView1.Rows[1].FindControl("RadioButtonList1");
        ////        ((Dictionary<Int32, string>)Session["res2"])[Int32.Parse(l5.Text.TrimEnd('.'))] = rbl5.SelectedValue;

        ////        Label l6 = (Label)GridView1.Rows[2].FindControl("Label1");
        ////        RadioButtonList rbl6 = (RadioButtonList)GridView1.Rows[2].FindControl("RadioButtonList1");
        ////        ((Dictionary<Int32, string>)Session["res2"])[Int32.Parse(l6.Text.TrimEnd('.'))] = rbl6.SelectedValue;
        ////    }
        ////    catch (ArgumentOutOfRangeException) { }
        ////    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>main();</script>", false);
        ////} 

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    saveexamquestionAns();
        //    Session["CountdownTimer"] = null;
        //}

        //internal void saveexamquestionAns()   /////SaveStudentAnswers
        //{
        //    try
        //    {
        //        int stid = Convert.ToInt32(HttpContext.Current.Session["stdID"]);
        //        int rtid = Convert.ToInt32(HttpContext.Current.Session["retestid"]);
        //        string[] sbid = txtsbjidnmae.Text.Split(':');
        //        Session["subid"] = txtsbjidnmae.Text;
        //        int subid = Convert.ToInt32(sbid[0]);
        //        string QuestionId = string.Empty;
        //        string AnswerID = string.Empty;
        //        ViewState["datatable"] = Session["datatable"];
        //        Session["datatable"] = null;

        //        DataTable SesDt = ViewState["datatable"] as DataTable;
        //        QstnAnsBEList qlist = new QstnAnsBEList();
        //        for (int i = 0; i < SesDt.Rows.Count; i++)
        //        {
        //            qlist.List.Add(new QstnAnsBE()
        //            {
        //                Qstn_ID = Convert.ToInt32(SesDt.Rows[i]["Qstn_ID"]),
        //                StudentAnswer = ans(Convert.ToInt32(SesDt.Rows[i]["Id"]))
        //            });
        //        }

        //        StringBuilder sb = new StringBuilder();
        //        StringBuilder stb = new StringBuilder();

        //        for (int k = 0; k < qlist.List.Count; k++)
        //        {
        //            if (k != qlist.List.Count - 1)
        //            {
        //                QuestionId = qlist.List[k].Qstn_ID.ToString();
        //                sb.Append(QuestionId + ",");
        //                QuestionId = sb.ToString();
        //                AnswerID = qlist.List[k].StudentAnswer.ToString();
        //                stb.Append(AnswerID + ",");
        //                AnswerID = stb.ToString();
        //            }
        //            else
        //            {
        //                QuestionId = qlist.List[k].Qstn_ID.ToString();
        //                sb.Append(QuestionId);
        //                QuestionId = sb.ToString();
        //                AnswerID = qlist.List[k].StudentAnswer.ToString();
        //                stb.Append(AnswerID);
        //                AnswerID = stb.ToString();
        //            }
        //        }
        //        SqlDataReader daread = cmpbl.savequestionanswers(stid, rtid, subid, QuestionId, AnswerID);
        //        //DataTable stchage = new DataTable();
        //        //stchage.Load(daread);
        //        if (daread.RecordsAffected>0)
        //        {
        //            SqlDataReader cgstatus = cmpbl.ChangeStdExamStatuswhenTermination(stid, subid, "Completed");
        //            Session["CountdownTimer"] = null;
        //        }
        //        Response.Redirect("RealTest-Commence.aspx");
                
        //    }
        //    catch (Exception ex)
        //    {


        //    }

        //}

        //internal string cnttime()
        //{
        //    string[] cantime = Label3.Text.Split(':');  ///read Time
        //    string ct = cantime[1] + ':' + cantime[2] + ':' + cantime[3];
        //    return ct;
        //    //return (string)Session["CountdownTimer"];
        //}
        
        //internal void saveexamquestionAnsbackup()    /////SaveStudentAnswersBackup
        //{
        //    try
        //    {
        //        //HiddenField hfstrtbkid = (HiddenField)GVcommence.FindControl("hdfstubokID");
        //        int stid = Convert.ToInt32(BSTID);
        //        int rtid = Convert.ToInt32(CSTBKRTID);
        //        string ct = rtCntTime;
              
        //        string newString = Regex.Replace(rtexamtime, "[^0-9]", "");    //total time

        //        string QuestionId = string.Empty;
        //        string AnswerID = string.Empty;
        //        //ViewState["datatable"] = Session["datatable"];
        //        //Session["datatable"] = null;

        //        //DataTable SesDt = ViewState["datatable"] as DataTable;
        //        DataTable SesDt = dtforPending;
        //        QstnAnsBEList qlist = new QstnAnsBEList();
        //        for (int i = 0; i < SesDt.Rows.Count; i++)
        //        {
        //            qlist.List.Add(new QstnAnsBE()
        //            {
        //                Qstn_ID = Convert.ToInt32(SesDt.Rows[i]["Qstn_ID"]),
        //                StudentAnswer = ans(Convert.ToInt32(SesDt.Rows[i]["Id"]))
        //            });
        //        }

        //        StringBuilder sb = new StringBuilder();
        //        StringBuilder stb = new StringBuilder();

        //        for (int k = 0; k < qlist.List.Count; k++)    ////For Storing Answers side by side with kama(,)
        //        {
        //            if (k != qlist.List.Count - 1)
        //            {
        //                QuestionId = qlist.List[k].Qstn_ID.ToString();
        //                sb.Append(QuestionId + ",");
        //                QuestionId = sb.ToString();
        //                AnswerID = qlist.List[k].StudentAnswer.ToString();
        //                stb.Append(AnswerID + ",");
        //                AnswerID = stb.ToString();
        //            }
        //            else
        //            {
        //                QuestionId = qlist.List[k].Qstn_ID.ToString();
        //                sb.Append(QuestionId);
        //                QuestionId = sb.ToString();
        //                AnswerID = qlist.List[k].StudentAnswer.ToString();
        //                stb.Append(AnswerID);
        //                AnswerID = stb.ToString();
        //            }
        //        }
        //        SqlDataReader daread = cmpbl.savequestionanswersbackup(stid, rtid, Convert.ToInt32(SUBId), QuestionId, AnswerID, ct, "Pending");
        //        DataTable stchage = new DataTable();
        //        stchage.Load(daread);
        //        if (daread.RecordsAffected > 0)
        //        {
        //            SqlDataReader cgstatus = cmpbl.ChangeStdExamStatuswhenTermination(stid, Convert.ToInt32(SUBId), "Pending");
        //            HttpContext.Current.Session["CountdownTimer"] = null;
        //        }
        //       Response.Redirect("RealTest-Commence.aspx");
               
               
        //    }
        //    catch (Exception ex)
        //    {
                
        //    }
        //}

        //protected string GeDelimmetedString(List<string> strList, string delimiter)
        //{
        //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //    foreach (string str in strList)
        //    {
        //        if (sb.Length > 0)
        //        {
        //            sb.Append(delimiter);
        //        }
        //        sb.Append(str);
        //    }
        //    return sb.ToString();
        //}

        //public object CAns(object o)
        //{
        //    return DataBinder.Eval(o, (string)DataBinder.Eval(o, "Answer"));
        //}    

        //public string ans(int id)
        //{
        //    int i = id;
        //    string s;
        //    // string[] ss;
        //    if (((Dictionary<int, string>)Session["res"]).TryGetValue(i, out s))
        //        if (!string.IsNullOrEmpty(s))
        //        {
        //            s = (s.Split('.'))[0].ToString();
        //        }
        //    if (string.IsNullOrEmpty(s))
        //    {
        //        s = "F";
        //    }
        //    return s;
        //}     ////for getting Answer 

        //protected void btnExit_Click(object sender, EventArgs e)
        //{
        //    Session["CountdownTimer"] = null;
        //    saveexamquestionAns();
        //}
     
    }
}