using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


using DAL;
namespace BAL.BL
{
    public class StudentContent
    {
        public SqlDataReader getStudentUnits(int subjectID, string contentType, int studentId)
        {
           SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@Student_Id",studentId);
            p[1] = new SqlParameter("@Content_Name",contentType);
            p[2] = new SqlParameter("@Subject_Id",subjectID);
            return ConnectionFactory.ExecuteCommand("SP_getStudentPublishedUnits", CommandType.StoredProcedure, p);
        }
    }
}
