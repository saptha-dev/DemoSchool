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
    public partial class Student_Regestration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizardstudentreg.PreRender += new EventHandler(Wizardstudentreg_PreRender);
           
        }
        protected void Wizardstudentreg_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizardstudentreg.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizardstudentreg.WizardSteps;
            SideBarList.DataBind();

        }

        protected string GetClassForWizardStep(object wizardStep)
        {
            WizardStep step = wizardStep as WizardStep;

            if (step == null)
            {
                return "";
            }

            int stepIndex = Wizardstudentreg.WizardSteps.IndexOf(step);

            if (stepIndex < Wizardstudentreg.ActiveStepIndex)
            {
                return "prevStep";
            }
            else if (stepIndex > Wizardstudentreg.ActiveStepIndex)
            {
                return "nextStep";
            }
            else
            {
                return "currentStep";
            }
        }

        protected void Wizardstudentreg_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            RegistrationBE newReg1 = new RegistrationBE();
          
            newReg1.RoleName = "student";
            newReg1.FirstName = txtFirstName.Text;
            newReg1.LastName = txtLastName.Text;
            newReg1.Father_GaurdainName = txtfathergurdianname.Text;
            newReg1.MotherMaidenName = txtMothername.Text;
            newReg1.DateOfBirth = Convert.ToDateTime(txtdob.Value);
            newReg1.PlaceOfBirth = txtpob.Text;
            newReg1.MobileNumber = txtmobile.Text;
            newReg1.Fixed_LandlineNumber = txtFixedLandline.Text;
            newReg1.EmailID = txtEmail.Text;
            newReg1.OptionalEmailID = txtaltrEmail.Text;
            newReg1.Qualification = txtEducation.Text;
            newReg1.TechnicalSkills = txtTechnicalSkills.Text;
            newReg1.AccessCode =txtStudentAccescode.Text;
            newReg1.ImageName = "image";
            newReg1.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
            newReg1.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
            newReg1.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
            newReg1.Village_Town_City = txtcity.Text;
            newReg1.SubUrban_Area = txtarea.Text;
            newReg1.PostalCode = 8686;
            newReg1.StreetNO = txtstreetno.Text;
            newReg1.StreetName = txtstreetname.Text;
            newReg1.HouseNO = txthouseno.Text;
            newReg1.Flat_UnitNo = txtFlatno.Text;
            newReg1.LandMark_Name = txtLandMark.Text;
            newReg1.Location = txtLocation.Text;
            newReg1.ProgramID = 8686;
            newReg1.BranchID = 8686;
            newReg1.LocationID = 88;
          
            newReg1.CategoryID = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);
            newReg1.Schedule_ID = ddlselectcategoryschedule.SelectedItem.Value;
            newReg1.YearId = ddlselectyear.SelectedItem.Value;
            newReg1.Schedule_ID = ddlselectyearsemschedule.SelectedItem.Value;
            newReg1.Subjects = ddlselectsubjects.SelectedItem.Value;
            newReg1.GroupId = Convert.ToInt32(ddlselectgroup.SelectedItem.Value);
            RegistrationBL objebl1 = new RegistrationBL();
            objebl1.StudentRegistration(newReg1);


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
            lbFname1.Visible = visible;
            txtFname1.Visible = visible;
            lbLname1.Visible = visible;
            TxtLname1.Visible = visible;
            lblMobileNumber1.Visible = visible;
            txtMobilenumber1.Visible = visible;
            lblEmail1.Visible = visible;
            txtEmail1.Visible = visible;
            lblsdob.Visible = visible;
            sDate.Visible = visible;
        }

        protected void Wizardstudentreg_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if(!IsValid)
            {
                Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.ActiveStepIndex - 1;
            }

            if (rdoexisting.Checked && Wizardstudentreg.ActiveStepIndex == 0)
            {
               
                RegistrationBL objebl1 = new RegistrationBL();
               

                var user = objebl1.GetExistingUser("","","","");
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
                    txtStudentAccescode.Text = dr["AccessCode"].ToString();

                    txtLocation.Text = dr["Location"].ToString();
                    txtstreetno.Text = dr["StreetNo"].ToString();
                    txtstreetname.Text = dr["StreetName"].ToString();
                    txthouseno.Text = dr["HouseNo"].ToString();
                    txtFlatno.Text = dr["Flat_UnitNo"].ToString();
                   // txtLandMark.Text = dr["LandMark_Name"].ToString();
                    ddlcountry.Text = dr["CountryID"].ToString();
                    ddlstate.Text = dr["StateID"].ToString();
                    ddlDistrict.Text = dr["DistrictID"].ToString();
                    txtcity.Text = dr["Village_Town_City"].ToString();
                   txtarea.Text = dr["SubUrban_Area"].ToString();
                   // ddlselectcategory.Text = dr["CategoryID"].ToString();
                   // ddlselectgroup.Text = dr["GroupId"].ToString();
                    //ddlselectyear.Text = dr["YearId"].ToString();
                    //ddlselectsubjects.Text = dr["Subjects"].ToString();
                    //ddlselectyearsemschedule.Text = dr["Schedule_ID"].ToString();

                }
            }
            else if (Wizardstudentreg.ActiveStepIndex == 3)
            {
                lblFirstNameValue.Text = txtFirstName.Text;
                lblLastNameValue.Text = txtLastName.Text;
                lblFatherNameValue.Text = txtfathergurdianname.Text;
                lblMotherMaidenNameValue.Text = txtMothername.Text;
                lblPobValue.Text = txtpob.Text;
                lblMotherMaidenNameValue.Text = txtmobile.Text;
                lblLandLineNumberValue.Text = txtFixedLandline.Text;
                lblEmailIdValue.Text= txtEmail.Text;
                lblAlterEmailIdValue.Text = txtaltrEmail.Text;
                lblEductionValue.Text = txtEducation.Text;
                lblTechnicalSkillValue.Text = txtTechnicalSkills.Text;
                lblStudentAccessCodeValue.Text = txtStudentAccescode.Text;

                lblCountryValue.Text = ddlcountry.Text;
                lblStateValue.Text = ddlstate.Text;
                lblDistrictValue.Text = ddlDistrict.Text;
                lblManadalTalukValue.Text = txtarea.Text;
                lblVillageTownValue.Text = txtcity.Text;
                lblPinCodeValue.Text = txtpincode.Text;
                lblStreetNoValue.Text = txtstreetno.Text;
                lblStreetNameValue.Text = txtstreetname.Text;
                lblHousePlotNoValue.Text = txthouseno.Text;
                lblBuildingLandMarkValue.Text = txtLandMark.Text;
                lblFlatNoValue.Text = txtFlatno.Text;
                lblLandLineNumberValue.Text = txtLandMark.Text;
                lblStudentLocationValue.Text = txtLocation.Text;

                lblSelectProgramValue.Text = ddlSelectProgram.Text;
                lblSelectGroupValue.Text = ddlselectgroup.Text;
                lblSelectCategoryValue.Text = ddlselectcategory.Text;
                lblSelectYearValue.Text = ddlselectyear.Text;
                lblSelectSubjectsValue.Text = ddlselectsubjects.Text;
                lblSelectYearSemSheduleValue.Text = ddlselectyearsemschedule.Text;
                lblSelectCategorySchedule.Text = ddlselectcategoryschedule.Text;

            }

        }
    }
}