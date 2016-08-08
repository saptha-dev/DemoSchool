using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoSchool
{
    public partial class Student_Regestration : System.Web.UI.Page
    {
        string rolename = "Student";
        RegistrationBL objReg = new RegistrationBL();
        StudentBL objStudentBL = new StudentBL();
        AddProgramsBL objBL = new AddProgramsBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            Wizardstudentreg.PreRender += new EventHandler(Wizardstudentreg_PreRender);
            if (!IsPostBack)
            {
            addNewPogram();
            }
           
        }

        public void addNewPogram()
        {
            SqlDataReader dr = objReg.GetProgram();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddladdProgram.DataSource = dt;
            ddladdProgram.DataTextField = "Program_name";
            ddladdProgram.DataValueField = "Program_id";
            ddladdProgram.DataBind();
            // ddlProgram.Items.Insert(0, "--Select--");
            ddladdProgram.Items.Insert(0, new ListItem("--Select--", ""));

        }

        private void GetGroupNameForStudent()
        {
            SqlDataReader dr = objStudentBL.GetGroupNameForStudent(Session["UserID"].ToString());
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {

                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Branch_Name";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("--Select--", "0"));

            }
        }

        public void ddladdProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            int programId = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
            if (programId != 0)
            {
                SqlDataReader dr = objBL.GetCategoriesBasedOnProgramsDrpdwn(programId);
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddladdCategory.DataSource = dt;
                    ddladdCategory.DataValueField = "Category_Id";
                    ddladdCategory.DataTextField = "Category_Name";
                    ddladdCategory.DataBind();
                    ddladdCategory.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            else
            {
                ddladdCategory.Items.Clear();
                ddlGroup.Items.Clear();
                ddladdsemister.Items.Clear();
            }
        }

        public void ddladdCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddladdCategory.SelectedValue != "0")
            {
                SqlDataReader dr = objBL.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddladdCategory.SelectedValue));
                DataTable dt = new DataTable();
                dt.Load(dr);
                if (dt.Rows.Count > 0)
                {
                    ddlGroup.DataSource = dt;
                    ddlGroup.DataValueField = "Branch_Id";
                    ddlGroup.DataTextField = "Branch_Name";
                    ddlGroup.DataBind();
                    ddlGroup.Items.Insert(0, new ListItem("---Select---", "0"));
                }
            }
            else
            {
                ddlGroup.Items.Clear();
                //ddladdsemister.Items.Clear();
            }
        }

        
        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objBL.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlGroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                DDlYear.DataSource = dt;
                DDlYear.DataValueField = "Year_Id";
                DDlYear.DataTextField = "Branch_Year_No";
                DDlYear.DataBind();
                DDlYear.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void DDlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = objStudentBL.GetSubjectsForStudent("123", Convert.ToInt32(DDlYear.SelectedItem.Value));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubjects.DataSource = dt;
                ddlSubjects.DataValueField = "Subject_Id";
                ddlSubjects.DataTextField = "Subject_Name";
                ddlSubjects.DataBind();
                ddlSubjects.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            
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
         
           newReg1.RoleName =rolename;
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
            newReg1.ProgramID = Convert.ToInt32(ddladdProgram.SelectedItem.Value); 
            newReg1.BranchID = 8686;
            newReg1.LocationID = 88;

            newReg1.CategoryID = Convert.ToInt32(ddladdCategory.SelectedItem.Value);
            newReg1.Schedule_ID = ddlselectcategoryschedule.SelectedItem.Value;
            newReg1.YearId = DDlYear.SelectedItem.Value;
            newReg1.Schedule_ID = ddladdsemister.SelectedItem.Value;
            newReg1.Subjects = ddlSubjects.SelectedItem.Value;
            newReg1.GroupId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
            objReg.StudentRegistration(newReg1);
        }

        protected void PaymentOption_Changed(object sender, System.EventArgs e)
        {
            if (netBanking.Checked)
            {
                payment2.Visible = true;
                payment1.Visible = false;
                payment3.Visible = false;
            }
            if (creditCard.Checked)
            {
                payment2.Visible = false;
                payment1.Visible = true;
                payment3.Visible = false;
            }
            if (accountTransfer.Checked)
            {
                payment1.Visible = false;
                payment2.Visible = false;
                payment3.Visible = true;
            }
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
            studentFname.Visible = visible;
            lbLname1.Visible = visible;
            studentLname.Visible = visible;
            lblMobileNumber1.Visible = visible;
            studentMobilenumber.Visible = visible;
            lblEmail1.Visible = visible;
            studentEmail.Visible = visible;
            lblsdob.Visible = visible;
            studentDate.Visible = visible;
        }

        protected void Wizardstudentreg_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if(!IsValid)
            {
                Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.ActiveStepIndex - 1;
            }
            GetClassForWizardStep(sender);
            if (rdoexisting.Checked && Wizardstudentreg.ActiveStepIndex == 0)
            {
               
                RegistrationBL objebl1 = new RegistrationBL();


                var user = objebl1.GetExistingUser(studentFname.Text, studentLname.Text, studentMobilenumber.Text, studentEmail.Text, studentDate.Value, rolename);
                if (user != null && user.Rows.Count > 0)
                {
                    DataRow dr = user.Rows[0];
                    txtFirstName.Text = dr["FirstName"].ToString();
                    txtLastName.Text = dr["LastName"].ToString();
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
                    txtLandMark.Text = dr["LandMarkName"].ToString();
                    ddlcountry.Text = dr["CountryID"].ToString();
                    ddlstate.Text = dr["StateID"].ToString();
                    ddlDistrict.Text = dr["DistrictID"].ToString();
                    txtcity.Text = dr["Village_Town_City"].ToString();
                    txtarea.Text = dr["SubUrban_Area"].ToString();
                    ddladdCategory.DataTextField = dr["CategoryID"].ToString();
                   // ddlGroup.SelectedValue = dr["GroupID"].ToString();
                 // ddlselectgroup.DataTextField = dr["GroupId"].ToString();
                  //ddlselectyear.DataTextField = dr["YearId"].ToString();
                 // ddlselectsubjects.DataTextField = dr["Subjects"].ToString();
                 // ddlselectyearsemschedule.DataTextField = dr["Schedule_ID"].ToString();

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

                //lblSelectProgramValue.Text = ddladdProgram.SelectedItem.Value;
               // lblSelectGroupValue.Text = ddlGroup.SelectedItem.Text;
                //lblSelectGroupValue.Text = ddlGroup.Text;
                lblSelectCategoryValue.Text = ddladdCategory.Text;
                lblSelectYearValue.Text = DDlYear.Text;
                lblSelectSubjectsValue.Text = ddlSubjects.Text;
                lblSelectYearSemSheduleValue.Text = ddladdsemister.Text;
                lblSelectCategorySchedule.Text = ddlselectcategoryschedule.Text;

            }

            if (Wizardstudentreg.ActiveStepIndex == 4)
            {
                if (ddladdProgram.SelectedItem != null)
                {
                    paymentProgram.Text = string.IsNullOrEmpty(ddladdProgram.SelectedItem.Value) ? "" : ddladdProgram.SelectedItem.Text;
                }
                if (ddlGroup.SelectedItem != null)
                {
                    paymentGroup.Text = string.IsNullOrEmpty(ddlGroup.SelectedItem.Value) ? "" : ddlGroup.SelectedItem.Text;
                }
                if (ddladdCategory.SelectedItem != null)
                {
                    paymentCategory.Text = string.IsNullOrEmpty(ddladdCategory.SelectedItem.Value) ? "" : ddladdCategory.SelectedItem.Text;
                }
                if (DDlYear.SelectedItem != null)
                {
                    paymentYear.Text = string.IsNullOrEmpty(DDlYear.SelectedItem.Value) ? "" : DDlYear.SelectedItem.Text;
                }
                if (ddlSubjects.SelectedItem != null)
                {
                    paymentSubject.Text = string.IsNullOrEmpty(ddlSubjects.SelectedItem.Value) ? "" : ddlSubjects.SelectedItem.Text;
                }
                if (ddladdsemister.SelectedItem != null)
                {
                    paymentYearSem.Text = string.IsNullOrEmpty(ddladdsemister.SelectedItem.Value) ? "" : ddladdsemister.SelectedItem.Text;
                }
                if (ddlselectcategoryschedule.SelectedItem != null)
                {
                    paymentCategorySchedule.Text = string.IsNullOrEmpty(ddlselectcategoryschedule.SelectedItem.Value) ? "" : ddlselectcategoryschedule.SelectedItem.Text;
                }

            }
        }
    }
}