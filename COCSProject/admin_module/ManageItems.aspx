<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageItems.aspx.cs" Inherits="COCSProject.admin_module.ManageItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;<asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <br />
            <br />
            <strong>Admin Manage Items Page</strong><br />
            <br />
            <span class="auto-style1">List of all items:</span><asp:GridView ID="gvMenuItems" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID" DataSourceID="SqlDataSourceMenuItems">
                <Columns>
                    <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                    <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                    <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceMenuItems" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Item_ID AS [Item ID], Item_Name AS [Item Name], Item_Desc AS Description, Item_Price AS Price, Item_Calories AS Calories, Item_Inventory AS Inventory, Item_Image AS Image FROM Items"></asp:SqlDataSource>
            <br class="auto-style1" />
            <span class="auto-style1">List of items linked to a caterer:</span><asp:GridView ID="gvItemsWithCaterers" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID,Caterer ID" DataSourceID="SqlDataSourceItemsAndCaterers">
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
                    <asp:BoundField DataField="Description1" HeaderText="Description1" SortExpression="Description1" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Image1" HeaderText="Image1" SortExpression="Image1" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceItemsAndCaterers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Caterers.Caterer_ID AS [Caterer ID], Caterers.Caterer_Name AS [Caterer Name], Caterers.Caterer_Description AS Description, Caterers.Caterer_Phone AS Phone, Caterers.Caterer_Image AS Image FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID INNER JOIN Caterers ON Caterer_Items.Caterer_ID = Caterers.Caterer_ID"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
