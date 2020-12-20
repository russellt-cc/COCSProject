<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="COCSProject.catererModule.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnHomePage" runat="server" OnClick="btnHomePage_Click" Text="Home Page" Width="255px" />
            <asp:Button ID="btnMenu" runat="server" OnClick="btnMenu_Click" Text="Menu" Width="255px" />
            <asp:Button ID="btnOrders" runat="server" OnClick="btnOrders_Click" Text="Orders" Width="255px" />
            <br />
            <br class="auto-style1" />
            <strong>Caterer Packages Page</strong><span class="auto-style1"><br />
            Current Caterer Name:
            <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
            <br />
            Current Caterer ID:
            <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <span class="auto-style2">My Packages:</span><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Package ID" DataSourceID="SqlDataSourceMyPackages">
                <Columns>
                    <asp:BoundField DataField="Package ID" HeaderText="Package ID" InsertVisible="False" ReadOnly="True" SortExpression="Package ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
                    <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
                    <asp:BoundField DataField="Limits" HeaderText="Limits" SortExpression="Limits" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceMyPackages" runat="server" ConnectionString="<%$ ConnectionStrings:CateringSystemT02ConnectionString %>" SelectCommand="SELECT Packages.Package_ID AS [Package ID], Packages.Package_Name AS Name, Packages.Package_Desc AS Description, Packages.Package_Discount AS Discount, Packages.Package_Image AS Image, Caterer_Packages.Limits FROM Caterer_Packages INNER JOIN Packages ON Caterer_Packages.Package_ID = Packages.Package_ID INNER JOIN Caterers ON Caterer_Packages.Caterer_ID = Caterers.Caterer_ID WHERE (Caterers.Caterer_Name = @myName)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblUserName" Name="myName" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            My Menu:<br />
            </span>
        </div>
    </form>
</body>
</html>
