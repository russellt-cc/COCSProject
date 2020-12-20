<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="COCSProject.catererModule.orders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Menu" Width="255px" />
            <asp:Button ID="btnPackages" runat="server" OnClick="btnPackages_Click" Text="Packages" Width="255px" />
            <br />
            <br />
            <strong>Caterer Orders Page</strong><br />
            Current Caterer Name:
            <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            <br />
            Current Caterer ID:
            <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">Order Details</span><asp:GridView ID="gvOrders" runat="server" DataSourceID="SqlDataSourceOrders">
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
