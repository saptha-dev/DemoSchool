using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using BAL;
using System.Globalization;
using System.Drawing;
namespace PresentationLayer.ACMP
{
    public partial class RealTest_booking : System.Web.UI.Page
    {
        CmpBL cmpbl = new CmpBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyBranch();

            }
        }

        public void LoadCompanyBranch()
        {
            //SqlDataReader dr = cmpbl.GetBranchByCompany("ACMPSMT001");
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //if (dt.Rows.Count > 0)
            //{
            //    ddlbranch.DataSource = dt;
            //    ddlbranch.DataValueField = "BranchID";
            //    ddlbranch.DataTextField = "BranchName";
            //    ddlbranch.DataBind();
            //    ddlbranch.Items.Insert(0, new ListItem("---Select---", "0"));
            //}
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
            SqlDataReader dr = cmpbl.GetBranchGroupByCategory(Convert.ToInt32(ddlcategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
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
                ddlstudentname.DataTextField = "UserID";
                ddlstudentname.DataBind();
                ddlstudentname.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlstudentname_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = cmpbl.GetStudentBkngDate(Convert.ToInt32(ddlstudentname.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DateTime dat = Convert.ToDateTime(dt.Rows[0]["BookingDate"]);
                lblbkDate.Text = dat.ToString("dd-MM-yyyy");
                lblbookslot.Text = dt.Rows[0]["slotname"].ToString();
                lblbooksession.Text = dt.Rows[0]["BookingSession"].ToString();
                lblBooktime.Text = dt.Rows[0]["bktime"].ToString();
            }
            GetCompanyDetails();
            GetCategoryDetails();
            GetStudentbooking();
        }


        //protected void ddlbkDate_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    SqlDataReader dr = cmpbl.GetStudentBkngSlot(Convert.ToInt32(ddlsubject.SelectedValue), ddlbkDate.SelectedItem.ToString());
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        DDlbookslot.DataSource = dt;
        //        DDlbookslot.DataValueField = "Slot_ID";
        //        DDlbookslot.DataTextField = "Slot_Name";
        //        DDlbookslot.DataBind();
        //        DDlbookslot.Items.Insert(0, new ListItem("--Select--", "0"));
        //    }
        //}

        //protected void DDlbookslot_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    SqlDataReader dr = cmpbl.GetStudentBkngSession(Convert.ToInt32(ddlsubject.SelectedValue), Convert.ToInt32(DDlbookslot.SelectedValue));
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlbooksession.DataSource = dt;
        //        ddlbooksession.DataValueField = "S_No";
        //        ddlbooksession.DataTextField = "BookingSession";
        //        ddlbooksession.DataBind();
        //        ddlbooksession.Items.Insert(0, new ListItem("--Select--", "0"));
        //    }
        //}

        //protected void ddlbooksession_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    SqlDataReader dr = cmpbl.GetStudentBkTime(Convert.ToInt32(DDlbookslot.SelectedValue));
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlBooktime.DataSource = dt;
        //        ddlBooktime.DataValueField = "S_No";
        //        ddlBooktime.DataTextField = "time";
        //        ddlBooktime.DataBind();
        //        ddlBooktime.Items.Insert(0, new ListItem("--Select--", "0"));
        //    }
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            int SId = Convert.ToInt32(ddlstudentname.SelectedValue);
            string txt=txtcal.Text;
            DateTime date = DateTime.ParseExact(txt,"dd-MM-yyyy",CultureInfo.InvariantCulture);
            string Date = date.ToString("yyyy-MM-dd");
            string slot = ddlnewbklot.SelectedItem.ToString();
            string sesssion = ddlnewbksion.SelectedItem.ToString();
            string time = ddlnwbktime.SelectedItem.ToString() + ":" + "00";
            DateTime dt = Convert.ToDateTime(Date + " " + time);
            //DateTime dt1 = DateTime.ParseExact(Date + " " + time, "dd/MM/yy h:mm:ss ", CultureInfo.InvariantCulture);
            SqlDataReader dr = cmpbl.updateStudentbooking(SId, date, slot, dt, sesssion);
            GetStudentbooking();
        }

        private void GetCategoryDetails()
        {
            SqlDataReader dr = cmpbl.GetCategoryDetails(Convert.ToInt32(ddlcategory.SelectedValue.Trim()));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblCatId.Text = dt.Rows[0]["Category_Id"].ToString();
                lblctaname.Text = dt.Rows[0]["Category_Name"].ToString();
                lblcatstatus.Text = dt.Rows[0]["Category_Status"].ToString();
            }
        }

        private void GetCompanyDetails()
        {
            SqlDataReader dr = cmpbl.GetCompanyBranchDetails("ACMPSMT001");
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                lblAcmpLoc.Text = dt.Rows[0]["BranchLocation"].ToString();
                lblAcmpName.Text = dt.Rows[0]["BranchName"].ToString();
                // lblACMPPName.Text = dt.Rows[0]["BranchArea"].ToString();
                lblAcmpStatus.Text = dt.Rows[0]["BranchStatus"].ToString();
            }
        }
        private void GetStudentbooking()
        {
            SqlDataReader dr = cmpbl.Getbookingdt(Convert.ToInt32(ddlstudentname.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                GVbooking.DataSource = dt;
                GVbooking.DataBind();
                ViewState["BookingDetails"] = dt;

            }
        }












    }
}