using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

//Author Block
//Author: Jak Revai
//Project: Revai_Jak_TechSupport_AS3
//Description: Create Web App in C#
//Version: 1.0
//NOTE: The design of these pages were created on a monitor with a resolution of: 1920x1080, if the pages look funky then that is why.

namespace TechSupport.Admin
{
    public partial class Technicians : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnViewAllTechs_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "Techs"; //Changes the datasource of the grid

            //Hides labels
            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;

            //Sets current label to  be visible
            lblViewAllTechs.Visible = true;

            //Enabled/Disabled buttons
            btnViewAllTechs.Enabled = false;
            btnEditDetails.Enabled = true;
            btnViewLevel1.Enabled = true;
            btnViewLevel2.Enabled = true;
            btnEditGrid.Visible = false;
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;

            //lblErrorText.Visible = false;
            ViewAllTechsGrid.Visible = true;
        }

        //When this event is fired i can access the current row and all of its data - Jak
        protected void ViewAllTechsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) //Making sure that the row being accessed contains data
            {
                DataRowView currentRow = (DataRowView)e.Row.DataItem; //Retrieves a reference to the data used to databound the row

                //Finds the employed column and converts the database int values into readable text for the end user
                if (Convert.ToInt32(currentRow["Employed"]) == 0)                           //Technician Employment database reference
                {                                                                           //0 = Employed                                                            
                    e.Row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text = "Yes";  //1 = Unemployed
                }
                else if (Convert.ToInt32(currentRow["Employed"]) == 1)
                {
                    e.Row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text = "No";

                    e.Row.Cells[4].BackColor = System.Drawing.Color.Red;
                }

                //Technician TypeID database reference
                //1 = Support Officer Level 1
                //2 = Technician Level 2
                if (Convert.ToInt32(currentRow["TypeID"]) == 1)
                {
                    e.Row.Cells[5].Controls.OfType<Label>().FirstOrDefault().Text = "Support Officer Level 1";
                }
                else if (Convert.ToInt32(currentRow["TypeID"]) == 2)
                {
                    e.Row.Cells[5].Controls.OfType<Label>().FirstOrDefault().Text = "Technician Level 2";
                }
            }
        }

        protected void btnViewLevel1_Click(object sender, EventArgs e) //REMINDER: ADD CODE TO DISPLAY IF NOTHING EXISTS
        {
            ViewAllTechsGrid.DataSourceID = "ViewLevel1"; //Changes the datasource id
            
            lblViewLevel1.Visible = true;

            //lblErrorText.Visible = false;
            //Hides labels
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;


            btnViewAllTechs.Enabled = true;
            btnEditDetails.Enabled = true;
            btnViewLevel1.Enabled = false;
            btnViewLevel2.Enabled = true;
            btnEditGrid.Visible = false;
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;

            
            ViewAllTechsGrid.Visible = true;

            if (ViewAllTechsGrid.Rows.Count == 0)
            {
                //lblErrorText.Visible = true;
                //lblErrorText.Text = "No Technicians exist in that role.";
            }
            else
            {
                //lblErrorText.Visible = false;
            }
        }

        protected void btnViewLevel2_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "ViewLevel2";

            if (ViewAllTechsGrid.Rows.Count == 0)
            {
                //lblErrorText.Visible = true;
                //lblErrorText.Text = "No Technicians exist in that role.";
            }
            else
            {
                //lblErrorText.Visible = false;
            }

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = true;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;

            //Enabled/Disabled buttons
            btnViewAllTechs.Enabled = true;
            btnEditDetails.Enabled = true;
            btnViewLevel1.Enabled = true;
            btnViewLevel2.Enabled = false;
            btnEditGrid.Visible = false;
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;

            //lblErrorText.Visible = false;
            ViewAllTechsGrid.Visible = true;
        }
       
        protected void btnEditDetails_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "EditDetails";

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = true;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;

            //Enabled/Disabled buttons
            btnViewAllTechs.Enabled = true;
            btnEditDetails.Enabled = false;
            btnViewLevel1.Enabled = true;
            btnViewLevel2.Enabled = true;

            //lblErrorText.Visible = false; //Need to set them to false when any button is pressed, maybe group the buttons??
            ViewAllTechsGrid.Visible = true;

            btnEditGrid.Visible = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "TechSearch";

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = true;
            lblViewAllTechs.Visible = false;

            btnViewAllTechs.Enabled = true;
            btnEditDetails.Enabled = true;
            btnViewLevel1.Enabled = true;
            btnViewLevel2.Enabled = true;            

            btnEditGrid.Visible = false;
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;

            string pattern = @"[a-z A-Z]|[^\w \xC0-\xFF]"; //Pattern that matches anything but a number
            Regex regexNotNumbers = new Regex(pattern);
            Match match = regexNotNumbers.Match(txtBoxSearch.Text);
            
            if (txtBoxSearch.Text.Equals(""))
            {
                lblErrorText.Text = "The search box is empty, please input a number to continue.";
                lblErrorText.Visible = true;
                ViewAllTechsGrid.Visible = false;
            }
            else if (match.Success)
            {
                lblErrorText.Text = "The search box contains invalid characters or is empty, please input a number to continue.";
                lblErrorText.Visible = true;
                ViewAllTechsGrid.Visible = false;
            }
            else
            {
                lblErrorText.Visible = false;
                ViewAllTechsGrid.Visible = true;
                TechSearch.SelectCommand = "SELECT * FROM Technicians WHERE TechID = '" + txtBoxSearch.Text + "'";
            }

            SqlCommand cmd = new SqlCommand("SELECT TechID FROM Technicians WHERE TechID = '" + txtBoxSearch.Text + "'");

            if (!match.Success)
            {
                //Connection
                string conStr = ConfigurationManager.ConnectionStrings["TechSupportConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows == false) //If the reader hasn't retrieved any rows then the id doesnt exist in the database, display error message
                        {
                            lblErrorText.Visible = true;
                            lblErrorText.Text = "That Technician doesn't exist in the database.";
                        }
                        con.Close();

                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }            
            }
            else
            {
                lblErrorText.Text = "The search box contains invalid characters or is empty, please input a number to continue.";
                lblErrorText.Visible = true;
                ViewAllTechsGrid.Visible = false;
            }
            ViewAllTechsGrid.DataBind();
        }

        protected void btnEditGrid_Click(object sender, EventArgs e)
        {
            //This only works if the ViewAllTechsGrid_RowDataBound event is disabled, im assuming once it hits the converted text it doesnt know what to do with it - Jak
            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //Looping through each row in the grid
            {
                row.Cells[4].BackColor = System.Drawing.Color.Empty; //Resets the back colour of the employed cell

                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = false; //Finds all the labels in the gridview and make them invisible

                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = true; //Finds all the textboxes in the gridview and make them visible
                        }

                        //Finds all dropdown boxes //Code for Employed dropdown box
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 && 
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1")) //Finds the employed dropdown box
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = true; //Makes it visible
                            
                            //if the data pulled from the database is 0, then it will set the dropdown box in edit mode to contain the value "Yes"
                            if (row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Text == "Yes")                //Database Reference
                            {                                                                                        //Employed: 0
                                row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 0;     //Unemployed: 1
                            }
                            //if the data pulled from the database is 1, then it will set the dropdown box in edit mode to contain the value "No"
                            if (row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Text == "No")
                            {
                                row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 1;
                            }
                        }

                        //Finds all dropdown boxes //Code for Type dropdown box
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown2")) //Finds the employed dropdown box
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = true; //Makes it visible

                            //if the data pulled from the database is 1, then it will set the dropdown box in edit mode to contain the value "Support Officer" - Jak
                            if (row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Text == "Support Officer Level 1")   //Database Reference
                            {                                                                                               //Technician: 2
                                row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 0;            //Support: 1
                            }
                            //if the data pulled from the database is 2, then it will set the dropdown box in edit mode to contain the value "Technician" - Jak
                            if (row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Text == "Technician Level 2")
                            {
                                row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex = 1;
                            }
                        } //End if
                    }//End for loop
                }//End outer if datarows
            }//End foreach

            btnEditGrid.Visible = false;
            btnUpdate.Visible = true;
            BtnCancel.Visible = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;
            btnEditGrid.Visible = true;

            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //Converting the dropdown boxes to integers
            {
                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        //Employed dropdown boxes
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex == 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1")) //If the value in the dropdown list is "Yes"
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "0";
                            Convert.ToInt32(row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedIndex == 1 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1")) //If the value in the dropdown list is "No"
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "1";
                            Convert.ToInt32(row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                        }

                        //Technician Type dropdown boxes
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedValue == "Support Officer Level 1" &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown2")) //If the value in the dropdown list is "Level 1"
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "1";
                            Convert.ToInt32(row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedValue == "Technician Level 2" &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown2")) //If the value in the dropdown list is "Level 2"
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value = "2";
                            Convert.ToInt32(row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Text);
                        }
                    }
                }
            }

            //UPDATING THE DATABASE
            foreach (GridViewRow row in ViewAllTechsGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {

                    SqlCommand cmd = new SqlCommand("UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone, [Employed] = @Employed, [TypeID] = @TypeID WHERE [TechID] = @TechID");
                    cmd.Parameters.AddWithValue("@Name", row.Cells[1].Controls.OfType<TextBox>().FirstOrDefault().Text);
                    cmd.Parameters.AddWithValue("@Email", row.Cells[2].Controls.OfType<TextBox>().FirstOrDefault().Text);
                    cmd.Parameters.AddWithValue("@Phone", row.Cells[3].Controls.OfType<TextBox>().FirstOrDefault().Text);
                    cmd.Parameters.AddWithValue("@Employed", row.Cells[4].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@TypeID", row.Cells[5].Controls.OfType<DropDownList>().FirstOrDefault().SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@TechID", ViewAllTechsGrid.DataKeys[row.RowIndex].Value);

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
            }
            ViewAllTechsGrid.DataBind(); //Rebinds the grid to the datasource and refreshes it
        }

        protected void BtnCancel_Click(object sender, EventArgs e) //Error with the drop down boxes, sends over the data when it should just cancel and do nothing
        {
            //Turns the gridview back into a non-editable state
            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //Looping through each row in the grid
            {
                if (row.Cells[4].Controls.OfType<Label>().FirstOrDefault().Text == "No") //If a technician is unemployed sets the cell back colour to be red
                {
                    row.Cells[4].BackColor = System.Drawing.Color.Red;
                }

                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    for (int i = 1; i < row.Cells.Count; i++)
                    {                        
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = true; //Finds all the labels in the gridview and make them invisible
                        
                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = false; //Finds all the textboxes in the gridview and make them visible
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Text = row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Text;
                        }

                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown1"))
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = false; //Finds all the textboxes in the gridview and make them visible                            
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0 &&
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().ID.Equals("DropDown2"))
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = false; //Finds all the textboxes in the gridview and make them visible                            
                        }
                        
                    }
                }
            }
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;
            btnEditGrid.Visible = true;
        }

        protected void txtBoxSearch_TextChanged(object sender, EventArgs e)
        {

        }
    }
}