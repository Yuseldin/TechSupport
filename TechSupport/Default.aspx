<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TechSupport.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="lblSessionLogin" runat="server"></asp:Label>
</p>
    <p>
        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Login1.aspx" /> 
</p>
<p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="IncidentID" DataSourceID="SqlDataSource1" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                <asp:BoundField DataField="TechID" HeaderText="TechID" SortExpression="TechID" />
                <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" />
                <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
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
&nbsp;
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Incidents] WHERE [IncidentID] = @IncidentID" InsertCommand="INSERT INTO [Incidents] ([CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description]) VALUES (@CustomerID, @ProductCode, @TechID, @DateOpened, @DateClosed, @Title, @Description)" SelectCommand="SELECT * FROM [Incidents] WHERE ([TechID] = @TechID)" UpdateCommand="UPDATE [Incidents] SET [CustomerID] = @CustomerID, [ProductCode] = @ProductCode, [TechID] = @TechID, [DateOpened] = @DateOpened, [DateClosed] = @DateClosed, [Title] = @Title, [Description] = @Description WHERE [IncidentID] = @IncidentID">
            <DeleteParameters>
                <asp:Parameter Name="IncidentID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="DateOpened" Type="DateTime" />
                <asp:Parameter Name="DateClosed" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="TechID" SessionField="username" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
                <asp:Parameter Name="ProductCode" Type="String" />
                <asp:Parameter Name="TechID" Type="Int32" />
                <asp:Parameter Name="DateOpened" Type="DateTime" />
                <asp:Parameter Name="DateClosed" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="IncidentID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close Incident" />
    </p>
<p aria-autocomplete="none">
        THIS IS THE HOME PAGE1&nbsp; </p>
</asp:Content>
