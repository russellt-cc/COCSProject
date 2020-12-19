<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cateringPackagesMenu.aspx.cs" Inherits="COCSProject.common.cateringPackagesMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function AddToCart() {
            
        }
    </script>
    <style>
        *{
            box-sizing: border-box;
        }
        body{
            background-color: white;
            margin: 50px;
            width: 894px;
        }
        article{
            float: left;
            width: 70%;
            background-color: lightgrey;
            border-right: 10px solid white;
            padding: 15px;
            
        }
        aside{
            float: right;
            width: 30%;
            background-color: lightgrey;
            padding: 10px;
        }
        .clearfix::after {
            content: "";
            display: table;
            clear: both;
        }
        menuList{
            text-decoration: underline;
        }
        .nav a {
	        float: left;
	        display: block;
	        color: black;
	        text-align: center;
	        padding: 14px 16px;
	        text-decoration: none;
	        width: 20%;
            background-color: grey;
        }
        .nav a:hover {
	        background-color: black;
	        color: white;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="../COCSProject.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="nav">
				<a href="homepage.aspx">Home</a>
				<a href="login.aspx">Login</a>
				<a href="profile.aspx">Profile</a>
                <a href="register.aspx">Register</a>
                <a href="search.aspx">Search</a>
		</div>
        <main class="clearfix">
            <article>
                <h1>Caterers and Packages</h1>
                <asp:DataList ID="dataListPackages" runat="server" DataKeyField="Caterer_ID" DataSourceID="dataSourceCaterers">
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
                
            </article>
            <aside><h1>Menu Items</h1>
                        <h3 class="menuList">Drinks</h3>
                    <ul>
                        <li>Drink 1<button onclick="AddToCart()">+</button></li>
                        <li>drink 2<button onclick="AddToCart()">+</button></li>
                        <li>drink 3<button onclick="AddToCart()">+</button></li>
                    </ul>
                        <h3 class="menuList">Meals</h3>
                    <ul>
                        <li>meal 1<button onclick="AddToCart()">+</button></li>
                        <li>meal 2<button onclick="AddToCart()">+</button></li>
                        <li>meal 3<button onclick="AddToCart()">+</button></li>
                    </ul>
            </aside>
        </main>
    </form>
</body>
</html>
