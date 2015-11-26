<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewIncidents.aspx.cs" Inherits="TechSupport.Technicians.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style24 {
            height: 21px;
        }
        .auto-style25 {
            height: 21px;
            width: 5px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br/>
    <br/>
    <table style="margin: auto; vertical-align: middle;">
        <tr>
            <td style="vertical-align: top;"></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <table style="vertical-align: middle; margin: auto; width: 100%">
                            <tr>
                                <td>
                                    <%-- LIST OF THE LINK FOR EACH TAB --%>
                                    <asp:MultiView ID="Incidents_MultiView" 
                                                   ActiveViewIndex="0" 
                                                   runat="server" 
                                    >
                                        <%-- INCIDENT LIST PAGE --%>
                                        <asp:View ID="IncidentList" runat="server" >

                                            <div>
                                                <table>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <asp:Label ID="LblNewIncident" runat="server" Font-Bold="True" Text="Open New Incident"></asp:Label>
                                                        </td>
                                                        <td class="auto-style18">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:Button ID="BtnNewIncident" runat="server" OnClick="BtnNewIncident_Click" Text="Submit" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>

                                            <br/><br/>

                                            <div align="center">
                                                <asp:GridView ID="GridView_Incidents" 
                                                              runat="server" 
                                                              AllowPaging="True" 
                                                              AutoGenerateColumns="False" 
                                                              CssClass="grid-view" 
                                                              DataKeyNames="IncidentID" 
                                                              DataSourceID="SqlDataSource_Incidents" 
                                                              OnRowCreated="GridView_Incidents_RowCreated" 
                                                              OnSelectedIndexChanged="GridView_Incidents_SelectedIndexChanged" 
                                                              PageSize="15" 
                                                              Font-Bold="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                                    <Columns>

                                                        <%-- INCIDENT ID --%>
                                                        <asp:BoundField DataField="IncidentID" 
                                                                        HeaderStyle-CssClass="hideColumn" 
                                                                        HeaderText="IncidentID" 
                                                                        ItemStyle-CssClass="hideColumn"
                                                        >
                                                            <HeaderStyle CssClass="hideColumn" />
                                                            <ItemStyle CssClass="hideColumn" />
                                                        </asp:BoundField>

                                                        <%-- CUSTOMER --%>
                                                        <asp:BoundField DataField="Customer" 
                                                                        HeaderText="Customer" 
                                                                        SortExpression="Customer" 
                                                        />

                                                        <%-- PRODUCT --%>
                                                        <asp:BoundField DataField="Product" 
                                                                        HeaderText="Product" 
                                                                        SortExpression="Product" 
                                                        />

                                                        <%-- TITLE --%>
                                                        <asp:BoundField DataField="Title" 
                                                                        HeaderText="Title" 
                                                                        SortExpression="Title"
                                                        />

                                                        <%-- DESCRIPTION --%>
                                                        <asp:BoundField DataField="Description" 
                                                                        HeaderStyle-CssClass="hideColumn" 
                                                                        HeaderText="Description" 
                                                                        ItemStyle-CssClass="hideColumn" 
                                                                        SortExpression="Description">
                                                            <HeaderStyle CssClass="hideColumn" />
                                                            <ItemStyle CssClass="hideColumn" />
                                                        </asp:BoundField>

                                                        <%-- TECHNICIAN --%>
                                                        <asp:BoundField DataField="Technician" 
                                                                        HeaderText="Technician" 
                                                                        SortExpression="Technician" 
                                                        />

                                                        <%-- DATE OPENED --

                                                        NB: DataFormatString="{0:d}" formats the date to dd/MM/yy 
                                                            otherwise it would show the time as well   --%>
                                                        
                                                        <asp:BoundField DataField="Date Opened" 
                                                                        DataFormatString="{0:d}" 
                                                                        HeaderText="Date Opened" 
                                                                        HtmlEncode="false" 
                                                                        SortExpression="Date Opened" 
                                                        />

                                                        <%-- DATE CLOSED --%>
                                                        <asp:BoundField DataField="Date Closed" 
                                                                        DataFormatString="{0:d}" 
                                                                        HeaderText="Date Closed" 
                                                                        HtmlEncode="false" 
                                                                        SortExpression="Date Closed" 
                                                        />
                                                        
                                                        <%-- SELECT BTN COLUMN --%>
                                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />

                                                    </Columns>

                                                    <EditRowStyle Wrap="False" />

                                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />

                                                    <PagerSettings PageButtonCount="25" 
                                                                   NextPageText="Next" 
                                                                   PreviousPageText="Prev" />

                                                    <PagerStyle
                                                                Font-Size="Small" 
                                                                HorizontalAlign="Center" 
                                                                ForeColor="Black" BackColor="#999999" />
                                                    <RowStyle Wrap="False" BackColor="#EEEEEE" ForeColor="Black" />
                                                    <SelectedRowStyle Wrap="False" BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                                </asp:GridView>
                                            </div>

                                        </asp:View>
                                        <%-- END INCIDENTS LIST TAB --%>


                                        <%-- VIEW INCIDENT DETAILS TAB --%>
                                        <asp:View ID="ViewDetails" runat="server">


                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Text="View Incident Details:"></asp:Label></strong>
                                            <hr/>
                                            <asp:Label ID="Label2" runat="server" Text="This section illustrates all the details relatively to the incident selected from the table in the previous page.
                                                Also it displays all the other incidents for the chosen customer, giving the user the possibility both to navigate
                                                between them and to perform update operations.">
                                            </asp:Label>
                                            <hr/>

                                            <br/><br/>
                                            <div align="center">

                                                <%-- FORM VIEW INCIDENTS --%>
                                                <asp:FormView ID="FormView_Incidents" 
                                                              runat="server"
                                                              DataSourceID="SqlDataSource_FormViewIncident" 
                                                              AllowPaging="True" 
                                                              DataKeyNames="IncidentID" 
                                                >

                                                    <%-- PAGER --%>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <%-- I had to apply inline to each cell the same color of the background to make them transparent, because otherwise
                                                                     it doesn't see the css class from the stylesheet  
                                                                --%>
                                                                <td style="background-color: #e5e4e2;">

                                                                <%-- CUSTOMER NAME --%>
                                                                    <h2><strong><%# Eval("Customer") %>
                                                                </td>
                                                                <td style="width: 100px;"></td>

                                                                <%-- BUTTONS UPDATE AND BACK TO INCIDENT LIST --%>
                                                                <td style="background-color: #e5e4e2; text-align: right;">
                                                                    <asp:Button ID="BtnGoToUpdateForm" runat="server" OnClick="BtnGoToUpdateForm_Click" Text="Update" Width="100px" />
                                                                </td>
                                                                <td style="background-color: #e5e4e2;"></td>
                                                                <td style="background-color: #e5e4e2;">
                                                                    <asp:Button ID="BtnBackToList" runat="server" OnClick="BtnBackToList_Click" 
                                                                        Text="Incidents List" Width="100px" />
                                                                </td>

                                                                <%-- NB: LEAVE THIS TAG HERE OR OTHERWISE THE CLIENT NAME AND THE BUTTONS WON'T STAY ALLIGNED --%>
                                                                </strong>
                                                            </tr>
                                                            <caption>
                                                                <h2>
                                                                </h2>
                                                                </tr>
                                                            </caption>
                                                        </table>

                                                        <br/>
                                                    
                                                        <table class="table">
                                                            <caption>

                                                                <%-- PRODUCT --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Product:</td>
                                                                    <td>
                                                                        <asp:Label ID="ProductLabel" runat="server" Text='<%# Bind("Product") %>' />
                                                                    </td>
                                                                </tr>

                                                                <%-- TITLE --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Title:</td>
                                                                    <td>
                                                                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                                                                    </td>
                                                                </tr>

                                                                <%-- DESCRIPTION --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Description:</td>
                                                                    <td>
                                                                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' Width="500px" />
                                                                    </td>
                                                                </tr>

                                                                <%-- TECHNICIAN --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Technician:</td>
                                                                    <td>
                                                                        <asp:Label ID="TechnicianLabel" runat="server" Text='<%# Bind("Technician") %>' />
                                                                    </td>
                                                                </tr>

                                                                <%-- DATE OPENED --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Date Opened:</td>
                                                                    <td>
                                                                        <asp:Label ID="Date_OpenedLabel" runat="server" Text='<%# Bind("[Date Opened]", "{0:d}") %>' />
                                                                    </td>
                                                                </tr>

                                                                <%-- DATE CLOSED --%>
                                                                <tr>
                                                                    <td style="font-weight: bold; 
                                                                        background-color: #00b2b3; 
                                                                        color: black; 
                                                                        text-decoration: underline;">Date Closed:</td>
                                                                    <td>
                                                                        <asp:Label ID="Date_ClosedLabel" runat="server" Text='<%# Bind("[Date Closed]", "{0:d}") %>' />
                                                                    </td>
                                                                </tr>

                                                            </caption>
                                                        </table>

                                                    </ItemTemplate>

                                                    <PagerSettings NextPageText="Next" PreviousPageText="Prev" />
                                                    <PagerStyle Font-Size="Larger" />

                                                </asp:FormView>
                                            </div>
                                        </asp:View>
                                        <%-- END VIEW INCIDENT DETAILS TAB --%>


                                        <%-- UPDATE INCIDENT TAB --%>
                                        <asp:View ID="UpdateIncident" runat="server">
                                            <div>

                                                <strong>Update Incident:</strong>
                                                <hr />
                                                This section allows to update the selected incident and then redirect to the previous page where the user can keep nagivate and perform other operations.
                                                
                                                <br/><br/>

                                                   <asp:ValidationSummary 
                                                    ID="ValidationSummary1" 
                                                    runat="server" 
                                                    HeaderText="Following error occured:" 
                                                    ShowMessageBox="false" 
                                                    DisplayMode="BulletList" 
                                                    ShowSummary="true"
                                                    
                                                    Width="450"
                                                    ForeColor="Red"
                                                    />
                                                <hr />
                                            </div>
                                            <br />
                                            <div align="center">


                                                <table aria-orientation="horizontal">
                                                    <tr>
                                                        <td class="auto-style1">&nbsp;</td>
                                                        <td class="auto-style1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style17" style="align-content: center">
                                                            <asp:Label ID="LblTitle" runat="server" Text="Title" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style17" style="align-content: center">&nbsp;</td>
                                                        <td class="auto-style1">
                                                            <asp:TextBox ID="TxtTitle" runat="server" BackColor="White" Enabled="true" Height="20px" Width="250px" ForeColor="Black" onkeypress="return CheckLength(50, this);"></asp:TextBox>
                                                            <td class="auto-style20">&nbsp;
                                                                <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                                                                  ControlToValidate="TxtTitle"
                                                                  ErrorMessage="The incident title is a required field."
                                                                  ForeColor="Red" 
                                                                    EnableClientScript="true"
                                                                     display="None"
>
                                                                </asp:RequiredFieldValidator>

                                                            </td>
                                                            <td class="auto-style1">
                                                                <asp:Label ID="LblCustomer" runat="server" Text="Customer Name" Font-Bold="True"></asp:Label>
                                                            </td>
                                                            <td class="auto-style1">&nbsp;</td>
                                                            <td class="auto-style1">
                                                                <asp:TextBox ID="TxtCustName" runat="server" BackColor="White" Enabled="false" Height="20px" 
                                                                     Width="250px" ForeColor="Black" ></asp:TextBox>
                                                            </td>
                                                            <td>

                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style17" style="align-content: center">&nbsp;</td>
                                                        <td class="auto-style17" style="align-content: center">&nbsp;</td>
                                                        <td class="auto-style1" rowspan="6">
                                                            <asp:TextBox ID="TxtDescr" runat="server" BackColor="White" Enabled="true" ForeColor="Black" Height="104px" Style="resize: none" TextMode="MultiLine" Width="250px" onkeypress="return CheckLength(2000, this);"></asp:TextBox>
                                                                                                                            <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server"
                                                                  ControlToValidate="TxtDescr"
                                                                  ErrorMessage="The incident description is a required field."
                                                                  ForeColor="Red" 
                                                                     display="None"
                                                                     EnableClientScript="true"
             SetFocusOnError="true">
                                                                </asp:RequiredFieldValidator>

                                                             <td class="auto-style20">&nbsp;</td>
                                                            <td class="auto-style1">&nbsp;</td>
                                                            <td class="auto-style1">&nbsp;</td>
                                                            <td class="auto-style1">&nbsp;</td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">
                                                            <asp:Label ID="LblDescr" runat="server" Text="Description" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style21" rowspan="7">&nbsp;</td>
                                                        <td class="auto-style7">
                                                            <asp:Label ID="LblProduct" runat="server" Text="Product Name" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style7"></td>
                                                        <td class="auto-style7">
                                                            <asp:DropDownList ID="DdlProds" runat="server"
                                                                DataSourceID="SqlDataSource_ProdsList"
                                                                DataTextField="Product"
                                                                DataValueField="ProductCode" OnDataBound="DdlProds_DataBound" Height="25px" Width="250px">
                                                                <asp:ListItem Selected="True">Choose a Product</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TxtProdName" runat="server" Visible="False"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style10">
                                                            <asp:Label ID="LblTech" runat="server" Text="Assigned Technician" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style10"></td>
                                                        <td class="auto-style10">
                                                            <asp:DropDownList ID="DdlTech" runat="server"
                                                                DataSourceID="SqlDataSource_TechsList"
                                                                DataTextField="Technician"
                                                                DataValueField="TechID"
                                                                OnDataBound="DdlTech_DataBound" Height="25px" Width="250px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TxtTech" runat="server" Visible="False"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18"></td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:Label ID="LblDateOpen" runat="server" Text="Opened Date" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:TextBox ID="TxtOpened"  runat="server" BackColor="White" Enabled="true" Height="20px" Width="250px" ForeColor="Black"  onkeypress="return CheckLength(12, this);"></asp:TextBox>
                                                                                                                             <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server"
                                                                  ControlToValidate="TxtOpened"
                                                                  ErrorMessage="The client name is a required field."
                                                                  ForeColor="Red" 
                                                                     display="None"
                                                                     EnableClientScript="true">
                                                                </asp:RequiredFieldValidator>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style1" rowspan="2">&nbsp;<td class="auto-style8">&nbsp;</td>
                                                            <td class="auto-style8">&nbsp;</td>
                                                            <td class="auto-style8">&nbsp;</td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:Label ID="LblClosed" runat="server" Text="Closed Date" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:TextBox ID="TxtClosed" runat="server" BackColor="White"
                                                                Enabled="true" Height="20px" Width="250px" ForeColor="Black"  onkeypress="return CheckLength(12, this);"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18" rowspan="2">&nbsp;</td>
                                                        <td class="auto-style18" rowspan="2">&nbsp;</td>
                                                        <td class="auto-style21">
                                                            <asp:Button ID="BtnUpdate" runat="server" OnClick="BtnUpdate_Click" Text="Update" Width="114px" />
                                                        </td>
                                                        <td style="width: 30px;">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td style="text-align:right;">
                                                            <asp:Button ID="BtnBackToViewDetails" runat="server" OnClick="BtnBackToViewDetails_Click" 
                                                                Text="Back" Width="100px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <br />
                                            <br />
                                            <%--                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="GridView_Incidents" EventName="SelectedIndexChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                        </asp:View>
                                        <%-- END UPDATE INCIDENT TAB --%>

                                        <%-- CREATE INCIDENT TAB --%>
                                        <asp:View ID="CreateIncident" runat="server">
                                            <div>

                                                <strong>Open New Incident:</strong>
                                                <hr />
                                                This section permits to create a new incident for every customer that has purchased one of our products. Then it
                                                will redirect to the incidents list.
                                                <br/><br/>
                                                  <asp:ValidationSummary 
                                                    ID="ValidationSummary2" 
                                                    runat="server" 
                                                    HeaderText="Following error occured:" 
                                                    ShowMessageBox="false" 
                                                    DisplayMode="BulletList" 
                                                    ShowSummary="true"
                                                    
                                                    Width="450"
                                                    ForeColor="Red"
                                                    />

                                                <hr />
                                            </div>
                                            <br />
                                            <div align="center">
                                                <table aria-orientation="horizontal">
                                                    <tr>
                                                        <td class="auto-style1">&nbsp;</td>
                                                        <td class="auto-style1"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style17" style="align-content: center">
                                                            <asp:Label ID="LblTitle_NewIncident" runat="server" Text="Title" 
                                                                Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style17" style="align-content: center">&nbsp;</td>
                                                        <td class="auto-style1">
                                                            <asp:TextBox ID="TxtTitle_NewIncident" runat="server" BackColor="White" Enabled="true" ForeColor="Black" Height="20px"  onkeypress="return CheckLength(50, this);" Width="250px"></asp:TextBox>

                                                            <td class="auto-style20">&nbsp;

                                                            </td>
                                                            <td class="auto-style1">
                                                                <asp:Label ID="LblCustName_NewIncident" runat="server" Text="Customer Name" 
                                                                    Font-Bold="True"></asp:Label>
                                                            </td>
                                                            <td class="auto-style1">&nbsp;</td>
                                                            <td class="auto-style1">
                                                                <asp:DropDownList ID="DdlClient_NewIncident" runat="server" DataSourceID="SqlDataSource_ClientsList" DataTextField="Customer" DataValueField="ClientID"
                                                                    OnSelectedIndexChanged="DdlClient_NewIncident_SelectedIndexChanged" AutoPostBack="True" OnDataBound="DdlClient_NewIncident_DataBound" Height="25px" Width="250px">
                                                                </asp:DropDownList>
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style24" style="align-content: center"></td>
                                                        <td class="auto-style24" style="align-content: center; "></td>
                                                        <td class="auto-style24">                                                                 <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server"
                                                                  ControlToValidate="TxtTitle_NewIncident"
                                                                  ErrorMessage="The incident title is a required field."
                                                                  ForeColor="Red" Display="None">
                                                                </asp:RequiredFieldValidator>
<td class="auto-style25"></td>
                                                            <td class="auto-style24"></td>
                                                            <td class="auto-style24"></td>
                                                            <td class="auto-style24"></td>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">
                                                            <asp:Label ID="LblDescr_NewIncident" runat="server" Text="Description" 
                                                                Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8" rowspan="7" style="vertical-align: top;">
                                                            <asp:TextBox ID="TxtDescr_NewIncident" runat="server" Style="resize: none" BackColor="White" Enabled="true" Height="104px" TextMode="MultiLine" Width="250px" ForeColor="Black"  onkeypress="return CheckLength(2000, this);"></asp:TextBox>
                                                                 <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server"
                                                                  ControlToValidate="TxtDescr_NewIncident"
                                                                  ErrorMessage="The incident description is a required field."
                                                                  ForeColor="Red" 
                                                                     display="None"
                                                                     EnableClientScript="true">
                                                                </asp:RequiredFieldValidator>
                                                        </td>
                                                        <td class="auto-style21" rowspan="7">&nbsp;</td>
                                                        <td class="auto-style7">
                                                            <asp:Label ID="LblProd_NewIncident" runat="server" Text="Product Name" 
                                                                Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style7"></td>
                                                        <td class="auto-style7">
                                                            <asp:DropDownList ID="DdlProds_NewIncident" runat="server"
                                                                DataSourceID="SqlDataSource_DdlProds_NewIncident"
                                                                DataTextField="Product"
                                                                DataValueField="ProductCode" Height="25px" Width="250px">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td class="auto-style7">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style10">
                                                            <asp:Label ID="LblTech_NewIncident" runat="server" Text="Assigned Technician" 
                                                                Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style10"></td>
                                                        <td class="auto-style10">
                                                            <asp:DropDownList ID="DdlTech_NewIncident" runat="server"
                                                                DataSourceID="SqlDataSource_TechsList"
                                                                DataTextField="Technician"
                                                                DataValueField="TechID" Height="25px" Width="250px" >
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td class="auto-style10">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18"></td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:Label ID="LblOpened_NewIncident" runat="server" Text="Opened Date" Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:TextBox ID="TxtOpened_NewIncident" runat="server" BackColor="White" Enabled="true" Height="20px" Width="250px" ForeColor="Black"  onkeypress="return CheckLength(12, this);"></asp:TextBox>
                                                                                                                             <asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server"
                                                                  ControlToValidate="TxtOpened_NewIncident"
                                                                  ErrorMessage="The new incident requires an open date."
                                                                  ForeColor="Red" 
                                                                    display="None"
                                                                     EnableClientScript="true">
                                                                </asp:RequiredFieldValidator>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style18">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:Label ID="LblClosed_NewIncident" runat="server" Text="Closed Date" 
                                                                Font-Bold="True"></asp:Label>
                                                        </td>
                                                        <td class="auto-style8">&nbsp;</td>
                                                        <td class="auto-style8">
                                                            <asp:TextBox ID="TxtClosed_NewIncident" runat="server" BackColor="White" Enabled="true" Height="20px" Width="250px" ForeColor="Black"  onkeypress="return CheckLength(12, this);"></asp:TextBox>
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
                                                            &nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="BtnCreateNewIncident" runat="server" OnClick="BtnCreateNewIncident_Click" Text="Create New" Width="114px" />
                                                        </td>
                                                        <td style="width: 30px;"></td>
                                                        <td>
                                                            <asp:Button ID="BtnToMain" runat="server" OnClick="BtnBackToList_Click" Text="Back" Width="100px" />
                                                        </td>
                                                        <td></td>
                                                        <td style="text-align:right;">
                                                            <asp:Button ID="BtnRefresh_NewIncident" runat="server" 
                                                                OnClick="BtnRefresh_NewIncident_Click" Text="Refresh" Width="100px" 
                                                                />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:View>
                                    </asp:MultiView>

                                </td>
                            </tr>

                        </table>


                        <table>
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource_Incidents" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" InsertCommand="INSERT INTO [Incidents] ([CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description]) VALUES (@CustomerID, @ProductCode, @TechID, @DateOpened, @DateClosed, @Title, @Description)
"
                                        SelectCommand="SELECT i.IncidentID, c.Name AS Customer, p.Name AS Product, i.Title, i.Description, 
CASE WHEN i.TechID is NULL THEN 'Not Set' ELSE t.name END AS Technician, 
i.DateOpened as 'Date Opened', i.DateClosed AS 'Date Closed'
FROM Customers AS c 
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
LEFT JOIN Technicians AS t ON i.TechID = t.TechID
ORDER BY Customer ASC">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="DdlClient_NewIncident" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="DdlProds_NewIncident" Name="ProductCode" PropertyName="SelectedValue" Type="String" />
                                            <asp:ControlParameter ControlID="DdlTech_NewIncident" Name="TechID" PropertyName="SelectedValue" Type="Int32" />
                                            <asp:ControlParameter ControlID="TxtOpened_NewIncident" DbType="Date" Name="DateOpened" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TxtClosed_NewIncident" DbType="Date" Name="DateClosed" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="TxtTitle_NewIncident" Name="Title" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="TxtDescr_NewIncident" Name="Description" PropertyName="Text" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <td>
                                        <asp:SqlDataSource ID="SqlDataSource_FormViewIncident" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT i.IncidentID, c.Name AS Customer, p.Name AS Product, i.Title, i.Description, 
CASE WHEN i.TechID is NULL THEN 'Not Set' ELSE t.name END AS Technician, 
i.DateOpened as 'Date Opened', i.DateClosed AS 'Date Closed'
FROM Customers AS c 
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
LEFT JOIN Technicians AS t ON i.TechID = t.TechID
WHERE c.Name = (SELECT top(1) c.Name AS Customer FROM Customers AS c 
				INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
				WHERE i.IncidentID = @aaa)
ORDER BY I.IncidentID" UpdateCommand="
UPDATE Incidents
SET CustomerID =  (	
					SELECT c.CustomerID
					FROM Customers as c
					WHERE c.Name = @ClientName
				  ),
	ProductCode = @ProdName,
	TechID = @TechName,
	DateOpened = Convert(date, @Opened, 103),
	DateClosed = Convert(date, @Closed, 103), 
	Title = @Title, 
	Description = @Descr
WHERE IncidentID = @IncidentID;">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="GridView_Incidents" Name="aaa" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="TxtCustName" Name="ClientName" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="DdlProds" Name="ProdName" PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="DdlTech" Name="TechName" PropertyName="SelectedValue" Type="String" />
                                                <asp:ControlParameter ControlID="TxtOpened" Name="Opened" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="TxtClosed" Name="Closed" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="TxtTitle" Name="Title" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="TxtDescr" Name="Descr" PropertyName="Text" Type="String" />
                                                <asp:ControlParameter ControlID="FormView_Incidents" Name="IncidentID" PropertyName="SelectedValue" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                            </tr>
                            <td>&nbsp;</tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource_ClientsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT DISTINCT c.CustomerID AS [ClientID], c.Name as [Customer]
FROM Customers AS c
INNER JOIN Registrations as r on c.CustomerID = r.CustomerID
WHERE r.Subscribed = 0
ORDER BY Customer;"></asp:SqlDataSource>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource_ProdsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT p.ProductCode as [ProductCode], p.Name as [Product], p.Supported as Supported
FROM Products AS p
INNER JOIN Registrations as r on r.ProductCode = p.ProductCode
WHERE p.Supported = 0 AND r.CustomerID =


(	
					SELECT c.CustomerID
					FROM Customers as c
					WHERE c.Name = @ClientName
				  );">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TxtCustName" Name="ClientName" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </td>
                    </tr>
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="SqlDataSource_TechsList" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT t.TechID, t.Name AS Technician, COUNT(i.IncidentID) AS 'Assigned Incidents' FROM Incidents AS i INNER JOIN Technicians AS t ON i.TechID = t.TechID INNER JOIN TechTypes AS tt ON t.TypeID = tt.TypeID WHERE (t.Employed = 0) AND (t.TypeID = 2) GROUP BY t.TechID, t.Name ORDER BY 'Assigned Incidents' DESC"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="SqlDataSource_DdlProds_NewIncident" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT p.ProductCode as [ProductCode], p.Name as [Product], p.Supported as Supported
FROM Products AS p
INNER JOIN Registrations as r on r.ProductCode = p.ProductCode
WHERE p.Supported = 0 AND r.CustomerID = @CustomerID;">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DdlClient_NewIncident" Name="CustomerID" PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <td>
                                            &nbsp;</td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;<td>&nbsp;</td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </td>
                            </td>
                </td>
                </td>
                        </table>


                    </ContentTemplate>

                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="GridView_Incidents" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="BtnUpdate" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td></td>
        </tr>
    </table>

    <%-- SELECT BTN COLUMN document.getElementById("<%=TxtTitle.ClientID%>")--%>

    <br />
    <br />

    <script type="text/javascript">
        //And the javascript code is
        function CheckLength(length, control) {
            var textbox = control.value;
            if (textbox.trim().length >= length) {
                return false;
            }
            else {
                return true;
            }
        }

        

        //$(function () {
        //    $("TxtOpened_NewIncident").datepicker();
        //});
    </script>

    <%-- END INCIDENTS LIST TAB --%>
</asp:Content>


