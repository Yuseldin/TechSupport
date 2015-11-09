<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewIncidents.aspx.cs" Inherits="TechSupport.ViewIncidents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:GridView ID="Grid_ViewIncidents" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_Incidents" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                <asp:BoundField DataField="Product" HeaderText="Product" SortExpression="Product" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Technician" HeaderText="Technician" SortExpression="Technician" />
                <asp:BoundField DataField="Date Opened" HeaderText="Date Opened" SortExpression="Date Opened" ApplyFormatInEditMode="True" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Date Closed" HeaderText="Date Closed" SortExpression="Date Closed" ApplyFormatInEditMode="True" DataFormatString="{0:d}" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <br />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource_Incidents" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT  c.Name AS Customer, p.Name AS Product, i.Title, i.Description, t.Name AS Technician, i.DateOpened AS 'Date Opened', i.DateClosed as 'Date Closed'
FROM Customers AS c 
INNER JOIN Incidents AS i ON c.CustomerID = i.CustomerID 
INNER JOIN Products AS p ON i.ProductCode = p.ProductCode 
INNER JOIN Technicians AS t ON i.TechID = t.TechID"></asp:SqlDataSource>
    </p>
</asp:Content>
