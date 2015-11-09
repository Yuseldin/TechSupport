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
        &nbsp;</p>
<p>
        THIS IS THE HOME PAGE1</p>
</asp:Content>
