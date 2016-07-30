using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class AddYear
    {
       public int Year_Id { get; set; }
       public int Branch_Id { get; set; }
       public string Branch_Year_No { get; set; }
       public int Year_T_Subjects { get; set; }
        public DateTime Year_Srt_Date { get; set; }
        public DateTime Year_End_Date { get; set; }
        public string Year_Remarks { get; set; }
        public int Year_Status { get; set; }
        public int Status { get; set; }
    }
}
