<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="COCSProject.catererModule.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
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
            <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
            <br />
            <br class="auto-style1" />
            <strong>Caterer Packages Page</strong><span class="auto-style1"><br />
            Current Caterer Name:
            <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            <br />
            Current Caterer ID:
            <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <span class="auto-style2">My Packages:</span><asp:GridView ID="gvMyPackages" runat="server" AutoGenerateColumns="False" DataKeyNames="Package ID" DataSourceID="SqlDataSourceMyPackages">
                <Columns>
                    <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                    <asp:BoundField DataField="Limits" HeaderText="Limits" SortExpression="Limits" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceMyPackages" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID AS [Package ID], Packages.Package_Name AS Name, Packages.Package_Desc AS Description, Packages.Package_Discount AS Discount, Packages.Package_Image AS Image, Caterer_Packages.Limits FROM Caterer_Packages INNER JOIN Packages ON Caterer_Packages.Package_ID = Packages.Package_ID INNER JOIN Caterers ON Caterer_Packages.Caterer_ID = Caterers.Caterer_ID WHERE (Caterers.Caterer_Name = @myName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Items in Packages:<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package_ID" DataSourceID="SqlDataSourceItemsInPackages">
                <Columns>
                    <asp:BoundField DataField="Package_ID" HeaderText="Package_ID" InsertVisible="False" ReadOnly="True" SortExpression="Package_ID" />
                    <asp:BoundField DataField="Package_Name" HeaderText="Package_Name" SortExpression="Package_Name" />
                    <asp:BoundField DataField="Package_Desc" HeaderText="Package_Desc" SortExpression="Package_Desc" />
                    <asp:BoundField DataField="Package_Discount" HeaderText="Package_Discount" SortExpression="Package_Discount" />
                    <asp:BoundField DataField="Package_Image" HeaderText="Package_Image" SortExpression="Package_Image" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Item_Name" HeaderText="Item_Name" SortExpression="Item_Name" />
                    <asp:BoundField DataField="Item_Desc" HeaderText="Item_Desc" SortExpression="Item_Desc" />
                    <asp:BoundField DataField="Item_Price" HeaderText="Item_Price" SortExpression="Item_Price" />
                    <asp:BoundField DataField="Item_Calories" HeaderText="Item_Calories" SortExpression="Item_Calories" />
                    <asp:BoundField DataField="Item_Inventory" HeaderText="Item_Inventory" SortExpression="Item_Inventory" />
                    <asp:BoundField DataField="Item_Image" HeaderText="Item_Image" SortExpression="Item_Image" />
                    <asp:BoundField DataField="Limits" HeaderText="Limits" SortExpression="Limits" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceItemsInPackages" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID, Packages.Package_Name, Packages.Package_Desc, Packages.Package_Discount, Packages.Package_Image, Package_Items.Quantity, Items.Item_Name, Items.Item_Desc, Items.Item_Price, Items.Item_Calories, Items.Item_Inventory, Items.Item_Image, Caterer_Packages.Limits FROM Packages INNER JOIN Package_Items ON Packages.Package_ID = Package_Items.Package_ID INNER JOIN Items ON Package_Items.Item_ID = Items.Item_ID INNER JOIN Caterer_Packages ON Packages.Package_ID = Caterer_Packages.Package_ID INNER JOIN Caterers ON Caterer_Packages.Caterer_ID = Caterers.Caterer_ID WHERE (Caterers.Caterer_Name = @myName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <span class="auto-style2">My Menu:</span><asp:GridView ID="gvMyMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID" DataSourceID="SqlDataSourceMyMenu">
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
            <span class="auto-style2">Add a New Package:</span><br />
            <asp:Label ID="Label1" runat="server" Text="Package Name" Width="125px"></asp:Label>
            <asp:TextBox ID="txtPackageName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Package Description" Width="125px"></asp:Label>
            <asp:TextBox ID="txtPackageDescription" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Package Discount" Width="125px"></asp:Label>
            <asp:TextBox ID="txtPackageDiscount" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Package Limits" Width="125px"></asp:Label>
            <asp:TextBox ID="txtPackageLimits" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddPackage" runat="server" OnClick="btnAddPackage_Click" Text="Add a New Package" Width="255px" />
            <br />
            <asp:Label ID="lblStatusAddPackage" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <span class="auto-style2">Add an Item to a Package:</span><br />
            <asp:Label ID="Label4" runat="server" Text="Package ID" Width="125px"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Item ID" Width="125px"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddItemToPackage" runat="server" Text="Add Item to Package" Width="255px" />
            <br />
            <asp:Label ID="lblAddItemToPackageStatus" runat="server" Text="Status OK"></asp:Label>
            </span>
        </div>
    </form>
</body>
</html>
