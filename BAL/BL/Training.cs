using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BAL.BE;
using System.Data.SqlClient;
using System.Data;
using DAL;

namespace BAL.BL
{
   
   public class Training
    {
       public SqlDataReader AddContent(AddContentBE objcontentBE)
       {
           SqlParameter[] p = new SqlParameter[12];
           p[0] = new SqlParameter("@Program_Id", objcontentBE.Program_Id);
           p[1] = new SqlParameter("@Category_Id", objcontentBE.Category_Id);
           p[2] = new SqlParameter("@Subject_Id", objcontentBE.Subject_Id);
           p[3] = new SqlParameter("@Unit_Id", objcontentBE.Unit_Id);
           p[4] = new SqlParameter("@Content_Data", objcontentBE.Content_Data);
           p[5] = new SqlParameter("@BrowsedFilePath", objcontentBE.BrowsedFilePath);
           p[6] = new SqlParameter("@Content_Type", objcontentBE.Content_Type);
           p[7] = new SqlParameter("@grpId", objcontentBE.Group_Id);
           p[8] = new SqlParameter("@yearid", objcontentBE.Year_Id);
           p[9] = new SqlParameter("@ContSchId", objcontentBE.CategorySchedule_Name);
           p[10] = new SqlParameter("@subschid", objcontentBE.SubjectScheduleID);
           p[11] = new SqlParameter("@constat", objcontentBE.status);

           return ConnectionFactory.ExecuteCommand("SP_AddContent", CommandType.StoredProcedure, p);
       }

       public SqlDataReader LoadContentDataGridView()
       {
           return ConnectionFactory.ExecuteCommand("SP_LoadContentData",CommandType.StoredProcedure);
       }

       public SqlDataReader InsertNew_Class(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[17];
           p[0] = new SqlParameter("@programId", objAddclass.programId);
           p[1] = new SqlParameter("@CategoryId", objAddclass.CategoryId);
           p[2] = new SqlParameter("@SubjectId", objAddclass.SubjectId);
           p[3] = new SqlParameter("@startdate", objAddclass.startdate);
           p[4] = new SqlParameter("@Enddate", objAddclass.Enddate);
           p[5] = new SqlParameter("@Duration", objAddclass.Duration);
           p[6] = new SqlParameter("@UnitID", objAddclass.Units);
           p[7] = new SqlParameter("@ClassType", objAddclass.ClassType);
           p[8] = new SqlParameter("@StartTime", objAddclass.StartTime);
           p[9] = new SqlParameter("@EndTime", objAddclass.EndTime);
           p[10] = new SqlParameter("@Hours", objAddclass.Hours);
           p[11] = new SqlParameter("@status", objAddclass.status);
           p[12] = new SqlParameter("@SatatusDate", objAddclass.StatusDate);
           p[13] = new SqlParameter("@Remarks", objAddclass.Remarks);
           p[14] = new SqlParameter("@ScheduleID", objAddclass.ScheduleID);
           p[15] = new SqlParameter("@Catschedule",objAddclass.CatSchedule);
           p[16] = new SqlParameter("@Classno",objAddclass.Classno);
           return ConnectionFactory.ExecuteCommand("sp_InsertClass", CommandType.StoredProcedure, p);

       }

       public SqlDataReader Update_Class(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[11];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@Duration", objAddclass.Duration);
           p[2] = new SqlParameter("@ClassType", objAddclass.ClassType);
           p[3] = new SqlParameter("@StartTime", objAddclass.StartTime);
           p[4] = new SqlParameter("@EndTime", objAddclass.EndTime);
           p[5] = new SqlParameter("@Hours", objAddclass.Hours);
           p[6] = new SqlParameter("@status", objAddclass.status);
           p[7] = new SqlParameter("@StatusDate", objAddclass.StatusDate);
           p[8] = new SqlParameter("@Remarks", objAddclass.Remarks);
           p[9] = new SqlParameter("@CatSchedule",objAddclass.CatSchedule);
           p[10]= new SqlParameter("@Classno",objAddclass.Classno);
           return ConnectionFactory.ExecuteCommand("UpdateClass", CommandType.StoredProcedure, p);

       }

       public SqlDataReader Update_ClassDT(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[10];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@Duration", objAddclass.Duration);
           p[2] = new SqlParameter("@ClassType", objAddclass.ClassType);
           p[3] = new SqlParameter("@StartTime", objAddclass.StartTime);
           p[4] = new SqlParameter("@EndTime", objAddclass.EndTime);
           p[5] = new SqlParameter("@Hours", objAddclass.Hours);
           p[6] = new SqlParameter("@StatusDate", objAddclass.StatusDate);
           p[7] = new SqlParameter("@Remarks", objAddclass.Remarks);
           p[8] = new SqlParameter("@CatSchedule", objAddclass.CatSchedule);
           p[9] = new SqlParameter("@Classno", objAddclass.Classno);
           return ConnectionFactory.ExecuteCommand("Sp_Update_ClassD", CommandType.StoredProcedure, p);

       }
       public SqlDataReader Update_DeleteClass(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[10];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@Duration", objAddclass.Duration);
           p[2] = new SqlParameter("@ClassType", objAddclass.ClassType);
           p[3] = new SqlParameter("@StartTime", objAddclass.StartTime);
           p[4] = new SqlParameter("@EndTime", objAddclass.EndTime);
           p[5] = new SqlParameter("@Hours", objAddclass.Hours);
           p[6] = new SqlParameter("@StatusDate", objAddclass.StatusDate);
           p[7] = new SqlParameter("@Remarks", objAddclass.Remarks);
           p[8] = new SqlParameter("@CatSchedule", objAddclass.CatSchedule);
           p[9] = new SqlParameter("@Classno", objAddclass.Classno);
           return ConnectionFactory.ExecuteCommand("Sp_Updatedeleteclass", CommandType.StoredProcedure, p);

       }

       public SqlDataReader GetClassInsertedData()
       {
           return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Class order by classid desc", CommandType.Text);
       }
       public SqlDataReader GetClsDataexist(string SchID,int SubId,string Clsno,string SubSchid,int unitid)
       {
           return ConnectionFactory.ExecuteCommand("select * from tbl_Class where Category_Schedule='" + SchID + "' and SubjectId=" + SubId + " and ClassNo='" + Clsno + "' and ScheduleID='" + SubSchid + "'", CommandType.Text);
       }
       public SqlDataReader GetClassData()
       {
           return ConnectionFactory.ExecuteCommand("select * from tbl_Class order by classid desc", CommandType.Text);
       }
       public SqlDataReader DeleteClass(int ClassID)
       {
           return ConnectionFactory.ExecuteCommand("update tbl_Class set ActiveStatus=0,status='Delete' where ClassId=" + ClassID, CommandType.Text);
       }

       public SqlDataReader Updateclassgrid(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[3];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@startdate", objAddclass.startdate);
           p[2] = new SqlParameter("@Enddate", objAddclass.Enddate);          
           return ConnectionFactory.ExecuteCommand("Sp_UpdateclassGrid", CommandType.StoredProcedure, p);
       }

       public SqlDataReader Updateclassinfo(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[5];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@status", objAddclass.status);
           p[2] = new SqlParameter("@classtype", objAddclass.ClassType);
           p[3] = new SqlParameter("@starttime", objAddclass.EndTime);
           p[4] = new SqlParameter("@Endtime", objAddclass.StartTime);
           return ConnectionFactory.ExecuteCommand("Sp_updateclassinfo", CommandType.StoredProcedure, p);
       }
       public SqlDataReader Updatedeleteclassgrid(AddClass objAddclass)
       {
           SqlParameter[] p = new SqlParameter[5];
           p[0] = new SqlParameter("@ClassId", objAddclass.ClassId);
           p[1] = new SqlParameter("@StartTime", objAddclass.StartTime);
           p[2] = new SqlParameter("@EndTime", objAddclass.EndTime);
           p[3] = new SqlParameter("@status", objAddclass.status);
           p[4] = new SqlParameter("@Classtype", objAddclass.ClassType);
            return ConnectionFactory.ExecuteCommand("Sp_UpdateDeleteclassGrid", CommandType.StoredProcedure, p);
       }

       public SqlDataReader Updatedatetime(int SubId,string Classno,int UnitID)
       {
           return ConnectionFactory.ExecuteCommand("select startdate, Enddate,ClassId,UnitID from tbl_Class where SubjectId=" + SubId + " and ClassNo='" + Classno + "' and UnitID >="+UnitID+"", CommandType.Text);
       }
       public SqlDataReader Getdatecount(string date,int Subid,string classno)
       {
           return ConnectionFactory.ExecuteCommand("select startdate, Enddate,ClassId,UnitID from tbl_Class where  SubjectId=" + Subid + " and ClassNo='" + classno + "' and startdate >= '"+date+"'", CommandType.Text);
       }
    }
}
