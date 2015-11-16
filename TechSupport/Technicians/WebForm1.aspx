<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TechSupport.Technicians.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br/><br/><br/>
    
    <div >
        <table>
            <tr>
                <td aria-orientation="horizontal" valign="top">
                   <asp:Menu ID="IncidentMenu" 
                             runat="server"  
                             StaticMenuItemStyle-CssClass="tab"
                             StaticSelectedStyle-CssClass="selectedtab" 
                             CssClass="menu" 
                             OnMenuItemClick="IncidentMenu_MenuItemClick">

                         <%-- LIST OF THE LINK FOR EACH TAB --%>
                        <Items>
                            <asp:MenuItem  Text="Incidents List" Value="0" Selected="true"></asp:MenuItem>
                            <asp:MenuItem Text="View Details" Value="1"></asp:MenuItem>   
                            <asp:MenuItem Text="Update Incident" Value="2"></asp:MenuItem> 
                            <asp:MenuItem Text="Create Incident" Value="3"></asp:MenuItem>          
                        </Items>
                    </asp:Menu>
                </td>
                <td>
                           <%-- MULTIVIEW CONTROL --%>
                           <asp:MultiView ID="Incidents_MultiView" ActiveViewIndex="0" runat="server">

                            <%-- INCIDENT LIST PAGE --%>
                                <asp:View ID="IncidentList" runat="server">

                                    <asp:ScriptManager ID="ScriptManager_Incidents" runat="server"></asp:ScriptManager>

                                    <div align="center">
                                        <asp:GridView ID="GridView_Incidents" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="grid-view" DataKeyNames="IncidentID" DataSourceID="SqlDataSource_Incidents" Height="225px" OnPreRender="GridView_Incidents_PreRender" OnRowCreated="Grid_ViewIncidents_RowCreated" OnSelectedIndexChanged="Grid_ViewIncidents_SelectedIndexChanged" PageSize="15">
                                                    <Columns>
                                                        <%-- INCIDENT ID --%>
                                                        <asp:BoundField DataField="IncidentID" HeaderStyle-CssClass="hideColumn" HeaderText="IncidentID" ItemStyle-CssClass="hideColumn">
                                                        <HeaderStyle CssClass="hideColumn" />
                                                        <ItemStyle CssClass="hideColumn" />
                                                        </asp:BoundField>
                                                        <%-- CUSTOMER --%>
                                                        <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                                                        <%-- PRODUCT --%>
                                                        <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
                                                        <%-- TITLE --%>
                                                        <asp:BoundField DataField="Title" HeaderStyle-CssClass="hideColumn" HeaderText="Title" ItemStyle-CssClass="hideColumn" SortExpression="Title">
                                                        <HeaderStyle CssClass="hideColumn" />
                                                        <ItemStyle CssClass="hideColumn" />
                                                        </asp:BoundField>
                                                        <%-- DESCRIPTION --%>
                                                        <asp:BoundField DataField="Description" HeaderStyle-CssClass="hideColumn" HeaderText="Description" ItemStyle-CssClass="hideColumn" SortExpression="Description">
                                                        <HeaderStyle CssClass="hideColumn" />
                                                        <ItemStyle CssClass="hideColumn" />
                                                        </asp:BoundField>
                                                        <%-- TECHNICIAN --%>
                                                        <asp:BoundField DataField="Technician" HeaderText="Technician" SortExpression="Technician" />
                                                        <%-- DATE OPENED 
                                        DataFormatString="{0:d}" formats the date to dd/MM/yy otherwise it would show the time as well   --%>
                                                        <asp:BoundField DataField="Date Opened" DataFormatString="{0:d}" HeaderText="Date Opened" HtmlEncode="false" SortExpression="Date Opened" />
                                                        <asp:BoundField DataField="Date Closed" DataFormatString="{0:d}" HeaderText="Date Closed" HtmlEncode="false" SortExpression="Date Closed" />
                                                        <%-- SELECT BTN COLUMN --%>
                                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                                                    </Columns>
                                                    <EditRowStyle Wrap="False" />
                                                    <PagerSettings PageButtonCount="25" />
                                                    <RowStyle Wrap="False" />
                                                    <SelectedRowStyle Wrap="False" />
                                                </asp:GridView>
                                        <br />
                                        <%--GRIDVIEW_INCIDENTS--%>

                                        <br />
                                    </div>

                                    <div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:SqlDataSource ID="SqlDataSource_Incidents" runat="server"

                                                
                                                        ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
                                                
                                                        SelectCommand="SELECT i.IncidentID, 
                                                                              c.Name AS Customer, 
                                                                              p.Name AS Product, 
                                                                              i.Title, 
                                                                              i.Description, 
                                                                              t.Name AS Technician, 
                                                                              i.DateOpened AS 'Date Opened', 
                                                                              i.DateClosed as 'Date Closed'
                                                                       FROM Customers AS c 
                                                                       INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
                                                                       INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
                                                                       INNER JOIN Technicians AS t ON i.TechID = t.TechID
                                                                       ORDER BY Customer ASC"

                                                        UpdateCommand="UPDATE Incidents
                                                                       SET CustomerID = (	
				                                                                            SELECT c.CustomerID
				                                                                            FROM Customers as c
				                                                                            WHERE c.Name = @ClientName
			                                                                             ), 
	                                                                       ProductCode = (
				                                                                            SELECT p.ProductCode 
				                                                                            FROM Products as p
				                                                                            WHERE p.Name = @ProdName
			                                                                              ), 
	                                                                       TechID =	      (
				                                                                            SELECT t.TechID 
				                                                                            FROM Technicians as t
				                                                                            WHERE t.Name = @TechName
			                                                                              ), 
	                                                                       DateOpened = Convert(datetime, @Opened, 103), 
	                                                                       DateClosed = Convert(datetime, @Closed, 103), 
	                                                                       Title = @Title, 
	                                                                       Description = @Descr
                                                                       WHERE IncidentID = @IncidentID;">

                                                        <UpdateParameters>
                                                            <asp:ControlParameter ControlID="TxtCustName" Name="ClientName" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtProdName" Name="ProdName" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtTech" Name="TechName" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtOpened" Name="Opened" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtClosed" Name="Closed" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtTitle" Name="Title" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="TxtDescr" Name="Descr" PropertyName="Text" Type="String" />
                                                            <asp:ControlParameter ControlID="GridView_Incidents" Name="IncidentID" PropertyName="SelectedValue" Type="Int32" />
                                                        </UpdateParameters>

                                                    </asp:SqlDataSource>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>

                                </asp:View>
                                <%-- END INCIDENTS LIST TAB --%>


                       
                                <%-- VIEW INCIDENT DETAILS TAB --%>   
                                <asp:View ID="ViewDetails" runat="server">

                                    <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="IncidentID" DataSourceID="SqlDataSource_Incidents">
                                        <EditItemTemplate>
<%--                                            IncidentID:
                                            <asp:Label ID="IncidentIDLabel1" runat="server" Text='<%# Eval("IncidentID") %>' />
                                            <br />
                                            Customer:
                                            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                                            <br />
                                            Product:
                                            <asp:TextBox ID="ProductTextBox" runat="server" Text='<%# Bind("Product") %>' />
                                            <br />
                                            Title:
                                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                            <br />
                                            Description:
                                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                            <br />
                                            Technician:
                                            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                                            <br />
                                            Date Opened:
                                            <asp:TextBox ID="Date_OpenedTextBox" runat="server" Text='<%# Bind("[Date Opened]") %>' />
                                            <br />
                                            Date Closed:
                                            <asp:TextBox ID="Date_ClosedTextBox" runat="server" Text='<%# Bind("[Date Closed]") %>' />
                                            <br />--%>
                                            <table class="table">
                                                <tr>
                                                    <td>Customer:</td>
                                                    <td><asp:Label ID="CustomerLabel" runat="server" Text='<%# Bind("Customer") %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Product:</td>
                                                    <td><asp:Label ID="ProductLabel" runat="server" Text='<%# Bind("Product") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Title:</td>
                                                    <td><asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Description:</td>
                                                    <td><asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Technician:</td>
                                                    <td><asp:Label ID="TechnicianLabel" runat="server" Text='<%# Bind("Technician") %>' />
                                    <asp:DropDownList ID="DropDownList2" 
                                                      runat="server" 
                                                      DataSourceID="SqlDataSource_TechsList" 
                                                      DataTextField="Technician" 
                                                      DataValueField="TechID">
                                    </asp:DropDownList>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Date Opened:</td>
                                                    <td><asp:Label ID="Date_OpenedLabel" runat="server" Text='<%# Bind("[Date Opened]", "{0:d}") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Date Closed:</td>
                                                    <td><asp:Label ID="Date_ClosedLabel" runat="server" Text='<%# Bind("[Date Closed]", "{0:d}") %>' /></td>
                                                </tr>
                                            </table>
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            Customer:
                                            <asp:TextBox ID="CustomerTextBox" runat="server" Text='<%# Bind("Customer") %>' />
                                            <br />
                                            Product:
                                            <asp:TextBox ID="ProductTextBox" runat="server" Text='<%# Bind("Product") %>' />
                                            <br />
                                            Title:
                                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                            <br />
                                            Description:
                                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                            <br />
                                            Technician:
                                            <asp:TextBox ID="TechnicianTextBox" runat="server" Text='<%# Bind("Technician") %>' />
                                            <br />
                                            Date Opened:
                                            <asp:TextBox ID="Date_OpenedTextBox" runat="server" Text='<%# Bind("[Date Opened]") %>' />
                                            <br />
                                            Date Closed:
                                            <asp:TextBox ID="Date_ClosedTextBox" runat="server" Text='<%# Bind("[Date Closed]") %>' />
                                            <br />
                                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <table class="table">
                                                <tr>
                                                    <td>Customer:</td>
                                                    <td><asp:Label ID="CustomerLabel" runat="server" Text='<%# Bind("Customer") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Product:</td>
                                                    <td><asp:Label ID="ProductLabel" runat="server" Text='<%# Bind("Product") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Title:</td>
                                                    <td><asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Description:</td>
                                                    <td><asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Technician:</td>
                                                    <td><asp:Label ID="TechnicianLabel" runat="server" Text='<%# Bind("Technician") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Date Opened:</td>
                                                    <td><asp:Label ID="Date_OpenedLabel" runat="server" Text='<%# Bind("[Date Opened]", "{0:d}") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td>Date Closed:</td>
                                                    <td><asp:Label ID="Date_ClosedLabel" runat="server" Text='<%# Bind("[Date Closed]", "{0:d}") %>' /></td>
                                                </tr>
                                            </table>
                                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                        </ItemTemplate>
                                    </asp:FormView>


                                    <asp:DropDownList ID="DropDownList1" 
                                                      runat="server" 
                                                      DataSourceID="SqlDataSource_TechsList" 
                                                      DataTextField="Technician" 
                                                      DataValueField="TechID">
                                    </asp:DropDownList>
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
                                    <br />


                                    <table>
                                        <tr>
                                            <td><asp:SqlDataSource ID="SqlDataSource_TechsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT t.TechID, t.Name AS Technician,  
(count(i.IncidentID)) AS 'Assigned Incidents'
FROM Incidents AS i
INNER JOIN Technicians AS t ON i.TechID = t.TechID
WHERE T.Employed = 0
GROUP BY t.TechID, t.Name
ORDER BY 'Assigned Incidents' DESC
"></asp:SqlDataSource></td>
                                            <td><asp:SqlDataSource ID="SqlDataSource_ClientsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT DISTINCT c.Name
FROM Customers AS c
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Registrations as r on c.CustomerID = r.CustomerID
WHERE r.Subscribed = 0;"></asp:SqlDataSource></td>
                                            <td><asp:SqlDataSource ID="SqlDataSource_ProdsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT p.ProductCode as 'Product Code', p.Name as 'Product Name'
FROM Products AS p
WHERE Supported = 0;"></asp:SqlDataSource></td>
                                        </tr>
                                    </table>
                                    


                                </asp:View>
                                <%-- END VIEW INCIDENT DETAILS TAB --%>

                                <%-- UPDATE INCIDENT TAB --%>
                                <asp:View ID="UpdateIncident" runat="server">


                                    <asp:UpdatePanel ID="UpdatePanel_IncidentDetails" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <br />
                                            <div align="center">
                                                <table class="table" aria-orientation="horizontal">
                                                <tr>
                                                    <td class="auto-style17" colspan="5" style="align-content:center">
                                                        <h5>INCIDENT DETAILS</h5>
                                                    </td>
                                                    <td class="auto-style1">&nbsp;</td>
                                                    <td class="auto-style1">

                                                        <%-- DROP DOWN LIST ACTIONS --%>
                                                        <asp:DropDownList ID="DDLActions" runat="server" AutoPostBack="True" Enabled="False" Height="26px" OnSelectedIndexChanged="DDLActions_SelectedIndexChanged" Width="150px">
                                                            <asp:ListItem Selected="True">Choose an action</asp:ListItem>
                                                            <asp:ListItem>Create New</asp:ListItem>
                                                            <asp:ListItem>Update</asp:ListItem>
                                                            <asp:ListItem>View</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style17" style="align-content:center">
                                                        <asp:Label ID="LblTitle" runat="server" Text="Title"></asp:Label>
                                                    </td>
                                                    <td class="auto-style17" style="align-content:center">&nbsp;</td>
                                                    <td class="auto-style1">
                                                        <asp:TextBox ID="TxtTitle" runat="server" BackColor="White" Enabled="False" Height="20px" Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td class="auto-style20">&nbsp;</td>
                                                    <td class="auto-style1">
                                                        <asp:Label ID="LblCustomer" runat="server" Text="Customer Name"></asp:Label>
                                                    </td>
                                                    <td class="auto-style1">&nbsp;</td>
                                                    <td class="auto-style1">
                                                        <asp:TextBox ID="TxtCustName" runat="server" BackColor="White" Enabled="False" Height="20px" onkeydown="javascript: ChangeSize(this);" Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style18">
                                                        <asp:Label ID="LblDescr" runat="server" Text="Description"></asp:Label>
                                                    </td>
                                                    <td class="auto-style18">&nbsp;</td>
                                                    <td class="auto-style8" rowspan="4">
                                                        <asp:TextBox ID="TxtDescr" runat="server" BackColor="White" Enabled="False" Height="104px" TextMode="MultiLine" Width="197px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td class="auto-style21" rowspan="4">&nbsp;</td>
                                                    <td class="auto-style7">
                                                        <asp:Label ID="LblProduct" runat="server" Text="Product Name"></asp:Label>
                                                    </td>
                                                    <td class="auto-style7"></td>
                                                    <td class="auto-style7">
                                                        <asp:TextBox ID="TxtProdName" runat="server" BackColor="White" Enabled="False" Height="20px"  Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="True" Text="Supported"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style18">&nbsp;</td>
                                                    <td class="auto-style18">&nbsp;</td>
                                                    <td class="auto-style10">
                                                        <asp:Label ID="LblTech" runat="server" Text="Assigned Technician"></asp:Label>
                                                    </td>
                                                    <td class="auto-style10"></td>
                                                    <td class="auto-style10">
                                                        <asp:TextBox ID="TxtTech" runat="server" BackColor="White" Enabled="False" Height="20px" Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style18"></td>
                                                    <td class="auto-style18">&nbsp;</td>
                                                    <td class="auto-style8">
                                                        <asp:Label ID="LblDateOpen" runat="server" Text="Opened Date"></asp:Label>
                                                    </td>
                                                    <td class="auto-style8">&nbsp;</td>
                                                    <td class="auto-style8">
                                                        <asp:TextBox ID="TxtOpened" runat="server" BackColor="White" Enabled="False" Height="20px" Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style18">
                                                        &nbsp;</td>
                                                    <td class="auto-style18">&nbsp;</td>
                                                    <td class="auto-style8">
                                                        <asp:Label ID="LblClosed" runat="server" Text="Closed Date"></asp:Label>
                                                    </td>
                                                    <td class="auto-style8">&nbsp;</td>
                                                    <td class="auto-style8">
                                                        <asp:TextBox ID="TxtClosed" runat="server" BackColor="White" Enabled="False" Height="20px"  Width="150px" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style18" rowspan="2">&nbsp;</td>
                                                    <td class="auto-style18" rowspan="2">&nbsp;</td>
                                                    <td class="auto-style21">
                                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Width="114px" />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                            </div>
                                            <br />
                                            <br />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="GridView_Incidents" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>


                            </asp:View>   
                                <%-- END UPDATE INCIDENT TAB --%>
                       
                                <%-- CREATE INCIDENT TAB --%>   
                                <asp:View ID="CreateIncident" runat="server">

                                </asp:View>
                                <%-- CREATE VIEW INCIDENT DETAILS TAB --%>
                            </asp:MultiView>
                </td>
            </tr>


            <tr>
                <td aria-orientation="horizontal" valign="top">
                    &nbsp;</td>
                <td>
                           &nbsp;</td>
            </tr>


        </table>
    </div>
</asp:Content>
