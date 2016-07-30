using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class AddClass
    {
        public int ClassId { get; set; }
        public int programId { get; set; }
        public int CategoryId { get; set; }
        public int SubjectId { get; set; }
        public string ClassName { get; set; }
        public DateTime startdate { get; set; }
        public DateTime Enddate { get; set; }
        public string Duration { get; set; }
        public int Units { get; set; }
        public string ClassType { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public int Hours { get; set; }
        public string FacultyName { get; set; }
        public int FacultyID { get; set; }
        public string status { get; set; }
        public DateTime StatusDate { get; set; }
        public string Remarks { get; set; }
        public string ScheduleID { get; set; }
        public string CatSchedule { get; set; }
        public string Classno { get; set; }

    }
}
