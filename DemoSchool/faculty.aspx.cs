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
    public partial class faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizardfaculty.PreRender += new EventHandler(Wizardfaculty_PreRender);
        }
        protected void Wizardfaculty_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizardfaculty.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizardfaculty.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }
            int stepIndex = Wizardfaculty.WizardSteps.IndexOf(step);

            if (stepIndex < Wizardfaculty.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizardfaculty.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void Wizardfaculty_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            RegistrationBE newReg = new RegistrationBE();
            newReg.ProgramID = Convert.ToInt32(txtpincode.Text);
            newReg.RoleName = "faculty";
            newReg.FirstName = txtFirstName.Text;
            newReg.LastName = txtLastName.Text;
            newReg.Father_GaurdainName = txtfathergurdianname.Text;
            newReg.MotherMaidenName = txtMothername.Text;
            newReg.DateOfBirth = Convert.ToDateTime(txtdob.Value);
            newReg.PlaceOfBirth = txtpob.Text;
            newReg.MobileNumber = txtmobile.Text;
            newReg.Fixed_LandlineNumber = txtFixedLandline.Text;
            newReg.EmailID= txtEmail.Text;
            newReg.OptionalEmailID = txtaltrEmail.Text;
            newReg.Qualification = txtEducation.Text;
            newReg.TechnicalSkills = txtTechnicalSkills.Text;
            newReg.AccessCode = txtFacultyAccessCode.Text;
            newReg.ImageName = "image";
            newReg.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
            newReg.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
            newReg.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
            newReg.SubUrban_Area = ddlMandal.SelectedItem.Value;
            newReg.Village_Town_City = ddlVillage.SelectedItem.Value;
            newReg.PostalCode = 8686;
            newReg.StreetNO = txtstreetno.Text;
            newReg.StreetName = txtstreetname.Text;
            newReg.HouseNO = txthouseno.Text;
            newReg.Flat_UnitNo = txtFlatno.Text;
            newReg.LandMark_Name = txtLandMark.Text;
            newReg.Location = txtLocation.Text;
            newReg.workExperience = Convert.ToInt32(txtworkExp.Text);
            newReg.Employer_Name = txtEmployerName.Text;
            newReg.Employer_Address = txtEMpAddress.Text;
            newReg.Employer_Phone = txtEmpPhone.Text;
            newReg.Employer_Mail = txtEmpEmail.Text;
            newReg.YearId =ddlyearsem.SelectedItem.Value;
            newReg.CategoryID = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);
            newReg.Schedule_ID = ddlselectcategoryschedule.SelectedItem.Value;
            newReg.YearId = ddlselectyear.SelectedItem.Value;
            newReg.Schedule_ID = ddlselectyearsemschedule.SelectedItem.Value;
            newReg.Subjects = ddlselectsubjects.SelectedItem.Value;
            newReg.GroupId = Convert.ToInt32(ddlselectgroup.SelectedItem.Value);
            RegistrationBL objebl = new RegistrationBL();
            objebl.FacultyRegistration(newReg);
           


           









           

        }
    }
}