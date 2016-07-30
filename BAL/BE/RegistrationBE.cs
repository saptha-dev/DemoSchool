using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BAL.BE
{
    public class RegistrationBE
    {
      
        //public string Fname { get; set; }
        //public string Lname { get; set; }
        //public string Username { get; set; }
        //public string Password { get; set; }
        //public DateTime Dob { get; set; }
        //public string Fathername { get; set; }
        //public string MotherMaidenName { get; set; }
        //public string Emailid { get; set; }
        //public string Mobilenumber { get; set; }
        //public string Education { get; set; }
        //public string Image { get; set; }
        //public string FlatNo { get; set; }
        //public string HouseNo { get; set; }
        //public string StreetNo { get; set; }
        //public string StreetName { get; set; }
        //public string City { get; set; }
        //public string District { get; set; }
        //public string State { get; set; }
        //public string Country { get; set; }
        //public int Postalcode { get; set; }
        //public string RoleType { get; set; }
        //public long Course_id { get; set; }
        //public int PaidStaus { get; set; }
        //public int UserStatus { get; set; }
        //public DateTime DateofRegistration { get; set; }
        //public string TechnicalSkills { get; set; }
        //public int Company { get; set; }
        //public int Branch { get; set; }
        //public int Location { get; set; }
        //public int Program { get; set; }
        //public int Category { get; set; }
        //public int Value { get; set; }

        public int EFormId { get; set; }
        public string CounsellorId { get; set; }
        public string RoleName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string PlaceOfBirth { get; set; }
        public string Father_GaurdainName { get; set; }
        public string MotherMaidenName { get; set; }
        public string MobileNumber { get; set; }
        public string Fixed_LandlineNumber { get; set; }
        public string EmailID { get; set; }
        public string OptionalEmailID { get; set; }
        public string Qualification { get; set; }
        public string TechnicalSkills { get; set; }
        public string ImageName { get; set; }
        public string AccessCode { get; set; }
        public DataTable dtroles { get; set; }
        public int GroupId { get; set; }
        public string YearId { get; set; }
        public string Schedule_ID { get; set; }


        public int CompanyID { get; set; }
        public int? BranchID { get; set; }
        public int? LocationID { get; set; }
        public int? ProgramID { get; set; }
        public int CategoryID { get; set; }
        public int SubjectID { get; set; }
        public int ActiveStatus { get; set; }

        public DateTime DateofRegistration { get; set; }

        public int DetailsID { get; set; }
        public string Flat_UnitNo { get; set; }
        public string HouseNO { get; set; }
        public string StreetNO { get; set; }
        public string StreetName { get; set; }
        public string Village_Town_City { get; set; }
        public int? DistrictID { get; set; }
        public int? StateID { get; set; }
        public int? CountryID { get; set; }
        public int? PostalCode { get; set; }
        public string SubUrban_Area { get; set; }
        public string EnquiryInformation { get; set; }

        public string Location { get; set; }

        //Employer Details
        public int workExperience { get; set; }
        public string Employer_Name { get; set; }
        public string Employer_Address { get; set; }
        public string Employer_Phone { get; set; }
        public string Employer_Mail { get; set; }
        public string LandMark_Name { get; set; }

        public string Subjects { get; set; }
    }
}
