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
    public partial class FacultyProfile : System.Web.UI.Page
    {

        FacultyBL objFcltyBL = new FacultyBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 13;
                BindProfile();
            }
        }


        private void BindProfile()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objFcltyBL.GetFacultyProfile(StudentID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
               // txtCmpnyWorking.Text = dt.Rows[0]["PostalCode"].ToString();
                txtDOB.Text = dt.Rows[0]["DateOfBirth"].ToString();
                txtEduQlfication.Text = dt.Rows[0]["Qualification"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                txtFirtsname.Text = dt.Rows[0]["FirstName"].ToString();
                txtFName.Text = dt.Rows[0]["Father_GaurdainName"].ToString();
                txtLName.Text = dt.Rows[0]["LastName"].ToString();
                txtMName.Text = dt.Rows[0]["MotherMaidenName"].ToString();
                txtMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtPhoneNo.Text = dt.Rows[0]["Fixed_LandlineNumber"].ToString();
                txtPlaceofwork.Text = dt.Rows[0]["PostalCode"].ToString();
                txtPOB.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
              //  txtprogram.Text = dt.Rows[0]["PostalCode"].ToString();
                txtTechSkills.Text = dt.Rows[0]["TechnicalSkills"].ToString();
                txtTotWorkExp.Text = dt.Rows[0]["Employer_WorkExp"].ToString();


                txtFlatNo.Text = dt.Rows[0]["Flat_UnitNo"].ToString();
                txtHno.Text = dt.Rows[0]["HouseNO"].ToString();
                txtStreetName.Text = dt.Rows[0]["StreetName"].ToString();
                txtVillage.Text = dt.Rows[0]["Village_Town_City"].ToString();
                txtMandal.Text = dt.Rows[0]["SubUrban_Area"].ToString();
                txtDistrict.Text = dt.Rows[0]["DistrictID"].ToString();
                txtState.Text = dt.Rows[0]["StateID"].ToString();
                txtCountry.Text = dt.Rows[0]["CountryID"].ToString();
                txtPin.Text = dt.Rows[0]["PostalCode"].ToString();
                
            }


        }

    }
}