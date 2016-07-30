using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class Program_Entities
    {
        public int ProgramId { get; set; }
        public string ProgramName { get; set; }
        public DateTime ProgramRegistrationDate { get; set; }
        public int ProgramCategories { get; set; }
        public string ProgramStatus { get; set; }
        public DateTime ProgramStatusDate { get; set; }
        public string ProgramRemarks { get; set; }
    }
}
