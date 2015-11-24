using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechSupport.Admin
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        string custID = "";
        string custName = "";
        string custPhone = "";
        string custEmail = "";
        string custAddress = "";
        string custCity = "";
        string custZipCode = "";
        string custState = "";
        string custCountry = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            int customerID = Convert.ToInt32(DetailsView1.Rows[0].Cells[1].Text.ToString());

            // increment the user name 
            customerID += 1;

            //fill up the read only txtBox UserName
            txtCustomerID.Text = customerID.ToString();

            //INSERT INTO Customers(CustomerID, Name, Address, City, State, ZipCode, country, Phone, Email) VALUES (,,,,,,,,)
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
           
            custID = txtCustomerID.Text;
            custName = txtName.Text;
            custPhone = txtPhone.Text;
            custEmail = txtEmail.Text;
            custAddress = txtAddress.Text;
            custCity = txtCity.Text;
            custZipCode = txtZipCode.Text;
            custCountry = txtCountry.Text;
            custState = txtState.Text;

            string conn = ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;
            string insertCustomer = "INSERT INTO Customers(Name, Address, City, State, ZipCode, country, Phone, Email) VALUES ('" + custName + "' ,'" + custAddress + "' ,'" + custCity + "' , '" + custState + "' ,'" + custZipCode + "' , '" + custCountry + "' ,'" + custPhone + "' , '" + custEmail + "')";

            using (SqlConnection myConnection = new SqlConnection(conn))
                {
                    myConnection.Open();

                    SqlCommand command = new SqlCommand(insertCustomer, myConnection);
                }
        }
    }
}