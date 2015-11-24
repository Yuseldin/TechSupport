<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="TechSupport.Admin.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        CUSTOMERS</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Search ID:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtSearch" runat="server" TabIndex="1"></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="CustomerID" DataSourceID="techSqlDataSource" EmptyDataText="There are no data records to display." GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <AlternatingRowStyle BackColor="Gainsboro" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
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
            <FooterStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="techSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT * FROM [Customers]" DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" InsertCommand="INSERT INTO [Customers] ([Name], [Address], [City], [State], [ZipCode], [country], [Phone], [Email]) VALUES (@Name, @Address, @City, @State, @ZipCode, @country, @Phone, @Email)" UpdateCommand="UPDATE [Customers] SET [Name] = @Name, [Address] = @Address, [City] = @City, [State] = @State, [ZipCode] = @ZipCode, [country] = @country, [Phone] = @Phone, [Email] = @Email WHERE [CustomerID] = @CustomerID">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
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
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CustomerID,ProductCode" DataSourceID="SqlDataSource1" GridLines="Vertical" OnRowCancelingEdit="GridView2_RowCancelingEdit" OnRowEditing="GridView2_RowEditing" OnRowDataBound="GridView2_RowDataBound" OnRowUpdating="GridView2_RowUpdating">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <%--<EditItemTemplate>
                         <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" Visible="false"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Visible="false"></asp:LinkButton>
                    </EditItemTemplate>--%>
                    <ItemTemplate>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>--%>
                        <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
                       <asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" Visible="false"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Visible="false"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />--%>
                <asp:TemplateField HeaderText="CustomerID">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("CustomerID") %>' Visible="true"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />--%>
                <asp:TemplateField HeaderText="ProductCode">
                    <ItemTemplate>
                        <asp:Label ID="lblProductCode" runat="server" Text='<%# Bind("ProductCode") %>' Visible="true"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="RegistrationDate" HeaderText="RegistrationDate" SortExpression="RegistrationDate" DataFormatString="{0:dd/MM/yyyy}"/>--%>
                <%--<asp:BoundField DataField="Subscribed" HeaderText="Subscribed" SortExpression="Subscribed" />--%>
                <asp:TemplateField HeaderText="RegistrationDate">
                    <ItemTemplate>
                        <asp:Label ID="lblRegistrationDate" runat="server" Text='<%# Bind("RegistrationDate") %>' Visible="true" ></asp:Label>
                        <asp:TextBox ID="txtRegistrationDate" runat="server" Text='<%# Bind("RegistrationDate") %>' Visible="false" ></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Subscribed">
                    <ItemTemplate>
                        <asp:Label ID="lblSubscribed" runat="server" Text='<%# Bind("Subscribed") %>' Visible="True"></asp:Label>
                        <asp:DropDownList ID="DropDown1" runat="server" Visible="false" AppendDataBoundItems="True">
                            <asp:ListItem Text="Yes" Value="0" />
                            <asp:ListItem Text="No" Value="1" />
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ShowSelectButton="True" />
                
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
        <%--<asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Registrations] WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode" InsertCommand="INSERT INTO [Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (@CustomerID, @ProductCode, @RegistrationDate)" SelectCommand="SELECT * FROM [Registrations] ORDER BY [CustomerID]" UpdateCommand="UPDATE [Registrations] SET [RegistrationDate] = @RegistrationDate, [Subscribed] = @Subscribed WHERE [CustomerID] = @CustomerID AND [ProductCode] = @ProductCode">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="RegistrationDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RegistrationDate" Type="DateTime" />
                <asp:Parameter Name="Subscribed" Type="Int32" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
