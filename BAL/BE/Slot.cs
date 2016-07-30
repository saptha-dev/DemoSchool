using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class Slot
    {
        public int Slot_ID { get; set; }
        public string FlexField { get; set; }
        public int Subject_Id { get; set; }
        public string Slot_Name { get; set; }
        public DateTime Slot_Date { get; set; }
        public int Slot_Sessions { get; set; }
        public string Slot_Time { get; set; }
        public string Slot_Status { get; set; }
        public DateTime StatusDate { get; set; }
        public string Remarks { get; set; }
    }
}
