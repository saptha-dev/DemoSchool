using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BAL.BE
{
   public class SendSMSBE
    {
        string _strNo;
        string _strMsg;
        string _userName;
        string _passWord;
        public string strNo
        {
            get
            {
                return this._strNo;
            }
            set
            {
                this._strNo = value;
            }
        }
        public string strMsg
        {
            get
            {
                return this._strMsg;
            }
            set
            {
                this._strMsg = value;
            }
        }

        public string UserName
        {
            get
            {
                return this._userName;
            }
            set
            {
                this._userName = value;
            }
        }
        public string PassWord
        {
            get
            {
                return this._passWord;
            }
            set
            {
                this._passWord = value;
            }
        }

        public string category { get; set; }
        public string subject
        {
            get;
            set;

        }
        public string FormId { get; set; }
        public string RespondentName { get; set; }
        public string getRespondentMsg { get; set; }
        public string getRespondentEmail { get; set; }
        public string getRespondentMobile { get; set; }
        public string getRespondentR_Type { get; set; }
        public DateTime getResponseDate { get; set; }
  
        
       
           
           
           
           

    }
}
