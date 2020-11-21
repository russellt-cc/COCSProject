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
        <div>
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" Width="255px" />
            <asp:Button ID="btnSearch" runat="server" Text="Search" style="float:right" />
            <asp:TextBox ID="txtSearch" runat="server" style="float:right"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" Width="255px" />
            <br />
            <asp:Button ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" Text="Change Password" Width="255px" />
        </div>
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
