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
    public partial class Customers : System.Web.UI.Page
    {

        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ToString());
        public SqlCommand com;
         

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //You can search a Customer by inserting their ID in the txtbox and clicking the search button.
            con.Open();
            string searchCus = "SELECT * FROM Customers WHERE CustomerID ='" + txtSearch.Text + "'";
            string searchReg = "SELECT * FROM Registrations WHERE CustomerID ='" + txtSearch.Text + "'";

            techSqlDataSource.SelectCommand = searchCus;
            SqlDataSource1.SelectCommand = searchReg;
        }



    }
}