using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Error
{
    public partial class Error : System.Web.UI.Page
    {
        ErrorMsg error = new ErrorMsg();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the exception from the session variable passed by the page where the error occured
            Exception ex = (Exception)Session["Exception"];
            //Calls the ExceptionMsgBox method that breakes the exception in pieces and building with them
            //a message error which is then passed to the label
            this.LblError.Text = error.ExceptionMsgBox(ex, null);
        }
        
    }
}