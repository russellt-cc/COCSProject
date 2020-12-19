<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="COCSProject.search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
        </p>
        <p style="font-weight: 700">
            Search Page
        </p>
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <span class="auto-style1">Non-Registered User Search</span><br />
                <br />
                Food Item&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtFoodItem" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            </AnonymousTemplate>
            <LoggedInTemplate>
                <span class="auto-style1">Registered User Search</span><br />
                <br />
                Order&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtOrder" runat="server"></asp:TextBox>
                <br />
                Caterer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCaterer" runat="server"></asp:TextBox>
                <br />
                Food Item&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtFoodItem" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Search" />
            </LoggedInTemplate>
        </asp:LoginView>
    </form>
</body>
</html>
