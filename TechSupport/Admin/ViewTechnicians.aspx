<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewTechnicians.aspx.cs" Inherits="TechSupport.Admin.Technicians" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .gridview {
            margin-left: 352px;
            margin-right: auto;
        }
        .selectOption {
            width: 17%;
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
                        <asp:Label ID="Label2" runat="server" Text="List all Support Officer's Level 1:"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Button ID="btnViewLevel1" runat="server" Text="Go" OnClick="btnViewLevel1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label3" runat="server" Text="List all Level 2 Techs:"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnViewLevel2" runat="server" Text="Go" OnClick="btnViewLevel2_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="Label4" runat="server" Text="Edit Details:"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnEditDetails" runat="server" Text="Go" OnClick="btnEditDetails_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Search by ID:"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtBoxSearch" runat="server" Width="90px"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </td>
                </tr>
            </table>
            
    </div>
    <br />

    <%-- Backup Gridview --%>  
    <%-- <asp:GridView class="gridview" ID="ViewAllTechsGrid" runat="server" style="text-align: left;" OnRowDataBound="ViewAllTechsGrid_RowDataBound" AutoGenerateColumns="False" DataKeyNames="TechID" DataSourceID="ViewLevel2">
    <Columns>
        <asp:BoundField DataField="TechID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TechID"></asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Height="25" ItemStyle-Height="25" ></asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
        <asp:BoundField DataField="Employed" HeaderText="Employed" SortExpression="Employed" ></asp:BoundField>
        <asp:BoundField DataField="TypeID" HeaderText="Type" SortExpression="TypeID" ></asp:BoundField>
    </Columns>
    </asp:GridView> --%>
    
    &nbsp<asp:Label ID="lblViewAllTechs" runat="server" Text="View All Technicians" Visible="False" style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblViewLevel1" runat="server" Text="View Support Officer's Level 1" Visible="False" style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblViewLevel2" runat="server" Text="View Technicians Level 2" Visible="False" style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblEditDetails" runat="server" Text="Edit Technicians Details" Visible="False" style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblSearchByID" runat="server" Text="View Technicians By ID" Visible="False" style="font-weight: 700"></asp:Label>
   
<asp:GridView class="gridview" ID="ViewAllTechsGrid" runat="server" style="text-align: left;" OnRowDataBound="ViewAllTechsGrid_RowDataBound" AutoGenerateColumns="False" DataKeyNames="TechID" OnRowEditing="ViewAllTechsGrid_RowEditing">
    <Columns>
        <asp:BoundField DataField="TechID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TechID"></asp:BoundField>
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" HeaderStyle-Height="25" ItemStyle-Height="25" >
<HeaderStyle Height="25px"></HeaderStyle>

<ItemStyle Height="25px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"></asp:BoundField>
        <asp:BoundField DataField="Employed" HeaderText="Employed" SortExpression="Employed" ></asp:BoundField>
        <asp:BoundField DataField="TypeID" HeaderText="Type" SortExpression="TypeID" ></asp:BoundField>
    </Columns>
    </asp:GridView>







    <asp:SqlDataSource ID="EditDetails" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.* FROM Technicians"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ViewLevel2" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.* FROM Technicians WHERE (TypeID = 2)"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ViewLevel1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.* FROM Technicians WHERE (TypeID = 1)"></asp:SqlDataSource>

    <asp:SqlDataSource ID="Techs" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
     SelectCommand="SELECT Technicians.* FROM Technicians"></asp:SqlDataSource>

</asp:Content>
