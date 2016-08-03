using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
        }

        //void OnActiveStepChanged(object sender,WizardNavigationEventArgs e)
        //{
        //    //WizardStep stepp = wizardStep as WizardStep;
        //    if (e.NextStepIndex == 3 || e.NextStepIndex == 4)
        //    {
        //        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "previewClick()", true);
        //        //Button btn = GetButtonFromWizardControl();
        //        //btn.Text = "Test";
        //    }
        //}

        [WebMethod]
        public static string Register(RegistrationBE reg)
        {
            RegistrationBE newRegistration = new RegistrationBE();
            return "success";
        }

        protected void Wizard1_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizard1.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizard1.WizardSteps.IndexOf(step);

            if (stepIndex < Wizard1.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizard1.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }



        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            //if (rdoexisting.Checked && Wizardstudentreg.ActiveStepIndex == 0)
            //{

            //    RegistrationBL objebl1 = new RegistrationBL();


            //    var user = objebl1.GetExistingUser("", "", "", "");
            //    if (user != null && user.Rows.Count > 0)
            //    {
            //        DataRow dr = user.Rows[0];
            //        txtFirstName.Text = dr["FirstName"].ToString();
            //        txtFirstName.Text = dr["LastName"].ToString();
            //        txtmobile.Text = dr["MobileNumber"].ToString();
            //        txtEmail.Text = dr["EmailID"].ToString();

            //        txtfathergurdianname.Text = dr["Father_GaurdainName"].ToString();
            //        txtMothername.Text = dr["MotherMaidenName"].ToString();
            //        txtpob.Text = dr["PlaceOfBirth"].ToString();

            //        txtFixedLandline.Text = dr["Fixed_LandlineNumber"].ToString();
            //        txtEducation.Text = dr["Qualification"].ToString();
            //        txtaltrEmail.Text = dr["OptionalEmailID"].ToString();
            //        txtTechnicalSkills.Text = dr["TechnicalSkills"].ToString();
            //        txtStudentAccescode.Text = dr["AccessCode"].ToString();

            //        txtLocation.Text = dr["Location"].ToString();
            //        txtstreetno.Text = dr["StreetNo"].ToString();
            //        txtstreetname.Text = dr["StreetName"].ToString();
            //        txthouseno.Text = dr["HouseNo"].ToString();
            //        txtFlatno.Text = dr["Flat_UnitNo"].ToString();
            //        txtLandMark.Text = dr["LandMark_Name"].ToString();
            //        ddlcountry.Text = dr["CountryID"].ToString();
            //        ddlstate.Text = dr["StateID"].ToString();
            //        ddlDistrict.Text = dr["DistrictID"].ToString();
            //        txtcity.Text = dr["Village_Town_City"].ToString();
            //        txtarea.Text = dr["SubUrban_Area"].ToString();
            //        ddlselectcategory.Text = dr["CategoryID"].ToString();
            //        ddlselectgroup.Text = dr["GroupId"].ToString();
            //        ddlselectyear.Text = dr["YearId"].ToString();
            //        ddlselectsubjects.Text = dr["Subjects"].ToString();
            //        ddlselectyearsemschedule.Text = dr["Schedule_ID"].ToString();

            //    }
            //}
            if (Wizard1.ActiveStepIndex == 2)
            {
                firstName.Text = txtFirstName.Text;
                lastName.Text = txtLastName.Text;
                fatherName.Text = txtFatherName.Text;
                motherMaidenName.Text = txtMotherMaidenName.Text;
                placeOfBirth.Text = txtPlaceOfBirth.Text;
                mobileNumber.Text = txtMobileNumber.Text;
                fixedLineNumber.Text = txtFixedLineNumber.Text;
                emailId.Text = txtEmail.Text;
                alternateEmail.Text = txtAlternateEmail.Text;


                cmpCountry.Text = txtCmpCountry.Text;
                cmpState.Text = txtCmpState.Text;
                cmpCity.Text = txtCmpCity.Text;
                mandal.Text = txtMandal.Text;
                village.Text = txtVillage.Text;
                pinCode.Text = txtPinCode.Text;
                cmpStreetNo.Text = txtCmpStreetNo.Text;
                cmpStreetName.Text = txtCmpStreetName.Text;
                cmphouseNo.Text = txtCmpHouseNo.Text;
                cmpFlatNo.Text = txtCmpFlatNo.Text;
                cmpLandMark.Text = txtCmpLandMark.Text;
                studentLocation.Text = txtStudentLocation.Text;
            }
        }

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            RegistrationBE newRegistration = new RegistrationBE();

            newRegistration.FirstName = txtFirstName.Text;
            newRegistration.LastName = txtLastName.Text;
            newRegistration.Father_GaurdainName = txtFatherName.Text;
            newRegistration.MotherMaidenName = txtMotherMaidenName.Text;
            newRegistration.PlaceOfBirth = txtPlaceOfBirth.Text;
            newRegistration.MobileNumber = txtMobileNumber.Text;
            newRegistration.Fixed_LandlineNumber = txtFixedLineNumber.Text;
            newRegistration.EmailID = txtEmail.Text;
            newRegistration.OptionalEmailID = txtAlternateEmail.Text;
            newRegistration.DateOfBirth = Convert.ToDateTime(date.Text);

            newRegistration.CountryID = Convert.ToInt16(txtCmpCountry.Text);
            newRegistration.StateID = Convert.ToInt16(txtCmpState.Text);
            newRegistration.DistrictID = Convert.ToInt16(txtCmpCity.Text);
            newRegistration.SubUrban_Area = txtMandal.Text;
            newRegistration.Village_Town_City = txtVillage.Text;
            newRegistration.PostalCode = Convert.ToInt16(txtPinCode.Text);
            newRegistration.StreetNO = txtCmpStreetNo.Text;
            newRegistration.StreetName = txtCmpStreetName.Text;
            newRegistration.HouseNO = txtCmpHouseNo.Text;
            newRegistration.Flat_UnitNo = txtCmpFlatNo.Text;
           newRegistration.LandMark_Name = txtCmpLandMark.Text;
            newRegistration.Location = txtStudentLocation.Text;
            //newRegistration.RoleName = "Management";
            //newRegistration.FirstName = txtFirstName.Text;
            //newRegistration.LastName = txtLastName.Text;
            //newRegistration.Father_GaurdainName = txtfathergurdianname.Text;
            //newRegistration.MotherMaidenName = txtMothername.Text;
            // = Convert.ToDateTime(txtdob.Value);
            //newRegistration.PlaceOfBirth = txtpob.Text;
            //newRegistration.MobileNumber = txtmobile.Text;
            //newRegistration.Fixed_LandlineNumber = txtFixedLandline.Text;
            //newRegistration.EmailID = txtEmail.Text;
            //newRegistration.OptionalEmailID = txtaltrEmail.Text;
            //newRegistration.AccessCode = txtAdminAccescode.Text;
            //newRegistration.ImageName = "image 1";
            //newRegistration.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
            //newRegistration.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
            //newRegistration.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
            //newRegistration.SubUrban_Area = ddlMandal.SelectedItem.Value;
            //newRegistration.Village_Town_City = ddlVillage.SelectedItem.Value;
            //newRegistration.StreetNO = txtstreetno.Text;
            //newRegistration.StreetName = txtstreetname.Text;
            //newRegistration.HouseNO = txthouseno.Text;
            //newRegistration.Flat_UnitNo = txtFlatno.Text;
            //newRegistration.LandMark_Name = txtLandMark.Text;
            //newRegistration.Location = txtLocation.Text;
            //newRegistration.PostalCode = 123456;

            //newDetails.StreetNO
            RegistrationBL objBL = new RegistrationBL();
            objBL.AdminRegistration(newRegistration);

        }
    }
}