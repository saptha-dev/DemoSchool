using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class AddUnits_BE
    {
       public int Unit_Id { get; set; }
       public int Program_id { get; set; }
       public int Category_Id { get; set; }
       public int Subject_Id { get; set; }
        public string UnitName { get; set; }
        public DateTime Unit_Reg_Date { get; set; }
        public int UnitNumber { get; set; }
        public string Unit_SectionName { get; set; }
        public string Topics_List { get; set; }
        public string Unit_Status { get; set; }
        public DateTime Unite_Status_Date { get; set; }
        public string Unit_Remarks { get; set; }
    }
}
