<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myteam.aspx.cs" Inherits="COCSProject.CustomerModule.myteam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function RemoveMemberCF() {
            if (confirm('Are you sure you want to remove this group member?')) {
                //delete member
            } else {
                //dont delete member
            }
        }

        function DeleteGroupCF() {
            if (confirm('Are you sure you want to delete the group?')) {
                //delete group
            } else {
                //dont delete group
            }

            function InviteUser() {

            }
        }
    </script>
</head>
<body>
    <h1>Group Name</h1>
    <h3>Coordinator:/Placeholder/</h3>
    <ul>
        <li>Member 1<button onclick="RemoveMemberCF()">Remove</button></li>
        <li>Member 2<button onclick="RemoveMemberCF()">Remove</button></li>
        <li>Member 3<button onclick="RemoveMemberCF()">Remove</button></li>
    </ul>
    <button onclick="InviteUser()">Invite</button>
    <button onclick="DeleteGroupCF()">Delete Group</button>
</body>
</html>
