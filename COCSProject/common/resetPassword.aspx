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
        <asp:Button ID="btnProfile" runat="server" OnClick="btnProfile_Click" Text="View Profile" Width="255px" />
        <strong>
            <span class="auto-style1">
                <br />
                <br />
            </span>Change Password</strong><br />
        <br />
        <asp:ChangePassword ID="ChangePassword1" runat="server">
        </asp:ChangePassword>
        <br />
    </form>
</body>
</html>
