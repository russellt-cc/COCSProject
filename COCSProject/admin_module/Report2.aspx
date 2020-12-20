<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report2.aspx.cs" Inherits="COCSProject.admin_module.Report2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Reports</title>
    <link rel="stylesheet" type ="text/css" href ="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnDashboard" runat="server" OnClick="btnDashboard_Click" Text="Dashboard" Width="255px" />
            <asp:Button ID="btnManageCaterers" runat="server" OnClick="btnManageCaterers_Click" Text="Manage Caterers" Width="255px" />
            <asp:Button ID="btnManageRoles" runat="server" OnClick="btnManageRoles_Click" Text="Manage Roles and Users" Width="255px" />
            <asp:Button ID="btnManageItems" runat="server" OnClick="btnManageItems_Click" Text="Manage Menu Items" Width="255px" />
            <br />
            <br />
            Admin Reports
    </form>
</body>
</html>
