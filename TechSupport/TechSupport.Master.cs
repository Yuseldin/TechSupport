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
            //It rebind the master page adjusting the javascript/jquery file path relatively to the content
            //page that is being called.
            Page.Header.DataBind();
            string name = "SELECT Name FROM Technicians WHERE TechID ='" + Session["username"] + "'";
            string level1 = "SELECT TechID FROM Technicians WHERE (TypeID = '1') AND TechID ='" + Session["username"] + "'";
            string level2 = "SELECT TechID FROM Technicians WHERE (TypeID = '2') AND TechID ='" + Session["username"] + "'";

            SqlCommand showname = new SqlCommand(name, con);
            SqlCommand showlvl1 = new SqlCommand(level1, con);
            SqlCommand showlvl2 = new SqlCommand(level2, con);

            try
            {
                con.Open();
                //if Admin logs in it will show the text "Welcome, Admin" at the left side of the screen and the Menu with all the features
                if (Session["username"].Equals("Admin") || Session["username"].Equals("admin"))
                {
                    lblSessionLogin.Text = "Welcome, Admin.";

                    Menu1.Visible = true;
                }
                else
                {
                    //If Support Officer Level 1 logs in, it will show "Welcome, (and the name of the user)" and the Menu with "Home" and "View Incidents" features
                    dr = showlvl1.ExecuteReader();
                    while (dr.Read())
                    {
                        string techId = dr["TechID"].ToString();

                        if (Session["username"].Equals(techId))
                        {
                            lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                            Menu2.Visible = true;
                        }
                    }
                    //If Technician Level 2 logs in, it will show "Welcome, (and the name of the user)" and the Menu with only the "Home" feature
                    dr2 = showlvl2.ExecuteReader();
                    while (dr2.Read())
                    {
                        string techId2 = dr2["TechID"].ToString();

                        if (Session["username"].Equals(techId2))
                        {
                            lblSessionLogin.Text = "Welcome, " + showname.ExecuteScalar().ToString() + ".";

                            Menu3.Visible = true;

                        }
                    }
                }
                con.Close();

        }
            catch 
            {
                Menu1.Visible = true;
            }


        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void Menu1_MenuItemDataBound(object sender, MenuEventArgs e)
        {        
            
        }

    }
}