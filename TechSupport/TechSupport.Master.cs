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
    public partial class TechSupport : System.Web.UI.MasterPage
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ToString());
        public SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = "SELECT Name FROM Technicians WHERE TechID ='" + Session["username"] + "'";
            string level1 = "SELECT TechID FROM Technicians WHERE TypeID = 1";
            string level2 = "SELECT TechID FROM Technicians WHERE TypeID = 2";

            SqlCommand showname = new SqlCommand(name, con);
            SqlCommand showlvl1 = new SqlCommand(level1, con);
            SqlCommand showlvl2 = new SqlCommand(level2, con);
                       
            con.Open();

            //dr = showlvl1.ExecuteReader();
            

            //if (dr.HasRows)
            //{
            //    while (dr.Read())
            //    {
                    
            //        SqlCommand showname = new SqlCommand(name, con);
            //        lblSessionLogin.Text = showname.ExecuteScalar().ToString();
            //    }
                
            //}


            if (Session["username"].Equals("Admin") || Session["username"].Equals("admin"))
            {
                lblSessionLogin.Text = "Welcome, Admin.";

                Menu2.Visible = false;
                Menu3.Visible = false;
            }
            else if (Session["username"].Equals(showlvl1.ExecuteScalar().ToString()))
            {
                lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                Menu1.Visible = false;
                Menu3.Visible = false;

            }
            else if (Session["username"].Equals(showlvl2.ExecuteScalar().ToString()))
            {
                lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                Menu1.Visible = false;
                Menu2.Visible = false;
            }
            else
            {
                lblSessionLogin.Text = "Welcome, Stranger.";
                Menu1.Visible = false;
                Menu2.Visible = false;
                LoginStatus1.Visible = false;
            }

            con.Close();

            
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {           
            
        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {        
            
        }

    }
}