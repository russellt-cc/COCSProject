<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="COCSProject.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" />
            <span class="auto-style1"><strong>
            <br />
            <br />
            Change Password</strong></span><br />
            <br />
            <asp:ChangePassword ID="ChangePassword1" runat="server">
            </asp:ChangePassword>
        </div>
    </form>
</body>
</html>
