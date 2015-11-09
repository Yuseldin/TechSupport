using System;
using System.Collections.Generic;
using System.Configuration;
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
            if (Session["username"].Equals("Admin") || Session["username"].Equals("admin"))
            {
                Menu2.Visible = false;
                Menu3.Visible = false;
            }
            else if (Session["username"].Equals("12"))
            {
                 Menu1.Visible = false;
                 Menu3.Visible = false;
            }
            else
            {
                Menu1.Visible = false;
                Menu2.Visible = false;
            }
            
            
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {           
            
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {        
            
        }
    }
}