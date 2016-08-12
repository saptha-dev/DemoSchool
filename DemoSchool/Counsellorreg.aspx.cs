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
    public partial class Counsellorreg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WizardCounsellor.PreRender += new EventHandler(Wizard1_PreRender);
        }
        protected void Wizard1_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = WizardCounsellor.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = WizardCounsellor.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = WizardCounsellor.WizardSteps.IndexOf(step);

            if (stepIndex < WizardCounsellor.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > WizardCounsellor.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void WizardCounsellor_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            RegistrationBE connewRegistration = new RegistrationBE();
            connewRegistration.RoleName = "Counsellor";
            connewRegistration.FirstName = txtFirstName.Text;
            connewRegistration.LastName = txtLastName.Text;
            connewRegistration.Father_GaurdainName = txtfathergurdianname.Text;
            connewRegistration.MotherMaidenName = txtMothername.Text;
           connewRegistration.DateOfBirth = Convert.ToDateTime(txtdob.Value);
            connewRegistration.PlaceOfBirth = txtpob.Text;
            connewRegistration.MobileNumber = txtmobile.Text;
            connewRegistration.Fixed_LandlineNumber = txtFixedLandline.Text;
            connewRegistration.EmailID = txtEmail.Text;
            connewRegistration.OptionalEmailID = txtaltrEmail.Text;
            connewRegistration.AccessCode = txtAccessCode.Text;
            connewRegistration.ImageName = "image 1";
            connewRegistration.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
            connewRegistration.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
            connewRegistration.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
            connewRegistration.SubUrban_Area = ddlMandal.SelectedItem.Value;
            connewRegistration.Village_Town_City = ddlVillage.SelectedItem.Value;
            connewRegistration.StreetNO = txtstreetno.Text;
            connewRegistration.StreetName = txtstreetname.Text;
            connewRegistration.HouseNO = txthouseno.Text;
            connewRegistration.Flat_UnitNo = txtFlatno.Text;
            connewRegistration.LandMark_Name = txtLandMark.Text;
            connewRegistration.Location = txtLocation.Text;
            connewRegistration.PostalCode = 123456;
            connewRegistration.Employer_Name = txtEmployerName.Text;
            connewRegistration.workExperience = Convert.ToInt32(txtworkExp.Text);
                     connewRegistration.Employer_Address = txtEMpAddress.Text;
            connewRegistration.Employer_Mail = txtEmpEmail.Text;
            connewRegistration.Employer_Phone = txtEmpPhone.Text;
            


            //newDetails.StreetNO
            RegistrationBL obj = new RegistrationBL();
            obj.AdminRegistration(connewRegistration);

        }

        protected void WizardCounsellor_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {


            if (WizardCounsellor.ActiveStepIndex == 2)
            {
                conslblFirstNameValue.Text = txtFirstName.Text;
                conslblLastNameValue.Text = txtLastName.Text;
                conslblFatherNameValue.Text = txtfathergurdianname.Text;
                conslblMotherMaidenNameValue.Text = txtMothername.Text;
                conslblPobValue.Text = txtpob.Text;
                conslblMobileNumberValue.Text = txtmobile.Text;
                conslblLandLineNumberValue.Text = txtFixedLandline.Text;
                conslblEmailIdValue.Text = txtEmail.Text;
                conslblAlterEmailIdValue.Text = txtaltrEmail.Text;


                conslblCountryValue.Text = ddlcountry.SelectedItem.Text;
                conslblStateValue.Text = ddlstate.SelectedItem.Text;
                conslblDistrictValue.Text = ddlDistrict.SelectedItem.Text;
                conslblVillageTownValue.Text = ddlVillage.SelectedItem.Text;
                conslblManadalTalukValue.Text = ddlMandal.SelectedItem.Text;

                conslblPinCodeValue.Text = txtpincode.Text;
                conslblStreetNoValue.Text = txtstreetno.Text;
                conslblStreetNameValue.Text = txtstreetname.Text;
                conslblHousePlotNoValue.Text = txthouseno.Text;
                conslblFlatNoValue.Text = txtFlatno.Text;
                conslblBuildingLandMarkValue.Text = txtLandMark.Text;
                conslblcounsellorLocationValue.Text = txtLocation.Text;

                consworkexpvalue.Text = txtworkExp.Text;
                consempphonevalue.Text = txtEmpPhone.Text;
              consempaddressvalue.Text = txtEMpAddress.Text;
                consempemailvalue.Text = txtEmpEmail.Text;
                consempnamevalue.Text = txtEmployerName.Text;
            }
           
  
        }

    }
    }
