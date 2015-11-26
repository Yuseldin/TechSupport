<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="TechSupport.Admin.AddCustomer" %>

<%--<script runat="server">
    private void (object source, EventArgs e)
    {
        try
        {
            
        }
        catch
        {}
    }
        
</script>--%>
    


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style24 {
        }
        .auto-style28 {
        }
        .auto-style29 {
            width: 121px;
        }
        .auto-style31 {
            width: 19px;
            height: 20px;
        }
        .auto-style32 {
            width: 121px;
            height: 19px;
        }
        .auto-style33 {
            width: 121px;
            height: 20px;
        }
        .auto-style34 {
            height: 20px;
            width: 347px;
        }
        .auto-style35 {
            height: 19px;
            width: 347px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="height: 29px">


        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Add New Customer:"></asp:Label>


    </p>
    <table class="auto-style22">
        <tr>
            <td class="auto-style29">
                <asp:Label ID="lblCustomerID" runat="server" Font-Bold="True" Text="CustomerID:"></asp:Label>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Name:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:TextBox ID="txtCustomerID" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtName" runat="server" Width="514px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldName" runat="server" ControlToValidate="txtName" ErrorMessage="* Field Name is mandatory" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Phone"></asp:Label>
                :</td>
            <td class="auto-style28" colspan="2">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Email"></asp:Label>
                :</td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="* Only Numbers" ForeColor="#FF3300" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="*Phone field is mandatory" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" Width="128px"></asp:TextBox>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Must be a valid email" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="*Email is mandatory" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Address"></asp:Label>
                :</td>
            <td class="auto-style28" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style24" colspan="3">
                <asp:TextBox ID="txtAddress" runat="server" Width="516px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="* Field Address is mandatory" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style33">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="City"></asp:Label>
                :</td>
            <td class="auto-style31">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="State"></asp:Label>
                :</td>
            <td class="auto-style34">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="ZipCode"></asp:Label>
                :</td>
        </tr>
        <tr>
            <td class="auto-style32">
                <asp:TextBox ID="txtCity" runat="server" Width="128px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldCity" runat="server" ControlToValidate="txtCity" ErrorMessage="* City is a mandatory field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style10">
                <asp:DropDownList ID="DropDownState" runat="server">
                    <asp:ListItem>QLD</asp:ListItem>
                    <asp:ListItem>NSW</asp:ListItem>
                    <asp:ListItem>ACT</asp:ListItem>
                    <asp:ListItem>SA</asp:ListItem>
                    <asp:ListItem>TAS</asp:ListItem>
                    <asp:ListItem>VIC</asp:ListItem>
                    <asp:ListItem>WA</asp:ListItem>
                    <asp:ListItem>NT</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownState" ErrorMessage="* State is a mandatory field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style35">
                <asp:TextBox ID="txtZipCode" runat="server" Width="128px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage="* ZipCode is a mandatory field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style33">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Country"></asp:Label>
                :</td>
            <td class="stdCell" colspan="2"></td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:DropDownList ID="DropDownCountry" runat="server">
                    <asp:ListItem>Australia</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldCountry" runat="server" ControlToValidate="DropDownCountry" ErrorMessage="* Country is a mandatory field" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:Button ID="btnAddCustomer" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Add Customer" Width="125px"/>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:Label ID="lblProduct" runat="server" Text="Product:"></asp:Label>
            </td>
            <td class="auto-style28" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:DropDownList ID="DropDownProduct" runat="server" DataSourceID="SqlDataGetProduct" DataTextField="ProductCode" DataValueField="ProductCode" OnSelectedIndexChanged="DropDownProduct_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataGetProduct" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" InsertCommand="INSERT INTO Registrations(CustomerID, ProductCode, RegistrationDate) VALUES (@CustID, @ProductID, @DateNow)" SelectCommand="SELECT [ProductCode] FROM [Products]">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtCustomerID" Name="CustID" PropertyName="Text" />
                        <asp:ControlParameter ControlID="DropDownProduct" Name="ProductID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="lblDate" Name="DateNow" PropertyName="Text" Type="DateTime" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" Height="50px" Width="125px" Visible="False">
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT CustomerID FROM Customers ORDER BY CustomerID DESC"></asp:SqlDataSource>
    <br />


        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID" DataSourceID="SqlGridView" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <br />
    <br />
    <p style="height: 56px">


        <asp:SqlDataSource ID="SqlGridView" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [country] = @original_country AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [country], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @country, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [country], [Phone], [Email] FROM [Customers] ORDER BY [CustomerID] DESC" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [country] = @country, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [country] = @original_country AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_country" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_country" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="getCustomerID" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [country] = @original_country AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))" InsertCommand="INSERT INTO Customers(Name, Address, City, State, ZipCode, country, Phone, Email) VALUES (@Name, @Address, @City, @State, @ZipCode, @country, @Phone, @Email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [country], [Phone], [Email] FROM [Customers] ORDER BY [CustomerID] DESC" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [country] = @country, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @original_CustomerID AND [Name] = @original_Name AND [Address] = @original_Address AND [City] = @original_City AND [State] = @original_State AND [ZipCode] = @original_ZipCode AND [country] = @original_country AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_country" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="country" Type="String" />
                <asp:Parameter Name="Phone" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="original_CustomerID" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Address" Type="String" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
                <asp:Parameter Name="original_country" Type="String" />
                <asp:Parameter Name="original_Phone" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>


    </p>
    <p style="height: 56px">


        &nbsp;</p>
    <p style="height: 56px">


        &nbsp;</p>
    <p style="height: 56px">


        &nbsp;</p>
    <p style="height: 56px">


        &nbsp;</p>
    <p style="height: 56px">


        &nbsp;</p>
</asp:Content>
