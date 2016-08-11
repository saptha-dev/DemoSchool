using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class Admin : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
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

        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            RegistrationBE newRegistration = new RegistrationBE();
            newRegistration.RoleName = "Management";
            newRegistration.FirstName = txtFirstName.Text;
            newRegistration.LastName = txtLastName.Text;
            newRegistration.Father_GaurdainName = txtfathergurdianname.Text;
            newRegistration.MotherMaidenName = txtMothername.Text;
            newRegistration.DateOfBirth = Convert.ToDateTime(txtdob.Value);
            newRegistration.PlaceOfBirth = txtpob.Text;
            newRegistration.MobileNumber = txtmobile.Text;
            newRegistration.Fixed_LandlineNumber = txtFixedLandline.Text;
            newRegistration.EmailID = txtEmail.Text;
            newRegistration.OptionalEmailID = txtaltrEmail.Text;
            newRegistration.AccessCode = txtAdminAccescode.Text;
            newRegistration.ImageName = "image 1";
            newRegistration.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
            newRegistration.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
            newRegistration.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
            newRegistration.SubUrban_Area = ddlMandal.SelectedItem.Value;
            newRegistration.Village_Town_City = ddlVillage.SelectedItem.Value;
            newRegistration.StreetNO = txtstreetno.Text;
            newRegistration.StreetName = txtstreetname.Text;
            newRegistration.HouseNO = txthouseno.Text;
            newRegistration.Flat_UnitNo = txtFlatno.Text;
            newRegistration.LandMark_Name = txtLandMark.Text;
           // newRegistration.Location = txtLocation.Text;
            newRegistration.PostalCode = 123456;
            

            //newDetails.StreetNO
            RegistrationBL objBL = new RegistrationBL();
            objBL.AdminRegistration(newRegistration);

        }

        protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (Wizard1.ActiveStepIndex == 1)
            {
                mlblFirstNameValue.Text = txtFirstName.Text;
                mlblLastNameValue.Text = txtLastName.Text;
                mlblFatherNameValue.Text = txtfathergurdianname.Text;
                mlblMotherMaidenNameValue.Text = txtMothername.Text;
                mlblPobValue.Text = txtpob.Text;
                mlblMobileNumberValue.Text = txtmobile.Text;
                mlblLandLineNumberValue.Text = txtFixedLandline.Text;
                mlblEmailIdValue.Text = txtEmail.Text;
                mlblAlterEmailIdValue.Text = txtaltrEmail.Text;


                mlblCountryValue.Text = ddlcountry.Text;
                mlblDistrictValue.Text = ddlDistrict.Text;
                mlblStateValue.Text = ddlstate.Text;
                mlblVillageTownValue.Text = ddlVillage.Text;
                mlblManadalTalukValue.Text = ddlMandal.Text;
                
                mlblPinCodeValue.Text = txtpincode.Text;
                mlblStreetNoValue.Text = txtstreetno.Text;
                mlblStreetNameValue.Text = txtstreetname.Text;
                mlblHousePlotNoValue.Text = txthouseno.Text;
                mlblFlatNoValue.Text = txtFlatno.Text;
                mlblBuildingLandMarkValue.Text = txtLandMark.Text;
               // mlbladminLocationValue.Text = txtLocation.Text;
            }
        }
    }
}