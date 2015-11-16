using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace TechSupport.Admin
{
    public partial class Technicians : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnViewAllTechs_Click(object sender, EventArgs e)
        {
            //ViewAllTechsGrid.Visible = false;

            //Techs.SelectCommand = "SELECT Technicians.* FROM Technicians";
            ViewAllTechsGrid.DataSourceID = "Techs";

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = true;

            //ViewAllTechsGrid.Visible = true;            
        }

        //When this event is fired i can access the current row and all of its data - Jak
        protected void ViewAllTechsGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow) //Making sure that the row being accessed contains data
            //{
            //    DataRowView currentRow = (DataRowView)e.Row.DataItem; //Retrieves a reference to the data used to databound the row

            //    //Finds the employed column and converts the database int values into readable text for the end user
            //    if (Convert.ToInt32(currentRow["Employed"]) == 0)       //Technician Employment database reference
            //    {                                                       //0 = Employed                                                            
            //        e.Row.Cells[4].Text = "Yes";                        //1 = Unemployed
            //    }
            //    else if (Convert.ToInt32(currentRow["Employed"]) == 1)
            //    {
            //        e.Row.Cells[4].Text = "No";

            //        //e.Row.ForeColor = System.Drawing.Color.Red;   //Undecided on the colour, either red text white background, red cell, or red whole row
            //        e.Row.Cells[4].BackColor = System.Drawing.Color.Red;
            //        //e.Row.BackColor = System.Drawing.Color.Red;
            //    }

            //    //Technician TypeID database reference
            //    //1 = Support Officer Level 1
            //    //2 = Technician Level 2
            //    if (Convert.ToInt32(currentRow["TypeID"]) == 1)
            //    {
            //        e.Row.Cells[5].Text = "Support Officer Level 1";
            //    }
            //    else if (Convert.ToInt32(currentRow["TypeID"]) == 2)
            //    {
            //        e.Row.Cells[5].Text = "Technician Level 2";
            //    }
            //}
        }

        protected void btnViewLevel1_Click(object sender, EventArgs e)
        {
            //ViewAllTechsGrid.Visible = false;

            //Techs.SelectCommand = "SELECT Technicians.* FROM Technicians WHERE (TypeID = 1)";
            ViewAllTechsGrid.DataSourceID = "ViewLevel1";

            lblViewLevel1.Visible = true;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;

            //ViewAllTechsGrid.Visible = true;
        }

        protected void btnViewLevel2_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "ViewLevel2";

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = true;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;


        }
        //http://www.aspsnippets.com/Articles/Bulk-Edit-Update-Multiple-Rows-in-ASPNet-GridView-using-CheckBoxes.aspx //Maybe add a hidden column for chkboxes and set them al to checked when the button is pressed?
        protected void btnEditDetails_Click(object sender, EventArgs e)
        {
            ViewAllTechsGrid.DataSourceID = "EditDetails";

            //ViewAllTechsGrid.Columns[6].Visible = true; //Sets the checkbox field to be visible //TESTING

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = true;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;

            btnEditDetails.Enabled = false;
            btnEditGrid.Visible = true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //ViewAllTechsGrid.DataSourceID = "ViewLevel2";

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = false;
            lblSearchByID.Visible = true;
            lblViewAllTechs.Visible = false;
        }

        protected void ViewAllTechsGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ViewAllTechsGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void CheckAll_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void btnEditGrid_Click(object sender, EventArgs e)
        {
            //This only works if the ViewAllTechsGrid_RowDataBound event is disabled, im assuming once it hits the converted text it doesnt know what to do with it
            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //Looping through each row in the grid
            {
                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = false; //Finds all the labels in the gridview and make them invisible

                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = true; //Finds all the textboxes in the gridview and make them visible
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = true; //Finds all the textboxes in the gridview and make them visible
                        }
                    }
                }
            }
            btnEditGrid.Visible = false;
            btnUpdate.Visible = true;
            BtnCancel.Visible = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Sends data to database

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            //Turns the gridview back into a non-editable state
            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //Looping through each row in the grid
            {
                if (row.RowType == DataControlRowType.DataRow) //Checks to make sure the row contains data
                {
                    for (int i = 1; i < row.Cells.Count; i++)
                    {
                        if (row.Cells[i].Controls.OfType<TextBox>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<TextBox>().FirstOrDefault().Visible = false; //Finds all the textboxes in the gridview and make them visible
                        }
                        if (row.Cells[i].Controls.OfType<DropDownList>().ToList().Count > 0)
                        {
                            row.Cells[i].Controls.OfType<DropDownList>().FirstOrDefault().Visible = false; //Finds all the textboxes in the gridview and make them visible
                        }
                        row.Cells[i].Controls.OfType<Label>().FirstOrDefault().Visible = true; //Finds all the labels in the gridview and make them invisible
                    }
                }
            }
            btnUpdate.Visible = false;
            BtnCancel.Visible = false;
            btnEditGrid.Visible = true;
        }

    }
}