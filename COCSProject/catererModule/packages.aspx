<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="COCSProject.catererModule.WebForm1" %>

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
            <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Menu" Width="255px" />
            <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
            <br />
            <br class="auto-style1" />
            <span class="auto-style1">Packages<br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Package_ID" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    Package_ID:
                    <asp:Label ID="Package_IDLabel" runat="server" Text='<%# Eval("Package_ID") %>' />
                    <br />
                    Caterer_ID:
                    <asp:Label ID="Caterer_IDLabel" runat="server" Text='<%# Eval("Caterer_ID") %>' />
                    <br />
                    Limits:
                    <asp:Label ID="LimitsLabel" runat="server" Text='<%# Eval("Limits") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [Caterer_Packages]"></asp:SqlDataSource>
            </span>
        </div>
    </form>
</body>
</html>
