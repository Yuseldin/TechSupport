<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewIncidents.aspx.cs" Inherits="TechSupport.ViewIncidents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:ScriptManager ID="ScriptManager_Incidents" runat="server">
        </asp:ScriptManager>
        <div align="center">
            <p>

            <%--GRIDVIEW_INCIDENTS--%>
            
            <asp:GridView ID=                       "GridView_Incidents"
                          runat=                    "server" 
                          AutoGenerateColumns=      "False" 
                          DataSourceID=             "SqlDataSource_Incidents" 
                          OnSelectedIndexChanged=   "Grid_ViewIncidents_SelectedIndexChanged" 
                          OnRowCreated=             "Grid_ViewIncidents_RowCreated" 
                          Height=                   "225px" 
                          AllowPaging=              "True" 
                          DataKeyNames=             "IncidentID" 
                          OnPreRender=              "GridView_Incidents_PreRender" 
                          PageSize=                 "15" 
                          CssClass=                 "grid-view"
            >   
                <Columns>
                    <%-- INCIDENT ID --%>
                    <asp:BoundField DataField="IncidentID"   
                                    HeaderText="IncidentID" 
                                    HeaderStyle-CssClass="hideColumn" 
                                    ItemStyle-CssClass="hideColumn" >
                            <HeaderStyle CssClass="hideColumn"></HeaderStyle>
                            <ItemStyle   CssClass="hideColumn"></ItemStyle>
                    </asp:BoundField>

                    <%-- CUSTOMER --%>
                    <asp:BoundField DataField="Customer" 
                                    HeaderText="Customer" 
                                    SortExpression="Customer" >
                    </asp:BoundField>

                    <%-- PRODUCT --%>
                    <asp:BoundField DataField="Product" 
                                    HeaderText="Product" 
                                    SortExpression="Product" >
                    </asp:BoundField>

                    <%-- TITLE --%>
                    <asp:BoundField DataField="Title" 
                                    HeaderText="Title" 
                                    SortExpression="Title" 
                                    HeaderStyle-CssClass = "hideColumn" 
                                    ItemStyle-CssClass="hideColumn" >
                            <HeaderStyle CssClass="hideColumn"></HeaderStyle>
                            <ItemStyle   CssClass="hideColumn"></ItemStyle>
                    </asp:BoundField>

                    <%-- DESCRIPTION --%>
                    <asp:BoundField DataField="Description" 
                                    HeaderText="Description" 
                                    SortExpression="Description" 
                                    HeaderStyle-CssClass = "hideColumn" 
                                    ItemStyle-CssClass="hideColumn" >
                            <HeaderStyle CssClass="hideColumn"></HeaderStyle>
                            <ItemStyle   CssClass="hideColumn"></ItemStyle>
                    </asp:BoundField>

                    <%-- TECHNICIAN --%>
                    <asp:BoundField DataField="Technician" 
                                    HeaderText="Technician" 
                                    SortExpression="Technician" >
                    </asp:BoundField>

                    <%-- DATE OPENED 
                    DataFormatString="{0:d}" formats the date to dd/MM/yy otherwise it would show the time as well   --%>
                    <asp:BoundField DataField="Date Opened" 
                                    HeaderText="Date Opened" 
                                    SortExpression="Date Opened"
                                    DataFormatString="{0:d}"                         
                                    HtmlEncode ="false">
                    </asp:BoundField>
                    <asp:BoundField DataField="Date Closed" 
                                    HeaderText="Date Closed" 
                                    SortExpression="Date Closed"
                                    DataFormatString="{0:d}" 
                                    HtmlEncode ="false">
                    </asp:BoundField>

                    <%-- SELECT BTN COLUMN --%>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" />
                </Columns>

                <EditRowStyle     Wrap="False" />
                <PagerSettings PageButtonCount="25" />
                <RowStyle         Wrap="False" />
                <SelectedRowStyle Wrap="False" />
            </asp:GridView>
        <br />
    </p>
        </div>
    <style type="text/css">
        #actionDdl
        {
            width: 150px;
        }
        .auto-style1
    {
        height: 20px;
    }
        .auto-style17
        {
            height: 20px;
        }
        .auto-style20
        {
            height: 20px;
            width: 5px;
        }
        .auto-style18
        {
            width: 10px;
        }
        .auto-style21
        {
            width: 5px;
        }
        .auto-style10
        {
            height: 19px;
        }
        .auto-style22
        {
            width: 100%;
        }
        .auto-style23
        {
            width: 238px;
        }
    </style>    
    
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
    
    <p>
        &nbsp;</p>
    <table class="auto-style22">
        <tr>
            <td class="auto-style23">
        <asp:SqlDataSource ID="SqlDataSource_Incidents" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" 
                           
                           SelectCommand= "SELECT i.IncidentID, 
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
            
                           UpdateCommand= "UPDATE Incidents
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
                <asp:ControlParameter ControlID="TxtCustName" Name="ClientName" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="TxtTech" Name="TechName" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="TxtProdName" Name="ProdName" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="TxtOpened" Name="Opened" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="TxtClosed" Name="Closed" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="TxtTitle" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TxtDescr" Name="Descr" PropertyName="Text" Type="String"/>
                <asp:ControlParameter ControlID="GridView_Incidents" Name="IncidentID" PropertyName="SelectedValue" Type="Int32"/>
            </UpdateParameters>
        </asp:SqlDataSource>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style23">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23">&nbsp;</td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <br />
    <br />
    </asp:Content>
