using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net.Mail;
using System.Net;
using System.Configuration;

using System.Data;
using System.Data.SqlClient;

using BAL.BE;
using BAL.BL;

namespace PresentationLayer.Admin
{
    public partial class Admin_Home : System.Web.UI.Page
    {
        #region Declarations
        LoginBL objBl = new LoginBL();
        DataTable dt = new DataTable();
        RegistrationBE objRegistrationEntity = new RegistrationBE();
        RegistrationBL objRegistrationBL = new RegistrationBL();
        string fileName = string.Empty;
        #endregion Declarations

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {//sample comment
                var id = Request.QueryString["id"];
                if (id == "Admin")
                {
                    AdminViewProfileData();
                }
                else 
                {

                    if (string.IsNullOrEmpty(Session["DetailsID"] as string))
                    {
                        Response.Redirect("../LoginPage.aspx");
                    }
                    else
                    {

                        int detailsId = int.Parse(Session["DetailsID"].ToString());//int detailsId = 3; 
                        LoadAdminData(detailsId);
                    }
                }
            }
        }

        private void AdminViewProfileData()
        {
            dt = (DataTable)Session["dt"];
            txtEditFirstName.Text = dt.Rows[0]["FirstName"].ToString();
            txtEditLastName.Text = dt.Rows[0]["LastName"].ToString();
            txtEditFatherName.Text = dt.Rows[0]["Father_GaurdainName"].ToString();
            txtEditmotherName.Text = dt.Rows[0]["MotherMaidenName"].ToString();
            txtEditDOB.Text = dt.Rows[0]["DateOfBirth"].ToString().Substring(0,10);
           // txtEditEducation.Text = dt.Rows[0]["Qualification"].ToString();
           // txtEditTechnical.Text = dt.Rows[0]["TechnicalSkills"].ToString();
            txtEditPOB.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
            txtEditMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
            txtEditFixedLandline.Text = dt.Rows[0]["Fixed_LandlineNumber"].ToString();
            txtEditEmail.Text = dt.Rows[0]["EmailID"].ToString();
            txtEditaltrEmail.Text = dt.Rows[0]["OptionalEmailID"].ToString();
            txtEditFlatno.Text = dt.Rows[0]["Flat_UnitNo"].ToString();
            txtEditstreetno.Text = dt.Rows[0]["StreetNO"].ToString();
            txtEditstreetname.Text = dt.Rows[0]["StreetName"].ToString();
            txtEditcity.Text = dt.Rows[0]["Village_Town_City"].ToString();

            //txtFlatno.Text = dt.Rows[0]["Flat_UnitNo"].ToString();
            //txtstreetno.Text = dt.Rows[0]["StreetNO"].ToString();
            //txtstreetname.Text = dt.Rows[0]["StreetName"].ToString();
            //txtcity.Text = dt.Rows[0]["Village_Town_City"].ToString();
            impPrev.ImageUrl = "../Images/" + dt.Rows[0]["ImageName"].ToString(); 
            txtEditDirAccessCode.Text = dt.Rows[0]["AccessCode"].ToString();
            txtEditpincode.Text = dt.Rows[0]["PostalCode"].ToString();
            txtEdithouseno.Text = dt.Rows[0]["StreetNO"].ToString();

        }

        public void LoadAdminData(int detailsId)
        {
            objRegistrationEntity.DetailsID = detailsId;
            objRegistrationEntity.RoleName = "Admin";
            dt.Clear();
            SqlDataReader dr = objRegistrationBL.GetRegistraionDetails(objRegistrationEntity);

            dt.Load(dr);
            ViewState["EditDT"] = dt;
            if (dt.Rows.Count > 0)
            {
                txtEditFirstName.Text = dt.Rows[0]["FirstName"].ToString();
                txtEditLastName.Text = dt.Rows[0]["LastName"].ToString();
                txtEditFatherName.Text = dt.Rows[0]["Father_GaurdainName"].ToString();
                txtEditmotherName.Text = dt.Rows[0]["MotherMaidenName"].ToString();
                txtEditDOB.Text = dt.Rows[0]["DateOfBirth"].ToString().Substring(0,10);

                txtEditPOB.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
                txtEditMobile.Text = dt.Rows[0]["MobileNumber"].ToString();
                txtEditFixedLandline.Text = dt.Rows[0]["Fixed_LandlineNumber"].ToString();
                txtEditEmail.Text = dt.Rows[0]["EmailID"].ToString();
                txtEditaltrEmail.Text = dt.Rows[0]["OptionalEmailID"].ToString();

                txtEditDirAccessCode.Text = dt.Rows[0]["AccessCode"].ToString();
                txtEditpincode.Text = dt.Rows[0]["PostalCode"].ToString();
                txtEdithouseno.Text = dt.Rows[0]["HouseNO"].ToString();
                txtEditstreetno.Text = dt.Rows[0]["StreetNO"].ToString();
                txtEditstreetname.Text = dt.Rows[0]["StreetName"].ToString();
                impPrev.ImageUrl = "../Images/" + dt.Rows[0]["ImageName"].ToString(); 
                txtEditFlatno.Text = dt.Rows[0]["Flat_UnitNo"].ToString();
                txtEditarea.Text = dt.Rows[0]["SubUrban_Area"].ToString();
                txtEditcity.Text = dt.Rows[0]["Village_Town_City"].ToString();
            }
        }

        private void LoadEditData()
        {
            var id = Request.QueryString["id"];
            if (id == "Admin" && Session["dt"] != null)
            {
                dt = (DataTable)Session["dt"];
            }
            else
            {
                dt = (DataTable)ViewState["EditDT"];
            }

            txtEditFirstName.Text = dt.Rows[0]["FirstName"].ToString();
            txtEditLastName.Text = dt.Rows[0]["LastName"].ToString();
            txtEditFatherName.Text = dt.Rows[0]["Father_GaurdainName"].ToString();
            txtEditmotherName.Text = dt.Rows[0]["MotherMaidenName"].ToString();
            txtdob.Text = dt.Rows[0]["DateOfBirth"].ToString().Substring(0,10);

            txtpob.Text = dt.Rows[0]["PlaceOfBirth"].ToString();
            txtmobile.Text = dt.Rows[0]["MobileNumber"].ToString();
            txtFixedLandline.Text = dt.Rows[0]["Fixed_LandlineNumber"].ToString();
            txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
            txtaltrEmail.Text = dt.Rows[0]["OptionalEmailID"].ToString();
            txtpincode.Text = dt.Rows[0]["PostalCode"].ToString();
            txthouseno.Text = dt.Rows[0]["HouseNo"].ToString();
            txtstreetno.Text = dt.Rows[0]["StreetNO"].ToString();
            txtstreetname.Text = dt.Rows[0]["StreetName"].ToString();
        }

        private void TextboxVisibleTrue()
        {
            txtFlatno.Visible = true;
            txtstreetno.Visible = true;
            txtstreetname.Visible = true;
            txtcity.Visible = true;
            txtdob.Visible = true;
            txtarea.Visible = true;
           // txtEducation.Visible = true;
            txtEmail.Visible = true;
            txtFixedLandline.Visible = true;
            txthouseno.Visible = true;
            txtpob.Visible = true;
            txtaltrEmail.Visible = true;
          //  txtTechnicalSkills.Visible = true;
            txtmobile.Visible = true;
            txtpincode.Visible = true;
            photoPanel.Visible = true;
            FileUploadImage.Visible = true;

        }

        private void TextboxVisibleFalse()
        {
            txtFlatno.Visible = false;
            txtstreetno.Visible = false;
            txtstreetname.Visible = false;
            txtcity.Visible = false;
            txtdob.Visible = false;
            txtarea.Visible = false;
            // txtEducation.Visible = true;
            txtEmail.Visible = false;
            txtFixedLandline.Visible = false;
            txthouseno.Visible = false;
            txtpob.Visible = false;
            txtaltrEmail.Visible = false;
            //  txtTechnicalSkills.Visible = true;
            txtmobile.Visible = false;
            txtpincode.Visible = false;
            photoPanel.Visible = false;
            FileUploadImage.Visible = false;
        }

        private void LabelFalse()
        {
            txtEditaltrEmail.Visible = false;
            txtEditarea.Visible = false;
            txtEditcity.Visible = false;
            //  txtEditDirAccessCode.Visible = false;
            txtEditDOB.Visible = false;
           // txtEditEducation.Visible = false;
            txtEditEmail.Visible = false;
            // txtEditFatherName.Visible = false;
            //  txtEditFirstName.Visible = false;
            txtEditFixedLandline.Visible = false;
            txtEditFlatno.Visible = false;
            txtEdithouseno.Visible = false;
            // txtEditLastName.Visible = false;
            txtEditMobile.Visible = false;
            //   txtEditmotherName.Visible = false;
            txtEditpincode.Visible = false;
            txtEditPOB.Visible = false;
            txtEditstreetname.Visible = false;
            txtEditstreetno.Visible = false;
          //  txtEditTechnical.Visible = false;
        }

        private void LabelTrue()
        {
            txtEditaltrEmail.Visible = true;
            txtEditarea.Visible = true;
            txtEditcity.Visible = true;
            //  txtEditDirAccessCode.Visible = false;
            txtEditDOB.Visible = true;
            // txtEditEducation.Visible = false;
            txtEditEmail.Visible = true;
            // txtEditFatherName.Visible = false;
            //  txtEditFirstName.Visible = false;
            txtEditFixedLandline.Visible = true;
            txtEditFlatno.Visible = true;
            txtEdithouseno.Visible = true;
            // txtEditLastName.Visible = false;
            txtEditMobile.Visible = true;
            //   txtEditmotherName.Visible = false;
            txtEditpincode.Visible = true;
            txtEditPOB.Visible = true;
            txtEditstreetname.Visible = true;
            txtEditstreetno.Visible = true;
           
            //  txtEditTechnical.Visible = false;
        }

        private void UpdateProfile()
        {
            dt = (DataTable)ViewState["EditDT"];
            int DeailsID = Convert.ToInt32(dt.Rows[0]["DetailsID"]);
            objRegistrationEntity.DetailsID = DeailsID;
            objRegistrationEntity.RoleName = "Admin";

            objRegistrationEntity.DateOfBirth = Convert.ToDateTime(txtdob.Text.Trim());
            objRegistrationEntity.PlaceOfBirth = txtpob.Text.Trim();
            objRegistrationEntity.MobileNumber = txtmobile.Text.Trim();
            objRegistrationEntity.Fixed_LandlineNumber = txtFixedLandline.Text.Trim();
            objRegistrationEntity.EmailID = txtEmail.Text.Trim();
            objRegistrationEntity.OptionalEmailID = txtaltrEmail.Text.Trim();


            if (FileUploadImage.HasFile)
            {
                string fileExt = System.IO.Path.GetExtension(FileUploadImage.FileName);
                fileName = txtEditFirstName.Text.Trim() + "_" + txtEditLastName.Text.Trim()+ fileExt;
                FileUploadImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                objRegistrationEntity.ImageName = fileName;
            }

            else
            {
                string Url = impPrev.ImageUrl;
                string[] SplitFileName = Url.Split('/');
                fileName = SplitFileName[2].ToString();
                objRegistrationEntity.ImageName = fileName;
            }
            //objRegistrationEntity.CompanyID = Convert.ToInt32(ddlCompany.SelectedValue);
            //objRegistrationEntity.BranchID = Convert.ToInt32(ddlBranch.SelectedValue);
            //objRegistrationEntity.LocationID = Convert.ToInt32(ddlLocation.SelectedValue);
            // objRegistrationEntity.ProgramID = Convert.ToInt32(ddlProgram.SelectedValue);
            // objRegistrationEntity.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);

            objRegistrationEntity.HouseNO = txthouseno.Text.Trim();
            objRegistrationEntity.Flat_UnitNo = txtFlatno.Text.Trim();
            objRegistrationEntity.StreetNO = txtstreetno.Text.Trim();
            objRegistrationEntity.StreetName = txtstreetname.Text.Trim();
            objRegistrationEntity.CountryID = 1; //Convert.ToInt32(ddlcountry.SelectedValue);
            objRegistrationEntity.StateID = 1;// Convert.ToInt32(ddlstate.SelectedValue);
            objRegistrationEntity.DistrictID = 1; //Convert.ToInt32(ddlDistrict.SelectedValue);
            objRegistrationEntity.Village_Town_City = txtcity.Text.Trim();
            objRegistrationEntity.SubUrban_Area = txtarea.Text.Trim();
            objRegistrationEntity.PostalCode = Convert.ToInt32(txtpincode.Text.Trim());

            int result = objRegistrationBL.UpdateAdminRegistration(objRegistrationEntity);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (btnEdit.Text == "Edit")
            {
                TextboxVisibleTrue();
                LabelFalse();
                btnEdit.Text = "Update";
                LoadEditData();
            }
            else
            {
                UpdateProfile();
                TextboxVisibleFalse();
                LabelTrue();
                btnEdit.Text = "Edit";
                dt = (DataTable)ViewState["EditDT"];
                int DeailsID = Convert.ToInt32(dt.Rows[0]["DetailsID"]);
                LoadAdminData(DeailsID);
            }
           

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LabelTrue();
            TextboxVisibleFalse();
            btnEdit.Text = "Edit";
        }
      
    }
}