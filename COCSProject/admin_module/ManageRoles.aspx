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
            <asp:Button ID="btnNewRole" runat="server" OnClick="btnNewRole_Click" Text="Create a New Role" Width="255px" />
            <asp:Button ID="btnRemoveRole" runat="server" OnClick="btnRemoveRole_Click" Text="Remove Role" Width="255px" />
            <br />
            <br />
            <asp:Label ID="lblActionStatus" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">Roles List:</span><br />
            <asp:GridView ID="gvRolesList" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationId,LoweredRoleName" DataSourceID="sqlDataSourceRoles">
                <Columns>
                    <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" ReadOnly="True" SortExpression="ApplicationId" />
                    <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                    <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                    <asp:BoundField DataField="LoweredRoleName" HeaderText="LoweredRoleName" ReadOnly="True" SortExpression="LoweredRoleName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="sqlDataSourceRoles" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
            <br />
            Assign Roles:<br />
            Role:
            <asp:TextBox ID="txtSelectRole" runat="server"></asp:TextBox>
            <br />
            User:
            <asp:TextBox ID="txtSelectUser" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAssignRole" runat="server" OnClick="btnAssignRole_Click" Text="Assign Role" Width="255px" />
            <asp:Button ID="btnUnassignRole" runat="server" OnClick="btnUnassignRole_Click" Text="Unassign Role" Width="255px" />
            <br />
            <br />
            <asp:Label ID="lblActionStatus2" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <%--            <asp:DropDownList ID="ddlRoles" runat="server" DataSourceID="SqlDataSourceRoles" DataTextField="RoleName" DataValueField="RoleId" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label ID="lblRoleID" runat="server" Text="Label"></asp:Label>
            <br />
            <br />--%>
            <span class="auto-style1">Users in Roles List:</span><%--<asp:DataList ID="dlUserList" runat="server" DataSourceID="SqlDataSourceUsersInRoles">
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
            </asp:DataList>--%>
            <br />
            <asp:GridView ID="gvUsersInRolesList" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUsersInRoles">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                    <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceUsersInRoles" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="select aspnet_Users.UserName, aspnet_Users.UserId, aspnet_UsersInRoles.RoleId, aspnet_Roles.RoleName
from aspnet_Users
left join aspnet_UsersInRoles
on aspnet_Users.UserId = aspnet_UsersInRoles.UserId
left join aspnet_Roles
on aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId"></asp:SqlDataSource>
            <br />
            Manage Users:<br />
            User Name:
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Text="Add User" Width="255px" />
            <asp:Button ID="btnRemoveUser" runat="server" Text="Remove User" Width="255px" />
            <br />
            <br />
            <asp:Label ID="lblActionStatus3" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">Users List:</span><%--<asp:DataList ID="dlUsers" runat="server" DataKeyField="ApplicationId" DataSourceID="SqlDataSourceUsers">
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
            </asp:DataList>--%>
            <br />
            <asp:GridView ID="gvUsersList" runat="server" AutoGenerateColumns="False" DataKeyNames="ApplicationId,LoweredUserName" DataSourceID="SqlDataSourceUsers">
                <Columns>
                    <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" ReadOnly="True" SortExpression="ApplicationId" />
                    <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="LoweredUserName" HeaderText="LoweredUserName" ReadOnly="True" SortExpression="LoweredUserName" />
                    <asp:BoundField DataField="MobileAlias" HeaderText="MobileAlias" SortExpression="MobileAlias" />
                    <asp:CheckBoxField DataField="IsAnonymous" HeaderText="IsAnonymous" SortExpression="IsAnonymous" />
                    <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" SortExpression="LastActivityDate" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
