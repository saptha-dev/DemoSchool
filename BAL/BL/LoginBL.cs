using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

using DAL;
using BAL.BE;

namespace BAL.BL
{
    public class LoginBL
    {
        /// <summary>
        /// To check whether the login details exist or not
        /// </summary>
        /// <param name="objLoginEntity"></param>
        /// <returns></returns>
        #region GetLoginDetails
        public SqlDataReader GetLoginDetails(LoginBE objLoginEntity)
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Username", objLoginEntity.Username);
            p[1] = new SqlParameter("@Password", objLoginEntity.Password);

            return ConnectionFactory.ExecuteCommand("SP_GetLoginDetails", CommandType.StoredProcedure, p);
        }
        #endregion GetLoginDetails

        public SqlDataReader GetUserDetails(LoginBE objLoginEntity)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Username", objLoginEntity.Username);

            return ConnectionFactory.ExecuteCommand("SP_GetUserDetails", CommandType.StoredProcedure, p);
        }

        public SqlDataReader GetRegistraionDetails(int DetailsId)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@DetailsId", DetailsId);
            return ConnectionFactory.ExecuteCommand("sp_GetRegistraionDetails", CommandType.StoredProcedure, p);
        }
    }
}
