using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Admin
{
    public partial class AddNewMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DropDownListSelectMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListSelectMember.SelectedIndex.Equals(0))
            {
                txtBoxAddName.Enabled = true;
            }
        }

        
    }
}