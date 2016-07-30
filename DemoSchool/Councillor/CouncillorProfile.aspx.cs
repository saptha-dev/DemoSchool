using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL.BL;
using BAL.BE;
namespace PresentationLayer.Councellor
{
    public partial class CouncillorProfile : System.Web.UI.Page
    {
        CounsellorBL cbl = new CounsellorBL();
        RegistrationBE rbe = new RegistrationBE();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string CounsellorId = Session["DetailsID"].ToString();
                string Id = "2MOMI";
                LoadImage(Id);
                LoadCounsellorProfile(Id);
            }
        }

        public void LoadImage(string getImageId)
        {
            SqlDataReader dr = cbl.LoadImage(getImageId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            string getImageName = dt.Rows[0]["CounsellorImage"].ToString();
            string sendPath = Server.MapPath("~/Images/") + getImageName;
            ImagePath.ImageUrl = "~/Images/" + getImageName;
        }


        public void LoadCounsellorProfile(string getId)
        {
            SqlDataReader dr = cbl.GetCounsellorDetails(getId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            Session["CounsellorForRespondent"] = dt;
            lblCounsellorId.InnerText = dt.Rows[0]["CounsellorId"].ToString();
            txtFirstName.Value = dt.Rows[0]["C_FName"].ToString();
            txtLastName.Value = dt.Rows[0]["C_LName"].ToString();
            txtFatherName.Value = dt.Rows[0]["C_FatherName"].ToString();
            txtMotherName.Value = dt.Rows[0]["C_MotherName"].ToString();
            txtDOB.Value = dt.Rows[0]["DOB"].ToString();
            txtPOB.Value = dt.Rows[0]["POB"].ToString();
            txtLandLine.Value = dt.Rows[0]["LandLineNumber"].ToString();
            txtMobile.Value = dt.Rows[0]["MobileNumber"].ToString();
            txtEmail.Value = dt.Rows[0]["EmailId"].ToString();
            txtUnit_FlatNo.Value = dt.Rows[0]["Flat_UnitNo"].ToString();
            txtHouseNo_Plotno.Value = dt.Rows[0]["HNo"].ToString();
            txtBuildingName.Value = dt.Rows[0]["LandMarkName"].ToString();
            txtStreetNo.Value = dt.Rows[0]["StreetNo"].ToString();
            txtStreetName.Value = dt.Rows[0]["StreetName"].ToString();
            txtVillage.Value = dt.Rows[0]["Village_Town_City"].ToString();
            txtSubUrb.Value = dt.Rows[0]["Mandal_Taluk_Suburb"].ToString();
            txtDistrict.Value = dt.Rows[0]["DistrictId"].ToString();
            txtState.Value = dt.Rows[0]["StateId"].ToString();
            txtCountry.Value = dt.Rows[0]["CountryId"].ToString();
            txtPinCode.Value = dt.Rows[0]["Pincode"].ToString();
            txtEducation.Value = dt.Rows[0]["Edu_Qualification"].ToString();
            txtTechnicalSkills.Value = dt.Rows[0]["TechnicalSkills"].ToString();
            txtWorkExp.Value = dt.Rows[0]["WorkExp"].ToString();
            txtEmployerName.Value = dt.Rows[0]["EmployerName"].ToString();
            txtEmployerPhone.Value = dt.Rows[0]["EmployerPhone"].ToString();
            txtEmployerAddress.Value = dt.Rows[0]["EmployerAddress"].ToString();
            txtConsellorLocation.Value = dt.Rows[0]["CounsellorLocation"].ToString();
            txtCousellorRegistrationDate.Value = dt.Rows[0]["DateofRegistration"].ToString();
            txtCounsellorStatus.Value = dt.Rows[0]["Status"].ToString();
            txtCounsellerStatusDate.Value = dt.Rows[0]["StatusDate"].ToString();
            //txtCounsellorRemarks.Value = dt.Rows[0][""].ToString();
           
            txtCounsellorId.Value = dt.Rows[0]["CounsellorId"].ToString();
            //txtCounsellorPWD.Value = dt.Rows[0][""].ToString();
            //txtCousellorAccessCode.Value = dt.Rows[0][""].ToString();
    

        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            rbe.CounsellorId = lblCounsellorId.InnerText;
            string Id=lblCounsellorId.InnerText;
            rbe.FirstName = txtFirstName.Value;
            rbe.LastName = txtLastName.Value;
            rbe.Father_GaurdainName = txtFatherName.Value;
            rbe.MotherMaidenName = txtMotherName.Value;
            rbe.DateOfBirth = Convert.ToDateTime(txtDOB.Value);
            rbe.PlaceOfBirth = txtPOB.Value;
            rbe.Fixed_LandlineNumber = txtLandLine.Value;
            rbe.MobileNumber = txtMobile.Value;
            rbe.EmailID = txtEmail.Value;
            rbe.Flat_UnitNo = txtUnit_FlatNo.Value;
            rbe.HouseNO = txtHouseNo_Plotno.Value;
            rbe.LandMark_Name = txtBuildingName.Value;
            rbe.DistrictID = Convert.ToInt32(txtDistrict.Value);
            rbe.StateID = Convert.ToInt32(txtState.Value);
            rbe.CountryID = Convert.ToInt32(txtCountry.Value);
            rbe.PostalCode = Convert.ToInt32(txtPinCode.Value);
            rbe.Qualification = txtEducation.Value;
            rbe.TechnicalSkills = txtTechnicalSkills.Value;
            rbe.workExperience = Convert.ToInt32(txtWorkExp.Value);
            rbe.Employer_Name = txtEmployerName.Value;
            rbe.Employer_Phone = txtEmployerPhone.Value;
            rbe.Employer_Address = txtEmployerAddress.Value;
            rbe.Location = txtConsellorLocation.Value;
            SqlDataReader dr= cbl.UpdateConsellorProfile(rbe);
            int result = dr.RecordsAffected;
            if (result == 1)
            {
            ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "SuccessPoPup();", true);  
            LoadCounsellorProfile(Id);
            }
            else
            {
             ScriptManager.RegisterStartupScript(this, GetType(), "myFunction", "FailedPoPup();", true); 
            }
            

        }
    }
}