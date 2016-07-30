using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace BAL.BE
{
    public class QstnAnsBE
    {
        public int Qstn_ID { get; set; }
        public int Category_Id { get; set; }
        public int Subject_Id { get; set; }
        public int? Unit_Id { get; set; }
        public string Test_Type { get; set; }
        public int Exercise_ID { get; set; }
        public string Question_Type { get; set; }
        public string Question { get; set; }
        public string A { get; set; }
        public string B { get; set; }
        public string C { get; set; }
        public string D { get; set; }
        public string E { get; set; }
        public string Answer { get; set; }
        public string StudentAnswer { get; set; }
        public DateTime Status_date { get; set; }
        public string Status { get; set; }
        public DataTable dtExcelUpload { get; set; }
        public string remTime { get; set; }
        public int QstnId { get; set; }
        public string CatSchedule { get; set; }
        public string SubSchId { get; set; }
    }

    public class QstnAnsBEList
    {
        private List<QstnAnsBE> list;

        public List<QstnAnsBE> List
        {
            get { return list; }
            set { list = value; }
        }

        public QstnAnsBEList()
        {
            list = new List<QstnAnsBE>();
        }

    }
}
