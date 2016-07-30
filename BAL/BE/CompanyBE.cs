using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class CompanyBE
    {
        public string RoleName { get; set; }
        public string CompanyName { get; set; }
        public DateTime RegistrationDate { get; set; }
        public string RegistrationNO { get; set; }
        public string OfficePhoneNO { get; set; }
        public string EmailID { get; set; }
        public int NoOfStudents { get; set; }
        public int ProgramID { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ImageName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string PlaceOfBirth { get; set; }
        public string Father_GuardianName { get; set; }
        public string MotherMaidenName { get; set; }
        public string MobileNumber { get; set; }
        public string Fixed_LandlineNO { get; set; }
        public string ContactPersonEmailID { get; set; }
        public string ContactPersonAlternativeEmailID { get; set; }

        public int DetailsID { get; set; }


        public string landmark { get; set; }
        public string Flat_UnitNo { get; set; }
        public string HouseNO { get; set; }
        public string StreetNO { get; set; }
        public string StreetName { get; set; }
        public string Village_Town_City { get; set; }
        public int DistrictID { get; set; }
        public int StateID { get; set; }
        public int CountryID { get; set; }
        public int PostalCode { get; set; }
        public string SubUrban_Area { get; set; }
        public int BranchCount { get; set; }
        public string macaddress { get; set; }
    }
}
