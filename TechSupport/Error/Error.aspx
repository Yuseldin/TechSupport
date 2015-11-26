<%@ Page Title="" Language="C#" MasterPageFile="~/TechSupport.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="TechSupport.Error.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="vertical-align:middle;">
        <p>    
            <asp:Label ID="LblError" runat="server" Text="Label" style="text-align:center" Font-Bold="true"></asp:Label>
        </p>
        <br/><br/><br/>
        <p>You could go back to the previous page or to the <a href="../Default.aspx" >home page</a></p>
    </div>
</asp:Content>
