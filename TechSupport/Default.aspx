<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TechSupport.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="Select IncidentID:"></asp:Label>
&nbsp;<asp:TextBox ID="txtClose" runat="server" Width="60px"></asp:TextBox>
&nbsp;<asp:Button ID="btnClose" runat="server" OnClick="btnClose_Click" Text="Close Incident" />
&nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Please select the right IncidentID." Visible="False"></asp:Label>
</p>
<p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="IncidentID" DataSourceID="SqlDataSource1" >
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="IncidentID" HeaderText="IncidentID" InsertVisible="False" ReadOnly="True" SortExpression="IncidentID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                <asp:BoundField DataField="TechID" HeaderText="TechID" SortExpression="TechID" />
                <asp:BoundField DataField="DateOpened" HeaderText="DateOpened" SortExpression="DateOpened" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="DateClosed" HeaderText="DateClosed" SortExpression="DateClosed" DataFormatString="{0:dd/MM/yyyy}"/>
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
    </p>
    <p>
        <asp:Label ID="lblClosed" runat="server" ForeColor="Green" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" DeleteCommand="DELETE FROM [Incidents] WHERE [IncidentID] = @IncidentID" InsertCommand="INSERT INTO [Incidents] ([CustomerID], [ProductCode], [TechID], [DateOpened], [DateClosed], [Title], [Description]) VALUES (@CustomerID, @ProductCode, @TechID, @DateOpened, @DateClosed, @Title, @Description)" SelectCommand="SELECT * FROM [Incidents]" UpdateCommand="UPDATE [Incidents] SET [CustomerID] = @CustomerID, [ProductCode] = @ProductCode, [TechID] = @TechID, [DateOpened] = @DateOpened, [DateClosed] = @DateClosed, [Title] = @Title, [Description] = @Description WHERE [IncidentID] = @IncidentID">
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
    </p>
    <p  style="text-align:center">
        <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Underline="False" ForeColor="Blue" Text="Welcome to Software Support." Visible="False"></asp:Label>
    </p>
</asp:Content>
