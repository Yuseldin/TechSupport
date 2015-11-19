using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Admin
{
    public partial class AddTechnician : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //gets from the DetailsView the first row(des order), second colunm
            int UserName = Convert.ToInt32(DetailsView1.Rows[0].Cells[1].Text.ToString());

            // increment the user name 
            UserName = UserName + 1;

            //fill up the read only txtBox UserName
            CreateUserWizard1.UserName = UserName.ToString();
            
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            
        }

        protected void GetLastID_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }


    }
}