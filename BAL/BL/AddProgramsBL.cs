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
    public class AddProgramsBL
    {

        #region suman

        public SqlDataReader getcontsubSchId(int subid)
        {
            return ConnectionFactory.ExecuteCommand("select distinct(Subject_ScheduleID),Subject_Id from tbl_Schedule where Subject_Id=" + subid + " ", CommandType.Text);
        }

        public SqlDataReader GetcontScheduleBySubject(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select Convert(nvarchar(50),Subject_ScheduleID)+'('+ CONVERT(nvarchar(50),Schedule_srt_Date, 105)+' : '+ CONVERT(nvarchar(50),Schedule_end_Date, 105)+')' as Subject_ScheduleID,Subject_Id From tbl_Schedule where Subject_Id=" + subId, CommandType.Text);
        }

        #endregion


        public SqlDataReader GetDataForProgramsDrpdwn()
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name  from  tbl_Program where status=0", CommandType.Text);
        }

        public SqlDataReader GetDataForProgramsDrpdwnforGroup()
        {
            return ConnectionFactory.ExecuteCommand("sp_ProgramGroupddl", CommandType.StoredProcedure);
        }

        public SqlDataReader GetDataForProgramsDrpdwnforYear()
        {
            return ConnectionFactory.ExecuteCommand("sp_ProgramYearddl", CommandType.StoredProcedure);
        }

        public SqlDataReader GetGradeBasedOnYear(int Category,int subject)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Category_Id", Category);
            p[1] = new SqlParameter("@Branch_Id", subject);
            return ConnectionFactory.ExecuteCommand("sp_CalculateGrade", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GenerateCategoryGrade(string Ids)
        {
            return ConnectionFactory.ExecuteCommand("update  StudentGrades set Activity='Generated' where S_No in("+Ids+")", CommandType.Text);
        }

        public SqlDataReader GetSelectedProgramData(int programId)
        {
            return ConnectionFactory.ExecuteCommand("select *  from tbl_Program where Program_id=" + programId, CommandType.Text);
        }
        public SqlDataReader GetSelectedCategoryData(int categoryId)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Categories where Category_Id=" + categoryId, CommandType.Text);
        }
        public SqlDataReader GetSelectedSubjectDataToGridView(int SubjectId)
        {
            //return ConnectionFactory.ExecuteCommand("select * from tbl_Subject where Subject_Id=" + SubjectId, CommandType.Text);
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@SubjectId", SubjectId);
            return ConnectionFactory.ExecuteCommand("sp_getCategoryWithSubjectsdata", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetSelectedCat_Sub_UnitsData(int UnitId, int SubjectId)
        {
            //return ConnectionFactory.ExecuteCommand("select * from tbl_Units where Unit_Id=" + UnitId, CommandType.Text);

            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@UnitId", UnitId);
            p[1] = new SqlParameter("@subjectId", SubjectId);
            return ConnectionFactory.ExecuteCommand("sp_GetSelectedCat_Sub_UnitsData", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetSelectedSubjectData(int SubjectId)
        {
            //return ConnectionFactory.ExecuteCommand("select * from tbl_Subject where Subject_Id=" + SubjectId, CommandType.Text);
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@SubjectId", SubjectId);
            return ConnectionFactory.ExecuteCommand("sp_getcategorySubjectsdata", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetSelectedUnitsData(int UnitId, int SubjectId)
        {
            //return ConnectionFactory.ExecuteCommand("select * from tbl_Units where Unit_Id=" + UnitId, CommandType.Text);

            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@UnitId", UnitId);
            p[1] = new SqlParameter("@subjectId", SubjectId);
            return ConnectionFactory.ExecuteCommand("sp_GetSelectedUnitsData", CommandType.StoredProcedure, p);
        }
       
        public SqlDataReader GetDataForNewProgramsDrpdwn()  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name from tbl_Program", CommandType.Text);
        }

        public SqlDataReader LoadSubjectDropdownCheckBox(string GetString)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@getDropdownChecksList", GetString);
            return ConnectionFactory.ExecuteCommand("SP_FacultyRegisterToSubject", CommandType.StoredProcedure, p);
        }



        public SqlDataReader GetDataForCategoriesDrpdwn()
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories where status=0", CommandType.Text);
        }
        public SqlDataReader GetProgramsForUnitsDrpdwn(int id)
        {
            return ConnectionFactory.ExecuteCommand("select Program_id,Program_name  from  tbl_Program where status=0", CommandType.Text);
        }
        public SqlDataReader GetDataSubjectsForUnitsDrpdwn()
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where status=0", CommandType.Text);
        }
        public SqlDataReader GetCategoriesBasedOnProgramsDrpdwn(int ProgramId)
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from tbl_Categories where Program_id="+ProgramId, CommandType.Text);
        }
        public SqlDataReader GetSubjectBasedOnCategoriesDrpdwn(int CategorieID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where Category_Id=" + CategorieID, CommandType.Text);
        }
        public SqlDataReader Getcategoryschedule(int CategorieID)
        {
            return ConnectionFactory.ExecuteCommand("select Convert(nvarchar(50),Schedule_ID)+'('+ CONVERT(nvarchar(50), Schedule_srt_Date, 105)+' : '+ CONVERT(nvarchar(50),Schedule_end_Date, 105)+')' as Schedule_ID,S_NO From tbl_Schedule where Category_Id=" + CategorieID, CommandType.Text);
        }

        public SqlDataReader Getschsteddates(int CategorieID)
        {
            return ConnectionFactory.ExecuteCommand("select Schedule_srt_Date,Schedule_end_Date From tbl_Schedule where S_NO=" + CategorieID, CommandType.Text);
        }

        public SqlDataReader GetGroupBasedOnCategoriesDrpdwn(int CategorieID)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_Id,Branch_Name from tbl_Branch where Category_Id=" + CategorieID, CommandType.Text);
        }
        public SqlDataReader LoadScheduleForSubject(int BranchID)
        {
            return ConnectionFactory.ExecuteCommand("select S_NO,Schedule_ID from tbl_Schedule where Category_Id=" + BranchID, CommandType.Text);
        }
        public SqlDataReader GetCompanysToBindGroup(int GroupID, string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select CompanyID,BranchID,BranchName,BranchLocation,RegistrationDate from tbl_CompanyBranch where CompanyID='" + CompanyID + "' and ActiveStatus=1 and BranchID not in(select Company_BranchID from tbl_Company_BranchGroup where GroupID=" + GroupID + " and ActiveStatus=1 and CompanyId='" + CompanyID + "')", CommandType.Text);
        }
        public SqlDataReader CompanysBranchGroupDeActivate(int GroupID, string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select CompanyID,BranchID,BranchName,BranchLocation,RegistrationDate from tbl_CompanyBranch where CompanyID='" + CompanyID + "' and ActiveStatus=1 and BranchID in(select Company_BranchID from tbl_Company_BranchGroup where GroupID=" + GroupID + " and ActiveStatus=1 and CompanyId='" + CompanyID + "')", CommandType.Text);
        }

        public SqlDataReader GetGroupsFilterBasedOnCategoriesDrpdwn(int CategorieID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Category_Id", CategorieID);
            return ConnectionFactory.ExecuteCommand("sp_ProgramYearddl", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetGroupDetails(int GroupID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Branch where Branch_Id=" + GroupID, CommandType.Text);
        }
        public SqlDataReader UpdateGroupDetails(int GroupID,string BranchName,int Count)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Branch set Branch_Name='" + BranchName + "',Branch_T_Years="+Count+" where Branch_Id=" + GroupID, CommandType.Text);
        }
        public SqlDataReader GetYearDetails(int Year_Id)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Year where Year_Id=" + Year_Id, CommandType.Text);
        }

        public SqlDataReader GetYearBasedOnGroupDrpdwn(int GroupID)
        {
            return ConnectionFactory.ExecuteCommand("select Year_Id,Branch_Year_No from tbl_Year where Branch_Id=" + GroupID, CommandType.Text);
        }
        public SqlDataReader GetYearBasedOnCategory(int CategoryID,string StudentID)
        {
            return ConnectionFactory.ExecuteCommand("select Year_Id,Branch_Year_No from tbl_Year where Branch_Id=(select BranchID from tbl_StudentRegPrograms where UserID='"+StudentID+"' and CategoryID="+CategoryID+")", CommandType.Text);
        }
        public SqlDataReader GetScheduleBasedOnGroupDrpdwn(int GroupID)
        {
            return ConnectionFactory.ExecuteCommand("select S_NO,Schedule_ID from tbl_Schedule where Subject_Id=0 and End_date>getdate() and Branch_Id=" + GroupID, CommandType.Text);
        }
        public SqlDataReader GetYearBasedOnCountGroups(int Branch_Id)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Branch_Id", Branch_Id);
            return ConnectionFactory.ExecuteCommand("sp_ProgramSubject", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UpdateYearDetails(int YearID, string YearName, int Count)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Year set Branch_Year_No='" + YearName + "',Year_T_Subjects=" + Count + " where Year_Id=" + YearID, CommandType.Text);
        }
        public SqlDataReader GetSubjectBasedOnCountGroups(int Category_Id)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Year_Id", Category_Id);
            return ConnectionFactory.ExecuteCommand("sp_ProgramUnit", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetSubjectBasedOnYearDrpdwn(int YearID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id, Convert(nvarchar(50),Subject_Id)+' : '+ CONVERT(nvarchar(50),Subject_Name) as SubjectName from tbl_Subject where Year_Id=" + YearID, CommandType.Text);
        }
        public SqlDataReader GetUnitBasedOnSubjectDrpdwn(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id,Unit_Name from tbl_Units where Subject_Id=" + UnitID, CommandType.Text);
        }

        public SqlDataReader GetSlotBasedOnFlexField(int Subject_Id)
        {
            return ConnectionFactory.ExecuteCommand("select Slot_ID,Slot_Name from tbl_AdminBookingSlot where Subject_Id="+Subject_Id, CommandType.Text);
        }
        public SqlDataReader GetSlotDataBasedOnSlotDrpdwn(int SlotID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_AdminBookingSlot where Slot_ID="+ SlotID, CommandType.Text);
        }
        public SqlDataReader GetClassBasedOnSubjectDrpdwn(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id,Unit_Name from tbl_Units where Subject_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader GetClassesBasedOnSubjectDrpdwn(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand(" select ClassId,ClassName from tbl_Class where SubjectId=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader GetClassesBasedonSubject(int SubjectId)
        {
            return ConnectionFactory.ExecuteCommand("Select ClassId from tbl_Class where SubjectId=" + SubjectId, CommandType.Text);
        }
        public SqlDataReader GetClasseNosBasedonSubject(int SubjectId)
        {
            return ConnectionFactory.ExecuteCommand("Select distinct ClassNo from tbl_Class where SubjectId=" + SubjectId, CommandType.Text);
        }
        public SqlDataReader Getclassonunits(string Classno)
        {
            return ConnectionFactory.ExecuteCommand("select c.ClassId ,(select  Convert(nvarchar(50),u.Unit_Id)+' : '+ CONVERT(nvarchar(50), u.Unit_Name) from tbl_Units u where u.Unit_Id=c.UnitID) as unitname from tbl_Class c where ClassNo='"+ Classno+"'", CommandType.Text);
        }
        public SqlDataReader GetClassDetails(int ClassId,string Status)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Class where ClassId=" + ClassId + " and status='" + Status + "' and ActiveStatus=1", CommandType.Text);
        }
        public SqlDataReader GetDeleteddata(int ClassId, string Status,int unitID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Class where ClassId=" + ClassId + " and status='" + Status + "' and ActiveStatus=0", CommandType.Text);
        }
        public SqlDataReader Getclassdetailstogrid(int SubId,string Status,string Classno)
        {
            return ConnectionFactory.ExecuteCommand("select c.UnitID,c.ClassType,c.ClassNo,c.ClassId,c.[status],c.startdate,c.Enddate,c.StartTime,c.EndTime,c.StatusDate,c.Duration,c.[Hours],(select Unit_Name from tbl_Units u where u.Unit_Id=c.UnitID) as unitname from tbl_Class c where SubjectId=" + SubId + " and status='" + Status + "' and Classno='" + Classno + "' and ActiveStatus=1", CommandType.Text);
        }
        public SqlDataReader GetDeleteclassdetailstogrid(int SubId, string Status, string Classno)
        {
            return ConnectionFactory.ExecuteCommand("select c.UnitID,c.ClassType,c.ClassNo,c.ClassId,c.[status],c.startdate,c.Enddate,c.StartTime,c.EndTime,c.StatusDate,c.Duration,c.[Hours],(select Unit_Name from tbl_Units u where u.Unit_Id=c.UnitID) as unitname from tbl_Class c where SubjectId=" + SubId + " and status='" + Status + "' and Classno='" + Classno + "' and ActiveStatus=0", CommandType.Text);
        }
        public SqlDataReader GetScheduleByClassSubject(int SubjectId)
        {
            return ConnectionFactory.ExecuteCommand("select distinct(ScheduleID) from tbl_Class where  SubjectId=" + SubjectId, CommandType.Text);
        }
        public SqlDataReader GetUnitsBySchedule(string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select C.ClassId,C.UnitID,U.Unit_Name from tbl_Class C join tbl_Units U on U.Unit_Id=C.UnitID where C.ScheduleID='" + ScheduleID + "'", CommandType.Text);
        }
        public SqlDataReader GetDataForUnitsDrpdwn()
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject from tbl_Units where status=0", CommandType.Text);
        }

        public SqlDataReader GetAllFAculties(int subId)
        {
            string Query="select DetailsID,FirstName from Details where SubjectID='"+subId+"'";
            return ConnectionFactory.ExecuteCommand(Query, CommandType.Text);
        }
        public SqlDataReader GetUnitName(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Name from tbl_Units where Unit_Id=" + subId, CommandType.Text);
        }
        public SqlDataReader GetScheduleBySubject(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select Convert(nvarchar(50),Subject_ScheduleID)+'('+ CONVERT(nvarchar(50),Schedule_srt_Date, 105)+' : '+ CONVERT(nvarchar(50),Schedule_end_Date, 105)+')' as Subject_ScheduleID,Schedule_ID From tbl_Schedule where Subject_Id=" + subId, CommandType.Text);
        }
        public SqlDataReader GetDatesByschedule(string subCHId, int Subid)
        {
            return ConnectionFactory.ExecuteCommand("select Schedule_srt_Date,Schedule_end_Date from tbl_Schedule where Subject_ScheduleID='" + subCHId + "'  and Subject_Id=" + Subid, CommandType.Text);
        }
        public SqlDataReader GetSSubjectDuration(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Duration from tbl_Subject where Subject_Id=" + subId, CommandType.Text);
        }
        public SqlDataReader GetScheduledt(string SchId)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Class where Category_Schedule=" + SchId, CommandType.Text);
        }
        public SqlDataReader GetPublishedFaculties(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,FirstName+' '+LastName as Name from Details where DetailsID in(select FacultyID from tbl_FacultySubjects_Publish where [Status]='Publish' and Subject_Id=" + subId + ")", CommandType.Text);
        }
        public SqlDataReader GetrangeQtns(string from, string To, int UnitId,string Qtype,string Status)
        {
            return ConnectionFactory.ExecuteCommand("Select * from Test_Qstn_Ans Where QstnNAId Between'" + from + "' and '" + To + "' and Unit_Id='" + UnitId + "' and Question_Type='" + Qtype + "' and Status='"+Status+"'", CommandType.Text);
        }
        public SqlDataReader GetQids(string from, string To, int UnitId, string Qtype, string Status)
        {
            return ConnectionFactory.ExecuteCommand("Select QstnNAId from Test_Qstn_Ans Where QstnNAId Between'" + from + "' and '" + To + "' and Unit_Id='" + UnitId + "'and Question_Type='" + Qtype + "'  and Status='" + Status + "'", CommandType.Text);
        }
        
        public SqlDataReader GetQtns( string Qtype,int subID,int UnitID,string ctschid,string SubSchid,string Status)  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Question_Type='" + Qtype + "' and Subject_Id=" + subID + " and Unit_Id=" + UnitID + " and Cat_Schedile='" + ctschid + "' and Sub_ScheduleId='" + SubSchid + "' and Status='" + Status + "' and ActiveStatus=1", CommandType.Text);
        }
        public SqlDataReader GetQtnsDelete(string Qtype, int subID, int UnitID, string ctschid, string SubSchid, string Status)  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Question_Type='" + Qtype + "' and Subject_Id=" + subID + " and Unit_Id=" + UnitID + " and Cat_Schedile='" + ctschid + "' and Sub_ScheduleId='" + SubSchid + "' and Status='" + Status + "' and ActiveStatus=0", CommandType.Text);
        }
        public SqlDataReader GetQtnstsk(string Qtype, int subID, int UnitID,string CtSch)  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='" + Qtype + "' and Subject_Id=" + subID + " and Unit_Id=" + UnitID + " and Cat_Schedile=" + CtSch, CommandType.Text);
        }
        public SqlDataReader Getgv(int UnitID)  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='SampleTest'and  Unit_Id=0 and Subject_Id=" + UnitID, CommandType.Text);
        }
        public SqlDataReader GetgvFinalTest(int UnitID)  //ddlPrograms
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='FinalTest'and  Unit_Id=0 and Subject_Id=" + UnitID, CommandType.Text);
        }

        public SqlDataReader GetSubjectsData()
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject", CommandType.Text);
        }

        public SqlDataReader GetUnitDetails(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id,Unit_Name from tbl_Units where Subject_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader GetUnitData(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_Units where Unit_Id=" + UnitID, CommandType.Text);
        }

        public SqlDataReader GetTestIds(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Set_ID,Qstn_ID from Test_Qstn_Ans where Subject_Id=" + SubjectID, CommandType.Text);
        }

        #region AssessmentPublish

        public SqlDataReader GetBookingData(string FlexField)
        {
            return ConnectionFactory.ExecuteCommand("select Slot_ID ,Slot_Name from tbl_AdminBookingSlot where FlexField like '%" + FlexField + "%' and Slot_Date>=getdate()", CommandType.Text);
        }

        public SqlDataReader GetSampleTestData(int UnitID)  
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='SampleTest'and  Unit_Id=0 and Publish_Status=0 and Subject_Id=" + UnitID, CommandType.Text);
        }

        public void UpdatePublishTestData(int StudentID,int SubjectID,int Set_ID,string Test_Type)
        {
            ConnectionFactory.ExecuteCommand("insert into tbl_StudentSubjects_Sets(Student_Id,Subject_Id,Set_ID,Test_Type,Publish_Status) values(" + StudentID + "," + SubjectID + "," + Set_ID + ",'" + Test_Type + "',1)", CommandType.Text);
        }
        public SqlDataReader GetFinalTestData(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Test_Type='FinalTest'and  Unit_Id=0 and Publish_Status=0 and Subject_Id=" + UnitID, CommandType.Text);
        }
        public SqlDataReader ResultData(int programId, int CategoryId, int SubjectID, string QstnType)
        {
            return ConnectionFactory.ExecuteCommand("select Y.FirstName+Y.LastName as Name ,X.Student_Id from(select * from tbl_Results where Publish_Status=0 and Test_Type='" + QstnType + "' and Category_Id=" + CategoryId + " and Subject_Id= "+ SubjectID+") X inner join Details Y on  Y.DetailsID=X.Student_Id", CommandType.Text);
        }
        public SqlDataReader SampleTestData( int SubjectID, string QstnType)
        {
            return ConnectionFactory.ExecuteCommand("select Y.FirstName+Y.LastName as Name ,X.Student_Id from(select Student_Id  from Student_Publish where Student_Id not in(select Student_Id from tbl_StudentSubjects_Sets where Subject_Id=" + SubjectID + "and  Test_Type='" + QstnType + "' and Publish_Status=1) and Subjects_Publish like '%[" + SubjectID + "],%') X inner join Details Y on Y.DetailsID=X.Student_Id", CommandType.Text);
        }
        public SqlDataReader UpdatePublishResultData(string ResultID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_Results set Publish_Status=1 where Result_ID in(" + ResultID + ")", CommandType.Text);
        }
        #endregion AssessmentPublish

        #region TrainingPublish

        public SqlDataReader GetScheduleIDByCategoryID(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Schedule_ID,Schedule_srt_Date,Schedule_end_Date from tbl_Schedule where Subject_Id=0 and Category_Id='" + CategoryID + "'", CommandType.Text);
        }
        public SqlDataReader GetScheduleIDByCategoryIDSubject(int CategoryID,int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Schedule_ID,Schedule_srt_Date,Schedule_end_Date from tbl_Schedule where Subject_Id='" + SubjectID + "' and Category_Id='" + CategoryID + "'", CommandType.Text);
        }
        public SqlDataReader GetStudentsByScheduleID(int ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select X.FirstName+' '+X.LastName as Name,X.DetailsID,Y.Schedule_Publish from Details X inner join  Student_Publish Y on X.DetailsID=Y.Student_Id where Y.Schedule_Publish not like '%[" + ScheduleID + "],%' and Y.Student_Id in(select DetailsID from Details where RoleName='Student' and CategoryID=(select Category_Id from tbl_Schedule where Schedule_ID='" + ScheduleID + "'))", CommandType.Text);
        }

        public SqlDataReader UpdateStudentPublishByCategoryID(string StudentID)
        {
            return ConnectionFactory.ExecuteCommand("update Student_Publish set Schedule_Publish=1 where Student_Id in('" + StudentID + "')", CommandType.Text);
        }
        public void UpdateStudentPublishBySchedule(int StudentID, string Classes)
        {
            ConnectionFactory.ExecuteCommand("update Student_Publish set Schedule_Publish='" + Classes + "' where Student_Id=" + StudentID, CommandType.Text);
        }
        public SqlDataReader GetStudentsByClassID(int ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select X.FirstName+' '+X.LastName as Name,X.DetailsID,Y.Classes_Publish from Details X inner join  Student_Publish Y on X.DetailsID=Y.Student_Id where Y.Classes_Publish not like '%[" + ScheduleID + "],%' and Y.Student_Id in(select DetailsID from Details where RoleName='Student' and CategoryID=(select Category_Id from tbl_Schedule where Schedule_ID='" + ScheduleID + "'))", CommandType.Text);
        }
        public void UpdateStudentPublishByClasses(int StudentID,string Classes)
        {
             ConnectionFactory.ExecuteCommand("update Student_Publish set Classes_Publish='"+Classes+"' where Student_Id="+StudentID, CommandType.Text);
        }

        #endregion TrainingPublish

        public SqlDataReader InsertNew_Progrm(Program_Entities objAdd)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@ProgramName", objAdd.ProgramName);
            p[1] = new SqlParameter("@ProgramRegDate", objAdd.ProgramRegistrationDate);
            p[2] = new SqlParameter("@ProgramCategories", objAdd.ProgramCategories);
            p[3] = new SqlParameter("@ProgramStatus", objAdd.ProgramStatus);
            p[4] = new SqlParameter("@ProgramStatusDate", objAdd.ProgramStatusDate);
            p[5] = new SqlParameter("@Remarks", objAdd.ProgramRemarks);

            return ConnectionFactory.ExecuteCommand("sp_InsertNewProgram", CommandType.StoredProcedure, p);
           
        }

        public SqlDataReader InsertNew_Slot(Slot objSBE)
        {
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@FlexField", objSBE.FlexField);
            p[1] = new SqlParameter("@Slot_Name", objSBE.Slot_Name);
            p[2] = new SqlParameter("@Slot_Time", objSBE.Slot_Time);
            p[3] = new SqlParameter("@Slot_Date", objSBE.Slot_Date);
            p[4] = new SqlParameter("@Slot_Status", objSBE.Slot_Status);
            p[5] = new SqlParameter("@StatusDate", objSBE.StatusDate);
            p[6] = new SqlParameter("@Remarks", objSBE.Remarks);
            p[7] = new SqlParameter("@Subject_Id", objSBE.Subject_Id);
            p[8] = new SqlParameter("@Slot_Sessions", objSBE.Slot_Sessions);

            return ConnectionFactory.ExecuteCommand("sp_InsertAdminSlot", CommandType.StoredProcedure, p);

        }

        public SqlDataReader Update_Slot(Slot objSBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Slot_ID", objSBE.Slot_ID);
            p[1] = new SqlParameter("@Slot_Time", objSBE.Slot_Time);
            p[2] = new SqlParameter("@Slot_Date", objSBE.Slot_Date);
            p[3] = new SqlParameter("@Slot_Status", objSBE.Slot_Status);
            p[4] = new SqlParameter("@StatusDate", objSBE.StatusDate);
            p[5] = new SqlParameter("@Remarks", objSBE.Remarks);

            return ConnectionFactory.ExecuteCommand("sp_UpdateAdminSlot", CommandType.StoredProcedure, p);

        }

        public SqlDataReader DeleteSlot(int SlotID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_AdminBookingSlot where Slot_ID=" + SlotID, CommandType.Text);
        }

        public void Update_Progrm(Program_Entities objAdd)
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@ProgramName", objAdd.ProgramName);
            p[1] = new SqlParameter("@ProgramRegDate", objAdd.ProgramRegistrationDate);
            p[2] = new SqlParameter("@ProgramCategories", objAdd.ProgramCategories);
            p[3] = new SqlParameter("@ProgramStatus", objAdd.ProgramStatus);
            p[4] = new SqlParameter("@ProgramStatusDate", objAdd.ProgramStatusDate);
            p[5] = new SqlParameter("@Remarks", objAdd.ProgramRemarks);
            p[6] = new SqlParameter("@ProgramId", objAdd.ProgramId);

            ConnectionFactory.ExecuteCommand("sp_UpdatePrograms", CommandType.StoredProcedure, p);
        }

        public SqlDataReader InsertNew_Subject(AddSubjects_Entities objAdd)
        {
            SqlParameter[] p = new SqlParameter[13];
            p[0] = new SqlParameter("@Year_Id", objAdd.Year_Id);
            p[1] = new SqlParameter("@Branch_Id", objAdd.Branch_Id);
            p[2] = new SqlParameter("@Category_Id", objAdd.Category_Id);
            p[3] = new SqlParameter("@Program_Id", objAdd.Program_Id);
            p[4] = new SqlParameter("@Subject_Name", objAdd.Subject_Name);
            p[5] = new SqlParameter("@Subject_RegDate", objAdd.Subject_RegDate);
            p[6] = new SqlParameter("@Subject_Duration", objAdd.Subject_Duration);
            p[7] = new SqlParameter("@Subject_T_Units", objAdd.Subject_T_Units);
            p[8] = new SqlParameter("@Subject_Start_Date", objAdd.Subject_Start_Date);
            p[9] = new SqlParameter("@Subject_End_Date", objAdd.Subject_End_Date);
            p[10] = new SqlParameter("@Subject_Status", objAdd.Subject_Status);
            p[11] = new SqlParameter("@Subject_Status_Date", objAdd.Subject_Status_Date);
            p[12] = new SqlParameter("@Subject_Remarks", objAdd.Subject_Remarks);

             return ConnectionFactory.ExecuteCommand("sp_InsertNewSubject", CommandType.StoredProcedure, p);

        }
        public SqlDataReader GetCountSubjectname(string CId,string Pid,string Gid,string Yid)
        {
            return ConnectionFactory.ExecuteCommand("select COUNT(Subject_Name) as subjectCntname from tbl_Subject where Category_Id=" + CId + " and Program_Id=" + Pid + " and Branch_Id=" + Gid + " and Year_Id=" + Yid, CommandType.Text);
        }

        public SqlDataReader GetYertSubjects(string Gid,string Yid)
        {
            return ConnectionFactory.ExecuteCommand("select Year_T_Subjects from tbl_Year where Branch_Id=" + Gid +"and Year_Id="+Yid, CommandType.Text);
        }
        public SqlDataReader InsertNew_Branch(AddGroupcs objAGBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Category_Id", objAGBE.Category_Id);
            p[1] = new SqlParameter("@Branch_Name", objAGBE.Branch_Name);
            p[2] = new SqlParameter("@Branch_T_Years", objAGBE.Branch_T_Years);
            p[3] = new SqlParameter("@Branch_Srt_Date", objAGBE.Branch_Srt_Date);
            p[4] = new SqlParameter("@Branch_End_Date", objAGBE.Branch_End_Date);
            p[5] = new SqlParameter("@Status", objAGBE.Status);

            return ConnectionFactory.ExecuteCommand("sp_InsertGroupData", CommandType.StoredProcedure, p);

        }
        public SqlDataReader GetCountGroupname(string CId)
        {
            return ConnectionFactory.ExecuteCommand("select COUNT(Branch_Name) as Grpname from  tbl_Branch where Category_Id=" + CId, CommandType.Text);
        }
        public SqlDataReader GetCategoryTGroup(string CId)
        {
            return ConnectionFactory.ExecuteCommand("select Category_T_Group from tbl_Categories where Category_Id=" + CId, CommandType.Text);
        }
        public SqlDataReader InsertNew_Year(AddYear objAYBE)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@Branch_Id", objAYBE.Branch_Id);
            p[1] = new SqlParameter("@Branch_Year_No", objAYBE.Branch_Year_No);
            p[2] = new SqlParameter("@Year_T_Subjects", objAYBE.Year_T_Subjects);
            p[3] = new SqlParameter("@Year_Srt_Date", objAYBE.Year_Srt_Date);
            p[4] = new SqlParameter("@Year_End_Date", objAYBE.Year_End_Date);
            p[5] = new SqlParameter("@Year_Status", objAYBE.Status);

            return ConnectionFactory.ExecuteCommand("sp_insertYearData", CommandType.StoredProcedure, p);

        }
        public SqlDataReader GetCountyearname(string GId)
        {
            return ConnectionFactory.ExecuteCommand("select COUNT(Branch_Year_No) as yearcountname from  tbl_Year where Branch_Id=" + GId, CommandType.Text);
        }
        public SqlDataReader GetGroupTyears(string GrId)
        {
            return ConnectionFactory.ExecuteCommand("select Branch_T_Years from tbl_Branch where Branch_Id=" + GrId, CommandType.Text);
        }

        public SqlDataReader InsertNew_Category(AddCategories objAdd)
        {
            SqlParameter[] p = new SqlParameter[10];
            p[0] = new SqlParameter("@CategoryName", objAdd.CategoryName);
            p[1] = new SqlParameter("@ReDate", objAdd.CategorRegDate);
            p[2] = new SqlParameter("@Category_T_Group", objAdd.CategorGroups);
            p[3] = new SqlParameter("@Eligibility", objAdd.CategoryEligibility);
            p[4] = new SqlParameter("@StatusDate", objAdd.CategorStatusDate);
            p[5] = new SqlParameter("@programId", objAdd.ProgramId);
            p[6] = new SqlParameter("@Remarks", objAdd.Remarks);
            p[7] = new SqlParameter("@StartDAte", objAdd.CategorStartDate);
            p[8] = new SqlParameter("@EndDAte", objAdd.CategorEndDate);
            p[9] = new SqlParameter("@CategoryStatus", objAdd.Status);

             return ConnectionFactory.ExecuteCommand("sp_InsertNewCateGory", CommandType.StoredProcedure, p);

        }
        public SqlDataReader GetCountCategoryname(string PId)
        {
            return ConnectionFactory.ExecuteCommand("select COUNT(Category_Name) as catname from  tbl_Categories where Program_id=" + PId, CommandType.Text);
        }
        public SqlDataReader GetProgramTcatgry(string PrId)
        {
            return ConnectionFactory.ExecuteCommand("select Program_T_Ctgys from tbl_Program where Program_id=" + PrId, CommandType.Text);
        }

        public SqlDataReader InsertNew_Units(AddUnits_BE objUnits)
        {
            SqlParameter[] p = new SqlParameter[10];

            p[0] = new SqlParameter("@Program_id", objUnits.Program_id);
            p[1] = new SqlParameter("@Category_Id", objUnits.Category_Id);
            p[2] = new SqlParameter("@Subject_Id", objUnits.Subject_Id);
            p[3] = new SqlParameter("@Unit_Name", objUnits.UnitName);
            p[4] = new SqlParameter("@Unit_Reg_Date", objUnits.Unit_Reg_Date);
            p[5] = new SqlParameter("@Section_Name", objUnits.Unit_SectionName);
            p[6] = new SqlParameter("@Topics_List", objUnits.Topics_List);
            p[7] = new SqlParameter("@Unit_Status", objUnits.Unit_Status);
            p[8] = new SqlParameter("@Unite_Status_Date", objUnits.Unite_Status_Date);
            p[9] = new SqlParameter("@Unit_Remarks", objUnits.Unit_Remarks);

          return  ConnectionFactory.ExecuteCommand("sp_InsertNewUnit", CommandType.StoredProcedure, p);
        }
        public SqlDataReader Getunitnamecount(string PId,string Ctid,string Sid)
        {
            return ConnectionFactory.ExecuteCommand("select COUNT(Unit_Name) as UnitCntname from  tbl_Units where Program_id=" + PId + " Category_Id=" + Ctid + " Subject_Id=" + Sid, CommandType.Text);
        }

        public SqlDataReader Update_Units(AddUnits_BE objUnits)
        {
            SqlParameter[] p = new SqlParameter[7];

            p[0] = new SqlParameter("@Unit_Id", objUnits.Unit_Id);
            p[1] = new SqlParameter("@Unit_Reg_Date", objUnits.Unit_Reg_Date);
            p[2] = new SqlParameter("@Section_Name", objUnits.Unit_SectionName);
            p[3] = new SqlParameter("@Topics_List", objUnits.Topics_List);
            p[4] = new SqlParameter("@Unit_Status", objUnits.Unit_Status);
            p[5] = new SqlParameter("@Unite_Status_Date", objUnits.Unite_Status_Date);
            p[6] = new SqlParameter("@Unit_Remarks", objUnits.Unit_Remarks);

            return ConnectionFactory.ExecuteCommand("sp_updateUnits", CommandType.StoredProcedure, p);
        }

        public void ValidateProgram(int ProgramId)
        {
            SqlParameter[] p = new SqlParameter[1];
          
            p[0] = new SqlParameter("@programId", ProgramId);

            ConnectionFactory.ExecuteCommand("sp_validateProgram", CommandType.StoredProcedure, p);

        }

        public void validateCategory(int CategoryId)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CategoryId", CategoryId);

             ConnectionFactory.ExecuteCommand("sp_validateCategory", CommandType.StoredProcedure, p);

        }

        public SqlDataReader ProgramsBindGrid()
        {


            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Program order by program_id desc", CommandType.Text);

        }

        public SqlDataReader CategoriesBindGrid()
        {
            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Categories order by Category_Id desc", CommandType.Text);
        }

        public SqlDataReader GroupBindGrid()
        {
            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Branch order by Branch_Id desc", CommandType.Text);
        }

        public SqlDataReader SubjectsBindGrid()
        {


            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Subject order by Subject_Id desc", CommandType.Text);

        }


        public SqlDataReader UnitsBindGrid()
        {
            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Units order by Subject_Id desc", CommandType.Text);
        }


        public SqlDataReader programsEdit(int programId)
        {


            return ConnectionFactory.ExecuteCommand("select TOP 1 * from tbl_Program where program_id="+programId, CommandType.Text);

        }

        public void DeleteProgram(int programId)
        {
            ConnectionFactory.ExecuteCommand("delete from tbl_Program where Program_id=" + programId, CommandType.Text);
        }

        public SqlDataReader GetUnitsForContent(int Subject_Id)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id,Unit_Name from tbl_Units where Subject_Id=" + Subject_Id, CommandType.Text);
        }

        public DataSet GetAllProgramData(int ProgramId)
        {
            SqlParameter[] p = new SqlParameter[1];

            p[0] = new SqlParameter("@programId", ProgramId);

            return ConnectionFactory.ExecuteCommandDs("sp_GetAllProgramInfo", CommandType.StoredProcedure, p);

        }

        public SqlDataReader GetAllSubjects(int CAteId)
        {
            return ConnectionFactory.ExecuteCommand("select * from dbo.tbl_Subject where Category_Id=" + CAteId, CommandType.Text);
        }

        public SqlDataReader GetAllUnits(int subId)
        {
            return ConnectionFactory.ExecuteCommand("select * from dbo.tbl_Units where Subject_Id=" + subId, CommandType.Text);
        }

        public SqlDataReader LoadCategorySchdule(int CategorieId)
        {
            return ConnectionFactory.ExecuteCommand("select distinct Schedule_Id from tbl_Schedule where Category_Id=" + CategorieId, CommandType.Text);
        }

        public SqlDataReader LoadYearOrSemSchdule(int CategorieId)
        {
            return ConnectionFactory.ExecuteCommand("select distinct Branch_T_Years from tbl_Branch where Category_Id=" + CategorieId, CommandType.Text);
        }
    }
}
