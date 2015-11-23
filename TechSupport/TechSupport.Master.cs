using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport
{
    public partial class TechSupport : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Handle the timeout exception
            Response.AddHeader("Session Timed Out", Convert.ToString(Session.Timeout * 60) + 5);
            if(String.IsNullOrEmpty(Session["username"].ToString()))
            {
                Server.Transfer("Default.aspx");
            }
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

    }
}