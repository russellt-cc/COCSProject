using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.catererModule
{
    public partial class menu : System.Web.UI.Page
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
            string sql = "select Caterer_ID from Caterers where Caterer_Name='" + userName + "'";
            // Initialize command object
            command = new SqlCommand(sql, cnn);
            // Create an SqlDataReader
            SqlDataReader myReader;
            // Execute command
            adapter.SelectCommand = command;
            myReader = adapter.SelectCommand.ExecuteReader();
            // Get the user ID from myReader
            myReader.Read();
            userID = myReader["Caterer_ID"].ToString();
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

        protected void btnPackages_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/packages.aspx");
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/orders.aspx");
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            // Save all the data into strings
            String itemName = txtItemName.Text;
            String itemDescription = txtDescription.Text;
            String itemPrice = txtPrice.Text;
            String itemCalories = txtCalories.Text;
            String itemInventory = txtInventory.Text;

            Decimal decimalPrice = 0;

            int intCalories = 0;
            int intInventory = 0;

            try
            {
                // Validate the inputs
                // Check if item name is empty
                if (itemName == "") throw new Exception("Item name must not be empty");
                // Check if item price is empty
                if (itemPrice == "") throw new Exception("Item price must not be empty");
                // Check if price is numeric
                if (!decimal.TryParse(itemPrice, out decimalPrice)) throw new Exception("Item price must be numeric");
                // Check if calories are numeric
                if (itemCalories != "" && !int.TryParse(itemCalories, out intCalories)) throw new Exception("Calories must be numeric");
                // Check if inventory is numeric
                if (itemInventory != "" && !int.TryParse(itemInventory, out intInventory)) throw new Exception("Inventory must be numeric");

                // Insert the item into the database
                // Creating and opening connection to db
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                // Make insert query
                string sql = "Insert into Items (Item_Name, Item_Desc, Item_Price, Item_Calories, Item_Inventory) values('" + itemName + "', '" + itemDescription + "', '" + decimalPrice + "', '" + intCalories + "', '" + intInventory + "')";
                // Initialize command object
                command = new SqlCommand(sql, cnn);
                // Execute command
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Get the latest entry in the items table
                sql = "SELECT TOP 1 Item_ID FROM Items ORDER BY Item_ID DESC";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                myReader.Read();
                String ItemID = myReader["Item_ID"].ToString();
                myReader.Close();

                // Create a new entry in Caterer_Items table
                sql = "Insert into Caterer_Items (Item_ID, Caterer_ID) values ('" + int.Parse(ItemID) + "', '" + int.Parse(userID) + "')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                // Show status on status label
                lblStatusItem.Text = $"Item (<strong>{itemName}</strong>) was created successfully. Item ID: " + ItemID;

                // Refresh data grid
                gvMyMenu.DataBind();

            }
            catch (Exception ex)
            {
                lblStatusItem.Text = $"Item (<strong>{itemName}</strong>) was <strong>NOT</strong> created successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}