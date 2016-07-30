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

    public partial class Admin_PublishTraining : System.Web.UI.Page
    {
        AddProgramsBL objBL = new AddProgramsBL();
        PublishBL objPublishBL = new PublishBL();
        int untcnt, cntunt, unitCnt,ExeuntCnt;
        string unitname;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                //LoadDefalut();
                //ContentPanel.Visible = true;

                //if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                //{
                //    Response.Redirect("../LoginPage.aspx");
                //}
                //else
                //{
                LoadDefalut();
                ExercisePrgm();
                ClassPrgm();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);


                //    ContentPanel.Visible = true;
                // }

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
                ddlPrograms.Items.Insert(0, "---Select---");
            }
        }

        public void ExercisePrgm()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexerciseprgm.DataSource = dt;
                ddlexerciseprgm.DataValueField = "Program_id";
                ddlexerciseprgm.DataTextField = "Program_name";

                ddlexerciseprgm.DataBind();
                ddlexerciseprgm.Items.Insert(0, "---Select---");
            }
        }

        public void ClassPrgm()
        {
            SqlDataReader dr = objBL.GetDataForNewProgramsDrpdwn();
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclassprgm.DataSource = dt;
                ddlclassprgm.DataValueField = "Program_id";
                ddlclassprgm.DataTextField = "Program_name";

                ddlclassprgm.DataBind();
                ddlclassprgm.Items.Insert(0, "---Select---");
            }
        }


        # region "Content"

        protected void ddlPrograms_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;

            int CategoryId = Convert.ToInt32(ddlCategory.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlContentcatsch.DataSource = dt;
                ddlContentcatsch.DataValueField = "S_NO";
                ddlContentcatsch.DataTextField = "Schedule_ID";
                ddlContentcatsch.DataBind();
                ddlContentcatsch.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlContentcatsch_SelectedIndexChanged(object sender, EventArgs e)
        {
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlSemister_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
            ddlSubjects.Items.Clear();
            ddlconsubschid.Items.Clear();

            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(Convert.ToInt32(ddlSemister.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjects.DataSource = dt;
                ddlSubjects.DataValueField = "Subject_Id";
                ddlSubjects.DataTextField = "SubjectName";
                ddlSubjects.DataBind();
                ddlSubjects.Items.Insert(0, new ListItem("---Select---", "0"));
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            //ddlconstatus.SelectedIndex = 0;
            Pnl1.Visible = false;
            GVStudents.Visible = false;

            if (ddlSubjects.SelectedItem.Text != "--Select--")
            {
                int SubjectID = Convert.ToInt32(ddlSubjects.SelectedItem.Value);
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);

        }

        protected void ddlconsubschid_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            //ddlconstatus.SelectedIndex = 0;
            GVStudents.Visible = false;
            Pnl1.Visible = false;
            SqlDataReader dr = objBL.GetUnitBasedOnSubjectDrpdwn(Convert.ToInt32(ddlSubjects.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            untcnt = Convert.ToInt32(dt.Rows.Count.ToString()) + 2;
            ViewState["cntunit"] = untcnt;
            if (dt.Rows.Count > 0)
            {
                ddlConUnit.DataSource = dt;
                ddlConUnit.DataValueField = "Unit_Id";
                ddlConUnit.DataTextField = "Unit_Name";
                ddlConUnit.DataBind();
                ddlConUnit.Items.Insert(0, new ListItem("---Select---", "0"));
                ddlConUnit.Items.Insert(1, new ListItem("Select All", "1"));

                //GdviewforUnits.DataSource = dt;
                //GdviewforUnits.DataBind();
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlConUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            //ddlconstatus.SelectedIndex = 0;
            Pnl1.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlContentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddlconstatus.SelectedIndex = 0;
            GVStudents.Visible = false;
            Pnl1.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideUnitdiv", "hideUnitdiv();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideStudentdiv", "hideStudentdiv();", true);
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            lblNorecords.Visible = false;
            //ddlconstatus.SelectedIndex = 0;
            getContentdata();
            Pnl1.Visible = false;
            //lblmsgforContent.Text = ddlPrograms.SelectedItem.Text + ":" + ddlCategory.SelectedItem.Text + ":" + ddlgroup.SelectedItem.Text + ":" + ddlSemister.SelectedItem.Text + ":" + ddlSubjects.SelectedItem.Text + ":" + ddlConUnit.SelectedItem.Text + ":" + ddlContentType.SelectedItem.Text + ":" + ddlRoles.SelectedItem.Text;
            //lblmsgforContent.ForeColor = System.Drawing.Color.Green;
        }

        //protected void ddlconstatus_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    getContentdata();
        //    lblmsgforContent.Text = ddlPrograms.SelectedItem.Text + ":" + ddlCategory.SelectedItem.Text + ":" + ddlgroup.SelectedItem.Text + ":" + ddlSemister.SelectedItem.Text + ":" + ddlSubjects.SelectedItem.Text + ":" + ddlConUnit.SelectedItem.Text + ":" + ddlContentType.SelectedItem.Text + ":" + ddlRoles.SelectedItem.Text;
        //    lblmsgforContent.ForeColor = System.Drawing.Color.Green;
        //}

        protected void ddlAccesslevel_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lblmsgforContent.Text = ddlPrograms.SelectedItem.Text + ":" + ddlCategory.SelectedItem.Text + ":" + ddlgroup.SelectedItem.Text + ":" + ddlSemister.SelectedItem.Text + ":" + ddlSubjects.SelectedItem.Text + ":" + ddlConUnit.SelectedItem.Text + ":" + ddlContentType.SelectedItem.Text + ":" + ddlRoles.SelectedItem.Text + ":" + ddlAccesslevel.SelectedItem.Text;
            //lblmsgforContent.ForeColor = System.Drawing.Color.Green;
            Pnl1.Visible = true;
            lblconctname.Text = ddlCategory.SelectedItem.Text;
            lblconGroup.Text = ddlgroup.SelectedItem.Text;
            lblconYear.Text = ddlSemister.SelectedItem.Text;
            lblconsubname.Text = ddlSubjects.SelectedItem.Text;
            lblconunname.Text = ddlConUnit.SelectedItem.Text;
            lblconrole.Text = ddlRoles.SelectedItem.Text;
            lblconAcclvl.Text = ddlAccesslevel.SelectedItem.Text;
        }

        private void getContentdata()          ////to display data to grid
        {
            string ststatus = string.Empty;
            string stfacstatus = string.Empty;
            int subjid = Convert.ToInt32(ddlSubjects.SelectedItem.Value);
            int untid = Convert.ToInt32(ddlConUnit.SelectedItem.Value);
            string rol = ddlRoles.SelectedItem.Text;
            if (rdbList.SelectedValue == "1")
            {
                ststatus = "UnPublish";
                stfacstatus = "Publish";
            }
            else
            {
                ststatus = "Publish";
                stfacstatus = "UnPublish";
            }

            GVStudents.DataSource = null;
            if (ddlConUnit.SelectedItem.Text != "---Select---" && ddlConUnit.SelectedItem.Text != "Select All")
            {
                if (rol == "Student")
                {
                    SqlDataReader dr = objPublishBL.getStudentsContentData(ststatus, untid);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        ViewState["contentstudentpub"] = dt;
                        GVStudents.DataSource = dt;
                        GVStudents.DataBind();
                        GVStudents.Visible = true;
                        //GVFaculty.Visible = false;
                        GvForAllUnits.Visible = false;
                    }
                    else
                    {
                        lblNorecords.Visible = true;
                        GVStudents.Visible = false;
                        GvForAllUnits.Visible = false;
                    }
                }
                else
                    if (rol == "Faculty")
                    {
                        SqlDataReader dr = objPublishBL.getFacultyContentData(ststatus, untid);
                        DataTable dt = new DataTable();
                        dt.Load(dr);
                        if (dt.Rows.Count > 0)
                        {
                            ViewState["contentfacultypub"] = dt;
                            GVStudents.DataSource = dt;
                            GVStudents.DataBind();
                            GVStudents.Visible = true;
                            GvForAllUnits.Visible = false;
                        }
                        else
                        {
                            lblNorecords.Visible = true;
                            GVStudents.Visible = false;
                            GvForAllUnits.Visible = false;
                        }
                    }
            }
            else
                if (ddlConUnit.SelectedItem.Text == "Select All")
                {
                    if (rol == "Student")
                    {
                        SqlDataReader dr = objPublishBL.allunitsforstudents(rol, stfacstatus);
                        DataTable dt = new DataTable();
                        //dt.Columns.Add("Status", typeof(string));
                        dt.Load(dr);
                        ViewState["contentstudentpub"] = dt;
                        GvForAllUnits.DataSource = dt;
                        GvForAllUnits.DataBind();
                        GVStudents.Visible = false;
                    }
                    else
                        if (rol == "Faculty")
                        {
                            SqlDataReader dr = objPublishBL.allunitsforfaculty(rol, stfacstatus);
                            DataTable dt = new DataTable();
                            //dt.Columns.Add("Status", typeof(string));
                            dt.Load(dr);
                            ViewState["contentfacultypub"] = dt;
                            GvForAllUnits.DataSource = dt;
                            GvForAllUnits.DataBind();
                            GVStudents.Visible = false;
                        }
                }
        }    


        //if (ddlRoles.SelectedValue == "1")
        //{
        //    GVStudents.DataSource = null;
        //    if (ddlConUnit.SelectedItem.Text != "---Select---" && ddlConUnit.SelectedItem.Text != "Select All")
        //    {
        //        SqlDataReader dr = objPublishBL.getStudentsContentData(ststatus, untid);
        //        DataTable dt = new DataTable();
        //        dt.Load(dr);
        //        if (dt.Rows.Count > 0)
        //        {
        //            GVStudents.DataSource = dt;
        //            GVStudents.DataBind();
        //            GVStudents.Visible = true;
        //            //GVFaculty.Visible = false;
        //            GvForAllUnits.Visible = false;
        //        }
        //        else
        //        {
        //            lblNorecords.Visible = true;
        //            GVStudents.Visible = false;
        //            GVFaculty.Visible = false;
        //            GvForAllUnits.Visible = false;
        //        }
        //    }
        //    else
        //        if (ddlConUnit.SelectedItem.Text == "Select All")
        //        {
        //            SqlDataReader dr = objPublishBL.allunitsforstudents(rol, ststatus);
        //            DataTable dt = new DataTable();
        //            //dt.Columns.Add("Status", typeof(string));
        //            dt.Load(dr);
        //            GvForAllUnits.DataSource = dt;
        //            GvForAllUnits.DataBind();
        //            GVStudents.Visible = false;
        //            GVFaculty.Visible = false;
        //        }
        //        else
        //        {
        //            GVStudents.DataSource = null;
        //            GVStudents.Visible = false;
        //            GVFaculty.Visible = false;
        //            GvForAllUnits.Visible = false;
        //        }
        //}
        //else
        //    if (ddlRoles.SelectedValue == "2")
        //    {
        //        GVStudents.DataSource = null;
        //        if (ddlConUnit.SelectedItem.Text != "---Select---" && ddlConUnit.SelectedItem.Text != "Select All")
        //        {
        //            SqlDataReader dr = objPublishBL.getFacultyContentData(ststatus, untid);
        //            DataTable dt = new DataTable();
        //            dt.Load(dr);
        //            if (dt.Rows.Count > 0)
        //            {
        //                GVFaculty.DataSource = dt;
        //                GVFaculty.DataBind();
        //                GVStudents.Visible = false;
        //                GVFaculty.Visible = true;
        //                GvForAllUnits.Visible = false;
        //            }
        //            else
        //            {
        //                lblNorecords.Visible = true;
        //                GVStudents.Visible = false;
        //                GVFaculty.Visible = false;
        //                GvForAllUnits.Visible = false;
        //            }
        //        }
        //        else
        //            if (ddlConUnit.SelectedItem.Text == "Select All")
        //            {
        //                SqlDataReader dr = objPublishBL.allunitsforfaculty(rol, ststatus);
        //                DataTable dt = new DataTable();
        //                //dt.Columns.Add("Status", typeof(string));
        //                dt.Load(dr);
        //                GvForAllUnits.DataSource = dt;
        //                GvForAllUnits.DataBind();
        //                GVStudents.Visible = false;
        //                GVFaculty.Visible = false;
        //            }
        //            else
        //            {
        //                GVStudents.DataSource = null;
        //                GVStudents.Visible = false;
        //                GVFaculty.Visible = false;
        //                GvForAllUnits.Visible = false;
        //            }
        //    }
        //    else
        //    {
        //        GVStudents.DataSource = null;
        //        lblNorecords.Visible = true;
        //        GVStudents.Visible = false;
        //        GVFaculty.Visible = false;
        //        GvForAllUnits.Visible = false;
        //    }


        protected void BtnPublish_Click(object sender, EventArgs e)
        {
            int unid = 0, stuid = 0;
            string contype = string.Empty;
            string statu = string.Empty;
            string statudate = string.Empty;
            string stname = string.Empty;
            int groupi = Convert.ToInt32(ddlgroup.SelectedItem.Value);
            int yeari = Convert.ToInt32(ddlSubjects.SelectedItem.Value);
            string[] ctscid = ddlContentcatsch.SelectedItem.Text.Split('(');
            string catschid = ctscid[0];
            DataTable dtcount = new DataTable();
            if (ddlContentType.SelectedItem.Text == "Text")
            {
                contype = "Text";
            }
            else
            {
                contype = "Video";
            }
            if (rdbList.SelectedValue == "1")
            {
                statu = "Publish";
            }
            if (rdbList.SelectedValue == "2")
            {
                statu = "UnPublish";
            }
            string stadate = System.DateTime.Now.ToString("dd-MM-yyyy");

            if (ddlConUnit.SelectedItem.Text != "Select All" && ddlConUnit.SelectedItem.Text != "---Select---")
            {
                unid = Convert.ToInt32(ddlConUnit.SelectedItem.Value);

                foreach (GridViewRow rowstudent in GVStudents.Rows)
                {
                    if (rowstudent.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkboxstu = (rowstudent.Cells[0].FindControl("chkchild") as CheckBox);
                        if (chkboxstu.Checked)
                        {
                            stuid = Convert.ToInt32(rowstudent.Cells[1].Text);
                            stname = rowstudent.Cells[2].Text;
                            //SqlDataReader drupdatesta = objPublishBL.updatestudentPublish(statu, stadate, stuid, Convert.ToInt32(ddlSubjects.SelectedValue));
                            //SqlDataReader drupdatefac = objPublishBL.updatefacultypublish(statu, stadate, stuid, Convert.ToInt32(ddlSubjects.SelectedValue));
                            if (ddlRoles.SelectedItem.Text == "Student")
                            {
                                SqlDataReader updStuUnitpub = objPublishBL.updatestudentUnitPublish(statu, stadate, stuid, unid);
                                //GetStudentsAfterPublishContent();
                            }
                            else
                                if (ddlRoles.SelectedItem.Text == "Faculty")
                                {
                                    SqlDataReader updfacUnitpub = objPublishBL.updatefacultyUnitPublish(statu, stadate, stuid, unid);
                                    //GetFacultyAfterPublishContent();
                                }

                        }
                    }
                }

                if (rdbList.SelectedValue == "1")
                {
                    SqlDataReader drcount = objPublishBL.selectcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, "UnPublish", ddlRoles.SelectedItem.Text, groupi, yeari, catschid);
                    dtcount.Load(drcount);
                }
                else
                {
                    SqlDataReader drcount = objPublishBL.selectcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, "Publish", ddlRoles.SelectedItem.Text, groupi, yeari, catschid);
                    dtcount.Load(drcount);
                }
                if (dtcount.Rows.Count > 0)
                {
                    SqlDataReader drupdate = objPublishBL.updatecontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, statu, ddlRoles.SelectedItem.Text, stadate, groupi, yeari, catschid);
                }
                else
                {
                    SqlDataReader drinsert = objPublishBL.insertcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, statu, ddlRoles.SelectedItem.Text, stadate, groupi, yeari, catschid);
                }
            }
            else
                if (ddlConUnit.SelectedItem.Text == "Select All")
                {
                    //ViewState["cntunit"] 
                    cntunt = Convert.ToInt32(ViewState["cntunit"]);
                    for (int i = 0; i < cntunt; i++)
                    {
                        unitname = ddlConUnit.Items[i].Text;
                        if (unitname != "Select All" && unitname != "---Select---")
                        {
                            unid = Convert.ToInt32(ddlConUnit.Items[i].Value);
                            foreach (GridViewRow rowstudent in GvForAllUnits.Rows)
                            {
                                if (rowstudent.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox chkboxstu = (rowstudent.Cells[0].FindControl("chkchild") as CheckBox);
                                    if (chkboxstu.Checked)
                                    {
                                        stuid = Convert.ToInt32(rowstudent.Cells[1].Text);
                                        stname = rowstudent.Cells[2].Text;
                                        ////write antother command
                                        //SqlDataReader drupdatesta = objPublishBL.updatestudentPublish(statu, stadate, stuid, Convert.ToInt32(ddlSubjects.SelectedValue));
                                        if (ddlRoles.SelectedItem.Text == "Student")
                                        {
                                            //SqlDataReader updStuUnitpub = objPublishBL.updatestudentUnitPublish(statu, stadate, stuid, unid);
                                            SqlDataReader updStuUnitpub = objPublishBL.insertstudentUnitPublish(stname, statu, stadate, stuid, unid);
                                            
                                        }
                                        else
                                            if (ddlRoles.SelectedItem.Text == "Faculty")
                                            {
                                                //SqlDataReader updfacUnitpub = objPublishBL.updatefacultyUnitPublish(statu, stadate, stuid, unid); szx az
                                                SqlDataReader updfacUnitpub = objPublishBL.insertfacultyUnitPublish(stname, statu, stadate, stuid, unid);
                                                
                                            }

                                    }
                                }
                            }
                            if (rdbList.SelectedValue == "1")
                            {
                                SqlDataReader drcount = objPublishBL.selectcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, "UnPublish", ddlRoles.SelectedItem.Text, groupi, yeari, catschid);
                                dtcount.Load(drcount);
                            }
                            else
                            {
                                SqlDataReader drcount = objPublishBL.selectcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, "Publish", ddlRoles.SelectedItem.Text, groupi, yeari, catschid);
                                dtcount.Load(drcount);
                            }
                            if (dtcount.Rows.Count > 0)
                            {
                                SqlDataReader drupdate = objPublishBL.updatecontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, statu, ddlRoles.SelectedItem.Text, stadate, groupi, yeari, catschid);
                            }
                            else
                            {
                                SqlDataReader drinsert = objPublishBL.insertcontentpublishlist(stuid, Convert.ToInt32(ddlSubjects.SelectedValue), unid, contype, ddlAccesslevel.SelectedItem.Text, statu, ddlRoles.SelectedItem.Text, stadate, groupi, yeari, catschid);
                            }

                        }
                    }
                }
            
            GVStudents.DataSource = null;
            GVStudents.DataBind();
            GvForAllUnits.DataSource = null;
            GvForAllUnits.DataBind();
            lblNorecords.Visible = false;
            //GVFaculty.DataSource = null;

            getContentdata();

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            contentClear();
        }

        internal void contentClear()
        {
            BtnExePublish.Text = "Publish";
            //GdviewforUnits.DataSource = null;
            GVStudents.DataSource = null;
            GVStudents.DataBind();
            GvForAllUnits.DataSource = null;
            GvForAllUnits.DataBind();
            //GVFaculty.DataSource = null;
            //lblmsgforContent.Text = string.Empty;
            ddlPrograms.SelectedIndex = 0;
            ddlCategory.Items.Clear();
            ddlConUnit.Items.Clear();
            ddlContentcatsch.Items.Clear();
            ddlgroup.Items.Clear();
            ddlSemister.Items.Clear();
            ddlSubjects.Items.Clear();
            ddlContentType.SelectedIndex = 0;
            ddlRoles.SelectedIndex = 0;
            ddlAccesslevel.SelectedIndex = 0;
            ddlconsubschid.Items.Clear();
        }

        # endregion

        #region "Methods"

        protected void rdbList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdbList.SelectedValue == "1")
            {
                BtnExePublish.Text = "Publish";
                btnclassPublish.Text = "Publish";
                BtnPublish.Text = "Publish";
                GVExercise.DataSource = null;
                GVStudents.DataSource = null;
                GVClasses.DataSource = null;
                grdclsunits.DataSource = null;
                GVStudents.DataSource = null;
                GVStudents.DataBind();
                Grddata.DataSource = null;
                GrdExercise.DataSource=null;
                ddlexcatsch.SelectedIndex = -1;
                ddlExeSubschId.SelectedIndex = -1;
                ddlClassSubSchId.SelectedIndex = -1;
                ddlclssch.SelectedIndex = -1;
                //lblmsgforContent.Text = string.Empty;
                ddlContentcatsch.Items.Clear();
                ddlconsubschid.Items.Clear();
                GvForAllUnits.DataSource = null;
                GvForAllUnits.DataBind();
                Pnl1.Visible = false;
            }
            else
            {
                BtnExePublish.Text = "UnPublish";
                btnclassPublish.Text = "UnPublish";
                BtnPublish.Text = "UnPublish";
                GVExercise.DataSource = null;
                GVStudents.DataSource = null;
                GVClasses.DataSource = null;
                grdclsunits.DataSource = null;
                GVStudents.DataSource = null;
                GVStudents.DataBind();
                Grddata.DataSource = null;
                GrdExercise.DataSource = null;
                ddlexcatsch.SelectedIndex = -1;
                ddlExeSubschId.SelectedIndex = -1;
                ddlClassSubSchId.SelectedIndex = -1;
                ddlclssch.SelectedIndex = -1;
                //lblmsgforContent.Text = string.Empty;
                ddlconsubschid.Items.Clear();
                GvForAllUnits.DataSource = null;
                GvForAllUnits.DataBind();
                Pnl1.Visible = false;
            }
            Pnl1.Visible = false;
             ddlPrograms.SelectedItem.Text = "---Select---";
             ddlConUnit.Items.Clear();
             ddlAccesslevel.SelectedIndex = 0;
             ddlRoles.SelectedIndex = 0;
             ddlCategory.Items.Clear();
             ddlgroup.Items.Clear();
             ddlSemister.Items.Clear();
             ddlSubjects.Items.Clear();
             ddlContentType.SelectedIndex = 0;

            lblNorecords.Visible = false;
            GVStudents.Visible = false;
            ddlexercisegrp.SelectedIndex = -1;
            ddlexerciseprgm.SelectedIndex = -1;
            ddlexercisesem.SelectedIndex = -1;
            ddlexercisesub.SelectedIndex = -1;
            ddlexerciseunit.SelectedIndex = -1;
            ddexercisecatgry.SelectedIndex = -1;
            ddlclasscatgry.SelectedIndex = -1;
            ddlclassrole.SelectedIndex = -1;
            ddlclasssem.SelectedIndex = -1;
            ddlclassprgm.SelectedIndex = -1;
            ddlclassgrp.SelectedIndex = -1;
            ddlclassub.SelectedIndex = -1;
           
            lblmsgerr.Text = string.Empty;
            lblnomsg.Text = string.Empty;
            lblNorecords.Text = string.Empty;
            ddlclssch.SelectedIndex = -1;
            ddlClassdrpdown.SelectedIndex = -1;
        }

        private void GetToPublishClass()
        {
            // string Subject = "select SubjectId from tbl_Class where ClassId=" + Convert.ToInt32(ddlClassdrpdown.SelectedValue);
            string SubId = ddlclassub.SelectedValue;
            string sId = SubId + "%";
            SqlDataReader dr = objPublishBL.GetClassDataToStudents(sId, "Publish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                ViewState["DTStudentsClass"] = dt;
                GVClasses.Visible = true;
            }
            else
            {
                lblmsgerr.Visible = true;
                GVClasses.Visible = false;
            }
        }

        private void GetToUnPublishClass()
        {
            string SubId = ddlclassub.SelectedValue;
            string sId = SubId + "%";
            SqlDataReader dr = objPublishBL.GetClassDataToStudents(sId, "UnPublish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                ViewState["DTStudentsClassUnPublish"] = dt;
                GVClasses.Visible = true;
            }
            else
            {
                lblmsgerr.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void GetToPublishContentFaculty()
        {
            SqlDataReader dr = objPublishBL.GetContentDataToFaculty(0, ddlContentType.SelectedItem.Text.Trim(), "Publish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTFacultyContent"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void GetToUnPublishContentFaculty()
        {
            SqlDataReader dr = objPublishBL.GetContentDataToFaculty(0, ddlContentType.SelectedItem.Text.Trim(), "UnPublish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVStudents.DataSource = dt;
                GVStudents.DataBind();
                ViewState["DTFacultyContentUnPublish"] = dt;
                GVStudents.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVStudents.Visible = false;
            }
        }

        private void GetToPublishClassFaculty()
        {
            string Subject = ddlclassub.SelectedValue;
            string Sid = Subject + "%";
            SqlDataReader dr = objPublishBL.GetClassDataToFaculty(Sid, "Publish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                ViewState["DTFacultyClass"] = dt;
                GVClasses.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVClasses.Visible = false;
            }
        }

        private void GetToUnPublishClassFaculty()
        {
            string Subject = ddlclassub.SelectedValue;
            string Sid = Subject + "%";
            SqlDataReader dr = objPublishBL.GetClassDataToFaculty(Sid, "UnPublish");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                ViewState["DTFacultyClassUnPublish"] = dt;
                GVClasses.Visible = true;
            }
            else
            {
                lblNorecords.Visible = true;
                GVClasses.Visible = false;
            }
        }

        private void GetStudentsAfterPublishContent()
        {

            DataTable dtStudents = (DataTable)ViewState["contentstudentpub"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterContentPublish(strIDs);
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

        private void GetStudentsAfterUnPublishContent()
        {

            DataTable dtStudents = (DataTable)ViewState["contentstudentpub"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterContentPublish(strIDs);
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

        private void GetFacultyAfterPublishContent()
        {

            DataTable dtStudents = (DataTable)ViewState["contentfacultypub"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterContentPublish(strIDs);
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

        private void GetFacultyAfterUnPublishContent()
        {

            DataTable dtStudents = (DataTable)ViewState["contentfacultypub"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterContentPublish(strIDs);
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

        private void GetStudentAfterPublishExercise()
        {

            DataTable dtStudents = (DataTable)ViewState["DTStudentsExercise"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterExercisePublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVExercise.DataSource = dt;
                    GVExercise.DataBind();
                    GVExercise.Visible = true;
                }
                else
                {
                    lblnomsg.Visible = true;
                    GVExercise.Visible = false;
                }
            }

        }

        private void GetFacultyAfterPublishExercise()
        {

            DataTable dtStudents = (DataTable)ViewState["FacultyTaskDT"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterExercisePublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVExercise.DataSource = dt;
                    GVExercise.DataBind();
                    GVExercise.Visible = true;
                }
                else
                {
                    lblnomsg.Visible = true;
                    GVExercise.Visible = false;
                }
            }

        }
        private void GetStudentAfterUnPublishExercise()
        {

            DataTable dtStudents = (DataTable)ViewState["DTStudentsExerciseUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterExercisePublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVExercise.DataSource = dt;
                    GVExercise.DataBind();
                    GVExercise.Visible = true;
                }
                else
                {
                    lblmsgerr.Visible = true;
                    GVStudents.Visible = false;
                }
            }

        }

        private void GetFacultyAfterUnPublishExercise()
        {

            DataTable dtStudents = (DataTable)ViewState["FacultyTaskDT"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][0].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterExercisePublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVExercise.DataSource = dt;
                    GVExercise.DataBind();
                    GVExercise.Visible = true;
                }
                else
                {
                    lblmsgerr.Visible = true;
                    GVStudents.Visible = false;
                }
            }

        }
        private void GetStudentAfterPublishClass()
        {

            DataTable dtStudents = (DataTable)ViewState["DTStudentsClass"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterClassPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVClasses.DataSource = dt;
                    GVClasses.DataBind();
                    GVClasses.Visible = true;
                }
                else
                {
                    lblmsgerr.Visible = true;
                    GVClasses.Visible = false;
                }
            }

        }

        private void GetStudentAfterUnPublishClass()
        {

            DataTable dtStudents = (DataTable)ViewState["DTStudentsClassUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][0].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterClassPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVClasses.DataSource = dt;
                    GVClasses.DataBind();
                    GVClasses.Visible = true;
                }
                else
                {
                    lblNorecords.Visible = true;
                    GVClasses.Visible = false;
                }
            }

        }

        private void GetFacultyAfterPublishClass()
        {

            DataTable dtStudents = (DataTable)ViewState["DTFacultyClass"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterClassPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVClasses.DataSource = dt;
                    GVClasses.DataBind();
                    GVClasses.Visible = true;
                }
                else
                {
                    lblmsgerr.Visible = true;
                    GVClasses.Visible = false;
                }
            }

        }

        private void GetFacultyAfterUnPublishClass()
        {

            DataTable dtStudents = (DataTable)ViewState["DTFacultyClassUnPublish"];
            string strIDs = string.Empty;
            for (int i = 0; i < dtStudents.Rows.Count; i++)
            {
                strIDs = strIDs + dtStudents.Rows[i][4].ToString();
                strIDs += (i < dtStudents.Rows.Count - 1) ? "," : string.Empty;
            }
            if (strIDs != "")
            {
                SqlDataReader dr = objPublishBL.GetStudentsAfterClassPublish(strIDs);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GVClasses.DataSource = dt;
                    GVClasses.DataBind();
                    GVClasses.Visible = true;
                }
                else
                {
                    lblmsgerr.Visible = true;
                    GVClasses.Visible = false;
                }
            }

        }

        private void GetCompanyClassesForPublish()
        {
            SqlDataReader dr = objPublishBL.GetCompanysClassForPublish(Convert.ToInt32(ddlClassdrpdown.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                GVClasses.Visible = true;
            }
            else
            {
                lblmsgerr.Visible = true;
                GVClasses.Visible = false;
            }
        }

        private void GetCompanyClassesForUnPublish()
        {
            SqlDataReader dr = objPublishBL.GetCompanysClassForUnPublish(Convert.ToInt32(ddlClassdrpdown.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVClasses.DataSource = dt;
                GVClasses.DataBind();
                GVClasses.Visible = true;
            }
            else
            {
                lblmsgerr.Visible = true;
                GVClasses.Visible = false;
            }
        }

        private void GetPublishExerciseData()
        {
            SqlDataReader dr = objPublishBL.GetStudentToPublishExercise(Convert.ToInt32(ddlexercisesub.SelectedValue), Convert.ToInt32(ddlexerciseunit.SelectedValue), ddltasktype.SelectedItem.Text, Convert.ToInt32(ddlexercisegrp.SelectedValue),ddlstudentrole.SelectedItem.Text);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVExercise.DataSource = dt;
                GVExercise.DataBind();
                ViewState["DTStudentsExercise"] = dt;
                GVExercise.Visible = true;
            }
            else
            {
                lblnomsg.Visible = true;
                GVExercise.Visible = false;
            }

        }

        private void GetUnPublishExerciseData()
        {
            SqlDataReader dr = objPublishBL.GetStudentToUnPublishExercise(Convert.ToInt32(ddlexercisesub.SelectedValue), Convert.ToInt32(ddlexerciseunit.SelectedValue), ddltasktype.SelectedItem.Text, Convert.ToInt32(ddlexercisegrp.SelectedValue), ddlstudentrole.SelectedItem.Text);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVExercise.DataSource = dt;
                GVExercise.DataBind();
                ViewState["DTStudentsExerciseUnPublish"] = dt;
                GVExercise.Visible = true;
            }
            else
            {
                lblnomsg.Visible = true;
                GVExercise.Visible = false;
            }
        }

        #endregion

        # region "Exercise"

        protected void ddlexerciseprgm_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(Convert.ToInt32(ddlexerciseprgm.SelectedValue));

            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddexercisecatgry.DataSource = dt;
                ddexercisecatgry.DataValueField = "Category_Id";
                ddexercisecatgry.DataTextField = "Category_Name";

                ddexercisecatgry.DataBind();
                ddexercisecatgry.Items.Insert(0, "---Select---");
            }
        }

        protected void ddexercisecatgry_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;

            int CategoryId = Convert.ToInt32(ddexercisecatgry.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexcatsch.DataSource = dt;
                ddlexcatsch.DataValueField = "S_NO";
                ddlexcatsch.DataTextField = "Schedule_ID";
                ddlexcatsch.DataBind();
                ddlexcatsch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }

        }

        protected void ddlexcatsch_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddexercisecatgry.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexercisegrp.DataSource = dt;
                ddlexercisegrp.DataValueField = "Branch_Id";
                ddlexercisegrp.DataTextField = "Branch_Name";

                ddlexercisegrp.DataBind();
                ddlexercisegrp.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlexercisegrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlexercisegrp.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexercisesem.DataSource = dt;
                ddlexercisesem.DataValueField = "Year_Id";
                ddlexercisesem.DataTextField = "Branch_Year_No";
                ddlexercisesem.DataBind();
                ddlexercisesem.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlexercisesem_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(Convert.ToInt32(ddlexercisesem.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlexercisesub.DataSource = dt;
                ddlexercisesub.DataValueField = "Subject_Id";
                ddlexercisesub.DataTextField = "SubjectName";
                ddlexercisesub.DataBind();
                ddlexercisesub.Items.Insert(0, "---Select---");
            }
        }

       
        protected void ddlexercisesub_SelectedIndexChanged(object sender, EventArgs e)
        {
            int SubjectID = Convert.ToInt32(ddlexercisesub.SelectedItem.Value);
            //SqlDataReader dr1 = objBL.getcontsubSchId(SubjectID);
            SqlDataReader dr1 = objBL.GetcontScheduleBySubject(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlExeSubschId.DataSource = dt1;
                ddlExeSubschId.DataValueField = "Subject_Id";
                ddlExeSubschId.DataTextField = "Subject_ScheduleID";
                ddlExeSubschId.DataBind();
                ddlExeSubschId.Items.Insert(0, "--Select--");
            }
           
        }

        protected void ExeSubschId_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetUnitBasedOnSubjectDrpdwn(Convert.ToInt32(ddlExeSubschId.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            ExeuntCnt = dt.Rows.Count;
            ViewState["ExUnitCnt"] = ExeuntCnt;
            if (dt.Rows.Count > 0)
            {
                ddlexerciseunit.DataSource = dt;
                ddlexerciseunit.DataValueField = "Unit_Id";
                ddlexerciseunit.DataTextField = "Unit_Name";
                ddlexerciseunit.DataBind();
                ddlexerciseunit.Items.Insert(0, "---Select---");
                ddlexerciseunit.Items.Insert(1, new ListItem("Select All", "1"));
            }
        }
        protected void ddlexerciseunit_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddltasktype_SelectedIndexChanged(object sender, EventArgs e)
        {
            Panelexe.Visible = true;
            lbleprgname.Text = ddlexerciseprgm.SelectedValue + ":" + ddlexerciseprgm.SelectedItem.Text;
            lblecatname.Text = ddexercisecatgry.SelectedValue + ":" + ddexercisecatgry.SelectedItem.Text;
            //lblecatsch.Text = ddlexcatsch.SelectedItem.Text;
            lblegrpname.Text = ddlexercisegrp.SelectedValue + ":" + ddlexercisegrp.SelectedItem.Text;
            lblesbjname.Text = ddlexercisesub.SelectedItem.Text;
            lbleunitname.Text = ddlexerciseunit.SelectedItem.Text;
            if (ddltasktype.SelectedItem.Text == "Exercise")
            {
                ddlstudentrole.Items[2].Attributes["disabled"] = "disabled";
            }
          
        }
        protected void ddlstudentrole_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GVStudents.Visible = false;

            lblNorecords.Visible = false;
            string Iteminfo = "* " + ddlexerciseprgm.SelectedItem.Text + " / " + ddexercisecatgry.SelectedItem.Text + " / " + ddlexercisesub.SelectedItem.Text + " / " + ddlexerciseunit.SelectedItem.Text + " / ";
            if (ddlexerciseunit.SelectedItem.Text == "Select All")
            {
                if(ddlstudentrole.SelectedItem.Text=="Faculty")
                {
                    SqlDataReader dr = objPublishBL.AllunitsforfacultyExercise();
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        GrdExercise.DataSource = dt;
                        ViewState["FacultyTaskDT"] = dt;
                        GrdExercise.DataBind();
                        GVExercise.Visible = false;
                    }
                }
                else if (ddlstudentrole.SelectedItem.Text == "Student")
                {
                SqlDataReader dr = objPublishBL.AllunitsforstudentExercise();
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    GrdExercise.DataSource = dt;
                    GrdExercise.DataBind();
                    GVExercise.Visible = false;
                }
                }
            }
            else
            {
                if (rdbList.SelectedValue == "1")
                {
                    if (ddlstudentrole.SelectedItem.Text == "Student")
                    {
                        GetPublishExerciseData();
                    }
                    else if (ddlstudentrole.SelectedItem.Text == "Faculty")
                    {
                        GetPublishExerciseData();
                    }
                }
                else
                {
                    if (rdbList.SelectedValue == "2")
                    {
                        GetUnPublishExerciseData();
                    }
                    else if (ddlstudentrole.SelectedItem.Text == "Faculty")
                    {
                        GetUnPublishExerciseData();
                    }
                }

            }
        }

        protected void BtnExePublish_Click(object sender, EventArgs e)
        {
            string[] CSchId = ddlexcatsch.SelectedItem.Text.Split('(');
            string SchId = CSchId[0];
            if (ddlexerciseunit.SelectedItem.Text == "Select All")
            {
                int count = Convert.ToInt32(ViewState["ExUnitCnt"]);
                for (int i = 0; i < count; i++)
                {
                    int unitid = Convert.ToInt32(ddlexerciseunit.Items[i + 2].Value);
                    if (rdbList.SelectedValue == "1")
                    {
                        if(ddlstudentrole.SelectedItem.Text=="Faculty")
                        {
                            foreach (GridViewRow row in GrdExercise.Rows)
                            {
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox chkRow = (row.Cells[0].FindControl("chkexchild") as CheckBox);
                                    if (chkRow.Checked)
                                    {
                                        string id = row.Cells[1].Text;
                                        objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), unitid, ddltasktype.SelectedItem.Text, "Publish", SchId);
                                        GetFacultyAfterPublishExercise();
                                    }
                                }
                            }
                        }
                        else if (ddlstudentrole.SelectedItem.Text == "Student")
                        {
                        foreach (GridViewRow row in GrdExercise.Rows)
                        {
                            if (row.RowType == DataControlRowType.DataRow)
                            {
                                CheckBox chkRow = (row.Cells[0].FindControl("chkexchild") as CheckBox);
                                if (chkRow.Checked)
                                {
                                    string id = row.Cells[1].Text;
                                    objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), unitid, ddltasktype.SelectedItem.Text, "Publish", SchId);
                                    GetStudentAfterPublishExercise();
                                }
                            }
                        }
                        }

                    }
                    else if (rdbList.SelectedValue == "2")
                    {
                         if(ddlstudentrole.SelectedItem.Text=="Faculty")
                        {
                            foreach (GridViewRow row in GrdExercise.Rows)
                            {
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    CheckBox chkRow = (row.Cells[0].FindControl("chkexchild") as CheckBox);
                                    if (chkRow.Checked)
                                    {
                                        string id = row.Cells[1].Text;
                                        objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), unitid, ddltasktype.SelectedItem.Text, "Publish", SchId);
                                        GetFacultyAfterUnPublishExercise();
                                    }
                                }
                            }
                        }
                         else if (ddlstudentrole.SelectedItem.Text == "Student")
                         {
                             foreach (GridViewRow row in GrdExercise.Rows)
                             {
                                 if (row.RowType == DataControlRowType.DataRow)
                                 {
                                     CheckBox chkRow = (row.Cells[0].FindControl("chkexchild") as CheckBox);
                                     if (chkRow.Checked)
                                     {
                                         string id = row.Cells[1].Text;
                                         objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), unitid, ddltasktype.SelectedItem.Text, "UnPublish", SchId);
                                         GetStudentAfterUnPublishExercise();

                                     }
                                 }
                             }
                         }
                    }
                }
            }
            else
            {
                if (rdbList.SelectedValue == "1")
                {
                    foreach (GridViewRow row in GVExercise.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkschild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), Convert.ToInt32(ddlexerciseunit.SelectedValue), ddltasktype.SelectedItem.Text, "Publish", SchId);

                            }
                        }
                    }
                    GetStudentAfterPublishExercise();
                }
                else if (rdbList.SelectedValue == "2")
                {
                    BtnExePublish.Text = "UnPublish";
                    foreach (GridViewRow row in GVExercise.Rows)
                    {
                        if (row.RowType == DataControlRowType.DataRow)
                        {
                            CheckBox chkRow = (row.Cells[0].FindControl("chkschild") as CheckBox);
                            if (chkRow.Checked)
                            {
                                string id = row.Cells[1].Text;
                                objPublishBL.UpdateExerciseTestStudentPublishBySet(Convert.ToInt32(id), Convert.ToInt32(ddlexercisesub.SelectedValue), Convert.ToInt32(ddlexerciseunit.SelectedValue), ddltasktype.SelectedItem.Text, "UnPublish", SchId);

                            }
                        }
                    }
                    GetStudentAfterUnPublishExercise();
                }
            }
        }

        protected void Btn_clear_Click(object sender, EventArgs e)
        {
            taskclear();
        }

        internal void taskclear()
        {
            lblnomsg.Text = string.Empty;
            ddlexerciseprgm.SelectedIndex = 0;
            ddexercisecatgry.Items.Clear();
            ddlexcatsch.Items.Clear();
            ddlexercisegrp.Items.Clear();
            ddlexercisesem.Items.Clear();
            ddlexercisesub.Items.Clear();
            ddlexerciseunit.Items.Clear();
            ddltasktype.SelectedIndex = 0;
            GVExercise.DataSource = null;
        }

        # endregion

        #region "Class"

        protected void ddlclassprgm_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(Convert.ToInt32(ddlclassprgm.SelectedValue));

            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclasscatgry.DataSource = dt;
                ddlclasscatgry.DataValueField = "Category_Id";
                ddlclasscatgry.DataTextField = "Category_Name";

                ddlclasscatgry.DataBind();
                ddlclasscatgry.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlclasscatgry_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;

            int CategoryId = Convert.ToInt32(ddlclasscatgry.SelectedItem.Value);
            SqlDataReader dr = objBL.Getcategoryschedule(CategoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclssch.DataSource = dt;
                ddlclssch.DataValueField = "S_NO";
                ddlclssch.DataTextField = "Schedule_ID";
                ddlclssch.DataBind();
                ddlclssch.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---Select---", "--Select--"));
            }
        }

        protected void ddlclssch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlclasscatgry.SelectedValue));

            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclassgrp.DataSource = dt;
                ddlclassgrp.DataValueField = "Branch_Id";
                ddlclassgrp.DataTextField = "Branch_Name";

                ddlclassgrp.DataBind();
                ddlclassgrp.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlclassgrp_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlclassgrp.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclasssem.DataSource = dt;
                ddlclasssem.DataValueField = "Year_Id";
                ddlclasssem.DataTextField = "Branch_Year_No";
                ddlclasssem.DataBind();
                ddlclasssem.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlclasssem_SelectedIndexChanged(object sender, EventArgs e)
        {
            GVStudents.Visible = false;
            SqlDataReader dr = objBL.GetSubjectBasedOnYearDrpdwn(Convert.ToInt32(ddlclasssem.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlclassub.DataSource = dt;
                ddlclassub.DataValueField = "Subject_Id";
                ddlclassub.DataTextField = "SubjectName";
                ddlclassub.DataBind();
                ddlclassub.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlclassub_SelectedIndexChanged(object sender, EventArgs e)
        {

            int SubjectID = Convert.ToInt32(ddlclassub.SelectedItem.Value);
            //SqlDataReader dr1 = objBL.getcontsubSchId(SubjectID);
            SqlDataReader dr1 = objBL.GetcontScheduleBySubject(SubjectID);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            if (dt1.Rows.Count > 0)
            {
                ddlClassSubSchId.DataSource = dt1;
                ddlClassSubSchId.DataValueField = "Subject_Id";
                ddlClassSubSchId.DataTextField = "Subject_ScheduleID";
                ddlClassSubSchId.DataBind();
                ddlClassSubSchId.Items.Insert(0, "--Select--");
            }
           
        }

        protected void ClassSubSchId_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objPublishBL.GetClassesBasedonSubject(Convert.ToInt32(ddlClassSubSchId.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlClassdrpdown.DataSource = dt;
                ddlClassdrpdown.DataValueField = "ClassNo";
                ddlClassdrpdown.DataTextField = "ClassNo";
                ddlClassdrpdown.DataBind();
                ddlClassdrpdown.Items.Insert(0, "---Select---");
            }
        }

        protected void ddlClassdrpdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlRoles.SelectedIndex = -1;
            GVStudents.Visible = false;
            string Iteminfo = "* " + ddlclassprgm.SelectedItem.Text + " / " + ddlclasscatgry.SelectedItem.Text + " / " + ddlclassub.SelectedItem.Text + " / " + ddlClassdrpdown.SelectedItem.Text;
           
            SqlDataReader dr1 = objPublishBL.getunitsbasedonclass(ddlClassdrpdown.SelectedItem.Text);
            DataTable dt1 = new DataTable();
            dt1.Load(dr1);
            unitCnt = Convert.ToInt32(dt1.Rows.Count);
            ViewState["UnitCount"] = unitCnt;
            if (dt1.Rows.Count > 0)
            {
                ddlclassunit.DataSource = dt1;
                ddlclassunit.DataValueField = "UnitID";
                ddlclassunit.DataTextField = "unitname";
                ddlclassunit.DataBind();
                ddlclassunit.Items.Insert(0, "---Select---");
                ddlclassunit.Items.Insert(1, new ListItem("Select All", "1"));
            }
           
        }
        protected void ddlclassunit_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlClassInfo.Visible = true;
            if (ddlclassunit.SelectedItem.Text == "Select All")
            {
                SqlDataReader dr = objPublishBL.GetclassInfo(ddlClassdrpdown.SelectedItem.Text);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    grdclsunits.DataSource = dt;
                    grdclsunits.DataBind();
                }
                else
                {

                }
            }
            else
            {
                SqlDataReader dr = objPublishBL.GetIndiviualclassunit(ddlClassdrpdown.SelectedItem.Text,Convert.ToInt32(ddlclassunit.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if(dt.Rows.Count>0)
                {
                    grdclsunits.DataSource = dt;
                    grdclsunits.DataBind();
                }
            }
            Panelcls.Visible = true;
            lblprgname.Text = ddlclassprgm.SelectedValue + ":" + ddlclassprgm.SelectedItem.Text;
            lblcatname.Text = ddlclasscatgry.SelectedValue + ":" + ddlclasscatgry.SelectedItem.Text;
            //lblcatsch.Text = ddlclssch.SelectedItem.Text;
            lblgrpname.Text = ddlclassgrp.SelectedValue + ":" + ddlclassgrp.SelectedItem.Text;
            lblsbjname.Text = ddlclassub.SelectedItem.Text;
            lblunitname.Text = ddlclassunit.SelectedItem.Text;
        }
        protected void ddlclassrole_SelectedIndexChanged(object sender, EventArgs e)
        {
            //lbldt.Text = ddlclassprgm.SelectedItem.Text + ":" + ddlclasscatgry.SelectedItem.Text + ":" + ddlclassgrp.SelectedItem.Text + ":" + ddlclasssem.SelectedItem.Text + ":" + ddlclassub.SelectedItem.Text;
            string status = string.Empty;
            string Sts = string.Empty;
            string Role = ddlclassrole.SelectedItem.Text;
            int unitid = Convert.ToInt32(ddlclassunit.SelectedValue);
            if (rdbList.SelectedValue == "1")
            {
                Sts = "UnPublish";
                status = "Publish";
            }
            else if (rdbList.SelectedValue == "2")
            {
                Sts = "Publish";
                status = "UnPublish";
            }
            if (ddlclassunit.SelectedItem.Text != "--Select--" && ddlclassunit.SelectedItem.Text != "Select All")
            {
                if (Role == "Student")
                {
                    SqlDataReader dr = objPublishBL.GetStudentsClassData(Role, Sts, unitid);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        ViewState["DTStudentsClass"] = dt;
                        GVClasses.DataSource = dt;
                        GVClasses.DataBind();
                        Grddata.Visible = false;
                    }
                }
                else if (Role == "Faculty")
                {
                    SqlDataReader dr = objPublishBL.GetStudentsClassData(Role, Sts, unitid);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        ViewState["DTStudentsClass"] = dt;
                        GVClasses.DataSource = dt;
                        GVClasses.DataBind();
                        Grddata.Visible = false;
                    }
                }
            }
            else if (ddlclassunit.SelectedItem.Text == "Select All")
            {
                if (Role == "Student")
                {
                    SqlDataReader dr = objPublishBL.Allunitsforstudentsclass(Role);
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        Grddata.DataSource = dt;
                        Grddata.DataBind();
                        GVClasses.Visible = false;
                    }
                }
                else if (Role == "Faculty")
                {
                    SqlDataReader dr = objPublishBL.AllunitsforfacultyClass(Role); ;
                    DataTable dt = new DataTable();
                    dt.Load(dr);
                    if (dt.Rows.Count > 0)
                    {
                        Grddata.DataSource = dt;
                        Grddata.DataBind();
                        GVClasses.Visible = false;
                    }
                }
            }

        }

        protected void btnclassPublish_Click(object sender, EventArgs e)
        {
            int unitid = 0;
            string statu = string.Empty;
            string sdate = string.Empty;
            string Classid = string.Empty;
            string[] clscid = ddlclssch.SelectedItem.Text.Split('(');
            string catclsschid = clscid[0];
            string unitname = string.Empty;
            if (rdbList.SelectedValue == "1")
            {
                statu = "Publish";
            }
            if (rdbList.SelectedValue == "2")
            {
                statu = "UnPublish";
                btnclassPublish.Text = "UnPublish";
            }
             sdate = System.DateTime.Now.ToString("dd-MM-yyyy");
            Classid = ddlClassdrpdown.SelectedItem.Text;
            if (ddlclassunit.SelectedItem.Text != "--Select--" && ddlclassunit.SelectedItem.Text != "Select All")
            {
               
                unitid = Convert.ToInt32(ddlclassunit.SelectedValue);
               
                foreach (GridViewRow row in GVClasses.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox chkRow = (row.Cells[0].FindControl("chklchild") as CheckBox);
                        if (chkRow.Checked)
                        {
                            string id = row.Cells[1].Text;

                            if (ddlclassrole.SelectedItem.Text == "Student")
                            {
                                SqlDataReader dr = objPublishBL.updatestudentClassPublish(statu, sdate,Convert.ToInt32(id),unitid, Classid);
                                GetStudentAfterPublishClass();
                            }

                            else if (ddlclassrole.SelectedItem.Text == "Faculty")
                                {
                                    SqlDataReader dr = objPublishBL.updatestudentClassPublish(statu, sdate, Convert.ToInt32(id), unitid, Classid);
                                    GetStudentAfterPublishClass();
                                }
                        }
                    }
                }
                GetStudentAfterPublishClass();

            }
            else if (ddlclassunit.SelectedItem.Text == "Select All")
            {
                unitCnt = Convert.ToInt32(ViewState["UnitCount"]);
                for (int i = 0; i < unitCnt; i++)
                {
                    unitname = ddlclassunit.Items[i+2].Text;
                    if (unitname != "Select All" && unitname != "---Select---")
                    {
                        foreach (GridViewRow grdrow in Grddata.Rows)
                        {
                            if (grdrow.RowType == DataControlRowType.DataRow)
                            {
                                unitid = Convert.ToInt32(ddlclassunit.Items[i+2].Value);
                                CheckBox chk = (grdrow.Cells[0].FindControl("chkgrchild") as CheckBox);
                                if (chk.Checked)
                                {
                                    string id = grdrow.Cells[1].Text;
                                    if (ddlclassrole.SelectedItem.Text == "Student")
                                    {
                                        SqlDataReader dr = objPublishBL.InsertStudentClassdetailsPublish(Convert.ToInt32(id), Classid, statu,sdate,catclsschid, unitid);
                                    }

                                    else if (ddlclassrole.SelectedItem.Text == "Faculty")
                                    {
                                        SqlDataReader dr = objPublishBL.InsertStudentClassdetailsPublish(Convert.ToInt32(id), Classid, statu, sdate, catclsschid, unitid);
                                        GetFacultyAfterPublishClass();
                                    }
                                }
                            }
                        }
                    }
                }

            }
         
        }

        protected void BtnclearClasses_Click(object sender, EventArgs e)
        {
            clasesClear();
        }

        internal void clasesClear()
        {
            lblmsgerr.Text = string.Empty;
            //lbldt.Text = string.Empty;
            ddlclassprgm.SelectedIndex = 0;
            ddlclasscatgry.Items.Clear();
            ddlclssch.Items.Clear();
            ddlclassgrp.Items.Clear();
            ddlclasssem.Items.Clear();
            ddlclassub.Items.Clear();
            ddlClassdrpdown.Items.Clear();
            //ddlexerciseunit.Items.Clear();
            ddlclassrole.SelectedIndex = 0;
            GVClasses.DataSource = null;
            grdclsunits.DataSource = null;
            pnlClassInfo.Visible = false;
        }

        # endregion

       

       

     
     

        

    }
}



