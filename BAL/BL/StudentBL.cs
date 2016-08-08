using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL.BL
{
   public  class StudentBL
    {
       public SqlDataReader GetCategoriesForStudent(int DetailsId, string RoleName)
       {
           SqlParameter[] p = new SqlParameter[2];
           p[0] = new SqlParameter("@DetailsId", DetailsId);
           p[1] = new SqlParameter("@RoleName", RoleName);
           return ConnectionFactory.ExecuteCommand("sp_GetCategoriesforStudent", CommandType.StoredProcedure, p);
       }
       public SqlDataReader GetSubjectsForStudent(int DetailsId, string RoleName)
       {
           SqlParameter[] p = new SqlParameter[2];
           p[0] = new SqlParameter("@DetailsId", DetailsId);
           p[1] = new SqlParameter("@RoleName", RoleName);
           return ConnectionFactory.ExecuteCommand("sp_GetAllSubjects", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetSubjectsForStudent(string UserID, int YearID)
       {
           return ConnectionFactory.ExecuteCommand(" select Subject_Id,Subject_Name from tbl_Subject where Subject_Id IN(select Subject_Id from tbl_StudentSubjects_Publish where UserID='" + UserID + "' and Status='Publish' and Subject_Id in( select Subject_Id from tbl_Subject where Year_Id=" + YearID + "))", CommandType.Text);
       }

       public SqlDataReader GetProgramNameForStudent(string StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select Program_id,Program_name from tbl_Program where  Program_id=(select distinct(ProgramID) from tbl_StudentRegPrograms where  ActiveStatus=1 and UserID='" + StudentID + "')", CommandType.Text);
       }
       public SqlDataReader GetCategoryNameForStudent(string StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from  tbl_Categories where Category_Id=(select distinct(CategoryID) from tbl_StudentRegPrograms where  ActiveStatus=1 and  UserID='" + StudentID + "')", CommandType.Text);
       }
       public SqlDataReader GetGroupNameForStudent(string UserID)
       {
           return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch  where Branch_Id=(select distinct(BranchID) from tbl_StudentRegPrograms where  ActiveStatus=1 and UserID='"+UserID+"')", CommandType.Text);
       }
       public SqlDataReader GetStudentDetails(int StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select * from Details where DetailsID="+StudentID, CommandType.Text);
       }
       public SqlDataReader GetCategoryScheduleDetails(int CategoryID,string StudentID)
       {
           SqlParameter[] p = new SqlParameter[2];
           p[0] = new SqlParameter("@StudentID", StudentID);
           p[1] = new SqlParameter("@CategoryID", CategoryID);
           return ConnectionFactory.ExecuteCommand("sp_StudentCategorysList", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetCompanyDetailsForStudent(int CategoryID,string UserID)
       {
           return ConnectionFactory.ExecuteCommand("select Y.*,X.CompanyName,X.EmailID,X.OfficePhoneNO,X.FirstName+' '+X.LastName as Name,X.Status,X.StatusDate from CompanyDetails X join (select BranchLocation,BranchID,BranchArea,CompanyID from tbl_CompanyBranch where BranchID=(select Company_Branch from Details where UserID='"+UserID+"' and CategoryID="+CategoryID+"))Y on X.CompanyId=Y.CompanyID", CommandType.Text);
       }

       public SqlDataReader GetSubjectScheduleDetails( int SubjectID ,string UserID,int CategoryID)
       {
           SqlParameter[] p = new SqlParameter[3];
           p[0] = new SqlParameter("@UserID", UserID);
           p[1] = new SqlParameter("@SubjectID", SubjectID);
           p[2] = new SqlParameter("@CategoryID", CategoryID);
           return ConnectionFactory.ExecuteCommand("sp_GetSubjectScheduleDetails", CommandType.StoredProcedure, p);
       }
       public SqlDataReader GetSubjectsCountForCategory(int GroupID)
       {
           string Q = "select count(*) from tbl_Subject where Branch_Id=" + GroupID;
           return ConnectionFactory.ExecuteCommand(Q, CommandType.Text);
       }
       public SqlDataReader GetUnitsForSubject(int SubjectID)
       {
           return ConnectionFactory.ExecuteCommand("select * from tbl_Units where Subject_Id=" + SubjectID, CommandType.Text);
       }
       public SqlDataReader GetResultInformationForStudent(int SubjectID,int StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select X.*,Y.* from tbl_Results X join tbl_StudentBookings Y on X.BookingID=Y.S_No where Std_Result!='F' and X.Subject_Id=" + SubjectID + " and X.Student_Id=" + StudentID, CommandType.Text);
       }
       public SqlDataReader GetResultInformationForStudentWithACMP(int SubjectID, int StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select B.BranchName,B.BranchLocation,Z.* from tbl_CompanyBranch B join(select X.*,Y.BookingDate,Y.CompanyID from tbl_Results X join tbl_StudentBookings Y on X.BookingID=Y.S_No where Std_Result!='F' and X.Subject_Id=" + SubjectID + " and X.Student_Id=" + StudentID + ")Z on B.BranchID=Z.CompanyID", CommandType.Text);
       }
       public SqlDataReader GetStudentProfile(int StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select X.*,Y.* from Details X join Address Y on X.DetailsID=Y.DetailsID where X.DetailsID="+StudentID , CommandType.Text);
       }
       public SqlDataReader GetStudentCompanyDetails(int StudentID)
       {
           return ConnectionFactory.ExecuteCommand("select * from CompanyDetails where CompanyId=(select CompanyID from Details where DetailsID=" + StudentID + ")", CommandType.Text);
       }
       public SqlDataReader GetStudentCategoryDetails(int CategoryID)
       {
           return ConnectionFactory.ExecuteCommand("select * from tbl_Categories where Category_Id=" + CategoryID, CommandType.Text);
       }
       public SqlDataReader GetStudentSubjectDetails(int SubjectID)
       {
           return ConnectionFactory.ExecuteCommand("select * from  tbl_Subject where Subject_Id=" + SubjectID, CommandType.Text);
       }

       public SqlDataReader GetStudentYearDDL(string UserID)
       {
           return ConnectionFactory.ExecuteCommand("select Year_Id,Branch_Year_No from tbl_Year where Year_Id in(select SemId from tbl_StudentRegPrograms where ActiveStatus=1 and UserID='" + UserID + "')", CommandType.Text);
       }
       public SqlDataReader GetExerciseQstns(int  UnitID)
       {
           return ConnectionFactory.ExecuteCommand("select top(30) Question,A,B,C,D,E,Answer from Test_Qstn_Ans where Test_Type='Exercise' and Unit_Id=" + UnitID + " order by newid()", CommandType.Text);
       }
       public SqlDataReader GetStudentSampleTestDetails(int StudentID,int SubjectID)
       {
           return ConnectionFactory.ExecuteCommand("select * from tbl_Results where Test_Type='SampleTest' and Student_Id=" + StudentID + " and Subject_Id=" + SubjectID, CommandType.Text);
       }

       public SqlDataReader GetStudentsUnitsBySchedule(string Schedule_ID, string Student_Id, int Subject_Id)
       {
           SqlParameter[] p = new SqlParameter[3];
           p[0] = new SqlParameter("@Schedule_ID", Schedule_ID);
           p[1] = new SqlParameter("@Student_Id", Student_Id);
           p[2] = new SqlParameter("@Subject_Id", Subject_Id);
           return ConnectionFactory.ExecuteCommand("sp_GetStudentsUnitsBySchedule", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetStudentBookingScheduleDetails(int StudentID, int SubjectID)
       {
           return ConnectionFactory.ExecuteCommand("select B.*,R.* from tbl_StudentBookings B join tbl_Results R on B.Student_Id=R.Student_Id where R.Test_Type='RealTest' and R.Subject_Id=" + SubjectID + " and R.Publish_Status='Publish' and B.Subject_Id=" + SubjectID + " and B.Student_Id=" + StudentID, CommandType.Text);
       }
       public SqlDataReader GetQstnsForStudent(int RTID)
       {
           SqlParameter[] p = new SqlParameter[1];
           p[0] = new SqlParameter("@RTID", RTID);
           return ConnectionFactory.ExecuteCommand("sp_GetStudentQstnAnswers", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetSubjectScheduleInfo(int SubjectID,string UserID,int CategoryID)
       {
           return ConnectionFactory.ExecuteCommand("select X.Start_Date,X.End_date,X.Schedule_ID,X.Duration,X.Status,X.Status_date,Y.* from tbl_Schedule X join(select distinct SubjectId, ScheduleId,ClassType ,StartTime, EndTime,Hours, Faculty from tbl_Class where SubjectId = " + SubjectID + " And ScheduleId in (select distinct ScheduleId from dbo.tbl_Class where SubjectId = " + SubjectID + ")) Y on X.Subject_ScheduleID=Y.ScheduleId  where X.Subject_Id=" + SubjectID + " and X.Schedule_ID=(select Schedule_ID from Details where UserID='"+UserID+"' and CategoryID="+CategoryID+")", CommandType.Text);
       }

       public SqlDataReader GetUnitsScheduleBySubjects(string Schedule_ID, string StudentID,int SubjectID)
       {
           SqlParameter[] p = new SqlParameter[3];
           p[0] = new SqlParameter("@Schedule_ID", Schedule_ID);
           p[1] = new SqlParameter("@StudentID", StudentID);
           p[2] = new SqlParameter("@subjectID", SubjectID);
           return ConnectionFactory.ExecuteCommand("sp_GetUnitsScheduleBySubjectsStudent", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetSubjectbasedoncmpletedSCH(int CategoryID,string UserID)
       {
           SqlParameter[] p = new SqlParameter[2];
           p[0] = new SqlParameter("@CategoryID", CategoryID);
           p[1] = new SqlParameter("@UserID", UserID);
           return ConnectionFactory.ExecuteCommand("sp_GetSubjectbasedoncmpletedSCHForStudent", CommandType.StoredProcedure, p);
       }

       public SqlDataReader GetStudentBkngDate(int SubjectID)
       {
           return ConnectionFactory.ExecuteCommand("select distinct(Slot_Date) from tbl_AdminBookingSlot where Subject_Id=" + SubjectID + " and Slot_Date>getdate()", CommandType.Text);
       }
       public SqlDataReader GetStudentBkngSlot(int SubjectID,string Date)
       {
           DateTime D = Convert.ToDateTime(Date);
           Date = D.ToString("yyyy-MM-dd");
           return ConnectionFactory.ExecuteCommand("select Slot_ID,Slot_Name from tbl_AdminBookingSlot where Subject_Id=" + SubjectID + " and Slot_Date='" + Date + "'", CommandType.Text);
       }
       public SqlDataReader GetStudentBkngTime(int SlotID)
       {
           return ConnectionFactory.ExecuteCommand("select Slot_ID,Slot_Time from tbl_AdminBookingSlot where Slot_ID=" + SlotID, CommandType.Text);
       }
       public SqlDataReader GetStudentBkngAcmpLocation(int SlotID)
       {
           return ConnectionFactory.ExecuteCommand("select BranchID,BranchName+' '+BranchLocation as ACMPLoc from tbl_CompanyBranch where SNo_ID in(select Company_BranchID from tbl_companysBooking where Slot_ID=" + SlotID + ")", CommandType.Text);
       }
       public SqlDataReader InsertStudentBkng(int Student_Id, string UserID, int Subject_Id, int SlotID, string CompanyID)
       {
           return ConnectionFactory.ExecuteCommand("insert into tbl_StudentBookings(Student_Id,UserID,Subject_Id,Slot_ID,BookingTime,CompanyID,Status,StatusDate)values(" + Student_Id + ",'" + UserID + "'," + Subject_Id + "," + SlotID + ",Getdate(),'" + CompanyID + "','New',getdate())", CommandType.Text);
       }

       public SqlDataReader GetSubjects(int programId, int branchId, int categoryId)
       {
           string sqlQuery = string.Format("select Subject_Id, Subject_Name from tbl_Subject where Program_Id = {0} AND Branch_Id = {1} AND Category_Id = {2}", programId, branchId, categoryId);
           return ConnectionFactory.ExecuteCommand(sqlQuery, CommandType.Text);
       }
    }
}
