using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace TechSupport.Admin
{
    public partial class AddTechnician : System.Web.UI.Page
    {
        string dropDown = "";
        string Email = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //gets from the DetailsView the first row(des order), second colunm
            int UserName = Convert.ToInt32(DetailsView1.Rows[0].Cells[1].Text.ToString());

            // increment the user name 
            UserName += 1;

            //fill up the read only txtBox UserName
            CreateUserWizard1.UserName = UserName.ToString();

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            //Get data from CreateUserWizard
            string userName = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName")).Text;
            string Name = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Name")).Text;
            string Phone = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Phone")).Text;
            Email = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email")).Text;

           

            string conn = ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;
            string insertTech = "INSERT INTO Technicians(Name, Email, Phone, TypeID) VALUES (@Name, @Email, @Phone, @TypeID)";

            using (SqlConnection myConnection = new SqlConnection(conn))
            {
                myConnection.Open();

                SqlCommand command = new SqlCommand(insertTech, myConnection);

                //Inserting into user roles
                command.Parameters.AddWithValue("@Name", Name);
                command.Parameters.AddWithValue("@Email", Email);
                command.Parameters.AddWithValue("@Phone", Phone);

                if (dropDown == "Support Officer Level 1")
                {
                    command.Parameters.AddWithValue("@TypeID", 1);
                }
                else
                {
                    command.Parameters.AddWithValue("@TypeID", 2);
                }

                command.ExecuteNonQuery();

                myConnection.Close();
            }
        }

        //Executes the command to insert into TechSupport Database

        //string conn2 = ConfigurationManager.ConnectionStrings["ASPNETConnectionString"].ConnectionString;


        //using (SqlConnection myConn2 = new SqlConnection(conn2))
        //{
        //    //myConn2.Open();

        //    //string SelectUser = "SELECT UserId FROM aspnet_Users WHERE UserName = @username";
        //    //string SelectRole = "SELECT RoleId FROM aspnet_Roles WHERE (RoleName = 'Support Officer Level 1')";
        //    //string SelectRole2 = "SELECT RoleId FROM aspnet_Roles WHERE (RoleName = 'Technician Level 2')";

        //    //Retrieves the ID's
        //    //SqlCommand cmdSelectUser = new SqlCommand(SelectUser, myConn2);
        //    //SqlCommand cmdSelectRole = new SqlCommand(SelectRole, myConn2);
        //    //SqlCommand cmdSelectRole2 = new SqlCommand(SelectRole2, myConn2);

        //    //cmdSelectUser.Parameters.AddWithValue("@username", userName);

        //    //string userID = cmdSelectUser.ExecuteNonQuery().ToString();
        //    //string supportID = cmdSelectRole.ExecuteNonQuery().ToString();
        //    //string techID = cmdSelectRole2.ExecuteNonQuery().ToString();

        //    //if (dropDown == "Support Officer Level 1")
        //    //{
        //    //    string insertRole = "INSERT INTO aspnet_UsersInRoles (UserID, RoleID) VALUES (@UserID, @SupportID)";
        //    //    //SqlCommand insertSupport = new SqlCommand(insertRole, myConn2);
        //    //    //insertSupport.Parameters.AddWithValue("@UserID", userID);
        //    //    //insertSupport.Parameters.AddWithValue("@SupportID", supportID);

        //    //    //insertSupport.ExecuteNonQuery();
        //    //}
        //    //else
        //    //{
        //    //    string insertRole = "INSERT INTO aspnet_UsersInRoles (UserID, RoleID) VALUES (@UserID, @TechID)";
        //    //    //SqlCommand insertTechnician = new SqlCommand(insertRole, myConn2);
        //    //    //insertTechnician.Parameters.AddWithValue("@UserID", userID);
        //    //    //insertTechnician.Parameters.AddWithValue("@TechID", techID);

        //    //    //insertTechnician.ExecuteNonQuery();
        //    //}


        //    //myConn2.Close();
        //}   


        protected void GetLastID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void UserName_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            //string insertTech = "INSERT INTO Technicians(Name, Email, Phone, TypeID, Employed) VALUES ('" + CreateUserWizard1.ToString() +
            //                    "', @Email, @Phone, @TypeID, 0)";
        }

        protected void DropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            dropDown = CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDown").ToString();
        }

       
    }
}