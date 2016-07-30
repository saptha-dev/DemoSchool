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
    public partial class student_profile : System.Web.UI.Page
    {
        StudentBL objStudentBL = new StudentBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["UserID"] = "Ramesh";
                Session["DetailsID"] = 1;
                BindProfile();
                BindCompanyDetails(); 
            }
        }
        private void BindProfile()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objStudentBL.GetStudentProfile(StudentID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                txtStudentID.Value = dt.Rows[0]["UserID"].ToString();
                txtStudentFName.Value = dt.Rows[0]["FirstName"].ToString();
                txtStudentLName.Value = dt.Rows[0]["LastName"].ToString();
                txtStudentFatherName.Value = dt.Rows[0]["Father_GaurdainName"].ToString();
                txtStudentMName.Value = dt.Rows[0]["MotherMaidenName"].ToString();
                txtStudentDOB.Value = dt.Rows[0]["DateOfBirth"].ToString();
                txtStudentPOB.Value = dt.Rows[0]["PlaceOfBirth"].ToString();
              //  txtStudentPIT.Value = dt.Rows[0][""].ToString();
              //  txtStudentIDNumber.Value = dt.Rows[0][""].ToString();
                txtStudentEducation.Value = dt.Rows[0]["Qualification"].ToString();
                txtStudentTechSkills.Value = dt.Rows[0]["TechnicalSkills"].ToString();
                txtStudentMobile.Value = dt.Rows[0]["MobileNumber"].ToString();
                txtStudentPhone.Value = dt.Rows[0]["Fixed_LandlineNumber"].ToString();
                txtStudentEmail.Value = dt.Rows[0]["EmailID"].ToString();



                txtAddressFlatNO.Value = dt.Rows[0]["Flat_UnitNo"].ToString();
                txtAddressPlotNO.Value = dt.Rows[0]["HouseNO"].ToString();
                txtAddressStreetNo.Value = dt.Rows[0]["StreetNO"].ToString();
                txtAddressStreetName.Value = dt.Rows[0]["StreetName"].ToString();
                txtAddressBLDGLMark.Value = dt.Rows[0]["LandMarkName"].ToString();
                txtAddressVillage.Value = dt.Rows[0]["Village_Town_City"].ToString();
                txtAddressMandal.Value = dt.Rows[0]["SubUrban_Area"].ToString();
                txtAddressDistrict.Value = dt.Rows[0]["DistrictID"].ToString();
                txtAddressState.Value = dt.Rows[0]["StateID"].ToString();
                txtAddressCountry.Value = dt.Rows[0]["CountryID"].ToString();
                txtAddressPinCode.Value = dt.Rows[0]["PostalCode"].ToString();


              
            }

            
        }
        private void BindCompanyDetails()
        {
            int StudentID = Convert.ToInt32(Session["DetailsID"]);
            SqlDataReader dr = objStudentBL.GetStudentCompanyDetails(StudentID);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                // txtCompanyAddress.Value = dt.Rows[0][""].ToString();
                txtCompanyASNDDate.Value = dt.Rows[0]["StatusDate"].ToString();
                txtCompanyASNDStatus.Value = dt.Rows[0]["Status"].ToString();
                txtCompanyEmail.Value = dt.Rows[0]["EmailID"].ToString();
                txtCompanyID.Value = dt.Rows[0]["DetailsID"].ToString();
                txtCompanyName.Value = dt.Rows[0]["CompanyName"].ToString();
                txtCompanyPhone.Value = dt.Rows[0]["MobileNumber"].ToString();
                //  txtCompanyRemarks.Value = dt.Rows[0][""].ToString();

            }
        }

    }
}