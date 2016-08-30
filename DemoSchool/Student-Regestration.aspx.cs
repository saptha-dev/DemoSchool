using BAL.BE;
using BAL.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
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
                LoadCategory();
            }

        }
        public void LoadCategory()
        {
            SqlDataReader dr = objReg.GetCategories();
            DataTable dt = new DataTable();
            dt.Load(dr);
            ddladdCategory.Items.Clear();
            ddladdCategory.DataSource = dt;
            ddladdCategory.DataTextField = "Category_Name";
            ddladdCategory.DataValueField = "Category_Id";
            ddladdCategory.DataBind();

            ddladdCategory.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void ddlselectcategoryschedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryId = Utils.ToInt(ddladdCategory.SelectedItem.Value);
            string catScheduleId = ddlselectcategoryschedule.SelectedItem.Value;
            LoadGroups(categoryId, catScheduleId);
        }

        public void ddladdCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddladdCategory.SelectedValue != "0")
            {
                LoadCategorySchdule();
            }
            else
            {
                ddlGroup.Items.Clear();
                ddlselectcategoryschedule.Items.Clear();
            }
        }

        private void LoadGroups(int categoryId, string categoryScheduleId)
        {
            SqlDataReader dr = objBL.GetGroups(categoryId, categoryScheduleId);
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlGroup.Items.Clear();
                ddlGroup.DataSource = dt;
                ddlGroup.DataValueField = "Branch_Id";
                ddlGroup.DataTextField = "Group_Year_Sem_Schedule";
                ddlGroup.DataBind();
                ddlGroup.Items.Insert(0, new ListItem("---Select---", "0"));
            }
            else
            {
                ddlGroup.Items.Clear();
            }
        }

        private void LoadCategorySchdule()
        {
            SqlDataReader dr = objBL.GetCategorySchdule(Convert.ToInt32(ddladdCategory.SelectedValue));
            DataTable dt = new DataTable();
            dt.Load(dr);
            if (dt.Rows.Count > 0)
            {
                ddlselectcategoryschedule.Items.Clear();
                ddlselectcategoryschedule.DataSource = dt;
                ddlselectcategoryschedule.DataValueField = "Schedule_Id";
                ddlselectcategoryschedule.DataTextField = "Schedule_Id_Date";
                ddlselectcategoryschedule.DataBind();
                ddlselectcategoryschedule.Items.Insert(0, new ListItem("---Select---", "0"));
            }
        }

        //private void LoadYearOrSemSchdule()
        //{
        //    SqlDataReader dr = objBL.GetYearOrSemSchdule(Convert.ToInt32(ddladdCategory.SelectedValue));
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddladdsemister.Items.Clear();
        //        ddladdsemister.DataSource = dt;
        //        ddladdsemister.DataValueField = "Branch_T_Years";
        //        ddladdsemister.DataTextField = "Branch_T_Years";
        //        ddladdsemister.DataBind();
        //        ddladdsemister.Items.Insert(0, new ListItem("---Select---", "0"));
        //    }
        //}

        protected void ddlGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoryScheduleId = ddlselectcategoryschedule.SelectedItem.Value;
            int categoryId = Convert.ToInt32(ddladdCategory.SelectedItem.Value);
            int branchId = Utils.ToInt(ddlGroup.SelectedItem.Value);
            var dt = objBL.GetCategorySubjectDetails(categoryId, categoryScheduleId, branchId);
            if (dt != null && dt.Rows.Count > 0)
            {
                DataPanel.Visible = true;
                gvSubjectsSchedule.DataSource = dt.DefaultView;
                gvSubjectsSchedule.DataBind();
            }
            else
                DataPanel.Visible = false;

            //Get the mandatory subject for the selected group
            var dtSubjects = objBL.GetMandatoryGroupSubjects(categoryId, categoryScheduleId, branchId);
            if (dtSubjects != null && dtSubjects.Rows.Count > 0)
            {
                lblGroupSubjects.Visible = true;
                StringBuilder sbSubjects = new StringBuilder();
                
                foreach(DataRow dr in dtSubjects.Rows)
                {
                    sbSubjects.AppendFormat("{0},", dr["Subject_Name"].ToString());
                }
                lblGroupSubjects.Text = string.Format("Please select {0} from the subjects schedule", sbSubjects.ToString().TrimEnd(','));
            }
            else
            {
                lblGroupSubjects.Visible = false;
            }
            
        }

        ////protected void DDlYear_SelectedIndexChanged(object sender, EventArgs e)
        ////{
        ////    int programId = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
        ////    int branchId = Convert.ToInt32(ddlGroup.SelectedItem.Value);

        ////    SqlDataReader dr = objStudentBL.GetSubjects(25, 13, 27);
        ////    DataTable dt = new DataTable();
        ////    dt.Load(dr);
        ////    if (dt.Rows.Count > 0)
        ////    {
        ////        ddlSubjects.DataSource = dt;
        ////        ddlSubjects.DataValueField = "Subject_Id";
        ////        ddlSubjects.DataTextField = "Subject_Name";
        ////        ddlSubjects.DataBind();
        ////        ddlSubjects.Items.Insert(0, new ListItem("--Select--", "0"));
        ////    }

        //    //LoadSubjectsSchedule();
        //}

        //protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
        //private void LoadSubjectsSchedule()
        //{
        //    //int programId = Convert.ToInt32(ddlProgram.SelectedItem.Value);
        //    //int branchId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
        //    int categoryId = Convert.ToInt32(ddladdCategory.SelectedItem.Value);

        //    SqlDataReader dr = objBL.GetSubjectsSchedule(categoryId);
        //    DataTable dt = new DataTable();
        //    dt.Load(dr);
        //    if (dt.Rows.Count > 0)
        //    {
        //        ddlSubSchdDate.DataSource = dt;
        //        ddlSubSchdDate.DataValueField = "Subject_ScheduleID";
        //        ddlSubSchdDate.DataTextField = "Subject_ScheduleID_Date";
        //        ddlSubSchdDate.DataBind();
        //        ddlSubSchdDate.Items.Insert(0, new ListItem("--Select--", "0"));
        //    }
        //}
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
            if (rdonewUser.Checked)
            {
               
            }
        }

        private void RegisterNewUser()
        {
            RegistrationBE newReg1 = new RegistrationBE();
            try
            {
                newReg1.RoleName = rolename;
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
                newReg1.AccessCode = txtStudentAccescode.Text;
                newReg1.ImageName = "image";
                newReg1.CountryID = Convert.ToInt32(ddlcountry.SelectedItem.Value);
                newReg1.StateID = Convert.ToInt32(ddlstate.SelectedItem.Value);
                newReg1.DistrictID = Convert.ToInt32(ddlDistrict.SelectedItem.Value);
                newReg1.Village_Town_City = ddlVillage.SelectedItem.Value;
                newReg1.SubUrban_Area = ddlMandal.SelectedItem.Value;
                newReg1.PostalCode = 8686;
                newReg1.StreetNO = txtstreetno.Text;
                newReg1.StreetName = txtstreetname.Text;
                newReg1.HouseNO = txthouseno.Text;
                newReg1.Flat_UnitNo = txtFlatno.Text;
                newReg1.LandMark_Name = txtLandMark.Text;
                newReg1.Location = txtLocation.Text;
                // newReg1.ProgramID = Convert.ToInt32(ddladdProgram.SelectedItem.Value);
                newReg1.ProgramID = 111;
                newReg1.BranchID = 8686;
                newReg1.LocationID = 88;

                newReg1.CategoryID = Utils.ToInt(ddladdCategory.SelectedItem.Value);
                newReg1.Schedule_ID = ddlselectcategoryschedule.SelectedItem.Value;
                //newReg1.YearId = DDlYear.SelectedItem.Value;
                //newReg1.Schedule_ID = ddladdsemister.SelectedItem.Value;
                //newReg1.Subjects = ddlSubjects.SelectedItem.Value;
                //newReg1.GroupId = Convert.ToInt32(ddlGroup.SelectedItem.Value);
                objReg.StudentRegistration(newReg1);
                lblResultstud.Text = "Student data saved sucessfully";
            }
            catch(Exception ex)
            {
                string msg = ex.ToString();
                lblResultstud.Text = "Error Occured While saving the Student Data";
            }
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
                PnlExistingUser.Visible = false;
                PnlPaymentInfo.Visible = false;
                //ShowExistingUserControls(false);
            }
            else if (rdoexisting.Checked == true)
            {
                PnlExistingUser.Visible = true;
                PnlPaymentInfo.Visible = false;
                //ShowExistingUserControls(true);
            }
            else if (rdoPayment.Checked == true)
            {
                PnlPaymentInfo.Visible = true;
                PnlExistingUser.Visible = false;
            }
        }

        private void ShowExistingUserControls(bool visible)
        {
            lblUserTypeError.Visible = visible;
            
            //lbFname1.Visible = visible;
            //studentFname.Visible = visible;
            //lbLname1.Visible = visible;
            //studentLname.Visible = visible;
            //lblMobileNumber1.Visible = visible;
            //studentMobilenumber.Visible = visible;
            //lblEmail1.Visible = visible;
            //studentEmail.Visible = visible;
            //lblsdob.Visible = visible;
            //studentDate.Visible = visible;

        }

        protected void Wizardstudentreg_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {
            if (!IsValid)
            {
                Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.ActiveStepIndex - 1;
            }
            GetClassForWizardStep(sender);
            List<StudentRegProgram> subjectsList = new List<StudentRegProgram>();
            lblProgramErrors.Visible = false;
            if (rdoexisting.Checked && Wizardstudentreg.ActiveStepIndex == 0)
            {
                GetExistingUserDetails();

            }
            else if(rdonewUser.Checked && Wizardstudentreg.ActiveStepIndex == 2)
            {
                //save the student details
                RegisterNewUser();
                GetExistingUserDetails();
            }
            else if (Wizardstudentreg.ActiveStepIndex == 3)
            {
                SaveSubjectSchdeules(subjectsList);
                lblProgramErrors.Text = String.Empty;
                
                //else if (subjectsList.Count != gvGroupSubjcts.Rows.Count)
                //{
                //    lblProgramErrors.Visible = true;
                //    lblProgramErrors.Text = "Selected subjects are not matching required subjects";
                //}

                DisplaySummary();
            }

            if (Wizardstudentreg.ActiveStepIndex == 4)
            {
                //paymentProgram.Text = ddladdProgram.SelectedItem != null ? ddladdProgram.SelectedItem.Text : string.Empty;
                paymentGroup.Text = ddlGroup.SelectedItem != null ? ddlGroup.SelectedItem.Text : string.Empty; ;
                paymentCategory.Text = ddladdCategory.SelectedItem != null ? ddladdCategory.SelectedItem.Text : string.Empty; ;
                //paymentYear.Text = DDlYear.SelectedItem != null ? DDlYear.SelectedItem.Text : string.Empty; ;
                //paymentSubject.Text = ddlSubjects.SelectedItem != null ? ddlSubjects.SelectedItem.Text : string.Empty;
                //paymentYearSem.Text = ddladdsemister.SelectedItem != null ? ddladdsemister.SelectedItem.Text : string.Empty; ;
                paymentCategorySchedule.Text = ddlselectcategoryschedule.SelectedItem != null ? ddlselectcategoryschedule.SelectedItem.Text : string.Empty;
            }
        }

        private void SaveSubjectSchdeules(List<StudentRegProgram> subjectsList)
        {
            foreach (GridViewRow row in gvSubjectsSchedule.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = row.Cells[0].FindControl("chkSubjectId") as CheckBox;
                    if (chkRow.Checked)
                    {
                        StudentRegProgram program = new StudentRegProgram();
                        //HiddenField hdnSubjectId = row.Cells[0].FindControl("SubjectId") as HiddenField;
                        HiddenField hdnCompanyId = row.Cells[0].FindControl("CompanyId") as HiddenField;
                        HiddenField hdnBranch = row.Cells[0].FindControl("Branch") as HiddenField;
                        if (hdnBranch != null && hdnCompanyId != null)
                        {
                            
                            program.CompanyId = hdnCompanyId.Value;
                            program.CompanyBranch = hdnBranch.Value;
                        }
                        program.CategoryId = Utils.ToInt(ddladdCategory.SelectedItem.Value);
                        program.ScheduleId = ddlselectcategoryschedule.SelectedItem.Value;
                        var subSchedule = row.Cells[2].Text;
                        if (!String.IsNullOrEmpty(subSchedule))
                        {
                            // SUB30: (01-05-2016:29-07-2016) format
                            var temp = subSchedule.Split(':');
                            program.Subject_ScheduleId = temp[0];
                            string dateFormatType = "dd-MM-yyyy";
                            program.SubjectStartDate = DateTime.ParseExact(temp[1].Trim().TrimStart('('), dateFormatType, CultureInfo.InvariantCulture);
                            program.SubjctEndDate = DateTime.ParseExact(temp[2].Trim().TrimEnd(')'), dateFormatType, CultureInfo.InvariantCulture);
                        }
                        var orgLocation = row.Cells[4].Text;
                        {
                            if (!String.IsNullOrEmpty(orgLocation))
                            {
                                //SMT-M:Madapur
                                var temp = orgLocation.Split(':');
                                program.BranchLocation = temp[1];

                            }
                        }
                        var classDate = row.Cells[5].Text;
                        if (!String.IsNullOrEmpty(classDate))
                        {
                            var temp = classDate.Split(':');
                            program.ClassStartDate = DateTime.ParseExact(temp[0].Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                            program.ClassEndDate = DateTime.ParseExact(temp[1].Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                        }
                        var subject = row.Cells[1].Text;
                        if (!String.IsNullOrEmpty(subject))
                        {
                            var temp = subject.Split(':');
                            program.SubjectId = Utils.ToInt(temp[0].Trim());
                            program.SubjectName = temp[1].Trim();
                        }
                        program.ClassTime = row.Cells[6].Text;
                        subjectsList.Add(program);
                    }
                }
            }
            if (subjectsList.Count == 0)
            {
                lblProgramErrors.Visible = true;
                lblProgramErrors.Text = "Please select the subject schedules";
            }
            //Add student program details
            foreach (var subject in subjectsList)
            {
                subject.StudentId = Utils.ToInt(lblDetailsId.Text);
                subject.UserId = lblFirstNameValue.Text;
                objStudentBL.AddStudentProgram(subject);
            }
        }

        private void GetExistingUserDetails()
        {
            RegistrationBL objebl1 = new RegistrationBL();
            var user = objebl1.GetExistingUser(studentFname.Text, studentLname.Text, studentMobilenumber.Text, studentEmail.Text, studentDate.Value, rolename);
            if (user != null && user.Rows.Count > 0)
            {
                DataRow dr = user.Rows[0];
                lblUserTypeError.Text = string.Empty; //Clear the error message
                lblDetailsId.Text = dr["DetailsID"].ToString();
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
                //  ddlVillage.Text = dr["Village_Town_City"].ToString();
                //ddlMandal.Text = dr["SubUrban_Area"].ToString();
                ddladdCategory.DataTextField = dr["CategoryID"].ToString();
                // ddlselectgroup.DataTextField = dr["GroupId"].ToString();
                //ddlselectyear.DataTextField = dr["YearId"].ToString();
                // ddlselectsubjects.DataTextField = dr["Subjects"].ToString();
                // ddlselectyearsemschedule.DataTextField = dr["Schedule_ID"].ToString();

            }
            else
            {
                //User doesn't exists
                lblDetailsId.Text = string.Empty;
            }
        }

        private void DisplaySummary()
        {
            lblFirstNameValue.Text = txtFirstName.Text;
            lblLastNameValue.Text = txtLastName.Text;
            lblFatherNameValue.Text = txtfathergurdianname.Text;
            lblMotherMaidenNameValue.Text = txtMothername.Text;
            lblPobValue.Text = txtpob.Text;
            lblMobileNumberValue.Text = txtmobile.Text;
            lblLandLineNumberValue.Text = txtFixedLandline.Text;
            lblEmailIdValue.Text = txtEmail.Text;
            lblAlterEmailIdValue.Text = txtaltrEmail.Text;
            lblEductionValue.Text = txtEducation.Text;
            lblTechnicalSkillValue.Text = txtTechnicalSkills.Text;
            lblStudentAccessCodeValue.Text = txtStudentAccescode.Text;

            lblCountryValue.Text = ddlcountry.SelectedItem.Text;
            lblStateValue.Text = ddlstate.SelectedItem.Text;
            lblDistrictValue.Text = ddlDistrict.SelectedItem.Text;
            lblManadalTalukValue.Text = ddlMandal.SelectedItem.Text;
            lblVillageTownValue.Text = ddlVillage.SelectedItem.Text;
            lblPinCodeValue.Text = txtpincode.Text;
            lblStreetNoValue.Text = txtstreetno.Text;
            lblStreetNameValue.Text = txtstreetname.Text;
            lblHousePlotNoValue.Text = txthouseno.Text;
            lblBuildingLandMarkValue.Text = txtLandMark.Text;
            lblFlatNoValue.Text = txtFlatno.Text;
            lblLandLineNumberValue.Text = txtLandMark.Text;
            lblStudentLocationValue.Text = txtLocation.Text;


            //lblSelectProgramValue.Text = ddladdProgram.SelectedItem != null ? ddladdProgram.SelectedItem.Text : string.Empty;
            lblSelectCategoryValue.Text = ddladdCategory.SelectedItem != null ? ddladdCategory.SelectedItem.Text : string.Empty; ;
            lblSelectGroupValue.Text = ddlGroup.SelectedItem != null ? ddlGroup.SelectedItem.Text : string.Empty; ;
            lblSelectedCategeorySheduleValue.Text = ddlselectcategoryschedule.SelectedItem != null ? ddlselectcategoryschedule.SelectedItem.Text : string.Empty;
            //lblSelectYearValue.Text = DDlYear.SelectedItem != null ? DDlYear.SelectedItem.Text : string.Empty; ;
            //lblSelectSubjectsValue.Text = ddlSubjects.SelectedItem != null ? ddlSubjects.SelectedItem.Text : string.Empty;
            //lblSelectYearSemSheduleValue.Text = ddladdsemister.SelectedItem != null ? ddladdsemister.SelectedItem.Text : string.Empty; ;


            //int programId = Utils.ToInt(ddladdProgram.SelectedItem.Value);
            int categoryId = Utils.ToInt(ddladdCategory.SelectedItem.Value);
            string catscheduleId = ddlselectcategoryschedule.SelectedItem.Text;
            int groupId = Utils.ToInt(ddlGroup.SelectedItem.Value);
            //int yearId = Utils.ToInt(DDlYear.SelectedItem.Value);
            //int subjectId = Utils.ToInt(ddlSubjects.SelectedItem.Value);
            //int semScheduleId = Utils.ToInt(ddladdsemister.SelectedItem.Value);

            //var payment = objStudentBL.GetProgramAmount(categoryId, catscheduleId, groupId, semScheduleId);
            //if (payment != null && payment.Rows.Count > 0)
            //{
            //    DataRow dr = payment.Rows[0];
            //    lblprogramAmount.Text = dr["Amount"].ToString();
            //    lblprogAmount.Text = dr["Amount"].ToString();
            //}
        }

        protected void Wizardstudentreg_ActiveStepChanged(object sender, EventArgs e)
        {
            if (Wizardstudentreg.ActiveStepIndex == Wizardstudentreg.WizardSteps.IndexOf(this.WizardSummary))
            {
                if (!(String.IsNullOrEmpty(lblProgramErrors.Text)))
                {
                    Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.WizardSteps.IndexOf(this.WizardStep3);
                }
            }
            else if (Wizardstudentreg.ActiveStepIndex == Wizardstudentreg.WizardSteps.IndexOf(this.WizardStep1))
            {
                if (rdoexisting.Checked &&  lblDetailsId.Text.Trim().Length > 0)
                {
                    Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.WizardSteps.IndexOf(this.WizardStep3);
                }
                else if (rdonewUser.Checked == false)
                {
                    lblUserTypeError.Text = "Please enter valid details";
                    Wizardstudentreg.ActiveStepIndex = Wizardstudentreg.WizardSteps.IndexOf(this.WizardUserType);
                }
            }
            if (rdonewUser.Checked && Wizardstudentreg.ActiveStepIndex == Wizardstudentreg.WizardSteps.IndexOf(this.WizardStep2))
            {
                Wizardstudentreg.StepNextButtonText = "Save";
            }

        }
    }
}