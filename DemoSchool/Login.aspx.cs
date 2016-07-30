using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class Login : System.Web.UI.Page
    {
        #region Declarations

        LoginBE objLoginBE = new LoginBE();
        LoginBL objLoginBL = new LoginBL();

        #endregion Declarations
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Visible = false;
            }

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            objLoginBE.Username = txtUserName.Value.Trim();
            objLoginBE.Password = txtPassword.Value.Trim();
            SqlDataReader drLogin = objLoginBL.GetLoginDetails(objLoginBE);

            if (drLogin.HasRows)
            {
                DataTable dtLoginDetails = new DataTable();
                dtLoginDetails.Load(drLogin);
                lblMessage.Visible = false;

                Session["UserName"] = dtLoginDetails.Rows[0]["Name"].ToString();
                Session["DetailsID"] = dtLoginDetails.Rows[0]["DetailsID"].ToString();
                string role = dtLoginDetails.Rows[0]["RoleName"].ToString();
               // role = "Company";
                Session["RoleName"] = role;

                Session["UserID"] = dtLoginDetails.Rows[0]["UserID"].ToString();
                if (role == "Student")
                {
                    Response.Redirect("~/Student/StudentHome.aspx");
                }

                else if (role == "Admin" || role == "Management")
                {
                    Response.Redirect("~/Admin/Admin-Home.aspx");
                }
                else if (role == "Counsellor")
                {
                    Response.Redirect("~/Councillor/Councillor_home.aspx");
                }
                else if (role == "Faculty")
                {
                    Response.Redirect("~/Faculty/FacultyHome.aspx");
                }
                else if (role == "Company")
                {
                    Response.Redirect("~/ACMP/ACMPHome.aspx");
                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "* Please enter valid credentials.";
            }
        }
    }
}