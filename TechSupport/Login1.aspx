<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="TechSupport.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style/Style.css" rel="stylesheet" type="text/css"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 92px;
            margin-top: 20px;
        }
        .auto-style7 {
            width: 165px;
            margin-top: 20px;
        }
        .auto-style8 {
            width: 92px;
            height: 34px;
        }
        .auto-style9 {
            width: 165px;
            height: 34px;
        }
        .requiredFields {
            color:red;
            text-align: left;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1 style="clip: rect(auto, auto, auto, auto)">
            <img src="SoftwareLogo1.PNG" style="height: 157px; width: 111px" /> </h1>
        <h1>Welcome to SoftwareSupport</h1>
    </div>

        <div style="text-align: center;">
            <div style="width: 236px; margin-left: auto; margin-right: auto;">

                <asp:Login ID="Login" runat="server" DestinationPageUrl="~/Default.aspx" OnLoggedIn="Login_LoggedIn" Width="394px">
                    <LayoutTemplate>
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2">Log In</td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style8">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" style="text-align: left">User Name:</asp:Label>
                                            </td>
                                            <td class="auto-style9">
                                                <asp:TextBox ID="UserName" runat="server" Width="128px" style="text-align: left; margin-left: 0px;"></asp:TextBox>                                                
                                            </td>
                                            <td class="requiredFields">
                                                <asp:RequiredFieldValidator Width="166px" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login">User Name is required.</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="auto-style3">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Style="text-align: left;">Password:</asp:Label>
                                            </td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" Style="text-align: left;" Width="128px"></asp:TextBox>
                                            </td>
                                            <td class="requiredFields">
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login">Password Required.</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>

            </div>
        </div>
    </form>
</body>
</html>
