﻿using System;
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
            
            //string view = "SELECT * FROM Incidents WHERE TechID ='" + Session["username"] + "'";
            //SqlDataSource1.SelectCommand = view;

            
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            string close = "UPDATE Incidents SET DateClosed ='" + DateTime.Now + "'WHERE IncidentID ='" + txtClose.Text + "' AND TechID ='" + Session["username"] + "' "; 
            

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