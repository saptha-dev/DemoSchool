using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;
using System.Configuration;
using BAL.BE;
using DAL;
using System.Data.SqlClient;
namespace BAL.BL
{
    public class SendSMSBL
    {
        //Sending Sms Using SmsGlobal
        public int SendSms(SendSMSBE objSendSmsBE)
        {
            try
            {
                string From = "OLS";
                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://www.smsglobal.com/http-api.php?action=sendsms&user=" + objSendSmsBE.UserName + "&password=" + objSendSmsBE.PassWord + "&&from=" + From + "&to=" + objSendSmsBE.strNo + "&text=" + objSendSmsBE.strMsg);
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                return 1;
            }
            catch(Exception e)
            {
                throw e;
               
            }

            
        }
        //Sending Group Sms Using SmsGlobal
        public int SendGroupSms(SendSMSBE objSendSmsBE)
        {
            try
            {
                string From = "OLS";
                string splitNo = objSendSmsBE.strNo;
               string[] Nos = splitNo.Split(';');

               foreach (var singleNumber in Nos)
               {
                   HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://www.smsglobal.com/http-api.php?action=sendsms&user=" + objSendSmsBE.UserName + "&password=" + objSendSmsBE.PassWord + "&&from=" + From + "&to=" + singleNumber + "&text=" + objSendSmsBE.getRespondentMsg);
                   HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                   System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                   string responseString = respStreamReader.ReadToEnd();
                   respStreamReader.Close();
                   myResp.Close();
               }
                return 1;
            }
            catch (Exception e)
            {
                throw e;

            }


        }

        public SqlDataReader insertRespondentInfo(SendSMSBE objSendBEInfo)
        {
            SqlParameter[] p = new SqlParameter[7];
            p[0] = new SqlParameter("@FormId", objSendBEInfo.FormId);
            p[1] = new SqlParameter("@RespondentName", objSendBEInfo.RespondentName);
            p[2] = new SqlParameter("@getRespondentMsg", objSendBEInfo.getRespondentMsg);
            p[3] = new SqlParameter("@getRespondentEmail", objSendBEInfo.getRespondentEmail);
            p[4] = new SqlParameter("@getRespondentMobile", objSendBEInfo.getRespondentMobile);
            p[5] = new SqlParameter("@getRespondentR_Type", objSendBEInfo.getRespondentR_Type);
            p[6] = new SqlParameter("@getResponseDate", objSendBEInfo.getResponseDate);
            return ConnectionFactory.ExecuteCommand("SP_insertRespondentInfo", System.Data.CommandType.StoredProcedure, p);
            
        }
    }
}
