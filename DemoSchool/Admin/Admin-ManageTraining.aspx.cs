using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;
using BAL.BE;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Data.OleDb;
using System.Drawing;

namespace PresentationLayer.Admin
{
    public partial class Admin_ManageTraining : System.Web.UI.Page
    {

        AddContentBE objAddContent = new AddContentBE();
        AddProgramsBL objBL = new AddProgramsBL();
        Training objTraining = new Training();
        AddClass objACBE = new AddClass();
        EditProgram objEPBL = new EditProgram();
        Schedules objSchedulesBE = new Schedules();
        QstnAnsBE objQABE = new QstnAnsBE();
        Slot objSBE = new Slot();
        ContentBL objContentBL = new ContentBL();
        QstnAnsBEList qstnlist = new QstnAnsBEList();
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        string readfiledata, chkeditdata;
        static int Flag = 0;
        static DateTime startDate, endDate;
        int days = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string sr = "Admin-ManageTraining.aspx?url=";
            string pth = Server.MapPath("../UploadedFile/TextFile/Alzebra.pdf");
            srcFile.Value = sr + pth;
            if (!IsPostBack)
            {
                txtclassstatusDate.Text = DateTime.Now.ToShortDateString();
                txtSubStatusDate.Text = DateTime.Now.ToShortDateString();
                LoadNewProgamsDrpdown();
                LoadContentProgamsDrpdown();
                ScheduleProgamsDrpdown();
                ProgamsDrpdown();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
            else
            {


            }
        }

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
            ddlClassPrograms.Items.Insert(0, "---Select---");
        }

        protected void ddlClassPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlClassCategories.Items.Clear();
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
                ddlClassCategories.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlClassCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBranch.Items.Clear();
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
                ddlcatsch.Items.Insert(0, "---Select---");
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
                ddlBranch.Items.Insert(0, "---Select---");
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
                ddlyear.Items.Insert(0, "---Select---");
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
                ddlclassSubjects.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlclassSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlclassSubjects.SelectedItem.Value);
            SqlDataReader dr1 = objBL.GetScheduleBySubject(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlclassesScheduleID.DataSource = dt1;
                ddlclassesScheduleID.DataValueField = "Schedule_ID";
                ddlclassesScheduleID.DataTextField = "Subject_ScheduleID";
                ddlclassesScheduleID.DataBind();
                ddlclassesScheduleID.Items.Insert(0, "--Select--");

            }
        }

        protected void ddlClassClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlclassstatus.SelectedIndex = 0;
        }

        protected void ddlclassstatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panelcls.Visible = true;
            lblprgname.Text =ddlClassPrograms.SelectedValue+":"+ ddlClassPrograms.SelectedItem.Text;
            lblcatname.Text = ddlClassCategories.SelectedValue + ":" + ddlClassCategories.SelectedItem.Text;
            //lblcatsch.Text = ddlcatsch.SelectedItem.Text;
            lblgrpname.Text = ddlBranch.SelectedValue + ":" + ddlBranch.SelectedItem.Text;
            lblsbjname.Text = ddlclassSubjects.SelectedItem.Text;
            lblunitname.Text = ddlClassClass.SelectedItem.Text;
            if (ddlClassClass.SelectedItem.Text == "Select All")
            {
                if (ddlclassstatus.SelectedItem.Text == "Delete")
                {
                    gdpnl.Visible = true;
                    GetdatatoGrid();
                }
                else
                {
                    gdpnl.Visible = true;
                    GetdatatoGrid();
                }
                btnClassDelete.Visible = false;
                btnClassCancel.Visible = false;
                btnClassUpdate.Visible = false;
            }
            else if (ddlClassClass.SelectedItem.Text != "Select All")
            {
                btnClassDelete.Visible = true;
                btnClassCancel.Visible = true;
                btnClassUpdate.Visible = true;
                if (ddlclassstatus.SelectedItem.Text != "Delete")
                {
                    string[] unitId = ddlClassClass.SelectedItem.Text.Split(':');
                    string UnitID = unitId[0];
                    upnldt.Visible = true;
                    Grdupdate.DataSource = null;
                    Grdupdate.DataBind();
                    SqlDataReader dr = objBL.GetClassDetails(Convert.ToInt32(ddlClassClass.SelectedValue), ddlclassstatus.SelectedItem.Text);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        DateTime strtdate = Convert.ToDateTime(dt.Rows[0]["startdate"].ToString());
                        txtclassStartDate.Text = strtdate.ToString("dd-MM-yyyy");
                        DateTime enddate = Convert.ToDateTime(dt.Rows[0]["Enddate"].ToString());
                        txtClassEndDate.Text = enddate.ToString("dd-MM-yyyy");
                        txtClassDuration.Text = dt.Rows[0]["Duration"].ToString();

                        ddlclasstype.SelectedItem.Text = dt.Rows[0]["ClassType"].ToString();
                        txtclassStartTime.Text = dt.Rows[0]["StartTime"].ToString();
                        txtclassEndTime.Text = dt.Rows[0]["EndTime"].ToString();
                        txtclassHours.Text = dt.Rows[0]["Hours"].ToString();
                        ddlclassno.SelectedItem.Text = dt.Rows[0]["ClassNo"].ToString();
                        // txtclassStatus.Text = dt.Rows[0]["status"].ToString();
                        DateTime statusdate = Convert.ToDateTime(dt.Rows[0]["StatusDate"].ToString());
                        txtclassstatusDate.Text = statusdate.ToString("dd-MM-yyyy");
                        txtClassRemarks.Text = dt.Rows[0]["Remarks"].ToString();
                        btnClassUpdate.Text = "Update";

                        //lblcls.Text = "Ctgy-Id:name" + " :" + ddlClassCategories.SelectedValue + " - " + ddlClassCategories.SelectedItem + " " + "Subject-Id:name" + ": " + ddlclassSubjects.SelectedItem + " " + " " + " " + "Start date" + ":" + txtclassStartDate.Text + " " + "End date:" + " " + txtClassEndDate.Text + " " + "Duration:" + " " + txtClassDuration.Text + " " + "Unit:" + " " + ddlClassClass.Text + " " + "Class-Type:" + " " + ddlclasstype.SelectedItem.Text + " " + "Start time:" + " " + txtclassStartTime.Text + " " + "End time:" + " " + txtclassEndTime.Text + " " + "Hours:" + " " + txtclassHours.Text + " " + "Status date:" + " " + txtclassstatusDate.Text + " " + "Remarks:" + " " + txtClassRemarks.Text;
                    }
                }
                else
                {
                    string[] unitId = ddlClassClass.SelectedItem.Text.Split(':');
                    string UnitID = unitId[0];
                    upnldt.Visible = true;
                    Grdupdate.DataSource = null;
                    Grdupdate.DataBind();

                    SqlDataReader dr = objBL.GetDeleteddata(Convert.ToInt32(ddlClassClass.SelectedValue), ddlclassstatus.SelectedItem.Text, Convert.ToInt32(UnitID));

                    //SqlDataReader dr = objBL.GetDeleteddata(Convert.ToInt32(ddlClassClass.SelectedValue), ddlclassstatus.SelectedItem.Text);

                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        DateTime strtdate = Convert.ToDateTime(dt.Rows[0]["startdate"].ToString());
                        txtclassStartDate.Text = strtdate.ToString("dd-MM-yyyy");
                        DateTime enddate = Convert.ToDateTime(dt.Rows[0]["Enddate"].ToString());
                        txtClassEndDate.Text = enddate.ToString("dd-MM-yyyy");
                        txtClassDuration.Text = dt.Rows[0]["Duration"].ToString();

                        ddlclasstype.SelectedItem.Text = dt.Rows[0]["ClassType"].ToString();
                        txtclassStartTime.Text = dt.Rows[0]["StartTime"].ToString();
                        txtclassEndTime.Text = dt.Rows[0]["EndTime"].ToString();
                        txtclassHours.Text = dt.Rows[0]["Hours"].ToString();
                        ddlclassno.SelectedItem.Text = dt.Rows[0]["ClassNo"].ToString();
                        // txtclassStatus.Text = dt.Rows[0]["status"].ToString();
                        DateTime statusdate = Convert.ToDateTime(dt.Rows[0]["StatusDate"].ToString());
                        txtclassstatusDate.Text = statusdate.ToString("dd-MM-yyyy");
                        txtClassRemarks.Text = dt.Rows[0]["Remarks"].ToString();
                        btnClassUpdate.Text = "Update";
                    }

                }

            }
        }

        public void GetdatatoGrid()
        {
            if (ddlclassstatus.SelectedItem.Text == "Delete")
            {
                SqlDataReader dr1 = objBL.GetDeleteclassdetailstogrid(Convert.ToInt32(ddlclassSubjects.SelectedValue), ddlclassstatus.SelectedItem.Text, ddlclass.SelectedItem.Text);
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    ViewState["DTSTUDENTS"] = dt1;
                    Grdupdate.DataSource = dt1;
                    Grdupdate.DataBind();
                }

            }
            else
            {

                SqlDataReader dr1 = objBL.Getclassdetailstogrid(Convert.ToInt32(ddlclassSubjects.SelectedValue), ddlclassstatus.SelectedItem.Text, ddlclass.SelectedItem.Text);
                DataTable dt1 = new DataTable();
                dt1.Load(dr1);
                if (dt1.Rows.Count > 0)
                {
                    ViewState["DTSTUDENTS"] = dt1;
                    Grdupdate.DataSource = dt1;
                    Grdupdate.DataBind();
                }
            }
        }

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.Getclassonunits(ddlclass.SelectedItem.Text);
            DataTable dt = new DataTable();
            dt.Load(dr);
            ViewState["untcnt"] = dt.Rows.Count.ToString();
            if (dt.Rows.Count > 0)
            {
                ddlClassClass.DataSource = dt;
                ddlClassClass.DataValueField = "ClassId";
                ddlClassClass.DataTextField = "unitname";
                ddlClassClass.DataBind();
                ddlClassClass.Items.Insert(0, "---Select---");
                ddlClassClass.Items.Insert(1, new System.Web.UI.WebControls.ListItem("Select All", "1"));
            }


        }

        protected void ddlclassesScheduleID_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetClasseNosBasedonSubject(Convert.ToInt32(ddlclassSubjects.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclass.DataSource = dt;
                ddlclass.DataValueField = "ClassNo";
                ddlclass.DataTextField = "ClassNo";
                ddlclass.DataBind();
                ddlclass.Items.Insert(0, "---Select---");
            }
            //SqlDataReader dr = objBL.GetUnitsBySchedule(ddlclassesScheduleID.SelectedItem.Text.Trim());
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //if (dt.Rows.Count > 0)
            //{
            //    ddlClassClass.DataSource = dt;
            //    ddlClassClass.DataValueField = "ClassId";
            //    ddlClassClass.DataTextField = "Unit_Name";
            //    ddlClassClass.DataBind();
            //    ddlClassClass.Items.Insert(0, "--Select--");
            //}

        }

        protected void btnClassUpdate_Click(object sender, EventArgs e)
        {
            int unitcount = 0;
            int Dcount = 0;
            string[] Unitid = ddlClassClass.SelectedItem.Text.Split(':');
            string unitid = Unitid[0];
            string[] CSchId = ddlcatsch.SelectedItem.Text.Split('(');
            string SchId = CSchId[0];
            if (ddlClassClass.SelectedItem.Text != "Select All")
            {
                if (ddlclassstatus.SelectedItem.Text == "Delete")
                {
                    int ClassID = Convert.ToInt32(ddlClassClass.SelectedValue);
                    objACBE.Duration = txtClassDuration.Text;
                    objACBE.ClassType = ddlclasstype.SelectedItem.Text;
                    objACBE.StartTime = txtclassStartTime.Text;
                    objACBE.EndTime = txtclassEndTime.Text;
                    objACBE.Hours = Convert.ToInt32(txtclassHours.Text);
                    objACBE.status = ddlclassstatus.SelectedItem.Text;
                    objACBE.StatusDate = Convert.ToDateTime(txtclassstatusDate.Text);
                    objACBE.Remarks = txtClassRemarks.Text;
                    objACBE.CatSchedule = SchId;
                    objACBE.Classno = ddlclassno.SelectedItem.ToString();
                    btnClassUpdate.Text = "Edit";
                    SqlDataReader dr1 = objTraining.Updatedatetime(Convert.ToInt32(ddlclassSubjects.SelectedValue), ddlclassno.SelectedItem.Text, Convert.ToInt32(unitid));
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr1);
                    Dcount = dt1.Rows.Count;
                    days = 1;
                    endDate = Convert.ToDateTime(txtClassEndDate.Text);
                    for (int i = 0; i < dt1.Rows.Count; i++)
                    {
                        int cid = Convert.ToInt32(dt1.Rows[i]["ClassId"]);
                        objACBE.ClassId = cid;
                        int workingDaysToAdd = days;
                        if (i == 0)
                        {
                            startDate = Convert.ToDateTime(txtclassStartDate.Text);
                        }
                        else
                        {
                            startDate = endDate.AddDays(1);
                            endDate = startDate;
                        }
                        while (workingDaysToAdd > 0)
                        {
                            if (endDate.DayOfWeek != DayOfWeek.Saturday && endDate.DayOfWeek != DayOfWeek.Sunday)
                                workingDaysToAdd--;
                            if (workingDaysToAdd > 0)
                                endDate = endDate.AddDays(1);

                            objACBE.Enddate = endDate;
                            objACBE.startdate = startDate;
                            SqlDataReader dr = objTraining.Update_ClassDT(objACBE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblflmsg.Text = "Updated sucessfully";
                                lblflmsg.ForeColor = Color.Green;
                            }
                            else
                            {
                                lblflmsg.Text = "Failed";
                                lblflmsg.ForeColor = Color.Red;
                            }
                        }
                    }
                    objACBE.ClassId = Convert.ToInt32(ddlClassClass.SelectedValue);
                    SqlDataReader drm = objTraining.Update_DeleteClass(objACBE);
                    if (drm.RecordsAffected > 0)
                    {
                        lblflmsg.Text = "Updated sucessfully";
                        lblflmsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblflmsg.Text = "Failed";
                        lblflmsg.ForeColor = Color.Red;
                    }
                    ClassesTextboxClear();
                    ddlClassCategories.Items.Clear();
                    ddlclassSubjects.Items.Clear();
                    ddlBranch.Items.Clear();
                    ddlyear.Items.Clear();
                    ddlClassClass.Items.Clear();
                    LoadNewProgamsDrpdown();
                }
                else
                {

                    int ClassID = Convert.ToInt32(ddlClassClass.SelectedValue);

                    //objACBE.startdate = Convert.ToDateTime(txtclassStartDate.Text);

                    objACBE.Duration = txtClassDuration.Text;
                    objACBE.ClassType = ddlclasstype.SelectedItem.Text;
                    objACBE.StartTime = txtclassStartTime.Text;
                    objACBE.EndTime = txtclassEndTime.Text;
                    objACBE.Hours = Convert.ToInt32(txtclassHours.Text);
                    objACBE.status = ddlclassstatus.SelectedItem.Text;
                    objACBE.StatusDate = Convert.ToDateTime(txtclassstatusDate.Text);
                    objACBE.Remarks = txtClassRemarks.Text;
                    objACBE.CatSchedule = SchId;
                    objACBE.Classno = ddlclassno.SelectedItem.ToString();
                    btnClassUpdate.Text = "Edit";
                    SqlDataReader dr1 = objTraining.Updatedatetime(Convert.ToInt32(ddlclassSubjects.SelectedValue), ddlclassno.SelectedItem.Text, Convert.ToInt32(unitid));
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr1);
                    Dcount = dt1.Rows.Count;
                    days = 1;
                    endDate = Convert.ToDateTime(txtClassEndDate.Text);
                    for (int i = 0; i < Dcount; i++)
                    {
                        int cid = Convert.ToInt32(dt1.Rows[i]["ClassId"]);
                        objACBE.ClassId = cid;
                        int workingDaysToAdd = days;
                        if (i == 0)
                        {
                            startDate = Convert.ToDateTime(txtclassStartDate.Text);
                        }
                        else
                        {
                            startDate = endDate.AddDays(1);
                            endDate = startDate;
                        }
                        // string name = ddlClassUnits.Items[i + 2].Value;
                        while (workingDaysToAdd > 0)
                        {
                            if (endDate.DayOfWeek != DayOfWeek.Saturday && endDate.DayOfWeek != DayOfWeek.Sunday)
                                workingDaysToAdd--;
                            if (workingDaysToAdd > 0)
                                endDate = endDate.AddDays(1);
                            objACBE.Enddate = endDate;
                            objACBE.startdate = startDate;
                            SqlDataReader dr = objTraining.Updateclassgrid(objACBE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblflmsg.Text = "Updated sucessfully";
                                lblflmsg.ForeColor = Color.Green;
                            }
                            else
                            {
                                lblflmsg.Text = "Failed";
                                lblflmsg.ForeColor = Color.Red;
                            }
                        }
                    }
                    SqlDataReader drt = objTraining.Update_Class(objACBE);
                    if (drt.RecordsAffected > 0)
                    {
                        lblflmsg.Text = "Updated sucessfully";
                        lblflmsg.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblflmsg.Text = "Failed";
                        lblflmsg.ForeColor = Color.Red;
                    }
                    ClassesTextboxClear();
                    ddlClassCategories.Items.Clear();
                    ddlclassSubjects.Items.Clear();
                    ddlBranch.Items.Clear();
                    ddlyear.Items.Clear();
                    ddlClassClass.Items.Clear();
                    LoadNewProgamsDrpdown();
                }
            }

        }

        private void ClassesTextboxClear()
        {
            txtclassStartDate.Text = "";
            txtClassEndDate.Text = "";
            txtClassDuration.Text = "";
            ddlclasstype.SelectedValue = "1";
            txtclassStartTime.Text = "";
            txtclassEndTime.Text = "";
            txtclassHours.Text = "";
            //ddlFaculty.Items.Clear();
            ddlclassstatus.SelectedIndex = -1;
            txtclassstatusDate.Text = "";
            txtClassRemarks.Text = "";
            ddlType.SelectedIndex = -1;
            ddlCategoriesForContent.SelectedIndex = -1;
            ddlProgramsContent.SelectedIndex = -1;
            ddlSubjectforContent.SelectedIndex = -1;
            ddlSubjectforContent.SelectedIndex = -1;
            ddlclassesScheduleID.Items.Clear();

        }

        protected void btnClassDelete_Click(object sender, EventArgs e)
        {
            SqlDataReader dr = objTraining.DeleteClass(Convert.ToInt32(ddlClassClass.SelectedItem.Value));
            ClassesTextboxClear();
            ddlClassCategories.Items.Clear();
            ddlclassSubjects.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlClassClass.Items.Clear();
            LoadNewProgamsDrpdown();
            upnldt.Visible = false;
        }

        protected void btnClassCancel_Click(object sender, EventArgs e)
        {
            ClassesTextboxClear();
            ddlClassCategories.Items.Clear();
            ddlclassSubjects.Items.Clear();
            ddlBranch.Items.Clear();
            ddlyear.Items.Clear();
            ddlClassClass.Items.Clear();
            LoadNewProgamsDrpdown();
        }

        protected void Grdupdate_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grdupdate.EditIndex = e.NewEditIndex;
            DataTable dt = (DataTable)ViewState["DTSTUDENTS"];
            Grdupdate.DataSource = dt;
            Grdupdate.DataBind();
        }

        protected void Grdupdate_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ID = Convert.ToInt32(Grdupdate.DataKeys[e.RowIndex].Value.ToString());
            HiddenField hdnclsid = (HiddenField)Grdupdate.Rows[e.RowIndex].FindControl("hdnclsId");
            HiddenField hdnclssdate = (HiddenField)Grdupdate.Rows[e.RowIndex].FindControl("hdnclsdate");
            string Sdate = hdnclssdate.Value;
            HiddenField hdnclsstatus = (HiddenField)Grdupdate.Rows[e.RowIndex].FindControl("hdnclssts");
            string Status = hdnclsstatus.Value;
            SqlDataReader dr = objTraining.Getdatecount(Sdate, Convert.ToInt32(ddlclassSubjects.SelectedValue), ddlclass.SelectedItem.Text);
            DataTable dt1 = new DataTable();
            dt1.Load(dr);
            objACBE.ClassId = Convert.ToInt32(hdnclsid.Value);
            //TextBox txstatus = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclstatus");
            //objACBE.status = txstatus.Text;
            TextBox txsrtdate = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclsdtae");
            string Startdt = txsrtdate.Text;
            TextBox txedate = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclsedate");
            string Enddt = txedate.Text;
            TextBox txtclstype = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclstype");
            objACBE.ClassType = txtclstype.Text;
            TextBox txtstime = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclstime");
            objACBE.StartTime = txtstime.Text;
            TextBox txtetime = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclsetime");
            objACBE.EndTime = txtetime.Text;
            //TextBox txtClassno = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclsno");
            //objACBE.Classno = txtClassno.Text;
            //TextBox txtstsdate = (TextBox)Grdupdate.Rows[e.RowIndex].FindControl("txtclstatusdate");
            //objACBE.StatusDate = Convert.ToDateTime(txtstsdate.Text);
            DropDownList ddlsts = (DropDownList)Grdupdate.Rows[e.RowIndex].FindControl("ddlstatus");
            objACBE.status = ddlsts.SelectedItem.Text;
            int count = Convert.ToInt32(dt1.Rows.Count);
            days = 1;
            DateTime enddate = Convert.ToDateTime(Startdt);
            if (Status == "Delete")
            {
                for (int i = 0; i < count; i++)
                {
                    int cid = Convert.ToInt32(dt1.Rows[i]["ClassId"]);
                    objACBE.ClassId = cid;
                    int workingDaysToAdd = days;
                    if (i == 0)
                    {
                        startDate = Convert.ToDateTime(Startdt);
                    }
                    else
                    {
                        startDate = enddate.AddDays(1);
                        enddate = startDate;
                    }
                    while (workingDaysToAdd > 0)
                    {
                        if (enddate.DayOfWeek != DayOfWeek.Saturday && enddate.DayOfWeek != DayOfWeek.Sunday)
                            workingDaysToAdd--;
                        if (workingDaysToAdd > 0)
                            enddate = enddate.AddDays(1);
                    }
                    objACBE.Enddate = enddate;
                    objACBE.startdate = startDate;
                    objTraining.Updateclassgrid(objACBE);

                }
                objACBE.ClassId = Convert.ToInt32(hdnclsid.Value);
                objTraining.Updatedeleteclassgrid(objACBE);
                GetdatatoGrid();
                CancelingEdit();

            }
            else
            {
                for (int i = 0; i < count; i++)
                {
                    int cid = Convert.ToInt32(dt1.Rows[i]["ClassId"]);
                    objACBE.ClassId = cid;
                    int workingDaysToAdd = days;
                    if (i == 0)
                    {
                        startDate = Convert.ToDateTime(Startdt);
                    }
                    else
                    {
                        startDate = enddate.AddDays(1);
                        enddate = startDate;
                    }
                    while (workingDaysToAdd > 0)
                    {
                        if (enddate.DayOfWeek != DayOfWeek.Saturday && enddate.DayOfWeek != DayOfWeek.Sunday)
                            workingDaysToAdd--;
                        if (workingDaysToAdd > 0)
                            enddate = enddate.AddDays(1);
                    }
                    objACBE.Enddate = enddate;
                    objACBE.startdate = startDate;
                    objTraining.Updateclassgrid(objACBE);

                }
                objTraining.Updateclassinfo(objACBE);
                GetdatatoGrid();
                CancelingEdit();
            }
        }

        protected void Grdupdate_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CancelingEdit();
        }

        internal void CancelingEdit()
        {
            Grdupdate.EditIndex = -1;
            DataTable dt = (DataTable)ViewState["DTSTUDENTS"];
            Grdupdate.DataSource = dt;
            Grdupdate.DataBind();
        }
        protected void Grdupdate_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            HiddenField hdnclsid = (HiddenField)Grdupdate.Rows[e.RowIndex].FindControl("hdnclsId");
            int ClassId = Convert.ToInt32(hdnclsid.Value);
            SqlDataReader dr = objTraining.DeleteClass(Convert.ToInt32(ClassId));
            GetdatatoGrid();
        }
        #endregion Classes

        #region Content

        public void LoadContentProgamsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlProgramsContent.DataSource = dt;
            ddlProgramsContent.DataValueField = "Program_id";
            ddlProgramsContent.DataTextField = "Program_name";
            ddlProgramsContent.DataBind();
            ddlProgramsContent.Items.Insert(0, "---Select---");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
        }

        protected void ddlProgramsContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProgramsContent.SelectedItem.Text != "---Select---")
            {
                ddlCategoriesForContent.Items.Clear();
                int programId = Convert.ToInt32(ddlProgramsContent.SelectedItem.Value);
                SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlCategoriesForContent.DataSource = dt;
                    ddlCategoriesForContent.DataValueField = "Category_Id";
                    ddlCategoriesForContent.DataTextField = "Category_Name";
                    ddlCategoriesForContent.DataBind();
                    ddlCategoriesForContent.Items.Insert(0, "---Select---");
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
            else
            {
                ddlCategoriesForContent.Items.Clear();
                ddlSubjectforContent.Items.Clear();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
        }

        protected void ddlCategoriesForContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategoryId = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
        }

        protected void ddlContentcatsch_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlContentcatsch.SelectedItem.Text != "---Select---")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
                int CategoryId = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(CategoryId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlGroupForContent.DataSource = dt;
                    ddlGroupForContent.DataValueField = "Branch_Id";
                    ddlGroupForContent.DataTextField = "Branch_Name";
                    ddlGroupForContent.DataBind();
                    ddlGroupForContent.Items.Insert(0, "---Select---");
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }

        }

        protected void ddlGroupForContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
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
                ddlYearForContent.Items.Insert(0, "---Select---");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
        }

        protected void ddlYearForContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            int yearId = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(yearId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjectforContent.DataSource = dt;
                ddlSubjectforContent.DataValueField = "Subject_Id";
                ddlSubjectforContent.DataTextField = "SubjectName";
                ddlSubjectforContent.DataBind();
                ddlSubjectforContent.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
        }

        protected void ddlSubjectforContent_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlconsubschid.Items.Clear();
            Pnl1.Visible = false;
            ddlContentUnits.Items.Clear();
            if (ddlSubjectforContent.SelectedItem.Text != "--Select--")
            {
                int SubjectID = Convert.ToInt32(ddlSubjectforContent.SelectedItem.Value);
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
            else
            {
                ddlType.SelectedValue = "0";
                ddlconsubschid.Items.Clear();
            }
        }

        protected void ddlconsubschid_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlType.SelectedIndex = 0;
            Pnl1.Visible = false;
            ddlContentUnits.Items.Clear();
            if (ddlSubjectforContent.SelectedItem.Text != "--Select--")
            {
                int SubjectID = Convert.ToInt32(ddlconsubschid.SelectedItem.Value);
                SqlDataReader dr = objBL.GetUnitsForContent(SubjectID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlContentUnits.DataSource = dt;
                    ddlContentUnits.DataValueField = "Unit_Id";
                    ddlContentUnits.DataTextField = "Unit_Name";
                    ddlContentUnits.DataBind();
                    ddlContentUnits.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
            else
            {
                ddlType.SelectedValue = "0";
                ddlContentUnits.Items.Clear();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
        }

        protected void ddlContentUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            Pnl1.Visible = false;
            ddlType.SelectedIndex = 0;
        }

        protected void ddlConStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlType.SelectedIndex = 0;
            Pnl1.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
        }

        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblOldfileDisplay.Text = string.Empty;
            int pgmid = Convert.ToInt32(ddlProgramsContent.SelectedItem.Value);
            int ctid = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
            int suid = Convert.ToInt32(ddlSubjectforContent.SelectedItem.Value);
            int unid = Convert.ToInt32(ddlContentUnits.SelectedItem.Value);
            string contype = ddlType.SelectedItem.Text;
            int grid = Convert.ToInt32(ddlGroupForContent.SelectedItem.Value);
            int yerid = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            string[] ctgsc = ddlContentcatsch.SelectedItem.Text.Split('(');
            string ctgschid = ctgsc[0];
            string cons = ddlConStatus.SelectedItem.Text;
            DataTable browserpat = new DataTable();
            if (ddlType.SelectedItem.Text != "---Select---")
            {
                if (ddlConStatus.Text != "Deleted" && ddlConStatus.Text != "--Select--")
                {
                    SqlDataReader brfilepath = objContentBL.getbrowsedpath(contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid, cons);
                    browserpat.Load(brfilepath);

                    if (browserpat.Rows.Count > 0)
                    {
                        string rs = browserpat.Rows[0]["BrowsedFilePath"].ToString();
                        //lblOldfileDisplay.Text = ddlProgramsContent.SelectedItem.Text + " : " + ddlCategoriesForContent.SelectedItem.Text + " : " + ddlSubjectforContent.SelectedItem.Text + " : " + ddlContentUnits.SelectedItem.Text + " : " + rs;
                        //lblOldfileDisplay.ForeColor = System.Drawing.Color.Green;
                        Pnl1.Visible = true;
                        lblconctgname.Text = ddlCategoriesForContent.SelectedItem.Text;
                        lblconGroup.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconYear.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconsubname.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconunname.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconName.Text = ddlProgramsContent.SelectedItem.Text;
                    }
                    else
                    {
                        Pnl1.Visible = false;
                        //lblOldfileDisplay.Text = "Their Is No Data For This Unit";
                        //lblOldfileDisplay.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else if (ddlConStatus.Text == "Deleted")
                {
                    SqlDataReader brfilepath = objContentBL.getbrowsedpath(contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid, cons);
                    browserpat.Load(brfilepath);
                    if (browserpat.Rows.Count > 0)
                    {
                        string rs = browserpat.Rows[0]["BrowsedFilePath"].ToString();
                        //lblOldfileDisplay.Text = ddlProgramsContent.SelectedItem.Text + " : " + ddlCategoriesForContent.SelectedItem.Text + " : " + ddlSubjectforContent.SelectedItem.Text + " : " + ddlContentUnits.SelectedItem.Text + " : " + rs;
                        //lblOldfileDisplay.ForeColor = System.Drawing.Color.Green;
                        Pnl1.Visible = true;
                        lblconctgname.Text = ddlCategoriesForContent.SelectedItem.Text;
                        lblconGroup.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconYear.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconsubname.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconunname.Text = ddlProgramsContent.SelectedItem.Text;
                        lblconName.Text = ddlProgramsContent.SelectedItem.Text;
                    }
                    else
                    {
                        Pnl1.Visible = false;
                        //lblOldfileDisplay.Text = "their is no deleted files";
                        //lblOldfileDisplay.ForeColor = System.Drawing.Color.Red;
                    }
                }

                //LoadContentGrid(SubjectID, ddlType.SelectedItem.Text);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideVideoDiv", "hideVideoDiv();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
        }

        internal void btnupld()
        {
            string textPath = string.Empty;
            string ext;
            string gvfilename = string.Empty;
            lblNewfileDisplay.Text = string.Empty;
            string fullpath = Server.MapPath("/Update/uploadfiles");
            string filename = ddlContentUnits.SelectedItem.Value + "-" + ddlContentUnits.SelectedItem.Text;
            if (chkboxforFile.Checked == true)
            {
                if (ddlType.SelectedItem.Text == "Text")
                {
                    textPath = Server.MapPath("/UploadedFile/TextFile");
                    //if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
                    //{
                    //    System.IO.File.Delete(textPath + "\\" + filename + ".txt");
                    //}
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
                    if (!string.IsNullOrEmpty(readfiledata))
                    {
                        if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
                        {
                            System.IO.File.Delete(textPath + "\\" + filename + ".txt");
                        }

                        System.IO.FileStream fst = new FileStream(textPath + "\\" + filename + ".txt", FileMode.Create);
                        string resultf = Regex.Replace(readfiledata, @"<[^>]*>", string.Empty);
                        string str2 = Server.HtmlEncode(resultf);
                        Byte[] txtt = new UTF8Encoding(true).GetBytes(str2);
                        fst.Write(txtt, 0, txtt.Length);
                        GridView1.DataSource = null;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
                        Flag = 1;    ////For Sucessfull  Update
                    }
                    else
                    {
                        Flag = 2;    /////Please select uploaded files save
                        if (fileupdation.HasFile)
                        {
                            if (fileupdation.PostedFile.ContentType == "txt/TXT" || fileupdation.PostedFile.ContentType == "text/plain")
                            {
                                if (fileupdation.FileContent.Length > 0)
                                {
                                    if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
                                    {
                                        System.IO.File.Delete(textPath + "\\" + filename + ".txt");
                                    }
                                    fileupdation.SaveAs(textPath + "\\" + filename + ".txt");
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
                                    Flag = 1;     ////For Sucessfull Update
                                }
                            }
                            else
                            {
                                Flag = 3;      ////upload text files only
                            }
                        }
                    }

                }
                else if (ddlType.SelectedItem.Text == "References")
                {
                    textPath = Server.MapPath("/UploadedFile/References");
                    if (fileupdation.HasFile)
                    {
                        if (fileupdation.PostedFile.ContentType == "txt/TXT" || fileupdation.PostedFile.ContentType == "text/plain")
                        {
                            if (fileupdation.FileContent.Length > 0)
                            {
                                if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
                                {
                                    System.IO.File.Delete(textPath + "\\" + filename + ".txt");
                                }
                                fileupdation.SaveAs(textPath + "\\" + filename + ".txt");
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
                                Flag = 1;     ////For Sucessfull Update
                            }
                        }
                        else
                        {
                            Flag = 3;
                        }
                    }

                }
                else
                {
                    if (ddlType.SelectedItem.Text == "Video")
                    {
                        textPath = Server.MapPath("/UploadedFile/VideoFiles");
                    }
                    else
                    {
                        textPath = Server.MapPath("/UploadedFile/Recordings");
                    }
                    string strFinalFileName = Path.GetFileName(fileupdation.FileName);
                    long FileLength = fileupdation.PostedFile.ContentLength;
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
                    ext = Path.GetExtension(fileupdation.PostedFile.FileName);
                    fileupdation.PostedFile.SaveAs(textPath + "\\" + filename + ext);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
                    Flag = 1;     ////For Sucessfull Update
                }

            }
            else
            {
                Flag = 4;
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)  /////For Update NewFile for Unit
        {
            Flag = 0;
            int pgmid = Convert.ToInt32(ddlProgramsContent.SelectedItem.Value);
            int ctid = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
            int suid = Convert.ToInt32(ddlSubjectforContent.SelectedItem.Value);
            int unid = Convert.ToInt32(ddlContentUnits.SelectedItem.Value);
            int grid = Convert.ToInt32(ddlGroupForContent.SelectedItem.Value);
            int yerid = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            string[] ctgsc = ddlContentcatsch.SelectedItem.Text.Split('(');
            string ctgschid = ctgsc[0];
            string contype = ddlType.SelectedItem.Text;
            string[] ctsubscid = ddlconsubschid.SelectedItem.Text.Split('(');
            string subscid = ctsubscid[0];
            string cons = ddlConStatus.SelectedItem.Text;
            string constts = "New";
            lblNewfileDisplay.Text = string.Empty;
            if (ddlConStatus.SelectedItem.Text == "Deleted")
            {
                btnupld();
                SqlDataReader sdr = objContentBL.UpdateDeletedContentFile(1, constts, contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid, subscid, cons);
            }
            else
            {
                btnupld();
            }

            if (Flag == 2)
            {
                lblNewfileDisplay.Text = "Please Select Uploaded Files To Update";
                lblNewfileDisplay.ForeColor = System.Drawing.Color.Red;
                Flag = 0;
            }
            else
                if (Flag == 3)
                {
                    lblNewfileDisplay.Text = "Please Upload Text Files Only";
                    lblNewfileDisplay.ForeColor = System.Drawing.Color.Red;
                    Flag = 0;
                }
                else
                    if (Flag == 1)
                    {
                        lblNewfileDisplay.Text = "Updated Successfully";
                        lblNewfileDisplay.ForeColor = System.Drawing.Color.Green;
                        Flag = 0;
                    }
                    else
                        if (Flag == 4)
                        {
                            lblNewfileDisplay.Text = "Please Mark File To Replace Option";
                            lblNewfileDisplay.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            Flag = 0;
                        }
            GridView1.DataSource = null;
            GridView1.DataBind();
            clearContent();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
        }

        protected void btnAddFile_Click(object sender, EventArgs e)   ////event for multiple files to Grid
        {
            lblNewfileDisplay.Text = string.Empty;
            bindgrid();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
        }

        private void gridVIEWData()
        {
            dt1.Columns.Add("Content_Data", typeof(string));
            Session["dtInSession"] = dt1;     //Saving Datatable To Session 
        }

        internal void bindgrid()     ////method for multiple files to Grid 
        {
            lblNewfileDisplay.Text = string.Empty;
            string finame = string.Empty;
            string textPa = Server.MapPath("/Update/uploadfiles");
            gridVIEWData();
            if (!Directory.Exists(textPa))
            {
                Directory.CreateDirectory(textPa);
            }
            if (fileupdation.HasFile)
            {
                if (fileupdation.PostedFile.ContentType == "txt/TXT" || fileupdation.PostedFile.ContentType == "text/plain")
                {
                    if (fileupdation.FileContent.Length > 0)
                    {
                        //sb.AppendFormat(" Uploading file: {0}", ContentUpload.FileName);
                        string filname = Path.GetFileName(fileupdation.PostedFile.FileName);
                        string dg = ddlContentUnits.SelectedItem.Text;
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

                        if ((System.IO.File.Exists(textPa + "\\" + finame)))
                        {
                            lblNewfileDisplay.Text = "File already added";
                            lblNewfileDisplay.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            fileupdation.SaveAs(textPa + "\\" + finame);
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

        protected void btnFileView_Click(object sender, EventArgs e)   ///// To Show Audio (or) Play Video  ///Completed
        {
            lblNewfileDisplay.Text = string.Empty;
            displayAudioVideoRecording();
        }

        protected void btnFileDelete_Click(object sender, EventArgs e)     /////Delete a File  ///Completed
        {
            string textPath = string.Empty;
            int pgmid = Convert.ToInt32(ddlProgramsContent.SelectedItem.Value);
            int ctid = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
            int suid = Convert.ToInt32(ddlSubjectforContent.SelectedItem.Value);
            int unid = Convert.ToInt32(ddlContentUnits.SelectedItem.Value);
            int grid = Convert.ToInt32(ddlGroupForContent.SelectedItem.Value);
            int yerid = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            string[] ctgsc = ddlContentcatsch.SelectedItem.Text.Split('(');
            string ctgschid = ctgsc[0];
            string contype = ddlType.SelectedItem.Text;
            string[] ctsubscid = ddlconsubschid.SelectedItem.Text.Split('(');
            string subscid = ctsubscid[0];
            string cons = ddlConStatus.SelectedItem.Text;
            string constts = "Deleted";
            DataTable browserpat = new DataTable();
            //SqlDataReader brfilepath = objContentBL.DeleteContentFile(contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid);
            SqlDataReader brfilepath = objContentBL.UpdateDeletedContentFile(0, constts, contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid, subscid, cons);
            if (brfilepath.HasRows)
            {
                lblNewfileDisplay.Text = "File Deleted SuccessFully";
                lblNewfileDisplay.ForeColor = System.Drawing.Color.Green;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
            }
        }

        //if (contype == "Text")
        //{
        //    textPath = Server.MapPath("/UploadedFile/TextFile");
        //}
        //else if (contype == "Video")
        //{
        //    textPath = Server.MapPath("/UploadedFile/VideoFiles");
        //}
        //else if (contype == "Recording")
        //{
        //    textPath = Server.MapPath("/UploadedFile/Recordings");
        //}
        //else
        //{
        //    textPath = Server.MapPath("/UploadedFile/References");
        //}
        //string filename = ddlContentUnits.SelectedItem.Value + "-" + ddlContentUnits.SelectedItem.Text;
        //if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
        //{
        //    System.IO.File.Delete(textPath + "\\" + filename + ".txt");
        //}


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string[] patsplit = (displaypath()).Split('\\');
            string lbtnText = patsplit[1];
            string textPath = string.Empty;
            string chkeditdata = string.Empty;
            string filename = ddlContentUnits.SelectedItem.Value + "-" + ddlContentUnits.SelectedItem.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideVideoDiv", "hideVideoDiv();", true);
            if (ddlType.SelectedItem.Text == "Text")
            {
                textPath = Server.MapPath("/UploadedFile/TextFile");
                getstring.Value = lbtnText;
            }
            else
                if (ddlType.SelectedItem.Text == "References")
                {
                    textPath = Server.MapPath("/UploadedFile/References");
                }

            if (btnEdit.Text == "Edit")
            {
                txtEditor.Visible = true;
                using (StreamReader streamReader = new StreamReader(textPath + "\\" + lbtnText, Encoding.UTF8))
                {
                    txtEditor.Text = streamReader.ReadToEnd();
                }
                btnEdit.Text = "Update";
                //string[] patspl = (displaypath()).Split('\\');
                //string lbtText = patsplit[1];
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "smsPathText", "smsPathText('" + lbtText + "');", true);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideframediv", "hideframediv();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidetextdiv", "hidetextdiv();", true);
            }
            else
            {
                chkeditdata = txtEditor.Text.Trim();
                if ((System.IO.File.Exists(textPath + "\\" + filename + ".txt")))
                {
                    System.IO.File.Delete(textPath + "\\" + filename + ".txt");
                }
                System.IO.FileStream fs = new FileStream(textPath + "\\" + filename + ".txt", FileMode.Create);
                string result = Regex.Replace(chkeditdata, @"<[^>]*>", string.Empty);
                string str1 = Server.HtmlEncode(result);
                Byte[] txt = new UTF8Encoding(true).GetBytes(str1);
                fs.Write(txt, 0, txt.Length);
                btnEdit.Text = "Edit";

                lblNewfileDisplay.Text = "File Updated Successfully";
                lblNewfileDisplay.ForeColor = System.Drawing.Color.Red;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideEditordiv", "hideEditordiv();", true);
            }

        }

        internal string displaypath()   ///returns Path
        {
            string Brpath = string.Empty;
            int pgmid = Convert.ToInt32(ddlProgramsContent.SelectedItem.Value);
            int ctid = Convert.ToInt32(ddlCategoriesForContent.SelectedItem.Value);
            int suid = Convert.ToInt32(ddlSubjectforContent.SelectedItem.Value);
            int unid = Convert.ToInt32(ddlContentUnits.SelectedItem.Value);
            string contype = ddlType.SelectedItem.Text;
            int grid = Convert.ToInt32(ddlGroupForContent.SelectedItem.Value);
            int yerid = Convert.ToInt32(ddlYearForContent.SelectedItem.Value);
            string[] ctgsc = ddlContentcatsch.SelectedItem.Text.Split('(');
            string ctgschid = ctgsc[0];
            string consts = ddlConStatus.SelectedItem.Text;
            DataTable browserpat = new DataTable();
            SqlDataReader brfilepath = objContentBL.getbrowsedpath(contype, pgmid, ctid, suid, unid, grid, yerid, ctgschid, consts);
            browserpat.Load(brfilepath);
            if (browserpat.Rows.Count > 0)
            {
                Brpath = browserpat.Rows[0]["BrowsedFilePath"].ToString();
            }
            return Brpath;
        }

        internal void displayAudioVideoRecording()     //////For Display (or) Play The File   ///Completed
        {
            string[] patsplit = (displaypath()).Split('\\');
            string lbtnText = patsplit[1];
            string textPath = string.Empty;
            if (ddlType.SelectedItem.Text == "Video")
            {
                getstring.Value = lbtnText;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "callPath", "callPath('" + lbtnText + "');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideTextDiv", "hideTextDiv();", true);
                //  this.updateVideo.Update();
            }
            else if (ddlType.SelectedItem.Text == "Text")
            {
                getstring.Value = lbtnText;
                txtEditor.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "callPathText", "callPathText('" + lbtnText + "');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideVideoDiv", "hideVideoDiv();", true);
                // this.updatepanelText.Update();
            }
            else if (ddlType.SelectedItem.Text == "Recording")
            {
                getstring.Value = lbtnText;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "callPath1", "callPath1('" + lbtnText + "');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showAudiodiv", "showAudiodiv();", true);
                // this.updatepanelText.Update();
            }
            else if (ddlType.SelectedItem.Text == "References")
            {
                getstring.Value = lbtnText;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "callPathReferences", "callPathReferences('" + lbtnText + "');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideVideoDiv", "hideVideoDiv();", true);
                // this.updatepanelText.Update();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            //lblOldfileDisplay.Text = string.Empty;
            clearContent();
            GridView1.DataSource = null;
        }

        internal void clearContent()
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            lblNewfileDisplay.Text = string.Empty;
            //lblOldfileDisplay.Text = string.Empty;
            ddlProgramsContent.SelectedIndex = 0;
            ddlCategoriesForContent.Items.Clear();
            ddlContentcatsch.Items.Clear();
            ddlGroupForContent.Items.Clear();
            ddlYearForContent.Items.Clear();
            ddlSubjectforContent.Items.Clear();
            ddlContentUnits.Items.Clear();
            ddlType.SelectedIndex = 0;
            ddlconsubschid.Items.Clear();
            ddlConStatus.SelectedItem.Text = "--Select--";
            ddlProgramsContent.SelectedItem.Text = "---Select---";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hidePdfFrameDiv", "hidePdfFrameDiv();", true);
        }

        protected void btnCancelUnit_Click(object sender, EventArgs e)
        {
            ClassesTextboxClear();
            clearContent();
        }

        #endregion Content

        #region Shedules

        private void ScheduleProgamsDrpdown()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlSubjectPrograms.DataSource = dt;
            ddlSubjectPrograms.DataValueField = "Program_id";
            ddlSubjectPrograms.DataTextField = "Program_name";
            ddlSubjectPrograms.DataBind();
            ddlSubjectPrograms.Items.Insert(0, "---Select---");
        }

        private void ClearScheduleData()
        {
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";

            txtSchedulestartDate.Text = "";
            txtScheduleEndDate.Text = "";
            ddlscheduleStatus.SelectedValue = "0";
            txtSubStatusDate.Text = "";
            txtSubRemarks.Text = "";
            ddlSubjectCategories.Items.Clear();
            ddlScheduleSubject.Items.Clear();
            ddlScheduleID.Items.Clear();
            ddlScheduleGroup.Items.Clear();
            ddlSecheduleYear.Items.Clear();
            ScheduleProgamsDrpdown();
        }

        protected void ddlSubjectPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubjectCategories.Items.Clear();
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
                ddlSubjectCategories.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlSubjectCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlScheduleGroup.Items.Clear();
            ddlSecheduleYear.Items.Clear();
            ddlScheduleSubject.Items.Clear();
            txtSubRegDate.Text = "";
            txtScheduleDuration.Text = "";


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


            if (ScheduleRadiolist.SelectedValue == "1")  //Category Display fields
            {
                int CategoryID = Convert.ToInt32(ddlSubjectCategories.SelectedValue);
                SqlDataReader dr = objEPBL.GetScheduleIDByCategoryID(CategoryID);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlScheduleID.DataSource = dt;
                    ddlScheduleID.DataValueField = "S_NO";
                    ddlScheduleID.DataTextField = "Schedule_ID";
                    ddlScheduleID.DataBind();
                    ddlScheduleID.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "0"));
                }
            }

            ddlScheduleSubject.Items.Clear();
            int BranchId = Convert.ToInt32(ddlScheduleGroup.SelectedItem.Value);
            SqlDataReader dr1 = objBL.GetYearBasedOnGroupDrpdwn(BranchId);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlSecheduleYear.DataSource = dt1;
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

        protected void ddlScheduleSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlScheduleSubject.SelectedValue);
            int substs = 1;
            SqlDataReader dr = objEPBL.GetScheduleIDBySubjectData(SubjectID, substs);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlScheduleID.DataSource = dt;
                ddlScheduleID.DataValueField = "S_NO";
                ddlScheduleID.DataTextField = "Subject_ScheduleID";
                ddlScheduleID.DataBind();
                ddlScheduleID.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlScheduleID_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlscheduleStatus.SelectedIndex = 0;
        }

        protected void ddlscheduleStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ScheduleID = Convert.ToInt32(ddlScheduleID.SelectedValue);
            int schsubsts;
            DataTable dt = new DataTable();
            string sts = ddlscheduleStatus.SelectedItem.Text;
            if (ddlscheduleStatus.SelectedIndex == 5)
            {
                schsubsts = 1;

            }
            else
            {
                schsubsts = 0;
            }

            if (ScheduleRadiolist.SelectedValue == "1")
            {
                if (ddlscheduleStatus.SelectedIndex != 5)
                {
                    SqlDataReader dr = objEPBL.GetScheduleDataByScheduleID(ScheduleID, sts, 1);
                    dt.Load(dr);
                }
                else
                {
                    SqlDataReader dr = objEPBL.GetScheduleDataByScheduleID(ScheduleID, sts, schsubsts);
                    dt.Load(dr);
                }
            }
            else
            {
                SqlDataReader dr = objEPBL.GetsubScheduleDataByScheduleID(ScheduleID, sts, schsubsts);
                dt.Load(dr);
            }

            if (dt.Rows.Count > 0)
            {
                DateTime dtm = Convert.ToDateTime(dt.Rows[0]["Reg_Date"]);
                txtSubRegDate.Text = dtm.ToString("dd-MM-yyyy");
                txtScheduleDuration.Text = dt.Rows[0]["Duration"].ToString();
                //DateTime dts = Convert.ToDateTime(dt.Rows[0]["Start_Date"]);
                //txtsubjectStartdate.Text = dts.ToString("dd-MM-yyyy");
                //DateTime dtl = Convert.ToDateTime(dt.Rows[0]["End_date"]);
                //txtsubjectEnddate.Text = dtl.ToString("dd-MM-yyyy");
                DateTime dtn = Convert.ToDateTime(dt.Rows[0]["Schedule_srt_Date"]);
                txtSchedulestartDate.Text = dtn.ToString("dd-MM-yyyy");
                DateTime dtk = Convert.ToDateTime(dt.Rows[0]["Schedule_end_Date"]);
                txtScheduleEndDate.Text = dtk.ToString("dd-MM-yyyy");
                ddlscheduleStatus.SelectedItem.Text = dt.Rows[0]["Status"].ToString();
                DateTime dto = Convert.ToDateTime(dt.Rows[0]["Status_date"]);
                txtSubStatusDate.Text = dto.ToString("dd-MM-yyyy");
                txtSubRemarks.Text = dt.Rows[0]["Remarks"].ToString();
            }
        }

        protected void ScheduleRadiolist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ScheduleRadiolist.SelectedValue == "1")
            {
                pnlSubject.Visible = false;
                ddlScheduleSubject.Items.Clear();
                ddlSubjectCategories.Items.Clear();
                ddlScheduleID.Items.Clear();
                ClearScheduleData();
                lblScheduleDuration.Text = "Category Duration";
                lblScheduleRegDate.Text = "Category Reg Date";
                lblScheduleStartDate.Text = "Cat-Schedule Start Date";
                lblScheduleEnddate.Text = "Cat-Schedule End Date";
                lblcatSchid.Text = "Cat-Schedule Id";
            }
            else
            {
                pnlSubject.Visible = true;
                ddlScheduleSubject.Items.Clear();
                ddlSubjectCategories.Items.Clear();
                ddlScheduleID.Items.Clear();
                ClearScheduleData();
                lblScheduleDuration.Text = "Subject Duration";
                lblScheduleRegDate.Text = "Subject Reg Date";
                lblScheduleStartDate.Text = "Sub-Schedule Start Date";
                lblScheduleEnddate.Text = "Sub-Schedule End Date";
                lblcatSchid.Text = "Sub-Schedule Id";
            }
        }

        protected void btnUpdateSchedule_Click(object sender, EventArgs e)
        {
            objSchedulesBE.S_No = Convert.ToInt32(ddlScheduleID.SelectedValue);
            objSchedulesBE.Schedule_srt_Date = txtSchedulestartDate.Text.Trim();
            objSchedulesBE.Schedule_end_Date = txtScheduleEndDate.Text.Trim();
            objSchedulesBE.Status = ddlscheduleStatus.SelectedItem.Text;
            objSchedulesBE.Status_date = txtSubStatusDate.Text.Trim();
            objSchedulesBE.Remarks = txtSubRemarks.Text.Trim();
            SqlDataReader dr = objEPBL.UpdateScheduleData(objSchedulesBE);
            ClearScheduleData();
        }

        protected void btnScheduleDelete_Click(object sender, EventArgs e)
        {
            string sts = "Deleted";
            int schsts = 0;

            //SqlDataReader dr = objEPBL.updateSchedulewhendeleted(ddlScheduleID.SelectedItem.Text.Trim(), sts, schsts);
            //ClearScheduleData();

            if (ScheduleRadiolist.SelectedItem.Value == "1")
            {
                //SqlDataReader dr = objEPBL.DeleteSchedule(ddlScheduleID.SelectedItem.Text.Trim());
                SqlDataReader dr = objEPBL.updateSchedulewhendeleted(ddlScheduleID.SelectedItem.Text.Trim(), sts, schsts);
                ClearScheduleData();
            }
            else if (ScheduleRadiolist.SelectedItem.Value == "2")
            {
                //SqlDataReader dr = objEPBL.DeleteSubjectSchedule(ddlScheduleID.SelectedItem.Text.Trim());
                SqlDataReader dr = objEPBL.updateSubjectSchedulewhendeleted(Convert.ToInt32(ddlScheduleID.SelectedItem.Value), sts, schsts);
                ClearScheduleData();
            }

        }

        protected void btnScheduleCancel_Click(object sender, EventArgs e)
        {
            ClearScheduleData();
        }

        #endregion Shedules

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
            ddlProgramsForUnits.Items.Insert(0, "---Select---");

        }

        protected void ddlProgramsForUnits_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCategoriesForUnits.Items.Clear();
            txtQstnName.Visible = false;
            lblQstnName.Visible = false;

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
            txtQstnName.Visible = false;
            lblQstnName.Visible = false;

            int CategoryId = Convert.ToInt32(ddlCategoriesForUnits.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexctsch.DataSource = dt;
                ddlexctsch.DataValueField = "S_NO";
                ddlexctsch.DataTextField = "Schedule_ID";
                ddlexctsch.DataBind();
                ddlexctsch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }


        }

        protected void ddlexctsch_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                ddlExerciseGroup.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlExerciseGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                ddlExerciseYear.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlExerciseYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CategoryId = Convert.ToInt32(ddlExerciseYear.SelectedItem.Value);
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject_sampleTest.DataSource = dt;
                ddlSubject_sampleTest.DataValueField = "Subject_Id";
                ddlSubject_sampleTest.DataTextField = "SubjectName";
                ddlSubject_sampleTest.DataBind();
                ddlSubject_sampleTest.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlSubject_sampleTest_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlSubject_sampleTest.SelectedItem.Value);
            SqlDataReader dr1 = objBL.getcontsubSchId(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlExesubschid.DataSource = dt1;
                ddlExesubschid.DataValueField = "Subject_Id";
                ddlExesubschid.DataTextField = "Subject_ScheduleID";
                ddlExesubschid.DataBind();
                ddlExesubschid.Items.Insert(0, "--Select--");
            }
        }

        protected void ddlExesubschid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetUnitDetails(Convert.ToInt32(ddlSubject_sampleTest.SelectedValue));
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

        protected void ddltasktype_SelectedIndexChanged(object sender, EventArgs e)
        {

            Panelexe.Visible = true;
            lbleprgname.Text =ddlProgramsForUnits.SelectedValue+":"+ ddlProgramsForUnits.SelectedItem.Text;
            lblecatname.Text = ddlCategoriesForUnits.SelectedValue + ":" + ddlCategoriesForUnits.SelectedItem.Text;
            //lblecatsch.Text = ddlexctsch.SelectedItem.Text;
            lblegrpname.Text = ddlExerciseGroup.SelectedValue + ":" + ddlExerciseGroup.SelectedItem.Text;
            lblesbjname.Text = ddlSubject_sampleTest.SelectedItem.Text;
            lbleunitname.Text = ddlExerciseUnit.SelectedItem.Text;
            if (ddltasktype.SelectedItem.Text.Trim() == "Exercise")
            {
                qtntype.Visible = true;
                stspnl.Visible = true;
            }
            else if (ddltasktype.SelectedItem.Text.Trim() == "Assignment")
            {
                qtntype.Visible = false;
                stspnl.Visible = true;
                lblQstnName.Text = "Title";
                lblenterans.Text = "Solution";
            }
            else if (ddltasktype.SelectedItem.Text.Trim() == "Case-Study")
            {
                qtntype.Visible = false;
                stspnl.Visible = true;
                lblQstnName.Text = "Case-Study";
                lblenterans.Text = "Explanation";
            }
        }


        protected void qstnType_SelectedIndexChanged(object sender, EventArgs e)
        {



        }
        protected void ddlexeStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtQstnName.Visible = false;
            lblQstnName.Visible = false;

            radioPanel.Visible = false;
            FillinBlanksPAnel.Visible = false;
            DescriptivePanel.Visible = false;
            BindsampleGrid();
        }

        protected void gvSampleTestID_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                txtQstnName.Visible = true;
                lblQstnName.Visible = true;

                HiddenField QId = (HiddenField)gvrow.FindControl("hdnf");
                int a = Convert.ToInt32(QId.Value);
                ViewState["SampleQstnID"] = a;
                DataTable dt = (DataTable)ViewState["SampleTestDt"];
                EnumerableRowCollection<DataRow> query_new = from order in dt.AsEnumerable()
                                                             where order.Field<int>("Qstn_ID").Equals(a)
                                                             select order;
                DataTable dtEditRow = query_new.CopyToDataTable<DataRow>();

                if (ddlqstnType.SelectedValue == "1")
                {
                    radioPanel.Visible = true;
                    txtQstnName.Text = dtEditRow.Rows[0]["Question"].ToString();
                    txtA.Text = dtEditRow.Rows[0]["A"].ToString();
                    txtB.Text = dtEditRow.Rows[0]["B"].ToString();
                    txtC.Text = dtEditRow.Rows[0]["C"].ToString();
                    txtD.Text = dtEditRow.Rows[0]["D"].ToString();
                    txtE.Text = dtEditRow.Rows[0]["E"].ToString();
                    ddlAns.SelectedItem.Text = dtEditRow.Rows[0]["Answer"].ToString();
                    btnUpdateSampleQuestion.Visible = true;
                    FillinBlanksPAnel.Visible = false;
                    DescriptivePanel.Visible = false;
                }
                else if (ddlqstnType.SelectedValue == "2")
                {
                    radioPanel.Visible = false;
                    FillinBlanksPAnel.Visible = true;
                    txtQstnName.Text = dtEditRow.Rows[0]["Question"].ToString();
                    txtFillInAnswer.Text = dtEditRow.Rows[0]["Answer"].ToString();
                    DescriptivePanel.Visible = false;
                    btnUpdateSampleQuestion.Visible = true;
                }
                else if (ddlqstnType.SelectedValue == "3")
                {
                    radioPanel.Visible = false;
                    FillinBlanksPAnel.Visible = false;
                    DescriptivePanel.Visible = true;
                    btnUpdateSampleQuestion.Visible = true;
                    txtQstnName.Text = dtEditRow.Rows[0]["Question"].ToString();
                    txtDescriptAnswer.Text = dtEditRow.Rows[0]["Answer"].ToString();
                }


            }
        }

        protected void btnUpdateSampleQuestion_Click(object sender, EventArgs e)
        {
            int Qid = 0;
            if (ddlqstnType.SelectedItem.Value != "0")
            {
                if (ddlqstnType.SelectedItem.Text.Trim() == "Radio")
                {

                    if (Convert.ToString(ViewState["SampleQstnID"]) != "")
                    {
                        objQABE.Qstn_ID = (int)ViewState["SampleQstnID"];
                        Qid = Convert.ToInt32(objQABE.Qstn_ID);
                    }
                    if (ddlexeStatus.SelectedItem.Text == "Delete")
                    {
                        SqlDataReader dr = objEPBL.UpdateDeleteQuestion(Qid);
                        BindsampleGrid();
                    }
                    else
                    {
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
                                    Answer = ddlAns.Items[i].Text;
                                }
                                else
                                {
                                    Answer = Answer + "," + ddlAns.Items[i].Text;
                                }
                            }
                        }
                        objQABE.Answer = Answer;
                        // objQABE.Answer = ddlFinalAns.SelectedItem.Text.Trim();
                        SqlDataReader dr = objEPBL.UpdateQuestion(objQABE);
                        if (dr.RecordsAffected > 0)
                        {
                            lblexmsg.Text = "Updated Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                        }
                        radioPanel.Visible = false;
                        FillinBlanksPAnel.Visible = false;
                        DescriptivePanel.Visible = false;
                        BindsampleGrid();
                        btnUpdateSampleQuestion.Visible = false;
                        txtQstnName.Visible = false;
                        lblQstnName.Visible = false;
                    }
                }
                else if (ddlqstnType.SelectedItem.Text.Trim() == "Fill In Blanks")
                {
                    if (Convert.ToString(ViewState["SampleQstnID"]) != "")
                    {
                        objQABE.Qstn_ID = (int)ViewState["SampleQstnID"];
                        Qid = Convert.ToInt32(objQABE.Qstn_ID);
                    }
                    if (ddlexeStatus.SelectedItem.Text == "Delete")
                    {
                        SqlDataReader dr = objEPBL.UpdateDeleteQuestion(Qid);
                    }
                    else
                    {
                        objQABE.Question = txtQstnName.Text.Trim();
                        objQABE.A = txtA.Text.Trim();
                        objQABE.B = txtB.Text.Trim();
                        objQABE.C = txtC.Text.Trim();
                        objQABE.D = txtD.Text.Trim();
                        objQABE.E = txtE.Text.Trim();
                        string answer = txtFillInAnswer.Text;
                        objQABE.Answer = answer;
                        SqlDataReader dr = objEPBL.UpdateQuestion(objQABE);
                        if (dr.RecordsAffected > 0)
                        {
                            lblexmsg.Text = "Updated Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                        }
                        radioPanel.Visible = false;
                        FillinBlanksPAnel.Visible = false;
                        DescriptivePanel.Visible = false;
                        BindsampleGrid();
                        btnUpdateSampleQuestion.Visible = false;
                        txtQstnName.Visible = false;
                        lblQstnName.Visible = false;
                    }
                }
                else if (ddlqstnType.SelectedItem.Text.Trim() == "Descriptive")
                {
                    if (Convert.ToString(ViewState["SampleQstnID"]) != "")
                    {
                        objQABE.Qstn_ID = (int)ViewState["SampleQstnID"];
                        Convert.ToInt32(objQABE.Qstn_ID);
                    }
                    if (ddlexeStatus.SelectedItem.Text == "Delete")
                    {
                        SqlDataReader dr = objEPBL.UpdateDeleteQuestion(Qid);
                    }
                    else
                    {
                        objQABE.Question = txtQstnName.Text.Trim();
                        objQABE.A = txtA.Text.Trim();
                        objQABE.B = txtB.Text.Trim();
                        objQABE.C = txtC.Text.Trim();
                        objQABE.D = txtD.Text.Trim();
                        objQABE.E = txtE.Text.Trim();
                        string answer = txtDescriptAnswer.Text;
                        objQABE.Answer = answer;
                        SqlDataReader dr = objEPBL.UpdateQuestion(objQABE);
                        if (dr.RecordsAffected > 0)
                        {
                            lblexmsg.Text = "Updated Sucessfully";
                            lblexmsg.ForeColor = Color.Green;
                        }
                        radioPanel.Visible = false;
                        FillinBlanksPAnel.Visible = false;
                        DescriptivePanel.Visible = false;
                        BindsampleGrid();
                        btnUpdateSampleQuestion.Visible = false;
                        txtQstnName.Visible = false;
                        lblQstnName.Visible = false;
                    }
                }
            }
        }

        private void BindsampleGrid()
        {
            string[] CatSchId = ddlexctsch.SelectedItem.Text.Split('(');
            string CatScheduleID = CatSchId[0];

            if (ddltasktype.SelectedItem.Text.Trim() == "Exercise")
            {
                if (ddlexeStatus.SelectedItem.Text == "Delete")
                {
                    SqlDataReader dr = objBL.GetQtnsDelete(ddlqstnType.SelectedItem.ToString(), Convert.ToInt32(ddlSubject_sampleTest.SelectedValue), Convert.ToInt32(ddlExerciseUnit.SelectedValue), CatScheduleID, ddlExesubschid.SelectedItem.Text, ddlexeStatus.SelectedItem.Text);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        pnltb.Visible = true;
                        gvSampleTest.DataSource = dt;
                        gvSampleTest.DataBind();
                        ViewState["SampleTestDt"] = dt;
                    }
                }
                else
                {
                    SqlDataReader dr = objBL.GetQtns(ddlqstnType.SelectedItem.ToString(), Convert.ToInt32(ddlSubject_sampleTest.SelectedValue), Convert.ToInt32(ddlExerciseUnit.SelectedValue), CatScheduleID, ddlExesubschid.SelectedItem.Text, ddlexeStatus.SelectedItem.Text);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        pnltb.Visible = true;
                        gvSampleTest.DataSource = dt;
                        gvSampleTest.DataBind();
                        ViewState["SampleTestDt"] = dt;
                    }

                    else
                    {
                        pnltb.Visible = false;
                        gvSampleTest.DataSource = dt;
                        gvSampleTest.DataBind();
                    }
                }
            }
            else
            {
                SqlDataReader dr = objBL.GetQtnstsk(ddltasktype.SelectedItem.ToString(), Convert.ToInt32(ddlSubject_sampleTest.SelectedValue), Convert.ToInt32(ddlExerciseUnit.SelectedValue), ddlexctsch.SelectedItem.Text);
                DataTable dt = new DataTable();
                dt.Load(dr);
                gvSampleTest.DataSource = dt;
                gvSampleTest.DataBind();
                ViewState["SampleTestDt"] = dt;
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
        protected void gvSampleTestDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgbtn = (ImageButton)sender;
            GridViewRow gvrow = (GridViewRow)imgbtn.NamingContainer;
            if (gvrow != null)
            {
                HiddenField QId = (HiddenField)gvrow.FindControl("hdnf");
                int a = Convert.ToInt32(QId.Value);
                SqlDataReader dr = objEPBL.DeleteQuestion(a);
                radioPanel.Visible = false;
                FillinBlanksPAnel.Visible = false;
                DescriptivePanel.Visible = false;
                BindsampleGrid();
            }
        }

        protected void gvSampleTest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSampleTest.PageIndex = e.NewPageIndex;
            DataTable dt = (DataTable)ViewState["SampleTestDt"];
            gvSampleTest.DataSource = dt;
            gvSampleTest.DataBind();
        }

        protected void gvSampleTest_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Btnsearch_Click(object sender, EventArgs e)
        {
            if (rdbtn.Checked == true)
            {
                string from = txtfrm.Text.Trim();
                string To = txtto.Text.Trim();
                SqlDataReader dr = objBL.GetrangeQtns(from, To, Convert.ToInt32(ddlExerciseUnit.SelectedValue), ddlqstnType.SelectedItem.ToString(), ddlexeStatus.SelectedItem.Text);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    Session["data"] = dt;
                    gvSampleTest.DataSource = dt;
                    gvSampleTest.DataBind();
                    SqlDataReader dr1 = objBL.GetQids(from, To, Convert.ToInt32(ddlExerciseUnit.SelectedValue), ddlqstnType.SelectedItem.ToString(), ddlexeStatus.SelectedItem.Text);
                    DataTable dt1 = new DataTable();
                    dt1.Load(dr1);
                    ViewState["QID"] = dt1;
                }

            }
            else
            {
                lblmsg.Text = "Please select the option";
                lblmsg.ForeColor = Color.Red;
            }
        }

        protected void rdbtn_CheckedChanged(object sender, EventArgs e)
        {

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

        public void Update_Data()
        {
            DataTable dts = new DataTable();
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
                    conn.Close();
                    DataTable dt1 = new DataTable();
                    dt1 = (DataTable)ViewState["QID"];
                    string count = dt1.Rows.Count.ToString(); ;
                    string fileName = ViewState["filename"].ToString();
                    File.Delete(Server.MapPath("~/App_Data/" + fileName));
                    objQABE.dtExcelUpload = dt;
                    string cnt = dt.Rows.Count.ToString();
                    // SqlDataReader dr = objEPBL.InsertExcelSampleTestdata(objQABE);

                    if (count == cnt)
                    {
                        for (int j = 0; j < dt1.Rows.Count; j++)
                        {
                            qstnlist.List.Add(new QstnAnsBE()
                            {
                                QstnId = Convert.ToInt32(dt1.Rows[j]["QstnNAId"])
                            });
                        }
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            objQABE.QstnId = qstnlist.List[i].QstnId;
                            objQABE.Question = dt.Rows[i]["Question"].ToString();
                            objQABE.A = dt.Rows[i]["A"].ToString();
                            objQABE.B = dt.Rows[i]["B"].ToString();
                            objQABE.C = dt.Rows[i]["C"].ToString();
                            objQABE.D = dt.Rows[i]["D"].ToString();
                            objQABE.E = dt.Rows[i]["E"].ToString();
                            objQABE.Answer = dt.Rows[i]["Answer"].ToString();
                            SqlDataReader dr = objEPBL.UpdateSampleTestdata(objQABE);
                            if (dr.RecordsAffected > 0)
                            {
                                lblexmsg.Text = "Updated Sucessfully";
                                lblexmsg.ForeColor = Color.Green;
                                foreach (GridViewRow gvRow in gvSampleTest.Rows)
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
                            else
                            {
                                lblexmsg.Text = "Failed";
                                lblexmsg.ForeColor = Color.Red;
                            }
                            //dts.Load(dr);

                            
                        }
                        gvSampleTest.DataSource = dt2;
                        gvSampleTest.DataBind();
                    }
                    else
                    {
                        lblmsg.Text = "Cant Update! The Sheet data is less or greater than the selected data";
                        lblmsg.ForeColor = Color.Red;
                    }
                }
            }
            catch (Exception)
            {
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            Update_Data();
        }

        #endregion Exercise














    }
}