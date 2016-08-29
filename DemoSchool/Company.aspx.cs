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
        string rolename = "Company";
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
            GetClassForWizardStep(sender);
            if (Wizard1.ActiveStepIndex == 2)
            {

                assocCmpName.Text = txtAssocCmpName.Text;
                regNumber.Text = txtRegNumber.Text;
                regDate.Text = txtregDate.Value;
                officePhone.Text = txtOfficePhone.Text;
                cmpEmail.Text=txtEmail.Text;
                assocCmpAccCode.Text = txtAssocCmpAccCode.Text;
                branchesNo.Text = txtBranchesNo.Text;
                
                firstName.Text = txtFirstName.Text;
                lastName.Text = txtLastName.Text;
                fatherName.Text = txtFatherName.Text;
                motherMaidenName.Text = txtMotherMaidenName.Text;
                placeOfBirth.Text = txtPlaceOfBirth.Text;
                mobileNumber.Text = txtMobileNumber.Text;
                fixedLineNumber.Text = txtFixedLineNumber.Text;
                emailId.Text = txtEmail.Text;
                alternateEmail.Text = txtAlternateEmail.Text;


                cmpCountry.Text = txtCmpCountry.SelectedItem.Text;
                cmpState.Text = txtCmpState.SelectedItem.Text;
                cmpCity.Text = txtCmpCity.SelectedItem.Text;
                mandal.Text = ddlMandal.SelectedItem.Text;
                village.Text = ddlVillage.SelectedItem.Text;
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

            try
            {
                newRegistration.RoleName = rolename;
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

                newRegistration.CountryID = Convert.ToInt16(txtCmpCountry.SelectedItem.Value);
                newRegistration.StateID = Convert.ToInt16(txtCmpState.SelectedItem.Value);
                newRegistration.DistrictID = Convert.ToInt16(txtCmpCity.SelectedItem.Value);
                newRegistration.SubUrban_Area = ddlMandal.Text;
                newRegistration.Village_Town_City = ddlVillage.Text;
                newRegistration.PostalCode = Convert.ToInt16(txtPinCode.Text);
                newRegistration.StreetNO = txtCmpStreetNo.Text;
                newRegistration.StreetName = txtCmpStreetName.Text;
                newRegistration.HouseNO = txtCmpHouseNo.Text;
                newRegistration.Flat_UnitNo = txtCmpFlatNo.Text;
                newRegistration.LandMark_Name = txtCmpLandMark.Text;
                newRegistration.Location = txtStudentLocation.Text;


                //newDetails.StreetNO
                RegistrationBL objBL = new RegistrationBL();
                objBL.AdminRegistration(newRegistration);
            }
            catch (Exception ex)
            {
                string msg = ex.ToString();
            }

        }
    }
}
