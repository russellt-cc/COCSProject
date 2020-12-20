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
        private string connectionString = @"Data Source=cocsnerdherd.database.windows.net;Initial Catalog=CateringSystemT02_ASP;Persist Security Info=True;User ID=cocs;Password=password1!";

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
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql;

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
                // Create an entry in the order_items table
                // Remove the item from the cart_items table

                // For each package in the cart
                // Create an entry in the order_packages table
                // Remove the item from the cart_packages table

                // Cleanup
                command.Dispose();
                cnn.Close();

                lblOrderStatus.Text = $"Order (<strong>{orderID}</strong>) was submitted successfully.";
            }
            catch (Exception ex)
            {
                lblOrderStatus.Text = $"Order (<strong>{orderID}</strong>) was <strong>NOT</strong> submitted successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}