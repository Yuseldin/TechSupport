using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

//Author Block
//Author: Jak Revai
//Project: Revai_Jak_TechSupport_AS3
//Description: Create Web App in C#
//Version: 1.0
//NOTE: The design of these pages were created on a monitor with a resolution of: 1920x1080, if the pages look funny on a smaller resolution then that is why.

namespace TechSupport
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Membership.ValidateUser(Login.UserName, Login.Password)) //Checks the username and password against the stored username and password in the asp_membership table
            {
                MembershipUser userInfo = Membership.GetUser(Login.UserName); //Retrieves all user info based on the username
                string employed = "";

                if (Login.UserName == "Admin") //If the username entered is Admin, then bypass the sql command and log straight in
                {
                    string username = Login.UserName;
                    Session["username"] = username;
                    e.Authenticated = true;
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("SELECT Employed FROM Technicians WHERE TechID = @techid"); //SQL to select the Employed value from TechSupport Database based on the username entered
                    cmd.Parameters.AddWithValue("@techid", Login.UserName);

                    //Connection
                    string conStr = ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        cmd.Connection = con;
                        try
                        {
                            con.Open();
                            employed = cmd.ExecuteScalar().ToString();
                            con.Close();
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                }

                if (Login.UserName == "Admin") //safety check just incase the admin is redirected up top for some unknown reason, probably redundant at this point
                {
                    string username = Login.UserName;
                    Session["username"] = username;
                    e.Authenticated = true;
                }
                else if (userInfo != null && employed.Equals("0")) //Checks if the userInfo exists and the User is employed from TechSupport database
                {
                    string username = Login.UserName;
                    Session["username"] = username;

                    e.Authenticated = true; //Continues with the login procedure
                }
                else
                {
                    e.Authenticated = false;
                    Login.FailureText = "You are no longer employed, therefore this account has been disabled."; //The account is no longer employed and cant login
                }
            }
            else
            {
                e.Authenticated = false;
                Login.FailureText = "Your login attempt was not successful. Please try again."; //The login attempt failed
            }
                
        }

        protected void Login_LoggedIn(object sender, EventArgs e)
        {            
            
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            
        }     
    }
}