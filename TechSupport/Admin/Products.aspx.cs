using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
        }

        protected void btnInsertProduct_Click(object sender, EventArgs e)
        {
            
            SqlProducts.Insert();
            GridView1.DataBind();   
            
        }
    }
}