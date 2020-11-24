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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnPackages" runat="server" OnClick="btnPackages_Click" Text="Packages" Width="255px" />
            <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
            <br />
            <br />
            <span class="auto-style1">Menu<br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Item_ID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    Item_ID:
                    <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                    <br />
                    Item_Name:
                    <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                    <br />
                    Item_Desc:
                    <asp:Label ID="Item_DescLabel" runat="server" Text='<%# Eval("Item_Desc") %>' />
                    <br />
                    Item_Price:
                    <asp:Label ID="Item_PriceLabel" runat="server" Text='<%# Eval("Item_Price") %>' />
                    <br />
                    Item_Calories:
                    <asp:Label ID="Item_CaloriesLabel" runat="server" Text='<%# Eval("Item_Calories") %>' />
                    <br />
                    Item_Inventory:
                    <asp:Label ID="Item_InventoryLabel" runat="server" Text='<%# Eval("Item_Inventory") %>' />
                    <br />
                    Item_Image:
                    <asp:Label ID="Item_ImageLabel" runat="server" Text='<%# Eval("Item_Image") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>
            </span>
        </div>
    </form>
</body>
</html>
