using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class AddCategories
    {
        public int ProgramId { get; set; }
        public int Category_Id { get; set; }
        public string CategoryName { get; set; }
        public DateTime CategorRegDate { get; set; }
        public int CategorSubjects { get; set; }
        public string CategoryEligibility { get; set; }
        public string Remarks { get; set; }
        public string Year { get; set; }
        public string Branch { get; set; }
        public int CategorGroups { get; set; }

        public DateTime CategorStartDate { get; set; }
        public DateTime CategorEndDate { get; set; }
        public DateTime CategorStatusDate { get; set; }
        public string Status { get; set; }

    }
}
