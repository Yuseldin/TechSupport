using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport
{
    public partial class Default : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            lblSessionLogin.Text = "Welcome, "+Session["username"] + ".";           
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            con.Open();
            //string view = "SELECT * FROM Incidents WHERE TechID ='" + Session["username"] + "'";
            
            string close = "UPDATE Incidents SET DateClosed ='" + DateTime.Now + "'";  
            SqlDataSource1.SelectCommand = close; 

           
            //SqlDataSource1.SelectCommand = view;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

    }
}