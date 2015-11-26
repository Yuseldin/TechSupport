using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TechSupport
{
    public class ErrorMsg
    {

        //
        //EXCEPTION MSGBOX
        //
        /// <summary>
        /// Given an Exception object from a catch block, it displays a msgbox with an exhaustive description of the
        /// occured error. It also offer the possibility to add customized text to the messagebox.
        /// </summary>
        /// <param name="ex">Exception ex</param>
        /// <param name="text">(Optional) string text</param>
        public string ExceptionMsgBox(Exception ex, string text = null)
        {
            string msgTitle = string.Empty, msgText= string.Empty;

            //Create and populates a dictionary with all the exception useful informations
            Dictionary<string, string> ExParams = new Dictionary<string, string>();
            ExParams.Add("Type",        ex.GetType().ToString() );
            ExParams.Add("Source",      ex.Source               );
            ExParams.Add("Stack Trace", ex.StackTrace           );
            ExParams.Add("Target Site", ex.TargetSite.ToString());
            ExParams.Add("Message",     ex.Message              );

            //Definition of the paramters for the msgbox
            msgTitle = "Error Message" + " - " + ExParams["Type"];
            msgText = ExParams["Source"] + "\n\n";

            if (text != null) { msgText += text + "\n\n"; }

            msgText += ExParams["Message"] + "\n\n"
                    + ExParams["Stack Trace"] + "\n\n"
                    + ExParams["Target Site"];
            
            //Shows the error msg box
            return msgText;
        }
    }


}