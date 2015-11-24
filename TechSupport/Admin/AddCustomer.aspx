<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="TechSupport.Admin.AddCustomer" %>

<%--<script runat="server">
    private void addCustomer(object source, EventArgs e);
        
        
</script>
    --%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style24 {
        }
        .auto-style28 {
        }
        .auto-style29 {
            width: 11px;
        }
        .auto-style31 {
            width: 19px;
            height: 20px;
        }
        .auto-style32 {
            width: 11px;
            height: 19px;
        }
        .auto-style35 {
            width: 11px;
            height: 20px;
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
            </td>
            <td class="auto-style28" colspan="2">
                <asp:TextBox ID="txtEmail" runat="server" Width="128px"></asp:TextBox>
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
            </td>
        </tr>
        <tr>
            <td class="auto-style35">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="City"></asp:Label>
                :</td>
            <td class="auto-style31">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="State"></asp:Label>
                :</td>
            <td class="stdCell">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="ZipCode"></asp:Label>
                :</td>
        </tr>
        <tr>
            <td class="auto-style32">
                <asp:TextBox ID="txtCity" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtState" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtZipCode" runat="server" Width="128px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style35">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Text="Country"></asp:Label>
                :</td>
            <td class="stdCell" colspan="2"></td>
        </tr>
        <tr>
            <td class="auto-style29">
                <asp:TextBox ID="txtCountry" runat="server" Width="128px"></asp:TextBox>
            </td>
            <td class="auto-style28" colspan="2">
                <asp:Button ID="btnAddCustomer" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Add Customer" Width="125px" OnClientClick="addCustomer" />
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="addNewCustomer" Height="50px" Width="125px" Visible="False">
        <Fields>
            <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
        </Fields>
    </asp:DetailsView>
    <br />
    <br />
    <p style="height: 56px">


        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID" DataSourceID="addNewCustomer" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
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
