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
            if (e.Row.RowType == DataControlRowType.DataRow) //Making sure that the row being accessed contains data
            {
                DataRowView currentRow = (DataRowView)e.Row.DataItem; //Retrieves a reference to the data used to databound the row

                if (Convert.ToInt32(currentRow["Employed"]) == 0)       //Technician Employment database reference
                {                                                       //0 = Employed                                                            
                    e.Row.Cells[4].Text = "Yes";                        //1 = Unemployed
                }
                else if (Convert.ToInt32(currentRow["Employed"]) == 1)
                {
                    e.Row.Cells[4].Text = "No";

                    //e.Row.ForeColor = System.Drawing.Color.Red;   //Undecided on the colour, either red text white background, red cell, or red whole row
                    e.Row.Cells[4].BackColor = System.Drawing.Color.Red;
                    //e.Row.BackColor = System.Drawing.Color.Red;
                }

                //Technician TypeID database reference
                //1 = Support Officer Level 1
                //2 = Technician Level 2
                if (Convert.ToInt32(currentRow["TypeID"]) == 1)
                {
                    e.Row.Cells[5].Text = "Support Officer Level 1";
                }
                else if (Convert.ToInt32(currentRow["TypeID"]) == 2)
                {
                    e.Row.Cells[5].Text = "Technician Level 2";
                }
            }
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

            lblViewLevel1.Visible = false;
            lblViewLevel2.Visible = false;
            lblEditDetails.Visible = true;
            lblSearchByID.Visible = false;
            lblViewAllTechs.Visible = false;

            int i = 0;

            foreach (GridViewRow row in ViewAllTechsGrid.Rows) //not being cancelled yet, trying to display all rows being editable at the same time
            {
                if (row.RowType == DataControlRowType.DataRow) //Checking to see if the row contains data
                {
                    ViewAllTechsGrid.EditIndex = i;
                    i++;
                }
            }
            
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

    }
}