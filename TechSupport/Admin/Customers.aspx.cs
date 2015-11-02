using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TextBox1.Text = GridView1.SelectedIndex.ToString();
            //GridView2.SelectedIndex = GridView1.SelectedIndex;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = "select * from Customers where CustomerID like'" + txtSearch.Text + "%'";
            


            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();


        }

    }
}