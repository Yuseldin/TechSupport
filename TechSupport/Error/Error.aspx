<%@ Page Title="Software Support" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TechSupport.Error.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
    <br/>
    <h1 class="top">Error</h1>
    <br/><br/>
    <p><strong>
        <asp:Label ID="LblError" runat="server" Text="Label" Font-Bold="True"></asp:Label></strong></p>
    <br/><br/>

        <asp:Label ID="Label1" runat="server" Text="Go back to main page"></asp:Label>
        <asp:Button ID="BtnHome" runat="server" Text="Home" />
</div>

</asp:Content>
