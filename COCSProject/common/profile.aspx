<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="COCSProject.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Image ID="Image1" runat="server" Height="255px" Width="255px" />
            <br />
            <asp:Button ID="btnChangePicture" runat="server" Text="Change Picture" Width="255px" />
            <br />
            <br />
            <strong>User Information</strong><br />
            Note: Username and email cannot be changed<br />
            <br />
            User Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblUserName" runat="server" Text="(username here)"></asp:Label>
            <br />
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblEmail" runat="server" Text="(email here)"></asp:Label>
            <br />
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server">(first name here)</asp:TextBox>
            <br />
            Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server">(last name here)</asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnUpdate" runat="server" Text="Update Information" Width="255px" />
            <asp:Button ID="btnChangePassword" runat="server" OnClick="btnChangePassword_Click" Text="Change Password" Width="255px" />
        </div>
    </form>
</body>
</html>
