using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;


namespace PresentationLayer.Student
{
    public partial class content : System.Web.UI.Page
    {
        StudentContent stc = new StudentContent();
        StudentBL objStudentBL = new StudentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            getstring.Value = "Alzebra.mp4";
            string request = Request.QueryString["BrowsedFilePath"];
            if (!IsPostBack)
            {
                GetCategoryNameForStudent();
            }
           
        } 

        private void GetCategoryNameForStudent()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objStudentBL.GetCategoryNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 1)
            {
                ddlCategory.Visible = true;
                txtddlCategory.Visible = false;

                ddlCategory.DataSource = dt;
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));

            }
            else if (dt.Rows.Count == 1)
            {
                ddlCategory.Visible = false;
                txtddlCategory.Visible = true;
                txtddlCategory.Value = dt.Rows[0][1].ToString();
                GetGroupNameForStudent();
                CategoryDetails(Convert.ToInt32(dt.Rows[0][0]));
            }
            else
            {
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        private void GetGroupNameForStudent()
        {
            SqlDataReader dr = objStudentBL.GetGroupNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 1)
            {
                ddlGroup.Visible = true;
                txtddlGroup.Visible = false;

                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("--Select--", "0"));

            }
            else if (dt.Rows.Count == 1)
            {
                ddlGroup.Visible = false;
                txtddlGroup.Visible = true;
                txtddlGroup.Value = dt.Rows[0][1].ToString();
                BindSubjectsNameForStudent();
            }
            else
            {
                ddlGroup.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        private void BindSubjectsNameForStudent()
        {
        //    int StudentID = Convert.ToInt32(Session["DetailsID"]);
        //    SqlDataReader dr = objStudentBL.GetSubjectsForStudent(StudentID);
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlSubjects.DataSource = dt;
        //        ddlSubjects.DataValueField = "Subject_Id";
        //        ddlSubjects.DataTextField = "Subject_Name";
        //        ddlSubjects.DataBind();
        //        ddlSubjects.Items.Insert(0, new ListItem("--Select--", "0"));

        //    }
        //    else
        //    {
        //        ddlSubjects.Items.Insert(0, new ListItem("--Select--", "0"));
        //    }

        }

        private void CategoryDetails(int CategoryID)
        {

            SqlDataReader dr = objStudentBL.GetStudentCategoryDetails(CategoryID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtCategoryName.Value = dt.Rows[0]["Category_Id"].ToString() + ":" + dt.Rows[0]["Category_Name"].ToString();
                txtCategoryStartDate.Value = dt.Rows[0]["Category_Srt_Date"].ToString();
                txtCategoryEndDate.Value = dt.Rows[0]["Category_End_Date"].ToString();
                txtCategoryDuration.Value = dt.Rows[0]["Category_Duration"].ToString();
                txtCategoryStatus.Value = dt.Rows[0]["Category_Status"].ToString();
                txtCategoryStatusDate.Value = dt.Rows[0]["Category_Status_Date"].ToString();

            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {

            
        }

        protected void ddlContentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string str = ddlContentType.SelectedItem.Text;
            if (str != "--Select--")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Anyname1", "showAccordion();", true);
                int SubjectID = Convert.ToInt32(ddlSubjects.SelectedValue);
                SqlDataReader drSubject = objStudentBL.GetStudentSubjectDetails(SubjectID);
                DataTable dtSubject = new DataTable();
                dtSubject.Load(drSubject);
                if (dtSubject.Rows.Count > 0)
                {
                    txtSubjectName.Value = dtSubject.Rows[0]["Subject_Id"].ToString() + ":" + dtSubject.Rows[0]["Subject_Name"].ToString();
                    txtSubjectContentType.Value = ddlContentType.SelectedItem.Text;
                    txtSubjectStartDate.Value = dtSubject.Rows[0]["Subject_Start_Date"].ToString();
                    txtSubjectEndDate.Value = dtSubject.Rows[0]["Subject_End_Date"].ToString();
                    txtSubjectDuration.Value = dtSubject.Rows[0]["Subject_Duration"].ToString();
                    txtSubjectStatus.Value = dtSubject.Rows[0]["Subject_Status"].ToString();
                    txtSubjectStatusDate.Value = dtSubject.Rows[0]["Subject_Status_Date"].ToString();
                }

                LoadContentGrid(SubjectID, ddlContentType.SelectedItem.Text, 6);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Anyname", "hideAccordion();", true);
            }

        }


        public void LoadContentGrid(int subjectID, string contentType, int studentId)
        {
            
            SqlDataReader dr = stc.getStudentUnits(subjectID, contentType, studentId);
            if (contentType == "Text")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideVideoDiv", "hideVideoDiv();", true);
                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("BrowsedFilePath");

                dt.Load(dr);

                foreach (DataRow dr1 in dt.Rows)
                {
                    DataRow drow = dt2.NewRow();
                    string str = dr1["BrowsedFilePath"].ToString();
                    string newstr = str.Substring(str.IndexOf('\\') + 1);
                    drow["BrowsedFilePath"] = newstr;
                    dt2.Rows.Add(drow);

                }

                GvstudentUnitInfo.DataSource = dt2;
                GvstudentUnitInfo.DataBind();
                GvstudentUnitInfo.UseAccessibleHeader = true;
                GvstudentUnitInfo.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                GvstudentUnitInfo.HeaderStyle.VerticalAlign = VerticalAlign.Bottom;
                GvstudentUnitInfo.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            else if(contentType == "Video")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideTextDiv", "hideTextDiv();", true);
                this.GvstudentUnitInfo.DataSource = null;
                DataTable dt = new DataTable();
                DataTable dt2 = new DataTable();
                dt2.Columns.Add("BrowsedFilePath");

                dt.Load(dr);

                foreach (DataRow dr1 in dt.Rows)
                {
                    DataRow drow = dt2.NewRow();
                    string str = dr1["BrowsedFilePath"].ToString();
                    string newstr = str.Substring(str.IndexOf('\\') + 1);
                    drow["BrowsedFilePath"] = newstr;
                    dt2.Rows.Add(drow);

                }
                GvVideoContent.DataSource = dt2;
                GvVideoContent.DataBind();
                GvVideoContent.UseAccessibleHeader = true;
                GvVideoContent.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                GvVideoContent.HeaderStyle.VerticalAlign = VerticalAlign.Bottom;
                GvVideoContent.HeaderRow.TableSection = TableRowSection.TableHeader;
                
            }
            else 
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hidesDivs", "hidesDivs();", true);
            }
        }

        protected void PartialPostBack(object sender, EventArgs e)
        {
            LinkButton myButton = sender as LinkButton;
            string lbtnText = myButton.Text;
            if (ddlContentType.SelectedItem.Text == "Video")
            {
               
               getstring.Value = lbtnText;
               ScriptManager.RegisterStartupScript(this, this.GetType(), "callPath", "callPath('"+lbtnText+"');", true); 
               this.updateVideo.Update();
              
                
            }
            else if (ddlContentType.SelectedItem.Text == "Text")
            {
                getstring.Value = lbtnText;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "callPathText", "callPathText('" + lbtnText + "');", true);
                this.updatepanelText.Update();
              
            }
            else
            {

            }

        }

        

    }
}