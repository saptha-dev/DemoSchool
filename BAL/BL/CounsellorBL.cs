using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BAL.BE;
using DAL;
using System.Data.SqlClient;
using System.Data;
namespace BAL.BL
{
    public class CounsellorBL
    {

        public SqlDataReader AddEmail(AddEmail obj)
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@FirstName", obj.FirstName);
            p[1] = new SqlParameter("@LastName", obj.LastName);
            p[2] = new SqlParameter("@EmailId", obj.EmailId);
            p[3] = new SqlParameter("@Location", obj.Location);
            p[4] = new SqlParameter("@Designation", obj.Designation);

            return ConnectionFactory.ExecuteCommand("sp_SaveEmailId", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetEnquiryDetails(int programId,int CateId,int SubjectID)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@programId", programId);
            p[1] = new SqlParameter("@CateId", CateId);
            p[2] = new SqlParameter("@SubjectID", SubjectID);

            return ConnectionFactory.ExecuteCommand("sp_GetEnquiryDetails", CommandType.StoredProcedure, p);
        }


        public SqlDataReader GetCounsellorDetails(string UserId)
        {
            SqlParameter[] p=new SqlParameter[1];
            p[0] = new SqlParameter("@CounsellorId", UserId);
            return ConnectionFactory.ExecuteCommand("SP_GetCounsellorDetails", CommandType.StoredProcedure,p);
        }

        public SqlDataReader LoadImage(string UserId)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CounsellorId", UserId);
            return ConnectionFactory.ExecuteCommand("SP_LoadImages", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateConsellorProfile(RegistrationBE rbe)
        {
            SqlParameter[] p=new SqlParameter[24];

            p[0] = new SqlParameter("@C_FName", rbe.FirstName);
            p[1] = new SqlParameter("@C_LName", rbe.LastName);
            p[2] = new SqlParameter("@C_FatherName", rbe.Father_GaurdainName);
            p[3] = new SqlParameter("@C_MotherName", rbe.MotherMaidenName);
            p[4] = new SqlParameter("@DOB", rbe.DateOfBirth);
            p[5] = new SqlParameter("@POB", rbe.PlaceOfBirth);
            p[6] = new SqlParameter("@LandLineNumber", rbe.Fixed_LandlineNumber);
            p[7] = new SqlParameter("@MobileNumber", rbe.MobileNumber);
            p[8] = new SqlParameter("@EmailId", rbe.EmailID);
            p[9] = new SqlParameter("@Flat_UnitNo", rbe.Flat_UnitNo);
            p[10] = new SqlParameter("@HNo", rbe.HouseNO);
            p[11] = new SqlParameter("@LandMarkName", rbe.LandMark_Name);
            p[12] = new SqlParameter("@DistrictId", rbe.DistrictID);
            p[13] = new SqlParameter("@StateId", rbe.StateID);
            p[14] = new SqlParameter("@CountryId", rbe.CountryID);
            p[15] = new SqlParameter("@Pincode", rbe.PostalCode);
            p[16] = new SqlParameter("@Edu_Qualification", rbe.Qualification);
            p[17] = new SqlParameter("@TechnicalSkills", rbe.TechnicalSkills);
            p[18] = new SqlParameter("@WorkExp", rbe.workExperience);
            p[19] = new SqlParameter("@EmployerName", rbe.Employer_Name);
            p[20] = new SqlParameter("@EmployerPhone", rbe.Employer_Phone);
            p[21] = new SqlParameter("@EmployerAddress", rbe.Employer_Address);
            p[22] = new SqlParameter("@CounsellorLocation", rbe.Location);
            p[23]=new SqlParameter("@CounsellorId",rbe.CounsellorId);
            return ConnectionFactory.ExecuteCommand("SP_UpdateCounsellorProfile", CommandType.StoredProcedure, p);
        }

        


    }
}
