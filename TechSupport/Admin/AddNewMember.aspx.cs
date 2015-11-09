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
        

        protected void DropDownListSelectMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListSelectMember.SelectedIndex.Equals(""))
            {
                txtBoxAddName.Visible = false;
                txtBoxAddPhone.Visible = false;
            }
            else if (DropDownListSelectMember.SelectedIndex.Equals("Add Technician"))
            {
                txtBoxAddName.Visible = true;
                txtBoxAddPhone.Visible = true;
            }
            else
            { 
                
            }
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            
        }

        
    }
}