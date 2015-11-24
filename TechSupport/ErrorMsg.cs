using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechSupport
{
    public class ErrorMsg
    {
        private string errorCode = string.Empty;

        public string ErrorCode
        {
            get { return errorCode; }
            set { errorCode = value; }
        }

        
        private static string Msg_404 = "Page Not Found"  + "/n/n"
                                      + "" + "/n/n"
                                      + "" + "/n/n"
                                      + "" + "/n/n";

        private void SetErrorMsg(string code)
        {
            code = ErrorCode;
            switch (code)
            { 
                case "404":
                    break;

                case "403":
                    break;

                case "500":
                    break;

            }
        }

    }
}