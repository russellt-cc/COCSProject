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
                        <span class="auto-style1">List of items in cart:</span><asp:GridView ID="gvItemsInCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemsInCart">
                            <Columns>
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" SortExpression="Item ID" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                                <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                <asp:BoundField DataField="Total Price" HeaderText="Total Price" ReadOnly="True" SortExpression="Total Price" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInCart" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Cart_Items.Item_ID AS [Item ID], Cart_Items.Quantity, Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Cart_Items.Quantity * Items.Item_Price AS [Total Price] FROM Cart_Items INNER JOIN Items ON Cart_Items.Item_ID = Items.Item_ID INNER JOIN Customers ON Cart_Items.Customer_ID = Customers.Customer_ID WHERE (Customers.Customer_Name = @myName)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of items in packages in cart:</span><asp:GridView ID="gvItemsInPackagesInCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemsInPackagesInCart">
                            <Columns>
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Item Description" HeaderText="Item Description" SortExpression="Item Description" />
                                <asp:BoundField DataField="Item Price" HeaderText="Item Price" SortExpression="Item Price" />
                                <asp:BoundField DataField="Item Calories" HeaderText="Item Calories" SortExpression="Item Calories" />
                                <asp:BoundField DataField="Item Inventory" HeaderText="Item Inventory" SortExpression="Item Inventory" />
                                <asp:BoundField DataField="Item Image" HeaderText="Item Image" SortExpression="Item Image" />
                                <asp:BoundField DataField="Package ID" HeaderText="Package ID" SortExpression="Package ID" />
                                <asp:BoundField DataField="Package Quantity" HeaderText="Package Quantity" SortExpression="Package Quantity" />
                                <asp:BoundField DataField="Package Name" HeaderText="Package Name" SortExpression="Package Name" />
                                <asp:BoundField DataField="Package Description" HeaderText="Package Description" SortExpression="Package Description" />
                                <asp:BoundField DataField="Package Discount" HeaderText="Package Discount" SortExpression="Package Discount" />
                                <asp:BoundField DataField="Package Image" HeaderText="Package Image" SortExpression="Package Image" />
                                <asp:BoundField DataField="Cart Quantity" HeaderText="Cart Quantity" SortExpression="Cart Quantity" />
                                <asp:BoundField DataField="Total Quantity" HeaderText="Total Quantity" ReadOnly="True" SortExpression="Total Quantity" />
                                <asp:BoundField DataField="Total Price" HeaderText="Total Price" ReadOnly="True" SortExpression="Total Price" />
                                <asp:BoundField DataField="Price With Discount" HeaderText="Price With Discount" ReadOnly="True" SortExpression="Price With Discount" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInPackagesInCart" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS [Item Description], Items.Item_Price AS [Item Price], Items.Item_Calories AS [Item Calories], Items.Item_Inventory AS [Item Inventory], Items.Item_Image AS [Item Image], Package_Items.Package_ID AS [Package ID], Package_Items.Quantity AS [Package Quantity], Packages.Package_Name AS [Package Name], Packages.Package_Desc AS [Package Description], Packages.Package_Discount AS [Package Discount], Packages.Package_Image AS [Package Image], Cart_Packages.Quantity AS [Cart Quantity], Package_Items.Quantity * Cart_Packages.Quantity AS [Total Quantity], Package_Items.Quantity * Cart_Packages.Quantity * Items.Item_Price AS [Total Price], Package_Items.Quantity * Cart_Packages.Quantity * Items.Item_Price - Package_Items.Quantity * Cart_Packages.Quantity * Items.Item_Price * Packages.Package_Discount AS [Price With Discount] FROM Items INNER JOIN Package_Items ON Items.Item_ID = Package_Items.Item_ID INNER JOIN Packages ON Package_Items.Package_ID = Packages.Package_ID INNER JOIN Cart_Packages ON Package_Items.Package_ID = Cart_Packages.Package_ID WHERE (Cart_Packages.Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">List of packages in cart:</span><asp:GridView ID="gvPackagesInCart" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePackagesInCart">
                            <Columns>
                                <asp:BoundField DataField="Package_ID" HeaderText="Package_ID" SortExpression="Package_ID" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Package_Name" HeaderText="Package_Name" SortExpression="Package_Name" />
                                <asp:BoundField DataField="Package_Desc" HeaderText="Package_Desc" SortExpression="Package_Desc" />
                                <asp:BoundField DataField="Package_Discount" HeaderText="Package_Discount" SortExpression="Package_Discount" />
                                <asp:BoundField DataField="Package_Image" HeaderText="Package_Image" SortExpression="Package_Image" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackagesInCart" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="SELECT Cart_Packages.Package_ID, Cart_Packages.Quantity, Packages.Package_Name, Packages.Package_Desc, Packages.Package_Discount, Packages.Package_Image FROM Cart_Packages INNER JOIN Packages ON Cart_Packages.Package_ID = Packages.Package_ID WHERE (Cart_Packages.Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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
                        <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Submit Order" Width="255px" />
                        <br />
                        <asp:Label ID="lblOrderStatus" runat="server" Text="Status OK"></asp:Label>
                        <br />
    </form>
</body>
</html>
