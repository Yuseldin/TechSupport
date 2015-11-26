<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="TechSupport.Admin.Products" %>
<%--<script runat="server">
    private void InsertProduct(object source, EventArgs e)
    {
        try
        {
            SqlProducts.DataBind();
            SqlProducts.Insert();
        }
        catch
        { 
        
        }        
        
    }
    

</script>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style24 {
            width: 74%;
        }
        .auto-style25 {
            width: 122px;
            margin-left: 40px;
        }
        .auto-style26 {
            width: 122px;
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        PRODUCTS
    </p>
    <table class="auto-style24">
        <tr>
            <td class="auto-style25">
                <asp:Label ID="lblProduct" runat="server" Text="Product Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtProductCode" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Label ID="lblVersion" runat="server" Text="Version:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtVersion" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Label ID="LblName" runat="server" Text="Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style26">
                <asp:Label ID="lblRelease" runat="server" Text="Release Date:"></asp:Label>
            </td>
            <td class="stdCell">
                <asp:Label ID="lblDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style25">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Button ID="btnInsertProduct" runat="server" Text="Insert Product" Width="116px" OnClick="btnInsertProduct_Click"/>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p>
        <asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Subscribed: Yes = 0 / No = 1."></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductCode" DataSourceID="SqlProducts" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" ReadOnly="True" SortExpression="ProductCode" />
                <asp:BoundField DataField="Version" HeaderText="Version" SortExpression="Version" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                <asp:BoundField DataField="Supported" HeaderText="Supported" SortExpression="Supported" />
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
        
        <asp:SqlDataSource ID="SqlProducts" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductCode] = @original_ProductCode AND [Version] = @original_Version AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Supported] = @original_Supported" InsertCommand="INSERT INTO [Products] ([ProductCode], [Version], [Name], [ReleaseDate]) VALUES (@ProductCode, @Version, @Name, @ReleaseDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProductCode], [Version], [Name], [ReleaseDate], [Supported] FROM [Products]" UpdateCommand="UPDATE [Products] SET [Version] = @Version, [Name] = @Name, [ReleaseDate] = @ReleaseDate, [Supported] = @Supported WHERE [ProductCode] = @original_ProductCode AND [Version] = @original_Version AND [Name] = @original_Name AND [ReleaseDate] = @original_ReleaseDate AND [Supported] = @original_Supported">
            <DeleteParameters>
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_Supported" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="txtProductCode" Name="ProductCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtVersion" Name="Version" PropertyName="Text" Type="Decimal" />
                <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="lblDate" Name="ReleaseDate" PropertyName="Text" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Version" Type="Decimal" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="Supported" Type="Int32" />
                <asp:Parameter Name="original_ProductCode" Type="String" />
                <asp:Parameter Name="original_Version" Type="Decimal" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_ReleaseDate" Type="DateTime" />
                <asp:Parameter Name="original_Supported" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
