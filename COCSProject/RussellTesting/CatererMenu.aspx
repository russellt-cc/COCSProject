<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatererMenu.aspx.cs" Inherits="COCSProject.RussellTesting.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnCustomerMenu" runat="server" OnClick="btnCustomerMenu_Click" Text="Switch to customer menu" />
            <br />
            <br />
            Caterer menu page<br />
            <br />
            <asp:ListBox ID="lbMenuItems" runat="server" Height="224px" Width="345px"></asp:ListBox>
            <br />
            <br />
            <asp:TextBox ID="txtNewItem" runat="server"></asp:TextBox>
            <asp:Button ID="btnNewItem" runat="server" OnClick="btnNewItem_Click" Text="Add an item" />
            <br />
        </div>
    </form>
</body>
</html>
