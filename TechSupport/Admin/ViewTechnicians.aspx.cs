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
            GridView1.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //When this event is fired i can access the current row and all of its data - Jak
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
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

    }
}