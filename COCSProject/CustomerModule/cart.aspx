<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="COCSProject.CustomerModule.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function removeItem() {
            if (confirm('Are you sure you want to remove that item')) {

            } else {

            }
        }
        function checkout() {
            if (confirm('Are you ready to check out?')) {

            } else {

            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <h1>Users Name</h1>
    <ul>
        <li>Item 1<button onclick="removeItem()">Remove item</button></li>
        <li>Item 2<button onclick="removeItem()">Remove item</button></li>
        <li>Item 3<button onclick="removeItem()">Remove item</button></li>
    </ul>
    <p>Total cost:</p>
    <button onclick="checkout()">Checkout</button>
</body>
</html>
