using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DAL;
using System.Data;

namespace BAL.BL
{
    public class publicPageContentData
    {
        public SqlDataReader saveAffilicationContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0]=new SqlParameter("@name",Name);
            p[1]=new SqlParameter("@content",Content);
            return ConnectionFactory.ExecuteCommand("SP_AddaffiliationContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader getAffiliationName(string Name)
        {
           SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);
            return ConnectionFactory.ExecuteCommand("Sp_CheckAffiliationName", CommandType.StoredProcedure, p);
        }
        public SqlDataReader saveConsultingContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@name", Name);
            p[1] = new SqlParameter("@content", Content);
            return ConnectionFactory.ExecuteCommand("SP_AddconsultingContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader getConstultingName(string Name)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);
            return ConnectionFactory.ExecuteCommand("SP_checkConsultingName", CommandType.StoredProcedure, p);
        }
        public SqlDataReader saveCareerContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@name", Name);
            p[1] = new SqlParameter("@content", Content);
            return ConnectionFactory.ExecuteCommand("SP_AddCareerContent", CommandType.StoredProcedure, p);
        }
        public SqlDataReader getCareerName(string Name)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);

            return ConnectionFactory.ExecuteCommand("SP_checkCareerName", CommandType.StoredProcedure, p);
        }

   
         public SqlDataReader saveProgramMethodContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@name", Name);
            p[1] = new SqlParameter("@content", Content);
            return ConnectionFactory.ExecuteCommand("SP_AddProgramMethodContent", CommandType.StoredProcedure, p);
        }
        public SqlDataReader getProgramMethodName(string Name)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);

            return ConnectionFactory.ExecuteCommand("SP_checkProgramMethodName", CommandType.StoredProcedure, p);
        }



         public SqlDataReader saveNewsContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@name", Name);
            p[1] = new SqlParameter("@content", Content);
            return ConnectionFactory.ExecuteCommand("SP_AddNewsContent", CommandType.StoredProcedure, p);
        }
        public SqlDataReader getNewsName(string Name)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);

            return ConnectionFactory.ExecuteCommand("SP_checkNewsName", CommandType.StoredProcedure, p);
        }

        public SqlDataReader saveEventContentToDatabase(string Name, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@name", Name);
            p[1] = new SqlParameter("@content", Content);
            return ConnectionFactory.ExecuteCommand("SP_AddEventContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader getEventName(string Name)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@name", Name);

            return ConnectionFactory.ExecuteCommand("SP_checkEventName", CommandType.StoredProcedure, p);
        }

        //DROPDOWN BINDING

        public SqlDataReader getEventsForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetEvent", CommandType.StoredProcedure);
        }
        public SqlDataReader getNewsForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetNews", CommandType.StoredProcedure);
        }
        public SqlDataReader getPrgMethodsForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetPrgMethod", CommandType.StoredProcedure);
        }
        public SqlDataReader getCareersForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetCareer", CommandType.StoredProcedure);
        }
        public SqlDataReader getConsultingsForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetConsulting", CommandType.StoredProcedure);
        }
        public SqlDataReader getAffiliationsForDropdown()
        {
            return ConnectionFactory.ExecuteCommand("SP_GetAffiliations", CommandType.StoredProcedure);
        }


        //GET CONTENT

        public SqlDataReader getAffiliationsContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadAffiliationData", CommandType.StoredProcedure, p);
        }

       

        public SqlDataReader getConsultingContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadConsultingData", CommandType.StoredProcedure, p);
        }

    
    

        public SqlDataReader getCareerContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadCareerData", CommandType.StoredProcedure, p);
        }

        
        public SqlDataReader getProgramMethodContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadProgramData", CommandType.StoredProcedure, p);
        }

       
        public SqlDataReader getNewsContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadNewsData", CommandType.StoredProcedure, p);
        }
    
        public SqlDataReader getEventContent(int ID)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ID", ID);
            return ConnectionFactory.ExecuteCommand("SP_LoadEventData", CommandType.StoredProcedure, p);
        }


        //UPDATE

        public SqlDataReader UpdateAffiliationsContent(int ID,string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdateAffiliationContent", CommandType.StoredProcedure, p);
        }



        public SqlDataReader UpdateConsultingContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdateConsultingContent", CommandType.StoredProcedure, p);
        }



        public SqlDataReader UpdateCareerContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdateCareerContent", CommandType.StoredProcedure, p);
        }


        public SqlDataReader UpdateProgramMethodContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdatePrgMethodContent", CommandType.StoredProcedure, p);
        }


        public SqlDataReader UpdateNewsContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdateNewsContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader UpdateEventContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_UpdateEventContent", CommandType.StoredProcedure, p);
        }


        //DELETION

        public SqlDataReader DeleteAffiliationsContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeleteAffiliationContent", CommandType.StoredProcedure, p);
        }



        public SqlDataReader DeleteConsultingContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeleteConsultingContent", CommandType.StoredProcedure, p);
        }



        public SqlDataReader DeleteCareerContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeleteCareerContent", CommandType.StoredProcedure, p);
        }


        public SqlDataReader DeleteProgramMethodContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeletePrgMethodContent", CommandType.StoredProcedure, p);
        }


        public SqlDataReader DeleteNewsContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeleteNewsContent", CommandType.StoredProcedure, p);
        }

        public SqlDataReader DeleteEventContent(int ID, string Content)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@ID", ID);
            p[1] = new SqlParameter("@Content", Content);
            return ConnectionFactory.ExecuteCommand("SP_DeleteEventContent", CommandType.StoredProcedure, p);
        }

    }

}
