using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class FacultyBL
    {
        public SqlDataReader GetCategoryDDl(int FacultyID)
        {
            return ConnectionFactory.ExecuteCommand("select Category_Id,Category_Name from  tbl_Categories where Category_Id=(select distinct(Category_Id) from tbl_Subject where Subject_Id in(select Subject_Id from tbl_FacultySubjects_Publish where FacultyID="+FacultyID+" and Status='Publish'))", CommandType.Text);
        }

        public SqlDataReader GetFacultyProfile(int FacultyID)
        {
            return ConnectionFactory.ExecuteCommand("select X.*,Y.* from Details X join Address Y on X.DetailsID=Y.DetailsID where X.DetailsID=" + FacultyID, CommandType.Text);
        }

        public SqlDataReader GetSubjectDDlbyCategory(int FacultyID,int CategoryID)
        {
            return ConnectionFactory.ExecuteCommand("select Subject_Id,Subject_Name from tbl_Subject where Subject_Id in(select Subject_Id from tbl_FacultySubjects_Publish where FacultyID=" + FacultyID + " and Status='Publish') and Category_Id=" + CategoryID, CommandType.Text);
        }

        public SqlDataReader GetScheduleDDLbySubject(int FacultyID, int SubjectID)
        {
            return ConnectionFactory.ExecuteCommand("select ScheduleID,Subject_ScheduleID from tbl_SubjectFaculty_Schedule where SubjectID=" + SubjectID + " and FacultyID=" + FacultyID, CommandType.Text);
        }

        public SqlDataReader GetCompanyBySchedule(string ScheduleID)
        {
            return ConnectionFactory.ExecuteCommand("select CompanyId,CompanyName from CompanyDetails where CompanyId in(select distinct(CompanyID) from tbl_StudentRegPrograms where ScheduleID='"+ScheduleID+"' )", CommandType.Text);
        }

        public SqlDataReader GetSubjectDDlbyCategory(int v1, int v2, int v3)
        {
            throw new NotImplementedException();
        }
    }
}
