<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="COCSProject.admin_module.ManageRoles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnDashboard" runat="server" OnClick="btnDashboard_Click" Text="Dashboard" Width="255px" />
            <asp:Button ID="btnReports" runat="server" OnClick="btnReports_Click" Text="Reports" Width="255px" />
            <asp:Button ID="btnManageCaterers" runat="server" OnClick="btnManageCaterers_Click" Text="Manage Caterers" Width="255px" />
            <br />
            Admin Manage Roles<br />
            <br />
            Create Roles:<br />
            Role Name:
            <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnNewRole" runat="server" OnClick="btnNewRole_Click" Text="Create a New Role" />
            <br />
            <br />
            <asp:Label ID="lblActionStatus" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            Roles List:<br />
            <asp:DataList ID="gvRolesList" runat="server" DataKeyField="ApplicationId" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    ApplicationId:
<%--                    <asp:Label ID="ApplicationIdLabel" runat="server" Text='<%# Eval("ApplicationId") %>' />
                    <br />
                    RoleId:
                    <asp:Label ID="RoleIdLabel" runat="server" Text='<%# Eval("RoleId") %>' />
                    <br />--%>
                    RoleName:
                    <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Eval("RoleName") %>' />
<%--                    <br />
                    LoweredRoleName:
                    <asp:Label ID="LoweredRoleNameLabel" runat="server" Text='<%# Eval("LoweredRoleName") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
<br />--%>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
