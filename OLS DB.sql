USE [OLS_DB]
GO
/****** Object:  ForeignKey [FK_Address_Address]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_Address]
GO
/****** Object:  ForeignKey [FK_CompanyDetails_CompanyDetails]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[CompanyDetails] DROP CONSTRAINT [FK_CompanyDetails_CompanyDetails]
GO
/****** Object:  ForeignKey [FK_tbl_Branch_tbl_Categories]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Branch] DROP CONSTRAINT [FK_tbl_Branch_tbl_Categories]
GO
/****** Object:  ForeignKey [FK_tbl_Categories_tbl_Program]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Categories] DROP CONSTRAINT [FK_tbl_Categories_tbl_Program]
GO
/****** Object:  ForeignKey [FK_tbl_companysBooking_tbl_AdminBookingSlot]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_companysBooking] DROP CONSTRAINT [FK_tbl_companysBooking_tbl_AdminBookingSlot]
GO
/****** Object:  ForeignKey [FK_tbl_Content_tbl_Categories]    Script Date: 06/24/2016 17:50:11 ******/
ALTER TABLE [dbo].[tbl_Content] DROP CONSTRAINT [FK_tbl_Content_tbl_Categories]
GO
/****** Object:  ForeignKey [FK_tbl_Content_tbl_Program]    Script Date: 06/24/2016 17:50:11 ******/
ALTER TABLE [dbo].[tbl_Content] DROP CONSTRAINT [FK_tbl_Content_tbl_Program]
GO
/****** Object:  ForeignKey [FK_tbl_Subject_tbl_Year]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Subject] DROP CONSTRAINT [FK_tbl_Subject_tbl_Year]
GO
/****** Object:  ForeignKey [FK_tbl_Units_tbl_Subject]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Units] DROP CONSTRAINT [FK_tbl_Units_tbl_Subject]
GO
/****** Object:  ForeignKey [FK_tbl_Year_tbl_Branch]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Year] DROP CONSTRAINT [FK_tbl_Year_tbl_Branch]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_UserId]
GO
/****** Object:  StoredProcedure [dbo].[SP_getCategoryByStudentDetailsId]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getCategoryByStudentDetailsId]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetContentInfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetContentInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetData]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSelectedCat_Sub_UnitsData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetSelectedCat_Sub_UnitsData]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSelectedUnitsData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetSelectedUnitsData]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUnitsScheduleBySubjects]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetUnitsScheduleBySubjects]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUnitsScheduleBySubjectsStudent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetUnitsScheduleBySubjectsStudent]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsUnitsBySchedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetStudentsUnitsBySchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewUnit]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertNewUnit]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramUnit]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ProgramUnit]
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUnits]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_updateUnits]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectScheduleDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetSubjectScheduleDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewSubject]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertNewSubject]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramSubject]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ProgramSubject]
GO
/****** Object:  StoredProcedure [dbo].[sp_validateCategory]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_validateCategory]
GO
/****** Object:  Table [dbo].[tbl_Units]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Units] DROP CONSTRAINT [FK_tbl_Units_tbl_Subject]
GO
DROP TABLE [dbo].[tbl_Units]
GO
/****** Object:  View [dbo].[temp]    Script Date: 06/24/2016 17:50:16 ******/
DROP VIEW [dbo].[temp]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSubjects]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateSubjects]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectbasedoncmpletedSCHForStudent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetSubjectbasedoncmpletedSCHForStudent]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsForSchedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetStudentsForSchedule]
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormDetailsByFormId]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getFormDetailsByFormId]
GO
/****** Object:  StoredProcedure [dbo].[sp_GEtRolesforPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GEtRolesforPublish]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getrtbookingdata]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Getrtbookingdata]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetRtdata]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_GetRtdata]
GO
/****** Object:  StoredProcedure [dbo].[sp_Realtestcommenceinfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_Realtestcommenceinfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_Realtestinfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_Realtestinfo]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEnquiryFormDetailsBySubject]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetEnquiryFormDetailsBySubject]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompanyTrainingStudents]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetCompanyTrainingStudents]
GO
/****** Object:  StoredProcedure [dbo].[sp_getcategorySubjectsdata]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_getcategorySubjectsdata]
GO
/****** Object:  StoredProcedure [dbo].[sp_getCategoryWithSubjectsdata]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_getCategoryWithSubjectsdata]
GO
/****** Object:  StoredProcedure [dbo].[SP_FacultyRegisterToSubject]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_FacultyRegisterToSubject]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubjects]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetAllSubjects]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertYearData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_insertYearData]
GO
/****** Object:  Table [dbo].[tbl_Subject]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Subject] DROP CONSTRAINT [FK_tbl_Subject_tbl_Year]
GO
DROP TABLE [dbo].[tbl_Subject]
GO
/****** Object:  View [dbo].[StudentResults]    Script Date: 06/24/2016 17:50:16 ******/
DROP VIEW [dbo].[StudentResults]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramYearddl]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ProgramYearddl]
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramGroupddl]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ProgramGroupddl]
GO
/****** Object:  Table [dbo].[tbl_Year]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Year] DROP CONSTRAINT [FK_tbl_Year_tbl_Branch]
GO
DROP TABLE [dbo].[tbl_Year]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadContentData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadContentData]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_getStudentPublishedUnits]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getStudentPublishedUnits]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertGroupData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertGroupData]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_DeleteContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddContent]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveStudents]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ActiveStudents]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActiveUsers]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_ActiveUsers]
GO
/****** Object:  StoredProcedure [dbo].[SP_DDLCategories]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DDLCategories]
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCompanySessions]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_EditCompanySessions]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllUsers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetAllUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_faculty]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_faculty]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProgramInfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetAllProgramInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategoriesforStudent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetCategoriesforStudent]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewCateGory]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertNewCateGory]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCompanySessions]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertCompanySessions]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetStudentRegisteredUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentRegistrationCancel]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetStudentRegistrationCancel]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetRegisteredUsers]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategorys]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateCategorys]
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentCategorysList]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_StudentCategorysList]
GO
/****** Object:  StoredProcedure [dbo].[sp_validateProgram]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_validateProgram]
GO
/****** Object:  Table [dbo].[tbl_Branch]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Branch] DROP CONSTRAINT [FK_tbl_Branch_tbl_Categories]
GO
DROP TABLE [dbo].[tbl_Branch]
GO
/****** Object:  Table [dbo].[tbl_Content]    Script Date: 06/24/2016 17:50:11 ******/
ALTER TABLE [dbo].[tbl_Content] DROP CONSTRAINT [FK_tbl_Content_tbl_Categories]
GO
ALTER TABLE [dbo].[tbl_Content] DROP CONSTRAINT [FK_tbl_Content_tbl_Program]
GO
DROP TABLE [dbo].[tbl_Content]
GO
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Categories] DROP CONSTRAINT [FK_tbl_Categories_tbl_Program]
GO
DROP TABLE [dbo].[tbl_Categories]
GO
/****** Object:  StoredProcedure [dbo].[SP_StudentRegistration]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_StudentRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SubjectPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectPublishForFaculty]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SubjectPublishForFaculty]
GO
/****** Object:  StoredProcedure [dbo].[sp_UnitFacultyPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_UnitFacultyPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_UnitPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_UnitPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_upadtebranchdetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_upadtebranchdetails]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_ClassD]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Update_ClassD]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Schedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Update_Schedule]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAdminProfile]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateAdminProfile]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAdminSlot]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_UpdateAdminSlot]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAffiliationContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateAffiliationContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCareerContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateCareerContent]
GO
/****** Object:  StoredProcedure [dbo].[sp_PublishItems]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_PublishItems]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdtaeDeleteQstns]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_UpdtaeDeleteQstns]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_RoleId]
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_UserId]
GO
DROP TABLE [dbo].[webpages_UsersInRoles]
GO
/****** Object:  StoredProcedure [dbo].[UpdateClass]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[UpdateClass]
GO
/****** Object:  Table [dbo].[tbl_companysBooking]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_companysBooking] DROP CONSTRAINT [FK_tbl_companysBooking_tbl_AdminBookingSlot]
GO
DROP TABLE [dbo].[tbl_companysBooking]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateclassGrid]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_UpdateclassGrid]
GO
/****** Object:  StoredProcedure [dbo].[Sp_updateclassinfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_updateclassinfo]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Updatecompanydetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Updatecompanydetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCompanyProfile]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateCompanyProfile]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateConsultingContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateConsultingContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCounsellorProfile]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateCounsellorProfile]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Updatedeleteclass]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Updatedeleteclass]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteclassGrid]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_UpdateDeleteclassGrid]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateEventContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateEventContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_updateFormStatus]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_updateFormStatus]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateNewsContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateNewsContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrgMethodContent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdatePrgMethodContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrograms]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdatePrograms]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateQstns]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_UpdateQstns]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateQuestion]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_UpdateQuestion]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateSchedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_UpdateSchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_updatestudentBooking]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_updatestudentBooking]
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStudentProfile]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_UpdateStudentProfile]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadEventData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadEventData]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadImages]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadImages]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadNewsData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadNewsData]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadProgramData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadProgramData]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadAffiliationData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadAffiliationData]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadCareerData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadCareerData]
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadConsultingData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_LoadConsultingData]
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestFillBlanks_Insert]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SampleTestFillBlanks_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestInsert]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SampleTestInsert]
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SampleTestPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveEmailId]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SaveEmailId]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentAnswers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SaveStudentAnswers]
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentAnswersBackup]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_SaveStudentAnswersBackup]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRegistraionDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetRegistraionDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRemainingSessions]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetRemainingSessions]
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormId]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getFormId]
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormRespondentDetailsByFormId]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getFormRespondentDetailsByFormId]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLoginDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetLoginDetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetNews]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetNews]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPrgMethod]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetPrgMethod]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentQstnAnswers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetStudentQstnAnswers]
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertExcelQuestions]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_InsertExcelQuestions]
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertfacultyunitspub]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_Insertfacultyunitspub]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectClassInfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetSubjectClassInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAdminSlot]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertAdminSlot]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCategorySchedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertCategorySchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertClass]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertClass]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCompanyBranchGroupDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertCompanyBranchGroupDetails]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewProgram]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertNewProgram]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertIntoStudentAns]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertIntoStudentAns]
GO
/****** Object:  StoredProcedure [dbo].[SP_insertRespondentInfo]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_insertRespondentInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSchedule]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_InsertSchedule]
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertStudentClassPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_InsertStudentClassPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertStudentContentPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_insertStudentContentPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertstudentunitspub]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_Insertstudentunitspub]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategoriesRegisteredRoles]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetCategoriesRegisteredRoles]
GO
/****** Object:  StoredProcedure [dbo].[SP_getCommunicationFormDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_getCommunicationFormDetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompanyDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetCompanyDetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetConsulting]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetConsulting]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCounsellorDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetCounsellorDetails]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCurrentCounsellerRow]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_GetCurrentCounsellerRow]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEvent]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetEvent]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFacultyRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetFacultyRegisteredUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnquiryDetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GetEnquiryDetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEnquiryForm]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetEnquiryForm]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getassmentreportdetails]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Getassmentreportdetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCareer]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetCareer]
GO
/****** Object:  StoredProcedure [dbo].[SP_FacultyRegistration]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_FacultyRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateCertificate]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_GenerateCertificate]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getacmprtlist]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[Sp_Getacmprtlist]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAffiliations]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_GetAffiliations]
GO
/****** Object:  StoredProcedure [dbo].[SP_EnquiryFormDetails_Insert]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[SP_EnquiryFormDetails_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_ExerciseData]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ExerciseData]
GO
/****** Object:  StoredProcedure [dbo].[sp_ExerciseTestPublish]    Script Date: 06/24/2016 17:50:05 ******/
DROP PROCEDURE [dbo].[sp_ExerciseTestPublish]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteEventContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeleteEventContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteNewsContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeleteNewsContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeletePrgMethodContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeletePrgMethodContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_DDLPrograms]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DDLPrograms]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegCompany]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_DeActivateRegCompany]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegCounsellor]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_DeActivateRegCounsellor]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeActivateRegisteredUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegStudents]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_DeActivateRegStudents]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeActiveUsers]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeActiveUsers]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAffiliationContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeleteAffiliationContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCareerContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeleteCareerContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteConsultingContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_DeleteConsultingContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddaffiliationContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddaffiliationContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddCareerContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddCareerContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddconsultingContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddconsultingContent]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegCompany]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ActivateRegCompany]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegCounsellor]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ActivateRegCounsellor]
GO
/****** Object:  StoredProcedure [dbo].[SP_ActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_ActivateRegisteredUsers]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegStudents]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ActivateRegStudents]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveFacultyUsers]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ActiveFacultyUsers]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddEventContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddEventContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewsContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddNewsContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProgramMethodContent]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AddProgramMethodContent]
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminRegistration]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_AdminRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_BindQstnAnsForRT]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_BindQstnAnsForRT]
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateGrade]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_CalculateGrade]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangePassword]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ChangePassword]
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckAffiliationName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[Sp_CheckAffiliationName]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkCareerName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_checkCareerName]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkConsultingName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_checkConsultingName]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkEventName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_checkEventName]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkNewsName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_checkNewsName]
GO
/****** Object:  StoredProcedure [dbo].[SP_checkProgramMethodName]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_checkProgramMethodName]
GO
/****** Object:  StoredProcedure [dbo].[sp_ClassesPublish]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ClassesPublish]
GO
/****** Object:  StoredProcedure [dbo].[sp_companySubjectSchedule]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_companySubjectSchedule]
GO
/****** Object:  StoredProcedure [dbo].[sp_ContentPublish]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[sp_ContentPublish]
GO
/****** Object:  StoredProcedure [dbo].[SP_CounselarRegistration]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_CounselarRegistration]
GO
/****** Object:  StoredProcedure [dbo].[SP_CounsellorRegistration]    Script Date: 06/24/2016 17:50:04 ******/
DROP PROCEDURE [dbo].[SP_CounsellorRegistration]
GO
/****** Object:  UserDefinedTableType [dbo].[ActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:14 ******/
DROP TYPE [dbo].[ActivateRegisteredUsers]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[Address] DROP CONSTRAINT [FK_Address_Address]
GO
DROP TABLE [dbo].[Address]
GO
/****** Object:  Table [dbo].[Affiliations_Content]    Script Date: 06/24/2016 17:50:08 ******/
DROP TABLE [dbo].[Affiliations_Content]
GO
/****** Object:  Table [dbo].[Assesment_Authorization]    Script Date: 06/24/2016 17:50:08 ******/
DROP TABLE [dbo].[Assesment_Authorization]
GO
/****** Object:  Table [dbo].[Careers_Content]    Script Date: 06/24/2016 17:50:08 ******/
DROP TABLE [dbo].[Careers_Content]
GO
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[CompanyDetails] DROP CONSTRAINT [FK_CompanyDetails_CompanyDetails]
GO
DROP TABLE [dbo].[CompanyDetails]
GO
/****** Object:  Table [dbo].[Consulting_Content]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[Consulting_Content]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[Details]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[Email]
GO
/****** Object:  Table [dbo].[Events_Content]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[Events_Content]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_Split]    Script Date: 06/24/2016 17:50:15 ******/
DROP FUNCTION [dbo].[fn_Split]
GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[LoginDetails]
GO
/****** Object:  Table [dbo].[News_Content]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[News_Content]
GO
/****** Object:  Table [dbo].[ProgramMethod_Content]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[ProgramMethod_Content]
GO
/****** Object:  Table [dbo].[RealTest]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[RealTest]
GO
/****** Object:  Table [dbo].[tbl_CompanySCH_SubjectClass]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_CompanySCH_SubjectClass]
GO
/****** Object:  Table [dbo].[tbl_CompanySubjectPublish]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_CompanySubjectPublish]
GO
/****** Object:  Table [dbo].[tbl_CompanySubjectScheduleFaculty]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_CompanySubjectScheduleFaculty]
GO
/****** Object:  Table [dbo].[Test_Qstn_Ans]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[Test_Qstn_Ans]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06/24/2016 17:50:14 ******/
DROP TABLE [dbo].[UserProfile]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_Membership] DROP CONSTRAINT [DF__webpages___IsCon__2704CA5F]
GO
ALTER TABLE [dbo].[webpages_Membership] DROP CONSTRAINT [DF__webpages___Passw__27F8EE98]
GO
DROP TABLE [dbo].[webpages_Membership]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 06/24/2016 17:50:14 ******/
DROP TABLE [dbo].[webpages_OAuthMembership]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 06/24/2016 17:50:14 ******/
DROP TABLE [dbo].[webpages_Roles]
GO
/****** Object:  Table [dbo].[tbl_SubjectFaculty_Schedule]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_SubjectFaculty_Schedule]
GO
/****** Object:  Table [dbo].[Student_Class_Publish]    Script Date: 06/24/2016 17:50:09 ******/
DROP TABLE [dbo].[Student_Class_Publish]
GO
/****** Object:  Table [dbo].[Student_Publish]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[Student_Publish]
GO
/****** Object:  Table [dbo].[StudentGrades]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[StudentGrades]
GO
/****** Object:  UserDefinedTableType [dbo].[TablevalueQuestions]    Script Date: 06/24/2016 17:50:14 ******/
DROP TYPE [dbo].[TablevalueQuestions]
GO
/****** Object:  Table [dbo].[tbl_AdminBookingSlot]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[tbl_AdminBookingSlot]
GO
/****** Object:  Table [dbo].[tbl_Class]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[tbl_Class]
GO
/****** Object:  Table [dbo].[tbl_Company_BranchGroup]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[tbl_Company_BranchGroup]
GO
/****** Object:  Table [dbo].[tbl_CompanyBranch]    Script Date: 06/24/2016 17:50:10 ******/
DROP TABLE [dbo].[tbl_CompanyBranch]
GO
/****** Object:  Table [dbo].[tbl_Counsellor]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_Counsellor]
GO
/****** Object:  Table [dbo].[tbl_Enquiry]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_Enquiry]
GO
/****** Object:  Table [dbo].[tbl_ExamResult]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_ExamResult]
GO
/****** Object:  Table [dbo].[tbl_FacultySubjects_Publish]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_FacultySubjects_Publish]
GO
/****** Object:  Table [dbo].[tbl_FacultyUnits_Publish]    Script Date: 06/24/2016 17:50:11 ******/
DROP TABLE [dbo].[tbl_FacultyUnits_Publish]
GO
/****** Object:  Table [dbo].[tbl_Program]    Script Date: 06/24/2016 17:50:12 ******/
ALTER TABLE [dbo].[tbl_Program] DROP CONSTRAINT [DF_tbl_Program_Status]
GO
DROP TABLE [dbo].[tbl_Program]
GO
/****** Object:  Table [dbo].[tbl_ResponseToEnquiry]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_ResponseToEnquiry]
GO
/****** Object:  Table [dbo].[tbl_Results]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Results]
GO
/****** Object:  Table [dbo].[tbl_Save_Student_ans]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Save_Student_ans]
GO
/****** Object:  Table [dbo].[tbl_Save_Student_ans_backup]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Save_Student_ans_backup]
GO
/****** Object:  Table [dbo].[tbl_Schedule]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Schedule]
GO
/****** Object:  Table [dbo].[tbl_Student_Ans]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Student_Ans]
GO
/****** Object:  Table [dbo].[tbl_Student_Ans_Backup]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_Student_Ans_Backup]
GO
/****** Object:  Table [dbo].[tbl_StudentBookings]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_StudentBookings]
GO
/****** Object:  Table [dbo].[tbl_StudentContent_Publish]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_StudentContent_Publish]
GO
/****** Object:  Table [dbo].[tbl_StudentExamResultDetailes]    Script Date: 06/24/2016 17:50:12 ******/
DROP TABLE [dbo].[tbl_StudentExamResultDetailes]
GO
/****** Object:  Table [dbo].[tbl_StudentRegPrograms]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_StudentRegPrograms]
GO
/****** Object:  Table [dbo].[tbl_StudentSets_Publish]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_StudentSets_Publish]
GO
/****** Object:  Table [dbo].[tbl_StudentSubjectCertificates]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_StudentSubjectCertificates]
GO
/****** Object:  Table [dbo].[tbl_StudentSubjects_Publish]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_StudentSubjects_Publish]
GO
/****** Object:  Table [dbo].[tbl_StudentUnits_Publish]    Script Date: 06/24/2016 17:50:13 ******/
DROP TABLE [dbo].[tbl_StudentUnits_Publish]
GO
/****** Object:  Table [dbo].[tbl_StudentUnits_Publish]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentUnits_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Unit_Id] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[StatusDate] [nvarchar](50) NULL,
	[ActiveStatus] [int] NULL,
	[subjectSCHId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_StudentUnits_Publish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentUnits_Publish] ON
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (12, 2, N'Satheesh', 2, N'Publish', N'2015-09-11', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (13, 2, N'Satheesh', 31, N'Publish', N'2015-09-16', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (14, 5, N'VMishra', 2, N'UnPublish', N'2015-09-07', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (15, 5, N'VMishra', 32, N'UnPublish', N'2015-09-07', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (16, 6, N'Rajesh', 33, N'UnPublish', N'2015-09-16', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (17, 6, N'Rajesh', 10, N'UnPublish', N'2015-09-16', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (20, 12, N'Tulasi', 34, N'UnPublish', N'2015-10-01', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (21, 12, N'Tulasi', 10, N'UnPublish', N'2015-10-01', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (155, 22, N'Mahe7546', 35, N'UnPublish', N'2015-10-06', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (156, 22, N'Mahe7546', 35, N'Publish', N'2015-10-06', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (157, 22, N'Mahe7546', 8, N'Publish', N'2015-10-06', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (158, 22, N'Mahe7546', 12, N'Publish', N'2015-10-06', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (159, 22, N'Mahe7546', 13, N'Publish', N'2015-10-06', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (160, 1, N'Ramesh', 30, N'Publish', N'02-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (161, 1, N'Ramesh', 31, N'Publish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (162, 2, N'Satheesh', 30, N'UnPublish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (163, 2, N'Satheesh', 31, N'UnPublish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (164, 2, N'Satheesh', 32, N'UnPublish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (165, 2, N'Satheesh', 33, N'UnPublish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (166, 2, N'Satheesh', 34, N'UnPublish', N'15-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (167, 17, N'XYZ 6212', 30, N'UnPublish', N'24-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (168, 17, N'XYZ 6212', 31, N'Publish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (169, 17, N'XYZ 6212', 32, N'Publish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (170, 17, N'XYZ 6212', 33, N'Publish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (171, 17, N'XYZ 6212', 34, N'Publish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (172, 17, N'XYZ 6212', 30, N'UnPublish', N'24-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (173, 17, N'XYZ 6212', 31, N'UnPublish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (174, 17, N'XYZ 6212', 32, N'UnPublish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (175, 17, N'XYZ 6212', 33, N'UnPublish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (176, 17, N'XYZ 6212', 34, N'UnPublish', N'21-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (177, 12, N'Tulasi', 30, N'UnPublish', N'22-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (178, 12, N'Tulasi', 31, N'Publish', N'22-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (179, 12, N'Tulasi', 32, N'Publish', N'22-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (180, 12, N'Tulasi', 33, N'Publish', N'22-06-2016', 1, NULL)
INSERT [dbo].[tbl_StudentUnits_Publish] ([S_No], [Student_Id], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (181, 12, N'Tulasi', 34, N'Publish', N'22-06-2016', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_StudentUnits_Publish] OFF
/****** Object:  Table [dbo].[tbl_StudentSubjects_Publish]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentSubjects_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Subject_Id] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [nvarchar](50) NULL,
	[ActiveStatus] [nvarchar](50) NULL,
	[subjectSCHId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_StudentSubjects] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentSubjects_Publish] ON
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (8, 2, N'Satheesh', 30, N'UnPublish', N'20-05-2016', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (9, 5, N'VMishra', 30, N'Publish', N'2015-09-07', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (12, 12, N'Tulasi', 30, N'UnPublish', N'31-05-2016', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (14, 6, N'Rajesh', 30, N'Publish', N'20-05-2016', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (19, 2, N'Satheesh', 31, N'UnPublish', N'2015-08-10', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (20, 5, N'VMishra', 4, N'UnPublish', N'2015-08-10', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (21, 6, N'Rajesh', 31, N'Publish', N'2016-04-18', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (22, 2, N'Satheesh', 5, N'UnPublish', N'2015-08-10', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (23, 5, N'VMishra', 5, N'Publish', N'2015-08-14', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (24, 6, N'Rajesh', 5, N'UnPublish', N'2015-08-14', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (27, 12, N'Tulasi', 4, N'Publish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (28, 12, N'Tulasi', 5, N'UnPublish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (155, 22, N'Mahe7546', 30, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (156, 22, N'Mahe7546', 4, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (157, 22, N'Mahe7546', 5, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (158, 22, N'Mahe7546', 6, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (159, 22, N'Mahe7546', 12, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (160, 1, N'ramesh', 28, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (161, 1, N'ramesh', 4, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (162, 1, N'ramesh', 5, N'Publish', N'2015-10-06', N'1', NULL)
INSERT [dbo].[tbl_StudentSubjects_Publish] ([S_No], [Student_Id], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (163, 1, N'ramesh', 30, N'Publish', N'2016-04-19', N'1', NULL)
SET IDENTITY_INSERT [dbo].[tbl_StudentSubjects_Publish] OFF
/****** Object:  Table [dbo].[tbl_StudentSubjectCertificates]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentSubjectCertificates](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[CertificateID] [int] NOT NULL,
	[Student_Id] [int] NULL,
	[Result_ID] [int] NULL,
	[Subject_Id] [int] NULL,
	[Certificate_Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
	[Publish_Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_StudentSubjectCertificates] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentSubjectCertificates] ON
INSERT [dbo].[tbl_StudentSubjectCertificates] ([S_No], [CertificateID], [Student_Id], [Result_ID], [Subject_Id], [Certificate_Status], [StatusDate], [Publish_Status]) VALUES (35, 1, 1, 1, NULL, N'Generated', CAST(0x7D3A0B00 AS Date), N'UnPublish')
SET IDENTITY_INSERT [dbo].[tbl_StudentSubjectCertificates] OFF
/****** Object:  Table [dbo].[tbl_StudentSets_Publish]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentSets_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Unit_Id] [int] NULL,
	[Set_ID] [int] NULL,
	[Test_Type] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NULL,
	[StatusDate] [date] NULL,
	[CatScheduleId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_StudentSubjects_Sets] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentSets_Publish] ON
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (1, 1, 3, 0, 0, N'SampleTest', N'UnPublish', CAST(0x703A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (3, 2, 3, 0, 1, N'SampleTest', N'UnPublish', CAST(0x4F3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (4, 5, 3, 0, 1, N'SampleTest', N'Publish', CAST(0x533A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (5, 1, 3, 2, 1, N'Exercise', N'Publish', CAST(0x6B3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (6, 2, 3, 2, 1, N'Exercise', N'UnPublish', CAST(0x4F3A0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (7, 5, 3, 2, 1, N'Exercise', N'Publish', CAST(0x4B3A0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (8, 1, 30, 3, 1, N'Exercise', N'UnPublish', CAST(0x6B3A0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (9, 2, 30, 30, 1, N'Exercise', N'UnPublish', CAST(0x8A3B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (10, 5, 30, 3, 1, N'Exercise', N'Publish', CAST(0x4F3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (11, 6, 30, 30, 2, N'Exercise', N'UnPublish', CAST(0x8A3B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (12, 12, 30, 30, 1, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (13, 6, 30, 3, 1, N'SampleTest', N'Publish', CAST(0x4F3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (14, 12, 30, 3, 0, N'SampleTest', N'Publish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (15, 1, 3, 0, 1, N'RealTest', N'UnPublish', CAST(0x703A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (16, 2, 3, 0, 1, N'RealTest', N'Publish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (17, 5, 3, 0, 1, N'RealTest', N'UnPublish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (18, 6, 3, 0, 1, N'RealTest', N'Publish', CAST(0x4F3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (19, 12, 3, 0, 1, N'RealTest', N'Publish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (20, 6, 3, 2, 2, N'Exercise', N'UnPublish', CAST(0xAD3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (21, 12, 3, 2, 1, N'Exercise', N'UnPublish', CAST(0x703A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (22, 1, 4, 0, 1, N'RealTest', N'Publish', CAST(0x5B3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (23, 5, 4, 0, 1, N'RealTest', N'Publish', CAST(0x5B3A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (24, 1, 3, 0, NULL, N'FinalTest', N'Publish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (25, 2, 3, 0, NULL, N'FinalTest', N'Publish', CAST(0x783A0B00 AS Date), NULL)
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (27, 17, 30, 30, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (28, 17, 30, 31, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (29, 17, 30, 32, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (30, 17, 30, 33, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (31, 17, 30, 34, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (32, 20, 30, 30, NULL, N'Exercise', N'Publish', CAST(0x813B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (33, 10, 30, 30, NULL, N'Assignment', N'Publish', CAST(0x873B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (34, 22, 30, 30, NULL, N'Exercise', N'Publish', CAST(0x883B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (35, 13, 30, 30, NULL, N'Assignment', N'Publish', CAST(0x893B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (36, 18, 30, 30, NULL, N'Assignment', N'Publish', CAST(0x893B0B00 AS Date), N'Sch21')
INSERT [dbo].[tbl_StudentSets_Publish] ([S_No], [Student_Id], [Subject_Id], [Unit_Id], [Set_ID], [Test_Type], [Status], [StatusDate], [CatScheduleId]) VALUES (37, 19, 30, 30, NULL, N'Assignment', N'Publish', CAST(0x893B0B00 AS Date), N'Sch21')
SET IDENTITY_INSERT [dbo].[tbl_StudentSets_Publish] OFF
/****** Object:  Table [dbo].[tbl_StudentRegPrograms]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentRegPrograms](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[CompanyID] [nvarchar](50) NOT NULL,
	[Company_Branch] [nvarchar](50) NULL,
	[ScheduleID] [nvarchar](50) NULL,
	[ActiveStatus] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentRegPrograms] ON
INSERT [dbo].[tbl_StudentRegPrograms] ([S_No], [Student_Id], [UserID], [ProgramID], [CategoryID], [BranchID], [CompanyID], [Company_Branch], [ScheduleID], [ActiveStatus]) VALUES (13, 1, N'ramesh', 31, 33, 20, N'ACMPSMT001', N'SMTM', N'Sch21', 1)
INSERT [dbo].[tbl_StudentRegPrograms] ([S_No], [Student_Id], [UserID], [ProgramID], [CategoryID], [BranchID], [CompanyID], [Company_Branch], [ScheduleID], [ActiveStatus]) VALUES (14, 2, N'Satheesh', 31, 33, 20, N'ACMPSMT001', N'SMTM', N'Sch21', 1)
INSERT [dbo].[tbl_StudentRegPrograms] ([S_No], [Student_Id], [UserID], [ProgramID], [CategoryID], [BranchID], [CompanyID], [Company_Branch], [ScheduleID], [ActiveStatus]) VALUES (15, 10, N'VinitMishra', 31, 33, 20, N'ACMPSMT001', N'SMTM', N'Sch21', 1)
INSERT [dbo].[tbl_StudentRegPrograms] ([S_No], [Student_Id], [UserID], [ProgramID], [CategoryID], [BranchID], [CompanyID], [Company_Branch], [ScheduleID], [ActiveStatus]) VALUES (16, 6, N'Rajesh', 31, 33, 20, N'ACMPSMT001', N'SMTM', N'Sch21', 1)
INSERT [dbo].[tbl_StudentRegPrograms] ([S_No], [Student_Id], [UserID], [ProgramID], [CategoryID], [BranchID], [CompanyID], [Company_Branch], [ScheduleID], [ActiveStatus]) VALUES (17, 12, N'Tulasi', 31, 33, 20, N'ACMPSMT001', N'SMTM', N'Sch21', 1)
SET IDENTITY_INSERT [dbo].[tbl_StudentRegPrograms] OFF
/****** Object:  Table [dbo].[tbl_StudentExamResultDetailes]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_StudentExamResultDetailes](
	[S.No Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Question_Id] [int] NULL,
	[StudentAnswer] [varchar](10) NULL,
	[SET_Id] [int] NULL,
	[StudentExamAttendedDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_StudentContent_Publish]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentContent_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[RoleName] [nvarchar](50) NULL,
	[SubjectId] [int] NULL,
	[UnitId] [int] NULL,
	[ContentType] [nvarchar](20) NULL,
	[AccessLevel] [nvarchar](20) NULL,
	[Publish_Status] [nvarchar](20) NULL,
	[Publish_StatusDate] [nvarchar](50) NULL,
	[Group_Id] [int] NULL,
	[Year_Id] [int] NULL,
	[category_Schedule_Id] [nvarchar](20) NULL,
	[contentstatus] [nvarchar](50) NULL,
	[subjectSCHId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_StudentContent_Publish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentContent_Publish] ON
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (1, 1, N'Student', 3, 1, N'Text', N'ReadOnly', N'Publish', N'2015-08-03', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (2, 2, N'Student', 3, 1, N'Text', N'ReadOnly', N'UnPublish', N'2015-08-03', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (3, 1, N'Student', 3, 2, N'Text', N'Read Only', N'Publish', N'2015-09-18', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (4, 2, N'Student', 3, 2, N'Text', N'ReadOnly', N'Publish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (5, 1, N'Student', 3, 2, N'Video', N'Download', N'UnPublish', N'2015-08-13', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (6, 2, N'Student', 3, 2, N'Video', N'ReadOnly', N'Publish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (7, 6, N'Student', 5, 12, N'Video', N'ReadOnly', N'Publish', N'2015-08-17', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (8, 6, N'Student', 3, 2, N'Text', N'Download', N'UnPublish', N'2015-09-16', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (10, 6, N'Student', 5, 13, N'Video', N'Download', N'Publish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (11, 13, N'Faculty', 3, 2, N'Text', N'Download', N'Publish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (12, 10, N'Faculty', 30, 30, N'Video', N'ReadOnly', N'UnPublish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (13, 13, N'Faculty', 30, 30, N'Video', N'Download', N'Publish', N'2015-08-17', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (14, 5, N'Student', 30, 30, N'Video', N'Download', N'UnPublish', N'2015-08-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (15, 6, N'Student', 30, 30, N'Text', N'Download', N'Publish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (22, 6, N'Student', 30, 30, N'Text', N'Download', N'Publish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (23, 2, N'Student', 30, 30, N'Text', N'Read Only', N'Publish', N'2016-05-11', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (24, 5, N'Student', 30, 30, N'Text', N'Read Only', N'UnPublish', N'2015-08-13', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (25, 6, N'Student', 30, 30, N'Text', N'Read Only', N'UnPublish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (26, 10, N'Faculty', 3, 10, N'Text', N'Read Only', N'UnPublish', N'2015-08-13', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (27, 13, N'Faculty', 30, 30, N'Text', N'Read Only', N'Publish', N'2015-08-13', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (29, 5, N'Student', 30, 30, N'Text', N'Download', N'Publish', N'2015-09-16', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (30, 17, N'Student', 3, 2, N'Text', N'Download', N'UnPublish', N'2015-09-16', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (31, 16, N'Student', 3, 2, N'Text', N'Download', N'UnPublish', N'2015-09-16', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (32, 1, N'Student', 30, 30, N'Text', N'Read Only', N'Publish', N'2016-05-17', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (33, 1, N'Student', 30, 30, N'Text', N'Read Only', N'Publish', N'2016-05-17', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (34, 6, N'Student', 30, 30, N'Text', N'Download', N'Publish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (35, 6, N'Student', 30, 32, N'Text', N'Download', N'Publish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (36, 6, N'Student', 30, 33, N'Text', N'Download', N'Publish', N'2016-05-18', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (37, 6, N'Student', 30, 32, N'Text', N'Download', N'Publish', N'19-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (40, 12, N'Student', 30, 30, N'Text', N'Read Only', N'UnPublish', N'25-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (41, 12, N'Student', 30, 32, N'Text', N'Read Only', N'UnPublish', N'25-05-2016', 20, 30, NULL, NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (42, 12, N'Student', 30, 30, N'Text', N'Read Only', N'UnPublish', N'27-05-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (43, 12, N'Student', 30, 32, N'Text', N'Read Only', N'UnPublish', N'31-05-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (44, 0, N'Student', 30, 32, N'Text', N'Read Only', N'Publish', N'01-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (60, 13, N'Faculty', 30, 30, N'Text', N'Read Only', N'Publish', N'14-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (61, 2, N'Student', 30, 30, N'Text', N'Download', N'UnPublish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (62, 2, N'Student', 30, 31, N'Text', N'Download', N'UnPublish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (63, 2, N'Student', 30, 32, N'Text', N'Download', N'UnPublish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (64, 2, N'Student', 30, 33, N'Text', N'Download', N'UnPublish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (65, 2, N'Student', 30, 34, N'Text', N'Download', N'UnPublish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (66, 1, N'Student', 30, 31, N'Text', N'Read Only', N'Publish', N'15-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (67, 17, N'Student', 30, 30, N'Text', N'Read Only', N'Publish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (68, 17, N'Student', 30, 31, N'Text', N'Read Only', N'Publish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (69, 17, N'Student', 30, 32, N'Text', N'Read Only', N'Publish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (70, 17, N'Student', 30, 33, N'Text', N'Read Only', N'Publish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (71, 17, N'Student', 30, 34, N'Text', N'Read Only', N'Publish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (72, 17, N'Student', 30, 30, N'Text', N'Download', N'Publish', N'24-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (73, 17, N'Student', 30, 31, N'Text', N'Download', N'UnPublish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (74, 17, N'Student', 30, 32, N'Text', N'Download', N'UnPublish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (75, 17, N'Student', 30, 33, N'Text', N'Download', N'UnPublish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (76, 17, N'Student', 30, 34, N'Text', N'Download', N'UnPublish', N'21-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (77, 12, N'Student', 30, 30, N'Text', N'Download', N'UnPublish', N'22-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (78, 12, N'Student', 30, 31, N'Text', N'Download', N'Publish', N'22-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (79, 12, N'Student', 30, 32, N'Text', N'Download', N'Publish', N'22-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (80, 12, N'Student', 30, 33, N'Text', N'Download', N'Publish', N'22-06-2016', 20, 30, N'Sch21', NULL, NULL)
INSERT [dbo].[tbl_StudentContent_Publish] ([S_No], [Student_Id], [RoleName], [SubjectId], [UnitId], [ContentType], [AccessLevel], [Publish_Status], [Publish_StatusDate], [Group_Id], [Year_Id], [category_Schedule_Id], [contentstatus], [subjectSCHId]) VALUES (81, 12, N'Student', 30, 34, N'Text', N'Download', N'Publish', N'22-06-2016', 20, 30, N'Sch21', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_StudentContent_Publish] OFF
/****** Object:  Table [dbo].[tbl_StudentBookings]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_StudentBookings](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Subject_Id] [int] NULL,
	[BookingDate] [date] NULL,
	[Slot_ID] [int] NULL,
	[BookingSession] [nvarchar](50) NULL,
	[BookingTime] [datetime] NULL,
	[Location] [nvarchar](50) NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
	[Publish_Status] [int] NULL,
	[Newbooking_date] [date] NULL,
	[Newbooking_Time] [datetime] NULL,
	[NewBK_Slot] [nvarchar](50) NULL,
	[NewBK_Session] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_StudentBookings] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_StudentBookings] ON
INSERT [dbo].[tbl_StudentBookings] ([S_No], [Student_Id], [UserID], [Subject_Id], [BookingDate], [Slot_ID], [BookingSession], [BookingTime], [Location], [CompanyID], [Status], [StatusDate], [Publish_Status], [Newbooking_date], [Newbooking_Time], [NewBK_Slot], [NewBK_Session]) VALUES (1, 1, N'ramesh', 25, CAST(0x563A0B00 AS Date), 1, N'Morning', CAST(0x0000A4FB010FF33F AS DateTime), N'1', N'ACMPSMT001', N'Pending', CAST(0x5E3A0B00 AS Date), 1, CAST(0x503B0B00 AS Date), CAST(0x0000A5F500C5C100 AS DateTime), N'Slot-A', N'Morning')
INSERT [dbo].[tbl_StudentBookings] ([S_No], [Student_Id], [UserID], [Subject_Id], [BookingDate], [Slot_ID], [BookingSession], [BookingTime], [Location], [CompanyID], [Status], [StatusDate], [Publish_Status], [Newbooking_date], [Newbooking_Time], [NewBK_Slot], [NewBK_Session]) VALUES (2, 2, N'Satheesh', 25, CAST(0x933A0B00 AS Date), 2, N'Afternoon', CAST(0x0000A5DE00C5C100 AS DateTime), N'1', N'ACMPSMT001', N'New', CAST(0x5E3A0B00 AS Date), 1, CAST(0x513B0B00 AS Date), CAST(0x0000A5F600A4CB80 AS DateTime), N'Slot-A', N'Morning')
SET IDENTITY_INSERT [dbo].[tbl_StudentBookings] OFF
/****** Object:  Table [dbo].[tbl_Student_Ans_Backup]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Student_Ans_Backup](
	[SansID] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[RTId] [int] NULL,
	[Subject_ID] [int] NULL,
	[Qustion_ID] [nvarchar](max) NULL,
	[Question_Answeres] [nvarchar](max) NULL,
	[Canceled_Time] [datetime] NOT NULL,
	[STatus] [nvarchar](50) NULL,
	[statusDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Student_Ans_Backup] PRIMARY KEY CLUSTERED 
(
	[SansID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Student_Ans]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Student_Ans](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[RT_ID] [int] NULL,
	[SubjectId] [int] NULL,
	[Qstn_Ids] [nvarchar](max) NULL,
	[Std_Answered] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
 CONSTRAINT [PK_tbl_Student_Ans] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Student_Ans] ON
INSERT [dbo].[tbl_Student_Ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [Qstn_Ids], [Std_Answered], [Status], [StatusDate]) VALUES (42, 1, 1, 25, N'8,9,10,11,12,14,18,19,20,22,29,30,31,32,33,39,40,41,42,43', N'C ,A ,E ,D ,B ,B ,D ,B ,E ,F,F,F,F,F,F,F,F,F,F,F', N'UnPublish', CAST(0x483B0B00 AS Date))
INSERT [dbo].[tbl_Student_Ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [Qstn_Ids], [Std_Answered], [Status], [StatusDate]) VALUES (43, 2, 2, 25, N'8,9,10,11,12,14,18,19,20,22,29,30,31,32,33,39,40,41,42,43', N'B ,D ,D ,E ,E ,A ,B ,B ,B ,B ,B ,B ,B ,D ,C ,F,F,F,F,F', N'UnPublish', CAST(0x493B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Student_Ans] OFF
/****** Object:  Table [dbo].[tbl_Schedule]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Schedule](
	[S_NO] [int] IDENTITY(1,1) NOT NULL,
	[Schedule_ID] [nvarchar](20) NULL,
	[Subject_ScheduleID] [nvarchar](20) NULL,
	[Category_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Reg_Date] [nvarchar](50) NULL,
	[Start_Date] [nvarchar](50) NULL,
	[End_date] [nvarchar](50) NULL,
	[Duration] [nvarchar](20) NULL,
	[Assigned_Date] [nvarchar](50) NULL,
	[Schedule_srt_Date] [nvarchar](50) NULL,
	[Schedule_end_Date] [nvarchar](50) NULL,
	[Status] [nvarchar](20) NULL,
	[Status_date] [nvarchar](50) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ScheduleStatus] [nvarchar](50) NULL,
	[ScheduleYear] [nvarchar](20) NULL,
	[subjectstatus] [int] NULL,
 CONSTRAINT [PK_tbl_Schedule] PRIMARY KEY CLUSTERED 
(
	[S_NO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Schedule] ON
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (1, N'sch7', NULL, 31, 1, 0, N'1999-05-25', N'2015-05-25', N'2016-06-25', N'3', N'2015-06-26', N'Jun 26 2015 12:00AM', N'Sep 26 2016 12:00AM', N'Started', N'2015-06-26', N'Good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (2, N'Sch7', N'SUBsch9', 31, 1, 1, N'1999-01-25', N'2015-06-25', N'2016-06-25', N'3', N'2015-06-26', N'Jun 26 2015 12:00AM', N'Sep 26 2015 12:00AM', N'New', N'2015-06-26', N'NA', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (10, N'Sch21', N'SUB30', 31, 1, 3, N'2014-09-17', N'2014-10-17', N'2014-12-17', N'30', N'2014-07-06', N'Sep 17 2014 12:00AM', N'Oct 17 2014 12:00AM', N'Started', N'2014-07-06', N'good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (11, N'Sch21', N'SUB30', 31, 1, 3, N'2015-06-17', N'2015-06-17', N'2015-12-17', N'30', N'2015-07-06', N'Jul  6 2015 12:00AM', N'Jul  7 2015 12:00AM', N'Completed', N'2015-07-06', N'good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (12, N'Sch21', N'SUB3', 31, 1, 3, N'2015-06-17', N'2015-10-05', N'2015-11-05', N'300', N'2015-07-06', N'Oct  5 2015 12:00AM', N'Nov  5 2015 12:00AM', N'Completed', N'2015-07-06', N'good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (13, N'Sch21', N'SUB23', 31, 1, 3, N'2015-06-17', N'2015-12-18', N'2016-01-17', N'30', N'2015-07-06', N'Dec 18 2015 12:00AM', N'Jan 17 2016 12:00AM', N'New', N'2016-01-17', N'good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (14, N'Sch21', N'SUB24', 7, 1, 24, N'2015-06-17', N'2015-10-05', N'2015-11-05', N'30', N'2015-07-06', N'Oct  5 2015 12:00AM', N'Nov  5 2015 12:00AM', N'New', N'2016-01-17', N'good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (21, N'Sch21', N'SUB30', 33, 20, 30, N'2016-04-21', N'2016-04-30', N'2016-07-30', N'90', N'2015-07-06', N'01-05-2016', N'29-07-2016', N'Completed', N'22-04-2016', N'GOOD', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (23, N'Sch23', N'SUB31', 33, 20, 31, N'2016-04-20', N'2016-04-30', N'2016-07-30', N'90', NULL, N'May 26 2016 12:00AM', N'Aug 25 2016 12:00AM', N'New', N'2016-05-25', N'Good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (24, N'Sch24', N'SUB30', 33, 20, 30, N'21-04-2016', N'2016-04-25', N'2016-05-25', N'90', NULL, N'28-06-2016', N'26-9-2016', N'New', N'06-06-2016', N'Good', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (26, N'Sch26', N'SUB32', 33, 20, 32, N'2015-09-17', N'2016-04-25', N'2016-05-25', N'30', NULL, N'May 17 2016 12:00AM', N'May 31 2016 12:00AM', N'Started', N'2016-05-17', N'assss', NULL, NULL, NULL)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (28, N'Sch28', N'SUB30', 33, 20, 30, N'21-04-2016', N'2016-04-25', N'2016-05-25', N'90', NULL, N'18-06-2016', N'16-9-2016', N'New', N'13-06-2016', N'GOOD', NULL, NULL, 1)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (30, N'Sch30', N'SUB30', 33, 20, 30, N'21-04-2016', NULL, NULL, N'90', NULL, N'16-06-2016', N'14-9-2016', N'New', N'15-06-2016', N'Good', N'1', NULL, 1)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (31, N'Sch31', N'SUB30', 33, 20, 30, N'21-04-2016', NULL, NULL, N'90', NULL, N'23-06-2016', N'21-9-2016', N'New', N'22-06-2016', N'Good', N'1', N'1', 1)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (34, N'Sch34', N'SUB30', 33, 20, 30, N'21-04-2016', NULL, NULL, N'90', NULL, N'23-06-2016', N'21-9-2016', N'New', N'22-06-2016', N'Good', N'1', N'1', 1)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (35, N'Sch35', N'SUB30', 33, 20, 30, N'21-04-2016', NULL, NULL, N'90', NULL, N'23-06-2016', N'21-9-2016', N'New', N'22-06-2016', N'Good', N'1', N'1', 1)
INSERT [dbo].[tbl_Schedule] ([S_NO], [Schedule_ID], [Subject_ScheduleID], [Category_Id], [Branch_Id], [Subject_Id], [Reg_Date], [Start_Date], [End_date], [Duration], [Assigned_Date], [Schedule_srt_Date], [Schedule_end_Date], [Status], [Status_date], [Remarks], [ScheduleStatus], [ScheduleYear], [subjectstatus]) VALUES (36, N'Sch36', N'SUB30', 33, 20, 30, N'21-04-2016', NULL, NULL, N'90', NULL, N'23-06-2016', N'21-9-2016', N'New', N'22-06-2016', N'Good', N'1', N'1', 1)
SET IDENTITY_INSERT [dbo].[tbl_Schedule] OFF
/****** Object:  Table [dbo].[tbl_Save_Student_ans_backup]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Save_Student_ans_backup](
	[Student_Id] [int] NULL,
	[RTId] [int] NULL,
	[Subject_ID] [int] NULL,
	[Qustion_ID] [nvarchar](50) NULL,
	[Question_Answer] [nvarchar](max) NULL,
	[Rem_Time] [datetime] NULL,
	[examStatus] [nvarchar](50) NULL,
	[statusdate] [datetime] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'8', N'B ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70D AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'9', N'C ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70D AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'10', N'D ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70E AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'11', N'E ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70F AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'12', N'A ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70F AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'14', N'C ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD70F AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'18', N'B ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD710 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'19', N'D ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD710 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'20', N'D ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD711 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'22', N'B ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD712 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'29', N'B ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD712 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'30', N'D ', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD712 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'31', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD713 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'32', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD713 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'33', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD714 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'39', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD715 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'40', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD715 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'41', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD715 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'42', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD716 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans_backup] ([Student_Id], [RTId], [Subject_ID], [Qustion_ID], [Question_Answer], [Rem_Time], [examStatus], [statusdate]) VALUES (1, 1, 25, N'43', N'F', CAST(0x0000000000000000 AS DateTime), N'started', CAST(0x0000A5F6012DD716 AS DateTime))
/****** Object:  Table [dbo].[tbl_Save_Student_ans]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Save_Student_ans](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[RT_ID] [int] NULL,
	[SubjectId] [int] NULL,
	[examStatus] [nvarchar](50) NULL,
	[statusdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Save_Student_ans] ON
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (1, 1, 1, 25, N'Completed', CAST(0x0000A5F4012CA471 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (2, 1, 1, 25, N'Completed', CAST(0x0000A5F500D67FA4 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (3, 1, 1, 25, N'Completed', CAST(0x0000A5F500EC7F69 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (4, 1, 1, 25, N'Completed', CAST(0x0000A5F500F735B9 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (5, 1, 1, 25, N'Completed', CAST(0x0000A5F500FDACA3 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (6, 1, 1, 25, N'Completed', CAST(0x0000A5F600CCB670 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (7, 1, 1, 25, N'Completed', CAST(0x0000A5F600D21D8A AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (8, 1, 1, 25, N'Completed', CAST(0x0000A5F60110DCF1 AS DateTime))
INSERT [dbo].[tbl_Save_Student_ans] ([S_No], [StudentID], [RT_ID], [SubjectId], [examStatus], [statusdate]) VALUES (9, 1, 1, 25, N'Completed', CAST(0x0000A5F6012163E0 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Save_Student_ans] OFF
/****** Object:  Table [dbo].[tbl_Results]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Results](
	[Result_ID] [int] IDENTITY(1,1) NOT NULL,
	[Test_Type] [nvarchar](20) NULL,
	[Student_Id] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[BookingID] [int] NULL,
	[Category_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Year_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Subject_Name] [nvarchar](50) NULL,
	[Total_Qstns] [int] NULL,
	[Std_Company_Id] [int] NULL,
	[Std_Attempted_Qstns] [int] NULL,
	[Std_Un_Attempted_Qstns] [int] NULL,
	[Std_Correct_Ans] [int] NULL,
	[Std_Wrong_Ans] [int] NULL,
	[Exam_StartDate] [datetime] NULL,
	[Exam_EndDate] [datetime] NULL,
	[Std_Result] [nvarchar](50) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ExamDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
	[Set_Id] [int] NULL,
	[Solutions_Status] [nvarchar](20) NULL,
	[Publish_Status] [nvarchar](20) NULL,
	[Publish_StatusDate] [date] NULL,
	[Activity] [nvarchar](50) NULL,
	[Cretificate_Generate] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Results] PRIMARY KEY CLUSTERED 
(
	[Result_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Results] ON
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (1, N'RealTest', 1, N'ramesh', 1, 7, 1, 1, 3, N'Physics', 30, 1, 20, 10, 17, 3, CAST(0x0000A4D000A4DFE9 AS DateTime), CAST(0x0000A4D000ABBDB9 AS DateTime), N'C', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'UnPublish', N'UnPublish', CAST(0x593A0B00 AS Date), N'Generated', N'Generated')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (2, N'RealTest', 1, N'ramesh', 1, 7, 1, 1, 4, N'Chemistry', 30, 1, 23, 7, 20, 3, CAST(0x0000A4D000E6CAE9 AS DateTime), CAST(0x0000A4D000EC4929 AS DateTime), N'A', N'Excellent', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (3, N'RealTest', 5, N'VMishra', 1, 7, 1, 1, 3, N'Physics', 30, 1, 6, 25, 6, 0, CAST(0x0000A4D000E6CAE9 AS DateTime), CAST(0x0000A4D000EC4929 AS DateTime), N'F', N'Bad', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'UnPublish', N'Publish', CAST(0x593A0B00 AS Date), N'Generated', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (4, N'RealTest', 5, N'VMishra', 1, 7, 1, 1, 4, N'Chemistry', 30, 1, 23, 7, 20, 3, CAST(0x0000A4D000E6CAE9 AS DateTime), CAST(0x0000A4D000EC4929 AS DateTime), N'A', N'Excellent', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (5, N'RealTest', 1, N'ramesh', 1, 7, 1, 1, 5, N'Maths', 30, 1, 30, 0, 30, 0, CAST(0x0000A4D00107C069 AS DateTime), CAST(0x0000A4D0010D3EA9 AS DateTime), N'A', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (6, N'RealTest', 5, N'VMishra', 1, 7, 1, 1, 5, N'Maths', 30, 1, 30, 0, 30, 0, CAST(0x0000A4D00107C069 AS DateTime), CAST(0x0000A4D0010D3EA9 AS DateTime), N'A', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'UnPublish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (7, N'RealTest', 6, N'Rajesh', 1, 7, 1, 1, 3, N'Physics', 30, 1, 20, 10, 17, 3, CAST(0x0000A4D000A4DFE9 AS DateTime), CAST(0x0000A4D000ABBDB9 AS DateTime), N'C', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (8, N'RealTest', 6, N'Rajesh', 1, 7, 1, 1, 4, N'Chemistry', 30, 1, 23, 7, 20, 3, CAST(0x0000A4D000E6CAE9 AS DateTime), CAST(0x0000A4D000EC4929 AS DateTime), N'A', N'Excellent', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (9, N'RealTest', 6, N'Rajesh', 1, 7, 1, 1, 5, N'Maths', 30, 1, 30, 0, 30, 0, CAST(0x0000A4D00107C069 AS DateTime), CAST(0x0000A4D0010D3EA9 AS DateTime), N'A', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (12, N'RealTest', 2, N'Satheesh', 1, 7, 1, 1, 3, N'Physics', 30, 1, 20, 10, 17, 3, CAST(0x0000A4D000A4DFE9 AS DateTime), CAST(0x0000A4D000ABBDB9 AS DateTime), N'C', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (13, N'RealTest', 2, N'Satheesh', 1, 7, 1, 1, 4, N'Chemistry', 30, 1, 23, 7, 20, 3, CAST(0x0000A4D000E6CAE9 AS DateTime), CAST(0x0000A4D000EC4929 AS DateTime), N'A', N'Excellent', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
INSERT [dbo].[tbl_Results] ([Result_ID], [Test_Type], [Student_Id], [UserID], [BookingID], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Subject_Name], [Total_Qstns], [Std_Company_Id], [Std_Attempted_Qstns], [Std_Un_Attempted_Qstns], [Std_Correct_Ans], [Std_Wrong_Ans], [Exam_StartDate], [Exam_EndDate], [Std_Result], [Remarks], [ExamDate], [Status], [StatusDate], [Set_Id], [Solutions_Status], [Publish_Status], [Publish_StatusDate], [Activity], [Cretificate_Generate]) VALUES (14, N'RealTest', 2, N'Satheesh', 1, 7, 1, 1, 5, N'Maths', 30, 1, 30, 0, 30, 0, CAST(0x0000A4D00107C069 AS DateTime), CAST(0x0000A4D0010D3EA9 AS DateTime), N'A', N'Good', CAST(0x0000A4D000ABBDB9 AS DateTime), N'New', CAST(0x2B3A0B00 AS Date), 1, N'Publish', N'Publish', CAST(0x593A0B00 AS Date), N'Pending', N'Pending')
SET IDENTITY_INSERT [dbo].[tbl_Results] OFF
/****** Object:  Table [dbo].[tbl_ResponseToEnquiry]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ResponseToEnquiry](
	[R_SNo] [int] IDENTITY(1,1) NOT NULL,
	[R_FormId] [int] NULL,
	[R_PersonName] [varchar](50) NULL,
	[R_ResponseMessage] [varchar](max) NULL,
	[R_Email] [varchar](50) NULL,
	[R_MobileNumber] [nvarchar](50) NULL,
	[R_ResponseType] [nchar](10) NULL,
	[R_ResponseDate] [date] NULL,
 CONSTRAINT [PK_tbl_ResponseToEnquiry] PRIMARY KEY CLUSTERED 
(
	[R_SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ResponseToEnquiry] ON
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (5, 3, N'Rajesh Kumar', N'test Respondent info', N'rajesh@gmail.com', N'9010340789', N'E-Mail    ', CAST(0x6E3A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (6, 1, N'Mohan', N'2MOMI respondent info', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x6E3A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (7, 2, N'Mohan', N'test at 1:31PM', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x6E3A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (8, 4, N'Mohan', N'From Counsellor', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x6F3A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (9, 3, N'Mohan', N'', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x703A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (10, 2, N'Mohan', N'', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x703A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (11, 3, N'Mohan', N'Fee Details and Course start Date', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x723A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (12, 3, N'Mohan', N'Fee Details and Course start Date', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x723A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (13, 3, N'Mohan', N'Fee Details and Course start Date', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x723A0B00 AS Date))
INSERT [dbo].[tbl_ResponseToEnquiry] ([R_SNo], [R_FormId], [R_PersonName], [R_ResponseMessage], [R_Email], [R_MobileNumber], [R_ResponseType], [R_ResponseDate]) VALUES (14, 1, N'Mohan', N'Fee Details and Course start Date', N'mohan@gmail.com', N'8745874587', N'E-Mail    ', CAST(0x723A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_ResponseToEnquiry] OFF
/****** Object:  Table [dbo].[tbl_Program]    Script Date: 06/24/2016 17:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Program](
	[Program_id] [int] IDENTITY(1,1) NOT NULL,
	[Program_name] [nvarchar](50) NULL,
	[Program_Red_Date] [datetime] NULL,
	[Program_T_Ctgys] [int] NULL,
	[Program_Status] [nvarchar](20) NULL,
	[Program_Date] [date] NULL,
	[Program_Remarks] [nvarchar](max) NULL,
	[Status] [int] NULL CONSTRAINT [DF_tbl_Program_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_tbl_Program] PRIMARY KEY CLUSTERED 
(
	[Program_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Program] ON
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (1, N'Degree', CAST(0x00009D9800000000 AS DateTime), 1, N'Completed', CAST(0x153A0B00 AS Date), N'Good', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (2, N'Gradutation', CAST(0x000080F800000000 AS DateTime), 2, N'Started', CAST(0x173A0B00 AS Date), N'Good', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (8, N'MBBS', CAST(0x0000A4CE00000000 AS DateTime), 2, N'New', CAST(0xC23A0B00 AS Date), N'completed', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (25, N'Deploma', CAST(0x0000A51400000000 AS DateTime), 1, N'Started', CAST(0x6F3A0B00 AS Date), N'Started', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (26, N'Dep', CAST(0x0000A51500000000 AS DateTime), 1, N'Started', CAST(0x703A0B00 AS Date), N'BAD', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (27, N'Dep1', CAST(0x0000A51600000000 AS DateTime), 2, N'Started', CAST(0x703A0B00 AS Date), N'Bad', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (29, N'sssssssss', CAST(0x0000A51500000000 AS DateTime), 2, N'Started', CAST(0x773A0B00 AS Date), N'Good', 0)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (30, N'fdhfgh', CAST(0x0000A5E800000000 AS DateTime), 2, N'New', CAST(0x433B0B00 AS Date), N'Good', 0)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (31, N'Biology', CAST(0x0000A5E800000000 AS DateTime), 3, N'Started', CAST(0x433B0B00 AS Date), N'good', 1)
INSERT [dbo].[tbl_Program] ([Program_id], [Program_name], [Program_Red_Date], [Program_T_Ctgys], [Program_Status], [Program_Date], [Program_Remarks], [Status]) VALUES (32, N'Others', CAST(0x0000A5F400000000 AS DateTime), 2, N'New', CAST(0x4F3B0B00 AS Date), N'Good', 0)
SET IDENTITY_INSERT [dbo].[tbl_Program] OFF
/****** Object:  Table [dbo].[tbl_FacultyUnits_Publish]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FacultyUnits_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[FacultyID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Unit_Id] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[StatusDate] [nvarchar](50) NULL,
	[ActiveStatus] [int] NULL,
	[subjectSCHId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_FacultyUnits_Publish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_FacultyUnits_Publish] ON
INSERT [dbo].[tbl_FacultyUnits_Publish] ([S_No], [FacultyID], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (1, 10, N'Fac-Mishra', 31, N'Publish', N'2015-08-17', 1, NULL)
INSERT [dbo].[tbl_FacultyUnits_Publish] ([S_No], [FacultyID], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (2, 13, N'Fac-Sworna', 31, N'Publish', N'2015-08-17', 1, NULL)
INSERT [dbo].[tbl_FacultyUnits_Publish] ([S_No], [FacultyID], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (3, 10, N'Fac-Mishra', 30, N'UnPublish', N'2015-08-17', 1, NULL)
INSERT [dbo].[tbl_FacultyUnits_Publish] ([S_No], [FacultyID], [UserID], [Unit_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (4, 13, N'Fac-Sworna', 30, N'Publish', N'14-06-2016', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbl_FacultyUnits_Publish] OFF
/****** Object:  Table [dbo].[tbl_FacultySubjects_Publish]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FacultySubjects_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[FacultyID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Subject_Id] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [nvarchar](50) NULL,
	[ActiveStatus] [nvarchar](50) NULL,
	[subjectSCHId] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_FacultySubjects_Publish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_FacultySubjects_Publish] ON
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (1, 10, N'Fac-Mishra', 3, N'UnPublish', N'2015-09-11', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (2, 13, N'Fac-Sworna', 30, N'Publish', N'2015-09-11', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (3, 10, N'Fac-Mishra', 4, N'UnPublish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (4, 13, N'Fac-Sworna', 4, N'Publish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (5, 10, N'Fac-Mishra', 5, N'UnPublish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (6, 13, N'Fac-Sworna', 30, N'UnPublish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (7, 19, N'Vini6374', 5, N'Publish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (8, 19, N'Vini6374', 4, N'Publish', N'2015-08-17', N'1', NULL)
INSERT [dbo].[tbl_FacultySubjects_Publish] ([S_No], [FacultyID], [UserID], [Subject_Id], [Status], [StatusDate], [ActiveStatus], [subjectSCHId]) VALUES (9, 19, N'Vini6374', 30, N'Publish', N'2015-08-17', N'1', NULL)
SET IDENTITY_INSERT [dbo].[tbl_FacultySubjects_Publish] OFF
/****** Object:  Table [dbo].[tbl_ExamResult]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ExamResult](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Test_Type] [nvarchar](20) NULL,
	[Category_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Year_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Set_Id] [int] NULL,
	[Slot_Id] [int] NULL,
	[Question] [int] NULL,
	[Qstns_Answered] [nvarchar](10) NULL,
	[Publish_Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl_ExamResult] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_ExamResult] ON
INSERT [dbo].[tbl_ExamResult] ([S_No], [Student_Id], [Test_Type], [Category_Id], [Branch_Id], [Year_Id], [Subject_Id], [Set_Id], [Slot_Id], [Question], [Qstns_Answered], [Publish_Status]) VALUES (1, 1, N'SampleTest', 7, 1, 1, 3, 1, 1, 1, N'3', N'Publish')
SET IDENTITY_INSERT [dbo].[tbl_ExamResult] OFF
/****** Object:  Table [dbo].[tbl_Enquiry]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Enquiry](
	[SNo] [int] IDENTITY(1,1) NOT NULL,
	[E_FormId] [nvarchar](50) NULL,
	[E_FirstName] [nvarchar](50) NULL,
	[E_LastName] [nvarchar](50) NULL,
	[E_MobileNumber] [nvarchar](50) NULL,
	[E_LandLine] [nvarchar](50) NULL,
	[E_Email] [nvarchar](50) NULL,
	[E_AltEmail] [nvarchar](50) NULL,
	[E_Qulification] [nvarchar](50) NULL,
	[E_Technicalskills] [nvarchar](50) NULL,
	[E_DoB] [date] NULL,
	[E_FatherName] [nvarchar](50) NULL,
	[E_FlatNo_UnitNo] [nvarchar](50) NULL,
	[E_HNo_DNo_PNo] [nvarchar](50) NULL,
	[E_StreetNo] [nvarchar](50) NULL,
	[E_StreetName] [nvarchar](50) NULL,
	[E_Mandal_Taluk_SubUrb] [nvarchar](50) NULL,
	[E_CountryId] [int] NULL,
	[E_StateId] [int] NULL,
	[E_DistrictId] [int] NULL,
	[E_Village_Town_City] [int] NULL,
	[E_Pincode] [varchar](50) NULL,
	[E_ProgramId] [int] NULL,
	[E_CategoryId] [int] NULL,
	[E_SubjectId] [int] NULL,
	[E_TitleInfo] [nvarchar](max) NULL,
	[E_Status] [int] NULL,
	[E_StatusDate] [date] NULL,
	[E_Remarks] [nvarchar](max) NULL,
	[E_EnquiryDate] [date] NULL,
 CONSTRAINT [PK_tbl_Enquiry] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Enquiry] ON
INSERT [dbo].[tbl_Enquiry] ([SNo], [E_FormId], [E_FirstName], [E_LastName], [E_MobileNumber], [E_LandLine], [E_Email], [E_AltEmail], [E_Qulification], [E_Technicalskills], [E_DoB], [E_FatherName], [E_FlatNo_UnitNo], [E_HNo_DNo_PNo], [E_StreetNo], [E_StreetName], [E_Mandal_Taluk_SubUrb], [E_CountryId], [E_StateId], [E_DistrictId], [E_Village_Town_City], [E_Pincode], [E_ProgramId], [E_CategoryId], [E_SubjectId], [E_TitleInfo], [E_Status], [E_StatusDate], [E_Remarks], [E_EnquiryDate]) VALUES (1, N'1', N'Rajesh', N'Nallamotu', N'9010340789', N'04047774777', N'rajesh@smtindia.net', N'rajesh@yahoo.com', N'M.C.A', N'ComputerScience', CAST(0x613A0B00 AS Date), N'Subbarao', N'1-01', N'8', N'8', N'L.N.Colony', N'Uppal', 0, 0, 0, 1, N'500039', 7, 7, 4, N'Fee Details and Course start Date', 1, CAST(0x723A0B00 AS Date), NULL, CAST(0x6A3A0B00 AS Date))
INSERT [dbo].[tbl_Enquiry] ([SNo], [E_FormId], [E_FirstName], [E_LastName], [E_MobileNumber], [E_LandLine], [E_Email], [E_AltEmail], [E_Qulification], [E_Technicalskills], [E_DoB], [E_FatherName], [E_FlatNo_UnitNo], [E_HNo_DNo_PNo], [E_StreetNo], [E_StreetName], [E_Mandal_Taluk_SubUrb], [E_CountryId], [E_StateId], [E_DistrictId], [E_Village_Town_City], [E_Pincode], [E_ProgramId], [E_CategoryId], [E_SubjectId], [E_TitleInfo], [E_Status], [E_StatusDate], [E_Remarks], [E_EnquiryDate]) VALUES (2, N'2', N'Mohan', N'Babu', N'7896541235', N'4404545454', N'ramesh@smtindia.net', N'mohan@yahoo.com', N'M.B.A', N'Finance', CAST(0x633A0B00 AS Date), N'Rakesh', N'45-10', N'12', N'12', N'SVN Colony', N'Ramanthapur', 0, 0, 0, 2, N'500017', 7, 7, 3, N'Please sent Course Details', 0, NULL, NULL, CAST(0x6A3A0B00 AS Date))
INSERT [dbo].[tbl_Enquiry] ([SNo], [E_FormId], [E_FirstName], [E_LastName], [E_MobileNumber], [E_LandLine], [E_Email], [E_AltEmail], [E_Qulification], [E_Technicalskills], [E_DoB], [E_FatherName], [E_FlatNo_UnitNo], [E_HNo_DNo_PNo], [E_StreetNo], [E_StreetName], [E_Mandal_Taluk_SubUrb], [E_CountryId], [E_StateId], [E_DistrictId], [E_Village_Town_City], [E_Pincode], [E_ProgramId], [E_CategoryId], [E_SubjectId], [E_TitleInfo], [E_Status], [E_StatusDate], [E_Remarks], [E_EnquiryDate]) VALUES (3, N'3', N'Rajesh', N'Nallamotu', N'9010340789', N'04047774777', N'rajeshkmr921@gmail.com', N'rajesh@yahoo.com', N'M.C.A', N'ComputerScience', CAST(0x613A0B00 AS Date), N'Subbarao', N'1-01', N'8', N'8', N'L.N.Colony', N'Uppal', 0, 0, 0, 1, N'500039', 7, 7, 3, N'Fee Details and Course start Date', 1, NULL, NULL, CAST(0x6A3A0B00 AS Date))
INSERT [dbo].[tbl_Enquiry] ([SNo], [E_FormId], [E_FirstName], [E_LastName], [E_MobileNumber], [E_LandLine], [E_Email], [E_AltEmail], [E_Qulification], [E_Technicalskills], [E_DoB], [E_FatherName], [E_FlatNo_UnitNo], [E_HNo_DNo_PNo], [E_StreetNo], [E_StreetName], [E_Mandal_Taluk_SubUrb], [E_CountryId], [E_StateId], [E_DistrictId], [E_Village_Town_City], [E_Pincode], [E_ProgramId], [E_CategoryId], [E_SubjectId], [E_TitleInfo], [E_Status], [E_StatusDate], [E_Remarks], [E_EnquiryDate]) VALUES (4, N'4', N'Sandeep', N'Patil', N'8745698745', N'45645645666', N'sandeep@gmail.com', N'sandeep@yahoo.com', N'B.A', N'Arts', CAST(0x19390B00 AS Date), N'Patel', N'7-10', N'10-4', N'2', N'TempleStreet', N'1', 0, 0, 0, 1, N'500030', 25, 27, 18, N'Eng Subject Info', 0, NULL, NULL, CAST(0x6F3A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_Enquiry] OFF
/****** Object:  Table [dbo].[tbl_Counsellor]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Counsellor](
	[SNo] [int] IDENTITY(1,1) NOT NULL,
	[CounsellorId] [nvarchar](50) NULL,
	[C_FName] [varchar](50) NULL,
	[C_LName] [varchar](50) NULL,
	[C_FatherName] [varchar](50) NULL,
	[C_MotherName] [varchar](50) NULL,
	[DOB] [date] NULL,
	[POB] [nvarchar](50) NULL,
	[MobileNumber] [varchar](50) NULL,
	[LandLineNumber] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Alt_EmailId] [varchar](50) NULL,
	[Edu_Qualification] [varchar](50) NULL,
	[TechnicalSkills] [varchar](50) NULL,
	[CounsellorImage] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[StateId] [int] NULL,
	[DistrictId] [int] NULL,
	[Mandal_Taluk_Suburb] [int] NULL,
	[Village_Town_City] [int] NULL,
	[Pincode] [varchar](50) NULL,
	[StreetNo] [varchar](50) NULL,
	[StreetName] [varchar](50) NULL,
	[HNo] [varchar](50) NULL,
	[Flat_UnitNo] [varchar](50) NULL,
	[LandMarkName] [varchar](50) NULL,
	[CounsellorLocation] [varchar](50) NULL,
	[WorkExp] [int] NULL,
	[EmployerName] [varchar](50) NULL,
	[EmployerAddress] [varchar](50) NULL,
	[EmployerPhone] [varchar](50) NULL,
	[EmployerEmailId] [varchar](50) NULL,
	[AccessCode] [varchar](50) NULL,
	[ActiveStatus] [int] NULL,
	[DateofRegistration] [date] NULL,
	[ActivationDate] [date] NULL,
	[StatusDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[CounsellorRemarks] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Counsellor] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Counsellor] ON
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (1, N'1RANA', N'Rajesh Kumar', N'Nallamotu', N'Subbarao', N'Lalitha', CAST(0x683A0B00 AS Date), N'Guntur', N'9010340789', N'9874562145', N'rajesh@gmail.com', N'rajesh@yahoo.com', N'M.C.A', N'ComputerScience', N'Rajesh_N.jpg', 1, 1, 1, 1, 1, N'500039', N'24', N'L.N.Colony', N'2-24-107/3', N'2-24', N'Jersey', N'Hyderabad', 5, N'SMT', N'Habsiguda', N'9874563210', N'smt@gamil.com', NULL, 0, CAST(0x693A0B00 AS Date), NULL, CAST(0x843A0B00 AS Date), N'Registered', NULL)
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (2, N'2MOMI', N'Mohan', N'Babu', N'Prakash', N'Lakshmi', CAST(0x2A3A0B00 AS Date), N'Hyderabad', N'8745874587', N'8795478595', N'mohan@gmail.com', N'mohan@yahoo.com', N'M.B.A', N'Finance', N'download.jpg', 3, 4, 3, 1, 1, N'560025', N'8', N'Srinivasapuram', N'3-74-102', N'3-45', N'Clock Tower', N'Hyderabad', 6, N'Capital IQ', N'Hitech', N'8745774587', N'mohan@micro.com', NULL, 0, CAST(0x693A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL)
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (3, N'3PRPO', N'Prakash', N'Puppala', N'Yadgiri', N'Mounika', CAST(0x663A0B00 AS Date), N'Hyderabd', N'7896547894', N'6547859654', N'prakash@gmail.com', N'prakash@yahoo.com', N'B.Tech', N'IT', N'gerbera1.jpg', 5, 1, 1, 3, 1, N'500039', N'3', N'Bank Street', N'4-01/012', N'4-01', N'Jayapriaya Building', N'Hyderabad', 1, N'Tech Mahendra', N'Madhapur', N'7898877878', N'prakash@sbi.com', NULL, 0, CAST(0x693A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL)
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (4, N'4RARA', N'Rakesh', N'Popuri', N'Krishna', N'Mohini', CAST(0x49290B00 AS Date), N'Secunderabad', N'4567896587', N'9874587458', N'rakesh@gmail.com', N'ram@yahoo.com', N'B.A', N'Politics', N'images.jpg', 4, 5, 1, 1, 1, N'500123', N'5', N'Rmalayam', N'10-20-102/3', N'10-20', N'Tankbund', N'Secuderabad', 3, N'SMT', N'Haidarguda', N'8745875879', N'rambabu@bank.com', NULL, -1, CAST(0x693A0B00 AS Date), NULL, CAST(0x843A0B00 AS Date), N'Cancel', NULL)
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (5, N'5RARA', N'Rambabu', N'Ram', N'Balu', N'Babhi', CAST(0x242C0B00 AS Date), N'Nellore', N'7456987456', N'6547896589', N'rambabu@gmail.com', N'rakesh@yahoo.com', N'M.C.A', N'ComputerScience', N'images.jpg', 4, 5, 4, 2, 2, N'500014', N'10', N'Balanagar', N'12-45/A', N'1-201-A', N'HighWay', N'Hyderabad', 5, N'SMT', N'Habsiguda', N'9874563210', N'rakesh@poly.com', NULL, 1, CAST(0x693A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL)
INSERT [dbo].[tbl_Counsellor] ([SNo], [CounsellorId], [C_FName], [C_LName], [C_FatherName], [C_MotherName], [DOB], [POB], [MobileNumber], [LandLineNumber], [EmailId], [Alt_EmailId], [Edu_Qualification], [TechnicalSkills], [CounsellorImage], [CountryId], [StateId], [DistrictId], [Mandal_Taluk_Suburb], [Village_Town_City], [Pincode], [StreetNo], [StreetName], [HNo], [Flat_UnitNo], [LandMarkName], [CounsellorLocation], [WorkExp], [EmployerName], [EmployerAddress], [EmployerPhone], [EmployerEmailId], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [CounsellorRemarks]) VALUES (6, N'6MAGO', N'RajeshKumar', N'Nallamotu', N'Subbarao', N'Lalitha', CAST(0x683A0B00 AS Date), N'Guntur', N'9010340789', N'9874562145', N'rajesh@gmail.com', N'mahesh@yahoo.com', N'M.C.A', N'ComputerScience', N'Mahesh_Gonuguntla.jpg', 1, 1, 1, 4, 4, N'500039', N'3', N'L.N.Colony', N'2-24-107/3', N'2-24', N'Jersey', N'Hyderabad', 5, N'SMT', N'Habsiguda', N'9874563210', N'smt@gamil.com', NULL, 0, CAST(0x693A0B00 AS Date), NULL, CAST(0x843A0B00 AS Date), N'Registered', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Counsellor] OFF
/****** Object:  Table [dbo].[tbl_CompanyBranch]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompanyBranch](
	[SNo_ID] [int] IDENTITY(1,1) NOT NULL,
	[BranchID] [nvarchar](50) NULL,
	[CompanyDetailID] [int] NULL,
	[CompanyID] [nvarchar](50) NULL,
	[BranchName] [nvarchar](50) NULL,
	[BranchLocation] [nvarchar](50) NULL,
	[BranchArea] [nvarchar](50) NULL,
	[BranchOffice] [nvarchar](50) NULL,
	[BranchStatus] [nvarchar](50) NULL,
	[RegistrationDate] [date] NULL,
	[ActiveStatus] [int] NULL,
	[No_Of_sessions] [int] NULL,
 CONSTRAINT [PK_tbl_CompanyBranch] PRIMARY KEY CLUSTERED 
(
	[SNo_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CompanyBranch] ON
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (2, N'BSMT2', 1, N'ACMPSMT001', N'SMT-M', N'Madapur', N'CyberPerl', N'Tarnaka', N'Active', CAST(0x853A0B00 AS Date), 1, 9)
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (3, N'InfM', 2, N'ACMPInf002', N'Info-M', N'Madapur', N'Cyber Perl', N'S City', N'Active', CAST(0x853A0B00 AS Date), 1, 3)
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (7, N'IBMM', 3, N'ACMPIBM003', N'IBMS-Main', N'ghbryj', N'fggggbwj', NULL, N'Active', CAST(0x863A0B00 AS Date), 1, 6)
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (11, N'SMT779', 1, N'ACMPSMT001', N'SMT3', N'Hyderabad', N'kukatpally', N'SMT3', N'Active', CAST(0x873A0B00 AS Date), 1, 8)
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (12, N'SMT044', 1, N'ACMPSMT001', N'SMT-MM', N'Hyderabad', N'fddfffffgs', N'dfddgdfg', N'Active', CAST(0x1F3B0B00 AS Date), 1, 4)
INSERT [dbo].[tbl_CompanyBranch] ([SNo_ID], [BranchID], [CompanyDetailID], [CompanyID], [BranchName], [BranchLocation], [BranchArea], [BranchOffice], [BranchStatus], [RegistrationDate], [ActiveStatus], [No_Of_sessions]) VALUES (13, N'SMT952', 1, N'ACMPSMT001', N'ACMP-Vskp', N'visakhapatnam', N'mvp', N'scitus', N'Active', CAST(0x893B0B00 AS Date), 1, 8)
SET IDENTITY_INSERT [dbo].[tbl_CompanyBranch] OFF
/****** Object:  Table [dbo].[tbl_Company_BranchGroup]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company_BranchGroup](
	[SNo] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [nvarchar](50) NULL,
	[Company_BranchID] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[GroupID] [int] NULL,
	[StatusDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[ActiveStatus] [int] NULL,
 CONSTRAINT [PK_tbl_Company_BranchGroup] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Company_BranchGroup] ON
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (1, N'ACMPSMT001', N'BSMT2', 33, 20, CAST(0xF33A0B00 AS Date), N'Active', 1)
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (5, N'ACMPSMT001', N'SMT779', 7, 1, CAST(0xF33A0B00 AS Date), N'DeActivated', 0)
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (6, N'ACMPSMT001', N'SMTM', 7, 1, CAST(0xF33A0B00 AS Date), N'Active', 1)
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (7, N'ACMPSMT001', N'SMT779', 1, 6, CAST(0x193B0B00 AS Date), N'Active', 1)
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (8, N'ACMPSMT001', N'BSMT2', 33, 21, CAST(0x193B0B00 AS Date), N'Active', 1)
INSERT [dbo].[tbl_Company_BranchGroup] ([SNo], [CompanyId], [Company_BranchID], [CategoryID], [GroupID], [StatusDate], [Status], [ActiveStatus]) VALUES (9, N'ACMPInf002', N'InfM', 1, 6, CAST(0x193B0B00 AS Date), N'Active', 1)
SET IDENTITY_INSERT [dbo].[tbl_Company_BranchGroup] OFF
/****** Object:  Table [dbo].[tbl_Class]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[programId] [int] NULL,
	[CategoryId] [int] NULL,
	[SubjectId] [int] NULL,
	[ScheduleID] [nvarchar](50) NULL,
	[startdate] [datetime] NULL,
	[Enddate] [datetime] NULL,
	[Duration] [nvarchar](30) NULL,
	[UnitID] [int] NULL,
	[ClassType] [nvarchar](10) NULL,
	[StartTime] [nvarchar](10) NULL,
	[EndTime] [nvarchar](10) NULL,
	[Hours] [int] NULL,
	[FacultyID] [int] NULL,
	[Faculty] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[StatusDate] [datetime] NULL,
	[Remarks] [nvarchar](50) NULL,
	[Category_Schedule] [nvarchar](50) NULL,
	[ClassNo] [nvarchar](30) NULL,
	[ActiveStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl.Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Class] ON
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (2, 5, 4, 1, NULL, CAST(0x0000A4BF00000000 AS DateTime), CAST(0x0000A4BF00000000 AS DateTime), N'2', 20, N'On-Line', N'12:00', N'14.10', 2, 13, N'Sworna Lenka', N'1', CAST(0x0000A4BF00000000 AS DateTime), N'good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (5, 7, 7, 5, NULL, CAST(0x0000A4EA00000000 AS DateTime), CAST(0x0000A50E00000000 AS DateTime), N'2', 21, N'On-Line', N'12:00', N'02:00', 2, 13, N'Sworna LenKa', N'1', CAST(0x0000A50F00000000 AS DateTime), N'good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (6, 7, 7, 3, N'SUB2', CAST(0x0000A50600000000 AS DateTime), CAST(0x0000A51000000000 AS DateTime), N'1', 22, N'On-Line', N'10:00', N'11:00', 1, 13, N'Sworna LenKa', N'New', CAST(0x0000A51100000000 AS DateTime), N'Good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (7, 7, 7, 3, N'SUB30', CAST(0x0000A53C00000000 AS DateTime), CAST(0x0000A53F00000000 AS DateTime), N'1', 31, N'On-Line', N'10:00', N'11:00', 1, 13, N'Sworna LenKa', N'New', CAST(0x0000A53D00000000 AS DateTime), N'good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (8, 7, 7, 3, N'SUBSch9', CAST(0x0000A3CF00000000 AS DateTime), CAST(0x0000A3D200000000 AS DateTime), N'1', 24, N'On-Line', N'07:00', N'09:00', 2, 13, N'Sworna LenKa', N'New', CAST(0x0000A53D00000000 AS DateTime), N'good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (9, 7, 7, 4, N'SUB3', CAST(0x0000A52400000000 AS DateTime), CAST(0x0000A52E00000000 AS DateTime), N'1', 25, N'On-Line', N'10:00', N'11:00', 1, 13, N'Sworna LenKa', N'New', CAST(0x0000A51100000000 AS DateTime), N'Good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (10, 7, 7, 4, N'SUB3', CAST(0x0000A52F00000000 AS DateTime), CAST(0x0000A53200000000 AS DateTime), N'1', 10, N'On-Line', N'10:00', N'11:00', 1, 13, N'Sworna LenKa', N'New', CAST(0x0000A53D00000000 AS DateTime), N'good', NULL, NULL, N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (90, 31, 33, 30, N'SUB30', CAST(0x0000A5F900000000 AS DateTime), CAST(0x0000A5FA00000000 AS DateTime), N'1', 30, N'InClass', N'08:00', N'10:00', 2, 13, N'Sworna Len', N'New', CAST(0x0000A61300000000 AS DateTime), N'GOOD', N'Sch21', N'Class-1', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (91, 31, 33, 30, N'SUB30', CAST(0x0000A5FB00000000 AS DateTime), CAST(0x0000A5FB00000000 AS DateTime), N'1', 31, N'InClass', N'08:00', N'10:00', 2, 13, N'Sworna Len', N'New', CAST(0x0000A61300000000 AS DateTime), N'GOOD', N'Sch21', N'Class-1', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (92, 31, 33, 30, N'SUB30', CAST(0x0000A5FC00000000 AS DateTime), CAST(0x0000A5FC00000000 AS DateTime), N'1', 32, N'InClass', N'08:00', N'10:00', 2, 13, N'Sworna Len', N'New', CAST(0x0000A61300000000 AS DateTime), N'GOOD', N'Sch21', N'Class-1', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (93, 31, 33, 30, N'SUB30', CAST(0x0000A5FD00000000 AS DateTime), CAST(0x0000A5FD00000000 AS DateTime), N'1', 33, N'InClass', N'08:00', N'10:00', 2, 13, N'Sworna Len', N'New', CAST(0x0000A61300000000 AS DateTime), N'GOOD', N'Sch21', N'Class-1', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (94, 31, 33, 30, N'SUB30', CAST(0x0000A5FE00000000 AS DateTime), CAST(0x0000A5FE00000000 AS DateTime), N'1', 34, N'InClass', N'08:00', N'10:00', 2, 13, N'Sworna Len', N'Started', CAST(0x0000A61300000000 AS DateTime), N'GOOD', N'Sch21', N'Class-1', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (140, 31, 33, 30, N'SUB30', CAST(0x0000A61800000000 AS DateTime), CAST(0x0000A61800000000 AS DateTime), N'1', 30, N'On-Line', N'10:00', N'12:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-2', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (141, 31, 33, 30, N'SUB30', CAST(0x0000A61900000000 AS DateTime), CAST(0x0000A61900000000 AS DateTime), N'1', 31, N'On-Line', N'10:00', N'12:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-2', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (142, 31, 33, 30, N'SUB30', CAST(0x0000A61A00000000 AS DateTime), CAST(0x0000A61A00000000 AS DateTime), N'1', 32, N'On-Line', N'10:00', N'12:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-2', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (143, 31, 33, 30, N'SUB30', CAST(0x0000A61B00000000 AS DateTime), CAST(0x0000A61D00000000 AS DateTime), N'1', 33, N'On-Line', N'10:00', N'12:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-2', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (144, 31, 33, 30, N'SUB30', CAST(0x0000A61E00000000 AS DateTime), CAST(0x0000A61E00000000 AS DateTime), N'1', 34, N'On-Line', N'10:00', N'12:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-2', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (145, 31, 33, 30, N'SUB30', CAST(0x0000A61800000000 AS DateTime), CAST(0x0000A61800000000 AS DateTime), N'1', 30, N'On-Line', N'02:00', N'04:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-3', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (146, 31, 33, 30, N'SUB30', CAST(0x0000A62500000000 AS DateTime), CAST(0x0000A62500000000 AS DateTime), N'1', 31, N'On-Line', N'02:00', N'04:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-3', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (147, 31, 33, 30, N'SUB30', CAST(0x0000A62600000000 AS DateTime), CAST(0x0000A62600000000 AS DateTime), N'1', 32, N'On-Line', N'02:00', N'04:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-3', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (148, 31, 33, 30, N'SUB30', CAST(0x0000A62700000000 AS DateTime), CAST(0x0000A62700000000 AS DateTime), N'1', 33, N'On-Line', N'02:00', N'04:00', 2, NULL, NULL, N'New', CAST(0x0000A62400000000 AS DateTime), N'Good', N'Sch21', N'Class-3', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (190, 31, 33, 30, N'SUB30', CAST(0x0000A62E00000000 AS DateTime), CAST(0x0000A62E00000000 AS DateTime), N'1', 30, N'On-Line', N'16:00', N'18:00', 2, NULL, NULL, N'New', CAST(0x0000A62D00000000 AS DateTime), N'Good', N'Sch21', N'Class-4', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (191, 31, 33, 30, N'SUB30', CAST(0x0000A62F00000000 AS DateTime), CAST(0x0000A62F00000000 AS DateTime), N'1', 31, N'On-Line', N'16:00', N'18:00', 2, NULL, NULL, N'New', CAST(0x0000A62D00000000 AS DateTime), N'Good', N'Sch21', N'Class-4', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (192, 31, 33, 30, N'SUB30', CAST(0x0000A63000000000 AS DateTime), CAST(0x0000A63200000000 AS DateTime), N'1', 32, N'On-Line', N'16:00', N'18:00', 2, NULL, NULL, N'New', CAST(0x0000A62D00000000 AS DateTime), N'Good', N'Sch21', N'Class-4', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (193, 31, 33, 30, N'SUB30', CAST(0x0000A63300000000 AS DateTime), CAST(0x0000A63300000000 AS DateTime), N'1', 33, N'On-Line', N'16:00', N'18:00', 2, NULL, NULL, N'New', CAST(0x0000A62D00000000 AS DateTime), N'Good', N'Sch21', N'Class-4', N'1')
INSERT [dbo].[tbl_Class] ([ClassId], [programId], [CategoryId], [SubjectId], [ScheduleID], [startdate], [Enddate], [Duration], [UnitID], [ClassType], [StartTime], [EndTime], [Hours], [FacultyID], [Faculty], [status], [StatusDate], [Remarks], [Category_Schedule], [ClassNo], [ActiveStatus]) VALUES (194, 31, 33, 30, N'SUB30', CAST(0x0000A63400000000 AS DateTime), CAST(0x0000A63400000000 AS DateTime), N'1', 34, N'On-Line', N'16:00', N'18:00', 2, NULL, NULL, N'New', CAST(0x0000A62D00000000 AS DateTime), N'Good', N'Sch21', N'Class-4', N'1')
SET IDENTITY_INSERT [dbo].[tbl_Class] OFF
/****** Object:  Table [dbo].[tbl_AdminBookingSlot]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AdminBookingSlot](
	[Slot_ID] [int] IDENTITY(1,1) NOT NULL,
	[FlexField] [nvarchar](30) NULL,
	[Subject_Id] [int] NULL,
	[Slot_Name] [nvarchar](50) NULL,
	[Slot_Date] [date] NULL,
	[Slot_Time] [nvarchar](50) NULL,
	[Slot_Sessions] [int] NULL,
	[Slot_Status] [nvarchar](20) NULL,
	[StatusDate] [date] NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Slot] PRIMARY KEY CLUSTERED 
(
	[Slot_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_AdminBookingSlot] ON
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (1, N'7-7-1-1-3-2', 3, N'Morning Slot', CAST(0x333B0B00 AS Date), N'10.00.00', 20, N'New', CAST(0x453A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (2, N'7-7-1-1-3-2', 3, N'AfterNoon', CAST(0x563A0B00 AS Date), N'02:00:00', 20, N'New', CAST(0x623A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (4, N'7-7-1-1-4-10', 4, N'B-1', CAST(0x563A0B00 AS Date), N'09:00', 20, N'New', CAST(0x5D3A0B00 AS Date), N'B-1 Booking')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (7, N'25-27-13-22-18', 18, N'Morning', CAST(0x363A0B00 AS Date), N'10:00:00', 23, N'Hold', CAST(0x6F3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (8, N'7-7-1-1-3', 3, N'morning', CAST(0x713A0B00 AS Date), N'12.00pm', 22, N'New', CAST(0x703A0B00 AS Date), N'ok')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (9, N'27-29-15-25-22', 22, N'morning', CAST(0x893A0B00 AS Date), N'12:00:00', 21, N'New', CAST(0x703A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (11, N'7-7-1-1-3', 3, N'Slot-A', CAST(0x9B3A0B00 AS Date), N'10:00:00', 30, N'Changed', CAST(0x7D3A0B00 AS Date), N'Bad')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (12, N'7-7-1-1-3', 3, N'Slot-B', CAST(0x9B3A0B00 AS Date), N'12:00:00', 30, N'New', CAST(0x7D3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (13, N'7-7-1-1-3', 3, N'Slot-C', CAST(0x9B3A0B00 AS Date), N'14:00:00', 30, N'New', CAST(0x7D3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (15, N'7-7-1-1-3', 3, N'Slot-D', CAST(0x9B3A0B00 AS Date), N'16:00:00', 30, N'New', CAST(0x7D3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (16, N'7-7-1-1-3', 3, N'Slot-A', CAST(0x9C3A0B00 AS Date), N'10:00:00', 30, N'New', CAST(0x7F3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (17, N'7-7-1-1-3', 3, N'Slot-A', CAST(0x973A0B00 AS Date), N'12:00:00', 30, N'New', CAST(0x7F3A0B00 AS Date), N'good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (18, N'7-7-1-1-3', 3, N'Slot-B', CAST(0x983A0B00 AS Date), N'13:00:00', 50, N'New', CAST(0x7F3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (19, N'7-7-1-1-24', 24, N'Slot-B', CAST(0xB73A0B00 AS Date), N'13:00:00', 50, N'New', CAST(0x7F3A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (20, N'31-32-17-27-29', 29, N'Slot-B', CAST(0x663B0B00 AS Date), N'12.00', 2, N'New', CAST(0x483B0B00 AS Date), N'3')
INSERT [dbo].[tbl_AdminBookingSlot] ([Slot_ID], [FlexField], [Subject_Id], [Slot_Name], [Slot_Date], [Slot_Time], [Slot_Sessions], [Slot_Status], [StatusDate], [Remarks]) VALUES (21, N'31-33-20-31-30', 30, N'Slot-A', CAST(0x833B0B00 AS Date), N'2:00PM', 1, N'New', CAST(0x643B0B00 AS Date), N'ggg')
SET IDENTITY_INSERT [dbo].[tbl_AdminBookingSlot] OFF
/****** Object:  UserDefinedTableType [dbo].[TablevalueQuestions]    Script Date: 06/24/2016 17:50:14 ******/
CREATE TYPE [dbo].[TablevalueQuestions] AS TABLE(
	[Category_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Unit_Id] [int] NULL,
	[Test_Type] [nvarchar](20) NULL,
	[Question] [nvarchar](max) NULL,
	[A] [nvarchar](max) NULL,
	[B] [nvarchar](max) NULL,
	[C] [nvarchar](max) NULL,
	[D] [nvarchar](max) NULL,
	[E] [nvarchar](max) NULL,
	[Answer] [varchar](1) NULL,
	[Status] [int] NULL
)
GO
/****** Object:  Table [dbo].[StudentGrades]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentGrades](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[ProgramId] [int] NULL,
	[CategoryId] [int] NULL,
	[BranchId] [int] NULL,
	[YearID] [int] NULL,
	[Avg] [float] NULL,
	[Percentage] [float] NULL,
	[Total_Marks] [int] NULL,
	[Grade] [char](2) NULL,
	[Grade_GeneratedDate] [date] NULL,
	[Grade_Status] [nvarchar](20) NULL,
	[Grade_StatusDate] [date] NULL,
	[Grade_Remarks] [nvarchar](max) NULL,
	[Publish_Status] [nvarchar](20) NULL,
	[Publish_Status_Date] [date] NULL,
	[Activity] [nvarchar](50) NULL,
 CONSTRAINT [PK_StudentGrades] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudentGrades] ON
INSERT [dbo].[StudentGrades] ([S_No], [StudentID], [ProgramId], [CategoryId], [BranchId], [YearID], [Avg], [Percentage], [Total_Marks], [Grade], [Grade_GeneratedDate], [Grade_Status], [Grade_StatusDate], [Grade_Remarks], [Publish_Status], [Publish_Status_Date], [Activity]) VALUES (1, 1, 7, 7, 1, 1, 22, NULL, 66, N'A ', CAST(0x443A0B00 AS Date), N'1', CAST(0x443A0B00 AS Date), N'Good', N'UnPublish', CAST(0x753A0B00 AS Date), N'Generated')
INSERT [dbo].[StudentGrades] ([S_No], [StudentID], [ProgramId], [CategoryId], [BranchId], [YearID], [Avg], [Percentage], [Total_Marks], [Grade], [Grade_GeneratedDate], [Grade_Status], [Grade_StatusDate], [Grade_Remarks], [Publish_Status], [Publish_Status_Date], [Activity]) VALUES (2, 2, 7, 7, 1, 1, 20, NULL, 60, N'A ', CAST(0x533A0B00 AS Date), N'1', CAST(0x533A0B00 AS Date), N'Good', N'UnPublish', CAST(0x703A0B00 AS Date), N'Pending')
SET IDENTITY_INSERT [dbo].[StudentGrades] OFF
/****** Object:  Table [dbo].[Student_Publish]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Publish](
	[Publish_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Program_id] [int] NULL,
	[Category_Id] [int] NULL,
	[Subjects_Publish] [nvarchar](50) NULL,
	[Units_Publish] [nvarchar](50) NULL,
	[Schedule_Publish] [nvarchar](50) NULL,
	[Classes_Publish] [nvarchar](50) NULL,
	[Content_Publish] [nvarchar](50) NULL,
	[Student_Status] [int] NULL,
 CONSTRAINT [PK_Student_Publish] PRIMARY KEY CLUSTERED 
(
	[Publish_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student_Publish] ON
INSERT [dbo].[Student_Publish] ([Publish_Id], [Student_Id], [Program_id], [Category_Id], [Subjects_Publish], [Units_Publish], [Schedule_Publish], [Classes_Publish], [Content_Publish], [Student_Status]) VALUES (1, 1, 0, 0, N'3,', N'0', N'1,', N'2,1,', N'0', 1)
INSERT [dbo].[Student_Publish] ([Publish_Id], [Student_Id], [Program_id], [Category_Id], [Subjects_Publish], [Units_Publish], [Schedule_Publish], [Classes_Publish], [Content_Publish], [Student_Status]) VALUES (2, 2, 0, 7, N'0', N'0', N'0', N'0', N'0', 1)
INSERT [dbo].[Student_Publish] ([Publish_Id], [Student_Id], [Program_id], [Category_Id], [Subjects_Publish], [Units_Publish], [Schedule_Publish], [Classes_Publish], [Content_Publish], [Student_Status]) VALUES (3, 5, 1, 0, N'3,', N'0', N'0', N'0', N'0', 1)
INSERT [dbo].[Student_Publish] ([Publish_Id], [Student_Id], [Program_id], [Category_Id], [Subjects_Publish], [Units_Publish], [Schedule_Publish], [Classes_Publish], [Content_Publish], [Student_Status]) VALUES (4, 6, 0, 0, N'0', N'0', N'0', N'0', N'0', 1)
SET IDENTITY_INSERT [dbo].[Student_Publish] OFF
/****** Object:  Table [dbo].[Student_Class_Publish]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Class_Publish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[Class_Id] [nvarchar](30) NULL,
	[Status] [nvarchar](20) NULL,
	[StatusDate] [nvarchar](50) NULL,
	[ScheduleId] [nvarchar](30) NULL,
	[Classunit] [int] NULL,
 CONSTRAINT [PK_Student_Class_Publish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student_Class_Publish] ON
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (1, 1, N'12', N'Publish', N'2015-08-04', NULL, NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (5, 2, N'12', N'UnPublish', N'2015-08-14', N'Sch21', NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (6, 5, N'1', N'Publish', N'2015-08-10', N'Sch21', NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (7, 6, N'11', N'UnPublish', N'2015-11-03', N'Sch21', NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (8, 10, N'12', N'UnPublish', N'2015-11-03', N'Sch21', NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (17, 12, N'12', N'Publish', N'2015-08-17', N'Sch21', NULL)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (52, 22, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (53, 22, N'Class-1', N'Publish', N'2016-07-06', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (54, 22, N'Class-1', N'Publish', N'2016-07-06', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (55, 22, N'Class-1', N'Publish', N'2016-07-06', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (56, 22, N'Class-1', N'Publish', N'2016-07-06', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (58, 19, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (59, 19, N'Class-1', N'Publish', N'07-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (60, 19, N'Class-1', N'Publish', N'07-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (61, 19, N'Class-1', N'Publish', N'07-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (62, 19, N'Class-1', N'Publish', N'07-06-2016', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (63, 17, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (64, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (65, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (66, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (67, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (68, 17, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (69, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (70, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (71, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (72, 17, N'Class-1', N'Publish', N'15-06-2016', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (73, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (74, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (75, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (76, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (77, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (78, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (79, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (80, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (81, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (82, 20, N'Class-1', N'Publish', N'22-06-2016', N'Sch21', 34)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (83, 13, N'Class-1', N'UnPublish', N'24-06-2016', N'Sch21', 30)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (84, 13, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 31)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (85, 13, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 32)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (86, 13, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 33)
INSERT [dbo].[Student_Class_Publish] ([S_No], [Student_Id], [Class_Id], [Status], [StatusDate], [ScheduleId], [Classunit]) VALUES (87, 13, N'Class-1', N'Publish', N'24-06-2016', N'Sch21', 34)
SET IDENTITY_INSERT [dbo].[Student_Class_Publish] OFF
/****** Object:  Table [dbo].[tbl_SubjectFaculty_Schedule]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_SubjectFaculty_Schedule](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [nvarchar](50) NULL,
	[Subject_ScheduleID] [nvarchar](50) NULL,
	[SubjectID] [int] NULL,
	[FacultyID] [int] NULL,
	[FacultyName] [nvarchar](50) NULL,
	[startdate] [date] NULL,
	[Enddate] [date] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[Hours] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
 CONSTRAINT [PK_tbl_SubjectFaculty_Schedule] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_SubjectFaculty_Schedule] ON
INSERT [dbo].[tbl_SubjectFaculty_Schedule] ([S_No], [ScheduleID], [Subject_ScheduleID], [SubjectID], [FacultyID], [FacultyName], [startdate], [Enddate], [StartTime], [EndTime], [Hours], [Status], [StatusDate]) VALUES (1, N'Sch7', N'SUB2', 3, 13, N'Sworna Lenka', NULL, NULL, N'9:00', N'11:00', N'2', N'New', CAST(0x9C3A0B00 AS Date))
INSERT [dbo].[tbl_SubjectFaculty_Schedule] ([S_No], [ScheduleID], [Subject_ScheduleID], [SubjectID], [FacultyID], [FacultyName], [startdate], [Enddate], [StartTime], [EndTime], [Hours], [Status], [StatusDate]) VALUES (2, N'Sch7', N'SUB3', 4, 13, N'Sworna Lenka', NULL, NULL, N'10:00', N'11:00', N'1', N'New', CAST(0x9C3A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_SubjectFaculty_Schedule] OFF
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 06/24/2016 17:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 06/24/2016 17:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 06/24/2016 17:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06/24/2016 17:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Qstn_Ans]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test_Qstn_Ans](
	[Qstn_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NULL,
	[Subject_Id] [int] NULL,
	[Unit_Id] [int] NULL,
	[Test_Type] [nvarchar](20) NULL,
	[Exercise_ID] [nvarchar](25) NULL,
	[Question_Type] [nvarchar](20) NULL,
	[Question] [nvarchar](max) NULL,
	[A] [nvarchar](max) NULL,
	[B] [nvarchar](max) NULL,
	[C] [nvarchar](max) NULL,
	[D] [nvarchar](max) NULL,
	[E] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[Status_date] [date] NULL,
	[Status] [nvarchar](20) NULL,
	[Subject_Increment] [int] NULL,
	[Mod] [int] NULL,
	[Set_ID] [char](1) NULL,
	[QstnNAId] [int] NULL,
	[Cat_Schedile] [nvarchar](30) NULL,
	[Sub_ScheduleId] [nvarchar](30) NULL,
	[ActiveStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_TestQstnAns] PRIMARY KEY CLUSTERED 
(
	[Qstn_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Test_Qstn_Ans] ON
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (1, 4, 25, 2, N'Exercise', N'1', N'MultipleChoice', N'Which of the following can be declared in an interface?', N'Properties,Methods', N'Properties,Methods,Enumerations', N'Enumerations,Events', N'Events', N'Properties', N'B', CAST(0x1C3A0B00 AS Date), N'Publish', 1, 10, N'1', 1, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (2, 4, 25, 2, N'Exercise', N'1', N'MultipleChoice', N'Which of the following statements is correct about Interfaces used in C#.NET?', N'All interfaces are derived from an Object class.', N'All interfaces are derived from an Object interface.', N'Interfaces can be inherited.', N'Interfaces can contain only method declaration.', N'Interfaces  can be interface', N'C', CAST(0x1C3A0B00 AS Date), N'Publish', 2, 10, N'2', 2, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (3, 4, 25, 2, N'Exercise', N'1', N'MultipleChoice', N'Which of the following can implement an interface?', N'Data,Enum', N'Class,Structure', N'Enum,Namespace', N'Structure', N'Namespace', N'B', CAST(0x1C3A0B00 AS Date), N'Publish', 3, 10, N'3', 3, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (8, 33, 25, 0, N'SampleTest', N'1', N'MultipleChoice', N'what of the following are the correct ways to increment the value of variable a by 1?', N'Properties,Methods', N'a += 1; a = a +1;', N'Enumerations,Events,M', N'a = a +1;', N'a = +2;i==', N'C', CAST(0x1C3A0B00 AS Date), N'Publish', 1, 10, N'4', 4, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (9, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'were', N'grvger', N'rveg', N'rvge', N'dgv', N'bfv', N'A', CAST(0x213A0B00 AS Date), N'Publish', 2, 10, N'5', 5, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (10, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'asfcre', N'trgesrh', N'whrt', N'thre', N'wrgtg', N'btr', N'B', CAST(0x213A0B00 AS Date), N'Publish', 3, 10, N'6', 6, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (11, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'dc', N'dsg', N'vds', N'ngr', N'hg', N'fbd', N'A', CAST(0x213A0B00 AS Date), N'Publish', 4, 10, N'7', 7, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (12, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'rghegrergegre', N'gregre', N'gr', N'gregre', N'greg', N'gregr', N'A', CAST(0x213A0B00 AS Date), N'Publish', 5, 10, N'8', 8, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (14, 33, 25, 0, N'SampleTest', N'0', N'MultipleChoice', N'What is a what ?', N'what', N'rg', N'hfd', N'thre', N'thrhe', N'D', CAST(0x243A0B00 AS Date), N'Publish', 6, 10, N'9', 9, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (18, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'wereefew', N'gregdnhgf', N' dsr', N'fdwtfggb', N'dgv', N'bfv', N'A', CAST(0x213A0B00 AS Date), N'Publish', 7, 10, N'1', 10, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (19, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'asfcre', N'trgesrh', N'whrt', N'thre', N'wrgtg', N'btr', N'B', CAST(0x213A0B00 AS Date), N'Publish', 8, 10, N'1', 11, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (20, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'dc is called DC', N'dsg', N'vds', N'ngr', N'hg', N'fbd', N'C', CAST(0x213A0B00 AS Date), N'Publish', 9, 10, N'1', 12, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (21, 33, 25, 0, N'SampleTest', NULL, NULL, N'rghegrergegre', N'gregre', N'gr', N'gregre', N'greg', N'gregr', N'A', CAST(0x213A0B00 AS Date), N'Publish', 10, 10, N'1', 13, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (22, 33, 25, 0, N'SampleTest', N'0', N'MultipleChoice', N'What is a what ?', N'what', N'rg', N'hfd', N'thre', N'thrhe', N'D', CAST(0x243A0B00 AS Date), N'UnPublish', 11, 10, N'1', 14, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (29, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'hjgt6yy7g8yawsifojoie', N'trhe5tr', N'ewferv', N'sfdeerw', N'regw4r', N'grewgtw', N'A', CAST(0x3D3A0B00 AS Date), N'UnPublish', 13, 10, N'1', 15, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (30, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'hjgt6yy7g8yawsifojoie', N'trhe5tr', N'ewferv', N'sfdeerw', N'regw4r', N'grewgtw', N'A', CAST(0x3D3A0B00 AS Date), N'UnPublish', 14, 10, N'1', 16, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (31, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'hjgt6yy7g8yawsifojoie', N'trhe5tr', N'ewferv', N'sfdeerw', N'regw4r', N'grewgtw', N'A', CAST(0x3D3A0B00 AS Date), N'UnPublish', 15, 10, N'1', 17, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (32, 33, 25, 0, N'FinalTest', NULL, N'MultipleChoice', N'aaaaaaaaaaaaaaaaaaaaaaaaaaa', N'trhe5tr', N'ewferv', N'sfdeerw', N'regw4r', N'grewgtw', N'A', CAST(0x3D3A0B00 AS Date), N'UnPublish', 2, 10, N'2', 18, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (33, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'What is Electron?', N'Elec', N'Lec', N'Tron', N'On', N'Eton', N'B', CAST(0x5D3A0B00 AS Date), NULL, 16, NULL, N'1', 18, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (39, 33, 25, 10, N'Exercise', N'0', N'MultipleChoice', N'Sample Test Of Exercise?', N'AA', N'BB', N'CC', N'DD', N'EE', N'A', CAST(0x6A3A0B00 AS Date), NULL, NULL, NULL, NULL, 20, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (40, 33, 25, 2, N'Exercise', N'0', N'MultipleChoice', N'Sample Test Of Exercise?tg5rg', N'AA', N'BB', N'CC', N'DD', N'EE', N'A', CAST(0x6A3A0B00 AS Date), NULL, NULL, NULL, NULL, 21, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (41, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'what is your name', N'Harika', N'Ramesh', N'Rajesh', N'tulasi', N'safdar', N'B', CAST(0x6C3A0B00 AS Date), NULL, 17, NULL, N'2', 22, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (42, 33, 25, 2, N'Exercise', N'0', N'MultipleChoice', N'43333333333333', N'435', N'345', N'435', N'435', N'45', N'A', CAST(0x6E3A0B00 AS Date), NULL, NULL, NULL, NULL, 23, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (43, 33, 25, 2, N'Exercise', N'0', N'MultipleChoice', N'uit76y', N'55', N'44', N'33', N'22', N'11', N'B', CAST(0x6E3A0B00 AS Date), NULL, NULL, NULL, NULL, 24, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (44, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'hjhjhj', N'ghjgy', N'jhytuj', N'ju', N'uyy5u', N'htyu', N'A', CAST(0x6F3A0B00 AS Date), NULL, 18, NULL, N'3', 25, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (45, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'rw4r', N'rte45rtf', N'rt5ry', N'gtryr', N'rg4re5t', N'5yg45', N'B', CAST(0x6F3A0B00 AS Date), NULL, 19, NULL, N'4', 26, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (46, 33, 25, 0, N'SampleTest', NULL, N'MultipleChoice', N'what is measure of distance in USA', N'mters', N'feet', N'kilo', N'pound', N'none', N'B', CAST(0x703A0B00 AS Date), NULL, 20, NULL, N'0', 27, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (47, 29, 22, 28, N'Exercise', N'0', N'MultipleChoice', N'what is your School Name', N'jkkkfjdkaslf', N'jnfkajfkdalsf', N'iuieruoiwr', N';iurioewro', N'NONE', N'B', CAST(0x703A0B00 AS Date), NULL, NULL, NULL, NULL, 28, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (48, 29, 22, 0, N'FinalTest', NULL, N'MultipleChoice', N'What is ramesh qualification', N'10', N'+2', N'B.Tech', N'BSC', N'NoNE', N'E', CAST(0x703A0B00 AS Date), NULL, NULL, NULL, NULL, 29, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (49, 29, 22, 28, N'Exercise', N'0', N'Radio', N'How You Look Like?', N'Handsome', N'Bad', N'Fair', N'Average', N'Cuuuuuuuuute', N'D', CAST(0x773A0B00 AS Date), NULL, NULL, NULL, NULL, 30, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (50, 32, 25, 0, N'SampleTest', NULL, N'Radio', N'fghfgjghjg', N'hgnj', N'ghj', N'gh', N'fgh', N'gfh', N'B', CAST(0x483B0B00 AS Date), NULL, 21, NULL, N'1', 31, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (51, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what  are amino acids', N'acid rains', N'rauins', N'mixture of acids', N'Rains', N'acids', N'A', CAST(0x513B0B00 AS Date), NULL, NULL, NULL, NULL, 32, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (52, 33, 30, 30, N'Exercise', N'0', N'Radio', N'What s Boyles law', N'cyclone', N'\vizag', N'nyu', N'nyuf', N'ntury', N'B', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 33, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (53, 33, 30, 30, N'Exercise', N'0', N'Radio', N'What is Newtons law', N'ghgjhj', N'ghjnhgmngm', N'ghmghmjhm', N'gmjhmj', N'hjmjhm', N'C', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 34, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (54, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what is an acid', N'uklk', N'ljk;k;kl/', N'lk/lk/lk/', N'kl/lk/kl/', N'kl/kl/lk/', N'A', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 35, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (55, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what is Bore''s law', N'dfghdfghdfh', N'dfgdfgdfgh', N'dfghdfh', N'dfhdfhdfh', N'dfhdf', N'D', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 36, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (56, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what are crystals ', N'afasdffd', N'rtrryry', N'tytrytyht', N'vchgcfhgfh', N'gfhgfhgfhg', N'A', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 37, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (57, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what is crystallisation', N'sdfdsf', N'thrtyrty', N'trytrytyfghgfhg', N'fghgfhg', N'fghfhgg', N'E', CAST(0x523B0B00 AS Date), NULL, NULL, NULL, NULL, 38, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (59, 33, 30, 31, N'Exercise', N'0', N'Radio', N'rdyrtu', N'tyuityity', N'ikuyo', N'uyuyo', N'uiuyo', N'uyoyo', N'E', CAST(0x553B0B00 AS Date), NULL, NULL, NULL, NULL, 39, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (61, 33, 30, 32, N'Exercise', N'0', N'Radio', N'io[op[''yiuyiuyiuy', N'op[opouiy7uy', N'yuhouyo', N'uyuyo', N'uiuyo', N'uouyou', N'D', CAST(0x553B0B00 AS Date), NULL, NULL, NULL, NULL, 40, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (62, 33, 30, 32, N'Exercise', N'0', N'Radio', N'sdgdg', N'sfsdfd', N'sdfdg', N'sfgdg', N'sdfgdg', N'gdfgdfg', N'C', CAST(0x553B0B00 AS Date), NULL, NULL, NULL, NULL, 41, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (65, 33, 30, NULL, N'Exercise', NULL, N'Fill In Blanks', N'hlijl;kl;lgyhujtyfyhfghghg', N'', N'', N'', N'', N'', N'Hai Hello', CAST(0x553B0B00 AS Date), NULL, NULL, NULL, NULL, 42, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (66, 33, 30, NULL, N'Exercise', NULL, N'Descriptive', N'What is Encapsulation?', N'', N'', N'', N'', N'', N'Hiding the Data', CAST(0x553B0B00 AS Date), NULL, NULL, NULL, NULL, 43, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (70, 33, 30, NULL, N'Exercise', NULL, N'Descriptive', N'hello what is your name?', NULL, NULL, NULL, NULL, NULL, N'my name is suman', CAST(0x573B0B00 AS Date), NULL, NULL, NULL, NULL, 44, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (72, 33, 30, 33, N'Exercise', N'0', N'Radio', N'chtyjty', N'rtujtyty', N'dyjugj', N'fyjyhj', N'ygjy', N'yfgj', N'C', CAST(0x593B0B00 AS Date), NULL, NULL, NULL, NULL, 45, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (73, 33, 30, NULL, N'Exercise', NULL, N'Fill In Blanks', N'r57yrt6u', NULL, NULL, NULL, NULL, NULL, N'tyuytuiyui', CAST(0x593B0B00 AS Date), NULL, NULL, NULL, NULL, 46, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (101, 33, 30, 0, N'Exercise', NULL, N'Radio', N'fergtrehrtyhj', N'hbrthyj', N'uyjuytkt', N'jmyukmt', N'ytjuykt', N'jmkur', N'A', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 47, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (102, 33, 30, 0, N'Exercise', NULL, N'Radio', N'awferg', N'hby', N'ynjjt', N'nyu', N'nyuf', N'ntury', N'B', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 48, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (103, 33, 30, 0, N'Exercise', NULL, N'Radio', N'gferdgerg', N'ghgjhj', N'ghjnhgmngm', N'ghmghmjhm', N'gmjhmj', N'hjmjhm', N'C', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 49, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (104, 33, 30, 0, N'Exercise', NULL, N'Radio', N'dfgfhgf', N'uklk', N'ljk;k;kl/', N'lk/lk/lk/', N'kl/lk/kl/', N'kl/kl/lk/', N'A', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 50, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (105, 33, 30, 0, N'Exercise', NULL, N'Radio', N'ASDSFSDG', N'dfghdfghdfh', N'dfgdfgdfgh', N'dfghdfh', N'dfhdfhdfh', N'dfhdf', N'D', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 51, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (106, 33, 30, 0, N'Exercise', NULL, N'Radio', N'adasdfasfd', N'afasdffd', N'rtrryry', N'tytrytyht', N'vchgcfhgfh', N'gfhgfhgfhg', N'A', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 52, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (107, 33, 30, 0, N'Exercise', NULL, N'Radio', N'sdfdffsdfg', N'sdfdsf', N'thrtyrty', N'trytrytyfghgfhg', N'fghgfhg', N'fghfhgg', N'E', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 53, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (108, 33, 30, 0, N'Exercise', NULL, N'Radio', N'sfsdfdfdsf', N'sdfdf', N'thrtyrty', N'tytrytryrt', N'hgfhgh', N'fghghgfh', N'D', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 54, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (109, 33, 30, 0, N'Exercise', NULL, N'Radio', N'asdfdsfsdf', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', N'ghghggh', N'C', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 55, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (110, 33, 30, 31, N'Exercise', N'0', N'Radio', N'ukghiihui', N'jgjhgjh', N'jkghjfgh', N'jhgjh', N'JHFGJH', N'JKGUH', N'B', CAST(0x5D3B0B00 AS Date), NULL, NULL, NULL, NULL, 56, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (111, 33, 30, 31, N'Exercise', NULL, N'Radio', N'fergtrehrtyhj', N'hbrthyj', N'uyjuytkt', N'jmyukmt', N'ytjuykt', N'jmkur', N'A', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 57, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (112, 33, 30, 31, N'Exercise', NULL, N'Radio', N'awferg', N'hby', N'ynjjt', N'nyu', N'nyuf', N'ntury', N'B', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 58, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (113, 33, 30, 31, N'Exercise', NULL, N'Radio', N'gferdgerg', N'ghgjhj', N'ghjnhgmngm', N'ghmghmjhm', N'gmjhmj', N'hjmjhm', N'C', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 59, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (114, 33, 30, 31, N'Exercise', NULL, N'Radio', N'dfgfhgf', N'uklk', N'ljk;k;kl/', N'lk/lk/lk/', N'kl/lk/kl/', N'kl/kl/lk/', N'A', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 60, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (115, 33, 30, 31, N'Exercise', NULL, N'Radio', N'ASDSFSDG', N'dfghdfghdfh', N'dfgdfgdfgh', N'dfghdfh', N'dfhdfhdfh', N'dfhdf', N'D', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 61, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (116, 33, 30, 31, N'Exercise', NULL, N'Radio', N'adasdfasfd', N'afasdffd', N'rtrryry', N'tytrytyht', N'vchgcfhgfh', N'gfhgfhgfhg', N'A', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 62, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (117, 33, 30, 31, N'Exercise', NULL, N'Radio', N'sdfdffsdfg', N'sdfdsf', N'thrtyrty', N'trytrytyfghgfhg', N'fghgfhg', N'fghfhgg', N'E', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 63, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (118, 33, 30, 31, N'Exercise', NULL, N'Radio', N'sfsdfdfdsf', N'sdfdf', N'thrtyrty', N'tytrytryrt', N'hgfhgh', N'fghghgfh', N'D', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 64, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (119, 33, 30, 31, N'Exercise', NULL, N'Radio', N'asdfdsfsdf', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', N'ghghggh', N'C', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 65, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (120, 33, 30, 30, N'Exercise', N'0', N'Radio', N'what is distillation', N'sdfdf', N'thrtyrty', N'tytrytryrt', N'hgfhgh', N'fghghgfh', N'D', CAST(0x5E3B0B00 AS Date), NULL, NULL, NULL, NULL, 66, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (121, 33, 30, 30, N'Exercise', NULL, N'Fill In Blanks', N'formula for Sodium', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', NULL, N'C', CAST(0x5F3B0B00 AS Date), NULL, NULL, NULL, NULL, 67, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (122, 33, 30, 30, N'Exercise', NULL, N'Fill In Blanks', N'Formula for Ethylene', N'sdfdsg', N'sdfgsdg', N'sdfdsfg', N'sdfds', NULL, N'D', CAST(0x5F3B0B00 AS Date), NULL, NULL, NULL, NULL, 68, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (126, 33, 30, 30, N'Exercise', N'0', N'Radio', N'formula for Sodium', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', N'ghghggh', N'C', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 69, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (127, 33, 30, 30, N'Exercise', N'0', N'Radio', N'Formula for Ethylene', N'sdfdsg', N'sdfgsdg', N'sdfdsfg', N'sdfds', N'sdfgsdgg', N'D', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 70, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (137, 33, 30, 30, N'Exercise', NULL, N'Radio', N'fergtrehrtyhj', N'hbrthyj', N'uyjuytkt', N'jmyukmt', N'ytjuykt', N'jmkur', N'A', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 71, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (138, 33, 30, 30, N'Exercise', NULL, N'Radio', N'awferg', N'hby', N'ynjjt', N'nyu', N'nyuf', N'ntury', N'B', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 72, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (139, 33, 30, 30, N'Exercise', NULL, N'Radio', N'gferdgerg', N'ghgjhj', N'ghjnhgmngm', N'ghmghmjhm', N'gmjhmj', N'hjmjhm', N'C', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 73, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (140, 33, 30, 30, N'Exercise', NULL, N'Radio', N'dfgfhgf', N'uklk', N'ljk;k;kl/', N'lk/lk/lk/', N'kl/lk/kl/', N'kl/kl/lk/', N'A', CAST(0x603B0B00 AS Date), NULL, NULL, NULL, NULL, 74, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (141, 33, 30, 30, N'Exercise', NULL, N'Radio', N'ASDSFSDG', N'dfghdfghdfh', N'dfgdfgdfgh', N'dfghdfh', N'dfhdfhdfh', N'dfhdf', N'D', CAST(0x603B0B00 AS Date), N'New', NULL, NULL, NULL, 75, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (142, 33, 30, 30, N'Exercise', NULL, N'Radio', N'adasdfasfd', N'afasdffd', N'rtrryry', N'tytrytyht', N'vchgcfhgfh', N'gfhgfhgfhg', N'C', CAST(0x603B0B00 AS Date), N'Delete', NULL, NULL, NULL, 76, N'Sch21', N'SUB30', N'0')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (143, 33, 30, 30, N'Exercise', NULL, N'Radio', N'sdfdffsdfg', N'sdfdsf', N'thrtyrty', N'trytrytyfghgfhg', N'fghgfhg', N'fghfhgg', N'E', CAST(0x603B0B00 AS Date), N'Delete', NULL, NULL, NULL, 77, N'Sch21', N'SUB30', N'0')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (144, 33, 30, 30, N'Exercise', NULL, N'Radio', N'sfsdfdfdsf', N'sdfdf', N'thrtyrty', N'tytrytryrt', N'hgfhgh', N'fghghgfh', N'E', CAST(0x603B0B00 AS Date), N'Delete', NULL, NULL, NULL, 78, N'Sch21', N'SUB30', N'0')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (145, 33, 30, 30, N'Exercise', NULL, N'Radio', N'asdfdsfsdf', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', N'ghghggh', N'B', CAST(0x603B0B00 AS Date), N'New', NULL, NULL, NULL, 79, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (146, 33, 30, 31, N'Exercise', N'0', N'Radio', N'dvfdvf', N'fdvfd', N'fdvbfd', N'dvf', N'dfvfd', N'dfvdf', N'A', CAST(0x673B0B00 AS Date), N'New', NULL, NULL, NULL, 80, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (157, 33, 30, 30, N'Exercise', N'0', N'Radio', N'adsdf ghjkl m nippwe', N'hai', N'howru', N'fine', N'you', N'schedules', N'E', CAST(0x97380B00 AS Date), N'New', NULL, NULL, NULL, 81, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (158, 33, 30, 30, N'Exercise', N'0', N'Radio', N'DFFF', N'FF', N'FF', N'FF', N'AA', N'GG', N'A', CAST(0x733B0B00 AS Date), N'New', NULL, NULL, NULL, 82, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (159, 33, 30, 30, N'Exercise', N'0', N'Radio', N'tyttyutyu', N'tyuyu', N'tyuy', N'yuy', N'yityi', N'ytityi', N'A', CAST(0x15380B00 AS Date), N'New', NULL, NULL, NULL, 83, N'Sch21', N'SUB30', N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (252, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what  are amino acids', N'acid rains', N'rauins', N'mixture of acids', N'Rains', N'acids', N'A', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 84, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (253, 33, 30, 33, N'Exercise', NULL, N'Radio', N'What s Boyles law', N'cyclone', N'\vizag', N'nyu', N'nyuf', N'ntury', N'B', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 85, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (254, 33, 30, 33, N'Exercise', NULL, N'Radio', N'What is Newtons law', N'ghgjhj', N'ghjnhgmngm', N'ghmghmjhm', N'gmjhmj', N'hjmjhm', N'C', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 86, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (255, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what is an acid', N'uklk', N'ljk;k;kl/', N'lk/lk/lk/', N'kl/lk/kl/', N'kl/kl/lk/', N'A', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 87, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (256, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what is Bore''s law', N'dfghdfghdfh', N'dfgdfgdfgh', N'dfghdfh', N'dfhdfhdfh', N'dfhdf', N'D', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 88, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (257, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what are crystals ', N'afasdffd', N'rtrryry', N'tytrytyht', N'vchgcfhgfh', N'gfhgfhgfhg', N'A', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 89, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (258, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what is crystallisation', N'sdfdsf', N'thrtyrty', N'trytrytyfghgfhg', N'fghgfhg', N'fghfhgg', N'E', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 90, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (259, 33, 30, 33, N'Exercise', NULL, N'Radio', N'what is distillation', N'sdfdf', N'thrtyrty', N'tytrytryrt', N'hgfhgh', N'fghghgfh', N'D', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 91, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (260, 33, 30, 33, N'Exercise', NULL, N'Radio', N'formula for Sodium', N'trfyhtfggvh', N'tytrytryt', N'gdfgretryhtfgy', N'dfgdfgdfgdfg', N'ghghggh', N'C', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 92, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (261, 33, 30, 33, N'Exercise', NULL, N'Radio', N'Formula for Ethylene', N'sdfdsg', N'sdfgsdg', N'sdfdsfg', N'sdfds', N'sdfgsdgg', N'D', CAST(0x8A3B0B00 AS Date), NULL, NULL, NULL, NULL, 93, NULL, NULL, N'1')
INSERT [dbo].[Test_Qstn_Ans] ([Qstn_ID], [Category_Id], [Subject_Id], [Unit_Id], [Test_Type], [Exercise_ID], [Question_Type], [Question], [A], [B], [C], [D], [E], [Answer], [Status_date], [Status], [Subject_Increment], [Mod], [Set_ID], [QstnNAId], [Cat_Schedile], [Sub_ScheduleId], [ActiveStatus]) VALUES (262, 33, 30, 30, N'Assignment', NULL, N'Assignment', N'xcgvbfcbgc', NULL, NULL, NULL, NULL, NULL, N'hnngjnghjhgkh', CAST(0x8A3B0B00 AS Date), N'New', NULL, NULL, NULL, 94, N'Sch21', N'SUB30', N'1')
SET IDENTITY_INSERT [dbo].[Test_Qstn_Ans] OFF
/****** Object:  Table [dbo].[tbl_CompanySubjectScheduleFaculty]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompanySubjectScheduleFaculty](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company_BranchID] [nvarchar](50) NULL,
	[ScheduleID] [nvarchar](50) NULL,
	[SubjectId] [int] NULL,
	[ClassID] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[FaultyID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
 CONSTRAINT [PK_tbl_CompanySubjectScheduleFaculty] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ON
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (3, NULL, N'BSMT2', N'Sch21', 30, N'1', CAST(0x01380B00 AS Date), CAST(0x03380B00 AS Date), N'10:00', N'12:00', 13, N'Completed', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (4, NULL, N'BSMT2', N'Sch7', 3, N'6', CAST(0x613A0B00 AS Date), CAST(0x953A0B00 AS Date), N'10:00', N'11:00', 13, N'New', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (5, NULL, N'SMT779', N'Sub30', 30, N'6', CAST(0x613A0B00 AS Date), CAST(0x6B3A0B00 AS Date), N'10:00', N'11:00', 13, N'New', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (6, NULL, N'BSMT2', N'Sub30', 30, N'7', CAST(0x9A3A0B00 AS Date), CAST(0xDA3A0B00 AS Date), N'10:00', N'11:00', 13, N'New', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (7, NULL, N'SMT779', N'SUB2', 3, N'7', CAST(0x973A0B00 AS Date), CAST(0x9A3A0B00 AS Date), N'10:00', N'11:00', 13, N'New', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (8, NULL, N'BSMT2', N'SUBSch9', 3, N'8', CAST(0x973A0B00 AS Date), CAST(0x9B390B00 AS Date), N'07:00', N'09:00', 13, N'New', CAST(0xA13A0B00 AS Date))
INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [SubjectId], [ClassID], [StartDate], [EndDate], [StartTime], [EndTime], [FaultyID], [Status], [StatusDate]) VALUES (9, NULL, N'SMT779', N'SUBSch9', 3, N'8', CAST(0x2A390B00 AS Date), CAST(0x2D390B00 AS Date), N'07:00', N'09:00', 13, N'New', CAST(0xA13A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_CompanySubjectScheduleFaculty] OFF
/****** Object:  Table [dbo].[tbl_CompanySubjectPublish]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompanySubjectPublish](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company_BranchID] [nvarchar](50) NULL,
	[Subject_Id] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
	[PublishStatus] [nvarchar](50) NULL,
	[ActiveStatus] [int] NULL,
 CONSTRAINT [PK_tbl_CompanySubjectPublish] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CompanySubjectPublish] ON
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (1, N'ACMPSMT001', N'BSMT2', 3, N'New', CAST(0xA03A0B00 AS Date), N'UnPublish', 1)
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (2, N'ACMPSMT001', N'BSMT2', 4, N'New', CAST(0x9F3A0B00 AS Date), N'Publish', 1)
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (3, N'ACMPSMT001', N'BSMT2', 5, N'New', CAST(0x9F3A0B00 AS Date), N'Publish', 1)
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (4, N'ACMPSMT001', N'SMT779', 3, N'New', CAST(0xA03A0B00 AS Date), N'UnPublish', 1)
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (5, N'ACMPSMT001', N'SMT779', 4, N'New', CAST(0x9F3A0B00 AS Date), N'UnPublish', 1)
INSERT [dbo].[tbl_CompanySubjectPublish] ([S_No], [CompanyID], [Company_BranchID], [Subject_Id], [Status], [StatusDate], [PublishStatus], [ActiveStatus]) VALUES (6, N'ACMPSMT001', N'SMT779', 5, N'New', CAST(0x9F3A0B00 AS Date), N'UnPublish', 1)
SET IDENTITY_INSERT [dbo].[tbl_CompanySubjectPublish] OFF
/****** Object:  Table [dbo].[tbl_CompanySCH_SubjectClass]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CompanySCH_SubjectClass](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company_BranchID] [nvarchar](50) NULL,
	[ScheduleID] [nvarchar](50) NULL,
	[Subject_ScheduleID] [nvarchar](50) NULL,
	[SubjectID] [int] NULL,
	[ClassType] [nvarchar](50) NULL,
	[FacultyID] [int] NULL,
	[FacultyName] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[Hours] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[StatusDate] [date] NULL,
	[Remarks] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_CompanySCHClassTrng] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CompanySCH_SubjectClass] ON
INSERT [dbo].[tbl_CompanySCH_SubjectClass] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [Subject_ScheduleID], [SubjectID], [ClassType], [FacultyID], [FacultyName], [StartDate], [EndDate], [StartTime], [EndTime], [Hours], [Status], [StatusDate], [Remarks]) VALUES (1, N'ACMPSMT001', N'BSMT2', N'Sch21', N'SUB30', 30, N'OnLine', 13, N'Sworna Lenka', CAST(0x643A0B00 AS Date), CAST(0x643A0B00 AS Date), N'10:00', N'12:00', N'2', N'New', CAST(0x9E3A0B00 AS Date), N'fxg')
INSERT [dbo].[tbl_CompanySCH_SubjectClass] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [Subject_ScheduleID], [SubjectID], [ClassType], [FacultyID], [FacultyName], [StartDate], [EndDate], [StartTime], [EndTime], [Hours], [Status], [StatusDate], [Remarks]) VALUES (2, N'ACMPSMT001', N'BSMT2', N'Sch21', N'SUB30', 30, N'OnLine', 13, N'Sworna Lenka', CAST(0x653A0B00 AS Date), CAST(0xA13A0B00 AS Date), N'10:00', N'11:00', N'1', N'New', CAST(0x9E3A0B00 AS Date), N'fgtry')
INSERT [dbo].[tbl_CompanySCH_SubjectClass] ([S_No], [CompanyID], [Company_BranchID], [ScheduleID], [Subject_ScheduleID], [SubjectID], [ClassType], [FacultyID], [FacultyName], [StartDate], [EndDate], [StartTime], [EndTime], [Hours], [Status], [StatusDate], [Remarks]) VALUES (3, N'ACMPSMT001', N'BSMT2', N'Sch21', N'SUBSch9', 3, N'OnLine', 13, N'Sworna Lenka', CAST(0xF7380B00 AS Date), CAST(0xF7380B00 AS Date), N'10:00', N'12:00', N'2', N'New', CAST(0x31390B00 AS Date), N'fxg')
SET IDENTITY_INSERT [dbo].[tbl_CompanySCH_SubjectClass] OFF
/****** Object:  Table [dbo].[RealTest]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealTest](
	[RT_Id] [int] IDENTITY(1,1) NOT NULL,
	[Student_Id] [int] NULL,
	[RT_Time] [nvarchar](50) NULL,
	[SubjectId] [int] NULL,
	[Question_type] [nvarchar](50) NULL,
	[NoofQuetions] [nvarchar](50) NULL,
	[UserId] [nvarchar](100) NULL,
	[SetId] [int] NULL,
 CONSTRAINT [PK_RealTest] PRIMARY KEY CLUSTERED 
(
	[RT_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RealTest] ON
INSERT [dbo].[RealTest] ([RT_Id], [Student_Id], [RT_Time], [SubjectId], [Question_type], [NoofQuetions], [UserId], [SetId]) VALUES (1, 1, N'20mins', 25, N'MultipleChoice', N'20', N'ramesh', 1)
INSERT [dbo].[RealTest] ([RT_Id], [Student_Id], [RT_Time], [SubjectId], [Question_type], [NoofQuetions], [UserId], [SetId]) VALUES (2, 2, N'20mins', 25, N'MultipleChoice', N'20', N'Satheesh', 2)
SET IDENTITY_INSERT [dbo].[RealTest] OFF
/****** Object:  Table [dbo].[ProgramMethod_Content]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProgramMethod_Content](
	[programMethodId] [int] IDENTITY(1,1) NOT NULL,
	[ProgramMethod_Name] [varchar](50) NULL,
	[ProgramMethod_Content] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProgramMethod_Content] ON
INSERT [dbo].[ProgramMethod_Content] ([programMethodId], [ProgramMethod_Name], [ProgramMethod_Content]) VALUES (1, N'Method1', N'Method1 Content')
SET IDENTITY_INSERT [dbo].[ProgramMethod_Content] OFF
/****** Object:  Table [dbo].[News_Content]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News_Content](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[News_Name] [varchar](50) NULL,
	[News_Content] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[News_Content] ON
INSERT [dbo].[News_Content] ([NewsId], [News_Name], [News_Content]) VALUES (1, N'News1', N'News1 COntent now')
SET IDENTITY_INSERT [dbo].[News_Content] OFF
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[SNo] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DetailsID] [int] NULL,
	[RoleName] [nvarchar](20) NULL,
	[UserStatus] [int] NULL,
 CONSTRAINT [PK_LoginDetails] PRIMARY KEY CLUSTERED 
(
	[SNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoginDetails] ON
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (15, N'admin123', N'admin123', 23, N'Admin', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (18, N'ramesh', N'ramesh', 1, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (19, N'Stud4635', N't1qycq2!', 5, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (20, N'Stud1875', N'f@7g^#d&', 6, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (21, N'Satheesh M', N'satheesh', 23, N'Admin', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (22, N'Fac-Sworna', N'ramesh123', 13, N'Faculty', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (23, N'Fac-Mishra', N'vinit', 10, N'Faculty', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (24, N'Satheesh', N'Satheesh', 2, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (39, N'Tulasi', N'jh!5#d4&', 12, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (60, N'Rajesh', N'rajesh@123', 11, N'Counsellor', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (198, N'Mahe7546', N'*gg2hc#&', 22, N'Student', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (201, N'5RARA', N'4i@v08le', 5, N'Counsellor', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (202, N'Info9280', N'&n!alh@^', 0, N'Infosys', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (226, N'ACMPInf002', N'ugn*!gsq', 2, N'Company', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (227, N'Vini6374', N'4o5r2xv%', 19, N'Faculty', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (228, N'ACMPIBM003', N'!gb0cvpt', 3, N'Company', 1)
INSERT [dbo].[LoginDetails] ([SNo], [UserID], [Password], [DetailsID], [RoleName], [UserStatus]) VALUES (229, N'ACMPSMT001', N'admin', 1, N'Company', 1)
SET IDENTITY_INSERT [dbo].[LoginDetails] OFF
/****** Object:  UserDefinedFunction [dbo].[fn_Split]    Script Date: 06/24/2016 17:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_Split](@text varchar(8000), @delimiter varchar(20) = ' ')
RETURNS @Strings TABLE
(   
  position int IDENTITY PRIMARY KEY,
  value varchar(8000)  
)
AS
BEGIN

DECLARE @index int
SET @index = -1

WHILE (LEN(@text) > 0)
  BEGIN 
    SET @index = CHARINDEX(@delimiter , @text) 
    IF (@index = 0) AND (LEN(@text) > 0) 
      BEGIN  
        INSERT INTO @Strings VALUES (@text)
          BREAK 
      END 
    IF (@index > 1) 
      BEGIN  
        INSERT INTO @Strings VALUES (LEFT(@text, @index - 1))  
        SET @text = RIGHT(@text, (LEN(@text) - @index)) 
      END 
    ELSE
      SET @text = RIGHT(@text, (LEN(@text) - @index))
    END
  RETURN
END
GO
/****** Object:  Table [dbo].[Events_Content]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Events_Content](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[Event_Name] [varchar](50) NULL,
	[Event_Content] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Events_Content] ON
INSERT [dbo].[Events_Content] ([EventId], [Event_Name], [Event_Content]) VALUES (3, N'Event-2', N'Today Event-2')
SET IDENTITY_INSERT [dbo].[Events_Content] OFF
/****** Object:  Table [dbo].[Email]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Email](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Location] [nvarchar](20) NULL,
	[Designation] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[AddedDate] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Email] ON
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (1, N'satheesh', N'madupathi', N'hyderabad', N'developer', N'satheeh@gmail.com', CAST(0x213A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (2, N'satheesh1', N'madupathi1', N'hyderabad1', N'developer', N'satheeh@gmail.com', CAST(0x213A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (3, N'rajesh', N'nall', N'uppal', N'dev', N'rajesh@smtindia.net', CAST(0x213A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (4, N'ramesh', N'k', N'hyd', N'dev', N'ramesh@smtindia.net', CAST(0x213A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (5, N'raju', N'madu', N'hyd', N'raj@gmail', N'tester', CAST(0x223A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (6, N'sworna', N'toya', N'odisha', N'sworna@gmail.com', N'dev', CAST(0x223A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (7, N'vinit', N'madu', N'mp', N'vinit@gmail', N'dev', CAST(0x223A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (8, N'raju', N'madu', N'hyd', N'raj@gmail', N'tester', CAST(0x223A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (9, N'sworna', N'toya', N'odisha', N'sworna@gmail.com', N'dev', CAST(0x223A0B00 AS Date))
INSERT [dbo].[Email] ([Id], [FirstName], [LastName], [Location], [Designation], [Email], [AddedDate]) VALUES (10, N'vinit', N'madu', N'mp', N'vinit@gmail', N'dev', CAST(0x223A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Email] OFF
/****** Object:  Table [dbo].[Details]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[RoleName] [nvarchar](20) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[PlaceOfBirth] [nvarchar](50) NULL,
	[Father_GaurdainName] [nvarchar](50) NULL,
	[MotherMaidenName] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[Fixed_LandlineNumber] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[OptionalEmailID] [nvarchar](50) NULL,
	[Qualification] [nvarchar](50) NULL,
	[TechnicalSkills] [nvarchar](50) NULL,
	[ImageName] [nvarchar](50) NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company_Branch] [nvarchar](50) NULL,
	[BranchID] [int] NULL,
	[LocationID] [int] NULL,
	[ProgramID] [int] NULL,
	[CategoryID] [int] NULL,
	[Schedule_ID] [nvarchar](20) NULL,
	[SubjectID] [nvarchar](max) NULL,
	[UnitID] [nvarchar](50) NULL,
	[AccessCode] [nvarchar](20) NULL,
	[ActiveStatus] [int] NULL,
	[DateofRegistration] [date] NULL,
	[ActivationDate] [date] NULL,
	[StatusDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Employer_WorkExp] [int] NULL,
	[Employer_Name] [nvarchar](20) NULL,
	[Employer_Email] [nvarchar](50) NULL,
	[Employer_Phone] [nvarchar](10) NULL,
	[Employer_Address] [nvarchar](100) NULL,
	[Employer_Subjects] [nvarchar](30) NULL,
 CONSTRAINT [PK_Details] PRIMARY KEY CLUSTERED 
(
	[DetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Details] ON
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (1, N'Ramesh', N'Student', N'Ramesh', N'Kisari', CAST(0xB5180B00 AS Date), N'Bibi Nagar', N'Anji Reddy', N'Manga', N'9491884452', N'040-27203052', N'ramesh@gmail.com', N'ramesh@gmail.com', N'B.Tech', N'ewfre', N'', N'ACMPSMT001', N'BSMT2', 20, 1, 31, 33, N'Sch21', N'30,4,5', N'30,10,', N'1001', 1, CAST(0x0F3A0B00 AS Date), CAST(0x393A0B00 AS Date), CAST(0x393A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (2, N'Satheesh', N'Student', N'Satheesh', N'M', CAST(0xB5180B00 AS Date), N'2qt34', N'erg', N'drfg', N'222222222222222', N'2t', N'satheesh@smtindia.net', N'2t', N'B.Tech', N'ewfre', N'BusinessUnitsHomePage.png', N'ACMPSMT001', N'BSMT2', 20, 1, 31, 33, N'Sch21', N'30,4,5', N'30,10,31', N'1002', 1, CAST(0x0F3A0B00 AS Date), CAST(0x603A0B00 AS Date), CAST(0x603A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (5, N'VMishra', N'Student', N'Vinit', N'Mishra', CAST(0xCE160B00 AS Date), N'wrdtfgy', N'ghjyghu', N'Mishra', N'1234567892', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'Chrysanthemum.jpg', N'ACMPSMT001', N'BSMT2', 20, 0, 31, 33, N'Sch21', N'30,4,5', N'30,10,', N'1003', 1, CAST(0x2B3A0B00 AS Date), CAST(0x3A3A0B00 AS Date), CAST(0x3A3A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (6, N'Rajesh', N'Student', N'Rajesh', N'N', CAST(0xCE160B00 AS Date), N'wrdtfgy', N'ghjyghu', N'Nallamotu', N'1234567892', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'Chrysanthemum.jpg', N'ACMPSMT001', N'BSMT2', 20, 0, 31, 33, N'Sch21', N'30,4,5', N'30,10,', N'1004', 1, CAST(0x2B3A0B00 AS Date), CAST(0x393A0B00 AS Date), CAST(0x393A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (10, N'Fac-Mishra', N'Faculty', N'Vinit', N'Mishra', CAST(0xCB9B0A00 AS Date), N'wrdtfgy', N'ghjyghu', N'Mishra', N'1234567892', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', NULL, NULL, N'Vinit_Mishra.jpg', N'1', NULL, 0, 1, 31, 33, NULL, N'30,4,5,', N'30,31', N'1005', 1, CAST(0x2C3A0B00 AS Date), NULL, NULL, N'Registered', NULL, NULL, NULL, NULL, NULL, N'1,2')
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (12, N'Tulasi', N'Student', N'tulasi', N'allam', CAST(0xCC100B00 AS Date), N'GUntur', N'tulasiall', N'tulai', N'9490101885', N'04051225', N'tulasiallam@gmail.com', N'tulai@gmail.com', N'MCA', N'.Net', N'bd02636c-2103-4cb3-8681-21ed7d120525_splash-androi', N'1', N'BSMT2', 20, 1, 31, 33, N'Sch21', N'30', N'30,31', N'1006', 1, CAST(0x393A0B00 AS Date), CAST(0x3F3A0B00 AS Date), CAST(0x3F3A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (13, N'Fac-Sworna', N'Faculty', N'Sworna', N'Lenka', CAST(0x283A0B00 AS Date), N'medak', N'sath', N'madu', N'123123', N'3123', N'sath@gmail', N'sath@gmail', NULL, NULL, N'ramesh_reddy.jpg', N'1', NULL, 1, 1, 31, 33, NULL, N'3,4,5,', N'30,31,', N'1007', 1, CAST(0x2C3A0B00 AS Date), NULL, NULL, N'Registered', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (17, N'XYZ 6212', N'Student', N'XYZ', N'XYFRTG', CAST(0x760A0B00 AS Date), N'Bibi Nagar', N'tyujik', N'cfgh', N'9491884452', N'040-27203052', N'ramesh@gmail.com', N'ramesh@gmail.com', N'B.Tech', N'ewfre', N'', N'1', N'BSMT2', 20, 1, 31, 33, NULL, N'', N'2,10,', N'1009', 0, CAST(0x0F3A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (18, N'Fac-Swoooo', N'Faculty', N'Swornaoooo', N'Lenkaooooo', CAST(0x283A0B00 AS Date), N'ooo', N'oooo', N'ooooo', N'123123', N'3123', N'sath@gmail', N'sath@gmail', NULL, NULL, N'ramesh_reddy.jpg', N'1', NULL, 0, 1, 7, 33, NULL, N'3,4,5,', N'2,10,', N'1010', 0, CAST(0x2C3A0B00 AS Date), CAST(0x7C3A0B00 AS Date), CAST(0x7C3A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (19, N'Vini6374', N'Faculty', N'Vinit1', N'P', CAST(0x623A0B00 AS Date), N'wrdtfgy', N'ghjyghu', N'Mishra', N'1234567892', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'xt0Jp1.png', NULL, NULL, NULL, NULL, 0, NULL, NULL, N'3,4,12,', NULL, N'1011', 1, CAST(0x7C3A0B00 AS Date), CAST(0x933A0B00 AS Date), CAST(0x933A0B00 AS Date), N'Confirm', 2, N'Vinn2', N'Vinn@V.com', N'3456', N'erfygtu', NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (20, N'Nare6819', N'Student', N'Naresh', N'N', CAST(0x6F3A0B00 AS Date), N'wrdtfgy', N'ghjyghu', N'Mishra', N'1234567892', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'Naresh_N.png', N'0', NULL, 1, 0, 7, 7, N'sch1', N'0', NULL, N'1012', 0, CAST(0x7D3A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (22, N'Mahe7546', N'Student', N'Mahesh', N'M', CAST(0x6F3A0B00 AS Date), N'wrdtfgy', N'ghjyghu', N'Mishra', N'134560845767', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'Naresh_N.png', N'ACMPSMT001', NULL, 1, 0, 7, 7, N'sch7', N'0', NULL, N'1013', 1, CAST(0x7D3A0B00 AS Date), CAST(0x843A0B00 AS Date), CAST(0x843A0B00 AS Date), N'Confirm', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Details] ([DetailsID], [UserID], [RoleName], [FirstName], [LastName], [DateOfBirth], [PlaceOfBirth], [Father_GaurdainName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNumber], [EmailID], [OptionalEmailID], [Qualification], [TechnicalSkills], [ImageName], [CompanyID], [Company_Branch], [BranchID], [LocationID], [ProgramID], [CategoryID], [Schedule_ID], [SubjectID], [UnitID], [AccessCode], [ActiveStatus], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [Employer_WorkExp], [Employer_Name], [Employer_Email], [Employer_Phone], [Employer_Address], [Employer_Subjects]) VALUES (23, N'Satheesh M', N'Admin', N'Satheesh', N'Madhupathi', CAST(0x6F3A0B00 AS Date), N'wrdtfgy', N'ghjyghu', N'madhu', N'4561237890', N'3456734', N'abc@abc.abc', N'abc@xc.dfg', N'abc', N'.net', N'Naresh_N.png', N'ACMPSMT001', N'BSMT2', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Details] OFF
/****** Object:  Table [dbo].[Consulting_Content]    Script Date: 06/24/2016 17:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consulting_Content](
	[ConsultingID] [int] IDENTITY(1,1) NOT NULL,
	[Consult_Name] [nvarchar](50) NULL,
	[Consult_Content] [nvarchar](max) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Consulting_Content] ON
INSERT [dbo].[Consulting_Content] ([ConsultingID], [Consult_Name], [Consult_Content]) VALUES (2, N'test1', N'Consulting test1 Content')
SET IDENTITY_INSERT [dbo].[Consulting_Content] OFF
/****** Object:  Table [dbo].[CompanyDetails]    Script Date: 06/24/2016 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyDetails](
	[DetailsID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NULL,
	[CompanyId] [nvarchar](50) NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ROC_RegistrationDate] [date] NULL,
	[RegistrationNO] [nvarchar](50) NULL,
	[OfficePhoneNO] [nvarchar](50) NULL,
	[EmailID] [nvarchar](50) NULL,
	[NoOfStudents] [int] NULL,
	[ProgramID] [int] NULL,
	[Branch_Count] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ImageName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[PlaceOfBirth] [nvarchar](50) NULL,
	[Father_GuardianName] [nvarchar](50) NULL,
	[MotherMaidenName] [nvarchar](50) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[Fixed_LandlineNO] [nvarchar](50) NULL,
	[ContactPersonEmailID] [nvarchar](50) NULL,
	[ContactPersonAlternativeEmailID] [nvarchar](50) NULL,
	[ActiveStatus] [int] NULL,
	[AccessCode] [nvarchar](20) NULL,
	[DateofRegistration] [date] NULL,
	[ActivationDate] [date] NULL,
	[StatusDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[HouseNO] [nvarchar](50) NULL,
	[Flat_UnitNo] [nvarchar](50) NULL,
	[StreetNO] [nvarchar](50) NULL,
	[StreetName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[DistrictID] [int] NULL,
	[Village_Town_City] [nvarchar](50) NULL,
	[SubUrban_Area] [nvarchar](50) NULL,
	[PostalCode] [int] NULL,
	[LandMarkName] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_CompanyDetails] PRIMARY KEY CLUSTERED 
(
	[DetailsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CompanyDetails] ON
INSERT [dbo].[CompanyDetails] ([DetailsID], [RoleName], [CompanyId], [CompanyName], [ROC_RegistrationDate], [RegistrationNO], [OfficePhoneNO], [EmailID], [NoOfStudents], [ProgramID], [Branch_Count], [FirstName], [LastName], [ImageName], [DateOfBirth], [PlaceOfBirth], [Father_GuardianName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNO], [ContactPersonEmailID], [ContactPersonAlternativeEmailID], [ActiveStatus], [AccessCode], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (1, N'Company', N'ACMPSMT001', N'SMT', CAST(0xB1240B00 AS Date), N'12345', N'123-334656', N'abc@abc.abc', 50, 1, 4, N'Vinit', N'Mishra', N'', CAST(0x0D260B00 AS Date), N'MP', N'Grandchild', N'yuyghj', N'43567890', N'530040', N'dftghj', N'abc@abc.abc', 1, N'13459876', CAST(0x853A0B00 AS Date), CAST(0x193B0B00 AS Date), CAST(0x193B0B00 AS Date), N'Confirm', N'12-12', N'23/1', N'2', N'abcde', 1, 1, 1, N'efrwe', N'dfr', 550000, N'werrf', N'wedff')
INSERT [dbo].[CompanyDetails] ([DetailsID], [RoleName], [CompanyId], [CompanyName], [ROC_RegistrationDate], [RegistrationNO], [OfficePhoneNO], [EmailID], [NoOfStudents], [ProgramID], [Branch_Count], [FirstName], [LastName], [ImageName], [DateOfBirth], [PlaceOfBirth], [Father_GuardianName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNO], [ContactPersonEmailID], [ContactPersonAlternativeEmailID], [ActiveStatus], [AccessCode], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (2, N'Company', N'ACMPInf002', N'Infosys', CAST(0xB1240B00 AS Date), N'133232', N'040-2332323', N'info@infosys.com', 100, 1, 2, N'satheesh', N'madupathi', NULL, CAST(0xB1240B00 AS Date), N'medak', NULL, NULL, N'9490101885', N'223256', NULL, NULL, 1, N'456', CAST(0x853A0B00 AS Date), CAST(0x8E3A0B00 AS Date), CAST(0x8E3A0B00 AS Date), N'Confirm', N'12-77', N'566', N'3', N'gfrdfg', 1, 1, 1, N'fgg', N'cgvdrt', 500000, N'gtrg', N'fdgtryh')
INSERT [dbo].[CompanyDetails] ([DetailsID], [RoleName], [CompanyId], [CompanyName], [ROC_RegistrationDate], [RegistrationNO], [OfficePhoneNO], [EmailID], [NoOfStudents], [ProgramID], [Branch_Count], [FirstName], [LastName], [ImageName], [DateOfBirth], [PlaceOfBirth], [Father_GuardianName], [MotherMaidenName], [MobileNumber], [Fixed_LandlineNO], [ContactPersonEmailID], [ContactPersonAlternativeEmailID], [ActiveStatus], [AccessCode], [DateofRegistration], [ActivationDate], [StatusDate], [Status], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (3, N'Company', N'ACMPIBM003', N'IBMS', CAST(0xB1240B00 AS Date), N'7465', N'9877655', N'info@ibm.com', 200, 1, 2, N'ramesh', N'reddy', NULL, CAST(0xB1240B00 AS Date), N'hyd', NULL, NULL, N'65947889244', NULL, NULL, NULL, 1, N'86787', CAST(0x853A0B00 AS Date), CAST(0xF33A0B00 AS Date), CAST(0xF33A0B00 AS Date), N'Confirm', N'45/12-78', N'35', N'1', N'dfgb', 1, 1, 1, N'ghjhntmuk', N'fggggbwj', 59999, N'grthengf', N'ghbryj')
SET IDENTITY_INSERT [dbo].[CompanyDetails] OFF
/****** Object:  Table [dbo].[Careers_Content]    Script Date: 06/24/2016 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Careers_Content](
	[CareerId] [int] IDENTITY(1,1) NOT NULL,
	[Career_Name] [nvarchar](10) NULL,
	[Career_Content] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Careers_Content] ON
INSERT [dbo].[Careers_Content] ([CareerId], [Career_Name], [Career_Content]) VALUES (1, N'Career1', N'Career1 Content 9:28AM')
SET IDENTITY_INSERT [dbo].[Careers_Content] OFF
/****** Object:  Table [dbo].[Assesment_Authorization]    Script Date: 06/24/2016 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assesment_Authorization](
	[CompanyBranchID] [nvarchar](50) NULL,
	[MAC_Address] [nvarchar](200) NULL,
	[CompanyId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Assesment_Authorization] ([CompanyBranchID], [MAC_Address], [CompanyId]) VALUES (N'ACMPSMT001', N'C03FD59E7C09', NULL)
INSERT [dbo].[Assesment_Authorization] ([CompanyBranchID], [MAC_Address], [CompanyId]) VALUES (N'ACMPSMT001', N'D43D7E684B0F', NULL)
INSERT [dbo].[Assesment_Authorization] ([CompanyBranchID], [MAC_Address], [CompanyId]) VALUES (N'ACMP-Vskp', N'D43D7E684B0F', N'ACMPSMT001')
/****** Object:  Table [dbo].[Affiliations_Content]    Script Date: 06/24/2016 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Affiliations_Content](
	[AffID] [int] IDENTITY(1,1) NOT NULL,
	[AffName] [varchar](50) NULL,
	[Aff_Content] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Affiliations_Content] ON
INSERT [dbo].[Affiliations_Content] ([AffID], [AffName], [Aff_Content]) VALUES (1, N'test1', N'Affiliation 11.43AM')
INSERT [dbo].[Affiliations_Content] ([AffID], [AffName], [Aff_Content]) VALUES (2, N'test1', N'Affiliation Content Modified 14:16')
INSERT [dbo].[Affiliations_Content] ([AffID], [AffName], [Aff_Content]) VALUES (10, N'satheesh', N'* { margin: 0; padding: 0; } body { background: #eee; font: 12px Georgia, Serif; color: #2d2d2d; } #page-wrap { width: 600px; margin: 20px auto; } a img { border: 0; } h3 { font-size: 24px; font-weight: normal; margin: 0 0 25px 0; } fieldset { border: 1px solid #666; padding: 15px; } legend { border: 1px solid #666; text-transform: uppercase; padding: 2px 6px; } .code-selector div { clear: both; margin: 0 0 25px 0; } label { font-size: 14px; display: block; width: 120px; float: left; text-align: right; padding: 2px 6px; } .code-selector select { border: 1px solid #666; padding: 2px 2px 2px 6px; } .code-selector option { padding: 0 12px; } .code-selector textarea { border: 1px solid #7d7858; padding: 10px; width: 375px; height: 80px; } .note { font-size: 11px; width: 300px; margin: 0 0 0 130px; color: #666; } .example-area { margin-left: 130px; width: 375px; text-align: center; border: 1px solid #7d7858; padding: 10px; } .example-area img { max-width: 100%; } satheesh')
INSERT [dbo].[Affiliations_Content] ([AffID], [AffName], [Aff_Content]) VALUES (4, N'test1', N'<p>
	Affiliation Content</p>')
INSERT [dbo].[Affiliations_Content] ([AffID], [AffName], [Aff_Content]) VALUES (9, N'test3', N'Affiliate test3 Content')
SET IDENTITY_INSERT [dbo].[Affiliations_Content] OFF
/****** Object:  Table [dbo].[Address]    Script Date: 06/24/2016 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[DetailsID] [int] NULL,
	[RoleName] [nvarchar](50) NULL,
	[HouseNO] [nvarchar](50) NULL,
	[Flat_UnitNo] [nvarchar](50) NULL,
	[StreetNO] [nvarchar](50) NULL,
	[StreetName] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
	[StateID] [int] NULL,
	[DistrictID] [int] NULL,
	[Village_Town_City] [nvarchar](50) NULL,
	[SubUrban_Area] [nvarchar](50) NULL,
	[PostalCode] [int] NULL,
	[LandMarkName] [nvarchar](20) NULL,
	[Location] [nvarchar](20) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (1, 1, N'Student', N'234-3732', N'123', N'21', N'13213', 1, 1, 1, N'12345', N'132', 5468954, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (2, 2, N'Student', N'123', N'123', N'21', N'13213', 0, 0, 0, N'12', N'132', 12345, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (3, 3, N'Admin', N'12/A', N'', N'12/B', N'medak', 1, 1, 1, N'', N'', 34435, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (5, 4, N'Enquiry', N'45', N'34', N'345', N'tcvy', 0, 0, 0, N'rg', N'vbunh', 23453, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (6, 5, N'Student', N'45', N'34', N'345', N'tcvy', 0, 0, 0, N'rg', N'vbunh', 23453, N'', N'dfr')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (7, 6, N'Student', N'45', N'34', N'345', N'tcvy', 0, 0, 0, N'rg', N'vbunh', 23453, N'', N'dfr')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (8, 7, N'Admin', N'123', N'123', N'12', N'sadsa', 0, 1, 0, N'medak', N'medak', 213212312, N'sdfsdff', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (9, 8, N'Admin', N'123', N'123', N'12', N'sadsa', 0, 1, 0, N'medak', N'medak', 123213, N'sdfsdff', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (10, 9, N'Admin', N'123', N'123', N'12', N'sadsa', 1, 0, 1, N'medak', N'medak', 123213, N'sdfsdff', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (11, 10, N'Admin', N'45', N'34', N'345', N'tcvy', 0, 0, 0, N'rg', N'vbunh', 23453, N'fgvh', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (12, 12, N'Student', N'13/6', N'4', N'12', N'guntur', 1, 1, 1, N'guntur', N'guntur', 500012, N'', N'guntur')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (13, 14, N'Admin', N'12/A', N'12', N'23', N'ChennaReddy Lane', 1, 1, 1, N'Tarnaka', N'Tarnaka', 500016, N'sharjah', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (14, 15, N'Admin', N'12/A', N'12', N'12/B', N'ChennaReddy Lane', 1, 1, 1, N'Tarnaka', N'Tarnaka', 0, N'sharjah', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (15, 16, N'Student', N'123', N'123', N'21', N'13213', 0, 0, 0, N'12', N'132', 12345, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (16, 17, N'Student', N'123', N'123', N'21', N'13213', 0, 0, 0, N'12', N'132', 12345, NULL, NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (17, 13, N'Faculty', N'12/A', N'12', N'23', N'ChennaReddy Lane', 1, 1, 1, N'Tarnaka', N'Tarnaka', 500016, N'sharjah', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (18, 18, N'Faculty', N'12/A', N'12', N'23', N'ChennaReddy Lane', 1, 1, 1, N'Tarnaka', N'Tarnaka', 500016, N'sharjah', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (19, 19, N'Faculty', N'45', N'34', N'345', N'tcvy', 1, 1, 1, N'rg', N'vbunh', 23453, N'fgvh', N'dfr')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (20, 20, N'Faculty', N'45', N'34', N'345', N'tcvy', 1, 1, 1, N'rg', N'vbunh', 23453, N'fgvh', N'dfr')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (21, 20, N'Student', N'45', N'34', N'345', N'tcvy', 1, 1, 1, N'rg', N'vbunh', 23453, N'fgvh', N'dfr')
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (22, 21, N'Admin', N'45', N'34', N'345', N'tcvy', 1, 1, 1, N'rg', N'vbunh', 23453, N'fgvh', NULL)
INSERT [dbo].[Address] ([AddressID], [DetailsID], [RoleName], [HouseNO], [Flat_UnitNo], [StreetNO], [StreetName], [CountryID], [StateID], [DistrictID], [Village_Town_City], [SubUrban_Area], [PostalCode], [LandMarkName], [Location]) VALUES (23, 22, N'Student', N'45', N'34', N'345', N'tcvy', 1, 1, 1, N'rg', N'vbunh', 23453, N'fgvh', N'dfr')
SET IDENTITY_INSERT [dbo].[Address] OFF
/****** Object:  UserDefinedTableType [dbo].[ActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:14 ******/
CREATE TYPE [dbo].[ActivateRegisteredUsers] AS TABLE(
	[UserID] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[DetailsID] [int] NULL,
	[RoleName] [nvarchar](20) NULL,
	[EmailID] [nvarchar](50) NULL
)
GO
/****** Object:  StoredProcedure [dbo].[SP_CounsellorRegistration]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CounsellorRegistration]	 
@CounsellorId nvarchar(50),
@C_FName nvarchar(50),@C_LName nvarchar(50),@C_FatherName nvarchar(50),@C_MotherName nvarchar(50),@DOB date,
@POB nvarchar(50),@MobileNumber nvarchar(50),@LandLineNumber nvarchar(50),@EmailId nvarchar(50),@Alt_EmailId nvarchar(50),
@Edu_Qualification nvarchar(50),@TechnicalSkills nvarchar(50),@CounsellorImage varchar(50),@CountryId int,
@StateId int,@DistrictId int,@Mandal_Taluk_Suburb int,@Village_Town_City int,@Pincode nvarchar(50),@StreetNo nvarchar(50),
@StreetName nvarchar(50),@HNo nvarchar(50),@Flat_UnitNo nvarchar(50),@LandMarkName nvarchar(50),@CounsellorLocation nvarchar(50),
@WorkExp int,@EmployerName nvarchar(50),@EmployerAddress nvarchar(50),@EmployerPhone nvarchar(50),@EmployerEmailId nvarchar(50)

AS 
BEGIN
insert into tbl_Counsellor(CounsellorId,C_FName,C_LName,C_FatherName,C_MotherName,DOB,POB,MobileNumber,LandLineNumber,EmailId
,Alt_EmailId,Edu_Qualification,TechnicalSkills,CounsellorImage,CountryId,StateId,DistrictId,Mandal_Taluk_Suburb,Village_Town_City,
Pincode,StreetNo,StreetName,HNo,Flat_UnitNo,LandMarkName,CounsellorLocation,WorkExp,EmployerName,EmployerAddress,EmployerPhone,
EmployerEmailId,ActiveStatus,DateofRegistration,Status)values
(@CounsellorId,@C_FName,@C_LName,@C_FatherName,@C_MotherName,@DOB,@POB,@MobileNumber,@LandLineNumber,@EmailId,@Alt_EmailId,@Edu_Qualification
,@TechnicalSkills,@CounsellorImage,@CountryId,@StateId,@DistrictId,@Mandal_Taluk_Suburb,@Village_Town_City,
@Pincode,@StreetNo,@StreetName,@HNo,@Flat_UnitNo,@LandMarkName,@CounsellorLocation,@WorkExp,@EmployerName,@EmployerAddress,@EmployerPhone
,@EmployerEmailId,0,getDate(),'Registered')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CounselarRegistration]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_CounselarRegistration]
(@RoleName nvarchar(20),@FirstName nvarchar(50),@LastName nvarchar(50),@DateOfBirth date,
@PlaceOfBirth nvarchar(50),@Father_GaurdainName nvarchar(50),@MotherMaidenName nvarchar(50),
@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),
@ImageName nvarchar(50),@ProgramID nvarchar(50),@ActiveStatus int,
--Newly Added Fields
@AccessCode nvarchar(20),@Qualification nvarchar(50),@TechnicalSkills nvarchar(50),@Employer_Address nvarchar(100),@Employer_Mail nvarchar(50),@Employer_Name nvarchar(20),@Employer_Phone nvarchar(10),@workExperience int,
@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int,
@Details_Id int=null,@LandMarkName nvarchar(10),@Location nvarchar(20))

as
begin
 insert into Details(RoleName,FirstName,LastName,DateOfBirth,PlaceOfBirth,Father_GaurdainName,MotherMaidenName,
 MobileNumber,Fixed_LandlineNumber,EmailID,OptionalEmailID,ImageName,ProgramID,
 ActiveStatus,DateofRegistration,[Status],AccessCode,Qualification,TechnicalSkills,Employer_Address,Employer_Email,Employer_Name,Employer_Phone,Employer_WorkExp) values
(@RoleName,@FirstName,@LastName,@DateOfBirth,@PlaceOfBirth,@Father_GaurdainName,@MotherMaidenName,
 @MobileNumber,@Fixed_LandlineNumber,@EmailID,@OptionalEmailID,@ImageName,@ProgramID,@ActiveStatus,getdate(),'Registered',
 @AccessCode,@Qualification,@TechnicalSkills,@Employer_Address,@Employer_Mail,@Employer_Name,@Employer_Phone,@workExperience)

set @Details_Id=@@Identity

 insert into [Address] (DetailsID,RoleName,HouseNO,Flat_UnitNo,StreetNO,StreetName,CountryID,StateID,DistrictID,
 Village_Town_City,SubUrban_Area,PostalCode,Location,LandMarkName) values
 (@Details_Id,@RoleName,@HouseNO,@Flat_UnitNo,@StreetNO,@StreetName,@CountryID,@StateID,@DistrictID,
 @Village_Town_City,@SubUrban_Area,@PostalCode,@Location,@LandMarkName)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ContentPublish]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ContentPublish](

@StudentID int,
@ContentType nvarchar(20),
@SubjectId int,
@UnitId int, 
@AccessLevel nvarchar(20),
@Publish_Status nvarchar(20),
@RoleName nvarchar(20)
 )
as
begin

declare @stdCount int, @Val nvarchar(20)
if(@Publish_Status='Publish')
set @Val='UnPublish'
else
set @Val='Publish'


set @stdCount=(select count(*) from tbl_StudentContent_Publish where Student_Id=@StudentID and RoleName=@RoleName and ContentType=@ContentType and Publish_Status=@Publish_Status and UnitId=@UnitId)

if(@stdCount>0)

update tbl_StudentContent_Publish set AccessLevel=@AccessLevel,Publish_Status=@Val,Publish_StatusDate=getdate() where Student_Id=@StudentID and UnitId=@UnitId and ContentType=@ContentType
else

insert into tbl_StudentContent_Publish(Student_Id,RoleName,SubjectId,UnitId,ContentType,AccessLevel,Publish_Status,Publish_StatusDate)
values (@StudentID,@RoleName,@SubjectId,@UnitId,@ContentType,@AccessLevel,@Val,getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_companySubjectSchedule]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_companySubjectSchedule]
(
@Company_BranchID nvarchar(50),
@ClassID nvarchar(50)
)

as begin

declare @FaultyID int=(select FacultyID from tbl_Class where ClassId=@ClassID)
declare @startdate date=(select startdate from tbl_Class where ClassId=@ClassID)
declare @Enddate date=(select Enddate from tbl_Class where ClassId=@ClassID)
declare @StartTime nvarchar(50)=(select StartTime from tbl_Class where ClassId=@ClassID)
declare @EndTime nvarchar(50)=(select EndTime from tbl_Class where ClassId=@ClassID)
declare @ScheduleID nvarchar(50)=(select ScheduleID from tbl_Class where ClassId=@ClassID)
declare @SubjectId int=(select SubjectId from tbl_Class where ClassId=@ClassID)


insert into tbl_CompanySubjectScheduleFaculty(Company_BranchID,ScheduleID,SubjectId,ClassID,StartDate,EndDate,StartTime,EndTime,
FaultyID,Status,StatusDate)
values(@Company_BranchID,@ScheduleID,@SubjectId,@ClassID,@startdate,@Enddate,@StartTime,@EndTime,@FaultyID,'New',getdate())


end
GO
/****** Object:  StoredProcedure [dbo].[sp_ClassesPublish]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ClassesPublish](  
  
@StudentID int,  
@ClassId nvarchar(30),  
@Publish_Status nvarchar(20),
@ScheduleIod nvarchar(30),
@unit int)  
as  
begin  
  
declare @stdCount int, @Val nvarchar(20)
if(@Publish_Status='Publish')
set @Val='UnPublish'
else
set @Val='Publish'  
  
set @stdCount=(select count(*) from Student_Class_Publish where Student_Id=@StudentID and Status=@Publish_Status and Class_Id=@ClassId and ScheduleId=@ScheduleIod)  
  
if(@stdCount>0)  
update Student_Class_Publish set Status=@Val,StatusDate=getdate() where Student_Id=@StudentID and Class_Id=@ClassId and ScheduleId=@ScheduleIod 
else  
  
insert into Student_Class_Publish(Student_Id,Class_Id,Status,StatusDate,ScheduleId,Classunit)  
values (@StudentID,@ClassId,@Val,getdate(),@ScheduleIod, @unit)  
  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_checkProgramMethodName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_checkProgramMethodName]
		@name varchar(50)
AS
BEGIN
 select ProgramMethod_Name from dbo.ProgramMethod_Content where ProgramMethod_Name=@name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_checkNewsName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_checkNewsName]
		@name varchar(50)
AS
BEGIN
 select News_Name from dbo.News_Content where News_Name=@name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_checkEventName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_checkEventName]
@name varchar(50)
AS
BEGIN
 select Event_Name from dbo.Events_Content where Event_Name=@name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_checkConsultingName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_checkConsultingName]
		@name varchar(50)
AS
BEGIN
	
 select Consult_Name from [dbo].[Consulting_Content] where Consult_Name=@name
END
GO
/****** Object:  StoredProcedure [dbo].[SP_checkCareerName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_checkCareerName]
		@name varchar(50)
AS
BEGIN
	
 select Career_Name from [dbo].[Careers_Content] where Career_Name=@name
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_CheckAffiliationName]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_CheckAffiliationName]
	@name varchar(50)
AS
BEGIN
	
 select AffName from [OLS_Db].[dbo].[Affiliations_Content] where AffName=@name
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChangePassword]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ChangePassword]
(
@UserID nvarchar(50),
@Password nvarchar(50),
@NewPassword nvarchar(50)
)
as
begin

declare @val nvarchar(50)=(select UserID from LoginDetails where UserID=@UserID and Password=@Password)

if(@val is not null)
begin
update LoginDetails set Password=@NewPassword where UserID=@UserID
select 1
end
else
begin
select 0
end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateGrade]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_CalculateGrade](
@Category_Id int,
@Branch_Id int)

as
Begin

--Select Subjects, Total, Student_Id,Name, CASE 
--WHEN TOTAL/Subjects >25 THEN 'A' 
--when  TOTAL/Subjects >20 THEN 'B' 
--when TOTAL/Subjects >15 THEN 'C' 
--else 'F' 
--END GRADE from (
--select X.Subjects,X.Total,X.Student_Id,Y.FirstName+' '+Y.LastName as Name from
--(select count(Student_Id)as Subjects,sum(Std_Correct_Ans) as Total ,Student_Id from tbl_Results 
--where Std_Result!='f' and  Category_Id=@Category_Id and  Branch_Id=@Branch_Id and Year_Id=@Year_Id group by Student_Id 
--having count(Student_Id)=(select Year_T_Subjects from tbl_Year where Year_Id=@Year_Id))X inner join Details Y
--on X.Student_Id=Y.DetailsID) T

select Y.FirstName+' '+Y.LastName as Name,Z.* from Details Y join
(select * from StudentGrades where BranchId=@Branch_Id and Activity='Pending') Z on Z.StudentID=Y.DetailsID

end
GO
/****** Object:  StoredProcedure [dbo].[sp_BindQstnAnsForRT]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_BindQstnAnsForRT]

as
begin


declare @s nvarchar(50)=(select Qstn_Ids from tbl_Student_Ans where RT_ID=1) 
select * from Test_Qstn_Ans where Qstn_ID in(select value from fn_Split(@s,','))

end
GO
/****** Object:  StoredProcedure [dbo].[SP_AdminRegistration]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_AdminRegistration]
(@RoleName nvarchar(20),@FirstName nvarchar(50),@LastName nvarchar(50),@DateOfBirth date,
@PlaceOfBirth nvarchar(50),@Father_GaurdainName nvarchar(50),@MotherMaidenName nvarchar(50),
@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),
@ImageName nvarchar(50),@AccessCode nvarchar(50),@ActiveStatus int,

@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int,

@Details_Id int=null,@LandMarkName nvarchar(10))

as
begin
 insert into Details(RoleName,FirstName,LastName,DateOfBirth,PlaceOfBirth,Father_GaurdainName,MotherMaidenName,
 MobileNumber,Fixed_LandlineNumber,EmailID,OptionalEmailID,ImageName,AccessCode,
 ActiveStatus,DateofRegistration,Status) values
(@RoleName,@FirstName,@LastName,@DateOfBirth,@PlaceOfBirth,@Father_GaurdainName,@MotherMaidenName,
 @MobileNumber,@Fixed_LandlineNumber,@EmailID,@OptionalEmailID,@ImageName,@AccessCode,@ActiveStatus,getdate(),'Registered')

set @Details_Id=@@Identity

 insert into [Address] (DetailsID,RoleName,HouseNO,Flat_UnitNo,StreetNO,StreetName,CountryID,StateID,DistrictID,
 Village_Town_City,SubUrban_Area,PostalCode,LandMarkName) values
 (@Details_Id,@RoleName,@HouseNO,@Flat_UnitNo,@StreetNO,@StreetName,@CountryID,@StateID,@DistrictID,
 @Village_Town_City,@SubUrban_Area,@PostalCode,@LandMarkName)

end
GO
/****** Object:  StoredProcedure [dbo].[SP_AddProgramMethodContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddProgramMethodContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into [dbo].[ProgramMethod_Content]([ProgramMethod_Name],[ProgramMethod_Content])values(@name,@content); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddNewsContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddNewsContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into dbo.News_Content(News_Name,News_Content)values(@name,@content); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddEventContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddEventContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into dbo.Events_Content(Event_Name,Event_Content)values(@name,@content); 

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveFacultyUsers]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ActiveFacultyUsers]
as
begin

select X.*,Y.HouseNO,Y.Flat_UnitNo,Y.StreetNO,Y.StreetName,Y.CountryID,Y.StateID,Y.DistrictID,Y.Village_Town_City,Y.SubUrban_Area,
Y.PostalCode,Y.LandMarkName,Y.Location from    
(select D.FirstName+' '+D.LastName as Name,D.* from Details D join dbo.LoginDetails L on L.DetailsID=D.DetailsID      
where ActiveStatus=1 and D.ActivationDate= CONVERT(date, getdate())and D.RoleName='Faculty' )X join [Address] Y on
X.DetailsID=Y.DetailsID where Y.RoleName='Faculty'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegStudents]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ActivateRegStudents]
(
@UserID nvarchar(50),
@Pwd nvarchar(50),
@DetailsID int,
@RoleName nvarchar(20)
)







as 
begin

declare @val nvarchar(20)=(select UserID from Details where DetailsID=@DetailsID)

if(@val is not null)
begin

update Details set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm'  
where DetailsID=@DetailsID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@val,@Pwd,@DetailsID,@RoleName,1 )
end
else
begin
update Details set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm',UserID=@UserID
where DetailsID=@DetailsID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@UserID,@Pwd,@DetailsID,@RoleName,1 )
end





end
GO
/****** Object:  StoredProcedure [dbo].[SP_ActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActivateRegisteredUsers]
(
@Activateuser As ActivateRegisteredUsers Readonly
)
AS
Begin

Insert into 

LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
select UserID,[Password],DetailsID,RoleName,1 from @Activateuser 


update Details set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm'  where DetailsID =(select A.DetailsID from @Activateuser A)


--
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegCounsellor]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[sp_ActivateRegCounsellor]
(
@UserID nvarchar(50),
@Pwd nvarchar(50),
@ID int
)


as 
begin

declare @val nvarchar(20)=(select CounsellorId from tbl_Counsellor where SNo=@ID)

if(@val is not null)
begin

update tbl_Counsellor set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm'  
where SNo=@ID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@val,@Pwd,@ID,'Counsellor',1 )
end
else
begin
update tbl_Counsellor set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm' ,CounsellorId=@UserID
where SNo=@ID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@UserID,@Pwd,@ID,'Counsellor',1 )
end





end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActivateRegCompany]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ActivateRegCompany]
(
@UserID nvarchar(50),
@Pwd nvarchar(50),
@DetailsID int,

@BranchID nvarchar(50),
@CompanyID nvarchar(50),
@BranchName nvarchar(50),
@BranchLocation nvarchar(50),
@BranchArea nvarchar(50)
)


as 
begin

declare @val nvarchar(20)=(select CompanyId from CompanyDetails where DetailsID=@DetailsID)

if(@val is not null)
begin

update CompanyDetails set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm'  
where DetailsID=@DetailsID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@val,@Pwd,@DetailsID,'Company',1 )
end
else
begin
update CompanyDetails set ActiveStatus=1,ActivationDate=getdate(),StatusDate=getdate(),[Status]='Confirm' ,CompanyId=@UserID
where DetailsID=@DetailsID
insert into LoginDetails(UserID,[Password],DetailsID,RoleName,UserStatus)
Values(@UserID,@Pwd,@DetailsID,'Company',1 )
end

declare @val1 nvarchar(20)=(select BranchID from tbl_CompanyBranch where BranchID=@BranchID)
if(@val is null)
begin
insert into tbl_CompanyBranch(BranchID,CompanyDetailID,CompanyID,BranchName,BranchLocation,BranchArea,BranchStatus,
RegistrationDate,ActiveStatus)values(@BranchID,@DetailsID,@CompanyID,@BranchName,@BranchLocation,@BranchArea,'Active',
getdate(),1)
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_AddconsultingContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddconsultingContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into [dbo].[Consulting_Content](Consult_Name,Consult_Content)values(@name,@content); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddCareerContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddCareerContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into [dbo].[Careers_Content](Career_Name,Career_Content)values(@name,@content); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddaffiliationContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddaffiliationContent]
@name varchar(50),
@content varchar(MAX)
AS
BEGIN
	insert into dbo.Affiliations_Content(AffName,Aff_Content)values(@name,@content); 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteConsultingContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteConsultingContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.Consulting_Content where ConsultingID=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCareerContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteCareerContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.Careers_Content where CareerId=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteAffiliationContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteAffiliationContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.Affiliations_Content where AffID=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeActiveUsers]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_DeActiveUsers]

as 
begin

select DetailsID,RoleName,FirstName,EmailID,MobileNumber,AccessCode,DateofRegistration,ActivationDate from Details
where ActiveStatus=0 and ActivationDate= CONVERT(date, getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegStudents]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeActivateRegStudents]
(
@DetailsID int,
@RoleName nvarchar(20)
)







as 
begin
update Details set ActiveStatus=0,StatusDate=getdate(),status='De-Activated' where DetailsID=@DetailsID

delete from LoginDetails where DetailsID=@DetailsID and RoleName=@RoleName

end
GO
/****** Object:  StoredProcedure [dbo].[SP_DeActivateRegisteredUsers]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DeActivateRegisteredUsers]
(
@Activateuser As ActivateRegisteredUsers Readonly
)
AS
Begin

update Details set ActiveStatus=0,StatusDate=getdate() where DetailsID=(select DetailsID from @Activateuser)
delete from LoginDetails where DetailsID=(select DetailsID from @Activateuser) and RoleName='Student'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegCounsellor]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeActivateRegCounsellor]
(
@DetailsID int
)







as 
begin
update tbl_Counsellor set ActiveStatus=0,StatusDate=getdate(),status='De-Activated' where SNo=@DetailsID

delete from LoginDetails where DetailsID=@DetailsID and RoleName='Counsellor'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeActivateRegCompany]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeActivateRegCompany]
(
@CompanyId nvarchar(50)
)

as 
begin
update CompanyDetails set ActiveStatus=0,StatusDate=getdate(),status='De-Activated' where CompanyId=@CompanyId

delete from LoginDetails where UserID=@CompanyId and RoleName='Company'

end
GO
/****** Object:  StoredProcedure [dbo].[SP_DDLPrograms]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_DDLPrograms]

as
Begin

select Program_id,[Program_name] from tbl_Program 

end
GO
/****** Object:  StoredProcedure [dbo].[SP_DeletePrgMethodContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeletePrgMethodContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.ProgramMethod_Content where programMethodId=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteNewsContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteNewsContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.News_Content where NewsId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteEventContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteEventContent]
@ID int ,
@Content varchar(MAX)
AS
BEGIN
Delete dbo.Events_Content where EventId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ExerciseTestPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ExerciseTestPublish](

@StudentID int,
@Subject_Id int,
@Unit_Id int,
@Test_Type nvarchar(20),
@PublishType nvarchar(20),
@Catschedule nvarchar(30)
 )
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_StudentSets_Publish where Student_Id=@StudentID and Subject_Id=@Subject_Id and Test_Type=@Test_Type and Unit_Id=@Unit_Id and CatScheduleId=@Catschedule)

if(@stdCount>0)
update tbl_StudentSets_Publish set [Status]=@PublishType,StatusDate=getdate() where Student_Id=@StudentID and Test_Type=@Test_Type and Subject_Id=@Subject_Id and CatScheduleId=@Catschedule
else

insert into tbl_StudentSets_Publish(Student_Id,Subject_Id,Unit_Id,Test_Type,Status,StatusDate,CatScheduleId)values (@StudentID,@Subject_Id,@Unit_Id,@Test_Type,@PublishType,getdate(),@Catschedule)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ExerciseData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ExerciseData](

@Category_Id int,
@Subject_Id int,
@Unit_Id int,
@Test_Type nvarchar(20),
@Question_Type nvarchar(20),
@Exercise_ID int,
@Question nvarchar(max),
@A nvarchar(max),
@B nvarchar(max),
@C nvarchar(max),
@D nvarchar(max),
@E nvarchar(max),
@Answer nvarchar(max),
@QstnId as int,
@catschedule nvarchar(30),
@SubSchId as nvarchar(30))
as
begin

insert into Test_Qstn_Ans (Category_Id,Subject_Id,Unit_Id,Test_Type,Question_Type,Exercise_ID,Question,A,B,C,D,E,Answer,QstnNAId,Status_date,Cat_Schedile,[Status],Sub_ScheduleId,ActiveStatus) values
(@Category_Id,@Subject_Id,@Unit_Id,@Test_Type,@Question_Type,@Exercise_ID,@Question,@A,@B,@C,@D,@E,@Answer,@QstnId,getdate(),@catschedule,'New',@SubSchId,'1')

declare @Val1 nvarchar(20)=@@Identity
declare @Val nvarchar(20)='EXE'+@Val1
Update Test_Qstn_Ans set Exercise_ID=@Val where Qstn_ID=@@Identity
select * from Test_Qstn_Ans where Qstn_ID=@@identity

end
GO
/****** Object:  StoredProcedure [dbo].[SP_EnquiryFormDetails_Insert]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_EnquiryFormDetails_Insert]
@E_FormId varchar(50),@E_FirstName varchar(50),@E_LastName varchar(50),@E_MobileNumber varchar(50),@E_LandLine varchar(50),@E_Email varchar(50),@E_AltEmail varchar(50),@E_Qulification varchar(50),@E_Technicalskills varchar(50)
,@E_DoB date,@E_FatherName varchar(50),@E_FlatNo_UnitNo varchar(50),@E_HNo_DNo_PNo varchar(50),@E_StreetNo varchar(50),@E_StreetName varchar(50),@E_Mandal_Taluk_SubUrb varchar(50),@E_CountryId int,@E_StateId int,
@E_DistrictId int,@E_Village_Town_City int,@E_Pincode varchar(50),@E_ProgramId int,@E_CategoryId int,@E_SubjectId int,@E_TitleInfo varchar(50)

AS
BEGIN
insert into tbl_Enquiry([E_FormId]
      ,[E_FirstName]
      ,[E_LastName]
      ,[E_MobileNumber]
      ,[E_LandLine]
      ,[E_Email]
      ,[E_AltEmail]
      ,[E_Qulification]
      ,[E_Technicalskills]
      ,[E_DoB]
      ,[E_FatherName]
      ,[E_FlatNo_UnitNo]
      ,[E_HNo_DNo_PNo]
      ,[E_StreetNo]
      ,[E_StreetName]
      ,[E_Mandal_Taluk_SubUrb]
      ,[E_CountryId]
      ,[E_StateId]
      ,[E_DistrictId]
      ,[E_Village_Town_City]
      ,[E_Pincode]
      ,[E_ProgramId]
      ,[E_CategoryId]
      ,[E_SubjectId]
      ,[E_TitleInfo]
      ,[E_Status]
      ,[E_EnquiryDate])	values(@E_FormId,@E_FirstName,@E_LastName,@E_MobileNumber ,@E_LandLine,@E_Email,@E_AltEmail,@E_Qulification,@E_Technicalskills
,@E_DoB,@E_FatherName,@E_FlatNo_UnitNo,@E_HNo_DNo_PNo,@E_StreetNo,@E_StreetName,@E_Mandal_Taluk_SubUrb,@E_CountryId,@E_StateId,
@E_DistrictId,@E_Village_Town_City,@E_Pincode,@E_ProgramId,@E_CategoryId,@E_SubjectId,@E_TitleInfo,0,GetDate())
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAffiliations]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAffiliations]
AS
BEGIN
	SELECT AffID,AffName from dbo.Affiliations_Content
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getacmprtlist]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Getacmprtlist] 
	
AS
BEGIN
	select s.Slot_ID, s.BookingDate,s.BookingSession,s.BookingTime,
(select Slot_Name from tbl_AdminBookingSlot a where a.Slot_ID=s.Slot_ID) as slotname,s.Student_Id,r.Result_ID,
r.ExamDate,r.Set_Id,r.Remarks,
r.Std_Attempted_Qstns,r.Std_Correct_Ans,r.Std_Un_Attempted_Qstns,r.Std_Wrong_Ans,r.[Status],r.Std_Result,
r.Publish_Status,r.StatusDate,s.S_No,
Convert(nvarchar(50),d.DetailsID)+' : '+ CONVERT(nvarchar(50), d.FirstName+' '+d.LastName) as studIdname,
Convert(nvarchar(50),s.Slot_ID)+' : '+Convert(nvarchar(50),s.BookingSession)+' - '
+convert(NVARCHAR, s.BookingDate, 105)+ '-'
+Convert(nvarchar(50),RIGHT(CONVERT(VARCHAR, s.BookingTime, 100),7)) as bkgIDslotsession,
d.DateOfBirth,d.MobileNumber,
d.[Status],d.Father_GaurdainName,d.EmailID,d.UserID,d.DetailsID
 from tbl_StudentBookings s,tbl_Results r,Details d where s.Student_Id= r.Student_Id and
 s.Subject_Id=r.Subject_Id and d.DetailsID=s.Student_Id and d.DetailsID=r.Student_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateCertificate]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GenerateCertificate](
@ResultID int)
as
begin

insert into tbl_StudentSubjectCertificates(CertificateID,Student_Id,Result_ID,Certificate_Status,StatusDate,
Publish_Status) values((select Student_Id from tbl_Results where Result_ID=@ResultID),
(select Student_Id from tbl_Results where Result_ID=@ResultID),@ResultID,'Generated',getdate(),'UnPublish')

update tbl_Results set Cretificate_Generate='Generated' where Result_ID=@ResultID

end
GO
/****** Object:  StoredProcedure [dbo].[SP_FacultyRegistration]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_FacultyRegistration]
(@RoleName nvarchar(20),@FirstName nvarchar(50),@LastName nvarchar(50),@DateOfBirth date,
@PlaceOfBirth nvarchar(50),@Father_GaurdainName nvarchar(50),@MotherMaidenName nvarchar(50),
@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),
@ImageName nvarchar(50),@ProgramID int,@SubjectID nvarchar(max),@AccessCode nvarchar(50),@ActiveStatus int,

@Qualification nvarchar(50),@TechnicalSkills nvarchar(50),@Employer_Address nvarchar(100),@Employer_Mail nvarchar(50),@Employer_Name nvarchar(20),@Employer_Phone nvarchar(10),@workExperience int,
@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int,

@Details_Id int=null,@LandMarkName nvarchar(10),@Location nvarchar(20))

as
begin
 insert into Details(RoleName,FirstName,LastName,DateOfBirth,PlaceOfBirth,Father_GaurdainName,MotherMaidenName,
 MobileNumber,Fixed_LandlineNumber,EmailID,OptionalEmailID,ImageName,ProgramID,
 SubjectID,AccessCode, ActiveStatus,DateofRegistration,[Status],Qualification,TechnicalSkills,Employer_Address,Employer_Email,Employer_Name,Employer_Phone,Employer_WorkExp) values
(@RoleName,@FirstName,@LastName,@DateOfBirth,@PlaceOfBirth,@Father_GaurdainName,@MotherMaidenName,
 @MobileNumber,@Fixed_LandlineNumber,@EmailID,@OptionalEmailID,@ImageName,@ProgramID,
 @SubjectID,@AccessCode,@ActiveStatus,getdate(),'Registered',@Qualification,@TechnicalSkills,@Employer_Address,@Employer_Mail,@Employer_Name,@Employer_Phone,@workExperience)

set @Details_Id=@@Identity

 insert into [Address] (DetailsID,RoleName,HouseNO,Flat_UnitNo,StreetNO,StreetName,CountryID,StateID,DistrictID,
 Village_Town_City,SubUrban_Area,PostalCode,Location,LandMarkName) values
 (@Details_Id,@RoleName,@HouseNO,@Flat_UnitNo,@StreetNO,@StreetName,@CountryID,@StateID,@DistrictID,
 @Village_Town_City,@SubUrban_Area,@PostalCode,@Location,@LandMarkName)

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCareer]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetCareer]
AS
BEGIN
SELECT CareerId,Career_Name from dbo.Careers_Content
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getassmentreportdetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Getassmentreportdetails]
@studentId as int,
@subjectId as int
AS
BEGIN
	select s.Slot_ID, s.BookingDate,s.BookingSession,s.BookingTime,
(select Slot_Name from tbl_AdminBookingSlot a where a.Slot_ID=s.Slot_ID) as slotname,s.Student_Id,
r.Std_Attempted_Qstns,r.Std_Correct_Ans,r.Std_Un_Attempted_Qstns,r.Std_Wrong_Ans,r.[Status],r.Std_Result,r.ExamDate,
r.Publish_Status,r.StatusDate,s.S_No, Convert(nvarchar(50),d.DetailsID)+' : '+ CONVERT(nvarchar(50), d.FirstName+' '+d.LastName) as studIdname,
Convert(nvarchar(50),s.Slot_ID)+' : '+Convert(nvarchar(50),s.BookingSession)+' - '
+Convert(nvarchar(50),RIGHT(CONVERT(VARCHAR, s.BookingTime, 100),7)) as bkgIDslotsession,
d.DateOfBirth,d.MobileNumber,
d.[Status],d.Father_GaurdainName,d.EmailID,d.DetailsID,(select rt.RT_Id from RealTest rt where
 rt.Student_Id=s.Student_Id)as RTId,
(select CompanyId+' '+CompanyName as companyname from CompanyDetails where CompanyId=d.CompanyID)as Cmpnyname,
(select BranchLocation from tbl_CompanyBranch where BranchID=d.Company_Branch)as branchname
 from tbl_StudentBookings s,tbl_Results r,Details d where s.Student_Id=@studentId and r.Student_Id=@studentId and 
 s.Subject_Id=@subjectId and r.Subject_Id=@subjectId and d.DetailsID=s.Student_Id and d.DetailsID=r.Student_Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEnquiryForm]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetEnquiryForm]
@CategoryId int,
@SubjectId int
AS
BEGIN
Select E_FormId from tbl_Enquiry where E_CategoryId =@CategoryId and E_SubjectId=@SubjectId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEnquiryDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_GetEnquiryDetails]
@programId int,@CateId int,@SubjectID int

as
begin
select * from dbo.Details where ProgramID=@programId and CategoryID=@CateId  and SubjectID=@SubjectID
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFacultyRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[sp_GetFacultyRegisteredUsers]

as
begin

select D.*,D.FirstName+' '+D.LastName as Name,A.* from Details D join Address A on
D.DetailsID=A.DetailsID where D.RoleName='Faculty' and ActiveStatus=0

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEvent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetEvent]
AS
BEGIN
SELECT EventId,Event_Name from dbo.Events_Content
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCurrentCounsellerRow]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetCurrentCounsellerRow]

AS
BEGIN
	Select Count(SNo)+1 as CNumber from tbl_Counsellor
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCounsellorDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetCounsellorDetails]
@CounsellorId varchar(50)
AS
BEGIN
	Select * from tbl_Counsellor where CounsellorId=@CounsellorId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetConsulting]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetConsulting]
AS
BEGIN
SELECT ConsultingID,Consult_Name from dbo.Consulting_Content
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCompanyDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[SP_GetCompanyDetails]
@DetailsID int
as
begin
select * from dbo.CompanyDetails where DetailsID=@DetailsID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getCommunicationFormDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_getCommunicationFormDetails]
@CateId int,@SubjectID int
AS
BEGIN
Select * from tbl_Enquiry where [E_CategoryId]=@CateId and [E_SubjectId]=@SubjectID
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategoriesRegisteredRoles]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetCategoriesRegisteredRoles]
@CategoryId int,@role varchar(10)
as
begin
if(@role='Student')

--select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id
--join dbo.Student_Publish sp on sp.Student_Id=D.DetailsId  
--where D.RoleName='Student' and sp.Category_Id=0  

select X.FirstName+' '+X.LastName as Name,X.DetailsId from Details X inner join  Student_Publish Y on
 X.DetailsID=Y.Student_Id where Y.Category_Id=0 and X.RoleName='Student' and Y.Student_Id 
 in(select DetailsID from Details where RoleName='Student' and CategoryID=@CategoryId)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertstudentunitspub]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Insertstudentunitspub]
@stdname as nvarchar(50),
@stdid as int,
@unitid as int,
@sts as nvarchar(50),
@stsdate as nvarchar(50)
  
AS
BEGIN
	
	insert into tbl_StudentUnits_Publish(Student_Id,UserID,Unit_Id,[Status],StatusDate,ActiveStatus)
	values(@stdid,@stdname,@unitid,@sts,@stsdate,1);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_insertStudentContentPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertStudentContentPublish]
	@studid as int,
	@rolename as nvarchar(50),	
	@subid as int,
	@unid as int,
	@contype as nvarchar(20),
	@acclevl as nvarchar(20),
	@pubstats as nvarchar(20),
	@pubstatsdat as nvarchar(20),
	@grpid as int,
	@yearid as int,
	@catschid as nvarchar(20)
	
AS
BEGIN
insert into tbl_StudentContent_Publish(Student_Id,RoleName,SubjectId,UnitId,ContentType,AccessLevel,Publish_Status,Publish_StatusDate,Group_Id,Year_Id,category_Schedule_Id)
values(@studid,@rolename,@subid,@unid,@contype,@acclevl,@pubstats,@pubstatsdat,@grpid,@yearid,@catschid)


END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertStudentClassPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_InsertStudentClassPublish]
@stdid as int,
@classId as nvarchar(30),
@status as nvarchar(20),
@stsdate as nvarchar(50),
@SchId as nvarchar(30),
@unitid as int
AS
BEGIN
	insert into Student_Class_Publish(Student_Id,Class_Id,[Status],StatusDate,ScheduleId,Classunit)
	values(@stdid,@classId,@status,@stsdate,@SchId,@unitid)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSchedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertSchedule]
@Category_Id int,
@Subject_Id int,
@Reg_Date nvarchar(50),
@Duration nvarchar(20),
@Schedule_srt_Date nvarchar(50),
@Schedule_end_Date nvarchar(50),
@Status nvarchar(20),
@Status_date nvarchar(50),
@Remarks nvarchar(max),
@Branch_Id int,
@Schedule_ID nvarchar(20)


as
begin
declare @Val nvarchar(20)='SUB'
update  tbl_Schedule set Category_Id=@Category_Id,
                          Branch_Id=@Branch_Id,
                          Subject_Id=@Subject_Id,
                          Subject_ScheduleID=  CAST(@Val AS NVARCHAR(20))+CAST(@Subject_Id as nvarchar(20)),
                          Reg_Date=@Reg_Date,
                          Duration=@Duration,
                          Schedule_srt_Date=@Schedule_srt_Date,
                          Schedule_end_Date=@Schedule_end_Date,
                          [Status]=@Status,
                          Status_date=@Status_date,
						  subjectstatus=1,
                          Remarks=@Remarks
						  
                          where Schedule_ID=@Schedule_ID

--declare @Val1 nvarchar(20)=@@Identity
--declare @Val nvarchar(20)='SUB'+@Val1
--Update tbl_Schedule set Subject_ScheduleID=@Val where Schedule_ID=@Schedule_ID

select * from tbl_Schedule where S_NO=@@Identity
end
GO
/****** Object:  StoredProcedure [dbo].[SP_insertRespondentInfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_insertRespondentInfo]
@FormId varchar(50),
@RespondentName varchar(50),
@getRespondentMsg varchar(MAX),
@getRespondentEmail varchar(50),
@getRespondentMobile varchar(50),
@getRespondentR_Type varchar(50),
@getResponseDate Date
AS
BEGIN
	insert into tbl_ResponseToEnquiry (R_FormId,R_PersonName,R_ResponseMessage,R_Email,R_MobileNumber,R_ResponseType,R_ResponseDate)values
	(@FormId,@RespondentName,@getRespondentMsg,@getRespondentEmail,@getRespondentMobile,@getRespondentR_Type,@getResponseDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertIntoStudentAns]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertIntoStudentAns]
@StudentId as int,
@RTId as int,
@subjectId as int,
@QuestionId as nvarchar(50),
@Questionans as nvarchar(30),
@Remtime as datetime,
@Examsts as nvarchar(50)

AS
BEGIN
Insert Into tbl_Save_Student_ans_backup
              (
              Student_Id,
              RTId,
              Subject_ID,
              Qustion_ID,
              Question_Answer,
              Rem_Time,
              examStatus,
              statusdate
              )
              values
              (
              @StudentId,
              @RTId,
              @subjectId,
              @QuestionId,
              @Questionans,
              @Remtime,
              @Examsts,
              GETDATE()
              )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewProgram]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertNewProgram]  
@ProgramName nvarchar(50),  
@ProgramRegDate datetime,  
@ProgramCategories int,  
@ProgramStatus nvarchar(20),  
@ProgramStatusDate date,  
@Remarks nvarchar(max)  
  
as  
begin  
Declare @ProgramNameCount nvarchar(20)  
Set @ProgramNameCount=(select count(*) from tbl_Program where Program_name=@ProgramName)  
if(@ProgramNameCount=0)  
  
insert into dbo.tbl_Program (Program_name,Program_Red_Date,Program_T_Ctgys,Program_Status,Program_Date,Program_Remarks,Status)   
values(@ProgramName,@ProgramRegDate,@ProgramCategories,@ProgramStatus,@ProgramStatusDate,@Remarks,0)  
else  
select '0'  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCompanyBranchGroupDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertCompanyBranchGroupDetails]
(
@CompanyId nvarchar(50),
@Company_BranchID nvarchar(50),
@CatrgoryID int,
@GroupID int)
as
begin


declare @Val int=(select Count(*) from tbl_Company_BranchGroup where Company_BranchID=@Company_BranchID and GroupID=@GroupID)

if(@Val =0)
begin
insert into tbl_Company_BranchGroup(CompanyId,Company_BranchID,CategoryID,GroupID,StatusDate,Status,ActiveStatus) values
(@CompanyId,@Company_BranchID,@CatrgoryID,@GroupID,Getdate(),'Active',1)
end
else
begin
update tbl_Company_BranchGroup set ActiveStatus=1,StatusDate=getdate(),Status='Activated' where Company_BranchID=@Company_BranchID and GroupID=@GroupID
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertClass]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsertClass]
		@programId int,
         @CategoryId int,
         @SubjectId int,
         @ScheduleID nvarchar(50),
         @startdate dateTime,
         @Enddate datetime,
         @Duration nvarchar(30),
         @UnitID int,
         @ClassType nvarchar(10),
         @StartTime nvarchar(10),
         @EndTime nvarchar(10),
         @Hours int,      
         @status nvarchar(50),
         @SatatusDate datetime,
         @Remarks nvarchar(50),
         @Catschedule nvarchar(50),
         @Classno as nvarchar(30)
         as
         begin
         insert into tbl_Class (
         programId,
         CategoryId,
         SubjectId,
         ScheduleID,
         startdate,Enddate
         ,Duration
         ,UnitID,
         ClassType,
         StartTime,
         EndTime,
         [Hours],
         [status],
         StatusDate,
         Remarks,
         Category_Schedule,
         ClassNo,
         ActiveStatus)
          values(
          @programId,
          @CategoryId,
          @SubjectId,
          @ScheduleID,
          @startdate,
          @Enddate,
          @Duration,
          @UnitID,
          @ClassType,
          @StartTime,
          @EndTime,
          @Hours,
          @status,
          @SatatusDate,
          @Remarks,
          @Catschedule,
          @Classno,
          '1')
         End
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCategorySchedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertCategorySchedule](
@Category_Id int,
@Subject_Id int,
@Reg_Date nvarchar(50),
@Duration nvarchar(20),
@Schedule_srt_Date nvarchar(50),
@Schedule_end_Date nvarchar(50),
@Status nvarchar(20),
@Status_date nvarchar(50),
@Remarks nvarchar(max),
@Branch_Id int,
@yearId nvarchar(20)
)

as
begin



insert into tbl_Schedule(Category_Id,Branch_Id,Subject_Id,Reg_Date,Duration,Schedule_srt_Date,
Schedule_end_Date,[Status],Status_date,Remarks,ScheduleStatus,ScheduleYear,subjectstatus) values
(@Category_Id,@Branch_Id,@Subject_Id,@Reg_Date,@Duration,@Schedule_srt_Date,
@Schedule_end_Date,@Status,@Status_date,@Remarks,'1',@yearId,2)

declare @Val1 nvarchar(20)=@@Identity
declare @Val nvarchar(20)='Sch'+@Val1

Update tbl_Schedule set Schedule_ID=@Val where S_NO=@@Identity

select * from tbl_Schedule where S_NO=@@Identity
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAdminSlot]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertAdminSlot](
@FlexField nvarchar(30),
@Subject_Id int,
@Slot_Name nvarchar(50),
@Slot_Date date,
@Slot_Time nvarchar(50),
@Slot_Sessions int,
@Slot_Status nvarchar(20),
@StatusDate date,
@Remarks nvarchar(Max))

as
begin
insert into tbl_AdminBookingSlot(FlexField,Subject_Id,Slot_Name,Slot_Date,Slot_Time,Slot_Sessions,Slot_Status,StatusDate,Remarks) values
(@FlexField,@Subject_Id,@Slot_Name,@Slot_Date,@Slot_Time,@Slot_Sessions,@Slot_Status,@StatusDate,@Remarks)

select * from tbl_AdminBookingSlot where Slot_ID=@@identity
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectClassInfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetSubjectClassInfo]  
@classId nvarchar(30)  
as  
begin  
Select * from dbo.tbl_Class where ClassNo=@classId
End
GO
/****** Object:  StoredProcedure [dbo].[sp_Insertfacultyunitspub]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Insertfacultyunitspub]

@stdname as nvarchar(50),
@stdid as int,
@unitid as int,
@sts as nvarchar(50),
@stsdate as nvarchar(50)

AS
BEGIN
	
	insert into tbl_FacultyUnits_Publish(FacultyID,UserID,Unit_Id,[Status],StatusDate,ActiveStatus)
	values(@stdid,@stdname,@unitid,@sts,@stsdate,1);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertExcelQuestions]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SP_InsertExcelQuestions](
@dtQuestios as TablevalueQuestions readonly )

as begin 
insert into Test_Qstn_Ans(Category_Id,Subject_Id,Unit_Id,Test_Type,Question,A,B,C,D,E,Answer,[Status])
select Category_Id,Subject_Id,Unit_Id,Test_Type,Question,A,B,C,D,E,Answer,[Status] from @dtQuestios
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentQstnAnswers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetStudentQstnAnswers]
(
@RTID int
)


as 
begin

declare @s nvarchar(50); 
  declare @T1 TABLE(Pos int,Val nvarchar(50))
  select top 1 @s = Qstn_Ids FROM tbl_Student_Ans where RT_ID=@RTID
  insert into @T1 select * from dbo.fn_Split(@s,',')
  --select * from @T1
  
  declare @s1 nvarchar(50); 
  declare @T2 TABLE(Pos int,Val nvarchar(50))
  select top 1 @s1 = Std_Answered FROM tbl_Student_Ans where RT_ID=@RTID
  insert into @T2 select * from dbo.fn_Split(@s1,',')
  --select * from @T2
  
  --select Q.pos,Q.val as QstnID,A.Val as Ans from @T1 Q INNER JOIN @T2 A ON Q.Pos = A.Pos

  
select SA.pos,SA.QstnID,case SA.Ans when 'A' then 'A' when 'B' then 'B' when 'C' then 'C' when 'D' then 'D' when '5' then 'E' else '0'  end as Ans,
case QT.Answer when 'A' then 'A' when 'B' then 'B' when 'C' then 'C' when 'D' then 'D' when 'E' then 'E' else '0'  end as RealAns,QT.* from Test_Qstn_Ans QT join 
( select Q.pos,Q.val as QstnID,A.Val as Ans from @T1 Q INNER JOIN @T2 A ON Q.Pos = A.Pos) SA on SA.QstnID=QT.Qstn_ID


--when 1 then A when 2 then B when 3 then C when 4 then D when 5 then E else Null end
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetPrgMethod]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetPrgMethod]
AS
BEGIN
SELECT programMethodId,ProgramMethod_Name from dbo.ProgramMethod_Content
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetNews]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetNews]
AS
BEGIN
SELECT NewsId,News_Name from dbo.News_Content
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetLoginDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetLoginDetails]
 -- Add the parameters for the stored procedure here
 @Username nvarchar(50),
 @Password nvarchar(50)
AS
BEGIN
--select * from LoginDetails where UserID=@Username and Password=@Password
select L.DetailsID,D.FirstName+' '+D.LastName as Name,L.RoleName,D.UserID from LoginDetails L join Details D 
on L.DetailsID=D.DetailsID where L.UserID=@Username and L.Password=@Password and L.UserStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormRespondentDetailsByFormId]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_getFormRespondentDetailsByFormId]
@getFormId int
AS
BEGIN
select * from tbl_ResponseToEnquiry where R_FormId=	@getFormId
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormId]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_getFormId]
AS
BEGIN
select Count(SNo)+1 as EFormId from tbl_Enquiry
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRemainingSessions]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetRemainingSessions]
(
@Slot_ID int )
as
begin
--declare @val1 int=(select Slot_Sessions from tbl_AdminBookingSlot where Slot_ID=@Slot_ID)
--declare @val2 int=(select sum(Sessions) as Sessions from tbl_companysBooking where Slot_ID=@Slot_ID group by Slot_ID)
--declare @val3 int=@val1-isnull(@val2,0)
--select @val3
select Slot_Sessions from tbl_AdminBookingSlot where Slot_ID=@Slot_ID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRegistraionDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetRegistraionDetails](
@DetailsID int,
@RoleName nvarchar(20)
)
as
begin

if @RoleName='Company'
begin
Select C.*,a.* from CompanyDetails C join Address a on C.DetailsID=a.DetailsID where 
 C.DetailsID=@DetailsID and a.RoleName='Company'
end

else
begin
Select d.*,a.* from Details d join Address a on d.DetailsID=a.DetailsID where 
 d.DetailsID=@DetailsID and a.RoleName=@RoleName
end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentAnswersBackup]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveStudentAnswersBackup]
 @studentid as int,
 @rtid as int,
 @subid as int,
 @questionid as nvarchar(max),
 @stdanswer as nvarchar(max),
 @canceledtime as datetime,
 @backupstatus as nvarchar(50)
AS
BEGIN
	
	Insert Into tbl_Student_Ans_Backup(Student_Id,RTId,Subject_ID,Qustion_ID,Question_Answeres,Canceled_Time,[STatus],statusDate)
	values(@studentid,@rtid,@subid,@questionid,@stdanswer,@canceledtime,@backupstatus,GETDATE());
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveStudentAnswers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveStudentAnswers]
 @studentid as int,
 @rtid as int,
 @subid as int,
 @examsttus as nvarchar(max)

AS
BEGIN
	Insert into tbl_Save_Student_ans(StudentID,RT_ID,SubjectId,examStatus,statusdate)
    values(@studentid,@rtid,@subid,@examsttus,GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveEmailId]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_SaveEmailId]
@FirstName varchar(50),@LastName varchar(50),@EmailId nvarchar(50),@Location nvarchar(20),@Designation nvarchar(20)
as
begin
Insert into Email(FirstName,LastName,Email,Location,Designation,AddedDate) values(@FirstName,@LastName,@EmailId,@Location,@Designation,GetDate());

select TOP 1 * from Email order by id desc

End
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_SampleTestPublish](

@StudentID int,
@Subject_Id int,
@Test_Type nvarchar(20),
@PublishType nvarchar(20)
 )
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_StudentSets_Publish where Student_Id=@StudentID and Subject_Id=@Subject_Id and Test_Type=@Test_Type)

if(@stdCount>0)
update tbl_StudentSets_Publish set [Status]=@PublishType,StatusDate=getdate() where Student_Id=@StudentID and Test_Type=@Test_Type and Subject_Id=@Subject_Id
else

insert into tbl_StudentSets_Publish(Student_Id,Subject_Id,Unit_Id,Test_Type,Status,StatusDate)values (@StudentID,@Subject_Id,0,@Test_Type,@PublishType,getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestInsert]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_SampleTestInsert](

@Category_Id int,
@Subject_Id int,
@unitId int,
@Test_Type nvarchar(20),
@Question nvarchar(max),
@Question_Type nvarchar(20),
@A nvarchar(max),
@B nvarchar(max),
@C nvarchar(max),
@D nvarchar(max),
@E nvarchar(max),
@Answer varchar(Max),
@QstnId int)
as
begin

declare @Val int 
select @Val=max(Subject_Increment)from Test_Qstn_Ans where Category_Id=@Category_Id and Subject_Id=@Subject_Id and Unit_Id=0 and Test_Type=@Test_Type


insert into Test_Qstn_Ans (Set_ID,Category_Id,Subject_Increment,Subject_Id,Unit_Id,Test_Type,Question_Type,Question,A,B,C,D,E,Answer,QstnNAId,Status_date,ActiveStatus) values
((@Val+1)%5,@Category_Id,@Val+1,@Subject_Id,@unitId,@Test_Type,@Question_Type,@Question,@A,@B,@C,@D,@E,@Answer,@QstnId,getdate(),1)


select * from Test_Qstn_Ans where Qstn_ID=@@Identity

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SampleTestFillBlanks_Insert]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_SampleTestFillBlanks_Insert](

@Category_Id int,
@Subject_Id int,
@UnitId as int,
@Test_Type nvarchar(20),
@Question nvarchar(max),
@Question_Type nvarchar(20),
@Answer varchar(Max),
@QstnId as int,
@catschedule as nvarchar(30),
@SubSchId as nvarchar(30))
as
begin

insert into Test_Qstn_Ans (Category_Id,Subject_Id,Unit_Id,Test_Type,Question,Question_Type,Answer,QstnNAId,Status_date,Cat_Schedile,[Status],Sub_ScheduleId,ActiveStatus) values
(@Category_Id,@Subject_Id,@UnitId,@Test_Type,@Question,@Question_Type,@Answer,@QstnId,getdate(),@catschedule,'New',@SubSchId,'1')


select * from Test_Qstn_Ans where Qstn_ID=@@Identity

end
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadConsultingData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadConsultingData]
@ID int
AS
BEGIN
	Select ConsultingID,Consult_Content from dbo.Consulting_Content where ConsultingID=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadCareerData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadCareerData]
@ID int
AS
BEGIN
	Select CareerId,Career_Content  from dbo.Careers_Content where CareerId=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadAffiliationData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadAffiliationData]
@ID int
AS
BEGIN
	Select AffID,Aff_Content from dbo.Affiliations_Content where AffID=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadProgramData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadProgramData]
@ID int
AS
BEGIN
	Select programMethodId,ProgramMethod_Content  from dbo.ProgramMethod_Content where programMethodId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadNewsData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadNewsData]
@ID int
AS
BEGIN
	Select NewsId,News_Content  from dbo.News_Content where NewsId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadImages]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadImages]
@CounsellorId varchar(50)
AS
BEGIN
	Select CounsellorImage from tbl_Counsellor where CounsellorId=@CounsellorId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadEventData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoadEventData]
@ID int
AS
BEGIN
	Select EventId,Event_Content  from dbo.Events_Content where EventId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateStudentProfile]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateStudentProfile]
(@DetailsID int,@RoleName nvarchar(20),@DateOfBirth date,@PlaceOfBirth nvarchar(50),@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),
@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),@Qualification nvarchar(50),@TechnicalSkills nvarchar(50),
@ImageName nvarchar(50),

@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int)

as
begin

 Update Details set DateOfBirth=@DateOfBirth,PlaceOfBirth=@PlaceOfBirth,
 MobileNumber=@MobileNumber,Fixed_LandlineNumber=@Fixed_LandlineNumber,EmailID=@EmailID,OptionalEmailID=@OptionalEmailID,
 Qualification=@Qualification,TechnicalSkills=@TechnicalSkills,ImageName=@ImageName,StatusDate=getdate()
  where DetailsID=@DetailsID


 Update [Address] set HouseNO=@HouseNO,Flat_UnitNo=@Flat_UnitNo,StreetNO=@StreetNO,StreetName=@StreetName,
 CountryID=@CountryID,StateID=@StateID,DistrictID=@DistrictID,
 Village_Town_City=@Village_Town_City,SubUrban_Area=@SubUrban_Area,PostalCode=@PostalCode
 where DetailsID=@DetailsID and RoleName=@RoleName

end
GO
/****** Object:  StoredProcedure [dbo].[sp_updatestudentBooking]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_updatestudentBooking]
@StudentId int,
@bookingDate date,
@Slot nvarchar(50),
@Bookingtime datetime,
@BookingSession nvarchar(50)
AS
BEGIN
	update tbl_StudentBookings set Newbooking_date=@bookingDate,NewBK_Slot=@Slot,Newbooking_Time=@Bookingtime,NewBK_Session=@BookingSession where Student_Id=@StudentId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateSchedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_UpdateSchedule](
@S_NO int,
@Schedule_srt_Date nvarchar(50), 
@Schedule_end_Date  nvarchar(50),
@Status nvarchar(20),
@Status_date nvarchar(50),
@Remarks nvarchar(max))

as
begin

update tbl_Schedule set Schedule_srt_Date=@Schedule_srt_Date,Schedule_end_Date=@Schedule_end_Date,Status=@Status,
Status_date=@Status_date,Remarks=@Remarks where S_NO=@S_NO

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateQuestion]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_UpdateQuestion](
@Qstn_ID int,
@Question nvarchar(max),
@A nvarchar(max),
@B nvarchar(max),
@C nvarchar(max),
@D nvarchar(max),
@E nvarchar(max),
@Answer nvarchar(max))
as
begin


Update Test_Qstn_Ans set Question=@Question,A=@A,B=@B,C=@C,D=@D,E=@E,Answer=@Answer where Qstn_ID=@Qstn_ID

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateQstns]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateQstns]
@Qid as int,
@Question as nvarchar(MAX),
@A as nvarchar(MAX),
@B as nvarchar(MAX),
@C as nvarchar(MAX),
@D as nvarchar(MAX),
@E as nvarchar(MAX),
@Answer as nvarchar(MAX)
AS
BEGIN
	Update Test_Qstn_Ans set
	Question=@Question,
	A=@A,
	B=@B,
	C=@C,
	D=@D,
	E=@E,
	Answer=@Answer where QstnNAId=@Qid
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrograms]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdatePrograms](  
@Program_id int,  
@Program_Red_Date datetime,  
@Program_T_Ctgys int,  
@Program_Status nvarchar(20),  
@Program_Date date,  
@Program_Remarks nvarchar(max)  
)  
as  
Begin  
update tbl_Program set Program_Red_Date=@Program_Red_Date,Program_T_Ctgys=@Program_T_Ctgys,Program_Status=@Program_Status,  
Program_Date=@Program_Date,Program_Remarks=@Program_Remarks where Program_id=@Program_id  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdatePrgMethodContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdatePrgMethodContent]
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.ProgramMethod_Content
set ProgramMethod_Content=@Content where programMethodId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateNewsContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateNewsContent]
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.News_Content
set News_Content=@Content where NewsId=@ID;

END
GO
/****** Object:  StoredProcedure [dbo].[SP_updateFormStatus]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_updateFormStatus]
@getFormId int
AS
BEGIN
	Update tbl_Enquiry
	set E_Status=1 ,E_StatusDate=getdate()
	where E_FormId=@getFormId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateEventContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateEventContent]
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.Events_Content
set Event_Content=@Content where EventId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateDeleteclassGrid]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateDeleteclassGrid]
@ClassId int,
@StartTime nvarchar(10),
@EndTime nvarchar(10),
@status nvarchar(50),
@Classtype as nvarchar(30)
AS
BEGIN
	update tbl_Class set
                StartTime=@StartTime
               ,EndTime=@EndTime
               ,[status]=@status
               ,ClassType=@Classtype
               ,ActiveStatus=1
               where ClassId=@ClassId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Updatedeleteclass]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Updatedeleteclass]
@ClassId int,
@Duration nvarchar(30),
@ClassType nvarchar(10),
@StartTime nvarchar(10),
@EndTime nvarchar(10),
@Hours int,
@StatusDate datetime,
@Remarks nvarchar(50),
@CatSchedule as nvarchar(50),
@Classno as nvarchar(30)

AS
BEGIN
update tbl_Class set
               Duration=@Duration
               ,ClassType=@ClassType
               ,StartTime=@StartTime
               ,EndTime=@EndTime
               ,[Hours]=@Hours
               ,[status]='New'
               ,StatusDate=@StatusDate
               ,Remarks=@Remarks
               ,Category_Schedule=@CatSchedule
               ,ClassNo=@Classno
               ,ActiveStatus=1
               where ClassId=@ClassId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCounsellorProfile]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCounsellorProfile] 
@CounsellorId varchar(50),@C_FName Varchar(50),@C_LName Varchar(50),@C_FatherName Varchar(50),@C_MotherName Varchar(50),@DOB Date,@POB Varchar(50),@LandLineNumber Varchar(50),@MobileNumber Varchar(50),@EmailId Varchar(50),@Flat_UnitNo Varchar(50),@HNo Varchar(50),@LandMarkName Varchar(50),
@DistrictId int,@StateId int,@CountryId int,@Pincode Varchar(50),@Edu_Qualification Varchar(50),@TechnicalSkills Varchar(50),@WorkExp int,@EmployerName Varchar(50),@EmployerPhone Varchar(50),@EmployerAddress Varchar(50),@CounsellorLocation Varchar(50)
as Begin
update  dbo.tbl_Counsellor 
set
C_FName=@C_FName,C_LName=@C_LName,C_FatherName=@C_FatherName,C_MotherName=@C_MotherName,DOB=@DOB,POB=@POB,LandLineNumber=@LandLineNumber,MobileNumber=@MobileNumber,EmailId=@EmailId,Flat_UnitNo=@Flat_UnitNo,HNo=@HNo,LandMarkName=@LandMarkName,
DistrictId=@DistrictId,StateId=@StateId,CountryId=@CountryId,Pincode=@Pincode,Edu_Qualification=@Edu_Qualification,TechnicalSkills=@TechnicalSkills,WorkExp=@WorkExp,EmployerName=@EmployerName,EmployerPhone=@EmployerPhone,EmployerAddress=@EmployerAddress,
CounsellorLocation=@CounsellorLocation where CounsellorId=@CounsellorId

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateConsultingContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateConsultingContent]
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.Consulting_Content
set Consult_Content=@Content where ConsultingID=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCompanyProfile]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_UpdateCompanyProfile]
(@DetailsID int,@RoleName nvarchar(20),@DateOfBirth date,@PlaceOfBirth nvarchar(50),@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),
@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),@ImageName nvarchar(50),

@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int)

as
begin

 Update CompanyDetails set DateOfBirth=@DateOfBirth,PlaceOfBirth=@PlaceOfBirth,
 MobileNumber=@MobileNumber,Fixed_LandlineNO=@Fixed_LandlineNumber,EmailID=@EmailID,ContactPersonAlternativeEmailID=@OptionalEmailID,
 ImageName=@ImageName,StatusDate=getdate()
  where DetailsID=@DetailsID


 Update [Address] set HouseNO=@HouseNO,Flat_UnitNo=@Flat_UnitNo,StreetNO=@StreetNO,StreetName=@StreetName,
 CountryID=@CountryID,StateID=@StateID,DistrictID=@DistrictID,
 Village_Town_City=@Village_Town_City,SubUrban_Area=@SubUrban_Area,PostalCode=@PostalCode
 where DetailsID=@DetailsID and RoleName=@RoleName

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Updatecompanydetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Updatecompanydetails]
@CompanyId as nvarchar(50),
@cphone as nvarchar(50),
@cmobile as nvarchar(50),
@cotheremailId as nvarchar(50),
@flatno as nvarchar(50),
@plotno as nvarchar(50),
@landmark as nvarchar(50),
@streetno as nvarchar(50),
@streetname as nvarchar(50),
@villagetowncity as nvarchar(50),
@suburbanaea as nvarchar(50),
@districtid  as  int,
@state as int,
@country as int,
@postalcode as int,
@firstname as nvarchar(50),
@fathername as nvarchar(50),
@mothermaidenname as nvarchar(50),
@Dob as date,
@placeofbirth as nvarchar(50),
@phone as nvarchar(50),
@mobile as nvarchar(50),
@emailid as nvarchar(50),
@otheremailid as nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	update
	 CompanyDetails 
	 set
	 OfficePhoneNO=@cphone,
	 MobileNumber=@cmobile,
	 ContactPersonAlternativeEmailID=@cotheremailId,
	 Flat_UnitNo=@flatno,
	 HouseNO=@plotno,
	 StreetNO=@streetno,
	 StreetName=@streetname,
	 Village_Town_City=@villagetowncity,
	 SubUrban_Area=@suburbanaea,
	 DistrictID=@districtid,
	 StateID= @state,
	 CountryID=@country,
	 PostalCode=@postalcode,
	 FirstName=@firstname,
	 Father_GuardianName=@fathername,
	 MotherMaidenName=@mothermaidenname,
	 DateOfBirth=@Dob,
	 PlaceOfBirth= @placeofbirth,
	 Fixed_LandlineNO=@phone
	where CompanyId=@CompanyId
	 
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_updateclassinfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_updateclassinfo]
@ClassId as int,
@status as nvarchar(50),
@classtype as nvarchar(50),
@starttime as nvarchar(10),
@Endtime as nvarchar(10)
AS
BEGIN
	update tbl_Class set 
	       [status]=@status
	       ,ClassType=@classtype
	       ,StartTime=@starttime
	       ,EndTime=@Endtime
	       where ClassId=@ClassId
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateclassGrid]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdateclassGrid]
@ClassId int,
@startdate datetime,
@Enddate datetime
AS
BEGIN
	update tbl_Class set
               startdate=@startdate
               ,Enddate=@Enddate
               where ClassId=@ClassId
END
GO
/****** Object:  Table [dbo].[tbl_companysBooking]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_companysBooking](
	[S_No] [int] IDENTITY(1,1) NOT NULL,
	[Slot_ID] [int] NULL,
	[Slot_Name] [nvarchar](50) NULL,
	[CompanyID] [int] NULL,
	[Company_BranchID] [nvarchar](50) NULL,
	[Sessions] [int] NULL,
 CONSTRAINT [PK_tbl_companysBooking] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_companysBooking] ON
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (1, 11, N'Slot-A', 1, N'1', 10)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (2, 4, N'Slot-A', 1, N'2', 10)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (4, 11, N'Slot-A', 3, N'7', 27)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (5, 12, N'Slot-B', 2, N'3', 10)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (8, 11, N'Slot-A', 2, N'3', 10)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (12, 13, N'Slot-C', 1, N'1', 6)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (13, 13, N'Slot-C', 2, N'3', 5)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (14, 13, N'Slot-C', 3, N'7', 8)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (15, 15, N'Slot-D', 1, N'2', 1)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (16, 15, N'Slot-D', 2, N'3', 3)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (17, 15, N'Slot-D', 3, N'7', 1)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (18, 17, N'Slot-A', 1, N'11', 20)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (19, 17, N'Slot-A', 2, N'3', 28)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (20, 19, N'Slot-B', 2, N'3', 28)
INSERT [dbo].[tbl_companysBooking] ([S_No], [Slot_ID], [Slot_Name], [CompanyID], [Company_BranchID], [Sessions]) VALUES (21, 19, N'Slot-B', 1, N'2', 28)
SET IDENTITY_INSERT [dbo].[tbl_companysBooking] OFF
/****** Object:  StoredProcedure [dbo].[UpdateClass]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateClass](
@ClassId int,
@Duration nvarchar(30),
@ClassType nvarchar(10),
@StartTime nvarchar(10),
@EndTime nvarchar(10),
@Hours int,
@status nvarchar(50),
@StatusDate datetime,
@Remarks nvarchar(50),
@CatSchedule as nvarchar(50),
@Classno as nvarchar(30))


as
begin

update tbl_Class set
               Duration=@Duration
               ,ClassType=@ClassType
               ,StartTime=@StartTime
               ,EndTime=@EndTime
               ,[Hours]=@Hours
               ,[status]=@status
               ,StatusDate=@StatusDate
               ,Remarks=@Remarks
               ,Category_Schedule=@CatSchedule
               ,ClassNo=@Classno
               where ClassId=@ClassId

end
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 06/24/2016 17:50:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdtaeDeleteQstns]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_UpdtaeDeleteQstns]
@Qstn_ID int,
@Question nvarchar(max),
@A nvarchar(max),
@B nvarchar(max),
@C nvarchar(max),
@D nvarchar(max),
@E nvarchar(max),
@Answer nvarchar(max)

AS
BEGIN
	Update Test_Qstn_Ans set Question=@Question,A=@A,B=@B,C=@C,D=@D,E=@E,Answer=@Answer,[Status]='New',ActiveStatus=1 where Qstn_ID=@Qstn_ID

END
GO
/****** Object:  StoredProcedure [dbo].[sp_PublishItems]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_PublishItems]
@categoryId int,@list varchar(50)

as

begin

update dbo.Student_Publish set Category_Id=@categoryId where Student_Id in(@list)

End
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCareerContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCareerContent]
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.Careers_Content
set Career_Content=@Content where CareerId=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAffiliationContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateAffiliationContent] 
	@ID int ,
	@Content varchar(MAX)
AS
BEGIN
Update dbo.Affiliations_Content
set Aff_Content=@Content where AffID=@ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAdminSlot]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_UpdateAdminSlot](
@Slot_ID int,
@Slot_Date date,
@Slot_Time nvarchar(50),
@Slot_Status nvarchar(20),
@StatusDate date,
@Remarks nvarchar(Max))

as
begin
Update tbl_AdminBookingSlot set Slot_Date=@Slot_Date,Slot_Time=@Slot_Time,Slot_Status=@Slot_Status,
StatusDate=@StatusDate,Remarks=@Remarks where Slot_ID=@Slot_ID

select * from tbl_AdminBookingSlot where Slot_ID=@Slot_ID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateAdminProfile]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_UpdateAdminProfile]
(@DetailsID int,@RoleName nvarchar(20),@DateOfBirth date,@PlaceOfBirth nvarchar(50),@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),
@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),@ImageName nvarchar(50),

@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int)

as
begin

 Update Details set DateOfBirth=@DateOfBirth,PlaceOfBirth=@PlaceOfBirth,
 MobileNumber=@MobileNumber,Fixed_LandlineNumber=@Fixed_LandlineNumber,EmailID=@EmailID,OptionalEmailID=@OptionalEmailID,
 ImageName=@ImageName,StatusDate=getdate()
  where DetailsID=@DetailsID


 Update [Address] set HouseNO=@HouseNO,Flat_UnitNo=@Flat_UnitNo,StreetNO=@StreetNO,StreetName=@StreetName,
 CountryID=@CountryID,StateID=@StateID,DistrictID=@DistrictID,
 Village_Town_City=@Village_Town_City,SubUrban_Area=@SubUrban_Area,PostalCode=@PostalCode
 where DetailsID=@DetailsID and RoleName=@RoleName

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Schedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Update_Schedule]
@SubjectId as int,
@ScheduleId as nvarchar(20)
AS
BEGIN
	update tbl_Schedule set Subject_Id=@SubjectId where Schedule_ID=@ScheduleId
	Declare @val nvarchar(20)=@@Identity
	Declare @Val1 nvarchar(20)='SUB'+@val
	update tbl_Schedule set Subject_ScheduleID=@Val1  where Schedule_ID=@ScheduleId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_ClassD]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Update_ClassD]
@ClassId int,
@Duration nvarchar(30),
@ClassType nvarchar(10),
@StartTime nvarchar(10),
@EndTime nvarchar(10),
@Hours int,
@StatusDate datetime,
@Remarks nvarchar(50),
@CatSchedule as nvarchar(50),
@Classno as nvarchar(30)
AS
BEGIN
	update tbl_Class set
               Duration=@Duration
               ,ClassType=@ClassType
               ,StartTime=@StartTime
               ,EndTime=@EndTime
               ,[Hours]=@Hours
               ,StatusDate=@StatusDate
               ,Remarks=@Remarks
               ,Category_Schedule=@CatSchedule
               ,ClassNo=@Classno
               where ClassId=@ClassId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_upadtebranchdetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_upadtebranchdetails]
	@BranchId as nvarchar(50),
	@Branchname as nvarchar(50),
	@Branchlocation as nvarchar(50),
	@branchoffice as nvarchar(50),
	@brancharea as nvarchar(50),
	@branchstatus as nvarchar(50)
AS
BEGIN
	update 
	tbl_CompanyBranch 
	set 
	BranchName=@Branchname,
	BranchLocation=@Branchlocation,
	BranchOffice=@branchoffice,
	BranchArea=@brancharea,
	BranchStatus=@branchstatus where BranchID=@BranchId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UnitPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_UnitPublish](

@StudentID int,
@UnitID int)
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_StudentUnits_Publish where Student_Id=@StudentID and Unit_Id=@UnitID)

if(@stdCount>0)
update tbl_StudentUnits_Publish set [Status]='Publish',StatusDate=getdate() where Student_Id=@StudentID and Unit_Id=@UnitID
else

insert into tbl_StudentUnits_Publish(Student_Id,Unit_Id,[Status],StatusDate) values(@StudentID,@UnitID,'Publish',getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_UnitFacultyPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_UnitFacultyPublish](

@StudentID int,
@UnitID int)
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_FacultyUnits_Publish where FacultyID=@StudentID and Unit_Id=@UnitID)

if(@stdCount>0)
update tbl_FacultyUnits_Publish set [Status]='Publish',StatusDate=getdate() where FacultyID=@StudentID and Unit_Id=@UnitID
else

insert into tbl_FacultyUnits_Publish(FacultyID,Unit_Id,[Status],StatusDate) values(@StudentID,@UnitID,'Publish',getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectPublishForFaculty]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_SubjectPublishForFaculty](

@StudentID int,
@SubjectID int)
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_FacultySubjects_Publish where FacultyID=@StudentID and Subject_Id=@SubjectID)

if(@stdCount>0)
update tbl_FacultySubjects_Publish set [Status]='Publish',StatusDate=getdate() where FacultyID=@StudentID and Subject_Id=@SubjectID
else

insert into tbl_FacultySubjects_Publish(FacultyID,Subject_Id,[Status],StatusDate) values(@StudentID,@SubjectID,'Publish',getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[sp_SubjectPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_SubjectPublish](

@StudentID int,
@SubjectID int)
as
begin

declare @stdCount int

set @stdCount=(select count(*) from tbl_StudentSubjects_Publish where Student_Id=@StudentID and Subject_Id=@SubjectID)

if(@stdCount>0)
update tbl_StudentSubjects_Publish set [Status]='Publish',StatusDate=getdate() where Student_Id=@StudentID and Subject_Id=@SubjectID
else

insert into tbl_StudentSubjects_Publish(Student_Id,Subject_Id,[Status],StatusDate) values(@StudentID,@SubjectID,'Publish',getdate())

end
GO
/****** Object:  StoredProcedure [dbo].[SP_StudentRegistration]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_StudentRegistration]    
(@RoleName nvarchar(20),@FirstName nvarchar(50),@LastName nvarchar(50),@DateOfBirth date,    
@PlaceOfBirth nvarchar(50),@Father_GaurdainName nvarchar(50),@MotherMaidenName nvarchar(50),    
@MobileNumber nvarchar(50),@Fixed_LandlineNumber nvarchar(50),@EmailID nvarchar(50),@OptionalEmailID nvarchar(50),    
@Qualification nvarchar(50),@TechnicalSkills nvarchar(50),@ImageName nvarchar(50),@CompanyID int,@BranchID int,    
@LocationID int,@ProgramID int,@CategoryID int,@Schedule_ID nvarchar(20),@ActiveStatus int,@AccessCode int,  
    
@HouseNO nvarchar(50),@Flat_UnitNo nvarchar(50),@StreetNO nvarchar(50),@StreetName nvarchar(50),@CountryID int,@StateID int,    
@DistrictID int,@Village_Town_City nvarchar(50),@SubUrban_Area nvarchar(50),@PostalCode int,  
    
@Details_Id int=null,@SubjectId int,@LandMarkName nvarchar(10),@Location nvarchar(20))    
    
   
as    
begin    

----- to generate the Reg no call the function dbo.GenerateStudentRegNo
-- Declare @RegNo varchar(50)
 --   set @RegNo=(select dbo.GenerateStudentRegNo(@CompanyID,@ProgramID))
---
 insert into Details(RoleName,FirstName,LastName,DateOfBirth,PlaceOfBirth,Father_GaurdainName,MotherMaidenName,    
 MobileNumber,Fixed_LandlineNumber,EmailID,OptionalEmailID,Qualification,TechnicalSkills,ImageName,CompanyID,BranchID, 
LocationID,ProgramID,CategoryID,Schedule_ID,ActiveStatus,DateofRegistration,StatusDate,Status,SubjectID,AccessCode) values    
(@RoleName,@FirstName,@LastName,@DateOfBirth,@PlaceOfBirth,@Father_GaurdainName,@MotherMaidenName,    
 @MobileNumber,@Fixed_LandlineNumber,@EmailID,@OptionalEmailID,@Qualification,@TechnicalSkills,@ImageName,@CompanyID,@BranchID,
@LocationID,@ProgramID,@CategoryID,@Schedule_ID,@ActiveStatus,getdate(),getdate(),'Registered',@SubjectId,@AccessCode)    
    
set @Details_Id=@@Identity    
    
 insert into [Address] (DetailsID,RoleName,HouseNO,Flat_UnitNo,StreetNO,StreetName,CountryID,StateID,DistrictID,    
 Village_Town_City,SubUrban_Area,PostalCode,Location,LandMarkName) values    
 (@Details_Id,@RoleName,@HouseNO,@Flat_UnitNo,@StreetNO,@StreetName,@CountryID,@StateID,@DistrictID,    
 @Village_Town_City,@SubUrban_Area,@PostalCode,@Location,@LandMarkName)    
    
end
GO
/****** Object:  Table [dbo].[tbl_Categories]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categories](
	[Category_Id] [int] IDENTITY(1,1) NOT NULL,
	[Program_id] [int] NULL,
	[Category_Name] [nvarchar](50) NULL,
	[Category_Reg_Date] [datetime] NULL,
	[Category_T_Group] [int] NULL,
	[Category_T_Subjects] [int] NULL,
	[Category_T_Eligible] [nvarchar](20) NULL,
	[Category_Srt_Date] [date] NULL,
	[Category_End_Date] [date] NULL,
	[Category_Duration] [nvarchar](20) NULL,
	[Category_Status] [nvarchar](20) NULL,
	[Category_Status_Date] [date] NULL,
	[Category_Remarks] [nvarchar](50) NULL,
	[Category_Branch] [nvarchar](20) NULL,
	[Category_Year] [nvarchar](10) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_Categories] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Categories] ON
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (1, 1, N'B.sc', CAST(0x0000A4BA01035246 AS DateTime), NULL, 2, NULL, CAST(0x153A0B00 AS Date), CAST(0x833B0B00 AS Date), N'300', N'1', CAST(0x153A0B00 AS Date), N'Good', N'Bsc1', N'1', 1)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (2, 2, N'B.Tech', CAST(0x00008DCF00000000 AS DateTime), 2, 3, N'Intee', NULL, NULL, NULL, N'New', CAST(0x183A0B00 AS Date), N'Good', N'Mechanical', N'I year', 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (3, 2, N'ABC', CAST(0x00008DCF00000000 AS DateTime), NULL, 3, N'Inter', NULL, NULL, NULL, NULL, CAST(0x173A0B00 AS Date), N'Good', N'EEE', N'II year', 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (9, 8, N'New Cate', CAST(0x0000A4C800000000 AS DateTime), 2, NULL, N'Inter', CAST(0x283A0B00 AS Date), CAST(0x2C3A0B00 AS Date), NULL, NULL, CAST(0x2D3A0B00 AS Date), N'not completed', NULL, NULL, 1)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (10, 8, N'ENT', CAST(0x0000A4D400000000 AS DateTime), 2, NULL, N'Inter', CAST(0x273A0B00 AS Date), CAST(0x283A0B00 AS Date), NULL, N'1', CAST(0x2F3A0B00 AS Date), N'not completed', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (27, 25, N'Dep-Cat1', CAST(0x0000A51400000000 AS DateTime), 1, NULL, N'+2', CAST(0x6F3A0B00 AS Date), CAST(0x793A0B00 AS Date), N'10', N'---Select---', CAST(0x6F3A0B00 AS Date), N'Started', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (28, 26, N'adc1', CAST(0x0000A51500000000 AS DateTime), 1, NULL, N'+2', CAST(0x7F3A0B00 AS Date), CAST(0x9D3A0B00 AS Date), N'30', N'New', CAST(0x703A0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (29, 27, N'Dep1-Cat1', CAST(0x0000A51600000000 AS DateTime), 2, NULL, N'12', CAST(0x7F3A0B00 AS Date), CAST(0xF93A0B00 AS Date), N'122', N'Started', CAST(0x703A0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (33, 31, N'B.Pharmacy', CAST(0x0000A51600000000 AS DateTime), 3, 3, N'12+', CAST(0x4E3B0B00 AS Date), CAST(0x6C3B0B00 AS Date), N'30', N'New', CAST(0x703A0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (35, 31, N'M.Pharmacy', CAST(0x0000A5EF00000000 AS DateTime), 2, NULL, N'12+', CAST(0x4E3B0B00 AS Date), CAST(0x6C3B0B00 AS Date), N'30', N'New', CAST(0x493B0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (36, 31, N'M.Pharmacy1', CAST(0x0000A5EF00000000 AS DateTime), 2, NULL, N'12+', CAST(0x533B0B00 AS Date), CAST(0x713B0B00 AS Date), N'30', N'New', CAST(0x493B0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (38, 27, N'Dep-Cat1', CAST(0x0000A5F100000000 AS DateTime), 2, NULL, N'12+', CAST(0x533B0B00 AS Date), CAST(0x713B0B00 AS Date), N'30', N'New', CAST(0x493B0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (39, 29, N'ssss', CAST(0x0000A5EF00000000 AS DateTime), 2, NULL, N'12+', CAST(0x533B0B00 AS Date), CAST(0x713B0B00 AS Date), N'30', N'New', CAST(0x493B0B00 AS Date), N'Good', NULL, NULL, 0)
INSERT [dbo].[tbl_Categories] ([Category_Id], [Program_id], [Category_Name], [Category_Reg_Date], [Category_T_Group], [Category_T_Subjects], [Category_T_Eligible], [Category_Srt_Date], [Category_End_Date], [Category_Duration], [Category_Status], [Category_Status_Date], [Category_Remarks], [Category_Branch], [Category_Year], [Status]) VALUES (40, 32, N'Others', CAST(0x0000A5F400000000 AS DateTime), 2, NULL, N'12', CAST(0x503B0B00 AS Date), CAST(0x8D3B0B00 AS Date), N'61', N'New', CAST(0x4F3B0B00 AS Date), N'Good', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[tbl_Categories] OFF
/****** Object:  Table [dbo].[tbl_Content]    Script Date: 06/24/2016 17:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Content](
	[Content_Id] [int] IDENTITY(1,1) NOT NULL,
	[Content_Name] [nvarchar](max) NOT NULL,
	[Program_Id] [int] NOT NULL,
	[Category_Id] [int] NOT NULL,
	[Subject_Id] [int] NOT NULL,
	[Unit_Id] [int] NOT NULL,
	[Content_Data] [nvarchar](max) NULL,
	[Content_AddDate] [datetime] NULL,
	[BrowsedFilePath] [nvarchar](max) NULL,
	[Group_ID] [int] NULL,
	[year_ID] [int] NULL,
	[CategorySchedul_ID] [nvarchar](20) NULL,
	[subjectSCHId] [nvarchar](30) NULL,
	[contentstatus] [nvarchar](50) NULL,
	[activestatus] [int] NULL,
 CONSTRAINT [PK_tbl_Content] PRIMARY KEY CLUSTERED 
(
	[Content_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Content] ON
INSERT [dbo].[tbl_Content] ([Content_Id], [Content_Name], [Program_Id], [Category_Id], [Subject_Id], [Unit_Id], [Content_Data], [Content_AddDate], [BrowsedFilePath], [Group_ID], [year_ID], [CategorySchedul_ID], [subjectSCHId], [contentstatus], [activestatus]) VALUES (65, N'Text', 25, 27, 18, 19, N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(68, 68, 68); font-family: sans-serif; font-size: 14.6667px; line-height: 20.9524px;">
	hi</p>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(68, 68, 68); font-family: sans-serif; font-size: 14.6667px; line-height: 20.9524px;">
	i am using  datepicker jquery plugin its working fine but i am selecting date first its accept mm dd yy, but i want dd mm yy how to select this one?</p>
', CAST(0x0000A51401057277 AS DateTime), N'TextFile\Lesson-1.pdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Content] ([Content_Id], [Content_Name], [Program_Id], [Category_Id], [Subject_Id], [Unit_Id], [Content_Data], [Content_AddDate], [BrowsedFilePath], [Group_ID], [year_ID], [CategorySchedul_ID], [subjectSCHId], [contentstatus], [activestatus]) VALUES (66, N'Text', 25, 27, 18, 19, N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(68, 68, 68); font-family: sans-serif; font-size: 14.6667px; line-height: 20.9524px;">
	<span style="font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 15px; line-height: 19.5px;">onSelect event handler first parameter is the selected date as text. I guess it would be formatted as specified during the initialization</span></p>
', CAST(0x0000A5140105982F AS DateTime), N'TextFile\Lesson-1.pdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Content] ([Content_Id], [Content_Name], [Program_Id], [Category_Id], [Subject_Id], [Unit_Id], [Content_Data], [Content_AddDate], [BrowsedFilePath], [Group_ID], [year_ID], [CategorySchedul_ID], [subjectSCHId], [contentstatus], [activestatus]) VALUES (67, N'Text', 25, 27, 18, 20, N'<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(68, 68, 68); font-family: sans-serif; font-size: 14.6667px; line-height: 20.9524px;">
	<span style="color: rgb(119, 119, 119); font-family: ''Open Sans'', sans-serif; font-size: 15px; line-height: 26px;">Nothing shocks me, I''m a Software Engineer. And I am not young enough to know everything. I live in World Wide Web and from there take care of this website. This website communicates about my work, learning and experience. I believe life is short, and it is for loving, sharing, learning and connecting. So lets connect..</span></p>
', CAST(0x0000A5140105AB70 AS DateTime), N'TextFile\Eng-2.pdf', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_Content] ([Content_Id], [Content_Name], [Program_Id], [Category_Id], [Subject_Id], [Unit_Id], [Content_Data], [Content_AddDate], [BrowsedFilePath], [Group_ID], [year_ID], [CategorySchedul_ID], [subjectSCHId], [contentstatus], [activestatus]) VALUES (182, N'Text', 31, 33, 30, 30, N'abcd efgh ijkl mnop qrst uvwx yz', CAST(0x0000A62D00FFB4FF AS DateTime), N'TextFile\30-atomic struture.txt', 20, 31, N'Sch21', N'SUB30', N'New', 1)
INSERT [dbo].[tbl_Content] ([Content_Id], [Content_Name], [Program_Id], [Category_Id], [Subject_Id], [Unit_Id], [Content_Data], [Content_AddDate], [BrowsedFilePath], [Group_ID], [year_ID], [CategorySchedul_ID], [subjectSCHId], [contentstatus], [activestatus]) VALUES (183, N'Video', 31, 33, 30, 31, N'', CAST(0x0000A62D01002F25 AS DateTime), N'VideoFiles\31-Acids.MP4', 20, 31, N'Sch21', N'SUB30', N'New', 1)
SET IDENTITY_INSERT [dbo].[tbl_Content] OFF
/****** Object:  Table [dbo].[tbl_Branch]    Script Date: 06/24/2016 17:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Branch](
	[Branch_Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Id] [int] NULL,
	[Branch_Name] [nvarchar](50) NULL,
	[Branch_Status] [int] NULL,
	[Branch_T_Years] [int] NULL,
	[Branch_Srt_Date] [date] NULL,
	[Branch_End_Date] [date] NULL,
	[Branch_Remarks] [nvarchar](max) NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Branch] ON
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (6, 1, N'Test', 1, 8, CAST(0xD4390B00 AS Date), CAST(0x853B0B00 AS Date), NULL, N'1         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (13, 27, N'DCat', 1, 3, CAST(0x6F3A0B00 AS Date), CAST(0x6F3A0B00 AS Date), NULL, N'1         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (14, 28, N'bzc', NULL, 2, CAST(0x703A0B00 AS Date), CAST(0x703A0B00 AS Date), NULL, N'0         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (15, 29, N'bzc', NULL, 2, CAST(0x703A0B00 AS Date), CAST(0x703A0B00 AS Date), NULL, N'          ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (16, 2, N'etr', NULL, 1, CAST(0x433B0B00 AS Date), CAST(0x433B0B00 AS Date), NULL, N'          ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (20, 33, N'Pharm1', NULL, 2, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, N'1         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (21, 33, N'Pharm12', NULL, 2, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, N'1         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (22, 33, N'etr', NULL, 1, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, N'1         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (24, 35, N'chem', NULL, 1, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, N'0         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (25, 35, N'chem', NULL, 1, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, N'0         ')
INSERT [dbo].[tbl_Branch] ([Branch_Id], [Category_Id], [Branch_Name], [Branch_Status], [Branch_T_Years], [Branch_Srt_Date], [Branch_End_Date], [Branch_Remarks], [Status]) VALUES (26, 2, N'Mechanical', NULL, 4, CAST(0x733B0B00 AS Date), CAST(0x733B0B00 AS Date), NULL, N'0         ')
SET IDENTITY_INSERT [dbo].[tbl_Branch] OFF
/****** Object:  StoredProcedure [dbo].[sp_validateProgram]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_validateProgram]
@programId int

as

begin
DECLARE @NoCategories int
 select @NoCategories=Program_T_Ctgys from tbl_Program where Program_id=@programId
 end
 
 begin
 DECLARE @CategoriesCount int
 Set @CategoriesCount=(select count(*) from tbl_Categories where Program_id=@programId)
 end
 
begin
if(@CategoriesCount=@NoCategories)
 update dbo.tbl_Program set Status=1 where Program_id=@programId
 
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_StudentCategorysList]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_StudentCategorysList](
@StudentID nvarchar(20),
@CategoryID nvarchar(20)
)

as
begin

select S.Schedule_ID,C.Category_Id,C.Category_Name,C.Category_Reg_Date,S.Schedule_srt_Date,S.Schedule_end_Date,S.Duration,
S.Status,S.Status_date,S.Remarks  from tbl_Categories C join tbl_Schedule S on S.Category_Id=C.Category_Id 
where C.Category_Id=@CategoryID and S.Subject_Id=0 and Schedule_ID=
(select Schedule_ID from Details where UserID=@StudentID and CategoryID=@CategoryID)

end
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCategorys]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateCategorys](  
@Category_Id int,  
@Category_Reg_Date datetime,  
@Category_T_Group int,  
@Category_Status varchar(20),
@Category_Status_Date date,  
@Category_T_Eligible nvarchar(20),  
@Category_Remarks nvarchar(max)  
)  
as  
Begin  
update tbl_Categories set Category_Reg_Date=@Category_Reg_Date,Category_T_Group=@Category_T_Group,Category_Status=@Category_Status,  
Category_Status_Date=@Category_Status_Date,Category_T_Eligible=@Category_T_Eligible,Category_Remarks=@Category_Remarks where Category_Id=@Category_Id  
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_GetRegisteredUsers](@RoleName nvarchar(20))      
      
as      
begin      
      
if(@RoleName='Company')      
begin      
select * from CompanyDetails where ActiveStatus=0       
end      
      
else      
      
begin      
  
--select D.RoleName,D.FirstName+' '+D.LastName as Name,D.*,P.Program_name,C.Category_Name,L.UserId from dbo.tbl_Program P join Details D    
--on P.Program_id=D.ProgramId  join dbo.tbl_Categories C on C.Category_Id=D.CategoryId join dbo.LoginDetails L on L.DetailsID=D.DetailsID

select X.*,A.* from (select D.FirstName+' '+D.LastName as Name,D.*,C.Category_Name from Details D join tbl_Categories C 
on C.Category_Id=D.CategoryId where ActiveStatus=0 and D.RoleName=@RoleName) X join [Address] A on X.DetailsID=A.DetailsID 
where A.RoleName=@RoleName
 
  
end      
      
      
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentRegistrationCancel]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetStudentRegistrationCancel]
(
@CategoryID int)
as
begin

select X.*,A.* from (select D.FirstName+' '+D.LastName as Name,D.*,C.Category_Name from Details D join tbl_Categories C 
on C.Category_Id=D.CategoryId where ActiveStatus=-1 and D.RoleName='Student' and C.Category_Id=@CategoryID) X join [Address] A on X.DetailsID=A.DetailsID 
where A.RoleName='Student'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentRegisteredUsers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_GetStudentRegisteredUsers]
(
@CategoryID int)
as
begin

select X.*,A.* from (select D.FirstName+' '+D.LastName as Name,D.*,C.Category_Name from Details D join tbl_Categories C 
on C.Category_Id=D.CategoryId where ActiveStatus=0 and D.RoleName='Student' and C.Category_Id=@CategoryID) X join [Address] A on X.DetailsID=A.DetailsID 
where A.RoleName='Student'

end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCompanySessions]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertCompanySessions]
(
@Slot_ID int,
@Slot_Name nvarchar(50),
@CompanyID int,
@Sessions int)
as
begin

declare @val int=(select sum(Sessions) from tbl_companysBooking where Slot_ID=@Slot_ID and CompanyID=@CompanyID)
if(@val is not null)
begin
update tbl_companysBooking set Sessions=Sessions+@Sessions where Slot_ID=@Slot_ID and CompanyID=@CompanyID
end
else
begin
insert into tbl_companysBooking(Slot_ID,Slot_Name,CompanyID,Sessions) values(@Slot_ID,@Slot_Name,@CompanyID,@Sessions)
end

select * from tbl_companysBooking where Slot_ID=@Slot_ID and CompanyID=@CompanyID
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewCateGory]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertNewCateGory]  
@programId int,  
@CategoryName nvarchar(50),  
@ReDate DateTime,  
@Category_T_Group int,  
@Eligibility nvarchar(20),  
@StatusDate datetime,  
@Remarks nvarchar(50),  
@StartDAte date,  
@EndDAte date,  
@CategoryStatus nvarchar(20)  
as  
  
begin  
Declare @CAtegoryNameCount nvarchar(20),@Duration int  
set @Duration=(SELECT DATEDIFF(day,@StartDAte,@EndDAte))  
Set @CAtegoryNameCount=(select count(*) from tbl_Categories where Category_Name=@CategoryName and Program_id=@programId)  
if(@CAtegoryNameCount=0)  
  
insert into dbo.tbl_Categories (Program_id,Category_Name,Category_Reg_Date,Category_T_Group,Category_T_Eligible,Category_Status_Date,Category_Remarks,[Status],Category_Status,Category_Srt_Date,Category_End_Date,Category_Duration)  
 values(@programId,@CategoryName,@ReDate,@Category_T_Group,@Eligibility,@StatusDate,@Remarks,0,@CategoryStatus,@StartDAte,@EndDAte,@Duration)  
else  
select '0'  
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategoriesforStudent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetCategoriesforStudent]
@DetailsId  int,@RoleName nvarchar(20)
as
begin

select distinct pr.Program_name,ct.Category_Name,ct.Category_Reg_Date,ct.Category_End_Date,ct.Category_Remarks,sch.Schedule_srt_Date,sch.Duration,sch.Schedule_end_Date from dbo.tbl_Program pr join dbo.Details De on De.ProgramID=pr.Program_id
join
dbo.tbl_Categories ct on ct.Category_Id=De.CategoryID 
join
dbo.tbl_Schedule sch on sch.Category_Id=De.CategoryID 
where DetailsID=@DetailsId and RoleName=@RoleName

End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProgramInfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetAllProgramInfo]  
@ProgramId int  
as  
begin  
  
  
select * from dbo.tbl_Categories where Program_id=@ProgramId;  
  

  
End
GO
/****** Object:  StoredProcedure [dbo].[sp_faculty]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_faculty]
as
begin
select c.Category_Id,c.Category_Name,cd.CompanyName,cd.Location,cd.EmailID,cd.OfficePhoneNO,cd.FirstName,cd.ContactPersonEmailID,s.Start_Date,s.End_date,s.Duration,(select COUNT(Subject_ScheduleID) from tbl_Schedule where Subject_Id=3) as units,s.Status,cls.StartTime,cls.EndTime,cls.Hours,s.Remarks
from tbl_Categories c inner join CompanyDetails cd
on c.Program_id=cd.ProgramID
inner join tbl_Schedule s on s.Category_Id=c.Category_Id
inner join tbl_Class cls on cls.SubjectId=s.Subject_Id
where c.Category_Id=1
end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllUsers]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_GetAllUsers]
@RoleName varchar(10)
as
begin

select D.RoleName,D.FirstName+' '+D.LastName as Name,D.*,P.Program_name,C.Category_Name,L.UserId from dbo.tbl_Program P join Details D      
on P.Program_id=D.ProgramId  join dbo.tbl_Categories C on C.Category_Id=D.CategoryId join dbo.LoginDetails L on L.DetailsID=D.DetailsID  
     
 where ActiveStatus=1 and D.RoleName=@RoleName    
 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditCompanySessions]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_EditCompanySessions]
(
@Slot_ID int,
@Slot_Name nvarchar(50),
@CompanyID int,
@Sessions int)
as
begin

declare @val int=(select sum(Sessions) from tbl_companysBooking where Slot_ID=@Slot_ID and CompanyID=@CompanyID)
if(@val is not null)
begin
update tbl_companysBooking set Sessions=Sessions-@Sessions where Slot_ID=@Slot_ID and CompanyID=@CompanyID
end
else
begin
insert into tbl_companysBooking(Slot_ID,Slot_Name,CompanyID,Sessions) values(@Slot_ID,@Slot_Name,@CompanyID,@Sessions)
end

select B.*,C.CompanyName from CompanyDetails C join
  (select * from tbl_companysBooking where Slot_ID=@Slot_ID and CompanyID=@CompanyID)B on C.DetailsID=B.CompanyID
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DDLCategories]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_DDLCategories](@Program_id int)

as
Begin

select Category_Id,Category_Name from tbl_Categories where [Status] =1 and Program_id=@Program_id

end
GO
/****** Object:  StoredProcedure [dbo].[SP_ActiveUsers]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_ActiveUsers](@RoleName nvarchar(20))  
  
as   
begin  
  
--select D.FirstName+D.LastName as Name ,D.*,A.* from Details D ,[Address] A  
--where D.ActiveStatus=1 and D.ActivationDate= CONVERT(date, getdate()) and D.DetailsID=A.DetailsID and D.RoleName=A.RoleName and D.RoleName=@RoleName  
  
 
 -- select D.RoleName,D.FirstName+' '+D.LastName as Name,D.*,P.Program_name,C.Category_Name,L.UserId from dbo.tbl_Program P join Details D      
--on P.Program_id=D.ProgramId  join dbo.tbl_Categories C on C.Category_Id=D.CategoryId join dbo.LoginDetails L on L.DetailsID=D.DetailsID  
     
 --where ActiveStatus=1 and D.ActivationDate= CONVERT(date, getdate())and D.RoleName=@RoleName 
 
 
select X.*,Y.HouseNO,Y.Flat_UnitNo,Y.StreetNO,Y.StreetName,Y.CountryID,Y.StateID,Y.DistrictID,Y.Village_Town_City,Y.SubUrban_Area,
Y.PostalCode,Y.LandMarkName,Y.Location from    
(select D.FirstName+' '+D.LastName as Name,D.*,P.Program_name,C.Category_Name from dbo.tbl_Program P join Details D      
on P.Program_id=D.ProgramId  join dbo.tbl_Categories C on C.Category_Id=D.CategoryId join dbo.LoginDetails L on L.DetailsID=D.DetailsID      
where ActiveStatus=1 and D.ActivationDate= CONVERT(date, getdate())and D.RoleName=@RoleName )X join [Address] Y on
X.DetailsID=Y.DetailsID where Y.RoleName=@RoleName
  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ActiveStudents]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ActiveStudents]
(@CategoryID int)
as
begin

select X.*,Y.HouseNO,Y.Flat_UnitNo,Y.StreetNO,Y.StreetName,Y.CountryID,Y.StateID,Y.DistrictID,Y.Village_Town_City,Y.SubUrban_Area,
Y.PostalCode,Y.LandMarkName,Y.Location from    
(select D.FirstName+' '+D.LastName as Name,D.*,P.Program_name,C.Category_Name from dbo.tbl_Program P join Details D      
on P.Program_id=D.ProgramId  join dbo.tbl_Categories C on C.Category_Id=D.CategoryId join dbo.LoginDetails L on L.DetailsID=D.DetailsID      
where ActiveStatus=1 and D.RoleName='Student' and L.RoleName='Student' and D.CategoryID=@CategoryID )X join [Address] Y on
X.DetailsID=Y.DetailsID where Y.RoleName='Student'

end
GO
/****** Object:  StoredProcedure [dbo].[SP_AddContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddContent]

@Program_Id int,
@Category_Id int,
@Subject_Id int,
@grpId int,
@yearid int,
@Unit_Id int,
@ContSchId nvarchar(20),
@Content_Data nvarchar(MAX),
@Content_Type varchar(10),
@BrowsedFilePath nvarchar(Max),
@subschid nvarchar(30),
@constat nvarchar(30)

AS
BEGIN
 insert into dbo.tbl_Content(Program_Id,Category_Id,Subject_Id,Unit_Id,Content_Data,Content_AddDate,BrowsedFilePath,Content_Name,Group_ID,year_ID,CategorySchedul_ID,subjectSCHId,contentstatus,activestatus)values
 (@Program_Id,@Category_Id,@Subject_Id,@Unit_Id,@Content_Data,GETDATE(),@BrowsedFilePath,@Content_Type,@grpId,@yearid,@ContSchId,@subschid,@constat,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteContent]    Script Date: 06/24/2016 17:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_DeleteContent]
@programId int,@categoryId int,@subId int,@ContentType varchar(10)--@unitId int--
as
begin
delete from dbo.tbl_Content where Program_Id=@programId and Category_Id=@categoryId and Subject_Id=@subId --and Unit_Id=@unitId
and Content_Name=@ContentType
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertGroupData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertGroupData](
@Category_Id int ,
@Branch_Name nvarchar(50),
@Branch_T_Years int,
@Branch_Srt_Date date,
@Branch_End_Date date,
@Status nchar(10))

as
begin
Declare @GrouopnameCount as nvarchar(20)
Set @GrouopnameCount=(select count(*) from tbl_Branch where Branch_Name=@Branch_Name and Category_Id=@Category_Id)  
if(@GrouopnameCount=0)  
insert into tbl_Branch(Category_Id,Branch_Name,Branch_T_Years,Branch_Srt_Date,Branch_End_Date,[Status])values
(@Category_Id,@Branch_Name,@Branch_T_Years,@Branch_Srt_Date,@Branch_End_Date,@Status)
UPDATE tbl_Categories set Category_Branch=@Branch_Name where Category_Id=@Category_Id 
--select * from tbl_Branch where Branch_Id=@@identity
select '0'
end
GO
/****** Object:  StoredProcedure [dbo].[SP_getStudentPublishedUnits]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_getStudentPublishedUnits]
@Subject_Id int,
@Content_Name varchar(30),
@Student_Id int
AS
BEGIN
select TC.BrowsedFilePath from dbo.tbl_Content TC 
inner join tbl_StudentContent_Publish SP
on TC.Unit_Id=SP.UnitId
where 
TC.Subject_Id=@Subject_Id
and TC.Content_Name=@Content_Name 
and TC.BrowsedFilePath<>''
and SP.Publish_Status='Publish'
and SP.Student_Id=@Student_Id
group by TC.BrowsedFilePath
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetContent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetContent]

@Content_Name varchar(30),
@Student_Id int
AS
BEGIN
select BrowsedFilePath from dbo.tbl_Content where BrowsedFilePath is not null and BrowsedFilePath!='' and Subject_Id=@Student_Id and Content_Name=@Content_Name
Group by BrowsedFilePath


END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadContentData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LoadContentData]

AS
BEGIN
 Select Top 1 * from [tbl_Content] order by Content_Id Desc
END
GO
/****** Object:  Table [dbo].[tbl_Year]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Year](
	[Year_Id] [int] IDENTITY(1,1) NOT NULL,
	[Branch_Id] [int] NULL,
	[Branch_Year_No] [nvarchar](20) NULL,
	[Year_T_Subjects] [int] NULL,
	[Rem_Subjects] [int] NULL,
	[Year_Srt_Date] [date] NULL,
	[Year_End_Date] [date] NULL,
	[Year_Remarks] [nvarchar](max) NULL,
	[Year_Status] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_Year] PRIMARY KEY CLUSTERED 
(
	[Year_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Year] ON
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (9, 6, N'1-1', 3, 1, CAST(0x343A0B00 AS Date), CAST(0x343A0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (22, 13, N'1', 3, 0, CAST(0x6F3A0B00 AS Date), CAST(0x6F3A0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (23, 14, N'1', 2, 1, CAST(0x703A0B00 AS Date), CAST(0x703A0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (24, 14, N'1', 2, 2, CAST(0x703A0B00 AS Date), CAST(0x703A0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (25, 15, N'1', 2, 1, CAST(0x703A0B00 AS Date), CAST(0x703A0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (26, 6, N'3', 6, 6, CAST(0x433B0B00 AS Date), CAST(0x433B0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (28, 6, N'2', 4, 4, CAST(0x473B0B00 AS Date), CAST(0x473B0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (31, 20, N'1', 3, 0, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (32, 20, N'2', 3, 2, CAST(0x493B0B00 AS Date), CAST(0x493B0B00 AS Date), NULL, 1, 0)
INSERT [dbo].[tbl_Year] ([Year_Id], [Branch_Id], [Branch_Year_No], [Year_T_Subjects], [Rem_Subjects], [Year_Srt_Date], [Year_End_Date], [Year_Remarks], [Year_Status], [Status]) VALUES (33, 21, N'2', 3, 3, CAST(0x4A3B0B00 AS Date), CAST(0x4A3B0B00 AS Date), NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Year] OFF
/****** Object:  StoredProcedure [dbo].[sp_ProgramGroupddl]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProgramGroupddl]

as begin

select distinct(p.Program_id),p.Program_name from tbl_Program p join 

(select C.*,B.total from tbl_Categories C left outer join (select Category_Id,count(Category_Id) as total from tbl_Branch group by Category_Id) B
 on C.Category_Id=B.Category_Id where C.Category_T_Group>B.total or  total is null) as a
on p.Program_id=a.Program_id

end


--select C.*,B.total from tbl_Categories C left outer join (select Category_Id,count(Category_Id) as total from tbl_Branch group by Category_Id) B
-- on C.Category_Id=B.Category_Id where C.Category_T_Group>B.total or  total is null
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramYearddl]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProgramYearddl](
@Category_Id int)

as begin

select Y1.Branch_Id,Y1.Branch_Name from 
(select Branch_Id,count(Year_Id) as Total from tbl_Year  group by Branch_Id) X1 Right outer join tbl_Branch Y1 on
 X1.Branch_Id=Y1.Branch_Id where (Y1.Branch_T_Years>X1.Total or X1.Total is null ) and Y1.Category_Id=@Category_Id

end
GO
/****** Object:  View [dbo].[StudentResults]    Script Date: 06/24/2016 17:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[StudentResults]
as

select  count(Student_Id)as C,sum(Std_Correct_Ans) as Total ,Student_Id from tbl_Results where Std_Result!='f'  group by Student_Id 
having count(Student_Id)=(select Year_T_Subjects from tbl_Year where Year_Id=2)

---Select * from StudentResults
GO
/****** Object:  Table [dbo].[tbl_Subject]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Subject](
	[Subject_Id] [int] IDENTITY(1,1) NOT NULL,
	[Year_Id] [int] NULL,
	[Program_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[Category_Id] [int] NOT NULL,
	[Subject_Name] [nvarchar](50) NULL,
	[Subject_RegDate] [datetime] NULL,
	[Subject_T_Units] [int] NULL,
	[Rem_Units] [int] NULL,
	[Subject_Start_Date] [date] NULL,
	[Subject_End_Date] [date] NULL,
	[Subject_Duration] [nvarchar](20) NULL,
	[Subject_Status] [nvarchar](20) NULL,
	[Subject_Status_Date] [date] NULL,
	[Subject_Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Subject] PRIMARY KEY CLUSTERED 
(
	[Subject_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Subject] ON
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (18, 22, 25, 13, 27, N'Eng', CAST(0x0000A51500000000 AS DateTime), 2, 0, CAST(0x713A0B00 AS Date), CAST(0x7E3A0B00 AS Date), N'5', N'Started', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (19, 22, 25, 13, 27, N'CS', CAST(0x0000A51500000000 AS DateTime), 4, 0, CAST(0x703A0B00 AS Date), CAST(0x7E3A0B00 AS Date), N'5', N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (20, 22, 25, 13, 27, N'Java', CAST(0x0000A51500000000 AS DateTime), 2, 0, CAST(0x723A0B00 AS Date), CAST(0x7E3A0B00 AS Date), N'5', N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (21, 23, 26, 14, 28, N'zoo', CAST(0x0000A52400000000 AS DateTime), 5, 4, CAST(0x7F3A0B00 AS Date), CAST(0xEC3B0B00 AS Date), N'12', N'New', CAST(0x703A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (22, 25, 27, 15, 29, N'ww', CAST(0x0000A51600000000 AS DateTime), 5, 4, CAST(0x723A0B00 AS Date), CAST(0x9D3A0B00 AS Date), N'6', N'New', CAST(0x703A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (25, 9, 31, 6, 33, N'Physics', CAST(0x0000A5E800000000 AS DateTime), 5, 5, CAST(0x443B0B00 AS Date), CAST(0xB73B0B00 AS Date), N'100', N'New', CAST(0x433B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (30, 31, 31, 20, 33, N'chemistry', CAST(0x0000A5EF00000000 AS DateTime), 5, 0, CAST(0x533B0B00 AS Date), CAST(0xAE3B0B00 AS Date), N'90', N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (31, 31, 31, 20, 33, N'Botany', CAST(0x0000A5EE00000000 AS DateTime), 4, 4, CAST(0x533B0B00 AS Date), CAST(0xAE3B0B00 AS Date), N'90', N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (32, 31, 31, 20, 33, N'Zoology', CAST(0x0000A5EE00000000 AS DateTime), 3, 3, CAST(0x533B0B00 AS Date), CAST(0xAE3B0B00 AS Date), N'90', N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Subject] ([Subject_Id], [Year_Id], [Program_Id], [Branch_Id], [Category_Id], [Subject_Name], [Subject_RegDate], [Subject_T_Units], [Rem_Units], [Subject_Start_Date], [Subject_End_Date], [Subject_Duration], [Subject_Status], [Subject_Status_Date], [Subject_Remarks]) VALUES (33, 32, 31, 20, 33, N'Botany', CAST(0x0000A5F400000000 AS DateTime), 3, 3, CAST(0x503B0B00 AS Date), CAST(0x8A3B0B00 AS Date), N'60', N'New', CAST(0x4E3B0B00 AS Date), N'Good')
SET IDENTITY_INSERT [dbo].[tbl_Subject] OFF
/****** Object:  StoredProcedure [dbo].[sp_insertYearData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_insertYearData](
@Branch_Id int,
@Branch_Year_No nvarchar(20),
@Year_T_Subjects int,
@Year_Srt_Date date,
@Year_End_Date date,
@Year_Status int)

as
begin
insert into tbl_Year(Branch_Id,Branch_Year_No,Year_T_Subjects,Rem_Subjects,Year_Srt_Date,Year_End_Date,Year_Status) values
(@Branch_Id,@Branch_Year_No,@Year_T_Subjects,@Year_T_Subjects,@Year_Srt_Date,@Year_End_Date,@Year_Status)

select * from tbl_Year where Year_Id=@@identity
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllSubjects]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetAllSubjects]
@DetailsId  int,@RoleName nvarchar(20)
as
begin
select ct.Category_Name,sb.Subject_Name,sb.Subject_RegDate,sb.Subject_End_Date,sb.Subject_Remarks,sc.Schedule_srt_Date,sc.Schedule_end_Date,sc.Duration from tbl_Subject sb join Details de on sb.Category_Id=de.CategoryID
join dbo.tbl_Categories ct on ct.Category_Id=de.CategoryID join dbo.tbl_Schedule sc on sc.Subject_Id=sb.Subject_Id where DetailsID=@DetailsId and RoleName=@RoleName
end
GO
/****** Object:  StoredProcedure [dbo].[SP_FacultyRegisterToSubject]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_FacultyRegisterToSubject]
@getDropdownChecksList varchar(50)

AS
BEGIN


select tc.Category_Name+'-'+ts.Subject_Name as Subject_Name,ts.Subject_Id from dbo.tbl_Subject ts 
join dbo.tbl_Categories tc
on ts.Category_Id=tc.Category_Id
where ts.Category_Id in(select value from fn_Split(@getDropdownChecksList,','))

END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCategoryWithSubjectsdata]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getCategoryWithSubjectsdata]
@subjectId int
as
begin
--select * from dbo.tbl_Categories  where Subject_Id=@subjectId
select * from dbo.tbl_Subject where Subject_Id=@subjectId
select * from dbo.tbl_Categories  where Category_Id=(select Category_Id from dbo.tbl_Subject where Subject_Id=@subjectId)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getcategorySubjectsdata]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getcategorySubjectsdata]
@subjectId int
as
begin
select * from dbo.tbl_Categories C join dbo.tbl_Subject S on S.Category_Id=C.Category_Id where Subject_Id=@subjectId
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCompanyTrainingStudents]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE [OLS_Db]
--GO
--/****** Object:  StoredProcedure [dbo].[sp_GetStudentsForSchedule]    Script Date: 10/27/2015 15:48:46 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO



CREATE proc [dbo].[sp_GetCompanyTrainingStudents]
(
@CompanyID nvarchar(50),
@Subject_Id int

)
as
begin


select X.Assigned_Date,X.Duration,X.[Status],X.Status_date,X.Faculty,X.ClassType,Y.* from

(select DetailsID,UserID,
Convert(nvarchar(50),DetailsID)+' : '+ CONVERT(nvarchar(50), FirstName+' '+LastName) as studIdname,
Father_GaurdainName,DateOfBirth,MobileNumber,EmailID,Schedule_ID from Details where DetailsID in(
select Student_Id from tbl_StudentRegPrograms where CompanyID=@CompanyID and  BranchID=
(select Branch_Id from tbl_Year where Year_Id=
(select Year_Id from tbl_Subject where Subject_Id=@Subject_Id)))) Y
join

(select X.Schedule_ID,X.Assigned_Date,X.Duration,X.[Status],X.Status_date,Y.Faculty,Y.ClassType from tbl_Schedule X join(
select distinct SubjectId, ScheduleId,ClassType ,StartTime, EndTime,[Hours], Faculty from tbl_Class 
where SubjectId = @Subject_Id And ScheduleId in (
select distinct ScheduleId from dbo.tbl_Class where SubjectId = @Subject_Id)) Y 
on X.Subject_ScheduleID=Y.ScheduleId  where X.Subject_Id=@Subject_Id and X.[Status]='Completed') X
on X.Schedule_ID=Y.Schedule_ID order by  DetailsID desc

end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetEnquiryFormDetailsBySubject]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetEnquiryFormDetailsBySubject]
@getSubjectId int
AS
BEGIN
	SELECT
      'Form'+cast(TE.[E_FormId] as Varchar) as E_FormId
      ,TE.[E_FirstName]
      ,TE.[E_LastName]
      ,TE.[E_MobileNumber]
      ,TE.[E_LandLine]
      ,TE.[E_Email]
      ,TE.[E_AltEmail]
      ,TE.[E_Qulification]
      ,TE.[E_Technicalskills]
      ,TE.[E_DoB]
      ,TE.[E_FatherName]
      ,TE.[E_FlatNo_UnitNo]
      ,TE.[E_HNo_DNo_PNo]+'/'+TE.[E_StreetNo]+'/'+TE.[E_StreetName] as AddressName
    
     
      ,TE.[E_Mandal_Taluk_SubUrb]
      ,TE.[E_CountryId]
      ,TE.[E_StateId]
      ,TE.[E_DistrictId]
      ,TE.[E_Village_Town_City]
      ,TE.[E_Pincode]
      ,TE.[E_ProgramId]
      ,TC.Category_Name	
      ,TS.Subject_Name
      ,TE.[E_TitleInfo]
      ,(CASE
  WHEN TE.[E_Status] = 0 THEN 'New'
  ELSE 'Replied'
END) as E_Status
      ,TE.[E_StatusDate]
      ,TE.[E_Remarks]
      ,TE.[E_EnquiryDate] 
      from tbl_Enquiry TE 
      inner join
      tbl_Categories TC
      on TE.E_CategoryId=TC.Category_Id
      inner join
      tbl_Subject TS
      on TE.E_SubjectId=TS.Subject_Id
      where TE.E_SubjectId=@getSubjectId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Realtestinfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Realtestinfo]
	@studentRTbookingID as int,
	@studentloginid as nvarchar(50)
AS
BEGIN
	select sb.S_No as rtid,
(select CONVERT(nvarchar(Max),DetailsID)+':'+FirstName+' '+LastName from Details where DetailsID=sb.Student_Id and RoleName='Student')as studentname,
(select Convert(nvarchar(50),CompanyId)+' : '+Convert(nvarchar(50),CompanyName) from CompanyDetails where CompanyId=sb.CompanyID)as companyame,
 s.Category_Id,  
(select Convert(nvarchar(50),s.Category_Id)+' : '+Convert(nvarchar(50),Category_Name) from tbl_Categories where Category_Id= s.Category_Id)as categoryname,
(select Convert(nvarchar(50),s.Subject_Id)+' : '+Convert(nvarchar(50),s.Subject_Name) from tbl_Subject where Subject_Id=sb.Subject_Id)as subjname,
sb.S_No as rtbookingid,
convert(NVARCHAR, sb.BookingDate, 105) as bookingdate,
Convert(nvarchar(50),Slot_ID)+' : '+Convert(nvarchar(50),BookingSession)+' : '+Convert(nvarchar(50),RIGHT(CONVERT(VARCHAR, BookingTime, 100),7)) as bkgIDslotsession,
convert(NVARCHAR, sb.StatusDate, 105) as statusdate,sb.[Status]
 from tbl_StudentBookings sb,tbl_Subject s where s.Subject_Id=sb.Subject_Id and sb.S_No=@studentRTbookingID and sb.UserID=@studentloginid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Realtestcommenceinfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Realtestcommenceinfo]
	@studentid as int,
	@studentRTbookingID as int
AS
BEGIN
select sb.S_No as rtid,
(select CONVERT(nvarchar(Max),DetailsID)+':'+FirstName+' '+LastName from Details where DetailsID=sb.Student_Id and RoleName='Student')as studentname,
(select Convert(nvarchar(50),CompanyId)+' : '+Convert(nvarchar(50),CompanyName) from CompanyDetails where CompanyId=sb.CompanyID)as companyame,
 s.Category_Id,  
(select Convert(nvarchar(50),s.Category_Id)+' : '+Convert(nvarchar(50),Category_Name) from tbl_Categories where Category_Id= s.Category_Id)as categoryname,
(select Convert(nvarchar(50),s.Subject_Id)+' : '+Convert(nvarchar(50),s.Subject_Name) from tbl_Subject where Subject_Id=sb.Subject_Id)as subjname,
sb.S_No as rtbookingid,
convert(NVARCHAR, sb.BookingDate, 105) as bookingdate,
Convert(nvarchar(50),Slot_ID)+' : '+Convert(nvarchar(50),BookingSession)+' : '+Convert(nvarchar(50),RIGHT(CONVERT(VARCHAR, BookingTime, 100),7)) as bkgIDslotsession,
convert(NVARCHAR, sb.StatusDate, 105) as statusdate,sb.[Status]
 from tbl_StudentBookings sb,tbl_Subject s where s.Subject_Id=sb.Subject_Id and sb.Student_Id=@studentid and sb.S_No=@studentRTbookingID
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetRtdata]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetRtdata]
@studentid as int,
@subjectid as int
AS
BEGIN
	select s.Student_Id,s.BookingDate,s.BookingSession,
(select a.Slot_Name from tbl_AdminBookingSlot a where a.Slot_ID=s.Slot_ID) as Slotname ,
(select b.Subject_Name from tbl_Subject b where b.Subject_Id=s.Subject_Id) as Subjectname,
(select d.FirstName+' '+d.LastName from Details d where d.DetailsID=s.Student_Id) as StudentName,
(select Category_Name from tbl_Categories c where c.Category_Id=r.Category_Id)as Categoryname,r.BookingID,
s.S_No,r.[Status],r.StatusDate,s.CompanyID,s.BookingTime,s.[Status],s.StatusDate
 from tbl_Results r,tbl_StudentBookings s where s.Student_Id=@studentid and r.Student_Id=@studentid and
  s.Subject_Id= @subjectid and r.Subject_Id=@subjectid
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_Getrtbookingdata]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Sp_Getrtbookingdata]
@studentId as int
AS
BEGIN
	select s.S_No,s.Subject_Id,s.Slot_ID,s.BookingDate,s.BookingSession,
s.BookingTime,s.[Status],s.StatusDate,ss.UserID,
(select FirstName+' '+LastName from Details where DetailsID=ss.Student_Id)as studentname,
(select Convert(nvarchar(50),b.Subject_Id)+' - '+Convert(nvarchar(50),b.Subject_Name)from tbl_Subject b where
 b.Subject_Id=ss.Subject_Id) as subjectname,
 (select Convert(nvarchar(50),a.Slot_ID)+' - '+Convert(nvarchar(50),a.Slot_Name) from tbl_AdminBookingSlot a where
 a.Slot_ID=s.Slot_ID) as slotname,s.Newbooking_date,s.Newbooking_Time,s.NewBK_Slot,s.NewBK_Session
 from tbl_StudentBookings s, tbl_StudentSubjects_Publish ss where ss.Subject_Id=s.Subject_Id and ss.Student_Id=@studentId
 and s.Student_Id=@studentId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GEtRolesforPublish]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GEtRolesforPublish]
@Role varchar(10),@item int
as
begin
if(@Role='Student')

if(@item=2)  --Category
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
join dbo.Student_Publish sp on sp.Student_Id=D.DetailsId
where RoleName=@Role and sp.Category_Id=0
--------------------------------------------------
else if(@item=1)--Program
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Program P on D.ProgramID=P.Program_id 
join dbo.Student_Publish sp on sp.Student_Id=D.DetailsId
where RoleName='Student' and sp.Program_id=0

else if(@item=3)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
join dbo.tbl_Subject S on S.Subject_Id=D.SubjectID
join dbo.Student_Publish sp on sp.Student_Id=D.DetailsId
where RoleName='Student' and sp.Subjects_Publish=0

else if(@item=4)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
join dbo.tbl_Subject S on S.Subject_Id=D.SubjectID
where RoleName=@Role


else if(@Role='Faculty')

if(@item=2)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
where RoleName=@Role
else if(@item=1)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Program P on D.ProgramID=P.Program_id 
where RoleName=@Role
else if(@item=3)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
join dbo.tbl_Subject S on S.Subject_Id=D.SubjectID
where RoleName=@Role
else if(@item=3)
select D.DetailsId,D.FirstName+' '+D.LastName as Name from Details D join dbo.tbl_Categories C on D.CategoryID=C.Category_Id 
join dbo.tbl_Subject S on S.Subject_Id=D.SubjectID
where RoleName=@Role

End
GO
/****** Object:  StoredProcedure [dbo].[SP_getFormDetailsByFormId]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_getFormDetailsByFormId]
@getFormId int
AS
BEGIN
	SELECT
      'Form'+cast(TE.[E_FormId] as Varchar) as E_FormId
      ,TE.[E_FirstName]
      ,TE.[E_LastName]
      ,TE.[E_MobileNumber]
      ,TE.[E_LandLine]
      ,TE.[E_Email]
      ,TE.[E_AltEmail]
      ,TE.[E_Qulification]
      ,TE.[E_Technicalskills]
      ,TE.[E_DoB]
      ,TE.[E_FatherName]
      ,TE.[E_FlatNo_UnitNo]
      ,TE.[E_HNo_DNo_PNo]
      ,TE.[E_StreetNo]
      ,TE.[E_StreetName]
      ,TE.[E_Mandal_Taluk_SubUrb]
      ,TE.[E_CountryId]
      ,TE.[E_StateId]
      ,TE.[E_DistrictId]
      ,TE.[E_Village_Town_City]
      ,TE.[E_Pincode]
      ,TE.[E_ProgramId]
      ,TC.Category_Name
      ,TS.Subject_Name
      ,TE.[E_TitleInfo]
      ,(CASE
  WHEN TE.[E_Status] = 0 THEN 'New'
  ELSE 'Replied'
END) as E_Status
      ,TE.[E_StatusDate]
      ,TE.[E_Remarks]
      ,TE.[E_EnquiryDate] 
     
      from tbl_Enquiry TE 
      inner join
      tbl_Categories TC
      on TE.E_CategoryId=TC.Category_Id
      inner join tbl_Subject TS
      on TE.E_SubjectId=TS.Subject_Id

      where TE.E_FormId=@getFormId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsForSchedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetStudentsForSchedule]
(
@CompanyID nvarchar(50),
@Subject_Id int)
as
begin

select DetailsID, UserID,Convert(nvarchar(50),DetailsID)+' : '+ CONVERT(nvarchar(50), FirstName+' '+LastName) as studIdname,Father_GaurdainName,DateOfBirth,MobileNumber,EmailID,Schedule_ID,StatusDate,[Status] from Details where DetailsID in(
select Student_Id from tbl_StudentRegPrograms where CompanyID=@CompanyID and  BranchID=
(select Branch_Id from tbl_Year where Year_Id=
(select Year_Id from tbl_Subject where Subject_Id=@Subject_Id))) order by DetailsID desc 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectbasedoncmpletedSCHForStudent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetSubjectbasedoncmpletedSCHForStudent]
(
@CategoryID int,
@UserID nvarchar(50)
)
as
begin


declare @SCHID nvarchar(50)=(select Schedule_ID from Details where UserID=@UserID and CategoryID=@CategoryID)

select Subject_Id,Subject_Name from tbl_Subject where Subject_Id in
(select Subject_Id from tbl_Schedule where Schedule_end_Date<getdate() and Schedule_ID=@SCHID and Subject_Id!=0 
and Subject_Id not in(select Subject_Id from tbl_Results where Test_Type='Realtest' and UserID=@UserID))

end
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateSubjects]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_UpdateSubjects](
@Subject_Id int,
@Subject_RegDate datetime,
@Subject_T_Units int,
@Subject_Status nvarchar(20),
@Subject_Status_Date date,
@Subject_Remarks nvarchar(Max)
)

as 
begin
Update tbl_Subject set Subject_RegDate=@Subject_RegDate,Subject_T_Units=@Subject_T_Units,
Subject_Status=@Subject_Status,Subject_Status_Date=@Subject_Status_Date,Subject_Remarks=@Subject_Remarks 
where Subject_Id=@Subject_Id

end
GO
/****** Object:  View [dbo].[temp]    Script Date: 06/24/2016 17:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[temp] as Select * from StudentResults
GO
/****** Object:  Table [dbo].[tbl_Units]    Script Date: 06/24/2016 17:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Units](
	[Unit_Id] [int] IDENTITY(1,1) NOT NULL,
	[Program_id] [int] NOT NULL,
	[Subject_Id] [int] NOT NULL,
	[Category_Id] [int] NULL,
	[Unit_Name] [nvarchar](100) NULL,
	[Section_No] [nvarchar](50) NULL,
	[Section_Name] [nvarchar](100) NULL,
	[Topics_List] [nvarchar](max) NULL,
	[Unit_Reg_Date] [datetime] NULL,
	[Unit_Status] [nvarchar](20) NULL,
	[Unite_Status_Date] [date] NULL,
	[Unit_Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Units] PRIMARY KEY CLUSTERED 
(
	[Unit_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Units] ON
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (19, 25, 18, 27, N'Lesson-1', NULL, N'Eng-Lesson', N'List-1
List-2
List-3
List-4', CAST(0x0000A51600000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (20, 25, 18, 27, N'Eng-2', NULL, N'Eng-Lesson2', N'List-1 List-2 List-3 List-4', CAST(0x0000A51500000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (21, 25, 19, 27, N'CS-1', NULL, N'CS-Lesson1', N'List-1 List-2 List-3 List-4', CAST(0x0000A51400000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (22, 25, 19, 27, N'CS-2', NULL, N'CS-Lesson2', N'List-1 List-2 List-3 List-4', CAST(0x0000A51600000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (23, 25, 19, 27, N'CS-3', NULL, N'CS-Lesson3', N'List-1 List-2 List-3 List-4', CAST(0x0000A51500000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (24, 25, 19, 27, N'CS-4', NULL, N'CS-Lesson4', N'List-1 List-2 List-3 List-4', CAST(0x0000A51500000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (25, 25, 20, 27, N'Java-1', NULL, N'Java-Lesson1', N'List-1 List-2 List-3 List-4', CAST(0x0000A51500000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (26, 25, 20, 27, N'Java-2', NULL, N'Java-Lesson2', N'List-1 List-2 List-3 List-4', CAST(0x0000A51500000000 AS DateTime), N'New', CAST(0x6F3A0B00 AS Date), N'Start')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (27, 26, 21, 28, N'Zoo1', NULL, N'23', N'dsgfdhfxb', CAST(0x0000A52400000000 AS DateTime), N'New', CAST(0x703A0B00 AS Date), N'GOOD')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (28, 27, 22, 29, N'Sec-1', NULL, N'1-Intro', N'dfgadgagdafg', CAST(0x0000A52400000000 AS DateTime), N'New', CAST(0x703A0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (30, 31, 30, 33, N'atomic struture', NULL, N'A:X', N'retrytr  rtyry  rtg  rtyrtu  rtyrt  rty ', CAST(0x0000A5EF00000000 AS DateTime), N'Started', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (31, 31, 30, 33, N'Acids', NULL, N'A;Y', N'ettre
eger
fdgh
fgrfgr
fgf
fgrf', CAST(0x0000A5EF00000000 AS DateTime), N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (32, 31, 30, 33, N'Boyles law', NULL, N'A', N'wfedg
dsfdg
dsfdg
dfgdg
dg
dfg
', CAST(0x0000A5EF00000000 AS DateTime), N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (33, 31, 30, 33, N'Newtons law', NULL, N'x', N'wet4etre
rr
r
retrre
reter
erter
', CAST(0x0000A5EF00000000 AS DateTime), N'New', CAST(0x493B0B00 AS Date), N'Good')
INSERT [dbo].[tbl_Units] ([Unit_Id], [Program_id], [Subject_Id], [Category_Id], [Unit_Name], [Section_No], [Section_Name], [Topics_List], [Unit_Reg_Date], [Unit_Status], [Unite_Status_Date], [Unit_Remarks]) VALUES (34, 31, 30, 33, N'Bore''s law', NULL, N'Z', N'dfgrfht
htgh
hgrfh
rttry
', CAST(0x0000A5EF00000000 AS DateTime), N'New', CAST(0x493B0B00 AS Date), N'Good')
SET IDENTITY_INSERT [dbo].[tbl_Units] OFF
/****** Object:  StoredProcedure [dbo].[sp_validateCategory]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[sp_validateCategory]
@CategoryId int

as

begin
DECLARE @NoOfSubjects int
 select @NoOfSubjects=Category_T_Subjects from dbo.tbl_Categories where Category_Id=@CategoryId
 end
 
 begin
 DECLARE @SubjectsCount int
 Set @SubjectsCount=(select count(*) from dbo.tbl_Subject where Category_Id=@CategoryId)
 end
 
begin
if(@SubjectsCount=@NoOfSubjects)
 update dbo.tbl_Categories set [Status]=1 where Category_Id=@CategoryId
 
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramSubject]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProgramSubject](
@Branch_Id int)
as
begin


--select Year_Id,Branch_Year_No from tbl_Year where Rem_Subjects>0 and Branch_Id=@Branch_Id



--select Y.Year_Id,Y.Branch_Year_No from tbl_Year Y left outer join 
--(select Year_Id,count(Year_Id) as Total from tbl_Subject group by Year_Id)S on S.Year_Id=Y.Year_Id
--where Y.Branch_Id=11 and Total<Y.Year_T_Subjects

select Y.Year_Id,Y.Branch_Year_No,S.Total from tbl_Year Y left outer join (select Year_Id,count(Year_Id) as Total from tbl_Subject group by Year_Id)S
on S.Year_Id=Y.Year_Id where (Y.Year_T_Subjects>S.Total or S.Total is null) and Y.Branch_Id=@Branch_Id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewSubject]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertNewSubject]
@Year_Id int,
@Branch_Id int,
@Category_Id int,
@Program_Id int,
@Subject_Name nvarchar(50),
@Subject_RegDate datetime,
@Subject_T_Units int,
@Subject_Start_Date date,
@Subject_End_Date date,
@Subject_Duration nvarchar(20),
@Subject_Status nvarchar(20),
@Subject_Status_Date nvarchar(20),
@Subject_Remarks nvarchar(max)

as
begin


Declare @SubjectCount nvarchar(4)

Set @SubjectCount=(select count(*) from tbl_Subject where Subject_Name=@Subject_Name and Category_Id=@Category_Id and Program_id=Program_id and Year_Id=@Year_Id)
if(@SubjectCount=0)
begin

insert into dbo.tbl_Subject (Year_Id,Branch_Id,Category_Id,Program_Id,Subject_Name,Subject_RegDate,Subject_T_Units,
Rem_Units,Subject_Start_Date,Subject_End_Date,Subject_Duration,Subject_Status,Subject_Status_Date,Subject_Remarks)
values(@Year_Id,@Branch_Id,@Category_Id,@Program_Id,@Subject_Name,@Subject_RegDate,@Subject_T_Units,@Subject_T_Units,@Subject_Start_Date,
@Subject_End_Date,@Subject_Duration,@Subject_Status,@Subject_Status_Date,@Subject_Remarks)

update tbl_Year set Rem_Subjects=Rem_Subjects-1 where Year_Id=@Year_Id --to decrease count of remaining subjects
end
else
begin
		select '0'
		end
 end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSubjectScheduleDetails]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetSubjectScheduleDetails]
(
@UserID nvarchar(20),
@SubjectID int,
@CategoryID int
)
as
begin
select top(1) Y.*,Z.Faculty,Z.ClassType from 

(select  distinct SubjectId,ClassType,ScheduleId, Faculty from dbo.tbl_Class
where SubjectId = @SubjectID And ScheduleId in (select distinct ScheduleId from dbo.tbl_Class
where SubjectId = @SubjectID)) Z join

(
select Schedule_ID,Subject_ScheduleID,S.Schedule_srt_Date,S.Schedule_end_Date,S.Status,S.Status_date,S.Remarks,S.Duration,X.* from tbl_Schedule S 
join tbl_Subject X  on X.Subject_Id=S.Subject_Id where S.Subject_Id=@SubjectID and 
Schedule_ID=(select Schedule_ID from Details where UserID=@UserID and CategoryID=@CategoryID)) Y

on Y.Subject_ScheduleID=Z.ScheduleId

end
GO
/****** Object:  StoredProcedure [dbo].[sp_updateUnits]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_updateUnits](
@Unit_Id int,
@Section_Name nvarchar(100),
@Topics_List nvarchar(max),
@Unit_Reg_Date datetime,
@Unit_Status int,
@Unite_Status_Date date,
@Unit_Remarks nvarchar(max))

as
begin

update tbl_Units set Section_Name=@Section_Name,Topics_List=@Topics_List,Unit_Reg_Date=@Unit_Reg_Date,
Unit_Status=@Unit_Status,Unite_Status_Date=@Unite_Status_Date,Unit_Remarks=@Unit_Remarks where Unit_Id=@Unit_Id

select * from tbl_Units where Unit_Id=@Unit_Id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ProgramUnit]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_ProgramUnit](
@Year_Id int)
as
begin


--select Subject_Id,Subject_Name from tbl_Subject where Rem_Units>0 and Year_Id=@Year_Id

--select S.Subject_Id,S.Subject_Name from tbl_Subject S join
--(select Subject_Id,count(Subject_Id) as Total from tbl_Units group by Subject_Id) U on S.Subject_Id=U.Subject_Id
--where S.Subject_T_Units>U.Total and S.Category_Id=@Category_Id

select S.Subject_Id,S.Subject_Name,U.Total from tbl_Subject S left outer join (select Subject_Id,count(Subject_Id) as Total from tbl_Units group by Subject_Id) U
on S.Subject_Id=U.Subject_Id where (S.Subject_T_Units>U.Total or U.Total is Null) and S.Year_Id=@Year_Id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertNewUnit]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_InsertNewUnit](  
@Program_id int,  
@Subject_Id int,  
@Category_Id int,  
@Unit_Name nvarchar(100),  
@Section_Name nvarchar(100),  
@Topics_List  nvarchar(max),  
@Unit_Reg_Date date,  
@Unit_Status nvarchar(20),  
@Unite_Status_Date date,  
@Unit_Remarks  nvarchar(max))  
  
as  
begin  
  
insert into tbl_Units(Program_id,Subject_Id,Category_Id,Unit_Name,Section_Name,  
Topics_List,Unit_Reg_Date,Unit_Status,Unite_Status_Date,Unit_Remarks) values(@Program_id,@Subject_Id,@Category_Id,  
@Unit_Name,@Section_Name,@Topics_List,@Unit_Reg_Date,@Unit_Status,@Unite_Status_Date,@Unit_Remarks)

update tbl_Subject set Rem_Units=Rem_Units-1 where Subject_Id=@Subject_Id  
  
  
  
  
select * from tbl_Units where Unit_Id=@@identity  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetStudentsUnitsBySchedule]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetStudentsUnitsBySchedule]
(
@Schedule_ID nvarchar(50),
@Student_Id nvarchar(20),
@Subject_Id int
) 
as
begin 

select (select Convert(nvarchar(50),U.Unit_Id)+' - '+Convert(nvarchar(50),U.Unit_Name))as unitname
,(select Convert(nvarchar(50),U.Unit_Id)+' - '+Convert(nvarchar(50),U.Section_Name))as sectionname
,U.Topics_List,X.* from tbl_Units U join (
select UnitID,ClassType,startdate,Enddate,StartTime,EndTime,status,StatusDate,Remarks from tbl_Class where ScheduleID=(
select Subject_ScheduleID from tbl_Schedule where Schedule_ID=@Schedule_ID and Subject_Id=@Subject_Id) and 
UnitID in( select Unit_Id from tbl_StudentUnits_Publish where UserID=@Student_Id and Unit_Id in(
select Unit_Id from tbl_Units where Subject_Id=@Subject_Id)))X on X.UnitID=U.Unit_Id

End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUnitsScheduleBySubjectsStudent]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetUnitsScheduleBySubjectsStudent]
(
@Schedule_ID nvarchar(50),
@StudentID nvarchar(50),
@subjectID int
) 
as
begin 

declare @Company_BranchID nvarchar(50)=(select Company_Branch from Details where UserID=@StudentID and Schedule_ID=@Schedule_ID)
declare @Schedule_Subject nvarchar(50)=(select Subject_ScheduleID from tbl_Schedule where Schedule_ID=@Schedule_ID and Subject_Id=@subjectID)

select U.Unit_Name,U.Section_Name,U.Topics_List,X.* from 
(select S.*,C.UnitID,C.ClassType,C.Remarks from tbl_CompanySubjectScheduleFaculty S join tbl_Class C on C.ClassId=S.ClassID 
where S.Company_BranchID=@Company_BranchID and S.ScheduleID=@Schedule_Subject)X
join tbl_Units U on X.UnitID=U.Unit_Id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUnitsScheduleBySubjects]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GetUnitsScheduleBySubjects]
(
@Schedule_ID nvarchar(50),
@Company_BranchID nvarchar(50)
) 
as
begin 

select (select Convert(nvarchar(50),U.Unit_Id)+' - '+Convert(nvarchar(50),U.Unit_Name))as unitname,
(select Convert(nvarchar(50),U.Unit_Id)+' - '+Convert(nvarchar(50),U.Section_Name))as sectionname,
U.Section_Name,U.Topics_List,X.* from tbl_Units U join  
(select S.*,C.UnitID,C.ClassType,C.Remarks from tbl_CompanySubjectScheduleFaculty S join tbl_Class C on C.ClassId=S.ClassID 
where S.Company_BranchID=@Company_BranchID and S.ScheduleID=@Schedule_ID)X
on X.UnitID=U.Unit_Id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSelectedUnitsData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetSelectedUnitsData]  
@UnitId int ,@subjectId int 
as  
begin  

select * from dbo.tbl_Categories C join dbo.tbl_Subject S on S.Category_Id=C.Category_Id
join dbo.tbl_Units U on U.Subject_Id=S.Subject_Id

 where S.Subject_Id=@subjectId  and U.Unit_Id=@UnitId
 
End
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSelectedCat_Sub_UnitsData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSelectedCat_Sub_UnitsData] 
	@UnitId int ,@subjectId int 
as  
begin  


 
 select * from dbo.tbl_Subject where Subject_Id=@subjectId
select * from dbo.tbl_Categories  where Category_Id=(select Category_Id from dbo.tbl_Subject where Subject_Id=@subjectId)
select * from tbl_Units where Subject_Id=@subjectId

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetData]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_GetData]
@value varchar(5)
as
begin
if(@value='1')
select * from dbo.tbl_Program
else if(@value='2')
select * from dbo.tbl_Categories
else if(@value='3')
select * from dbo.tbl_Subject
else if(@value='4')
select * from dbo.tbl_Units
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetContentInfo]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetContentInfo]
  @ProgramId int,@CategoryId int,@SubjectId int,@unitId int,@ContentName varchar(10)
  as
  begin
  select C.Content_AddDate, P.Program_name,Ca.Category_Name,S.Subject_Name,C.BrowsedFilePath,U.Unit_Name from dbo.tbl_Program P join dbo.tbl_Content C on P.Program_id=C.Program_id
  join dbo.tbl_Categories Ca on Ca.Category_Id=C.Category_Id
  join dbo.tbl_Subject S on S.Subject_Id=C.Subject_Id join dbo.tbl_Units U on U.Unit_Id=C.Unit_Id
  where Content_Name=@ContentName and C.Program_id=@ProgramId and C.Category_Id=@CategoryId and C.Subject_Id=@SubjectId and C.Unit_Id=@unitId 
  end
GO
/****** Object:  StoredProcedure [dbo].[SP_getCategoryByStudentDetailsId]    Script Date: 06/24/2016 17:50:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_getCategoryByStudentDetailsId]
@Subject_Id nvarchar(30)
AS
BEGIN
	select Unit_Name,Unit_Id from tbl_Units where Subject_Id=@Subject_Id
END
GO
/****** Object:  ForeignKey [FK_Address_Address]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Address]
GO
/****** Object:  ForeignKey [FK_CompanyDetails_CompanyDetails]    Script Date: 06/24/2016 17:50:08 ******/
ALTER TABLE [dbo].[CompanyDetails]  WITH CHECK ADD  CONSTRAINT [FK_CompanyDetails_CompanyDetails] FOREIGN KEY([DetailsID])
REFERENCES [dbo].[CompanyDetails] ([DetailsID])
GO
ALTER TABLE [dbo].[CompanyDetails] CHECK CONSTRAINT [FK_CompanyDetails_CompanyDetails]
GO
/****** Object:  ForeignKey [FK_tbl_Branch_tbl_Categories]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Branch]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Branch_tbl_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[tbl_Categories] ([Category_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Branch] CHECK CONSTRAINT [FK_tbl_Branch_tbl_Categories]
GO
/****** Object:  ForeignKey [FK_tbl_Categories_tbl_Program]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_Categories]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Categories_tbl_Program] FOREIGN KEY([Program_id])
REFERENCES [dbo].[tbl_Program] ([Program_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Categories] CHECK CONSTRAINT [FK_tbl_Categories_tbl_Program]
GO
/****** Object:  ForeignKey [FK_tbl_companysBooking_tbl_AdminBookingSlot]    Script Date: 06/24/2016 17:50:10 ******/
ALTER TABLE [dbo].[tbl_companysBooking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_companysBooking_tbl_AdminBookingSlot] FOREIGN KEY([Slot_ID])
REFERENCES [dbo].[tbl_AdminBookingSlot] ([Slot_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_companysBooking] CHECK CONSTRAINT [FK_tbl_companysBooking_tbl_AdminBookingSlot]
GO
/****** Object:  ForeignKey [FK_tbl_Content_tbl_Categories]    Script Date: 06/24/2016 17:50:11 ******/
ALTER TABLE [dbo].[tbl_Content]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Content_tbl_Categories] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[tbl_Categories] ([Category_Id])
GO
ALTER TABLE [dbo].[tbl_Content] CHECK CONSTRAINT [FK_tbl_Content_tbl_Categories]
GO
/****** Object:  ForeignKey [FK_tbl_Content_tbl_Program]    Script Date: 06/24/2016 17:50:11 ******/
ALTER TABLE [dbo].[tbl_Content]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Content_tbl_Program] FOREIGN KEY([Program_Id])
REFERENCES [dbo].[tbl_Program] ([Program_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Content] CHECK CONSTRAINT [FK_tbl_Content_tbl_Program]
GO
/****** Object:  ForeignKey [FK_tbl_Subject_tbl_Year]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Subject]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Subject_tbl_Year] FOREIGN KEY([Year_Id])
REFERENCES [dbo].[tbl_Year] ([Year_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Subject] CHECK CONSTRAINT [FK_tbl_Subject_tbl_Year]
GO
/****** Object:  ForeignKey [FK_tbl_Units_tbl_Subject]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Units]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Units_tbl_Subject] FOREIGN KEY([Subject_Id])
REFERENCES [dbo].[tbl_Subject] ([Subject_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Units] CHECK CONSTRAINT [FK_tbl_Units_tbl_Subject]
GO
/****** Object:  ForeignKey [FK_tbl_Year_tbl_Branch]    Script Date: 06/24/2016 17:50:13 ******/
ALTER TABLE [dbo].[tbl_Year]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Year_tbl_Branch] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[tbl_Branch] ([Branch_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Year] CHECK CONSTRAINT [FK_tbl_Year_tbl_Branch]
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 06/24/2016 17:50:14 ******/
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
