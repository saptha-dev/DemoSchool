using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class ContentBL
    {
        public int DeleteContent(int programId, int categoryId, int subId, int unitId, string ContentType)
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@programId", programId);
            p[1] = new SqlParameter("@categoryId", categoryId);
            p[2] = new SqlParameter("@subId", subId);
            p[3] = new SqlParameter("@unitId", unitId);
            p[3] = new SqlParameter("@ContentType", ContentType);
            return ConnectionFactory.ExecuteUpdate("sp_DeleteContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader getUnits(int subjectID, string contentType)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Student_Id", subjectID);
            p[1] = new SqlParameter("@Content_Name", contentType);

            return ConnectionFactory.ExecuteCommand("SP_GetContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader getbrowsedpath(string contname, int pgmid, int ctgid, int subid, int unitid,int gpid,int yrid,string csId,string constst)
        {
            return ConnectionFactory.ExecuteCommand("select BrowsedFilePath from tbl_Content where Content_Name='" + contname + "' and Program_Id=" + pgmid + " and Category_Id=" + ctgid + " and Subject_Id=" + subid + " and Unit_Id=" + unitid + " and Group_ID=" + gpid + " and year_ID=" + yrid + " and CategorySchedul_ID='" + csId + "' and contentstatus='" + constst + "' ", CommandType.Text);
        }

        public SqlDataReader DeleteContentFile(string contname, int pgmid, int ctgid, int subid, int unitid, int gpid, int yrid, string csId)
        {
            return ConnectionFactory.ExecuteCommand("DELETE FROM tbl_Content where Content_Name='" + contname + "' and Program_Id=" + pgmid + " and Category_Id=" + ctgid + " and Subject_Id=" + subid + " and Unit_Id=" + unitid + " and Group_ID=" + gpid + " and year_ID=" + yrid + " and CategorySchedul_ID='" + csId + "' ", CommandType.Text);
        }

        public SqlDataReader UpdateDeletedContentFile(int actstatus,string consts,string contname, int pgmid, int ctgid, int subid, int unitid, int gpid, int yrid, string csId,string subscid,string sts)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Content set activestatus=" + actstatus + ",contentstatus='" + consts + "' where Content_Name='" + contname + "' and Program_Id=" + pgmid + " and Category_Id=" + ctgid + " and Subject_Id=" + subid + " and Unit_Id=" + unitid + " and Group_ID=" + gpid + " and year_ID=" + yrid + " and CategorySchedul_ID='" + csId + "' and subjectSCHId='" + subscid + "' and contentstatus='" + sts + "' ", CommandType.Text);
        }


    }
}
