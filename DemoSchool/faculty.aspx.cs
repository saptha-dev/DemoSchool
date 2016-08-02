using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Data;
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
           // newReg.ProgramID = 412;
            newReg.RoleName = "faculty";
            newReg.FirstName = txtFirstName.Text;
            newReg.LastName = txtLastName.Text;
            newReg.Father_GaurdainName = txtfathergurdianname.Text;
            newReg.MotherMaidenName = txtMothername.Text;
           // newReg.DateOfBirth = Convert.ToDateTime(txtdob.Value);
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

        protected void RadioButton_CheckedChanged(object sender, System.EventArgs e)
        {
            if (rdonewUser.Checked == true)
            {
                ShowExistingUserControls(false);


                //lblrd1.Text = "Your selected item is : " +
                //    Rdo2.Text;
            }
            else if (rdoexisting.Checked == true)
            {
                ShowExistingUserControls(true);

                // lblrd1.Text = "Your selected item is : " +
                //    Rdo2.Text;
            }
        }

        private void ShowExistingUserControls(bool visible)
        {
            lbfFname1.Visible = visible;
            txtfFname1.Visible = visible;
            lbfLname1.Visible = visible;
            TxtfLname1.Visible = visible;
            lblfMobileNumber1.Visible = visible;
            txtfMobilenumber1.Visible = visible;
            lblfEmail1.Visible = visible;
            txtfEmail1.Visible = visible;
            lblfdob.Visible = visible;
            fDate.Visible = visible;
        }

        protected void Wizardfaculty_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (rdoexisting.Checked && Wizardfaculty.ActiveStepIndex == 0)
            {

                RegistrationBL objebl1 = new RegistrationBL();


                var user = objebl1.GetExistingUser("", "", "", "");
                if (user != null && user.Rows.Count > 0)
                {
                    DataRow dr = user.Rows[0];
                    txtFirstName.Text = dr["FirstName"].ToString();
                    txtFirstName.Text = dr["LastName"].ToString();
                    txtmobile.Text = dr["MobileNumber"].ToString();
                    txtEmail.Text = dr["EmailID"].ToString();

                    txtfathergurdianname.Text = dr["Father_GaurdainName"].ToString();
                    txtMothername.Text = dr["MotherMaidenName"].ToString();
                    txtpob.Text = dr["PlaceOfBirth"].ToString();

                    txtFixedLandline.Text = dr["Fixed_LandlineNumber"].ToString();
                    txtEducation.Text = dr["Qualification"].ToString();
                    txtaltrEmail.Text = dr["OptionalEmailID"].ToString();
                    txtTechnicalSkills.Text = dr["TechnicalSkills"].ToString();
                    txtFacultyAccessCode.Text = dr["AccessCode"].ToString();

                    txtLocation.Text = dr["Location"].ToString();
                   txtstreetno.Text = dr["StreetNo"].ToString();
                    txtstreetname.Text = dr["StreetName"].ToString();
                    txthouseno.Text = dr["HouseNo"].ToString();
                    txtFlatno.Text = dr["Flat_UnitNo"].ToString();
                    txtLandMark.Text = dr["LandMarkName"].ToString();
                    ddlcountry.Text = dr["CountryID"].ToString();
                    ddlstate.Text = dr["StateID"].ToString();
                    ddlDistrict.Text = dr["DistrictID"].ToString();
                    ddlVillage.Text = dr["Village_Town_City"].ToString();
                    ddlMandal.Text = dr["SubUrban_Area"].ToString();
                    ddlselectcategory.Text = dr["CategoryID"].ToString();
                    ddlselectgroup.Text = dr["GroupId"].ToString();
                    ddlselectyear.Text = dr["YearId"].ToString();
                    ddlselectsubjects.Text = dr["Subjects"].ToString();
                   ddlselectyearsemschedule.Text = dr["Schedule_ID"].ToString();
                    txtworkExp.Text = dr["Employer_WorkExp"].ToString();
                    txtEmployerName.Text = dr["Employer_Name"].ToString();
                    txtEMpAddress.Text = dr["Employer_Address"].ToString();
                    txtEmpPhone.Text = dr["Employer_Phone"].ToString();
                    txtEmpEmail.Text = dr["Employer_Email"].ToString();
                   
              }
         }

        }
    }
}