﻿using System;
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
        //private string connectionString = @"Data Source=cocsnerdherd.database.windows.net;Initial Catalog=CateringSystemT02_ASP;Persist Security Info=True;User ID=cocs;Password=password1!";
        private string connectionString = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=CateringSystemT02_ASP;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";

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

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            // Save the data into a string
            String itemID = txtItemID.Text;
            int intItemID = 0;

            try
            {
                // Check if the input is empty
                if (itemID == "") throw new Exception("Enter the ID for the item you want to remove");

                // Check if the input is numeric
                if (!int.TryParse(itemID, out intItemID)) throw new Exception("ID must be numeric");

                // Check if the item belongs to the current user
                bool belongsToMe = false;
                int myItem = 0;
                // Get the items for the current user
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "SELECT Items.Item_ID FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID WHERE (Caterer_Items.Caterer_ID = " + userID + ")";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myItem = int.Parse(myReader["Item_ID"].ToString());
                    if (myItem == intItemID)
                    {
                        belongsToMe = true;
                        break;
                    }
                }
                myReader.Close();
                if (belongsToMe == false) throw new Exception("That item ID does not belong to you");

                // Remove the item from items table
                sql = "DELETE FROM Items WHERE Item_ID='" + intItemID + "'";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Remove the item from caterers items table
                sql = "DELETE FROM Caterer_Items WHERE Item_ID='" + intItemID + "'";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                // Show status on status label
                lblRemoveStatus.Text = $"Item (<strong>{itemID}</strong>) was removed successfully.";

                // Refresh data grid
                gvMyMenu.DataBind();

            }
            catch (Exception ex)
            {
                lblRemoveStatus.Text = $"Item (<strong>{itemID}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: {ex.Message}.";
            }

        }

        protected void btnUpdateInventory_Click(object sender, EventArgs e)
        {
            String itemID = txtItemID2.Text;
            String inventory = txtInventory2.Text;

            int intItemID = 0;
            int intInventory = 0;

            try
            {
                // Check if the input is empty
                if (itemID == "") throw new Exception("Enter the ID for the item you want to update");
                if (inventory == "") throw new Exception("Enter the inventory for the item you want to update");

                // Check if the input is numeric
                if (!int.TryParse(itemID, out intItemID)) throw new Exception("Item ID must be numeric");
                if (!int.TryParse(inventory, out intInventory)) throw new Exception("Inventory must be numeric");

                // Check if the item belongs to the current user
                bool belongsToMe = false;
                int myItem = 0;
                // Get the items for the current user
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "SELECT Items.Item_ID FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID WHERE (Caterer_Items.Caterer_ID = " + userID + ")";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myItem = int.Parse(myReader["Item_ID"].ToString());
                    if (myItem == intItemID)
                    {
                        belongsToMe = true;
                        break;
                    }
                }
                myReader.Close();
                if (belongsToMe == false) throw new Exception("That item ID does not belong to you");

                // Update the inventory
                sql = "Update Items set Item_Inventory=" + intInventory + "where Item_ID=" + intItemID;
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                // Show status on status label
                lblUpdateInventoryStatus.Text = $"Item (<strong>{itemID}</strong>) was updated successfully.";

                // Refresh data grid
                gvMyMenu.DataBind();
            }
            catch (Exception ex)
            {
                lblUpdateInventoryStatus.Text = $"Item (<strong>{itemID}</strong>) was <strong>NOT</strong> updated successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}