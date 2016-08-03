cusing System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;
using BAL.BE;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class CompanyBL
    {

        #region Suman
        public SqlDataReader GetBranchByCompany(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select BranchID,BranchName from tbl_CompanyBranch where CompanyID='" + CompanyID + "' and ActiveStatus=1", CommandType.Text);
        }
        public SqlDataReader getprograms()
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name from tbl_Program where Status=1", CommandType.Text);
        }
        public SqlDataReader GetCategorybyProgram(int ProgramID)
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories where Program_id=" + ProgramID + "", CommandType.Text);
        }
           public SqlDataReader GetGroupByCategory(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch where Category_Id=" + CategoryID + " and Status=1", CommandType.Text);
        }
           //public SqlDataReader GetSubjects(int ProgramID,int CategoryID)
           //{
           //    return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where Program_Id="+ProgramID+" and Category_Id="+CategoryID+"", CommandType.Text);
           //}
           public SqlDataReader GetCategoryDetails(int CategoryID)
           {
               return ConnectionFactory.ExecuteCommand("select * from tbl_Categories where Category_Id=" + CategoryID, CommandType.Text);
           }
           public SqlDataReader GetGroupDetails(int GroupID)
           {
               return ConnectionFactory.ExecuteCommand("select * from tbl_Branch where Branch_Id=" + GroupID, CommandType.Text);
           }

           public SqlDataReader UpdateCMPProfile(CompanyBE cbe)
           {
               SqlParameter[] p = new SqlParameter[24];
               p[0] = new SqlParameter("@CompanyId", "ACMPSMT001");
               p[1] = new SqlParameter("@cphone", cbe.OfficePhoneNO);
               p[2] = new SqlParameter("@cmobile", cbe.MobileNumber);
               p[3] = new SqlParameter("@cotheremailId", cbe.EmailID);
               p[4] = new SqlParameter("@flatno", cbe.Flat_UnitNo);
               p[5] = new SqlParameter("@plotno", cbe.HouseNO);
               p[6] = new SqlParameter("@landmark", cbe.landmark);
               p[7] = new SqlParameter("@streetno", cbe.StreetNO);
               p[8] = new SqlParameter("@streetname", cbe.StreetName);
               p[9] = new SqlParameter("@villagetowncity", cbe.Village_Town_City);
               p[10] = new SqlParameter("@suburbanaea", cbe.SubUrban_Area);
               p[11] = new SqlParameter("@districtid", cbe.DistrictID);
               p[12] = new SqlParameter("@state", cbe.StateID);
               p[13] = new SqlParameter("@country", cbe.CountryID);
               p[14] = new SqlParameter("@postalcode", cbe.PostalCode);
               p[15] = new SqlParameter("@firstname", cbe.FirstName);
               p[16] = new SqlParameter("@fathername", cbe.Father_GuardianName);
               p[17] = new SqlParameter("@mothermaidenname", cbe.MotherMaidenName);
               p[18] = new SqlParameter("@Dob", cbe.DateOfBirth);
               p[19] = new SqlParameter("@placeofbirth", cbe.PlaceOfBirth);
               p[20] = new SqlParameter("@phone", cbe.Fixed_LandlineNO);
               p[21] = new SqlParameter("@mobile", cbe.MobileNumber);
               p[22] = new SqlParameter("@emailid", cbe.ContactPersonEmailID);
               p[23] = new SqlParameter("@otheremailid", cbe.ContactPersonAlternativeEmailID);
               return ConnectionFactory.ExecuteCommand("Sp_Updatecompanydetails", CommandType.StoredProcedure, p);
           }
           public SqlDataReader GetScheduleTotalStudents(string ScheduleID)
           {
               return ConnectionFactory.ExecuteCommand("select count(*) as totalScheduledStudents from Details where Schedule_ID='" + ScheduleID + "'", CommandType.Text);
           }
           public SqlDataReader GetTotSubjectsCount(int GroupID)
           {
               return ConnectionFactory.ExecuteCommand("select count(*) as TotalSubjects from tbl_Subject where Branch_Id=" + GroupID, CommandType.Text);
           }
           public SqlDataReader GetTotUnitsCount(int SubjectID)
           {
               return ConnectionFactory.ExecuteCommand("select count(*) as TotalUnits from tbl_Units where Subject_Id=" + SubjectID, CommandType.Text);
           }

           public SqlDataReader saveMacaddress(string cmpbranchid, string macaddres,string cmpid)
           {
               return ConnectionFactory.ExecuteCommand("insert into Assesment_Authorization(CompanyBranchID,MAC_Address,CompanyId)values('" + cmpbranchid + "','" + macaddres + "','"+cmpid+"')", CommandType.Text);
           }

           public SqlDataReader selectCompanyBranches(string cmpid)
           {
               return ConnectionFactory.ExecuteCommand("select SNo_ID,BranchName from tbl_CompanyBranch where CompanyID='" + cmpid + "' ", CommandType.Text);
           }

           public SqlDataReader selectCompanyBranchesSessions(int id)
           {
               return ConnectionFactory.ExecuteCommand("select No_Of_sessions from tbl_CompanyBranch where SNo_ID=" + id, CommandType.Text);
           }

        #endregion

        public SqlDataReader GetCompany()
        {
            return ConnectionFactory.ExecuteCommand("select * from CompanyDetails", CommandType.Text);
        }

        public SqlDataReader GetCompanyDetails(CompanyBE objCompanyBE)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DetailsID", objCompanyBE.DetailsID);
            return ConnectionFactory.ExecuteCommand("SP_GetCompanyDetails", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetCompanyDetailss(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select * from CompanyDetails where CompanyId='" + CompanyID + "'", CommandType.Text);
        }
        
        public SqlDataReader GetBranchProgram(string BranchID)
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name from tbl_Program where Program_id in(select Program_id from tbl_Categories where Category_Id in(select distinct(CategoryID) from tbl_Company_BranchGroup where Company_BranchID='" + BranchID + "' and ActiveStatus=1))", CommandType.Text);
        }
        public SqlDataReader GetBranchCategorybyProgram(string BranchID,int ProgramID)
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories where Category_Id in(select distinct(CategoryID) from tbl_Company_BranchGroup where Company_BranchID='" + BranchID + "' and ActiveStatus=1) and Program_id="+ProgramID+"", CommandType.Text);
        }
        public SqlDataReader GetBranchGroupByCategory(string BranchID, int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch where Branch_Id in(select distinct(GroupID) from tbl_Company_BranchGroup where Company_BranchID='" + BranchID + "' and ActiveStatus=1 and CategoryID=" + CategoryID + ")", CommandType.Text);
        }
        public SqlDataReader GetYear(int BranchID)
        {
            return ConnectionFactory.ExecuteCommand("select Year_Id,Branch_Year_No from tbl_Year where Branch_Id="+BranchID, CommandType.Text);
        }
        public SqlDataReader GetSubjects(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where Year_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader CompanyAddBranch(string BranchID, int DetailsID, string CompanyID, string BranchName, string BranchLocation, string BranchArea, string BranchOffice, string BranchStatus,int sessions)
        {
            return ConnectionFactory.ExecuteCommand("insert into tbl_CompanyBranch(BranchID,CompanyDetailID,CompanyID,BranchName,BranchLocation,BranchArea,BranchOffice,BranchStatus,RegistrationDate,ActiveStatus,No_Of_sessions)values('" + BranchID + "'," + DetailsID + ",'" + CompanyID + "','" + BranchName + "','" + BranchLocation + "','" + BranchArea + "','" + BranchOffice + "','" + BranchStatus + "',getdate(),1," + sessions + ")", CommandType.Text);
        }
        public SqlDataReader GetBranchCount(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_Count from CompanyDetails where CompanyId='" + CompanyID + "'", CommandType.Text);
        }
        public SqlDataReader GetBranchDetails(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select BranchID,BranchName,BranchLocation,BranchArea,BranchOffice,BranchStatus from tbl_CompanyBranch where CompanyId='" + CompanyID + "'", CommandType.Text);
        }
        public SqlDataReader UpdateBranchCount(string CompanyID, int Count)
        {
            return ConnectionFactory.ExecuteCommand("update CompanyDetails set Branch_Count="+Count+" where CompanyId='" + CompanyID + "'", CommandType.Text);
        }

        public SqlDataReader GetCompanyBranchDetails(string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_CompanyBranch where CompanyID='" + CompanyID + "'", CommandType.Text);
        }
       
        public SqlDataReader GetSubjectSchedule(int GroupID,int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Schedule where Subject_Id=" + SubjectID + " and Schedule_ID=(select Schedule_ID from tbl_Schedule where Schedule_end_Date>getdate() and Branch_Id=" + GroupID + ")", CommandType.Text);
        }
        public SqlDataReader GetClassScheduleDetails( string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select Top(1) * from tbl_Class where ScheduleID='"+ScheduleID+"'", CommandType.Text);
        }
        public SqlDataReader GetActiveCompanysBranchUnPublish(int GroupID)
        {
            return ConnectionFactory.ExecuteCommand("(select CB.*,C.Category_Name from tbl_Company_BranchGroup CB join tbl_Categories C on CB.CategoryID=C.Category_Id where CB.GroupID=1 and CB.ActiveStatus=0 and CB.CompanyId='ACMPSMT001') A on A.GroupID=B.Branch_Id", CommandType.Text);
        }

       

        public SqlDataReader GetSubjectScheduleInfo(int SubjectID, string CompanyBranchID)
        {
            return ConnectionFactory.ExecuteCommand("select X.Start_Date,X.End_date,X.Schedule_ID,X.Duration,Y.* from tbl_Schedule X join(select SubjectID,Subject_ScheduleID,ClassType,StartTime,EndTime,Hours,FacultyName,Statusdate,Status from tbl_CompanySCH_SubjectClass where Company_BranchID='"+CompanyBranchID+"' and SubjectId="+SubjectID+")Y on X.Subject_ScheduleID=Y.Subject_ScheduleID  ", CommandType.Text);
        }

        public SqlDataReader GetSubjectScheduleStudent(int SubjectID,string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select X.Start_Date,X.End_date,X.Schedule_ID,X.Duration,X.Status,X.Status_date,Y.* from tbl_Schedule X join(select distinct SubjectId, ScheduleId,ClassType ,StartTime, EndTime,Hours, Faculty from tbl_Class where SubjectId = " + SubjectID + " And ScheduleId in (select distinct ScheduleId from dbo.tbl_Class where SubjectId = " + SubjectID + ")) Y on X.Subject_ScheduleID=Y.ScheduleId  where X.Subject_Id=" + SubjectID + " and X.Schedule_ID='"+ScheduleID+"'", CommandType.Text);
        }

        public SqlDataReader GetStudentsUnitsBySchedule(string Schedule_ID,string Student_Id, int Subject_Id)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@Schedule_ID", Schedule_ID);
            p[1] = new SqlParameter("@Student_Id", Student_Id);
            p[2] = new SqlParameter("@Subject_Id", Subject_Id);
            return ConnectionFactory.ExecuteCommand("sp_GetStudentsUnitsBySchedule", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetUnitsScheduleBySubjects(string Schedule_ID, string Company_BranchID)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Schedule_ID", Schedule_ID);
            p[1] = new SqlParameter("@Company_BranchID", Company_BranchID);
            return ConnectionFactory.ExecuteCommand("sp_GetUnitsScheduleBySubjects", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UpdateUnitsScheduleEndDate(string EndDate,string strdate,int SNO)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_CompanySubjectScheduleFaculty set EndDate=Convert(date,' "+ EndDate + "',105),StartDate=Convert( date, '" + strdate + "',105) where S_No=" + SNO, CommandType.Text);
        }

        public SqlDataReader Updateclasremarks(string remarks , int SNO)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Class set Remarks=' " + remarks + "' where S_No=" + SNO, CommandType.Text);
        }
        public SqlDataReader GetStudentsForSchedule(string CompanyID, int Subject_Id)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@CompanyID", CompanyID);
            p[1] = new SqlParameter("@Subject_Id", Subject_Id);
            return ConnectionFactory.ExecuteCommand("sp_GetStudentsForSchedule", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetCompanyTrainingStudents(string CompanyID, int Subject_Id)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@CompanyID", CompanyID);
            p[1] = new SqlParameter("@Subject_Id", Subject_Id);
            return ConnectionFactory.ExecuteCommand("sp_GetCompanyTrainingStudents", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UpdatePassword(string UserID,string pwd,string OldPwd)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@Password", pwd);
            p[2] = new SqlParameter("@NewPassword", OldPwd);
            return ConnectionFactory.ExecuteCommand("sp_ChangePassword", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetStudentScheduleDetails(string UserID)
        {
            return ConnectionFactory.ExecuteCommand("select D.DetailsID,D.UserID,Convert(nvarchar(50),D.DetailsID)+' : '+ CONVERT(nvarchar(50), D.FirstName+' '+D.LastName) as studIdname,D.Father_GaurdainName,D.DateOfBirth,D.LocationID,D.MobileNumber,D.EmailID,D.ActivationDate,D.Status,D.StatusDate,S.Status as schStatus,S.Status_date as SchStatus_date from Details D join tbl_Schedule S on S.Schedule_ID=D.Schedule_ID where D.UserID='" + UserID + "' and S.Subject_Id=0", CommandType.Text);
        }
        public SqlDataReader GetBookingDetailsOfStudent(string UserID,int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand(" select * from tbl_StudentBookings where UserID='" + UserID + "' and Subject_Id=" + SubjectID + " and Publish_Status=1", CommandType.Text);
        }
        public SqlDataReader GetStudentBookingScheduleDetails(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select B.*,R.* from tbl_StudentBookings B join tbl_Results R on B.Student_Id=R.Student_Id where R.Test_Type='RealTest' and R.Subject_Id=" + SubjectID + " and B.Subject_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader GetQstnsForStudent(int RTID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@RTID", RTID);
            return ConnectionFactory.ExecuteCommand("sp_GetStudentQstnAnswers", CommandType.StoredProcedure, p);
        }
        #region "hamsa"
        public SqlDataReader GetProgram()
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name from tbl_Program", CommandType.Text);
        }
        public SqlDataReader GetCategoryByProgram(int ProgramId)
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories where Category_Id='" + ProgramId + "'", CommandType.Text);
        }
        public SqlDataReader GetCategoryGroupProgram(int CategoryId)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch where Category_Id='" + CategoryId + "'", CommandType.Text);
        }
        public SqlDataReader GetSubjects(int ProgramId, int CategoryId)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where Program_Id='" + ProgramId + "' and Category_Id='" + CategoryId + "'", CommandType.Text);
        }
        public SqlDataReader updtatebranch(string brnchid,string brnchname,string brnchloc,string brnchoffice,string brncharea,string brnchsts)
        {
            SqlParameter[] p = new SqlParameter[6];

            p[0] = new SqlParameter("@BranchId", brnchid);
            p[1] = new SqlParameter("@Branchname", brnchname);
            p[2] = new SqlParameter("@Branchlocation", brnchloc);
            p[3] = new SqlParameter("@branchoffice", brnchoffice);
            p[4] = new SqlParameter("@brancharea", brncharea);
            p[5] = new SqlParameter("@branchstatus", brnchsts);
            return ConnectionFactory.ExecuteCommand("sp_upadtebranchdetails", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetStudentDetails(int subjectId)
        {
            return ConnectionFactory.ExecuteCommand("select Student_Id,UserID from tbl_StudentSubjects_Publish where Subject_Id=" + subjectId, CommandType.Text);

        }
        public SqlDataReader Getbrnchloc(string companyId)
        {
            return ConnectionFactory.ExecuteCommand(" select BranchID,BranchName+' '+BranchLocation as ACMPLoc from tbl_CompanyBranch  where CompanyID=" + companyId + "", CommandType.Text);
        }

        public SqlDataReader Getrtasdetails(string studentId,int subjectId)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@studentId", studentId);

            p[1] = new SqlParameter("@subjectId", subjectId);
            return ConnectionFactory.ExecuteCommand("Sp_Getassmentreportdetails", CommandType.StoredProcedure, p);
        }

        public SqlDataReader Geacmprtlist()
        {
            SqlParameter[] p = new SqlParameter[0];
            return ConnectionFactory.ExecuteCommand("Sp_Getacmprtlist", CommandType.StoredProcedure, p);
        }

        public SqlDataReader Getbookingdt(int studentId)
        {
            SqlParameter[] p = new SqlParameter[0];
            p[0] = new SqlParameter("@studentId", studentId);
            return ConnectionFactory.ExecuteCommand("Sp_Getrtbookingdata", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GeRtdata(int studentid, int subjectid)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@studentid", studentid);
            p[1] = new SqlParameter("@subjectid", subjectid);
            return ConnectionFactory.ExecuteCommand("Sp_GetRtdata", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetCompanyDetails(string BranchID)
        {
            return ConnectionFactory.ExecuteCommand("select d.CompanyId,d.CompanyName,d.FirstName+''+d.LastName as Name,b.BranchArea,b.BranchName,b.BranchLocation,b.BranchArea,b.BranchOffice,b.BranchStatus from CompanyDetails d,tbl_CompanyBranch b WHERE d.CompanyId=b.CompanyID and b.BranchID='" + BranchID + "'", CommandType.Text);
        }
        public SqlDataReader Getsubtotremunits(int subjectId)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_T_Units,Rem_Units from tbl_Subject where Subject_Id='" + subjectId + "'", CommandType.Text);
        }
        #endregion
    }
}
