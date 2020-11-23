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
                <td class="auto-style2">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                        <asp:ListItem>Databound</asp:ListItem>
                        <asp:ListItem>Databound</asp:ListItem>
                        <asp:ListItem>Databound</asp:ListItem>
                        <asp:ListItem>Databound</asp:ListItem>
                        <asp:ListItem>Databound</asp:ListItem>
                        <asp:ListItem>Databound</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
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
