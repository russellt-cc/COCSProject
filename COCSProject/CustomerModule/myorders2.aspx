<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myorders2.aspx.cs" Inherits="COCSProject.CustomerModule.myorders2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Orders</title>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
                        <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
                        <asp:Button ID="btnTeam" runat="server" OnClick="btnTeam_Click" Text="My Team" Width="255px" />
                        <asp:Button ID="btnCustomerMenu" runat="server" OnClick="btnCustomerMenu_Click" Text="Menu/Packages" Width="255px" />
                        <asp:Button ID="btnCart" runat="server" OnClick="btnCart_Click" Text="Cart" Width="255px" />
                        <br />
                        <br />
                        <strong>Customer Orders Page</strong><br />
                        <br />
                        <span class="auto-style1">My Orders:</span><asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                        <br />
                        I<span class="auto-style1">tems in My Orders:</span><asp:GridView ID="GridView2" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Items in Packages in My Orders:</span><asp:GridView ID="GridView3" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
                        <br />
                        <br />
                        <span class="auto-style1">Packages in My Orders:</span><asp:GridView ID="GridView4" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
