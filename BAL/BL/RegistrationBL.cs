using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

using BAL.BE;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class RegistrationBL
    {
        /// To save student details
        /// </summary>
        /// <param name="objRegistrationEntity"></param>
        /// <returns></returns>
      //Councellor get No. of rows

        public SqlDataReader getCurrentRowFromCounsellorTable()
        {
            return ConnectionFactory.ExecuteCommand("Sp_GetCurrentCounsellerRow", CommandType.StoredProcedure);
        
        }

        #region UpdateCompanyRegistration
        public int UpdateCompanyRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[19];
            p[0] = new SqlParameter("@DetailsID", objRegistrationEntity.DetailsID);
            p[1] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[2] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[3] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[4] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[5] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[6] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[7] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[8] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);


            p[9] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[10] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[11] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[12] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[13] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[14] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[15] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[16] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[17] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[18] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);


            return ConnectionFactory.ExecuteUpdate("SP_UpdateCompanyProfile", CommandType.StoredProcedure, p);
        }
        #endregion UpdateCompanyRegistration

        #region UpdateAdminRegistration
        public int UpdateAdminRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[19];
            p[0] = new SqlParameter("@DetailsID", objRegistrationEntity.DetailsID);
            p[1] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[2] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[3] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[4] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[5] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[6] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[7] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[8] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);


            p[9] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[10] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[11] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[12] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[13] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[14] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[15] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[16] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[17] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[18] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);


            return ConnectionFactory.ExecuteUpdate("SP_UpdateAdminProfile", CommandType.StoredProcedure, p);
        }
        #endregion UpdateAdminRegistration

        #region UpdateStudentRegistration
        public int UpdateStudentRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[21];
            p[0] = new SqlParameter("@DetailsID", objRegistrationEntity.DetailsID);
            p[1] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[2] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[3] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[4] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[5] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[6] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[7] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[8] = new SqlParameter("@Qualification", objRegistrationEntity.Qualification);
            p[9] = new SqlParameter("@TechnicalSkills", objRegistrationEntity.TechnicalSkills);
            p[10] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);



            p[11] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[12] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[13] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[14] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[15] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[16] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[17] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[18] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[19] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[20] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);


            return ConnectionFactory.ExecuteUpdate("SP_UpdateStudentProfile", CommandType.StoredProcedure, p);
        }
        #endregion StudentRegistration

        #region Enquiry
        public SqlDataReader getEnquiryFormId()
        {
            return ConnectionFactory.ExecuteCommand("SP_getFormId", CommandType.StoredProcedure); 
        }

         public int EnquiryFormDetails(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[25];

            p[0] = new SqlParameter("@E_FormId", objRegistrationEntity.EFormId);
            p[1] = new SqlParameter("@E_FirstName", objRegistrationEntity.FirstName);
            p[2] = new SqlParameter("@E_LastName", objRegistrationEntity.LastName);
            p[3] = new SqlParameter("@E_MobileNumber", objRegistrationEntity.MobileNumber);
            p[4] = new SqlParameter("@E_LandLine", objRegistrationEntity.Fixed_LandlineNumber);
            p[5] = new SqlParameter("@E_Email", objRegistrationEntity.EmailID);
            p[6] = new SqlParameter("@E_AltEmail", objRegistrationEntity.OptionalEmailID);
            p[7] = new SqlParameter("@E_Qulification", objRegistrationEntity.Qualification);
            p[8] = new SqlParameter("@E_Technicalskills", objRegistrationEntity.TechnicalSkills);
            p[9] = new SqlParameter("@E_DoB", objRegistrationEntity.DateOfBirth);
            p[10] = new SqlParameter("@E_FatherName", objRegistrationEntity.Father_GaurdainName);
            p[11] = new SqlParameter("@E_FlatNo_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[12] = new SqlParameter("@E_HNo_DNo_PNo", objRegistrationEntity.HouseNO);
            p[13] = new SqlParameter("@E_StreetNo", objRegistrationEntity.StreetNO);
            p[14] = new SqlParameter("@E_StreetName", objRegistrationEntity.StreetName);
            p[15] = new SqlParameter("@E_Mandal_Taluk_SubUrb", objRegistrationEntity.SubUrban_Area);
            p[16] = new SqlParameter("@E_CountryId", objRegistrationEntity.CountryID);
            p[17] = new SqlParameter("@E_StateId", objRegistrationEntity.StateID);
            p[18] = new SqlParameter("@E_DistrictId", objRegistrationEntity.DistrictID);
            p[19] = new SqlParameter("@E_Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[20] = new SqlParameter("@E_Pincode", objRegistrationEntity.PostalCode);
            p[21] = new SqlParameter("@E_ProgramId", objRegistrationEntity.ProgramID);
            p[22] = new SqlParameter("@E_CategoryId", objRegistrationEntity.CategoryID);
            p[23] = new SqlParameter("@E_SubjectId", objRegistrationEntity.SubjectID);
            p[24] = new SqlParameter("@E_TitleInfo", objRegistrationEntity.EnquiryInformation);

            return ConnectionFactory.ExecuteUpdate("SP_EnquiryFormDetails_Insert", CommandType.StoredProcedure, p);
        }


         public SqlDataReader getEnquiryFroms(int CategoryId, int SubjectId)
         {
             SqlParameter[] p=new SqlParameter[2];
             p[0]=new SqlParameter("@CategoryId",CategoryId);
             p[1]=new SqlParameter("@SubjectId",SubjectId);
             return ConnectionFactory.ExecuteCommand("SP_GetEnquiryForm", CommandType.StoredProcedure, p);
         }

         public SqlDataReader CommunicationsFroms(int CategoryId, int SubjectId)
         {
             SqlParameter[] p = new SqlParameter[2];
             p[0] = new SqlParameter("@CateId", CategoryId);
             p[1] = new SqlParameter("@SubjectID", SubjectId);
             return ConnectionFactory.ExecuteCommand("SP_getCommunicationFormDetails", CommandType.StoredProcedure, p);
         }
         public SqlDataReader getFormDetailsByFormId(int formId)
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@getFormId", formId);
             return ConnectionFactory.ExecuteCommand("SP_getFormDetailsByFormId", CommandType.StoredProcedure,p);     
         }

         public SqlDataReader getFormRespondentDetailsByFormId(int formId)
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@getFormId", formId);
             return ConnectionFactory.ExecuteCommand("SP_getFormRespondentDetailsByFormId", CommandType.StoredProcedure, p);
         }
         public SqlDataReader GetEnquiryFormDetailsBySubject(int subjectId)
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@getSubjectId", subjectId);
             return ConnectionFactory.ExecuteCommand("SP_GetEnquiryFormDetailsBySubject", CommandType.StoredProcedure, p);
         }


         public SqlDataReader UpdateEnquiryFormStatus(int formId)
         {
             SqlParameter[] p = new SqlParameter[1];
             p[0] = new SqlParameter("@getFormId", formId);
             return ConnectionFactory.ExecuteCommand("SP_updateFormStatus", CommandType.StoredProcedure, p);
         }
        #endregion Enquiry


        #region StudentRegistration
        public int StudentRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[35];
            p[0] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[1] = new SqlParameter("@FirstName", objRegistrationEntity.FirstName);
            p[2] = new SqlParameter("@LastName", objRegistrationEntity.LastName);
            p[3] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[4] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[5] = new SqlParameter("@Father_GaurdainName", objRegistrationEntity.Father_GaurdainName);
            p[6] = new SqlParameter("@MotherMaidenName", objRegistrationEntity.MotherMaidenName);
            p[7] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[8] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[9] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[10] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[11] = new SqlParameter("@Qualification", objRegistrationEntity.Qualification);
            p[12] = new SqlParameter("@TechnicalSkills", objRegistrationEntity.TechnicalSkills);
            p[13] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);
            p[14] = new SqlParameter("@CompanyID", objRegistrationEntity.CompanyID);
            p[15] = new SqlParameter("@BranchID", objRegistrationEntity.BranchID);
            p[16] = new SqlParameter("@LocationID", objRegistrationEntity.LocationID);
            p[17] = new SqlParameter("@ProgramID", objRegistrationEntity.ProgramID);
            p[18] = new SqlParameter("@CategoryID", objRegistrationEntity.CategoryID);
            p[19] = new SqlParameter("@ActiveStatus", objRegistrationEntity.ActiveStatus);
            p[20] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[21] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[22] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[23] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[24] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[25] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[26] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[27] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[28] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[29] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);
            p[30] = new SqlParameter("@SubjectId", objRegistrationEntity.SubjectID);
            p[31] = new SqlParameter("@Location", objRegistrationEntity.Location);
            p[32] = new SqlParameter("@LandMarkName", objRegistrationEntity.LandMark_Name);
            p[33] = new SqlParameter("@AccessCode", objRegistrationEntity.AccessCode);
            p[34] = new SqlParameter("@Schedule_ID", objRegistrationEntity.Schedule_ID);
            return ConnectionFactory.ExecuteUpdate("SP_StudentRegistration", CommandType.StoredProcedure, p);
        }
        #endregion StudentRegistration

        #region FacultyRegistration
        public int FacultyRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[35];
            p[0] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[1] = new SqlParameter("@FirstName", objRegistrationEntity.FirstName);
            p[2] = new SqlParameter("@LastName", objRegistrationEntity.LastName);
            p[3] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[4] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[5] = new SqlParameter("@Father_GaurdainName", objRegistrationEntity.Father_GaurdainName);
            p[6] = new SqlParameter("@MotherMaidenName", objRegistrationEntity.MotherMaidenName);
            p[7] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[8] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[9] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[10] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[11] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);
            p[12] = new SqlParameter("@ProgramID", objRegistrationEntity.ProgramID);
            p[13] = new SqlParameter("@SubjectID", objRegistrationEntity.Subjects);
            p[14] = new SqlParameter("@AccessCode", objRegistrationEntity.AccessCode);
            p[15] = new SqlParameter("@ActiveStatus", objRegistrationEntity.ActiveStatus);

            p[16] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[17] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[18] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[19] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[20] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[21] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[22] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[23] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[24] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[25] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);

           
            p[26] = new SqlParameter("@Qualification", objRegistrationEntity.Qualification);
            p[27] = new SqlParameter("@TechnicalSkills", objRegistrationEntity.TechnicalSkills);
            p[28] = new SqlParameter("@Employer_Address", objRegistrationEntity.Employer_Address);
            p[29] = new SqlParameter("@Employer_Mail", objRegistrationEntity.Employer_Mail);
            p[30] = new SqlParameter("@Employer_Name", objRegistrationEntity.Employer_Name);
            p[31] = new SqlParameter("@Employer_Phone", objRegistrationEntity.Employer_Phone);
            p[32] = new SqlParameter("@workExperience", objRegistrationEntity.workExperience);
            p[33] = new SqlParameter("@LandMarkName", objRegistrationEntity.LandMark_Name);
            p[34] = new SqlParameter("@Location", objRegistrationEntity.Location);

            return ConnectionFactory.ExecuteUpdate("SP_FacultyRegistration", CommandType.StoredProcedure, p);
        }
        #endregion StudentRegistration

        #region AdminRegistration
        public int AdminRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[25];
            p[0] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            p[1] = new SqlParameter("@FirstName", objRegistrationEntity.FirstName);
            p[2] = new SqlParameter("@LastName", objRegistrationEntity.LastName);
            p[3] = new SqlParameter("@DateOfBirth", objRegistrationEntity.DateOfBirth);
            p[4] = new SqlParameter("@PlaceOfBirth", objRegistrationEntity.PlaceOfBirth);
            p[5] = new SqlParameter("@Father_GaurdainName", objRegistrationEntity.Father_GaurdainName);
            p[6] = new SqlParameter("@MotherMaidenName", objRegistrationEntity.MotherMaidenName);
            p[7] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[8] = new SqlParameter("@Fixed_LandlineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[9] = new SqlParameter("@EmailID", objRegistrationEntity.EmailID);
            p[10] = new SqlParameter("@OptionalEmailID", objRegistrationEntity.OptionalEmailID);
            p[11] = new SqlParameter("@ImageName", objRegistrationEntity.ImageName);
            p[12] = new SqlParameter("@AccessCode", objRegistrationEntity.AccessCode);
            p[13] = new SqlParameter("@ActiveStatus", objRegistrationEntity.ActiveStatus);

            p[14] = new SqlParameter("@HouseNO", objRegistrationEntity.HouseNO);
            p[15] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);
            p[16] = new SqlParameter("@StreetNO", objRegistrationEntity.StreetNO);
            p[17] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[18] = new SqlParameter("@CountryID", objRegistrationEntity.CountryID);
            p[19] = new SqlParameter("@StateID", objRegistrationEntity.StateID);
            p[20] = new SqlParameter("@DistrictID", objRegistrationEntity.DistrictID);
            p[21] = new SqlParameter("@Village_Town_City", objRegistrationEntity.Village_Town_City);
            p[22] = new SqlParameter("@SubUrban_Area", objRegistrationEntity.SubUrban_Area);
            p[23] = new SqlParameter("@PostalCode", objRegistrationEntity.PostalCode);
            p[24] = new SqlParameter("@LandMarkName", objRegistrationEntity.LandMark_Name);


            return ConnectionFactory.ExecuteUpdate("SP_AdminRegistration", CommandType.StoredProcedure, p);
        }
        #endregion StudentRegistration

        #region CompanyRegistration
        public int CompanyRegistration(CompanyBE objCompanyBE)
        {
            SqlParameter[] p = new SqlParameter[30];
            p[0] = new SqlParameter("@RoleName", objCompanyBE.RoleName);
            p[1] = new SqlParameter("@CompanyName", objCompanyBE.CompanyName);
            p[2] = new SqlParameter("@RegistrationDate", objCompanyBE.RegistrationDate);
            p[3] = new SqlParameter("@RegistrationNO", objCompanyBE.RegistrationNO);
            p[4] = new SqlParameter("@OfficePhoneNO", objCompanyBE.OfficePhoneNO);
            p[5] = new SqlParameter("@EmailID", objCompanyBE.EmailID);
            p[6] = new SqlParameter("@NoOfStudents", objCompanyBE.NoOfStudents);
            p[7] = new SqlParameter("@ProgramID", objCompanyBE.ProgramID);

            p[8] = new SqlParameter("@FirstName", objCompanyBE.FirstName);
            p[9] = new SqlParameter("@LastName", objCompanyBE.LastName);
            p[10] = new SqlParameter("@ImageName", objCompanyBE.ImageName);
            p[11] = new SqlParameter("@DateOfBirth", objCompanyBE.DateOfBirth);
            p[12] = new SqlParameter("@PlaceOfBirth", objCompanyBE.PlaceOfBirth);
            p[13] = new SqlParameter("@Father_GuardianName", objCompanyBE.Father_GuardianName);
            p[14] = new SqlParameter("@MotherMaidenName", objCompanyBE.MotherMaidenName);
            p[15] = new SqlParameter("@MobileNumber", objCompanyBE.MobileNumber);
            p[16] = new SqlParameter("@Fixed_LandlineNO", objCompanyBE.Fixed_LandlineNO);
            p[17] = new SqlParameter("@ContactPersonEmailID", objCompanyBE.ContactPersonEmailID);
            p[18] = new SqlParameter("@ContactPersonAlternativeEmailID", objCompanyBE.ContactPersonAlternativeEmailID);

            p[19] = new SqlParameter("@Flat_UnitNo", objCompanyBE.Flat_UnitNo);
            p[20] = new SqlParameter("@HouseNO", objCompanyBE.HouseNO);
            p[21] = new SqlParameter("@StreetNO", objCompanyBE.StreetNO);
            p[22] = new SqlParameter("@StreetName", objCompanyBE.StreetName);
            p[23] = new SqlParameter("@Village_Town_City", objCompanyBE.Village_Town_City);
            p[24] = new SqlParameter("@DistrictID", objCompanyBE.DistrictID);
            p[25] = new SqlParameter("@StateID", objCompanyBE.StateID);
            p[26] = new SqlParameter("@CountryID", objCompanyBE.CountryID);
            p[27] = new SqlParameter("@PostalCode", objCompanyBE.PostalCode);
            p[28] = new SqlParameter("@SubUrban_Area", objCompanyBE.SubUrban_Area);
            p[29] = new SqlParameter("@Branch_Count", objCompanyBE.BranchCount);

            return ConnectionFactory.ExecuteUpdate("SP_CompanyRegistration", CommandType.StoredProcedure, p);
        }
        #endregion CompanyRegistration

        #region GetRegisteredUsers
        public DataTable GetExistingUser(string firstName, string lastName,  string email, string mobile)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@FirstName", firstName);
            p[1] = new SqlParameter("@LastName", lastName);
            p[2] = new SqlParameter("@Email", email);
            p[3] = new SqlParameter("@Mobile", mobile);
           
            
            var student = ConnectionFactory.ExecuteCommandDs("SP_GetUser", CommandType.StoredProcedure, p);
            if (student != null && student.Tables.Count > 0)
                return student.Tables[0];
            else
                return null;
        }

        public SqlDataReader GetRegisteredUsers(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            return ConnectionFactory.ExecuteCommand("SP_GetRegisteredUsers", CommandType.StoredProcedure,p);
        }

        public SqlDataReader GetStudentRegisteredUsers(int CategoryID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CategoryID", CategoryID);
            return ConnectionFactory.ExecuteCommand("sp_GetStudentRegisteredUsers", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetFacultyRegisteredUsers()
        {
            return ConnectionFactory.ExecuteCommand("sp_GetFacultyRegisteredUsers", CommandType.StoredProcedure);
        }

        public SqlDataReader GetCounsellorRegisteredUsers()
        {
            return ConnectionFactory.ExecuteCommand("select *,C_FName+' '+C_LName as Name from tbl_Counsellor where ActiveStatus=0", CommandType.Text);
        }

        public SqlDataReader GetCompanyRegisteredUsers()
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,CompanyId,CompanyName,RegistrationNO,ROC_RegistrationDate,Branch_Count,EmailID,Status,DateofRegistration,OfficePhoneNO,FirstName,Location,SubUrban_Area from CompanyDetails where ActiveStatus=0", CommandType.Text);
        }
        public SqlDataReader GetAllUsers(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            return ConnectionFactory.ExecuteCommand("SP_GetAllUsers", CommandType.StoredProcedure, p);
        }
        #endregion GetRegisteredUsers 

        #region GetStudentActiveUsers
        public SqlDataReader GetStudentActiveUsers(string RoleName)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@RoleName", RoleName);
            return ConnectionFactory.ExecuteCommand("SP_ActiveUsers", CommandType.StoredProcedure,p);
        }

        public SqlDataReader GetFacutlyActiveUsers()
        {
            return ConnectionFactory.ExecuteCommand("sp_ActiveFacultyUsers", CommandType.StoredProcedure);
        }

        public SqlDataReader GetCounsellorActiveUsers()
        {
            return ConnectionFactory.ExecuteCommand("select *,C_FName+' '+C_LName as Name from tbl_Counsellor where ActiveStatus=1", CommandType.Text);
        }

        public SqlDataReader GetActiveCompanys()
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,CompanyID,CompanyName,RegistrationNO,ROC_RegistrationDate,EmailID,OfficePhoneNO,FirstName,Location,SubUrban_Area from CompanyDetails where ActiveStatus=1", CommandType.Text);
        }

        public SqlDataReader GetActiveCompanysBranch(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select B.BranchID,B.BranchName,B.BranchLocation,B.BranchArea,B.BranchOffice,B.RegistrationDate,C.CompanyName from (select * from tbl_CompanyBranch where CompanyID='" + CompanyID + "' and ActiveStatus=1)B join CompanyDetails C on C.DetailsID=B.CompanyDetailID", CommandType.Text);
        }

        public SqlDataReader GetStudentConfirmUsers(int CategoryID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CategoryID", CategoryID);
            return ConnectionFactory.ExecuteCommand("sp_ActiveStudents", CommandType.StoredProcedure,p);
        }
       
        public SqlDataReader GetStudentCancelUsers(int CategoryID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CategoryID", CategoryID);
            return ConnectionFactory.ExecuteCommand("sp_GetStudentRegistrationCancel", CommandType.StoredProcedure,p);
        }
        public SqlDataReader GetCounsellorCancelUsers()
        {
            return ConnectionFactory.ExecuteCommand("select *,C_FName+C_LName as Name from tbl_Counsellor where ActiveStatus=-1", CommandType.Text);
        }
        public SqlDataReader GetCompanyCancelUsers()
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,CompanyName,RegistrationNO,ROC_RegistrationDate,Branch_Count,EmailID,Status,DateofRegistration,OfficePhoneNO,FirstName from CompanyDetails where ActiveStatus=-1", CommandType.Text);
        }
        #endregion GetActiveUsers


        public SqlDataReader InsertCompanyBranch_Group(string CompanyId, string Company_BranchID, int CatrgoryID, int GroupID)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@CompanyId", CompanyId);
            p[1] = new SqlParameter("@Company_BranchID", Company_BranchID);
            p[2] = new SqlParameter("@CatrgoryID", CatrgoryID);
            p[3] = new SqlParameter("@GroupID", GroupID);
            return ConnectionFactory.ExecuteCommand("sp_InsertCompanyBranchGroupDetails", CommandType.StoredProcedure, p);
        }

        public SqlDataReader CompanyBranchDeactivate(string  BranchID, int GroupID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Company_BranchGroup set ActiveStatus=0,StatusDate=getdate(),Status='DeActivated' where Company_BranchID='"+BranchID+"' and GroupID="+GroupID, CommandType.Text);
        }

        public SqlDataReader StudentRegistrationCancel(int DetailsID)
        {
            return ConnectionFactory.ExecuteCommand("update Details set ActiveStatus=-1,StatusDate=getdate(),Status='Cancel' where DetailsID=" + DetailsID, CommandType.Text);
        }
        public SqlDataReader StudentCancelRegistrationActive(int DetailsID)
        {
            return ConnectionFactory.ExecuteCommand("update Details set ActiveStatus=0,StatusDate=getdate(),Status='Cancel' where DetailsID=" + DetailsID, CommandType.Text);
        }
        public SqlDataReader CounsellorRegistrationCancel(int ID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Counsellor set ActiveStatus=-1,StatusDate=getdate(),Status='Cancel' where SNo=" + ID, CommandType.Text);
        }
        public SqlDataReader CounsellorCancelRegistrationActivate(int ID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Counsellor set ActiveStatus=0,StatusDate=getdate(),Status='Re-Register' where SNo=" + ID, CommandType.Text);
        }
        public SqlDataReader CompanyRegistrationCancel(int ID)
        {
            return ConnectionFactory.ExecuteCommand("update CompanyDetails set ActiveStatus=-1,StatusDate=getdate(),Status='Cancel' where DetailsID=" + ID, CommandType.Text);
        }
        public SqlDataReader CompanyCancelRegistrationActivate(int ID)
        {
            return ConnectionFactory.ExecuteCommand("update CompanyDetails set ActiveStatus=0,StatusDate=getdate(),Status='Re-Register' where DetailsID=" + ID, CommandType.Text);
        }

        #region GetFacultyActiveUsers
        public SqlDataReader GetFacultyActiveUsers()
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@RoleName", "Faculty");
            return ConnectionFactory.ExecuteCommand("SP_ActiveUsers", CommandType.StoredProcedure,p);
        }
        #endregion GetActiveUsers 

        #region GetDeActiveUsers
        public SqlDataReader GetDeActiveUsers()
        {
            return ConnectionFactory.ExecuteCommand("SP_DeActiveUsers", CommandType.StoredProcedure);
        }
        #endregion GetDeActiveUsers

        #region ActivateRegisteredUsers
        public SqlDataReader ActivateRegisteredUsers(RegistrationBE objRegistrationEntity)
        {
            SqlParameter p = new SqlParameter();
            p.ParameterName = "@Activateuser";
            p.SqlDbType = System.Data.SqlDbType.Structured;
            p.Value = objRegistrationEntity.dtroles;

            return ConnectionFactory.ExecuteCommand("SP_ActivateRegisteredUsers", CommandType.StoredProcedure, p);
        }

        public SqlDataReader ActivateStudents(string UserID,string Pwd,int DetailsID,string RoleName)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@Pwd", Pwd);
            p[2] = new SqlParameter("@DetailsID", DetailsID);
            p[3] = new SqlParameter("@RoleName", RoleName);
            return ConnectionFactory.ExecuteCommand("sp_ActivateRegStudents", CommandType.StoredProcedure, p);
        }

        public SqlDataReader ActivateCounsellor(string UserID, string Pwd, int DetailsID)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@Pwd", Pwd);
            p[2] = new SqlParameter("@ID", DetailsID);
            return ConnectionFactory.ExecuteCommand("sp_ActivateRegCounsellor", CommandType.StoredProcedure, p);
        }

        public SqlDataReader ActivateCompany(string UserID, string Pwd, int DetailsID, string BranchID, string CompanyID, string BranchName, string Location, string Area)
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@Pwd", Pwd);
            p[2] = new SqlParameter("@DetailsID", DetailsID);
            p[3] = new SqlParameter("@BranchID", BranchID);
            p[4] = new SqlParameter("@CompanyID", CompanyID);
            p[5] = new SqlParameter("@BranchName", BranchName);
            p[6] = new SqlParameter("@BranchLocation", Location);
            p[7] = new SqlParameter("@BranchArea", Area);
            return ConnectionFactory.ExecuteCommand("sp_ActivateRegCompany", CommandType.StoredProcedure, p);
        }

        #endregion ActivateRegisteredUsers

        #region DeActivateRegisteredUsers
        public SqlDataReader DeActivateRegisteredUsers(RegistrationBE objRegistrationEntity)
        {
            SqlParameter p = new SqlParameter();
            p.ParameterName = "@Activateuser";
            p.SqlDbType = System.Data.SqlDbType.Structured;
            p.Value = objRegistrationEntity.dtroles;

            return ConnectionFactory.ExecuteCommand("SP_DeActivateRegisteredUsers", CommandType.StoredProcedure, p);
        }

        public SqlDataReader DeActivateStudents(int DetailsID)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@DetailsID", DetailsID);
            p[1] = new SqlParameter("@RoleName", "Student");
            return ConnectionFactory.ExecuteCommand("sp_DeActivateRegStudents", CommandType.StoredProcedure, p);
        }
        public SqlDataReader DeActivateFaculty(int DetailsID)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@DetailsID", DetailsID);
            p[1] = new SqlParameter("@RoleName", "Faculty");
            return ConnectionFactory.ExecuteCommand("sp_DeActivateRegStudents", CommandType.StoredProcedure, p);
        }
        public SqlDataReader DeActivateCounsellor(int DetailsID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DetailsID", DetailsID);
            return ConnectionFactory.ExecuteCommand("sp_DeActivateRegCounsellor", CommandType.StoredProcedure, p);
        }
        public SqlDataReader DeActivateCompany(string CompanyId)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CompanyId", CompanyId);
            return ConnectionFactory.ExecuteCommand("sp_DeActivateRegCompany", CommandType.StoredProcedure, p);
        }
        #endregion ActivateRegisteredUsers

        #region CounselarRegistration
        public int CounselarRegistration(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[31];

            p[0] = new SqlParameter("@CounsellorId", objRegistrationEntity.CounsellorId);
            p[1] = new SqlParameter("@C_FName", objRegistrationEntity.FirstName);
            p[2] = new SqlParameter("@C_LName", objRegistrationEntity.LastName);
            p[3] = new SqlParameter("@DOB", objRegistrationEntity.DateOfBirth);
            p[4] = new SqlParameter("@POB", objRegistrationEntity.PlaceOfBirth);
            p[5] = new SqlParameter("@C_FatherName", objRegistrationEntity.Father_GaurdainName);
            p[6] = new SqlParameter("@C_MotherName", objRegistrationEntity.MotherMaidenName);
            p[7] = new SqlParameter("@MobileNumber", objRegistrationEntity.MobileNumber);
            p[8] = new SqlParameter("@LandLineNumber", objRegistrationEntity.Fixed_LandlineNumber);
            p[9] = new SqlParameter("@EmailId", objRegistrationEntity.EmailID);
            p[10] = new SqlParameter("@Alt_EmailId", objRegistrationEntity.OptionalEmailID);
            p[11] = new SqlParameter("@CounsellorImage", objRegistrationEntity.ImageName);
            p[12] = new SqlParameter("@Edu_Qualification", objRegistrationEntity.Qualification);
            p[13] = new SqlParameter("@TechnicalSkills", objRegistrationEntity.TechnicalSkills);

            p[14] = new SqlParameter("@CountryId", objRegistrationEntity.CountryID);
            p[15] = new SqlParameter("@StateId", objRegistrationEntity.StateID);
            p[16] = new SqlParameter("@DistrictId", objRegistrationEntity.DistrictID);
            p[17] = new SqlParameter("@Mandal_Taluk_Suburb",SqlDbType.Int);
            p[17].Value = objRegistrationEntity.SubUrban_Area;

            p[18] = new SqlParameter("@Village_Town_City", SqlDbType.Int);
            p[18].Value=objRegistrationEntity.Village_Town_City;

            p[19] = new SqlParameter("@Pincode", objRegistrationEntity.PostalCode);
            p[20] = new SqlParameter("@StreetNo", objRegistrationEntity.StreetNO);
            p[21] = new SqlParameter("@StreetName", objRegistrationEntity.StreetName);
            p[22] = new SqlParameter("@HNo", objRegistrationEntity.HouseNO);
            p[23] = new SqlParameter("@Flat_UnitNo", objRegistrationEntity.Flat_UnitNo);

            p[24] = new SqlParameter("@LandMarkName", objRegistrationEntity.LandMark_Name);
            p[25] = new SqlParameter("@CounsellorLocation", objRegistrationEntity.Location);
            p[26] = new SqlParameter("@WorkExp", objRegistrationEntity.workExperience);
            p[27] = new SqlParameter("@EmployerName", objRegistrationEntity.Employer_Name);
            p[28] = new SqlParameter("@EmployerAddress", objRegistrationEntity.Employer_Address);
            p[29] = new SqlParameter("@EmployerPhone", objRegistrationEntity.Employer_Phone);
            p[30] = new SqlParameter("@EmployerEmailId", objRegistrationEntity.Employer_Mail);


            return ConnectionFactory.ExecuteUpdate("SP_CounsellorRegistration", CommandType.StoredProcedure, p);
           // return ConnectionFactory.ExecuteUpdate("SP_CounselarRegistration", CommandType.StoredProcedure, p);

            
        }
        #endregion StudentRegistration

        public SqlDataReader GetRegistraionDetails(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@DetailsId",objRegistrationEntity.DetailsID);
            p[1] = new SqlParameter("@RoleName", objRegistrationEntity.RoleName);
            return ConnectionFactory.ExecuteCommand("sp_GetRegistraionDetails", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetCompany()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetCompany", CommandType.StoredProcedure);
        }

        public SqlDataReader GetProgram()
        {
            return ConnectionFactory.ExecuteCommand("SP_DDLPrograms", CommandType.StoredProcedure);
        }

        public SqlDataReader GetCategories(RegistrationBE objRegistrationEntity)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Program_id", objRegistrationEntity.ProgramID);
            return ConnectionFactory.ExecuteCommand("SP_DDLCategories", CommandType.StoredProcedure, p);
        }

        //public SqlDataReader GetLocation(RegistrationBE objRegistrationEntity)
        //{
        //    SqlParameter[] p = new SqlParameter[1];
        //    p[0] = new SqlParameter("@value", objRegistrationEntity.Value);
        //    return ConnectionFactory.ExecuteCommand("SP_GetLocation", CommandType.StoredProcedure, p);
        //} 


        public SqlDataReader GetSubjectIDs(int DetailsID)
        {
            string a = "select S.Subject_Id,D.UserID from tbl_Subject S cross join (select UserID from Details where DetailsID=" + DetailsID + ")D where Branch_Id=(select BranchID from Details where DetailsID=" + DetailsID + ")";
            return ConnectionFactory.ExecuteCommand(a, CommandType.Text);
        }
        public SqlDataReader PublishSubjectsToStudents(string values)
        {
            return ConnectionFactory.ExecuteCommand("insert into tbl_StudentSubjects_Publish(Student_Id,UserID,Subject_Id,Status,StatusDate,ActiveStatus) values"+values , CommandType.Text);
        }
        public SqlDataReader GetUnits(int SubjectID, int DetailsID)
        {
            return ConnectionFactory.ExecuteCommand(" select U.Unit_Id,D.UserID from tbl_Units U cross join(select UserID from Details where DetailsID="+DetailsID+")D where Subject_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader PublishUnitsToStudents(string values)
        {
            return ConnectionFactory.ExecuteCommand("insert into tbl_StudentUnits_Publish(Student_Id,UserID,Unit_Id,Status,StatusDate,ActiveStatus) values" + values, CommandType.Text);
        }
        public SqlDataReader UnPublishSubjectsToStudents(int UserID)
        {
            return ConnectionFactory.ExecuteCommand("delete tbl_StudentSubjects_Publish where UserID=(select UserID from Details where DetailsID=" + UserID + ")", CommandType.Text);
        }
        public SqlDataReader UnPublishUnitsToStudents(int UserID)
        {
            return ConnectionFactory.ExecuteCommand("delete tbl_StudentUnits_Publish where UserID=(select UserID from Details where DetailsID=" + UserID + ")", CommandType.Text);
        }
    }
}
