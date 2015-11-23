using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TechSupport.Technicians
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        private Dictionary<string, TextBox> ctrlList;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.GridView_Incidents.AllowPaging = true;
            this.GridView_Incidents.AllowSorting = false;
            ctrlList = ListCtrls();
            //resetCreateNewIncident();
            
        }

        public Dictionary<string, TextBox> ListCtrls()
        {
            List<TextBox> listCtrls = new List<TextBox>();
            listCtrls.Add(TxtCustName);//(DdlCustomer);
            listCtrls.Add(TxtProdName);//(DdlProds);
            listCtrls.Add(TxtTitle);
            listCtrls.Add(TxtDescr);
            listCtrls.Add(TxtTech);// (DdlTech);
            listCtrls.Add(TxtOpened);
            listCtrls.Add(TxtClosed);

            Dictionary<string, TextBox> controls = new Dictionary<string, TextBox>();


            for (int e = 1; e < this.GridView_Incidents.Columns.Count - 1; e++)
            {
                string key = GridView_Incidents.Columns[e].HeaderText;
                controls.Add(key, listCtrls[e - 1]);
            }

            return controls;
        }


        protected void Grid_ViewIncidents_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string colName = string.Empty, cellValue = string.Empty, text = string.Empty;
            //bool ok = false;

            ////this.GridView_Incidents.SelectedRow.BackColor = System.Drawing.Color.Azure; 

            //GridViewRow selected = this.GridView_Incidents.SelectedRow;
            //int cellsCount = selected.Cells.Count;


            //Dictionary<string, string> selectedRow = new Dictionary<string, string>();
            //for (int i = 1; i < cellsCount - 1; i++)
            //{
            //    colName = this.GridView_Incidents.Columns[i].HeaderText;
            //    cellValue = selected.Cells[i].Text;
            //    selectedRow.Add(colName, cellValue);
            //}


            //foreach (KeyValuePair<string, string> pair in selectedRow)
            //{

            //    ok = selectedRow.TryGetValue(pair.Key, out text);
                
            //    TextBox ctrl;
            //    ctrlList.TryGetValue(pair.Key, out ctrl);
            //    //string id = ctrl.ID.ToString();
            //    //if (text != "&nbsp;")
            //    //{ ctrl.Text = text; }

            //    if (ctrl is TextBox)
            //    {
            //        if (text != "&nbsp;") { (ctrl as TextBox).Text = text; }
            //    }
            //    //else if (ctrl is DropDownList)
            //    //{
            //    //    (ctrl as DropDownList).SelectedValue = text;
            //    //}

            //}

            //DdlProds.DataBind();
            //DdlTech.DataBind();
            //selectedRow = null;



            this.SqlDataSource_FormViewIncident.Select(DataSourceSelectArguments.Empty);
this.FormView1.DataBind();
setFormView_Incidents();




            this.Incidents_MultiView.ActiveViewIndex = 1;
            //this.FormView1.SelectedValue = GridView_Incidents.SelectedValue;
           // this.IncidentMenu.Items[1].Selected = true;
           // DdlTech.SelectedValue = selectedRow["Technician"];



            

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




        protected void ResetForm()
        {
            foreach (KeyValuePair<string, TextBox> pair in ctrlList)
            {
                //(pair.Value as Control).Text = string.Empty;
                //(pair.Value as TextBox).Enabled = false;

                if (pair.Value is TextBox)
                {
                    (pair.Value as TextBox).Text = string.Empty; 
                }
                    this.DdlProds.Items.Clear();
                    this.DdlProds.SelectedIndex = -1;

                   this.DdlTech.Items.Clear();
                   this.DdlTech.SelectedIndex = -1;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query = SqlDataSource_Incidents.UpdateCommand;
            string adsf = GridView_Incidents.SelectedValue.ToString();
            SqlDataSource_Incidents.Update();
            GridView_Incidents.DataBind();
            FormView1.DataBind();
            
            this.Incidents_MultiView.ActiveViewIndex = 1;
        }

        protected void BtnBackToList_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 0;
        }


        protected void IncidentMenu_MenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            this.Incidents_MultiView.ActiveViewIndex = index;
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 2;
        }

        protected void DdlCustomer_DataBound(object sender, EventArgs e)
        {
            ////DdlCustomer.Items.FindByText("Salina Edgardo").Selected = true;
            ////DdlCustomer.SelectedValue = "1010";
        }

        protected void DdlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
           // 

        }

        protected void TxtCustName_TextChanged(object sender, EventArgs e)
        {
        }

        protected void DdlTech_DataBound(object sender, EventArgs e)
        {
            string tech = TxtTech.Text;
            if (!String.IsNullOrEmpty(tech) && tech != "Not Set")
            { DdlTech.Items.FindByText(tech).Selected = true; }
        }

        protected void TxtTech_TextChanged(object sender, EventArgs e)
        {
        }

        protected void BtnCreateNewIncident_Click(object sender, EventArgs e)
        {
            SqlDataSource_Incidents.Insert();
            GridView_Incidents.DataBind();
            FormView1.DataBind();
            this.Incidents_MultiView.ActiveViewIndex = 0;
            //resetCreateNewIncident();
        }

        protected void DdlClient_NewIncident_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            DdlProds_NewIncident.DataBind();
        }

        protected void DdlClient_NewIncident_DataBound(object sender, EventArgs e)
        {
            DdlProds_NewIncident.DataBind();
        }


        //protected void resetCreateNewIncident()
        //{
        //    DdlClient_NewIncident.SelectedIndex = -1;
        //    DdlProds_NewIncident.SelectedIndex = -1;
        //    DdlTech_NewIncident.SelectedIndex = -1;
        //    TxtTitle_NewIncident.Text = String.Empty;
        //    TxtDescr_NewIncident.Text = String.Empty;
        //    TxtOpened_NewIncident.Text = String.Empty;
        //    TxtClosed_NewIncident.Text = String.Empty;
        //}

        protected void BtnRefresh_NewIncident_Click(object sender, EventArgs e)
        {
            //resetCreateNewIncident();
        }

        protected void Incidents_MultiView_ActiveViewChanged(object sender, EventArgs e)
        {
            if (this.Incidents_MultiView.ActiveViewIndex == 3)
            {
               // resetCreateNewIncident();
            }
        }

        protected void DdlProds_DataBound(object sender, EventArgs e)
        {
            //DdlProds.d
            //string prod = this.TxtProdName.Text;
            //if (!String.IsNullOrEmpty(prod))
            //{ 
            //    DdlTech.Items.FindByText(prod).Selected = true; 
            //}

        }


        protected void Button10_Click(object sender, EventArgs e)
        { 
            int page = FormView1.PageIndex;
            if (page >= 0 && page < FormView1.PageCount)
            { page -= 1; }
            else 
            {
                (sender as Button).Enabled = false;
            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            setUpdateForm();
            this.Incidents_MultiView.ActiveViewIndex = 2;
        }


        protected void setFormView_Incidents()
        {
            DataRowView sadf = (DataRowView)this.FormView1.DataItem;



            bool found = false;

            object id = this.GridView_Incidents.SelectedValue;
            // string colSelected = this.GridView_Incident

            for (int i = 0; i < sadf.DataView.Count; i++)
            {
                var dd = sadf.DataView[i].Row[0];

                if (sadf.DataView[i].Row[0].Equals(id))
                {
                    found = true;
                    FormView1.PageIndex = i;
                    FormView1.DataBind();
                }
            }

        }


        protected void setUpdateForm()
        {
            string colName = string.Empty, cellValue = string.Empty, text = string.Empty;
            bool ok = false;

            FormView1.DataBind();
            
            //this.GridView_Incidents.SelectedRow.BackColor = System.Drawing.Color.Azure; 
            DataRowView row = (DataRowView)this.FormView1.DataItem;

            int index = (int)FormView1.PageIndex;



            int cellsCount = this.GridView_Incidents.SelectedRow.Cells.Count;


            Dictionary<string, string> selectedRow = new Dictionary<string, string>();
            for (int i = 1; i < cellsCount - 1; i++)
            {
                colName = this.GridView_Incidents.Columns[i].HeaderText;
                cellValue = row.DataView[index].Row[i].ToString();
               cellValue = DateFormat(cellValue);
                selectedRow.Add(colName, cellValue);
            }


            foreach (KeyValuePair<string, string> pair in selectedRow)
            {

                ok = selectedRow.TryGetValue(pair.Key, out text);

                TextBox ctrl;
                ctrlList.TryGetValue(pair.Key, out ctrl);
                //string id = ctrl.ID.ToString();
                //if (text != "&nbsp;")
                //{ ctrl.Text = text; }

                if (ctrl is TextBox)
                {
                    if (text != "&nbsp;") { (ctrl as TextBox).Text = text; }
                }
                //else if (ctrl is DropDownList)
                //{
                //    (ctrl as DropDownList).SelectedValue = text;
                //}

            }

            DdlProds.DataBind();
            DdlTech.DataBind();
            selectedRow = null;

        }

        protected void FormView1_PageIndexChanged(object sender, EventArgs e)
        {
        }







        protected string DateFormat(object input)
        {
            DateTime dt; 
            string output = string.Empty;
            bool ok = DateTime.TryParse(input.ToString(), out dt);

            if (ok)
            { output = dt.ToString("dd/MM/yyyy"); }
            else { output = input.ToString(); }
            return output;
        }

        protected void BtnNewIncident_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 3;
        }

        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 1;
        }

        protected void DdlTech_NewIncident_SelectedIndexChanged(object sender, EventArgs e)
        {

        }






    }
}