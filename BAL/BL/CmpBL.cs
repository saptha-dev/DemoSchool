using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using BAL.BE;
using System.Data;

namespace BAL
{
  public class CmpBL
  {
      #region suman
      public SqlDataReader GetStudentDetails(int subjectId)
      {
          return ConnectionFactory.ExecuteCommand("select ss.Student_Id,ss.UserID,(select FirstName+' '+LastName from Details where DetailsID=ss.Student_Id)as studentname from tbl_StudentSubjects_Publish ss where Subject_Id=" + subjectId, CommandType.Text);
      }

      public SqlDataReader GetStudentbookingID(int studentId)
      {
          return ConnectionFactory.ExecuteCommand("select sb.S_No as studentbookingid,sb.UserID from tbl_StudentBookings sb where Student_Id=" + studentId, CommandType.Text);
      }

      public SqlDataReader GetRTcommenceInfo(int studentid, int studentbookinid)
      {
          SqlParameter[] p = new SqlParameter[2];
          p[0] = new SqlParameter("@studentid", studentid);
          p[1] = new SqlParameter("@studentRTbookingID", studentbookinid);
          return ConnectionFactory.ExecuteCommand("sp_Realtestcommenceinfo", CommandType.StoredProcedure, p);
      }

      public SqlDataReader getmacaddress(string macadd)
      {
          return ConnectionFactory.ExecuteCommand("select MAC_Address from Assesment_Authorization where  CompanyBranchID='ACMPSMT001' and MAC_Address='" + macadd + "'", CommandType.Text);
      }

      public SqlDataReader GetStudentBkngDate(int StudentID)
      {
          return ConnectionFactory.ExecuteCommand("select sb.BookingDate,(select Slot_Name from tbl_AdminBookingSlot where Slot_ID=sb.Slot_ID) as slotname,sb.BookingSession,RIGHT(CONVERT(VARCHAR, sb.BookingTime, 100),7)as bktime from tbl_StudentBookings sb where Student_Id=" + StudentID + "", CommandType.Text);
      }

      public SqlDataReader savequestionanswers(int studentid, int rtid, int subid, string questionid, string studanswer)
      {
          SqlParameter[] p = new SqlParameter[5];
          p[0] = new SqlParameter("@studentid", studentid);
          p[1] = new SqlParameter("@rtid", rtid);
          p[2] = new SqlParameter("@subid", subid);
          p[3] = new SqlParameter("@questionid", questionid);
          p[4] = new SqlParameter("@stdanswer", studanswer);
          return ConnectionFactory.ExecuteCommand("sp_SaveStudentAnswers", CommandType.StoredProcedure, p);
      }

      public SqlDataReader getrtdata(int stuid, int subjid)
      {
          return ConnectionFactory.ExecuteCommand("select RT_Time,NoofQuetions,Question_type from RealTest where Student_Id='" + stuid + "' and SubjectId='" + subjid + "' ", CommandType.Text);
      }

      public SqlDataReader savequestionanswersbackup(int studentid, int rtid, int subid, string questionid, string studanswer, string cantime, string backupsatatus)
      {
          SqlParameter[] p = new SqlParameter[7];
          p[0] = new SqlParameter("@studentid", studentid);
          p[1] = new SqlParameter("@rtid", rtid);
          p[2] = new SqlParameter("@subid", subid);
          p[3] = new SqlParameter("@questionid", questionid);
          p[4] = new SqlParameter("@stdanswer", studanswer);
          p[5] = new SqlParameter("@canceledtime", cantime);
          p[6] = new SqlParameter("@backupstatus", backupsatatus);
          return ConnectionFactory.ExecuteCommand("sp_SaveStudentAnswersBackup", CommandType.StoredProcedure, p);
      }

      public SqlDataReader ChangeStdExamStatuswhenTermination(int stuid, int subjid, string st)
      {
          return ConnectionFactory.ExecuteCommand("update tbl_StudentBookings set [Status]='" + st + "' where Student_Id='" + stuid + "' and Subject_Id='" + subjid + "' ", CommandType.Text);
      }
      public SqlDataReader ChangeStdExamStatus(int stuid, int subjid, string st)
      {
          return ConnectionFactory.ExecuteCommand("update tbl_StudentBookings set [Status]='" + st + "' where Student_Id='" + stuid + "' and Subject_Id='" + subjid + "' ", CommandType.Text);
      }

      public SqlDataReader cheqStatusofStdExam(int stuid, int subjid)
      {
          return ConnectionFactory.ExecuteCommand("select [Status] from tbl_StudentBookings where Student_Id='" + stuid + "' and Subject_Id='" + subjid + "'", CommandType.Text);
      }
      public SqlDataReader saveAnswer(int studentid, int rtid, int subid, string questionid, string studanswer, string rmtime)
      {
          return ConnectionFactory.ExecuteCommand("update tbl_Save_Student_ans_backup set Question_Answer='" + studanswer + "', Rem_Time='" + rmtime + "' where Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' and Qustion_ID='" + questionid + "' ", CommandType.Text);
      }

      public SqlDataReader savestudentanswersbackup(int studentid, int rtid, int subid, string questionid, string studanswer, string rmtime)
      {
          SqlParameter[] p = new SqlParameter[7];
          p[0] = new SqlParameter("@StudentId", studentid);
          p[1] = new SqlParameter("@RTId", rtid);
          p[2] = new SqlParameter("@subjectId", subid);
          p[3] = new SqlParameter("@QuestionId", questionid);
          p[4] = new SqlParameter("@Questionans", studanswer);
          p[5] = new SqlParameter("@Remtime", rmtime);
          p[6] = new SqlParameter("@Examsts", "started");
          return ConnectionFactory.ExecuteCommand("sp_InsertIntoStudentAns", CommandType.StoredProcedure, p);
      }

      public SqlDataReader savestudentanswer(int studentid, int rtid, int subid, string examSt)
      {
          SqlParameter[] p = new SqlParameter[4];
          p[0] = new SqlParameter("@studentid", studentid);
          p[1] = new SqlParameter("@rtid", rtid);
          p[2] = new SqlParameter("@subid", subid);
          p[3] = new SqlParameter("@examsttus", examSt);
          return ConnectionFactory.ExecuteCommand("sp_SaveStudentAnswers", CommandType.StoredProcedure, p);
      }

      public SqlDataReader updatetimecount(int studentid, int rtid, int subid, string uptime)
      {
          return ConnectionFactory.ExecuteCommand("update tbl_Save_Student_ans_backup set Rem_Time='" + uptime + "' where Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' ", CommandType.Text);
      }

      public SqlDataReader getquestions(int catgid, int subjid, string questiontype)
      {
          return ConnectionFactory.ExecuteCommand("select top(20) Qstn_ID,Question,A,B,C,D,E,Answer from Test_Qstn_Ans where Category_Id='" + catgid + "' and Subject_Id='" + subjid + "' and Question_Type='" + questiontype + "'", CommandType.Text);
      }

      public SqlDataReader getquestionswithAnswer_F(int studentid, int rtid, int subid, string answer)
      {
          return ConnectionFactory.ExecuteCommand("select Qustion_ID,Rem_Time from tbl_Save_Student_ans_backup where Question_Answer='" + answer + "' and Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' ", CommandType.Text);
      }

      public SqlDataReader getremainingQuestions(int subid, int queId)
      {
          return ConnectionFactory.ExecuteCommand("select Qstn_ID,Subject_Id,Question,A,B,C,D,E,Answer from Test_Qstn_Ans where Subject_Id='" + subid + "' and Qstn_ID='" + queId + "' ", CommandType.Text);
      }

      public SqlDataReader CheckforAttemptExamOrNot(int studentid, int rtid, int subid)
      {
          return ConnectionFactory.ExecuteCommand("select * from tbl_Save_Student_ans_backup where Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' ", CommandType.Text);
      }

      public SqlDataReader gettingTime(int studentid, int rtid, int subid)
      {
          return ConnectionFactory.ExecuteCommand("select TOP 1 Rem_Time from tbl_Save_Student_ans_backup where Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' ", CommandType.Text);
      }

      public SqlDataReader getQuestionAnswer(int studentid, int rtid, int subid, int queID)
      {
          return ConnectionFactory.ExecuteCommand("select Question_Answer from tbl_Save_Student_ans_backup where Student_Id='" + studentid + "' and RTId='" + rtid + "' and Subject_ID='" + subid + "' and Qustion_ID='" + queID + "' ", CommandType.Text);
      }

      public SqlDataReader RTcommenceInfodata(int studentbookinid, string stulogid)
      {
          SqlParameter[] p = new SqlParameter[2];
          p[0] = new SqlParameter("@studentRTbookingID", studentbookinid);
          p[1] = new SqlParameter("@studentloginid", stulogid);
          return ConnectionFactory.ExecuteCommand("sp_Realtestinfo", CommandType.StoredProcedure, p);
      }



      #endregion

      public SqlDataReader GetBranchByCompany(string CompanyID)
      {
          return ConnectionFactory.ExecuteCommand("select BranchID,BranchName from tbl_CompanyBranch where CompanyID='" + CompanyID + "' and ActiveStatus=1", CommandType.Text);
      }

      public SqlDataReader GetCategory()
      {
          return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories ", CommandType.Text);
      }

      public SqlDataReader GetBranchGroupByCategory(int CategoryID)
      {
          return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch where Category_Id='" + CategoryID + "'", CommandType.Text);
      }

      public SqlDataReader GetSubjects(int CategoryId)
      {
          return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name,Subject_Remarks from tbl_Subject where Category_Id='" + CategoryId + "'", CommandType.Text);
      }

      
     
      public SqlDataReader GetStudentBkngSlot(int SubjectID)
      {
        
          return ConnectionFactory.ExecuteCommand("select Slot_ID,Slot_Name from tbl_AdminBookingSlot where Subject_Id=" + SubjectID + "", CommandType.Text);
      }
      public SqlDataReader GetStudentBkngSession(int SubjectID,int slotId)
      {
          return ConnectionFactory.ExecuteCommand("select S_No, BookingSession from tbl_StudentBookings where Subject_Id=" + SubjectID + " and Slot_ID="+slotId+"", CommandType.Text);
      }
      public SqlDataReader GetStudentBkTime( int slotId)
      {
         
          return ConnectionFactory.ExecuteCommand("select S_No,cast(BookingTime as time) [time] from tbl_StudentBookings where Slot_ID=" + slotId + "", CommandType.Text);
      }
      public SqlDataReader GetStudentSlot()
      {
          return ConnectionFactory.ExecuteCommand("select Slot_ID,Slot_Name from tbl_AdminBookingSlot", CommandType.Text);
      }
      public SqlDataReader GetStudentsession()
      {
          return ConnectionFactory.ExecuteCommand("select S_No, BookingSession from tbl_StudentBookings", CommandType.Text);
      }
      public SqlDataReader updateStudentbooking(int studentId,DateTime bookingDate,string slot,DateTime bookingtime,string bookingsession)
      {
          DateTime D = Convert.ToDateTime(bookingDate);
          bookingDate = D;
          SqlParameter[] p = new SqlParameter[5];
          p[0] = new SqlParameter("@StudentId", studentId);
          p[1] = new SqlParameter("@bookingDate", bookingDate);
          p[2] = new SqlParameter("@Slot", slot);
          p[3] = new SqlParameter("@Bookingtime", bookingtime);
          p[4] = new SqlParameter("@BookingSession", bookingsession);
          return ConnectionFactory.ExecuteCommand("sp_updatestudentBooking", CommandType.StoredProcedure, p);
      }
      public SqlDataReader GetCategoryDetails(int CategoryID)
      {
          return ConnectionFactory.ExecuteCommand("select * from tbl_Categories where Category_Id=" + CategoryID, CommandType.Text);
      }
      public SqlDataReader GetCompanyBranchDetails(string CompanyID)
      {
          return ConnectionFactory.ExecuteCommand("select * from tbl_CompanyBranch where CompanyID='" + CompanyID + "'", CommandType.Text);
      }
      public SqlDataReader GetStudentBoking(int studentId)
      {
          return ConnectionFactory.ExecuteCommand("select S_No, Student_Id,Subject_Id,Slot_ID,BookingDate,BookingSession,BookingTime,[Status],StatusDate from tbl_StudentBookings where Student_Id=" + studentId + "", CommandType.Text);
      }
      public SqlDataReader Getbrnchloc(string companyId)
      {
          return ConnectionFactory.ExecuteCommand(" select BranchID,BranchName+' '+BranchLocation as ACMPLoc from tbl_CompanyBranch  where CompanyID=" + companyId + "", CommandType.Text);
      }
      public SqlDataReader Getbookingdt(int studentId)
      {
          SqlParameter[] p = new SqlParameter[1];
          p[0] = new SqlParameter("@studentId", studentId);
          return ConnectionFactory.ExecuteCommand("Sp_Getrtbookingdata", CommandType.StoredProcedure, p);
      }
      public SqlDataReader GeRtdata(int studentid,int subjectid)
      {
          SqlParameter[] p = new SqlParameter[2];
          p[0] = new SqlParameter("@studentid", studentid);
          p[1] = new SqlParameter("@subjectid", subjectid);
          return ConnectionFactory.ExecuteCommand("Sp_GetRtdata", CommandType.StoredProcedure, p);
      }
    }
}
