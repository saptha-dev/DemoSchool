using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL.BL;

namespace PresentationLayer.Faculty
{
    public partial class Facutly_org_Class : System.Web.UI.Page
    {
        FacultyBL objFcltyBL = new FacultyBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Fac-Sworna";
                Session["DetailsID"] = 13;
                BindCategory();
            }
        }


        private void BindCategory()
        {
            SqlDataReader dr = objFcltyBL.GetCategoryDDl(Convert.ToInt32(Session["DetailsID"].ToString()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataSource = dt;
                ddlCategory.DataValueField = "Category_Id";
                ddlCategory.DataTextField = "Category_Name";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objFcltyBL.GetSubjectDDlbyCategory(Convert.ToInt32(Session["DetailsID"].ToString()),Convert.ToInt32(ddlCategory.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubject.DataSource = dt;
                ddlSubject.DataValueField = "Subject_Id";
                ddlSubject.DataTextField = "Subject_Name";
                ddlSubject.DataBind();
                ddlSubject.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objFcltyBL.GetScheduleDDLbySubject(Convert.ToInt32(Session["DetailsID"].ToString()), Convert.ToInt32(ddlSubject.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSchedule.DataSource = dt;
                ddlSchedule.DataValueField = "Subject_ScheduleID";
                ddlSchedule.DataTextField = "ScheduleID";
                ddlSchedule.DataBind();
                ddlSchedule.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSchedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objFcltyBL.GetCompanyBySchedule(ddlSchedule.SelectedItem.Text);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlCompany.DataSource = dt;
                ddlCompany.DataValueField = "CompanyId";
                ddlCompany.DataTextField = "CompanyName";
                ddlCompany.DataBind();
                ddlCompany.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}