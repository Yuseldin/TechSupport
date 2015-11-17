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
        public SqlDataReader dr2;

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = "SELECT Name FROM Technicians WHERE TechID ='" + Session["username"] + "'";
            //string level1 = "SELECT TechID FROM Technicians WHERE TypeID = 1 AND TechID ='"+Session["username"]+"'";
            string level1 = "SELECT TechID FROM Technicians WHERE (TypeID = '1') AND TechID ='" + Session["username"] + "'";
            string level2 = "SELECT TechID FROM Technicians WHERE (TypeID = '2') AND TechID ='" + Session["username"] + "'";

            SqlCommand showname = new SqlCommand(name, con);
            SqlCommand showlvl1 = new SqlCommand(level1, con);
            SqlCommand showlvl2 = new SqlCommand(level2, con);

            
            con.Open();

            if (Session["username"].Equals("Admin") || Session["username"].Equals("admin"))
            {
                lblSessionLogin.Text = "Welcome, Admin.";

                Menu2.Visible = false;
                Menu3.Visible = false;
            }
            else
            {
                dr = showlvl1.ExecuteReader();
                while (dr.Read())
                {
                    string techId = dr["TechID"].ToString();

                    if (Session["username"].Equals(techId))
                    {
                        lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                        Menu1.Visible = false;
                        Menu3.Visible = false;

                    }
                }

                dr2 = showlvl2.ExecuteReader();
                while (dr2.Read())
                {
                    string techId2 = dr2["TechID"].ToString();

                    if (Session["username"].Equals(techId2))
                    {
                        lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                        Menu1.Visible = false;
                        Menu2.Visible = false;
                    }
                }
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