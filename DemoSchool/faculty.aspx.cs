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
    public partial class faculty : System.Web.UI.Page
    {
        string rolename = "faculty";
        RegistrationBL objReg1 = new RegistrationBL();
        FacultyBL fblobj = new FacultyBL();
        AddProgramsBL prog = new AddProgramsBL();
        //private object objReg;

        protected void Page_Load(object sender, EventArgs e)
        {
            Wizardfaculty.PreRender += new EventHandler(Wizardfaculty_PreRender);
            if (!IsPostBack)
            {
                LoadCategory();
            }
           
        }
        protected void Wizardfaculty_PreRender(object sender, EventArgs e)
        {
            Repeater SideBarList = Wizardfaculty.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
            SideBarList.DataSource = Wizardfaculty.WizardSteps;
            SideBarList.DataBind();

        }
        public void LoadCategory()
        {
            SqlDataReader dr = objReg1.GetCategories();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddlselectcategory.Items.Clear();
            ddlselectcategory.DataSource = dt;
            ddlselectcategory.DataTextField = "Category_Name";
            ddlselectcategory.DataValueField = "Category_Id";
            ddlselectcategory.DataBind();
           
            ddlselectcategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        public void ddlselectcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Category_Id = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);

            if (Category_Id != 0)
            {
                LoadGroups();
                LoadCategorySchdule();
                LoadYearOrSemSchdule();
               
                
            }
            else
            {
                ddlyearsem.Items.Clear();
                ddlselectgroup.Items.Clear();
                ddlselectsubjects.Items.Clear();
            }

        }
        public void ddlselectcategoryschedule_SelectedIndexChanged(object sender, EventArgs e)
        {

            //if (ddlselectcategoryschedule.SelectedValue != "0")
            //{
            //    LoadGroups();
            //    LoadCategorySchdule();
            //    LoadYearOrSemSchdule();
            //}
            //else
            //{
            //    ddlyearsem.Items.Clear();
            //    ddlselectgroup.Items.Clear();
            //    ddlselectsubjects.Items.Clear();
            //}
        }
        private void LoadGroups()
        {
            SqlDataReader dr = prog.GetGroupBasedOnCategoriesDrpdwn(Convert.ToInt32(ddlselectcategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlselectgroup.Items.Clear();
                ddlselectgroup.DataSource = dt;
                ddlselectgroup.DataValueField = "Branch_Id";
                ddlselectgroup.DataTextField = "Branch_Name";
                ddlselectgroup.DataBind();
               ddlselectgroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }
        
        private void LoadCategorySchdule()
        {
            SqlDataReader dr = prog.GetCategorySchdule(Convert.ToInt32(ddlselectcategoryschedule.SelectedValue));
            
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlselectcategoryschedule.Items.Clear();
                ddlselectcategoryschedule.DataSource = dt;
                ddlselectcategoryschedule.DataValueField = "";
                ddlselectcategoryschedule.DataTextField = "Schedule_Id";
                ddlselectcategoryschedule.DataBind();
                ddlselectcategoryschedule.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        private void LoadYearOrSemSchdule()
        {
            SqlDataReader dr = prog.GetYearOrSemSchdule(Convert.ToInt32(ddlselectcategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlselectyearsemschedule.Items.Clear();
                ddlselectyearsemschedule.DataSource = dt;
                ddlselectyearsemschedule.DataValueField = "Branch_T_Years";
                ddlselectyearsemschedule.DataTextField = "Branch_T_Years";
                ddlselectyearsemschedule.DataBind();
                ddlselectyearsemschedule.Items.Insert(0, new ListItem("---Select---", "0"));
            }
         
        }
        protected void ddlselectgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataReader dr = prog.GetYearBasedOnGroupDrpdwn(Convert.ToInt32(ddlselectgroup.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlyearsem.DataSource = dt;
                ddlyearsem.DataValueField = "Year_Id";
                ddlyearsem.DataTextField = "Branch_Year_No";
                ddlyearsem.DataBind();
                ddlyearsem.Items.Insert(0, new ListItem("--Select--", "0"));
            }
           
        }
        protected void ddlyearsem_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int Category_Id = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);
            //int branchId = Convert.ToInt32(ddlselectgroup.SelectedItem.Value);
            //int categoryId = Convert.ToInt32(ddlselectcategoryschedule. SelectedItem.Value);

            //SqlDataReader dr = fblobj.GetSubjectDDlbyCategory(20,30);
            //DataTable dt = new DataTable();
            //dt.Load(dr);
            //if (dt.Rows.Count > 0)
            //{
            //    ddlselectsubjects.DataSource = dt;
            //    ddlselectsubjects.DataValueField = "Subject_Id";
            //    ddlselectsubjects.DataTextField = "Subject_Name";
            //    ddlselectsubjects.DataBind();
            //    ddlselectsubjects.Items.Insert(0, new ListItem("--Select--", "0"));
            //}
            //int programId = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
            int branchId = Convert.ToInt32(ddlselectgroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);

            SqlDataReader dr = fblobj.GetSubjects(25, 13, 27);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlselectsubjects.DataSource = dt;
                ddlselectsubjects.DataValueField = "Subject_Id";
                ddlselectsubjects.DataTextField = "Subject_Name";
                ddlselectsubjects.DataBind();
                ddlselectsubjects.Items.Insert(0, new ListItem("--Select--", "0"));
            }
            LoadSubjectsSchedule();


        }
        protected void ddlselectsubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        }
        private void LoadSubjectsSchedule()
        {
            //int programId = Convert.ToInt32(ddlProgram.SelectedItem.Value);
            //int branchId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
            int categoryId = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);

            SqlDataReader dr = prog.GetSubjectsSchedule(categoryId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlSubSchdDate.DataSource = dt;
                ddlSubSchdDate.DataValueField = "Subject_ScheduleID";
                ddlSubSchdDate.DataTextField = "Subject_ScheduleID_Date";
                ddlSubSchdDate.DataBind();
                ddlSubSchdDate.Items.Insert(0, new ListItem("--Select--", "0"));
            }
           
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
            newReg.ProgramID = 124;
            newReg.RoleName = rolename;
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
            //newReg.workExperience = Convert.ToInt32(txtworkExp.Text);
            newReg.workExperience = 1;
            newReg.Employer_Name = txtEmployerName.Text;
            newReg.Employer_Address = txtEMpAddress.Text;
            newReg.Employer_Phone = txtEmpPhone.Text;
            newReg.Employer_Mail = txtEmpEmail.Text;
            newReg.YearId =ddlyearsem.SelectedItem.Value;
            newReg.CategoryID = Convert.ToInt32(ddlselectcategory.SelectedItem.Value);
            newReg.Schedule_ID = ddlselectcategoryschedule.SelectedItem.Value;
            //newReg.YearId = ddlselectyear.SelectedItem.Value;
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
            FacultyFname.Visible = visible;
            lbfLname1.Visible = visible;
            FacultyLname.Visible = visible;
            lblfMobileNumber1.Visible = visible;
            FacultyMobilenumber.Visible = visible;
            FacultyEmail.Visible = visible;
            FacultyEmailID.Visible = visible;
            lblfdob.Visible = visible;
            FacultyDate.Visible = visible;
        }

        protected void Wizardfaculty_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (rdoexisting.Checked && Wizardfaculty.ActiveStepIndex == 0)
            {

                RegistrationBL objebl1 = new RegistrationBL();


                var user = objebl1.GetExistingUser(FacultyFname.Text, FacultyLname.Text, FacultyMobilenumber.Text, FacultyEmailID.Text, FacultyDate.Value,rolename);
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
                    ddlVillage.DataTextField = dr["Village_Town_City"].ToString();
                    ddlMandal.DataTextField = dr["SubUrban_Area"].ToString();
                    ddlselectcategory.DataTextField = dr["CategoryID"].ToString();
                   // ddlselectgroup.DataTextField = dr["GroupId"].ToString();
                   // ddlselectyear.DataTextField = dr["YearId"].ToString();
                 //   ddlselectsubjects.DataTextField = dr["Subjects"].ToString();
                 //  ddlselectyearsemschedule.DataTextField = dr["Schedule_ID"].ToString();
                    txtworkExp.Text = dr["Employer_WorkExp"].ToString();
                    txtEmployerName.Text = dr["Employer_Name"].ToString();
                    txtEMpAddress.Text = dr["Employer_Address"].ToString();
                    txtEmpPhone.Text = dr["Employer_Phone"].ToString();
                    txtEmpEmail.Text = dr["Employer_Email"].ToString();
                   
              }
         }
            else if (Wizardfaculty.ActiveStepIndex == 4)
            {
                flblFirstNameValue.Text = txtFirstName.Text;
                flblLastNameValue.Text = txtLastName.Text;
                flblFirstNameValue.Text = txtfathergurdianname.Text;
                flblmotherValue.Text = txtMothername.Text;
                flblpobValue.Text = txtpob.Text;
                flblMobileNoValue.Text = txtmobile.Text;
                flbllandnoValue.Text = txtFixedLandline.Text;
                flblEmailValue.Text = txtEmail.Text;
                flblaltremailValue.Text = txtaltrEmail.Text;
                flbleducationValue.Text = txtEducation.Text;
                flbltechnicalValue.Text = txtTechnicalSkills.Text;
                flblaccesscodeValue.Text = txtFacultyAccessCode.Text;

                flblCountryValue.Text = ddlcountry.SelectedItem.Text;
                flblStateValue.Text = ddlstate.SelectedItem.Text;
                flblDistrictValue.Text = ddlDistrict.SelectedItem.Text;
                flblmandal.Text = ddlMandal.SelectedItem.Text;
                flblvillageValue.Text = ddlVillage.SelectedItem.Text;
                flblpinCodeValue.Text = txtpincode.Text;
                flblStreetNoValue.Text = txtstreetno.Text;
                flblStreetNameValue.Text = txtstreetname.Text;
                flblhouseNoValue.Text = txthouseno.Text;
                flblFlatNoValue.Text = txtFlatno.Text;
                flblLandMarkValue.Text = txtLandMark.Text;
                flblLocationValue.Text = txtLocation.Text;

                //lblSelectProgramValue.Text = ddlSelectProgram.Text;
                flblselgrValue.Text = ddlselectgroup.Text;
                flblselcategValue.Text = ddlselectcategory.Text;
                //lblselyearValue.Text = ddlselectyear.Text;
                flblselctsubValue.Text = ddlselectsubjects.Text;
                flblyrsmsheduValue.Text = ddlselectyearsemschedule.Text;
                flblcatescheduValue.Text = ddlselectcategoryschedule.Text;

            }

        }

        protected void ddlSubSchdDate_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}