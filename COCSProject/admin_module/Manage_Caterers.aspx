<%@ Page Language="C#" %>

<!DOCTYPE html>
<script runat="server">

    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>    
    <style type="text/css">
        .auto-style1 {
            width: 55%;
        }
        .auto-style2 {
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" Text="Dashboard" />
                    <asp:Button ID="Button2" runat="server" Text="Report" />
                </td>
                <td class="auto-style2">
                    Admin Module- Manage Caterers</td>
                <td class="auto-style2">
                    <asp:Button ID="btnLogOut" runat="server" Text="Log-Out" Height="26px" />
                </td>
                
                
            </tr>
            <tr>
                <td class="auto-style2">Admin_Name: Databound</td>
                <td class="auto-style2">Caterer List : </td>
                <td class="auto-style2"></td>
                
                
            </tr>
            <tr>
                <td class="auto-style2"></td>
<%--                <td class="auto-style2">
                    <asp:DataList ID="dataListMenu" runat="server" DataKeyField="Report_ID" DataSourceID="dataSourceMenu" OnSelectedIndexChanged="dataListMenu_SelectedIndexChanged">
                <ItemTemplate>
                    Caterer_1:
                    <asp:Label ID="Caterer_1Label" runat="server" Text='<%# Eval("Caterer_1") %>' />
                    <br />
                    Caterer_2:
                    <asp:Label ID="Caterer_2Label" runat="server" Text='<%# Eval("Caterer_2") %>' />
                    <br />
                    Caterer_3:
                    <asp:Label ID="Caterer_3Label" runat="server" Text='<%# Eval("Caterer_3") %>' />
                    <br />
                    
<br />
                </ItemTemplate>
            </asp:DataList>
                </td>--%>
                <td class="auto-style2"></td>
                
                
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                
                
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                <td class="auto-style2"></td>
                
                
            </tr>
        </table>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
