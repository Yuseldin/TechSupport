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
            //If Admin or Support Officer Level 1 log in, it will show the welcome message
            if (User.IsInRole("Admin")||User.IsInRole("Support Officer Level 1"))
            {
                GridView1.Visible = false;
                btnClose.Visible = false;
                txtClose.Visible = false;
                Label1.Visible = false;
                lblWelcome.Visible = true;
            }
            else //if Technician Level 2 logs in, it will show the incident addressed to that technician
            {
                string view = "SELECT * FROM Incidents WHERE TechID ='" + Session["username"] + "'";
                SqlDataSource1.SelectCommand = view;
            }



            //Once the incident is closed, it will show a confirmation message
            if (!string.IsNullOrEmpty(Request["ID"]))
            {
                string myname = Request.QueryString["ID"];

                lblOpen.Text = "Incident '" + myname + "' succesfully closed.";
                lblOpen.Visible = true;

            }
            con.Close();
            
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            //query statement to get the closed incidents with the same ID as the textbox
            string qclosed = "SELECT [IncidentID] FROM [Incidents] WHERE ([DateClosed] IS NOT NULL) AND IncidentID ='" + txtClose.Text + "' AND TechID ='" + Session["username"] + "'";
            SqlCommand inClosed = new SqlCommand(qclosed, con);
            
            //query statement to get the incidents with the same ID as the technician loged in.
            string inID = "SELECT IncidentID FROM Incidents WHERE TechID ='" + Session["username"] + "'";
            SqlCommand incident = new SqlCommand(inID, con);

            con.Open();
            SqlDataReader read = inClosed.ExecuteReader();
            SqlDataReader dr = incident.ExecuteReader();

            //CLosing the Incident will set the DateClosed to today's date
            DateTime now = DateTime.Now;            
            string date = now.ToString("MM/dd/yyyy");                       
            string close = "UPDATE Incidents SET DateClosed ='" + date + "' WHERE IncidentID ='" + txtClose.Text + "' AND TechID ='" + Session["username"] + "' ";

            if (read.Read())
            {
                string closed = read["IncidentID"].ToString();
                //if the first query statement matches the textbox, it means that the the incident is already closed.
                if (txtClose.Text == closed)
                {
                    lblError.Visible = false;
                    lblClosed.Text = "Incident '" + txtClose.Text + "' is already closed";
                    lblClosed.Visible = true;
                }
            }
            else
            {
                while (dr.Read())
                {
                    string incidentId = dr["IncidentID"].ToString();
                    //if the textbox is empty or the incidentID typed doesnt match the ones on the screen, it will show an error message
                    if (txtClose.Text == "" || txtClose.Text != incidentId)
                    {
                        lblError.Visible = true;
                        lblClosed.Visible = false;
                    }
                    else //if the IncidentID is the right one, it will close it by setting the date in the ClosedDate field
                    {
                        lblError.Visible = false;
                        SqlDataSource1.SelectCommand = close;

                        GridView1.DataBind();
                        Response.Redirect("Default.aspx?ID=" + txtClose.Text);
                    }
                }

            }
            

            con.Close();
        }





    }
}