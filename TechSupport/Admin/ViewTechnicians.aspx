<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewTechnicians.aspx.cs" Inherits="TechSupport.Admin.Technicians" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <p style="height: 20px">
        Welcome to the technician overview, please pick an option below:</p>

    <div style="text-align: center;">
            <div style="width: 236px; margin-left: auto; margin-right: auto;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TechID" DataSourceID="SQLTechnicians" Height="150px" Width="575px" style="text-align: left">
            <Columns>
                <asp:BoundField DataField="TechID" HeaderText="TechID" InsertVisible="False" ReadOnly="True" SortExpression="TechID" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Employed" HeaderText="Employed" SortExpression="Employed" />
                <asp:BoundField DataField="TypeName" HeaderText="Type" SortExpression="TypeName" />
            </Columns>
        </asp:GridView>
    </div>
    </div>


        <asp:SqlDataSource ID="SQLTechnicians" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.*, TechTypes.TypeName FROM Technicians INNER JOIN TechTypes ON Technicians.TypeID = TechTypes.TypeID"></asp:SqlDataSource>
    




</asp:Content>
