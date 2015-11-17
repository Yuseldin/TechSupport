using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
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
            if (User.IsInRole("Admin")||User.IsInRole("Support Officer Level 1 "))
            {
                GridView1.Visible = false;
                btnClose.Visible = false;
                txtClose.Visible = false;
                Label1.Visible = false;
            }
            else 
            {
                string view = "SELECT * FROM Incidents WHERE TechID ='" + Session["username"] + "' AND ([DateClosed] IS NULL)";
                SqlDataSource1.SelectCommand = view;
            }


            con.Close();
            
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {

            //DateTime date = DateTime.Now;
            DateTime date = DateTime.Now;
            
            string datet = date.ToString("MM/dd/yyyy");
            
            //lblClosed.Text = datet;

            string close = "UPDATE Incidents SET DateClosed ='" + datet + "' WHERE IncidentID ='" + txtClose.Text + "' AND TechID ='" + Session["username"] + "' ";

            
            if (txtClose.Text == "")
            {
                lblError.Visible = true;
            }
            else
            {
                lblError.Visible = false;
                SqlDataSource1.SelectCommand = close;
                
                GridView1.DataBind();
                Response.Redirect(Request.RawUrl);
            }
                   
        }



    }
}