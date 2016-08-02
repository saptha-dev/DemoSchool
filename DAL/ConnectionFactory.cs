using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class ConnectionFactory
    {
        public static string connStr = "Database";
        static SqlConnection conn;
        static SqlCommand cmd;
        static DataTable dt = new DataTable();
        public static SqlConnection openConnection()
        {
            try
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn = new SqlConnection();

                    ConnectionStringSettings connStrSettings = ConfigurationManager.ConnectionStrings[connStr];
                    conn.ConnectionString = connStrSettings.ConnectionString;
                    conn.Open();
                    return conn;

                }
                else
                {

                    conn = new SqlConnection();

                    ConnectionStringSettings connStrSettings = ConfigurationManager.ConnectionStrings[connStr];
                    conn.ConnectionString = connStrSettings.ConnectionString;
                    conn.Open();
                    return conn;
                }
            }
            catch
            {
                throw;
            }
        }

        public static bool closeConnection(SqlConnection conn)
        {
            try
            {

                if (conn != null && conn.State == System.Data.ConnectionState.Open)
                {
                    conn.Close();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                throw;
            }
        }

        public static SqlDataReader ExecuteStoredProcedure(string SPName, params SqlParameter[] SpParam)
        {
            try
            {
                return ExecuteCommand(SPName, CommandType.StoredProcedure, SpParam);
            }
            catch
            {
                throw;
            }

        }

        public static SqlDataReader ExecuteCommand(string Text, CommandType CmdType, params SqlParameter[] SpParam)
        {
            try
            {

                SqlDataReader _reader;
                cmd = new SqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;     //Assign the SP Name to Command Object
                cmd.CommandType = CmdType;  //Assign the SP Type to Command Object

                foreach (object param in SpParam)   //Assign the SP Parameters to Command Parameters Object
                    cmd.Parameters.Add(param);

                _reader = cmd.ExecuteReader();  //Execute the SP 


                return _reader;
            }
            catch
            {
                throw;
            }

        }

        public static DataSet ExecuteCommandDs(string Text, CommandType CmdType, params SqlParameter[] SpParam)
        {
            try
            {

                DataSet ds=new DataSet();
                cmd = new SqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;     //Assign the SP Name to Command Object
                cmd.CommandType = CmdType;  //Assign the SP Type to Command Object

                foreach (object param in SpParam)   //Assign the SP Parameters to Command Parameters Object
                    cmd.Parameters.Add(param);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(ds); //Execute the SP 


                return ds;
            }
            catch
            {
                throw;
            }

        }

        public static int ExecuteUpdate(string Text, CommandType CmdType, params SqlParameter[] SpParam)
        {
            try
            {
                cmd = new SqlCommand();
                cmd = new SqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;//Assign the SP Name to Command Object
                cmd.CommandType = CmdType; //Assign the SP Type to Command Object
                foreach (object param in SpParam)
                cmd.Parameters.Add(param); //Assign the SP Parameters to Command Parameters Object
                int result = cmd.ExecuteNonQuery(); //Execute the SP 
                return result;
               
            }
            catch
            {
                throw;
            }
        }

        public static SqlDataReader ExecuteCommand(string Text, CommandType CmdType)
        {
            try
            {
                SqlDataReader _reader;
                cmd = new SqlCommand();
                cmd.Connection = openConnection();
                cmd.CommandText = Text;     //Assign the SP Name to Command Object
                cmd.CommandType = CmdType;  //Assign the SP Type to Command Object

                _reader = cmd.ExecuteReader();  //Execute the SP 

                return _reader;
            }
            catch
            {
                throw;
            }

        }
    }
}
