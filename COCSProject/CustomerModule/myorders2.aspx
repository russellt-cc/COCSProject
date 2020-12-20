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
                        I<span class="auto-style1">tems in My Orders:</span><asp:GridView ID="gvItemsInMyOrders" runat="server" DataSourceID="SqlDataSourceItemsInMyOrders">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInMyOrders" runat="server"></asp:SqlDataSource>
                        <br />
                        <span class="auto-style1">Items in Packages in My Orders:</span><asp:GridView ID="gvItemsInPackagesInMyOrders" runat="server" DataSourceID="SqlDataSourceItemsInPackagesInMyOrders">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourceItemsInPackagesInMyOrders" runat="server"></asp:SqlDataSource>
                        <br />
                        <br />
                        <span class="auto-style1">Packages in My Orders:</span><asp:GridView ID="gvPackagesInMyOrders" runat="server" DataSourceID="SqlDataSourcePackagesInMyOrders">
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSourcePackagesInMyOrders" runat="server"></asp:SqlDataSource>
    </form>
</body>
</html>
