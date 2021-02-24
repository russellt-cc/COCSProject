using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.CustomerModule
{
    public partial class cateringPackagesMenu2 : System.Web.UI.Page
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

        protected void btnMyTeam_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myteam2.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/cart2.aspx");
        }

        protected void btnCustomerOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myorders2.aspx");
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnAddItemToCart_Click(object sender, EventArgs e)
        {
            string itemID = txtItemID.Text;
            string quantity = txtItemQuantity.Text;

            int intItemID = 0;
            int intQuantity = 0;

            try
            {
                if (itemID == "") throw new Exception("Enter the item ID");
                if (quantity == "") throw new Exception("Enter the quantity");
                if (!int.TryParse(itemID, out intItemID)) throw new Exception("Item ID must be numeric");
                if (!int.TryParse(quantity, out intQuantity)) throw new Exception("Quantity must be numeric");
                if (intQuantity <= 0) throw new Exception("Quantity must be greater than 0");

                // Check if the item exists
                bool exists = false;
                int myItem = 0;
                // Get the items in the items table
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "SELECT Items.Item_ID FROM Items";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myItem = int.Parse(myReader["Item_ID"].ToString());
                    if (myItem == intItemID)
                    {
                        exists = true;
                        break;
                    }
                }
                myReader.Close();
                if (exists == false) throw new Exception("That item ID does not exist in the items table");

                // Add the item to the cart
                sql = "Insert into Cart_Items (Customer_ID, Item_ID, Quantity) values ('" + userID + "', '" + intItemID + "', '" + intQuantity + "')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                lblAddItemToCartStatus.Text = $"Item (<strong>{itemID}</strong>) was added successfully.";
            }
            catch (Exception ex)
            {
                lblAddItemToCartStatus.Text = $"Item (<strong>{itemID}</strong>) was <strong>NOT</strong> added successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnAddPackageToCart_Click(object sender, EventArgs e)
        {
            string packageID = txtPackageID.Text;
            string quantity = txtPackageQuantity.Text;

            int intPackageID = 0;
            int intQuantity = 0;

            try
            {
                if (packageID == "") throw new Exception("Enter the package ID");
                if (quantity == "") throw new Exception("Enter the quantity");
                if (!int.TryParse(packageID, out intPackageID)) throw new Exception("Package ID must be numeric");
                if (!int.TryParse(quantity, out intQuantity)) throw new Exception("Quantity must be numeric");
                if (intQuantity <= 0) throw new Exception("Quantity must be greater than 0");

                // Check if the item exists
                bool exists = false;
                int myPackage = 0;
                // Get the packages in the packages table
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                string sql = "SELECT Packages.Package_ID FROM Packages";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myPackage = int.Parse(myReader["Package_ID"].ToString());
                    if (myPackage == intPackageID)
                    {
                        exists = true;
                        break;
                    }
                }
                myReader.Close();
                if (exists == false) throw new Exception("That package ID does not exist in the packages table");

                // Add the package to the cart
                sql = "Insert into Cart_Packages (Customer_ID, Package_ID, Quantity) values ('" + userID + "', '" + intPackageID + "', '" + intQuantity + "')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                lblAddPackageToCartStatus.Text = $"Package (<strong>{packageID}</strong>) was added successfully.";
            }
            catch (Exception ex)
            {
                lblAddPackageToCartStatus.Text = $"Package (<strong>{packageID}</strong>) was <strong>NOT</strong> added successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}