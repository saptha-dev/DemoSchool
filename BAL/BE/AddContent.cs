using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{

    public class AddContentBE
    {
        public string BrowsedFilePath { get; set; }
        public int Content_Id { get; set; }
        public int Unit_Id { get; set; }
        public int Subject_Id { get; set; }
        public int Category_Id { get; set; }
        public int CategorySchedule_Id { get; set; }
        public string Content_Name { get; set; }
        public int Program_Id { get; set; }
        public string Content_Data { get; set; }
        public DateTime Content_AddDate { get; set; }
        public string Program_Name { get; set; }
        public string Unit_Name { get; set; }
        public string Category_Name { get; set; }
        public string CategorySchedule_Name { get; set; }
        public string Subject_Name { get; set; }
        public string Content_Type { get; set; }
        public string Group_Name { get; set; }
        public string Year_Name { get; set; }
        public string status { get; set; }
        public string SubjectScheduleID { get; set; }
        public int Group_Id { get; set; }
        public int Year_Id { get; set; }

    }

    public class AddContentBEList
    {
        private List<AddContentBE> list;

        public List<AddContentBE> List
        {
            get { return list; }
            set { list = value; }
        }

        public AddContentBEList()
        {
            list = new List<AddContentBE>();
        }

    }
}
