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
            //It rebind the master page adjusting the javascript/jquery file path relatively to the content
            //page that is being called.
            Page.Header.DataBind();
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

    }    
}