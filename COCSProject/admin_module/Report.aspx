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
            text-align: left;
            height: 42px;
        }
        .auto-style3 {
            height: 42px;
        }
        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">   
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Dashboard" />
                    <asp:Button ID="Button2" runat="server" Text="Manage Caterers" />
                </td>
                <td>Admin Module - Reports</td>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="LogOut" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><asp:DataList ID="dataListMenu1" runat="server" DataKeyField="Admin_Name" DataSourceID="dataSourceMenu" OnSelectedIndexChanged="dataListMenu_SelectedIndexChanged">
                <ItemTemplate>
                    Admin_Name:
                    <asp:Label ID="Admin_NameLabel" runat="server" Text='<%# Eval("Admin_Name") %>' />
                    
<br />
                </ItemTemplate>
            </asp:DataList>
                    <br />
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Calendar ID="Calendar3" runat="server" Height="16px" Width="175px"></asp:Calendar>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Report :</td>
                <td class="auto-style3"></td>
                <td class="auto-style3">
                    <br />
                    Previous Report : </td>
            </tr>
            <tr>
                <td><asp:DataList ID="dataListMenu" runat="server" DataKeyField="Report_ID" DataSourceID="dataSourceMenu" OnSelectedIndexChanged="dataListMenu_SelectedIndexChanged">
                <ItemTemplate>
                    Order_Count:
                    <asp:Label ID="Order_CountLabel" runat="server" Text='<%# Eval("Order_Count") %>' />
                    <br />
                    Daily_Sales:
                    <asp:Label ID="Daily_SalesLabel" runat="server" Text='<%# Eval("Daily_Sales") %>' />
                    <br />
                    Weekly_Sales:
                    <asp:Label ID="Weekly_SalesLabel" runat="server" Text='<%# Eval("Weekly_Sales") %>' />
                    <br />
                    Monthly_Sales:
                    <asp:Label ID="Monthly_SalesLabel" runat="server" Text='<%# Eval("Monthly_Sales") %>' />
                    <br />
                    Quarterly_Sales:
                    <asp:Label ID="Quarterly_SalesLabel" runat="server" Text='<%# Eval("Quarterly_Sales") %>' />
                    <br />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
                </td>
                <td>&nbsp;</td>
                <td><asp:DataList ID="dataListMenu0" runat="server" DataKeyField="Previous_Report_ID" DataSourceID="dataSourceMenu" OnSelectedIndexChanged="dataListMenu_SelectedIndexChanged">
                <ItemTemplate>
                    Order_Count:
                    <asp:Label ID="Order_CountLabel" runat="server" Text='<%# Eval("Order_Count") %>' />
                    <br />
                    Daily_Sales:
                    <asp:Label ID="Daily_SalesLabel" runat="server" Text='<%# Eval("Daily_Sales") %>' />
                    <br />
                    Weekly_Sales:
                    <asp:Label ID="Weekly_SalesLabel" runat="server" Text='<%# Eval("Weekly_Sales") %>' />
                    <br />
                    Monthly_Sales:
                    <asp:Label ID="Monthly_SalesLabel" runat="server" Text='<%# Eval("Monthly_Sales") %>' />
                    <br />
                    Quarterly_Sales:
                    <asp:Label ID="Quarterly_SalesLabel" runat="server" Text='<%# Eval("Quarterly_Sales") %>' />
                    <br />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
