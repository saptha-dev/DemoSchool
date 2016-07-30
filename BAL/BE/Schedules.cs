using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class Schedules
    {
       public int S_No { get; set; }
       public string Schedule_ID { get; set; }
       public int Category_Id { get; set; }
       public int Branch_Id { get; set; }
       public int Subject_Id { get; set; }
       public string Reg_Date { get; set; }
       public string Start_Date { get; set; }
       public string End_date { get; set; }
       public string Duration { get; set; }
       public string Schedule_srt_Date { get; set; }
       public string Schedule_end_Date { get; set; }
       public string Status { get; set; }
       public string Status_date { get; set; }
       public string Remarks { get; set; }
       public string YearId { get; set; }
    }

   public class SchedulesList
   {
       private List<Schedules> list;

       public List<Schedules> List
       {
           get { return list; }
           set { list = value; }
       }

       public SchedulesList()
       {
           list = new List<Schedules>();
       }

   }
}
