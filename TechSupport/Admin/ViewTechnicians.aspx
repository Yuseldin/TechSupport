<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="ViewTechnicians.aspx.cs" Inherits="TechSupport.Admin.Technicians" %>

<%--Author Block
    Author: Jak Revai
    Project: Revai_Jak_TechSupport_AS3
    Description: Create Web App in C#
    Version: 1.0
    NOTE: The design of these pages were created on a monitor with a resolution of: 1920x1080, if the pages look funny on a smaller resolution then that is why.--%>

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

    <div class="selectOption">
        Welcome, please select an option from below:<br />
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
                    <asp:TextBox ID="txtBoxSearch" runat="server" Width="90px" ValidationGroup="Search"></asp:TextBox>                                    
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" ValidationGroup="Search" />                    
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
    
    &nbsp<asp:Label ID="lblViewAllTechs" runat="server" Text="View All Technicians" Visible="False" Style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblViewLevel1" runat="server" Text="View Support Officer's Level 1" Visible="False" Style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblViewLevel2" runat="server" Text="View Technicians Level 2" Visible="False" Style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblEditDetails" runat="server" Text="Edit Technicians Details" Visible="False" Style="font-weight: 700"></asp:Label>
    <asp:Label ID="lblSearchByID" runat="server" Text="Search Technicians By ID" Visible="False" Style="font-weight: 700"></asp:Label>
    <br />
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The search box is empty, please input a number to continue." ControlToValidate="txtBoxSearch" ValidationGroup="Search" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
    <%--<br />--%>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtBoxSearch" ValidationExpression="[a-z A-Z]|[^\w \xC0-\xFF]" ValidationGroup="Search" ForeColor="#FF3300"></asp:RegularExpressionValidator>--%>
    <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtBoxSearch" ForeColor="#FF3300" Operator="DataTypeCheck" Type="Integer" ValidationGroup="Search"></asp:CompareValidator>--%>

    <asp:Label ID="lblErrorText" runat="server" Text="error" Visible="False" ForeColor="#FF3300"></asp:Label>
       
    <asp:GridView class="gridview" ID="ViewAllTechsGrid" runat="server" Style="text-align: left;" OnRowDataBound="ViewAllTechsGrid_RowDataBound" AutoGenerateColumns="False" DataKeyNames="TechID">
        <Columns>
            <asp:BoundField DataField="TechID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="TechID"></asp:BoundField>

            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' Visible="false" Width="100"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle Height="25px" />
                <ItemStyle Height="25px" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>' Visible="false" Width="200"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Phone") %>' Visible="false" Width="100"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Employed" SortExpression="Employed">                    
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Employed") %>' Visible="True"></asp:Label>
                    <asp:DropDownList ID="DropDown1" runat="server" Visible="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="Yes" Value="0" />
                        <asp:ListItem Text="No" Value="1" />
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Type" SortExpression="TypeID">
                 <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TypeID") %>'></asp:Label>
                     <asp:DropDownList ID="DropDown2" runat="server" Visible="False" AppendDataBoundItems="True">
                        <asp:ListItem Text="Support Officer Level 1" Value="1" />
                        <asp:ListItem Text="Technician Level 2" Value="2" />
                     </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br /> 
    <asp:Button ID="btnEditGrid" runat="server" Text="Edit" class="gridview" Visible="false" OnClick="btnEditGrid_Click"/>
    <asp:Button ID="btnUpdate" runat="server" Text="Update" class="gridview" Visible="false" OnClick="btnUpdate_Click" />&nbsp
    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Visible="false" OnClick="BtnCancel_Click"/>
    
    <asp:SqlDataSource ID="TechSearch" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT * FROM Technicians WHERE TechID = @TechID">
        <SelectParameters>
            <asp:Parameter Name="TechID" Type="Int32" DefaultValue="11" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="EditDetails" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT * FROM [Technicians]" UpdateCommand="UPDATE [Technicians] SET [Name] = @Name, [Email] = @Email, [Phone] = @Phone, [Employed] = @Employed, [TypeID] = @TypeID WHERE [TechID] = @TechID">
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="Employed" Type="Int32" />
            <asp:Parameter Name="TypeID" Type="Int32" />
            <asp:Parameter Name="TechID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="ViewLevel2" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.* FROM Technicians WHERE (TypeID = 2)"></asp:SqlDataSource>

    <asp:SqlDataSource ID="ViewLevel1" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>" SelectCommand="SELECT Technicians.* FROM Technicians WHERE (TypeID = 1)"></asp:SqlDataSource>

    <asp:SqlDataSource ID="Techs" runat="server" ConnectionString="<%$ ConnectionStrings:TechSupportConnectionString %>"
        SelectCommand="SELECT Technicians.* FROM Technicians"></asp:SqlDataSource>

</asp:Content>
