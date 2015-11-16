using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;


namespace TechSupport
{
    public partial class ViewIncidents : System.Web.UI.Page
    {
        private Dictionary<string, TextBox> txtList;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.DDLActions.Items[0].Attributes["style"] = "display:none;";
            this.GridView_Incidents.AllowPaging = true;
            this.GridView_Incidents.AllowSorting = false;
            txtList = ListCtrls();
            
        }

        public Dictionary<string, TextBox> ListCtrls()
        {
            List<TextBox> textboxes = new List<TextBox>();
            textboxes.Add(TxtCustName);
            textboxes.Add(TxtProdName);
            textboxes.Add(TxtTitle);
            textboxes.Add(TxtDescr);
            textboxes.Add(TxtTech);
            textboxes.Add(TxtOpened);
            textboxes.Add(TxtClosed);

            Dictionary<string, TextBox> controls = new Dictionary<string, TextBox>();


            for(int e=1; e<this.GridView_Incidents.Columns.Count-1; e++)
            {
                string key = GridView_Incidents.Columns[e].HeaderText;
                controls.Add(key, textboxes[e-1]);
            }

            return controls;
        }

        protected void Grid_ViewIncidents_SelectedIndexChanged(object sender, EventArgs e)
        {
            string colName = string.Empty, cellValue = string.Empty, text = string.Empty;
            bool ok = false;

            DDLActions.Enabled = true;
            GridViewRow selected = this.GridView_Incidents.SelectedRow;
            int cellsCount = selected.Cells.Count;


            Dictionary<string, string> selectedRow = new Dictionary<string, string>();
                for (int i = 1; i < cellsCount - 1; i++)
                {
                    colName = this.GridView_Incidents.Columns[i].HeaderText;
                    cellValue = selected.Cells[i].Text;
                    selectedRow.Add(colName, cellValue);
                }

            foreach (KeyValuePair<string, string> pair in selectedRow)
            {

                ok = selectedRow.TryGetValue(pair.Key, out text);

                TextBox txt;
                txtList.TryGetValue(pair.Key, out txt);
                string id = txt.ID.ToString();
                if (text != "&nbsp;")
                { txt.Text = text; }




            }

            selectedRow = null;
        }

        protected void Grid_ViewIncidents_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //Add CSS class on header row.
            if (e.Row.RowType == DataControlRowType.Header)
                e.Row.CssClass = "header";

            //Add CSS class on normal row.
            if (e.Row.RowType == DataControlRowType.DataRow &&
                      e.Row.RowState == DataControlRowState.Normal)
                e.Row.CssClass = "normal";

            //Add CSS class on alternate row.
            if (e.Row.RowType == DataControlRowType.DataRow &&
                      e.Row.RowState == DataControlRowState.Alternate)
                e.Row.CssClass = "alternate";
        }



        protected void DDLActions_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLActions.SelectedValue == "Update")
            {
                foreach (KeyValuePair<string, TextBox> pair in txtList)
                {
                    (pair.Value as TextBox).Enabled = true;
                }
            }
            else if (DDLActions.SelectedIndex == -1) { DDLActions.SelectedIndex = 0; }
            else
            {
                foreach (KeyValuePair<string, TextBox> pair in txtList)
                {
                    (pair.Value as TextBox).Enabled = false;
                }
            }

        }

        protected void ResetForm()
        {
            foreach (KeyValuePair<string, TextBox> pair in txtList)
            {
                (pair.Value as TextBox).Text = string.Empty;
                (pair.Value as TextBox).Enabled = false;
                DDLActions.SelectedIndex = -1;
                DDLActions.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = SqlDataSource_Incidents.UpdateCommand;
            ParameterCollection parameters = SqlDataSource_Incidents.UpdateParameters;
            string adsf = GridView_Incidents.SelectedValue.ToString();
            SqlDataSource_Incidents.Update();
            ResetForm();
        }

        protected void GridView_Incidents_PreRender(object sender, EventArgs e)
        {
            //GridView gv = (GridView)sender;
            //GridViewRow gvr = (GridViewRow)gv.BottomPagerRow;
            //if (gvr != null)
            //{
            //    gvr.Visible = true;
            //}
            //gv.PageIndex = 0;
        }






    }
}