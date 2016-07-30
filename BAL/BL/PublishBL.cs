using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class PublishBL
    {
        public SqlDataReader GetProgramRegisteredRoles(int programId,string Role)
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@programId", programId);
            p[1] = new SqlParameter("@role", Role);

            return ConnectionFactory.ExecuteCommand("sp_GetProgramRegisteredRoles", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetCategoriesRegisteredRoles(int CategoryId, string Role)
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@CategoryId", CategoryId);
            p[1] = new SqlParameter("@role", Role);

            return ConnectionFactory.ExecuteCommand("sp_GetCategoriesRegisteredRoles", CommandType.StoredProcedure, p);
        }
        public int PublishItems(int categoryId, string list)
        {
            string query="update dbo.Student_Publish set Category_Id=" + categoryId + " where  Student_Id In(" + list + ")";

            return ConnectionFactory.ExecuteUpdate(query, CommandType.Text);
        }


        #region CorePublish

        public SqlDataReader GetSubjectsStudentsAfterPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select X1.DetailsID,X1.Name,X1.Status,X1.StatusDate,Z.UserID from LoginDetails  Z join(select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Status,Y.StatusDate from Details  X inner join (select Student_Id as DetailsID,Status,StatusDate from tbl_StudentSubjects_Publish where S_No in("+SIDs+")) Y on X.DetailsID=Y.DetailsID) X1 on X1.DetailsID=Z.DetailsID where Z.RoleName='Student'",CommandType.Text);
        }
        public SqlDataReader GetUnitsStudentsAfterPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select X1.DetailsID,X1.Name,X1.Status,X1.StatusDate,Z.UserID from LoginDetails  Z join(select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Status,Y.StatusDate from Details  X inner join (select Student_Id as DetailsID,Status,StatusDate from tbl_StudentUnits_Publish where S_No in(" + SIDs + ")) Y on X.DetailsID=Y.DetailsID) X1 on X1.DetailsID=Z.DetailsID where Z.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetSubjectsFacultyAfterPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select X1.DetailsID,X1.Name,X1.Status,X1.StatusDate,Z.UserID from LoginDetails  Z join(select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Status,Y.StatusDate from Details  X inner join (select FacultyID as DetailsID,Status,StatusDate from tbl_FacultySubjects_Publish where S_No in("+SIDs+")) Y on X.DetailsID=Y.DetailsID) X1 on X1.DetailsID=Z.DetailsID where Z.RoleName='Faculty'", CommandType.Text);
        }
        public SqlDataReader GetUnitsFacultyAfterPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select X1.DetailsID,X1.Name,X1.Status,X1.StatusDate,Z.UserID from LoginDetails  Z join(select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Status,Y.StatusDate from Details  X inner join (select Student_Id as DetailsID,Status,StatusDate from tbl_StudentUnits_Publish where S_No in(" + SIDs + ")) Y on X.DetailsID=Y.DetailsID) X1 on X1.DetailsID=Z.DetailsID where Z.RoleName='Faculty'", CommandType.Text);
        }
        public SqlDataReader GetSubjectsByCategory(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id from tbl_Subject where Category_Id=" + CategoryID, CommandType.Text);
        }
        public SqlDataReader GetUnitsByCategory(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id from tbl_Units where Category_Id=" + CategoryID, CommandType.Text);
        }
        public SqlDataReader GetStudentUnPublishByCategory(int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select X.FirstName+' '+X.LastName as Name,X.DetailsId from Details X inner join  Student_Publish Y on X.DetailsID=Y.Student_Id where Y.Category_Id!=0 and X.RoleName='Student' and Y.Student_Id  in(select DetailsID from Details where RoleName='Student' and CategoryID=" + CategoryID + ")", CommandType.Text);
        }
        public SqlDataReader UpdateStudentPublishByCategory(int CategoryID, string Subjects, string Units, string Students)
        {
            return ConnectionFactory.ExecuteCommand("update Student_Publish set Category_Id=" + CategoryID + ",Subjects_Publish='" + Subjects + "',Units_Publish='" + Units + "' where Student_Id in(" + Students + ")", CommandType.Text);
        }
        public SqlDataReader UpdateStudentUnPublishByCategory(string Students)
        {
            return ConnectionFactory.ExecuteCommand("update Student_Publish set Category_Id=0,Subjects_Publish=0,Units_Publish=0 where Student_Id in(" + Students + ")", CommandType.Text);
        }
        public SqlDataReader GetStudentsIdBySubjects(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select Student_Id from tbl_StudentSubjects_Publish where Subject_Id=" + SubjectID + " and  Status='UnPublish')) D left outer join tbl_StudentSubjects_Publish S on D.DetailsID=S.Student_Id where S.Subject_Id=" + SubjectID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetFacultyBySubjects(int SubjectID,string Status)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select FacultyID from tbl_FacultySubjects_Publish where Subject_Id=" + SubjectID + " and  Status='" + Status + "')) D left outer join tbl_FacultySubjects_Publish S on D.DetailsID=S.FacultyID where S.Subject_Id=" + SubjectID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Faculty'", CommandType.Text);
        }
        public SqlDataReader PublishUnitsBySubjects(int Student_Id,int Unit_Id)
        {
             SqlParameter[] p = new SqlParameter[2];

             p[0] = new SqlParameter("@StudentID", Student_Id);
             p[1] = new SqlParameter("@UnitID", Unit_Id);

             return ConnectionFactory.ExecuteCommand("sp_UnitPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader PublishUnitsForFaculty(int Student_Id, int Unit_Id)
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@UnitID", Unit_Id);

            return ConnectionFactory.ExecuteCommand("sp_UnitFacultyPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UnPublishUnitsBySubjects(int Student_Id, int Unit_Id)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentUnits_Publish set [Status]='UnPublish',StatusDate=getdate() where Student_Id=" + Student_Id + " and Unit_Id=" + Unit_Id + "", CommandType.Text);
        }
        public SqlDataReader UnPublishUnitsFaculty(int Student_Id, int Unit_Id)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_FacultyUnits_Publish set [Status]='UnPublish',StatusDate=getdate() where Student_Id=" + Student_Id + " and Unit_Id=" + Unit_Id + "", CommandType.Text);
        }
        public SqlDataReader UnPublishUnitsFacultyBySubjects(int Student_Id, int Unit_Id)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_FacultyUnits_Publish set [Status]='UnPublish',StatusDate=getdate() where FacultyID=" + Student_Id + " and Unit_Id=" + Unit_Id + "", CommandType.Text);
        }
        public SqlDataReader GetUnPublishStudentsIdBySubjects(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select Student_Id from tbl_StudentSubjects_Publish where Subject_Id=" + SubjectID + " and  Status='Publish')) D left outer join tbl_StudentSubjects_Publish S on D.DetailsID=S.Student_Id where S.Subject_Id=" + SubjectID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetUnitsDataByStudentId(int StudentID,string Units)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id from tbl_StudentUnits_Publish where Unit_Id in (" + Units + ") and [Status]='UnPublish' and Student_Id=" + StudentID, CommandType.Text);
        }
        public SqlDataReader GetUnitsDataByStudentIdUnPublish(int StudentID, string Units)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id from tbl_StudentUnits_Publish where Unit_Id in (" + Units + ") and [Status]='Publish' and Student_Id=" + StudentID, CommandType.Text);
        }
        public SqlDataReader GetUnitsDataByFacultyIdUnPublish(int StudentID, string Units)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id from tbl_FacultyUnits_Publish where Unit_Id in (" + Units + ") and [Status]='Publish' and FacultyID=" + StudentID, CommandType.Text);
        }
        public SqlDataReader GetUnitsBySubjectsPublish(string SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select Unit_Id from tbl_Units where Subject_Id in(" + SubjectID + ")", CommandType.Text);
        }
        public SqlDataReader GetCompanySubjectsPublish(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select C.*,B.BranchName from tbl_CompanyBranch B join(select CompanyID,Company_BranchID,PublishStatus,StatusDate,S_No from tbl_CompanySubjectPublish where Subject_Id=" + SubjectID + " and PublishStatus='UnPublish')C on B.BranchID=C.Company_BranchID", CommandType.Text);
        }
        public SqlDataReader GetCompanySubjectsUnPublish(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select C.*,B.BranchName from tbl_CompanyBranch B join(select CompanyID,Company_BranchID,PublishStatus,StatusDate,S_No from tbl_CompanySubjectPublish where Subject_Id=" + SubjectID + " and PublishStatus='Publish')C on B.BranchID=C.Company_BranchID", CommandType.Text);
        }
        public SqlDataReader PublishCompanySubjects(int SNo)
        {
            return ConnectionFactory.ExecuteCommand(" update tbl_CompanySubjectPublish set PublishStatus='Publish' , StatusDate=getdate() where S_No="+SNo, CommandType.Text);
        }
        public SqlDataReader UnPublishCompanySubjects(int SNo)
        {
            return ConnectionFactory.ExecuteCommand(" update tbl_CompanySubjectPublish set PublishStatus='UnPublish' , StatusDate=getdate() where S_No=" + SNo, CommandType.Text);
        }
        public SqlDataReader GetCompanySubjectsAfterPublish(string SNo)
        {
            return ConnectionFactory.ExecuteCommand("select C.*,B.BranchName from tbl_CompanyBranch B join(select CompanyID,Company_BranchID,PublishStatus,StatusDate,S_No from tbl_CompanySubjectPublish where S_No in("+SNo+"))C on B.BranchID=C.Company_BranchID", CommandType.Text);
        }
        public SqlDataReader UpdateStudentPublishBySubjects(int Student_Id, int Unit_Id)
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@SubjectID", Unit_Id);

            return ConnectionFactory.ExecuteCommand("sp_SubjectPublish", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UpdateFacultyPublishBySubjects(int Student_Id, int Unit_Id)
        {
            SqlParameter[] p = new SqlParameter[2];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@SubjectID", Unit_Id);

            return ConnectionFactory.ExecuteCommand("sp_SubjectPublishForFaculty", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UpdateStudentUnPublishBySubjects(int Student_Id, int Subject_Id)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentSubjects_Publish set [Status]='UnPublish',StatusDate=getdate() where Student_Id=" + Student_Id + " and Subject_Id=" + Subject_Id + "", CommandType.Text);
        }
        public SqlDataReader UpdateFacultyUnPublishBySubjects(int Student_Id, int Subject_Id)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_FacultySubjects_Publish set [Status]='UnPublish',StatusDate=getdate() where FacultyID=" + Student_Id + " and Subject_Id=" + Subject_Id + "", CommandType.Text);
        }
        public SqlDataReader GetUnpublishStudentsIdByUnits(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select Student_Id from tbl_StudentUnits_Publish where Unit_Id=" + UnitID + " and  Status='Publish')) D left outer join tbl_StudentUnits_Publish S on D.DetailsID=S.Student_Id where S.Unit_Id=" + UnitID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetUnpublishFacultyIdByUnits(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand(" select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select FacultyID from tbl_FacultyUnits_Publish where Unit_Id=" + UnitID + " and  Status='Publish')) D left outer join tbl_FacultyUnits_Publish S on D.DetailsID=S.FacultyID where S.Unit_Id=" + UnitID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Faculty'", CommandType.Text);
        }
        public SqlDataReader GetStudentsIdByUnits(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select Student_Id from tbl_StudentUnits_Publish where Unit_Id=" + UnitID + " and  Status='UnPublish')) D left outer join tbl_StudentUnits_Publish S on D.DetailsID=S.Student_Id where S.Unit_Id=" + UnitID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetFacultyByUnits(int UnitID)
        {
            return ConnectionFactory.ExecuteCommand(" select X.DetailsID,X.Name,X.Status,X.StatusDate,Y.UserID,X.S_No from (select D.DetailsID,D.Name,S.Status,S.StatusDate,S.S_No from (select DetailsID,FirstName+LastName  as Name from Details where DetailsID in (select FacultyID from tbl_FacultyUnits_Publish where Unit_Id=" + UnitID + " and  Status='UnPublish')) D left outer join tbl_FacultyUnits_Publish S on D.DetailsID=S.FacultyID where S.Unit_Id=" + UnitID + ") X join LoginDetails Y on X.DetailsID=Y.DetailsID where Y.RoleName='Faculty'", CommandType.Text);
        }
        public SqlDataReader UpdateStudentPublishByUnits(string Units, int Student)
        {
            return ConnectionFactory.ExecuteCommand("update Student_Publish set Units_Publish='" + Units + "' where Student_Id =" + Student + "", CommandType.Text);
        }

        #endregion CorePublish

        public SqlDataReader GetStudentToPublishExercise(int SubjectID,int UnitID, string TestType,int BranchID,string role)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from (select * from tbl_StudentSets_Publish where Unit_Id=" + UnitID + ") Y Right outer join (select DetailsID,FirstName+LastName as Name from Details where  RoleName='"+ role +"' and DetailsID in(select Student_Id from tbl_StudentRegPrograms where ActiveStatus=1 and BranchID=" + BranchID + ") and DetailsID in (select Student_Id from tbl_StudentSets_Publish where Subject_Id=" + SubjectID + " and Unit_Id=" + UnitID + " and Test_Type='" + TestType + "' and Status='UnPublish')) X on X.DetailsID=Y.Student_Id ", CommandType.Text);
        }
        public SqlDataReader GetStudentToUnPublishExercise(int SubjectID, int UnitID, string TestType, int BranchID,string role)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from (select * from tbl_StudentSets_Publish where Unit_Id=" + UnitID + ") Y Right outer join (select DetailsID,FirstName+LastName as Name from Details where RoleName='" + role + "' and DetailsID in(select Student_Id from tbl_StudentRegPrograms where ActiveStatus=1 and BranchID=" + BranchID + ") and DetailsID in (select Student_Id from tbl_StudentSets_Publish where Subject_Id=" + SubjectID + " and Unit_Id=" + UnitID + " and Test_Type='" + TestType + "' and Status='Publish')) X on X.DetailsID=Y.Student_Id ", CommandType.Text);
        }

        public SqlDataReader GetStudentToPublishTest(int SubjectID, string TestType)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from (select * from tbl_StudentSets_Publish where Unit_Id=0 and Test_Type='" + TestType + "' and Subject_Id=" + SubjectID + ") Y Right outer join (select DetailsID,FirstName+LastName as Name from Details where DetailsID in(select Student_Id from tbl_StudentSubjects_Publish where Subject_Id=" + SubjectID + " and Status='Publish' and ActiveStatus=1)) X on X.DetailsID=Y.Student_Id where Y.Status='UnPublish'", CommandType.Text);
        }
        public SqlDataReader GetStudentAfterPublishTest(string IDs)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from (select * from tbl_StudentSets_Publish ) Y Right outer join (select DetailsID,FirstName+LastName as Name from Details) X on X.DetailsID=Y.Student_Id where Y.S_No in ("+IDs+")", CommandType.Text);
        }

        public SqlDataReader GetStudentToUnPublishTest(int SubjectID, string TestType)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from (select * from tbl_StudentSets_Publish where Unit_Id=0 and Test_Type='" + TestType + "' and Subject_Id=" + SubjectID + ") Y Right outer join (select DetailsID,FirstName+LastName as Name from Details where DetailsID in(select Student_Id from tbl_StudentSubjects_Publish where Subject_Id=" + SubjectID + " and Status='Publish' and ActiveStatus=1)) X on X.DetailsID=Y.Student_Id where Y.Status='Publish'", CommandType.Text);
        }
        public SqlDataReader GetStudentSolutionsToTest(int SubjectID, string TestType,string Status)
        {
            return ConnectionFactory.ExecuteCommand("select Y.Student_Id,X.FirstName+X.LastName as Name,Y.Subject_Name,Y.Exam_StartDate,Y.Exam_EndDate,Y.Solutions_Status,Y.Result_ID from Details X join(select Student_Id,Subject_Name,Exam_StartDate,Exam_EndDate,Solutions_Status,Result_ID from tbl_Results where Subject_Id=" + SubjectID + " and Test_Type='" + TestType + "' and Solutions_Status='" + Status + "') Y on Y.Student_Id=X.DetailsID", CommandType.Text);
        }
        public SqlDataReader GetStudentSolutionsAfterPublish(string IDs)
        {
            return ConnectionFactory.ExecuteCommand("select Y.Student_Id,X.FirstName+X.LastName as Name,Y.Subject_Name,Y.Exam_StartDate,Y.Exam_EndDate,Y.Solutions_Status,Y.Result_ID from Details X join(select Student_Id,Subject_Name,Exam_StartDate,Exam_EndDate,Solutions_Status,Result_ID from tbl_Results where Result_ID in("+IDs+")) Y on Y.Student_Id=X.DetailsID", CommandType.Text);
        }
        public SqlDataReader UpdateStudentSolutionsToTest(string Status, int StudentID)
        {
            return ConnectionFactory.ExecuteCommand("Update tbl_Results set Solutions_Status='" + Status + "'  where Result_ID=" + StudentID, CommandType.Text);
        }
        public SqlDataReader UpdateSampleTestStudentPublishBySet(int Student_Id, int Subject_Id, string Test_Type)
        {
            SqlParameter[] p = new SqlParameter[4];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@Subject_Id", Subject_Id);
            p[2] = new SqlParameter("@Test_Type", Test_Type);
            p[3] = new SqlParameter("@PublishType", "Publish");

            return ConnectionFactory.ExecuteCommand("sp_SampleTestPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateExerciseTestStudentPublishBySet(int Student_Id, int Subject_Id,int Unit_Id,  string Test_Type,string Status,string Catsch)
        {
            SqlParameter[] p = new SqlParameter[6];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@Subject_Id", Subject_Id);
            p[2] = new SqlParameter("@Unit_Id", Unit_Id);
            p[3] = new SqlParameter("@Test_Type", Test_Type);
            p[4] = new SqlParameter("@PublishType", Status);
            p[5] = new SqlParameter("@Catschedule", Catsch);
            return ConnectionFactory.ExecuteCommand("sp_ExerciseTestPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateSampleTestStudentUnPublishBySet(int Student_Id, int Subject_Id, string Test_Type)
        {
            SqlParameter[] p = new SqlParameter[4];

            p[0] = new SqlParameter("@StudentID", Student_Id);
            p[1] = new SqlParameter("@Subject_Id", Subject_Id);
            p[2] = new SqlParameter("@Test_Type", Test_Type);
            p[3] = new SqlParameter("@PublishType", "UnPublish");

            return ConnectionFactory.ExecuteCommand("sp_SampleTestPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetStudentToPublishQstns(int CategoryID,int SubjectID, string TestType,string Status)
        {
            string query="select * from Test_Qstn_Ans where Category_Id=" + CategoryID + " and Subject_Id=" + SubjectID + " and Test_Type='" + TestType + "' and Unit_Id=0 and Status='" + Status + "'";
            return ConnectionFactory.ExecuteCommand(query, CommandType.Text);
        }

        public SqlDataReader GetQstnsAfterPublish(string IDs)
        {
            return ConnectionFactory.ExecuteCommand("select * from Test_Qstn_Ans where Qstn_ID in("+IDs+")", CommandType.Text);
        }
        public SqlDataReader UpdateQstnsPublish(int CategoryID, int SubjectID, string TestType, string Status,string SelectedIDs)
        {
            return ConnectionFactory.ExecuteCommand("update Test_Qstn_Ans set Status='" + Status + "' where Category_Id=" + CategoryID + " and Subject_Id=" + SubjectID + "  and Test_Type='"+TestType+"' and Unit_Id=0 and Qstn_ID in(" + SelectedIDs + ")", CommandType.Text);
        }
        public SqlDataReader ResultPublish(int CategoryID, int SubjectID, string TestType, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select Y.DetailsID,Y.FirstName+Y.LastName as Name,X.* from (select * from tbl_Results where Category_Id=" + CategoryID + "  and Test_Type='" + TestType + "' and Subject_Id=" + SubjectID + " and Publish_Status='"+Status+"') X inner join Details Y on X.Student_Id=Y.DetailsID where Y.RoleName='Student'", CommandType.Text);
        }
        public SqlDataReader GetDataResultCertificatePublish(int SubjectID, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select D.FirstName+' '+D.LastName as Name,C.* from Details D join (select * from tbl_StudentSubjectCertificates where Subject_Id=" + SubjectID + " and Publish_Status='" + Status + "') C on C.Student_Id=D.DetailsID", CommandType.Text);
        }
        public SqlDataReader PublishCertificateData(string IDs, string Status)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentSubjectCertificates set Publish_Status='"+Status+"' where S_No in(" + IDs + ")", CommandType.Text);
        }
        public SqlDataReader GetGradeToPublishData(int YearID,string Status)
        {
            return ConnectionFactory.ExecuteCommand("select S.StudentID,D.FirstName+D.LastName as Name,S.Percentage,S.Grade,S.Grade_GeneratedDate,S.Grade_StatusDate,S.Publish_Status,S.Grade_Remarks from Details D join StudentGrades S on D.DetailsID =S.StudentID where S.Publish_Status!='" + Status + "' and S.Activity='Generated' and S.BranchId=" + YearID, CommandType.Text);
        }
        public SqlDataReader UpdatePublishSudentGrade(int StudentID,string Status)
        {
            return ConnectionFactory.ExecuteCommand("update StudentGrades set Publish_Status='" + Status + "', Publish_Status_Date=getdate() where StudentID=" + StudentID, CommandType.Text);
        }
        public SqlDataReader GetSudentGradeAfterPublish(string StudentIDs)
        {
            return ConnectionFactory.ExecuteCommand("select S.StudentID,D.FirstName+D.LastName as Name,S.Percentage,S.Grade,S.Grade_GeneratedDate,S.Grade_StatusDate,S.Publish_Status,S.Grade_Remarks from Details D join StudentGrades S on D.DetailsID =S.StudentID where S.StudentID in(" + StudentIDs + ")", CommandType.Text);
        }
        public SqlDataReader GetContentInfo(int ProgramId, int CategoryID, int SubjectID, int unitId, string ContentName)
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@ProgramId", ProgramId);
            p[1] = new SqlParameter("@CategoryId", CategoryID);
            p[2] = new SqlParameter("@SubjectId", SubjectID);
            p[3] = new SqlParameter("@unitId", unitId);
            p[4] = new SqlParameter("@ContentName", ContentName);

            return ConnectionFactory.ExecuteCommand("sp_GetContentInfo", CommandType.StoredProcedure, p);
        }
        public SqlDataReader GetclassInfo(string classno)
        {
            return ConnectionFactory.ExecuteCommand("Select c.ClassId,c.startdate,c.UnitID,Convert(nvarchar(50),c.StartTime)+' - '+ CONVERT(nvarchar(50), c.EndTime,c.UnitID)as classtime,(select Unit_Name from tbl_Units u where u.Unit_Id=c.UnitID) as Unitname from tbl_Class c where c.ClassNo='" + classno + "'", CommandType.Text);
        }
        public SqlDataReader GetIndiviualclassunit(string classno,int unitid)
        {
            return ConnectionFactory.ExecuteCommand("Select c.ClassId,c.startdate,c.UnitID,Convert(nvarchar(50),c.StartTime)+' - '+ CONVERT(nvarchar(50), c.EndTime,c.UnitID)as classtime,(select Unit_Name from tbl_Units u where u.Unit_Id=c.UnitID) as Unitname from tbl_Class c where c.ClassNo='" + classno + "' and UnitID=" + unitid, CommandType.Text);
        }
        public SqlDataReader getunitsbasedonclass(string classno)
        {
            return ConnectionFactory.ExecuteCommand("select c.UnitID,(select u.Unit_Name from tbl_Units u where u.Unit_Id=c.UnitID) as unitname from tbl_Class c where ClassNo='" + classno + "'", CommandType.Text);
        }
        public SqlDataReader GetSubjectClassInfo(string classId)
        {
            SqlParameter[] p = new SqlParameter[1];

            p[0] = new SqlParameter("@classId", classId);

            return ConnectionFactory.ExecuteCommand("sp_GetSubjectClassInfo", CommandType.StoredProcedure, p);
        }

        public SqlDataReader allunitsforfaculty(string role, string sts)
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='" + role + "' and UserID not in(select UserID from tbl_FacultyUnits_Publish where Status='" + sts + "')", CommandType.Text);
        }
        public SqlDataReader AllunitsforfacultyClass(string role)
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='" + role + "' and DetailsID not in(select Student_Id from Student_Class_Publish)", CommandType.Text);
        }
        public SqlDataReader allunitsforstudents(string role,string sts)
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='" + role + "' and UserID not in(select UserID from tbl_StudentUnits_Publish where Status='" + sts + "')", CommandType.Text);
        }
        public SqlDataReader Allunitsforstudentsclass(string role)
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='" + role + "'  and DetailsID not in(select Student_Id from Student_Class_Publish)", CommandType.Text);
        }
        public SqlDataReader AllunitsforstudentExercise()
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='Student'  and DetailsID not in(select Student_Id from tbl_StudentSets_Publish)", CommandType.Text);
        }
        public SqlDataReader AllunitsforfacultyExercise()
        {
            return ConnectionFactory.ExecuteCommand("select DetailsID,UserID from Details where RoleName='Faculty'  and DetailsID not in(select Student_Id from tbl_StudentSets_Publish)", CommandType.Text);
        }
        public SqlDataReader GetContentDataToStudents(int UnitId, string ContentType, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Publish_Status,Y.Publish_StatusDate,Y.S_No from (select * from tbl_StudentContent_Publish where UnitID=" + UnitId + " and ContentType='" + ContentType + "') Y Right outer join (select DetailsID,FirstName+LastName  as Name from Details where UnitID like'%" + UnitId + "%,' and RoleName='Student' and ActiveStatus=1 and DetailsID not in (select Student_Id from tbl_StudentContent_Publish where ContentType='" + ContentType + "' and UnitId=" + UnitId + " and Publish_Status='" + Status + "')) X on X.DetailsID=Y.Student_Id", CommandType.Text);
        }

        public SqlDataReader getStudentsContentData(string sts, int unId)
        {
            return ConnectionFactory.ExecuteCommand("select ssp.Student_Id,(select (Convert(nvarchar(50),FirstName)+''+ CONVERT(nvarchar(50),LastName)) from Details where DetailsID=ssp.Student_Id) as studentname,ssp.Status,ssp.StatusDate from tbl_StudentUnits_Publish ssp where ssp.Status='" + sts + "' and ssp.Unit_Id=" + unId + " ", CommandType.Text);
        }
        public SqlDataReader GetStudentsClassData(string role, string sts, int unId)
        {
            return ConnectionFactory.ExecuteCommand("select d.DetailsID,s.StatusDate as Publish_StatusDate,s.[Status] as Publish_Status,(Convert(nvarchar(50),d.FirstName)+''+ CONVERT(nvarchar(50),d.LastName))as Studentname,s.S_No from Details d,Student_Class_Publish s where d.DetailsID=s.Student_Id and RoleName='" + role + "'  and s.Status='" + sts + "' and s.Classunit=" + unId + " ", CommandType.Text);
        }
        public SqlDataReader getFacultyContentData(string sts, int subId)
        {
            return ConnectionFactory.ExecuteCommand("select fsp.FacultyID as Student_Id,(select (Convert(nvarchar(50),FirstName)+''+ CONVERT(nvarchar(50),LastName)) from Details where DetailsID=fsp.FacultyID) as studentname,fsp.Status,fsp.StatusDate from tbl_FacultyUnits_Publish fsp where fsp.Status='" + sts + "' and fsp.Unit_Id=" + subId + "", CommandType.Text);
        }

        public SqlDataReader GetContentDataToFaculty(int UnitId, string ContentType, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Publish_Status,Y.Publish_StatusDate,Y.S_No from (select * from tbl_StudentContent_Publish where UnitID=" + UnitId + " and ContentType='" + ContentType + "') Y Right outer join (select DetailsID,FirstName+LastName  as Name from Details where UnitID like'%" + UnitId + "%,' and ActiveStatus=1 and RoleName='Faculty' and DetailsID not in (select Student_Id from tbl_StudentContent_Publish where ContentType='" + ContentType + "' and UnitId=" + UnitId + " and Publish_Status='" + Status + "')) X on X.DetailsID=Y.Student_Id", CommandType.Text);
        }
        public SqlDataReader PublishContent(int StudentID, int SubjectID, int unitId, string ContentType, string AccessLevel, string Publish_Status, string RoleName)
        {
            SqlParameter[] p = new SqlParameter[7];

            p[0] = new SqlParameter("@StudentID", StudentID);
            p[1] = new SqlParameter("@SubjectId", SubjectID);
            p[2] = new SqlParameter("@UnitId", unitId);
            p[3] = new SqlParameter("@ContentType", ContentType);
            p[4] = new SqlParameter("@AccessLevel", AccessLevel);
            p[5] = new SqlParameter("@Publish_Status", Publish_Status);
            p[6] = new SqlParameter("@RoleName", RoleName);
            return ConnectionFactory.ExecuteCommand("sp_ContentPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader selectcontentpublishlist(int StudentID, int SubjectID, int unitId, string ContentType, string AccessLevel, string PublishStatus, string RoleName, int grid, int yrid, string catschid)
        {
            return ConnectionFactory.ExecuteCommand("select * from tbl_StudentContent_Publish where Student_Id=" + StudentID + " and RoleName='" + RoleName + "' and SubjectId=" + SubjectID + " and UnitId=" + unitId + " and ContentType='" + ContentType + "' and AccessLevel='" + AccessLevel + "' and Publish_Status='" + PublishStatus + "' and Group_Id=" + grid + " and Year_Id=" + yrid + " and category_Schedule_Id='" + catschid + "' ", CommandType.Text);
        }
        public SqlDataReader updatecontentpublishlist(int StudentID, int SubjectID, int unitId, string ContentType, string AccessLevel, string PublishStatus, string RoleName, string stsdate, int grid, int yrid, string catschid)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentContent_Publish set Publish_Status='" + PublishStatus + "',Publish_StatusDate='" + stsdate + "' where Student_Id=" + StudentID + " and RoleName='" + RoleName + "' and SubjectId=" + SubjectID + " and UnitId=" + unitId + " and ContentType='" + ContentType + "' and AccessLevel='" + AccessLevel + "' and Group_Id=" + grid + " and Year_Id=" + yrid + " and category_Schedule_Id='" + catschid + "' ", CommandType.Text);
        }

        //public SqlDataReader insertcontentpublishlist(int StudentID, int SubjectID, int unitId, string ContentType, string AccessLevel, string PublishStatus, string RoleName, string stsdate)
        //{
        //    return ConnectionFactory.ExecuteCommand("insert into tbl_StudentContent_Publish (Student_Id,RoleName,SubjectId,UnitId,ContentType,AccessLevel,Publish_Status,Publish_StatusDate) values (StudentID,RoleName,SubjectID,unitId,ContentType,AccessLevel,PublishStatus,stsdate)", CommandType.Text);
        //}

        public SqlDataReader insertcontentpublishlist(int StudentID, int SubjectID, int unitId, string ContentType, string AccessLevel, string PublishStatus, string RoleName, string stsdate, int grid, int yrid, string catschid)
        {
            SqlParameter[] p = new SqlParameter[11];

            p[0] = new SqlParameter("@studid", StudentID);
            p[1] = new SqlParameter("@rolename", RoleName);
            p[2] = new SqlParameter("@subid", SubjectID);
            p[3] = new SqlParameter("@unid", unitId);
            p[4] = new SqlParameter("@contype", ContentType);
            p[5] = new SqlParameter("@acclevl", AccessLevel);
            p[6] = new SqlParameter("@pubstats", PublishStatus);
            p[7] = new SqlParameter("@pubstatsdat", stsdate);
            p[8] = new SqlParameter("@grpid", grid);
            p[9] = new SqlParameter("@yearid", yrid);
            p[10] = new SqlParameter("@catschid", catschid);
            return ConnectionFactory.ExecuteCommand("sp_insertStudentContentPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader updatestudentPublish(string PublishStatus, string statdate, int StudentID, int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentSubjects_Publish set Status='" + PublishStatus + "',StatusDate='" + statdate + "' where Student_Id=" + StudentID + " and Subject_Id=" + SubjectID + " ", CommandType.Text);
        }

        public SqlDataReader updatefacultypublish(string PublishStatus, string statdate, int StudentID, int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_FacultySubjects_Publish set Status='" + PublishStatus + "',StatusDate='" + statdate + "' where FacultyID=" + StudentID + " and Subject_Id=" + SubjectID + " ", CommandType.Text);
        }

        public SqlDataReader updatestudentUnitPublish(string PublishStatus, string statdate, int StudentID, int uniID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_StudentUnits_Publish set Status='" + PublishStatus + "',StatusDate='" + statdate + "' where Student_Id=" + StudentID + " and Unit_Id=" + uniID + " ", CommandType.Text);
        }

        public SqlDataReader updatestudentClassPublish(string PublishStatus, string statdate, int StudentID, int uniID,string ClassId)
        {
            return ConnectionFactory.ExecuteCommand("update Student_Class_Publish set Status='" + PublishStatus + "',StatusDate='" + statdate + "' where Student_Id=" + StudentID + " and Classunit=" + uniID + " and Class_Id='" + ClassId + "'", CommandType.Text);
        }
        public SqlDataReader updatefacultyUnitPublish(string PublishStatus, string statdate, int StudentID, int uniID)
        {
            return ConnectionFactory.ExecuteCommand("update tbl_FacultyUnits_Publish set Status='" + PublishStatus + "',StatusDate='" + statdate + "' where FacultyID=" + StudentID + " and Unit_Id=" + uniID + " ", CommandType.Text);
        }

        public SqlDataReader InsertStudentClassdetailsPublish(int StudentId,string classID,string status,string statusdate,string SchId,int unitid)
        {
            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@stdid", StudentId);
            p[1] = new SqlParameter("@classId", classID);
            p[2] = new SqlParameter("@status", status);
            p[3] = new SqlParameter("@stsdate", statusdate);
            p[4] = new SqlParameter("@SchId", SchId);
            p[5] = new SqlParameter("@unitid", unitid);
            return ConnectionFactory.ExecuteCommand("Sp_InsertStudentClassPublish", CommandType.StoredProcedure, p);
        }
        public SqlDataReader insertstudentUnitPublish(string usrid,string PublishStatus, string statdate, int StudentID, int uniID)
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@stdid", StudentID);
            p[1] = new SqlParameter("@stdname", usrid);
            p[2] = new SqlParameter("@unitid", uniID);
            p[3] = new SqlParameter("@sts", PublishStatus);
            p[4] = new SqlParameter("@stsdate", statdate);
            return ConnectionFactory.ExecuteCommand("sp_Insertstudentunitspub", CommandType.StoredProcedure, p);
        }

        public SqlDataReader insertfacultyUnitPublish(string usrid, string PublishStatus, string statdate, int StudentID, int uniID)
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@stdid", StudentID);
            p[1] = new SqlParameter("@stdname", usrid);
            p[2] = new SqlParameter("@unitid", uniID);
            p[3] = new SqlParameter("@sts", PublishStatus);
            p[4] = new SqlParameter("@stsdate", statdate);
            return ConnectionFactory.ExecuteCommand("sp_Insertfacultyunitspub", CommandType.StoredProcedure, p);
        }

        public SqlDataReader ClassesPublish(int StudentID, string ClassId, string Publish_Status, string ScheduleId,int unitid)
        {
            SqlParameter[] p = new SqlParameter[5];

            p[0] = new SqlParameter("@StudentID", StudentID);
            p[1] = new SqlParameter("@ClassId", ClassId);
            p[2] = new SqlParameter("@Publish_Status", Publish_Status);
            p[3] = new SqlParameter("@ScheduleIod", ScheduleId);
            p[4] = new SqlParameter("@unit", unitid);
            return ConnectionFactory.ExecuteCommand("sp_ClassesPublish", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetClassDataToStudents(string ClassId, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from Student_Class_Publish Y Right outer join (select DetailsID,FirstName+LastName  as Name from Details where SubjectID like '" + ClassId + "' and RoleName='Student' and  DetailsID not  in (select Student_Id from Student_Class_Publish where Status='" + Status + "')) X on X.DetailsID=Y.Student_Id", CommandType.Text);
        }

        public SqlDataReader GetClassDataToFaculty( string SubjectID, string Status)
        {
            return ConnectionFactory.ExecuteCommand("select X.DetailsID,X.Name,Y.Status as Publish_Status,Y.StatusDate as Publish_StatusDate,Y.S_No from Student_Class_Publish Y Right outer join (select DetailsID,FirstName+LastName  as Name from Details where SubjectID like '" + SubjectID + "' and RoleName='Faculty' and  DetailsID not in (select Student_Id from Student_Class_Publish where Status='" + Status + "')) X on X.DetailsID=Y.Student_Id", CommandType.Text);
        }

        public SqlDataReader GetClassesBasedonSubject(int SubjectId)
        {
            return ConnectionFactory.ExecuteCommand("Select distinct ClassNo from tbl_Class where SubjectId=" + SubjectId, CommandType.Text);
        }

        public SqlDataReader GetStudentsAfterContentPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Publish_Status,Y.Publish_StatusDate as Publish_StatusDate from Details X inner join (select Student_Id as DetailsID,Publish_Status,Publish_StatusDate from tbl_StudentContent_Publish where S_No in("+SIDs+")) Y on X.DetailsID=Y.DetailsID", CommandType.Text);
        }

        public SqlDataReader GetStudentsAfterExercisePublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select Y.DetailsID,X.FirstName+X.LastName as Name,Y.Publish_Status,Y.Publish_StatusDate as Publish_StatusDate from Details  X inner join (select Student_Id as DetailsID,Status as Publish_Status ,StatusDate as Publish_StatusDate  from tbl_StudentSets_Publish where S_No in("+SIDs+")) Y on X.DetailsID=Y.DetailsID", CommandType.Text);
        }

        public SqlDataReader GetStudentsAfterClassPublish(string SIDs)
        {
            return ConnectionFactory.ExecuteCommand("select Y.DetailsID,X.FirstName+X.LastName as Studentname,Y.Publish_Status,Y.Publish_StatusDate as Publish_StatusDate from Details  X inner join (select Student_Id as DetailsID,Status as Publish_Status ,StatusDate as Publish_StatusDate,S_No  from Student_Class_Publish where S_No in(" + SIDs + ")) Y on X.DetailsID=Y.DetailsID", CommandType.Text);
        }

        public SqlDataReader GetDateforBooking(int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select distinct(Slot_Date) from tbl_AdminBookingSlot where Slot_Date>getdate() and Subject_Id=" + SubjectID, CommandType.Text);
        }
        public SqlDataReader GetBookingIDsFromDate(int SubjectID,DateTime Date)
        {
            string a = "select Slot_ID,Slot_Name,Slot_Sessions from tbl_AdminBookingSlot where Slot_Date=convert(datetime, '" + Date + "', 104) and Subject_Id=" + SubjectID;
            return ConnectionFactory.ExecuteCommand(a, CommandType.Text);
        }

        public SqlDataReader GetCompanysList(int SlotID)
        {
            return ConnectionFactory.ExecuteCommand("select C.DetailsID,C.CompanyName+'-'+Convert(Varchar(50),ISNULL(S.Sessions,0)) as CompanyName,ISNULL(S.Sessions,0) as Sessions  from CompanyDetails C left outer join (select CompanyID,CONVERT(varchar(10), sum(Sessions)) as Sessions from tbl_companysBooking where Slot_ID=" + SlotID + " group by CompanyID)S on S.CompanyID=C.DetailsID", CommandType.Text);
        }
        public SqlDataReader GetCompanysClassForPublish(int ClassID)
        {
            return ConnectionFactory.ExecuteCommand("select B.BranchName as Name,X.CompanyID,X.Company_BranchID as DetailsId,X.Status as Publish_Status,X.StatusDate as Publish_StatusDate from tbl_CompanyBranch B join (select * from tbl_CompanySubjectPublish where  Subject_Id=(select SubjectId from tbl_Class where ClassId=" + ClassID + "))X on B.BranchID=X.Company_BranchID where B.BranchID not in(select Company_BranchID from tbl_CompanySubjectScheduleFaculty where ClassID=" + ClassID + ")", CommandType.Text);
        }
        public SqlDataReader GetCompanysClassForUnPublish(int ClassID)
        {
            return ConnectionFactory.ExecuteCommand("select B.BranchName as Name,X.Company_BranchID as DetailsId,X.Status as Publish_Status,X.StatusDate as Publish_StatusDate from tbl_CompanyBranch B join (select * from tbl_CompanySubjectScheduleFaculty where ClassID=" + ClassID + ")X on B.BranchID=X.Company_BranchID", CommandType.Text);
        }
        public SqlDataReader PublishForCompanySubject(string Company_BranchID, int ClassID)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Company_BranchID", Company_BranchID);
            p[1] = new SqlParameter("@ClassID", ClassID);
            return ConnectionFactory.ExecuteCommand("sp_companySubjectSchedule", CommandType.StoredProcedure, p);
        }
        public SqlDataReader UnPublishForCompanySubject(string Company_BranchID, int ClassID)
        {
            return ConnectionFactory.ExecuteCommand("delete from tbl_CompanySubjectScheduleFaculty where Company_BranchID='" + Company_BranchID + "' and ClassID='" + ClassID  + "'", CommandType.Text);
        }

        public SqlDataReader GetBookingGV(int SlotID,string CompanyID)
        {
            return ConnectionFactory.ExecuteCommand("select B.*,C.CompanyName from CompanyDetails C join(select * from tbl_companysBooking where Slot_ID="+SlotID+" and CompanyID in("+CompanyID+"))B on C.DetailsID=B.CompanyID", CommandType.Text);
        }
        public SqlDataReader GetRemainingSessions(int SlotID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Slot_ID", SlotID);
            return ConnectionFactory.ExecuteCommand("sp_GetRemainingSessions", CommandType.StoredProcedure, p);
        }
        public SqlDataReader InsertCompanySessions(int SlotID,string SlotName,int CmpnyID,int Sessions)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@Slot_ID", SlotID);
            p[1] = new SqlParameter("@Slot_Name", SlotName);
            p[2] = new SqlParameter("@CompanyID", CmpnyID);
            p[3] = new SqlParameter("@Sessions", Sessions);
            return ConnectionFactory.ExecuteCommand("sp_InsertCompanySessions", CommandType.StoredProcedure, p);
        }
        public SqlDataReader EditCompanySessions(int SlotID, string SlotName, int CmpnyID, int Sessions)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@Slot_ID", SlotID);
            p[1] = new SqlParameter("@Slot_Name", SlotName);
            p[2] = new SqlParameter("@CompanyID", CmpnyID);
            p[3] = new SqlParameter("@Sessions", Sessions);
            return ConnectionFactory.ExecuteCommand("sp_EditCompanySessions", CommandType.StoredProcedure, p);
        }
    }
}
