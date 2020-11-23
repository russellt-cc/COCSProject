<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 193px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Manage Caterers" />
                    <asp:Button ID="Button2" runat="server" Text="Reports" />
                </td>
                <td>Admin Module- Dashboard</td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="Log-Out" />
                </td>
            </tr>
            <tr>
                <td>Admin_Name: Databound</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2">
                    <asp:Calendar ID="Calendar1" runat="server" Height="16px" Width="102px"></asp:Calendar>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
            <asp:DataList ID="dataListMenu" runat="server" DataKeyField="Dashboard_ID" DataSourceID="dataSourceMenu" OnSelectedIndexChanged="dataListMenu_SelectedIndexChanged">
                <ItemTemplate>
                    Total_Orders:
                    <asp:Label ID="Total_OrdersLabel" runat="server" Text='<%# Eval("Total_Oders") %>' />
                    <br />
                    Not_Confirmed_Orders:
                    <asp:Label ID="Not_Confirmed_Orders" runat="server" Text='<%# Eval("Not_Confirmed_Orders") %>' />
                    <br />
                    Confirmed_Orders:
                    <asp:Label ID="Confirmed_OrdersLabel" runat="server" Text='<%# Eval("Confirmed_Orders") %>' />
                    <br />
                    Total_food_Being_Prepared:
                    <asp:Label ID="Total_food_Being_Prepared" runat="server" Text='<%# Eval("Total_food_Being_Prepared") %>' />
                    <br />
                    Total_Canceled_Orders:
                    <asp:Label ID="Total_Canceled_OrdersLabel" runat="server" Text='<%# Eval("Total_Canceled_Orders") %>' />
                    <br />
                    Total_Registered_Customers:
                    <asp:Label ID="Total_Registered_Customers" runat="server" Text='<%# Eval("Total_Registered_Customers") %>' />
                    <br />
                    
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
