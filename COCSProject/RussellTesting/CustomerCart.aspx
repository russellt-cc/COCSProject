<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerCart.aspx.cs" Inherits="COCSProject.RussellTesting.CustomerCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Return to Menu" />
            <br />
            <br />
            Shopping Cart<br />
            <br />
            <asp:ListBox ID="ListBox1" runat="server" Height="229px" Width="334px"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="btnRemove" runat="server" OnClick="btnRemove_Click" Text="Remove" />
        </div>
    </form>
</body>
</html>
