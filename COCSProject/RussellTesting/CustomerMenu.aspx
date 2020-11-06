<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerMenu.aspx.cs" Inherits="COCSProject.RussellTesting.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCatererMenu" runat="server" OnClick="btnCatererMenu_Click" Text="Switch to caterer menu" />
            <br />
            <br />
            Customer menu page<br />
            <br />
            <asp:ListBox ID="lbMenuItems" runat="server" Height="223px" Width="346px"></asp:ListBox>
            <br />
            <br />
            <asp:Button ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" Text="Add to Cart" />
            <br />
            <br />
            <asp:Button ID="btnLoadCart" runat="server" OnClick="btnLoadCart_Click" Text="Go To Cart" />
        </div>
    </form>
</body>
</html>
