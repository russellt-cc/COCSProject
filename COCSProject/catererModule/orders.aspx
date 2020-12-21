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
            <span class="auto-style1">Items Ordered By Customers:</span><asp:GridView ID="gvItemsOrdered" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID" DataSourceID="SqlDataSourceItemsOrdered">
                <Columns>
                    <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                    <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                    <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceItemsOrdered" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Items.Item_Desc AS Description, Order_Items.Quantity, Orders.Status FROM Items INNER JOIN Order_Items ON Items.Item_ID = Order_Items.Item_ID INNER JOIN Orders ON Order_Items.Order_ID = Orders.OrderID INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID INNER JOIN Caterers ON Caterer_Items.Caterer_ID = Caterers.Caterer_ID WHERE (Caterers.Caterer_Name = @myName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
