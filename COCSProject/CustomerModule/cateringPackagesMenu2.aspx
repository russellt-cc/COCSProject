<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cateringPackagesMenu2.aspx.cs" Inherits="COCSProject.CustomerModule.cateringPackagesMenu2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Menu</title>
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
                        <asp:Button ID="btnMyTeam" runat="server" OnClick="btnMyTeam_Click" Text="My Team" Width="255px" />
                        <asp:Button ID="btnCart" runat="server" OnClick="btnCart_Click" Text="Cart" Width="255px" />
                        <asp:Button ID="btnCustomerOrders" runat="server" OnClick="btnCustomerOrders_Click" Text="Orders" Width="255px" />
                        <br />
                        <br />
                        <strong>Customer Menu Page</strong><br />
                        <br />
                        <span class="auto-style1">List of menu items:</span><asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSourceMenuItems">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceMenuItems" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of packages:</span><asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSourcePackages">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackages" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Add a menu item to cart:</span><br />
                        <asp:Label ID="Label1" runat="server" Text="Item ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtItemID" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Quantity" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtItemQuantity" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnAddItemToCart" runat="server" Text="Add Item to Cart" Width="255px" />
                        <br />
                        <asp:Label ID="lblAddItemToCartStatus" runat="server" Text="Status OK"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style1">Add a package to cart:</span><br />
                        <asp:Label ID="Label4" runat="server" Text="Package ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtPackageID" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Quantity" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtPackageQuantity" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnAddPackageToCart" runat="server" Text="Add Package To Cart" Width="255px" />
                        <br />
                        <asp:Label ID="lblAddPackageToCartStatus" runat="server" Text="Status OK"></asp:Label>
    </form>
</body>
</html>
