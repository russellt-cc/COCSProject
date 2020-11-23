<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="COCSProject.login" %>

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
            Login to NERD HERD COCS (Collaborative Online Catering System)</strong></span><br />
            <asp:Login ID="Login1" runat="server" DestinationPageUrl="homepage.aspx">
            </asp:Login>
            <br />
            <asp:Button ID="btnForgot" runat="server" OnClick="btnForgot_Click" Text="Forgot Password?" />
        </div>
    </form>
</body>
</html>
