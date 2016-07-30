using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class AddGroupcs
    {
       public int Branch_Id { get; set; }
        public int Category_Id { get; set; }
        public string Branch_Name { get; set; }
        public DateTime SubjectRegDate { get; set; }
        public int Branch_T_Years { get; set; }
        public DateTime Branch_Srt_Date { get; set; }
        public DateTime Branch_End_Date { get; set; }
        public string Branch_Remarks { get; set; }
        public string Status { get; set; }
    }
}
