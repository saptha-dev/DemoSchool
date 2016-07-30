using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class AddSubjects_Entities
    {
       public int Program_Id { get; set; }
       public int Category_Id { get; set; }
        public int Subject_Id { get; set; }
        public string Subject_Name { get; set; }
        public DateTime Subject_RegDate { get; set; }
        public int Subject_T_Units { get; set; }
        public DateTime Subject_Status_Date { get; set; }
        public string Subject_Remarks { get; set; }
        public int Year_Id { get; set; }
        public int Branch_Id { get; set; }

        public DateTime Subject_Start_Date { get; set; }
        public DateTime Subject_End_Date { get; set; }
        public string Subject_Status { get; set; }
        public string Subject_Duration { get; set; }

    }
}
