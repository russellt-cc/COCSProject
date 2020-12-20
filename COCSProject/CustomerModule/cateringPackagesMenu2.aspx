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
                        Current User Name:
                        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                        <br />
                        Current User ID:
                        <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style1">List of menu items:</span><asp:GridView ID="gvMenuItems" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID,Caterer ID" DataSourceID="SqlDataSourceMenuItems">
                            <Columns>
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                                <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                <asp:BoundField DataField="Caterer ID" HeaderText="Caterer ID" InsertVisible="False" ReadOnly="True" SortExpression="Caterer ID" />
                                <asp:BoundField DataField="Caterer Name" HeaderText="Caterer Name" SortExpression="Caterer Name" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceMenuItems" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Caterers.Caterer_ID AS [Caterer ID], Caterers.Caterer_Name AS [Caterer Name] FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID INNER JOIN Caterers ON Caterer_Items.Caterer_ID = Caterers.Caterer_ID"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Items in packages:</span><asp:GridView ID="gvItemsInPackages" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemsInPackages">
                            <Columns>
                                <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                                <asp:BoundField DataField="Package Name" HeaderText="Package Name" SortExpression="Package Name" />
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInPackages" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID AS [Package ID], Packages.Package_Name AS [Package Name], Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Package_Items.Quantity FROM Packages INNER JOIN Package_Items ON Packages.Package_ID = Package_Items.Package_ID INNER JOIN Items ON Package_Items.Item_ID = Items.Item_ID"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of packages:</span><asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePackages">
                            <Columns>
                                <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                                <asp:BoundField DataField="Package Name" HeaderText="Package Name" SortExpression="Package Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                <asp:BoundField DataField="Limits" HeaderText="Limits" SortExpression="Limits" />
                                <asp:BoundField DataField="Caterer ID" HeaderText="Caterer ID" InsertVisible="False" ReadOnly="True" SortExpression="Caterer ID" />
                                <asp:BoundField DataField="Caterer Name" HeaderText="Caterer Name" SortExpression="Caterer Name" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackages" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID AS [Package ID], Packages.Package_Name AS [Package Name], Packages.Package_Desc AS Description, Packages.Package_Discount AS Discount, Packages.Package_Image AS Image, Caterer_Packages.Limits, Caterers.Caterer_ID AS [Caterer ID], Caterers.Caterer_Name AS [Caterer Name] FROM Packages INNER JOIN Caterer_Packages ON Packages.Package_ID = Caterer_Packages.Package_ID INNER JOIN Caterers ON Caterer_Packages.Caterer_ID = Caterers.Caterer_ID"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Add a menu item to cart:</span><br />
                        <asp:Label ID="Label1" runat="server" Text="Item ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtItemID" runat="server"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Quantity" Width="125px"></asp:Label>
                        <asp:TextBox ID="txtItemQuantity" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnAddItemToCart" runat="server" OnClick="btnAddItemToCart_Click" Text="Add Item to Cart" Width="255px" />
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
                        <asp:Button ID="btnAddPackageToCart" runat="server" OnClick="btnAddPackageToCart_Click" Text="Add Package To Cart" Width="255px" />
                        <br />
                        <asp:Label ID="lblAddPackageToCartStatus" runat="server" Text="Status OK"></asp:Label>
    </form>
</body>
</html>
