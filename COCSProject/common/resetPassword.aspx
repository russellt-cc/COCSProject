<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="COCSProject.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register for a New Account" Width="255px" />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log In" Width="255px" />
        <strong>
            <span class="auto-style1">
                <br />
                <br />
            </span>Change Password</strong><br />
        <br />
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                You have to login first!
            </AnonymousTemplate>
            <LoggedInTemplate>
                <asp:ChangePassword ID="ChangePassword1" runat="server">
                </asp:ChangePassword>
            </LoggedInTemplate>
        </asp:LoginView>
        <br />
    </form>
</body>
</html>
