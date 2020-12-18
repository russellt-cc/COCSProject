<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="COCSProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
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
            <asp:Button ID="btnSearch" runat="server" Text="Search" style="float:right" OnClick="btnSearch_Click" />
            <asp:TextBox ID="txtSearch" runat="server" style="float:right"></asp:TextBox>
            <asp:LoginView ID="LoginView1" runat="server">
                <AnonymousTemplate>
<%--                    (only for anonymous users)<br />--%>
                    <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" Width="255px" />
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Log In" Width="255px" />
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
        <p>
            <strong>NERD HERD COCS (Collaborative Online Catering System)</strong></p>
        <p class="auto-style1">
            Menu:</p>
        <p>
            <asp:DataList ID="dataListMenu" runat="server" DataKeyField="Item_ID" DataSourceID="dataSourceMenu">
                <ItemTemplate>
                    Item_ID:
                    <asp:Label ID="Item_IDLabel" runat="server" Text='<%# Eval("Item_ID") %>' />
                    <br />
                    Item_Name:
                    <asp:Label ID="Item_NameLabel" runat="server" Text='<%# Eval("Item_Name") %>' />
                    <br />
                    Item_Desc:
                    <asp:Label ID="Item_DescLabel" runat="server" Text='<%# Eval("Item_Desc") %>' />
                    <br />
                    Item_Price:
                    <asp:Label ID="Item_PriceLabel" runat="server" Text='<%# Eval("Item_Price") %>' />
                    <br />
                    Item_Calories:
                    <asp:Label ID="Item_CaloriesLabel" runat="server" Text='<%# Eval("Item_Calories") %>' />
                    <br />
                    Item_Inventory:
                    <asp:Label ID="Item_InventoryLabel" runat="server" Text='<%# Eval("Item_Inventory") %>' />
                    <br />
                    Item_Image:
                    <asp:Label ID="Item_ImageLabel" runat="server" Text='<%# Eval("Item_Image") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="dataSourceMenu" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>
        </p>
        <p class="auto-style1">
            Caterers List:</p>
        

        <asp:DataList ID="dataListCaterers" runat="server" DataKeyField="Caterer_ID" DataSourceID="dataSourceCaterers">
            <ItemTemplate>
                Caterer_ID:
                <asp:Label ID="Caterer_IDLabel" runat="server" Text='<%# Eval("Caterer_ID") %>' />
                <br />
                Caterer_Name:
                <asp:Label ID="Caterer_NameLabel" runat="server" Text='<%# Eval("Caterer_Name") %>' />
                <br />
                Caterer_Description:
                <asp:Label ID="Caterer_DescriptionLabel" runat="server" Text='<%# Eval("Caterer_Description") %>' />
                <br />
                Caterer_Phone:
                <asp:Label ID="Caterer_PhoneLabel" runat="server" Text='<%# Eval("Caterer_Phone") %>' />
                <br />
                Caterer_Image:
                <asp:Label ID="Caterer_ImageLabel" runat="server" Text='<%# Eval("Caterer_Image") %>' />
                <br />
<br />
            </ItemTemplate>
        </asp:DataList>


        <asp:SqlDataSource ID="dataSourceCaterers" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT * FROM [Caterers]"></asp:SqlDataSource>


    </form>
</body>
</html>
