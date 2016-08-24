using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
    public class StudentRegProgram
    {
        public int StudentId { get; set; }
        public string UserId { get; set; }
        public int ProgramId { get; set; }
        public int CategoryId { get; set; }
        public int BranchId { get; set; }
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
        public string ScheduleId { get; set; }
        public string Subject_ScheduleId { get; set; }
        public DateTime SubjectStartDate { get; set; }
        public DateTime SubjctEndDate { get; set; }
        public string CompanyId { get; set; }
        public string  CompanyBranch { get; set; }
        public string BranchLocation { get; set; }
        public DateTime ClassStartDate { get; set; }
        public DateTime ClassEndDate { get; set; }
        public string ClassTime { get; set; }
        public int ActiveStatus { get; set; }
    }
}
