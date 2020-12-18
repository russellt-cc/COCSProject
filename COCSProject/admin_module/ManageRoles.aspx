<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="COCSProject.admin_module.ManageRoles" %>

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
            <asp:Button ID="btnDashboard" runat="server" OnClick="btnDashboard_Click" Text="Dashboard" Width="255px" />
            <asp:Button ID="btnReports" runat="server" OnClick="btnReports_Click" Text="Reports" Width="255px" />
            <asp:Button ID="btnManageCaterers" runat="server" OnClick="btnManageCaterers_Click" Text="Manage Caterers" Width="255px" />
            <br />
            <span class="auto-style1"><strong>Admin Manage Roles</strong></span><br />
            <br />
            Create Roles:<br />
            Role Name:
            <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnNewRole" runat="server" OnClick="btnNewRole_Click" Text="Create a New Role" />
            <asp:Button ID="btnRemoveRole" runat="server" OnClick="btnRemoveRole_Click" Text="Remove Role" />
            <br />
            <br />
            <asp:Label ID="lblActionStatus" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">Roles List:</span><br />
            <asp:DataList ID="dlRolesList" runat="server" DataKeyField="ApplicationId" DataSourceID="SqlDataSourceRoles">
                <ItemTemplate>
                    ApplicationId:
                    <asp:Label ID="ApplicationIdLabel" runat="server" Text='<%# Eval("ApplicationId") %>' />
                    <br />
                    RoleId:
                    <asp:Label ID="RoleIdLabel" runat="server" Text='<%# Eval("RoleId") %>' />
                    <br />
                    RoleName:
                    <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Eval("RoleName") %>' />
                    <br />
                    LoweredRoleName:
                    <asp:Label ID="LoweredRoleNameLabel" runat="server" Text='<%# Eval("LoweredRoleName") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="sqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
            <br />
<%--            <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="SqlDataSourceRoles" DataTextField="RoleName" DataValueField="RoleId" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label ID="lblRoleID" runat="server" Text="Label"></asp:Label>
            <br />
            <br />--%>
            <span class="auto-style1">Users in Roles List:</span><asp:DataList ID="dlUserList" runat="server" DataSourceID="SqlDataSourceUsersInRoles">
                <ItemTemplate>
                    UserName:
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    <br />
                    UserId:
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                    <br />
                    RoleId:
                    <asp:Label ID="RoleIdLabel" runat="server" Text='<%# Eval("RoleId") %>' />
<br />
                    RoleName:
                    <asp:Label ID="RoleNameLabel" runat="server" Text='<%# Eval("RoleName") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceUsersInRoles" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="select aspnet_Users.UserName, aspnet_Users.UserId, aspnet_UsersInRoles.RoleId, aspnet_Roles.RoleName
from aspnet_Users
left join aspnet_UsersInRoles
on aspnet_Users.UserId = aspnet_UsersInRoles.UserId
left join aspnet_Roles
on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId"></asp:SqlDataSource>
            <br />
            <span class="auto-style1">Users List:</span><asp:DataList ID="dlUsers" runat="server" DataKeyField="ApplicationId" DataSourceID="SqlDataSourceUsers">
                <ItemTemplate>
                    ApplicationId:
                    <asp:Label ID="ApplicationIdLabel" runat="server" Text='<%# Eval("ApplicationId") %>' />
                    <br />
                    UserId:
                    <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
                    <br />
                    UserName:
                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                    <br />
                    LoweredUserName:
                    <asp:Label ID="LoweredUserNameLabel" runat="server" Text='<%# Eval("LoweredUserName") %>' />
                    <br />
                    MobileAlias:
                    <asp:Label ID="MobileAliasLabel" runat="server" Text='<%# Eval("MobileAlias") %>' />
                    <br />
                    IsAnonymous:
                    <asp:Label ID="IsAnonymousLabel" runat="server" Text='<%# Eval("IsAnonymous") %>' />
                    <br />
                    LastActivityDate:
                    <asp:Label ID="LastActivityDateLabel" runat="server" Text='<%# Eval("LastActivityDate") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
