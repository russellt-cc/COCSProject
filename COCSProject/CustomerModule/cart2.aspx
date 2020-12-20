<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart2.aspx.cs" Inherits="COCSProject.CustomerModule.cart2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Cart</title>
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
                        <asp:Button ID="btnCustomerOrders" runat="server" OnClick="btnCustomerOrders_Click" Text="Orders" Width="255px" />
                        <br />
                        <br />
                        <strong>Customer Cart Page<br />
                        </strong>Current User Name:
                        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                        <br />
                        Current User ID:
                        <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style1">List of items in cart:</span><asp:GridView ID="gvItemsInCart" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInCart" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of items in packages in cart:</span><asp:GridView ID="gvItemsInPackagesInCart" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInPackagesInCart" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of packages in cart:</span><asp:GridView ID="gvPackagesInCart" runat="server">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackagesInCart" runat="server" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Update an item:</span><br />
                        <asp:Label ID="Label1" runat="server" Text="Item ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Quantity" Width="125px"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnUpdateItem" runat="server" Text="Update Item" Width="255px" />
                        <br />
                        <asp:Label ID="lblUpdateItemStatus" runat="server" Text="Status OK"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style1">Update a package:</span><br />
                        <asp:Label ID="Label4" runat="server" Text="Package ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Quantity" Width="125px"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="Button2" runat="server" Text="Update Package" Width="255px" />
                        <br />
                        <asp:Label ID="lblUpdatePackageStatus" runat="server" Text="Status OK"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="btnCheckout" runat="server" Text="Submit Order" Width="255px" />
                        <br />
    </form>
</body>
</html>
