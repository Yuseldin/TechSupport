<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="TechSupport.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style/Style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>&nbsp;</h1>
        <h1>Welcome to TechSupport</h1>
    </div>
        <div>
            <asp:Login ID="Login" runat="server" DestinationPageUrl="~/Default.aspx" OnLoggedIn="Login_LoggedIn">
            </asp:Login>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
