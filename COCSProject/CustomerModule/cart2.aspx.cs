using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.CustomerModule
{
    public partial class cart2 : System.Web.UI.Page
    {
        // Connection string
        //private string connectionString = @"Data Source=cocsnerdherd.database.windows.net;Initial Catalog=CateringSystemT02_ASP;Persist Security Info=True;User ID=cocs;Password=password1!";
        private string connectionString = @"Server=tcp:cocsnerdherd.database.windows.net,1433;Initial Catalog=CateringSystemT02_ASP;Persist Security Info=False;User ID=cocs;Password=password1!;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30";

        String userName;
        String userID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the user name
            userName = System.Web.HttpContext.Current.User.Identity.Name;
            // Display user name on a label
            lblUserName.Text = userName;

            // Get the user ID
            // Creating and opening connection to db
            SqlConnection cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();
            // Make insert query
            string sql = "select Customer_ID from Customers where Customer_Name='" + userName + "'";
            // Initialize command object
            command = new SqlCommand(sql, cnn);
            // Create an SqlDataReader
            SqlDataReader myReader;
            // Execute command
            adapter.SelectCommand = command;
            myReader = adapter.SelectCommand.ExecuteReader();
            // Get the user ID from myReader
            myReader.Read();
            userID = myReader["Customer_ID"].ToString();
            myReader.Close();
            // Display user ID on label
            lblUserID.Text = userID;
            // Cleanup
            command.Dispose();
            cnn.Close();
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnTeam_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myteam2.aspx");
        }

        protected void btnCustomerMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/cateringPackagesMenu2.aspx");
        }

        protected void btnCustomerOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myorders2.aspx");
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            string orderID = "0";

            try
            {
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlCommand command2 = new SqlCommand();
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlDataAdapter adapter2 = new SqlDataAdapter();
                string sql;
                string sql2;

                // Get the latest order in the orders table
                sql = "SELECT TOP 1 OrderID FROM Orders ORDER BY OrderID DESC";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                if (myReader.Read()) orderID = myReader["OrderID"].ToString();
                myReader.Close();

                // Increment the order id by 1
                orderID = (int.Parse(orderID) + 1).ToString();

                // Create a new entry in the orders table
                sql = "Insert into Orders (OrderID, Customer_ID, Status) values ('" + orderID + "', '" + userID + "', 'Pending')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // For each item in the cart
                // Get the items in the cart
                sql = "SELECT Item_ID, Quantity FROM Cart_Items WHERE (Customer_ID = "+ userID + ")";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                myReader = adapter.SelectCommand.ExecuteReader();
                string itemID;
                string quantity;
                while (myReader.Read())
                {
                    // Get item ID and quantity
                    itemID = myReader["Item_ID"].ToString();
                    quantity = myReader["Quantity"].ToString();
                    // Create an entry in the order_items table
                    sql2 = "INSERT into Order_Items (Order_ID, Item_ID, Quantity) values (" + orderID + ", " + itemID + ", " + quantity + ")";
                    command2 = new SqlCommand(sql2, cnn);
                    adapter2.InsertCommand = command2;
                    adapter2.InsertCommand.ExecuteNonQuery();
                    // Remove the item from the cart_items table
                    sql2 = "DELETE TOP(1) FROM Cart_Items WHERE(Customer_ID = " + userID + ") AND (Item_ID = " + itemID + ") AND (Quantity = " + quantity + ")";
                    command2 = new SqlCommand(sql2, cnn);
                    adapter2.InsertCommand = command2;
                    adapter2.InsertCommand.ExecuteNonQuery();
                }
                myReader.Close();

                // For each package in the cart
                // Get the packages in the cart
                sql = "SELECT Package_ID, Quantity FROM Cart_Packages WHERE (Customer_ID = " + userID + ")";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                myReader = adapter.SelectCommand.ExecuteReader();
                string packageID;
                string packageQuantity;
                while (myReader.Read())
                {
                    // Get item ID and quantity
                    packageID = myReader["Package_ID"].ToString();
                    packageQuantity = myReader["Quantity"].ToString();
                    // Create an entry in the order_packages table
                    sql2 = "INSERT into Order_Packages (Order_ID, Package_ID, Quantity) values (" + orderID + ", " + packageID + ", " + packageQuantity + ")";
                    command2 = new SqlCommand(sql2, cnn);
                    adapter2.InsertCommand = command2;
                    adapter2.InsertCommand.ExecuteNonQuery();
                    // Remove the item from the cart_packages table
                    sql2 = "DELETE TOP(1) FROM Cart_Packages WHERE(Customer_ID = " + userID + ") AND (Package_ID = " + packageID + ") AND (Quantity = " + packageQuantity + ")";
                    command2 = new SqlCommand(sql2, cnn);
                    adapter2.InsertCommand = command2;
                    adapter2.InsertCommand.ExecuteNonQuery();
                }
                myReader.Close();

                // Cleanup
                command.Dispose();
                command2.Dispose();
                cnn.Close();

                // Update data grids
                gvItemsInCart.DataBind();
                gvItemsInPackagesInCart.DataBind();
                gvPackagesInCart.DataBind();

                // Show status
                lblOrderStatus.Text = $"Order (<strong>{orderID}</strong>) was submitted successfully.";
            }
            catch (Exception ex)
            {
                lblOrderStatus.Text = $"Order (<strong>{orderID}</strong>) was <strong>NOT</strong> submitted successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}