using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/* Author:  Stefano Donati
 * Project: Software Support, C# Final Assessment
 * Date:    23/11/2015
 * Branch:  View Incidents Page
 * Team:    Yellow Team
 */

namespace TechSupport.Technicians
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Declare a dictionary which will contain a list of the textboxes used in the update form
        private Dictionary<string, TextBox> ctrlList;

        //
        //PAGE LOAD
        /// <summary>
        /// Event that executes once the page has been loaded
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Set the gridview to allow the paging of the records
            this.GridView_Incidents.AllowPaging = true;
            //Disable the possibility for the user to sort up the records being them already sorted in the select query
            this.GridView_Incidents.AllowSorting = false;
            //Calls the method which populates the dictionary with all the textboxes
            ctrlList = ListCtrls();
        }


        //
        //INCIDENT LIST PAGE
        //
        #region INCIDENT LIST


        //
        //LIST CTRLS
        /// <summary>
        /// Create a dictionary containing all the textboxes present inside the update form
        /// </summary>
        /// <returns></returns>
        public Dictionary<string, TextBox> ListCtrls()
        {
            //Create a list of the textboxes
            List<TextBox> listCtrls = new List<TextBox>();
            listCtrls.Add(TxtCustName);
            listCtrls.Add(TxtProdName);
            listCtrls.Add(TxtTitle);
            listCtrls.Add(TxtDescr);
            listCtrls.Add(TxtTech);
            listCtrls.Add(TxtOpened);
            listCtrls.Add(TxtClosed);

            //Declare the dictionary to be returned
            Dictionary<string, TextBox> controls = new Dictionary<string, TextBox>();
            //For loop that transfer the whole content in the list to the dictionary pairing the textboxes with string
            //keys that are the gridview columns headers
            for (int e = 1; e < this.GridView_Incidents.Columns.Count - 1; e++)
            {
                //Get the column header
                string key = GridView_Incidents.Columns[e].HeaderText;
                //Add both the column header (KEY) and the textbox (VALUE) to the dictionary
                controls.Add(key, listCtrls[e - 1]);
            }

            return controls;
        }

        
        //
        //GRIDVIEW SELECTED INDEX CHANGED
        /// <summary>
        /// Events that fires when a new row is selected in the gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView_Incidents_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Calls the select method for the SqlDataSource binded to the form view for the incident details
                this.SqlDataSource_FormViewIncident.Select(DataSourceSelectArguments.Empty);
                //Bind the formview so that it refreshes and it displays the selected record
                this.FormView_Incidents.DataBind();
                //Having made so that in the formview are loaded all the incidents for the selected customer, this method
                //set the displayed page on the specific record selected in the gridview
                setFormView_Incidents();
                //Set the active view of the multiview control on the view incident page
                this.Incidents_MultiView.ActiveViewIndex = 1;
            }
            catch(InvalidOperationException ex)
            {
                Session["Exception"] = ex;
            }
            catch(Exception ex)
            {
                Session["Exception"] = ex;
            }
        }


        //
        //GRIDVIEW ROW CREATED
        /// <summary>
        /// This method basically just adds the styles for alternated rows and the columns headers as well
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView_Incidents_RowCreated(object sender, GridViewRowEventArgs e)
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


        //
        //BTN NEW INCIDENT CLICK
        /// <summary>
        /// This button simply bring the user to the create new incident page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnNewIncident_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 3;
        }


        #endregion INCIDENT LIST


        //
        //VIEW INCIDENT DETAILS
        //
        #region VIEW INCIDENT DETAILS


        //
        //SET FORMVIEW_INCIDENTS
        /// <summary>
        /// Set the form view to display the selected incident out of all the other incidents for the selected customer
        /// </summary>
        protected void setFormView_Incidents()
        {
            //Get all the records loaded in the formview
            DataRowView view = (DataRowView)this.FormView_Incidents.DataItem;

            if (view != null)
            {
                //Get the selected value of the record which is the incident id
                object id = this.GridView_Incidents.SelectedValue;
                //For loop that iterates through the row's cells
                for (int i = 0; i < view.DataView.Count; i++)
                {
                    //If the content of the first cell, which is the incident id, is equal to the id got from the 
                    //selected row in the gridview:
                    if (view.DataView[i].Row[0].Equals(id))
                    {
                        //The amount of rows/records loaded in the formview and the rows in the dataview object are the
                        //same so i can use the counter of the loop to set the index for the displayed page
                        FormView_Incidents.PageIndex = i;
                        //The DataBind is necessary otherwise the formview won't display the desired record
                        FormView_Incidents.DataBind();
                    }
                }
            }
        }


        //
        //BTN GO TO UPDATE FORM CLICK
        /// <summary>
        /// Load the update form with the selected incident details and set the displayed view on the update incident view
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnGoToUpdateForm_Click(object sender, EventArgs e)
        {
            //Set the update form
            setUpdateForm();
            //Display the update incident view page
            this.Incidents_MultiView.ActiveViewIndex = 2;
        }


        //
        //BTN BACK TO LIST
        /// <summary>
        /// Bring back to the incident view list page from the view incident details page
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnBackToList_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 0;
        }


        #endregion VIEW INCIDENT DETAILS


        //
        //UPDATE INCIDENT
        //
        #region UPDATE INCIDENT


        //
        //BTN UPDATE CLICK
        /// <summary>
        /// Perform the updating of the selected incident in the database and then refresh the gridview and the formview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                //Call the Update method of SqlDataSource_FormViewIncident which executes the update query updating the 
                //selected record
                SqlDataSource_FormViewIncident.Update();
                //Call the DataBind method for both the gridview and the formview refreshing the incident with the new changes 
                GridView_Incidents.DataBind();
                FormView_Incidents.DataBind();
                //Display the view incident details page
                this.Incidents_MultiView.ActiveViewIndex = 1;
                //Reset the form
                ResetUpdateForm();
            }
            catch (InvalidOperationException ex)
            {
                Session["Exception"] = ex;
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
            }
        }


        //
        //DATE FORMAT
        /// <summary>
        /// Parse the object passed as parameter as datetime; if all good it returns the parsed value as formatted string
        /// otherwise it returns it as is.
        /// </summary>
        /// <param name="input">The object to be parsed as date (dd/MM/yyyy)</param>
        /// <returns></returns>
        protected string DateFormat(object input)
        {
            DateTime dt;
            string output = string.Empty;

            //If the TryParse method is successfull it pass to the datetime var the string
            bool ok = DateTime.TryParse(input.ToString(), out dt);

            //In case all good
            if (ok)
            //Convert back to string the date formatting it as dd/MM/yyyy
            { output = dt.ToString("dd/MM/yyyy"); }
            //Prevent eventual null reference exceptions in case input is null
            else if (input == null) { return string.Empty; }
            //If the conversion is not all right it passes as output the parameter untouched
            else { output = input.ToString(); }

            return output;
        }


        //
        //SET UPDATE FORM
        /// <summary>
        /// Set the update form by loading all the selected incident's detail into it
        /// </summary>
        protected void setUpdateForm()
        {
            //String vars to store the column name, the cell value and the textbox text
            string colName = string.Empty, cellValue = string.Empty, text = string.Empty;
            bool ok = false;

            //NB: it is necessary otherwise the DataItem will be null
            FormView_Incidents.DataBind();
            //Get all the records stored in the formview 
            DataRowView row = (DataRowView)this.FormView_Incidents.DataItem;
            //In case the datarowview contains the data
            if (row != null)
            {
                //Get the displayed page index (the one where the record to be updated is displayed)
                int index = (int)FormView_Incidents.PageIndex;
                //Get the count of how many cell are contained in one row
                int cellsCount = this.GridView_Incidents.SelectedRow.Cells.Count;

                //Declare a dictionary where the record's attributes will be paired with the gridview columns header as
                //keys
                Dictionary<string, string> selectedRow = new Dictionary<string, string>();

                //Populates the dictionary
                for (int i = 1; i < cellsCount - 1; i++)
                {
                    //Get the gridview's columns headers
                    colName = this.GridView_Incidents.Columns[i].HeaderText;
                    //Get the content of each cell
                    cellValue = row.DataView[index].Row[i].ToString();

                    //Little fix: the date uploaded in the formview once they are retrieved returns to the datetime format
                    //            and to fix this i call the DateFormat custom method which format all the date that are 
                    //            successfully parsed into the dd/MM/yyyy format. In all the other cases the values are returned
                    //            as they are.
                    cellValue = DateFormat(cellValue);
                    //Add the couples to the dictionary
                    selectedRow.Add(colName, cellValue);
                }

                //In this loop i take advantage of the fact that i placed both in the selectedRow dictionary, which
                //holds the record's details, and the ctrlList dictionary the gridview column's headers as keys:
                //in this way i can get precisely the right match for both the control and its associated value
                foreach (KeyValuePair<string, string> pair in selectedRow)
                {
                    //Get the value of each cell from the selectedRos dictionary and stores it in the text var
                    ok = selectedRow.TryGetValue(pair.Key, out text);

                    //If the value is successfully retrieved
                    if (ok)
                    {
                        //Initialize a flag textbox control
                        TextBox ctrl;
                        //Set the flag textbox with each textbox contained in the textboxes dictionary
                        ctrlList.TryGetValue(pair.Key, out ctrl);
                        //If the flag textboxes has been effectively set with a textbox
                        if (ctrl is TextBox)
                        {
                            //Set its text property with the value retrieved from the selectedRow dictionary
                            if (text != "&nbsp;") { (ctrl as TextBox).Text = text; }
                        }
                    }
                }
                //Refresh both the products and the techs dropdownlist so that they will diplay all the product registered 
                //to the selected customer and all the available tech level 2 ordered in descendant order according the
                //amount of incidents assigned to each one.

                //NB: in the tech dropdownlist the selected item is the tech assigned to the record to be updated
                DdlProds.DataBind();
                DdlTech.DataBind();
                //Dispose the dictionary
                selectedRow = null;
            }
        }


        //
        //DDLTECH DATABOUND
        /// <summary>
        /// Event fired once the dropdownlist is bound to its sqldatasource or when the DataBind method is called against
        /// the dropdownlist
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DdlTech_DataBound(object sender, EventArgs e)
        {
            //Get the text from the tech textbox
            string tech = TxtTech.Text;
            //If tech is not null or "Not Set", default value when the tech is not set
            if (!String.IsNullOrEmpty(tech) && tech != "Not Set")
            //Find the item in the dropdownlist that matches with the tech name contained in the tech textbox
            {
                //If the item is found, so not null, it is set to selected
                ListItem item = DdlTech.Items.FindByText(tech);
                if (item != null) { item.Selected = true; }
            }
        }


        //
        //BTN BACK TO VIEW DETAILS
        /// <summary>
        /// Bring back to the view incident details from the update form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnBackToViewDetails_Click(object sender, EventArgs e)
        {
            this.Incidents_MultiView.ActiveViewIndex = 1;
        }


        //
        //RESET UPDATE FORM
        /// <summary>
        /// Clear all the controls in the update form
        /// </summary>
        protected void ResetUpdateForm()
        {
            foreach (KeyValuePair<string, TextBox> pair in ctrlList)
            {
                //Clear all the textboxes text
                if (pair.Value is TextBox)
                {
                    (pair.Value as TextBox).Text = string.Empty;
                }
                //Delete all the products from the products dropdownlist
                this.DdlProds.Items.Clear();
                this.DdlProds.SelectedIndex = -1;
                //Reset the tech dropdownlist
                this.DdlTech.SelectedIndex = 0;
            }
        }



        #endregion UPDATE INCIDENT


        //
        //CREATE NEW INCIDENT
        //
        #region CREATE NEW INCIDENT


        //
        //DDL CLIENT DATABOUND
        /// <summary>
        /// Once the clients dropdownlist has been loaded with the customers it retrieves for the first one all their 
        /// products and it put them in the products dropdownlist
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DdlClient_NewIncident_DataBound(object sender, EventArgs e)
        {
            //Refresh the products dropdownlist with all the products registered to the customer selected in the customers
            //dropdownlist
            DdlProds_NewIncident.DataBind();
        }


        //
        //RESET NEW INCIDENT FORM
        /// <summary>
        /// Reset all the controls in the create new incident form
        /// </summary>
        protected void resetNewIncidentForm()
        {
            DdlClient_NewIncident.SelectedIndex = 0;
            DdlProds_NewIncident.SelectedIndex = 0;
            DdlTech_NewIncident.SelectedIndex = 0;
            TxtTitle_NewIncident.Text = String.Empty;
            TxtDescr_NewIncident.Text = String.Empty;
            TxtOpened_NewIncident.Text = String.Empty;
            TxtClosed_NewIncident.Text = String.Empty;
        }


        //
        //BTN CRAETE NEW INCIDENT CLICK
        /// <summary>
        /// Insert the new record in the database and update the gridview and formview accordingly
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnCreateNewIncident_Click(object sender, EventArgs e)
        {
            try
            {
                //Call the Insert method against the SqlDataSource_Incidents which then updates the database
                SqlDataSource_Incidents.Insert();
                //Refresh both the gridview and formview with the new incident
                GridView_Incidents.DataBind();
                FormView_Incidents.DataBind();
                //Bring back to the incident list page
                this.Incidents_MultiView.ActiveViewIndex = 0;
                //Reset the form
                resetNewIncidentForm();
            }
            catch (InvalidOperationException ex)
            {
                Session["Exception"] = ex;
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
            }
        }


        //
        //BTN REFRESH CLICK
        /// <summary>
        /// Reset the form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnRefresh_NewIncident_Click(object sender, EventArgs e)
        {
            resetNewIncidentForm();
        }


        //
        //DDL CLIENT NEW INCIDENT SELECTED INDEX CHANGED
        /// <summary>
        /// When a customer is selected it refresh the products dropdownlist so that it displays the products for that
        /// particular customer
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DdlClient_NewIncident_SelectedIndexChanged(object sender, EventArgs e)
        {
            DdlProds_NewIncident.DataBind();
        }


        #endregion CREATE NEW INCIDENT












        //
        //
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DdlProds_DataBound(object sender, EventArgs e)
        {

        }




        













    }
}