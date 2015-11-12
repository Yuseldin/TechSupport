<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewTechnicians.aspx.cs" Inherits="TechSupport.Admin.Technicians" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .gridview {
            margin-left: 126px;
            margin-right: auto;
        }
        .selectOption {
            width: 26%;
            float: left;
            height: 202px;
            border-right: 1px solid #000; 
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
            width: 152px;
        }
        .auto-style4 {
            width: 152px;
        }
   </style>
    

        <div class="selectOption">Welcome, please select an option from below:<br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="View All Technicians:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="btnViewAllTechs" runat="server" Text="Go" OnClick="btnViewAllTechs_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label2" runat="server" Text="List all Level 1 Techs:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="Button2" runat="server" Text="Go" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label3" runat="server" Text="List all Level 2 Techs:"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Go" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label4" runat="server" Text="Edit Details:"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button4" runat="server" Text="Go" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Search by ID:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
                        <asp:Button ID="Button5" runat="server" Text="Search" />
                    </td>
                </tr>
            </table>
            
    </div>
    <br />

    <%-- Backup Gridview --%>
    <%-- <asp:GridView class="gridview" ID="GridView1" runat="server" DataSourceID="AllTechs" Height="138px" style="text-align: left; margin-left: auto; margin-right: auto;" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataKeyNames="TechID">
    <Columns>
        <asp:BoundField DataField="TechID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TechID" ItemStyle-Width="25" ></asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Height="25" ItemStyle-Height="25" ItemStyle-Width="100px" ></asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ItemStyle-Width="100px" ></asp:BoundField>
        <asp:BoundField DataField="Employed" HeaderText="Employed" SortExpression="Employed" ></asp:BoundField>
        <asp:BoundField DataField="TypeID" HeaderText="Type" SortExpression="TypeID" ItemStyle-Width="150px" ></asp:BoundField>
    </Columns>
    </asp:GridView> --%>

    <b> View All Technicians</b>
<asp:GridView class="gridview" ID="GridView1" runat="server" DataSourceID="AllTechs" Height="138px" style="text-align: left; margin-left: auto; margin-right: auto;" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataKeyNames="TechID">
    <Columns>
        <asp:BoundField DataField="TechID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TechID" ItemStyle-Width="25" ></asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Height="25" ItemStyle-Height="25" ItemStyle-Width="100px" ></asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" ItemStyle-Width="100px" ></asp:BoundField>
        <asp:BoundField DataField="Employed" HeaderText="Employed" SortExpression="Employed" ></asp:BoundField>
        <asp:BoundField DataField="TypeID" HeaderText="Type" SortExpression="TypeID" ItemStyle-Width="150px" ></asp:BoundField>
    </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="AllTechs" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
     SelectCommand="SELECT Technicians.* FROM Technicians"></asp:SqlDataSource>

</asp:Content>
