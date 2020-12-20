<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage_Caterers2.aspx.cs" Inherits="COCSProject.admin_module.Manage_Caterers2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Manage Caterers</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" type ="text/css" href ="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnDashboard" runat="server" OnClick="btnDashboard_Click" Text="Dashboard" Width="255px" />
            <asp:Button ID="btnReports" runat="server" OnClick="btnReports_Click" Text="Reports" Width="255px" />
            <asp:Button ID="btnManageRoles" runat="server" OnClick="btnManageRoles_Click" Text="Manage Roles and Users" Width="255px" />
            <asp:Button ID="btnManageItems" runat="server" OnClick="btnManageItems_Click" Text="Manage Menu Items" Width="255px" />
            <br />
            <br />
            <strong>Admin Manage Caterers</strong><br />
            <br />
            <span class="auto-style1">Caterer Table</span><asp:GridView ID="gvCatererTable" runat="server" AutoGenerateColumns="False" DataKeyNames="Caterer ID" DataSourceID="SqlDataSourceCatererTable">
                <Columns>
                    <asp:BoundField DataField="Caterer ID" HeaderText="Caterer ID" InsertVisible="False" ReadOnly="True" SortExpression="Caterer ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCatererTable" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Caterer_ID AS [Caterer ID], Caterer_Name AS Name, Caterer_Description AS Description, Caterer_Phone AS Phone, Caterer_Image AS Image FROM Caterers"></asp:SqlDataSource>
            Caterer Name:
            <asp:TextBox ID="txtCatererName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddCaterers" runat="server" OnClick="btnAddCaterers_Click" Text="Add a Caterer" Width="255px" />
            <asp:Button ID="btnRemoveCaterers" runat="server" OnClick="btnRemoveCaterers_Click" Text="Remove a Caterer" Width="255px" />
            <br />
            <%--            <asp:Button ID="btnAddAllCaterers" runat="server" OnClick="btnAddAllCaterers_Click" Text="Add All Approved Caterers" Width="255px" />
            <asp:Button ID="btnRemoveOldCaterers" runat="server" OnClick="btnRemoveOldCaterers_Click" Text="Remove All Old Caterers" Width="255px" />
            <br />--%>
            <asp:Label ID="lblStatusCatererTable" runat="server" Text="Status OK"></asp:Label>
            <br />
            <br />
            <span class="auto-style1">List of approved caterers:</span><asp:GridView ID="gvApprovedCaterers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCaterers">
                <Columns>
                    <asp:BoundField DataField="User Name" HeaderText="User Name" SortExpression="User Name" />
                    <asp:BoundField DataField="Last Activity Date" HeaderText="Last Activity Date" SortExpression="Last Activity Date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCaterers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserName AS [User Name], aspnet_Users.LastActivityDate AS [Last Activity Date] FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = N'Caterer')"></asp:SqlDataSource>
            <br />
            <span class="auto-style1">List of potential caterers:</span><asp:GridView ID="gvPotentialCaterers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePotential">
                <Columns>
                    <asp:BoundField DataField="User Name" HeaderText="User Name" SortExpression="User Name" />
                    <asp:BoundField DataField="Last Activity Date" HeaderText="Last Activity Date" SortExpression="Last Activity Date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourcePotential" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserName AS [User Name], aspnet_Users.LastActivityDate AS [Last Activity Date] FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = N'PotentialCaterer')"></asp:SqlDataSource>
            <br />
            <span class="auto-style1">List of declined caterers:</span><asp:GridView ID="gvDeclinedCaterers" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceDeclined">
                <Columns>
                    <asp:BoundField DataField="User Name" HeaderText="User Name" SortExpression="User Name" />
                    <asp:BoundField DataField="Last Activity Date" HeaderText="Last Activity Date" SortExpression="Last Activity Date" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceDeclined" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT aspnet_Users.UserName AS [User Name], aspnet_Users.LastActivityDate AS [Last Activity Date] FROM aspnet_Users INNER JOIN aspnet_UsersInRoles ON aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = N'DeclinedCaterer')"></asp:SqlDataSource>
            <br />
            <span class="auto-style1">Approve or decline a caterer:</span><br />
            User Name: <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnApprove" runat="server" OnClick="btnApprove_Click" Text="Approve Request" Width="255px" />
            <asp:Button ID="btnDecline" runat="server" OnClick="btnDecline_Click" Text="Decline Request" Width="255px" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text="Status OK"></asp:Label>
    </form>
</body>
</html>
