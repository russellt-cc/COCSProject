<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="COCSProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head runat="server">
    <title>COCS NERD HERD</title>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="btnSearch" runat="server" Text="Search" Style="float: right" OnClick="btnSearch_Click" />
        <asp:TextBox ID="txtSearch" runat="server" Style="float: right"></asp:TextBox>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <%--                    (only for anonymous users)<br />--%>
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register for a New Account" Width="255px" />
                <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log In" Width="255px" />
                <asp:Button ID="btnForgotPassword" runat="server" OnClick="btnForgotPassword_Click" Text="Forgot Password?" Width="255px" />
            </AnonymousTemplate>
            <LoggedInTemplate>
                <%--                    (only for logged in users)<br />--%>
                <asp:Button ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" Text="Change Password" Width="255px" />
                <asp:Button ID="btnProfile" runat="server" OnClick="btnProfile_Click" Text="View Profile" Width="255px" />
                <br />
            </LoggedInTemplate>
        </asp:LoginView>
        <br />
        <asp:LoginView ID="LoginView2" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <%--                            (only for admins)<br />--%>
                        <asp:Button ID="btnDashboard" runat="server" OnClick="btnDashboard_Click" Text="Dashboard" Width="255px" />
                        <asp:Button ID="btnReports" runat="server" OnClick="btnReports_Click" Text="Reports" Width="255px" />
                        <asp:Button ID="btnManageCaterers" runat="server" OnClick="btnManageCaterers_Click" Text="Manage Caterers" Width="255px" />
                        <asp:Button ID="btnRoleManager" runat="server" OnClick="btnRoleManager_Click" Text="Manage Roles and Users" Width="255px" />
                        <asp:Button ID="btnManageItems" runat="server" OnClick="btnManageItems_Click" Text="Manage Menu Items" Width="255px" />
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Caterer">
                    <ContentTemplate>
                        <%--                            (only for caterers)<br />--%>
                        <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Menu" Width="255px" />
                        <asp:Button ID="btnPackages" runat="server" OnClick="btnPackages_Click" Text="Packages" Width="255px" />
                        <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Customer">
                    <ContentTemplate>
                        <%--                            (only for customers)<br />--%>
                        <asp:Button ID="btnTeam" runat="server" OnClick="btnTeam_Click" Text="My Team" Width="255px" />
                        <asp:Button ID="btnCustomerMenu" runat="server" OnClick="btnCustomerMenu_Click" Text="Menu/Packages" Width="255px" />
                        <asp:Button ID="btnCart" runat="server" OnClick="btnCart_Click" Text="Cart" Width="255px" />
                        <asp:Button ID="btnCustomerOrders" runat="server" OnClick="btnCustomerOrders_Click" Text="Orders" Width="255px" />
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="PotentialCaterer">
                    <ContentTemplate>
                        An administrator will review your request to become a caterer.
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="DeclinedCaterer">
                    <ContentTemplate>
                        Sorry, your request has been rejected.
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        <br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
        <br />
        <br />
        <strong>NERD HERD COCS (Collaborative Online Catering System)</strong>
        <br />
        <br />
        <span class="auto-style1">Menu:</span>
        <asp:GridView ID="gvMenu" runat="server" AutoGenerateColumns="False" DataKeyNames="Item ID,Caterer ID" DataSourceID="dataSourceMenu">
            <Columns>
                <asp:BoundField DataField="Item ID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="Item ID" />
                <asp:BoundField DataField="Item Name" HeaderText="Item Name" SortExpression="Item Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                <asp:BoundField DataField="Inventory" HeaderText="Inventory" SortExpression="Inventory" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                <asp:BoundField DataField="Caterer ID" HeaderText="Caterer ID" InsertVisible="False" ReadOnly="True" SortExpression="Caterer ID" />
                <asp:BoundField DataField="Caterer Name" HeaderText="Caterer Name" SortExpression="Caterer Name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dataSourceMenu" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Items.Item_ID AS [Item ID], Items.Item_Name AS [Item Name], Items.Item_Desc AS Description, Items.Item_Price AS Price, Items.Item_Calories AS Calories, Items.Item_Inventory AS Inventory, Items.Item_Image AS Image, Caterers.Caterer_ID AS [Caterer ID], Caterers.Caterer_Name AS [Caterer Name] FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID INNER JOIN Caterers ON Caterer_Items.Caterer_ID = Caterers.Caterer_ID"></asp:SqlDataSource>
        <br />
        <span class="auto-style1">Caterers List:</span>
        <asp:GridView ID="gvCaterers" runat="server" AutoGenerateColumns="False" DataKeyNames="Caterer ID" DataSourceID="dataSourceCaterers">
            <Columns>
                <asp:BoundField DataField="Caterer ID" HeaderText="Caterer ID" InsertVisible="False" ReadOnly="True" SortExpression="Caterer ID" />
                <asp:BoundField DataField="Caterer Name" HeaderText="Caterer Name" SortExpression="Caterer Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="dataSourceCaterers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Caterer_ID AS [Caterer ID], Caterer_Name AS [Caterer Name], Caterer_Description AS Description, Caterer_Phone AS Phone, Caterer_Image AS Image FROM Caterers"></asp:SqlDataSource>
    </form>
</body>
</html>
