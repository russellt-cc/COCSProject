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
                        Current User Name:
                        <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                        <br />
                        Current User ID:
                        <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        <span class="auto-style1">My Orders:</span><asp:GridView ID="gvMyOrders" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceMyOrders">
                            <Columns>
                                <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" />
                                <asp:BoundField DataField="Date Ordered" HeaderText="Date Ordered" SortExpression="Date Ordered" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceMyOrders" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT OrderID AS [Order ID], Date_Ordered AS [Date Ordered], Status FROM Orders WHERE (Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        I<span class="auto-style1">tems in My Orders:</span><asp:GridView ID="gvItemsInMyOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID" DataSourceID="SqlDataSourceItemsInMyOrders">
                            <Columns>
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                                <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" />
                                <asp:BoundField DataField="Date Ordered" HeaderText="Date Ordered" SortExpression="Date Ordered" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInMyOrders" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Order_Items.Quantity, Orders.OrderID AS [Order ID], Orders.Date_Ordered AS [Date Ordered], Orders.Status FROM Items INNER JOIN Order_Items ON Items.Item_ID = Order_Items.Item_ID INNER JOIN Orders ON Order_Items.Order_ID = Orders.OrderID WHERE (Orders.Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Items in Packages in My Orders:</span><asp:GridView ID="gvItemsInPackagesInMyOrders" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceItemsInPackagesInMyOrders">
                            <Columns>
                                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                                <asp:BoundField DataField="Item Description" HeaderText="Item Description" SortExpression="Item Description" />
                                <asp:BoundField DataField="Item Price" HeaderText="Item Price" SortExpression="Item Price" />
                                <asp:BoundField DataField="Item Calories" HeaderText="Item Calories" SortExpression="Item Calories" />
                                <asp:BoundField DataField="Item Inventory" HeaderText="Item Inventory" SortExpression="Item Inventory" />
                                <asp:BoundField DataField="Item Image" HeaderText="Item Image" SortExpression="Item Image" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                                <asp:BoundField DataField="Package Name" HeaderText="Package Name" SortExpression="Package Name" />
                                <asp:BoundField DataField="Package Description" HeaderText="Package Description" SortExpression="Package Description" />
                                <asp:BoundField DataField="Package Discount" HeaderText="Package Discount" SortExpression="Package Discount" />
                                <asp:BoundField DataField="Package Image" HeaderText="Package Image" SortExpression="Package Image" />
                                <asp:BoundField DataField="Order Quantity" HeaderText="Order Quantity" SortExpression="Order Quantity" />
                                <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" />
                                <asp:BoundField DataField="Date Ordered" HeaderText="Date Ordered" SortExpression="Date Ordered" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInPackagesInMyOrders" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS [Item Description], Items.Item_Price AS [Item Price], Items.Item_Calories AS [Item Calories], Items.Item_Inventory AS [Item Inventory], Items.Item_Image AS [Item Image], Package_Items.Quantity, Packages.Package_ID AS [Package ID], Packages.Package_Name AS [Package Name], Packages.Package_Desc AS [Package Description], Packages.Package_Discount AS [Package Discount], Packages.Package_Image AS [Package Image], Order_Packages.Quantity AS [Order Quantity], Orders.OrderID AS [Order ID], Orders.Date_Ordered AS [Date Ordered], Orders.Status FROM Items INNER JOIN Package_Items ON Items.Item_ID = Package_Items.Item_ID INNER JOIN Packages ON Package_Items.Package_ID = Packages.Package_ID INNER JOIN Order_Packages ON Package_Items.Package_ID = Order_Packages.Package_ID INNER JOIN Orders ON Order_Packages.Order_ID = Orders.OrderID WHERE (Orders.Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Packages in My Orders:</span><asp:GridView ID="gvPackagesInMyOrders" runat="server" AutoGenerateColumns="False" DataKeyNames="Package ID" DataSourceID="SqlDataSourcePackagesInMyOrders">
                            <Columns>
                                <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                                <asp:BoundField DataField="Package Name" HeaderText="Package Name" SortExpression="Package Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" />
                                <asp:BoundField DataField="Date Ordered" HeaderText="Date Ordered" SortExpression="Date Ordered" />
                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackagesInMyOrders" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID AS [Package ID], Packages.Package_Name AS [Package Name], Packages.Package_Desc AS Description, Packages.Package_Discount AS Discount, Packages.Package_Image AS Image, Order_Packages.Quantity, Orders.OrderID AS [Order ID], Orders.Date_Ordered AS [Date Ordered], Orders.Status FROM Packages INNER JOIN Order_Packages ON Packages.Package_ID = Order_Packages.Package_ID CROSS JOIN Orders WHERE (Orders.Customer_ID = @myID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lblUserID" Name="myID" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Cancel an order:</span><br />
                        <asp:Label ID="Label1" runat="server" Text="Order ID" Width="125px"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel Order" Width="255px" />
                        <br />
                        <asp:Label ID="lblCancelOrderStatus" runat="server" Text="Status OK"></asp:Label>
    </form>
</body>
</html>
