<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="COCSProject.catererModule.menu" %>

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
            <asp:Button ID="btnPackages" runat="server" OnClick="btnPackages_Click" Text="Packages" Width="255px" />
            <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
            <br />
            <br />
            <strong>Caterer Menu Page</strong><br />
            Current User: <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">Menu<br />
            <asp:GridView ID="gvMyMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID" DataSourceID="SqlDataSourceMyMenu">
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
            <asp:SqlDataSource ID="SqlDataSourceMyMenu" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID INNER JOIN Caterers ON Caterer_Items.Caterer_ID = Caterers.Caterer_ID WHERE (Caterers.Caterer_Name = @myName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Item Name" Width="125px"></asp:Label>
            <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Description" Width="125px"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Price" Width="125px"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Calories" Width="125px"></asp:Label>
            <asp:TextBox ID="txtCalories" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Inventory" Width="125px"></asp:Label>
            <asp:TextBox ID="txtInventory" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddItem" runat="server" Text="Add a New Item" Width="255px" />
            </span>
        </div>
    </form>
</body>
</html>
