﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Author: Yusef Acbani
//Project: Acabani_Yusef_TechSupport_AS3
//Description: Create Web App in C#

namespace TechSupport.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ToString());

        protected void Customer()
        {
            string searchCus = "SELECT * FROM Customers WHERE CustomerID ='" + txtSearch.Text + "'";
            techSqlDataSource.SelectCommand = searchCus;
        }
        protected void Registration()
        {
            string searchReg = "SELECT * FROM Registrations WHERE CustomerID ='" + txtSearch.Text + "'";
            SqlDataSource1.SelectCommand = searchReg;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }       

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string cust = "SELECT CustomerID FROM Customers";
            SqlCommand customer = new SqlCommand(cust, con);
            con.Open();
            SqlDataReader dr = customer.ExecuteReader(); 
            //You can search a Customer by inserting their ID in the textbox and clicking the search button.
            while (dr.Read())
            {
                string CustID = dr["CustomerID"].ToString();
                if (txtSearch.Text!=CustID)
                {
                    lblError.Text = "Please select the right CustomerID";
                }
                else
                {
                    lblError.Visible = false;
                    Customer();
                    Registration();
                }

            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) //Making sure that the row being accessed contains data
            {
                DataRowView currentRow = (DataRowView)e.Row.DataItem; //Retrieves a reference to the data used to databound the row

                //Finds the employed column and converts the database int values into readable text for the end user
                if (Convert.ToInt32(currentRow["Subscribed"]) == 0)
                {                                                       //0 = Subscribed                                                            
                    e.Row.Cells[4].Text = "Yes";                        //1 = Unsubscribed
                }
                else if (Convert.ToInt32(currentRow["Subscribed"]) == 1)
                {
                    e.Row.Cells[4].Text = "No";
                }

            }
        }


        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {          
            if (txtSearch.Text!="")
            {
                Registration();
            }
            GridView2.EditIndex = e.NewEditIndex;
        }

        protected void GridView2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            if (txtSearch.Text != "")
            {
                Registration();
            }
            GridView2.EditIndex = -1;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (txtSearch.Text != "")
            {
                Customer();
            }
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            if (txtSearch.Text != "")
            {
                Customer();
            }
            GridView1.EditIndex = -1;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (txtSearch.Text != "")
            {
                Customer();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            if (GridView2.SelectedRow == null)
            {
                lblError.Text = "Please select a customer";
            }
            else
            {
                lblError.Visible = false;
                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    //it searches for the edit button to hide it when clicked, and then sets the update and cancel buttons to visible
                    if (row.Cells[0].Controls.OfType<LinkButton>().ElementAt(0).ID == "btnSelect")
                    {
                        row.Cells[0].Controls.OfType<LinkButton>().FirstOrDefault().Visible = false;
                    }
                    if (row.Cells[0].Controls.OfType<LinkButton>().ElementAt(1).ID.Equals("btnUpdate"))
                    {
                        row.Cells[0].Controls.OfType<LinkButton>().ElementAt(1).Visible = true;
                    }
                    if (row.Cells[0].Controls.OfType<LinkButton>().LastOrDefault().ID.Equals("btnCancel"))
                    {
                        row.Cells[0].Controls.OfType<LinkButton>().LastOrDefault().Visible = true;
                    }

                    //searches for the labels to hide them
                    row.Cells[3].Controls.OfType<Label>().FirstOrDefault().Visible = false; //Finds all the labels in the gridview and make them invisible
                    row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Visible = false; //Finds all the labels in the gridview and make them invisible

                    //Finds all the textboxes in the gridview and make them visible
                    if (row.Cells[3].Controls.OfType<TextBox>().ToList().Count > 0)
                    {
                        row.Cells[3].Controls.OfType<TextBox>().FirstOrDefault().Visible = true;
                    }
                    //Finds all dropdown boxes //Code for Employed dropdown box
                    if (row.Cells[4].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1"))
                    {
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().Visible = true; //Makes it visible

                        //if the data pulled from the database is 0, then it will set the dropdown box in edit mode to contain the value "Yes"
                        if (row.Cells[4].Text == "Yes")                                                          //Database Reference
                        {                                                                                        //Subscribed: 0
                            row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 0;     //Unsubscribed: 1
                        }
                        //if the data pulled from the database is 1, then it will set the dropdown box in edit mode to contain the value "No"
                        if (row.Cells[4].Text == "No")
                        {
                            row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 1;
                        }
                    }

                }

            }

        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {          
            foreach (GridViewRow row in GridView2.Rows) 
            {
                if (txtSearch.Text != "")
                {
                    Registration();
                }
                row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Visible = true;               
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                Registration();
            }

            GridViewRow row = GridView2.SelectedRow;
                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    //Subscribed dropdown boxes
                    if (row.Cells[4].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex == 0 &&
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1")) //If the value in the dropdown list is "Yes"
                    {
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "0";
                        Convert.ToInt32(row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                    }
                    if (row.Cells[4].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex == 1 &&
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1")) //If the value in the dropdown list is "No"
                    {
                        row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "1";
                        Convert.ToInt32(row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                    }
                }
            
            //UPDATING THE DATABASE
            
                if (row.RowType == DataControlRowType.DataRow)
                {
                    string da = row.Cells[3].Controls.OfType<TextBox>().FirstOrDefault().Text;
                    DateTime date = Convert.ToDateTime(da);
                    string value = row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value;
                    int iValue = Convert.ToInt32(value);
                    SqlCommand cmd = new SqlCommand("UPDATE [Registrations] SET [RegistrationDate] = @RegistrationDate, [Subscribed] = @Subscribed WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode");
                    cmd.Parameters.AddWithValue("@CustomerID", row.Cells[1].Controls.OfType<Label>().FirstOrDefault().Text);
                    cmd.Parameters.AddWithValue("@ProductCode", row.Cells[2].Controls.OfType<Label>().FirstOrDefault().Text);
                    cmd.Parameters.AddWithValue("@RegistrationDate", date);
                    cmd.Parameters.AddWithValue("@Subscribed", iValue);

                    //Connection
                    string conStr = ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(conStr))
                    {
                        cmd.Connection = con;
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                }
            
            GridView2.DataBind();
        }




    }
}