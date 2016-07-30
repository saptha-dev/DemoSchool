using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;
using BAL.BE;

namespace BAL.BL
{
    public class EditProgram
    {

        #region Program

        public SqlDataReader GetProgramDataByID(int ProgramID)
        {
            return ConnectionFactory.ExecuteCommand("select [Program_name],Program_Red_Date,Program_T_Ctgys,Program_Status,Program_Date,Program_Remarks from tbl_Program where Program_id=" + ProgramID, CommandType.Text);
        }

        public SqlDataReader UpdateProgramData(Program_Entities objPEBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Program_Red_Date", objPEBE.ProgramRegistrationDate);
            p[1] = new SqlParameter("@Program_T_Ctgys", objPEBE.ProgramCategories);
            p[2] = new SqlParameter("@Program_Status", objPEBE.ProgramStatus);
            p[3] = new SqlParameter("@Program_Date", objPEBE.ProgramStatusDate);
            p[4] = new SqlParameter("@Program_Remarks", objPEBE.ProgramRemarks);
            p[5] = new SqlParameter("@Program_id", objPEBE.ProgramId);

            return ConnectionFactory.ExecuteCommand("SP_UpdatePrograms", CommandType.StoredProcedure, p);
        }

        public SqlDataReader DeleteProgramData(int ProgramID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Program where Program_id=" + ProgramID, CommandType.Text);
        }

        #endregion Program

        #region Catrgories
        public SqlDataReader GetCategoryDataByProgramIDID(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Categories where Category_Id=" + CategoryID, CommandType.Text);
        }

        public SqlDataReader UpdateCategoryData(AddCategories objCEBE)
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@Category_Reg_Date", objCEBE.CategorRegDate);
            p[1] = new SqlParameter("@Category_T_Group", objCEBE.CategorSubjects);
            p[2] = new SqlParameter("@Category_T_Eligible", objCEBE.CategoryEligibility);
            p[3] = new SqlParameter("@Category_Status_Date", Convert.ToDateTime(objCEBE.CategorStatusDate));
            p[4] = new SqlParameter("@Category_Status", objCEBE.Status);
            p[5] = new SqlParameter("@Category_Remarks", objCEBE.Remarks);
            p[6] = new SqlParameter("@Category_Id", objCEBE.Category_Id);
            return ConnectionFactory.ExecuteCommand("SP_UpdateCategorys", CommandType.StoredProcedure, p);
        }

        public SqlDataReader DeleteCategoryData(int CatrgoryID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Categories where Category_Id=" + CatrgoryID, CommandType.Text);
        }

        #endregion Catrgories

        #region Subjects

        public SqlDataReader GetSubjectDataByID(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Name,Subject_Id from tbl_Subject where Category_Id=" + CategoryID, CommandType.Text);
        }

        public SqlDataReader GetSubjectDataBySubjectID(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Subject where Subject_Id=" + SubjectID, CommandType.Text);
        }

        public SqlDataReader UpdateSubjectData(AddSubjects_Entities objSEBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Subject_RegDate", objSEBE.Subject_RegDate);
            p[1] = new SqlParameter("@Subject_T_Units", objSEBE.Subject_T_Units);
            p[2] = new SqlParameter("@Subject_Status", objSEBE.Subject_Status);
            p[3] = new SqlParameter("@Subject_Status_Date", objSEBE.Subject_Status_Date);
            p[4] = new SqlParameter("@Subject_Remarks", objSEBE.Subject_Remarks);
            p[5] = new SqlParameter("@Subject_Id", objSEBE.Subject_Id);
            return ConnectionFactory.ExecuteCommand("SP_UpdateSubjects", CommandType.StoredProcedure, p);
        }

        public SqlDataReader DeleteSubjectData(int SubjectId)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Subject where Subject_Id=" + SubjectId, CommandType.Text);
        }

        #endregion Subjects

        #region Test

        public SqlDataReader GetQuestion()
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='Exercise'", CommandType.Text);
        }

        public SqlDataReader GetUnitsDataByID(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id,Unit_Name from tbl_Units where Subject_Id=" + SubjectID, CommandType.Text);
        }

        public SqlDataReader InsertExercisedata(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[16];
            p[0] = new SqlParameter("@Category_Id", objQABE.Category_Id);
            p[1] = new SqlParameter("@Subject_Id", objQABE.Subject_Id);
            p[2] = new SqlParameter("@Unit_Id", objQABE.Unit_Id);
            p[3] = new SqlParameter("@Test_Type ", objQABE.Test_Type);
            p[4] = new SqlParameter("@Exercise_ID", objQABE.Exercise_ID);
            p[5] = new SqlParameter("@Question", objQABE.Question);
            p[6] = new SqlParameter("@A", objQABE.A);
            p[7] = new SqlParameter("@B", objQABE.B);
            p[8] = new SqlParameter("@C", objQABE.C);
            p[9] = new SqlParameter("@D", objQABE.D);
            p[10] = new SqlParameter("@E", objQABE.E);
            p[11] = new SqlParameter("@Answer", objQABE.Answer);
            p[12] = new SqlParameter("@Question_Type", objQABE.Question_Type);
            p[13] = new SqlParameter("@QstnId", objQABE.QstnId);
            p[14] = new SqlParameter("@catschedule", objQABE.CatSchedule);
            p[15] = new SqlParameter("@SubSchId", objQABE.SubSchId);
            return ConnectionFactory.ExecuteCommand("sp_ExerciseData", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetmaxId()
        {
            return ConnectionFactory.ExecuteCommand("select max(QstnNAId)+1 as QID from Test_Qstn_Ans", CommandType.Text);
        }
        public SqlDataReader InsertSampleTestdata(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[13];
            p[0] = new SqlParameter("@Category_Id", objQABE.Category_Id);
            p[1] = new SqlParameter("@Subject_Id", objQABE.Subject_Id);
            p[2] = new SqlParameter("@unitId ", objQABE.Unit_Id);
            p[3] = new SqlParameter("@Test_Type ", objQABE.Test_Type);
            p[4] = new SqlParameter("@Question_Type", "Radio");
            p[5] = new SqlParameter("@Question", objQABE.Question);
            p[6] = new SqlParameter("@A", objQABE.A);
            p[7] = new SqlParameter("@B", objQABE.B);
            p[8] = new SqlParameter("@C", objQABE.C);
            p[9] = new SqlParameter("@D", objQABE.D);
            p[10] = new SqlParameter("@E", objQABE.E);
            p[11] = new SqlParameter("@Answer", objQABE.Answer);
            p[12] = new SqlParameter("@QstnId", objQABE.QstnId);
            return ConnectionFactory.ExecuteCommand("sp_SampleTestInsert", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateSampleTestdata(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@Question", objQABE.Question);
            p[1] = new SqlParameter("@A", objQABE.A);
            p[2] = new SqlParameter("@B", objQABE.B);
            p[3] = new SqlParameter("@C", objQABE.C);
            p[4] = new SqlParameter("@D", objQABE.D);
            p[5] = new SqlParameter("@E", objQABE.E);
            p[6] = new SqlParameter("@Answer", objQABE.Answer);
            p[7] = new SqlParameter("@Qid", objQABE.QstnId);
            return ConnectionFactory.ExecuteCommand("sp_UpdateQstns", CommandType.StoredProcedure, p);
        }
       

        public SqlDataReader InsertSampleTestFillBlanksdata(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@Category_Id", objQABE.Category_Id);
            p[1] = new SqlParameter("@Subject_Id", objQABE.Subject_Id);
            p[2] = new SqlParameter("@UnitId", objQABE.Unit_Id);
            p[3] = new SqlParameter("@Test_Type ", objQABE.Test_Type);
            p[4] = new SqlParameter("@Question_Type", objQABE.Question_Type);
            p[5] = new SqlParameter("@Question", objQABE.Question);
            p[6] = new SqlParameter("@Answer", objQABE.Answer);
            p[7] = new SqlParameter("@QstnId", objQABE.QstnId);
            p[8] = new SqlParameter("@catschedule", objQABE.CatSchedule);
            p[9] = new SqlParameter("@SubSchId", objQABE.SubSchId);
            return ConnectionFactory.ExecuteCommand("sp_SampleTestFillBlanks_Insert", CommandType.StoredProcedure, p);
        }

        public SqlDataReader InsertExcelSampleTestdata(QstnAnsBE objQABE)
        {
            SqlParameter p = new SqlParameter();
            p.ParameterName = "@dtQuestios";
            p.SqlDbType = System.Data.SqlDbType.Structured;
            p.Value = objQABE.dtExcelUpload;

            return ConnectionFactory.ExecuteCommand("SP_InsertExcelQuestions", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateQuestion(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@Qstn_ID", objQABE.Qstn_ID);
            p[1] = new SqlParameter("@Question", objQABE.Question);
            p[2] = new SqlParameter("@A", objQABE.A);
            p[3] = new SqlParameter("@B", objQABE.B);
            p[4] = new SqlParameter("@C", objQABE.C);
            p[5] = new SqlParameter("@D", objQABE.D);
            p[6] = new SqlParameter("@E", objQABE.E);
            p[7] = new SqlParameter("@Answer", objQABE.Answer);
            return ConnectionFactory.ExecuteCommand("Sp_UpdateQuestion", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateDeleteQuestion(QstnAnsBE objQABE)
        {
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@Qstn_ID", objQABE.Qstn_ID);
            p[1] = new SqlParameter("@Question", objQABE.Question);
            p[2] = new SqlParameter("@A", objQABE.A);
            p[3] = new SqlParameter("@B", objQABE.B);
            p[4] = new SqlParameter("@C", objQABE.C);
            p[5] = new SqlParameter("@D", objQABE.D);
            p[6] = new SqlParameter("@E", objQABE.E);
            p[7] = new SqlParameter("@Answer", objQABE.Answer);
            return ConnectionFactory.ExecuteCommand("Sp_UpdtaeDeleteQstns", CommandType.StoredProcedure, p);
        }
        public SqlDataReader DeleteQuestion(int Qstn_ID)
        {
            return ConnectionFactory.ExecuteCommand("update Test_Qstn_Ans set Status='Delete',ActiveStatus=0 where Qstn_ID=" + Qstn_ID, CommandType.Text);
        }

        public SqlDataReader UpdateDeleteQuestion(int Qstn_ID)
        {
            return ConnectionFactory.ExecuteCommand("update Test_Qstn_Ans set Status='New',ActiveStatus=1 where Qstn_ID=" + Qstn_ID, CommandType.Text);
        }
        #endregion Test

        #region ManageSchedule

        public SqlDataReader GetScheduleIDByCategoryID(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select S_NO,Schedule_ID from tbl_Schedule where Category_Id='" + CategoryID + "'", CommandType.Text);
        }
        public SqlDataReader GetScheduleIDBySubjectData(int SubjectID,int substs)
        {
            return ConnectionFactory.ExecuteCommand("select S_NO,Subject_ScheduleID from tbl_Schedule where Subject_Id=" + SubjectID+" and subjectstatus="+substs+" ", CommandType.Text);
        }
        public SqlDataReader GetScheduleDataByScheduleID(int ScheduleID, string Status, int substs)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Schedule where S_NO=" + ScheduleID + " and Status='" + Status + "' and ScheduleStatus=" + substs + " ", CommandType.Text);
        }

        public SqlDataReader GetsubScheduleDataByScheduleID(int ScheduleID, string Status,int substs)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Schedule where S_NO=" + ScheduleID + " and Status='" + Status + "' and subjectstatus=" + substs + " ", CommandType.Text);
        }


        public SqlDataReader UpdateScheduleData(Schedules objSchedulesBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@S_NO", objSchedulesBE.S_No);
            p[1] = new SqlParameter("@Schedule_srt_Date", objSchedulesBE.Schedule_srt_Date);
            p[2] = new SqlParameter("@Schedule_end_Date", objSchedulesBE.Schedule_end_Date);
            p[3] = new SqlParameter("@Status", objSchedulesBE.Status);
            p[4] = new SqlParameter("@Status_date", objSchedulesBE.Status_date);
            p[5] = new SqlParameter("@Remarks", objSchedulesBE.Remarks);
            return ConnectionFactory.ExecuteCommand("Sp_UpdateSchedule", CommandType.StoredProcedure, p);

        }
        public SqlDataReader DeleteSchedule(string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Schedule where Schedule_ID='"+ ScheduleID+"'" , CommandType.Text);
        }
        public SqlDataReader DeleteSubjectSchedule(string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Schedule where Subject_ScheduleID='" + ScheduleID + "'", CommandType.Text);
        }

        public SqlDataReader updateSchedulewhendeleted(string ScheduleID,string sts,int schsts)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Schedule set Status='" + sts + "', ScheduleStatus=" + schsts + " where Schedule_ID='" + ScheduleID + "'", CommandType.Text);
        }
        public SqlDataReader updateSubjectSchedulewhendeleted(int subScheduleID, string sts, int schsts)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Schedule set Status='" + sts + "', subjectstatus=" + schsts + " where S_NO=" + subScheduleID + " ", CommandType.Text);
        }


        #endregion ManageSchedule

        #region Units

        public SqlDataReader DeleteUnit(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Units where Unit_Id=" + UnitID, CommandType.Text);
        }


        #endregion Units

        #region Groups

        public SqlDataReader DeleteGroupsData(int Branch_Id)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Branch where Branch_Id=" + Branch_Id, CommandType.Text);
        }

        #endregion Groups

        #region Years

        public SqlDataReader DeleteYearData(int Year_Id)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_Year where Year_Id=" + Year_Id, CommandType.Text);
        }

        #endregion Years

        #region Result

        public SqlDataReader ResultData(int programId, int CategoryId, int SubjectID, string QstnType)
        {
            return ConnectionFactory.ExecuteCommand("select R.*,D.FirstName+' '+D.LastName as Student_Name from tbl_Results R join Details D on R.Student_Id=D.DetailsID where Test_Type='" + QstnType + "' and Activity='Pending' and Category_Id=" + CategoryId + " and Subject_Id=" + SubjectID, CommandType.Text);
        }

        public SqlDataReader GeneratedResultData(int programId, int CategoryId, int SubjectID, string QstnType)
        {
            return ConnectionFactory.ExecuteCommand("select R.*,D.FirstName+' '+D.LastName as Student_Name from tbl_Results R join Details D on R.Student_Id=D.DetailsID where Test_Type='" + QstnType + "' and Activity='Generated'  and Cretificate_Generate='Pending' and Category_Id=" + CategoryId + " and Subject_Id=" + SubjectID, CommandType.Text);
        }

        public SqlDataReader ActivateResult(string IDs, int programId, int CategoryId, int SubjectID, string QstnType)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Results set Activity='Generated' where Result_ID in(" + IDs + ")  select R.*,D.FirstName+' '+D.LastName as Student_Name from tbl_Results R join Details D on R.Student_Id=D.DetailsID where Test_Type='" + QstnType + "' and Activity='Generated' and Cretificate_Generate='Pending' and Category_Id=" + CategoryId + " and Subject_Id=" + SubjectID, CommandType.Text);
        }

        public SqlDataReader ActivateCertificate(int ResultID)
        {
            SqlParameter[] p=new SqlParameter[1];
            p[0]=new SqlParameter("@ResultID",ResultID);
            return ConnectionFactory.ExecuteCommand("sp_GenerateCertificate", CommandType.StoredProcedure,p);
        }
        public SqlDataReader GetActivatedCertificates(string ResultIDs)
        {
            return ConnectionFactory.ExecuteCommand("select D.FirstName+' '+D.LastName as Name,C.* from Details D join (select * from tbl_StudentSubjectCertificates where Result_ID in("+ResultIDs+")) C on D.DetailsID=C.Student_Id", CommandType.Text);
        }
        #endregion Result


        public SqlDataReader UpdateResult(int Result_ID, int AttemptedQstns, int CorrectAns, string Result, string Remarks)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Results set Std_Attempted_Qstns=" + AttemptedQstns + ", Std_Correct_Ans=" + CorrectAns + " , Std_Result='" + Result + "',Remarks='" + Remarks + "' where Result_ID=" + Result_ID, CommandType.Text);
        }

        public SqlDataReader InsertCategoryScheduleData(Schedules objSchedulesBE)
        {
            SqlParameter[] p = new SqlParameter[11];
            p[0] = new SqlParameter("@Category_Id", objSchedulesBE.Category_Id);
            p[1] = new SqlParameter("@Subject_Id", objSchedulesBE.Subject_Id);
            p[2] = new SqlParameter("@Reg_Date", objSchedulesBE.Reg_Date);
            p[3] = new SqlParameter("@Duration", objSchedulesBE.Duration);
            //p[4] = new SqlParameter("@Start_Date", objSchedulesBE.Start_Date);
            //p[5] = new SqlParameter("@End_date", objSchedulesBE.End_date);
            p[4] = new SqlParameter("@Schedule_srt_Date", objSchedulesBE.Schedule_srt_Date);
            p[5] = new SqlParameter("@Schedule_end_Date", objSchedulesBE.Schedule_end_Date);
            p[6] = new SqlParameter("@Status", objSchedulesBE.Status);
            p[7] = new SqlParameter("@Status_date", objSchedulesBE.Status_date);
            p[8] = new SqlParameter("@Remarks", objSchedulesBE.Remarks);
            p[9] = new SqlParameter("@Branch_Id", objSchedulesBE.Branch_Id);
            p[10] = new SqlParameter("@yearId", objSchedulesBE.YearId);
            return ConnectionFactory.ExecuteCommand("sp_InsertCategorySchedule", CommandType.StoredProcedure, p);


        }

        public SqlDataReader InsertSubjectScheduleData(Schedules objSchedulesBE)
        {
            SqlParameter[] p = new SqlParameter[11];
            p[0] = new SqlParameter("@Category_Id", objSchedulesBE.Category_Id);
            p[1] = new SqlParameter("@Subject_Id", objSchedulesBE.Subject_Id);
            p[2] = new SqlParameter("@Reg_Date", objSchedulesBE.Reg_Date);
            p[3] = new SqlParameter("@Duration", objSchedulesBE.Duration);
            //p[4] = new SqlParameter("@Start_Date", objSchedulesBE.Start_Date);
            //p[5] = new SqlParameter("@End_date", objSchedulesBE.End_date);
            p[4] = new SqlParameter("@Schedule_srt_Date", objSchedulesBE.Schedule_srt_Date);
            p[5] = new SqlParameter("@Schedule_end_Date", objSchedulesBE.Schedule_end_Date);
            p[6] = new SqlParameter("@Status", objSchedulesBE.Status);
            p[7] = new SqlParameter("@Status_date", objSchedulesBE.Status_date);
            p[8] = new SqlParameter("@Remarks", objSchedulesBE.Remarks);
            p[9] = new SqlParameter("@Branch_Id", objSchedulesBE.Branch_Id);
            p[10] = new SqlParameter("@Schedule_ID", objSchedulesBE.Schedule_ID);
            return ConnectionFactory.ExecuteCommand("sp_InsertSchedule", CommandType.StoredProcedure, p);


        }

        //public SqlDataReader InsertSunbjectSchedule(Schedules objSchedulesBE)
        //{
        //    SqlParameter[] p = new SqlParameter[2];
        //    p[0] = new SqlParameter("@Subject_Id", objSchedulesBE.Subject_Id);
        //    p[1] = new SqlParameter("@Category_Id", objSchedulesBE.Schedule_ID);
        //    return ConnectionFactory.ExecuteCommand("sp_InsertCategorySchedule", CommandType.StoredProcedure, p);
        //}

        

    }
}
