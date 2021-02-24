using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.catererModule
{
    public partial class WebForm1 : System.Web.UI.Page
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

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/menu.aspx");
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/orders.aspx");
        }

        protected void btnAddPackage_Click(object sender, EventArgs e)
        {
            // Save all the data into strings
            String packageName = txtPackageName.Text;
            String packageDescription = txtPackageDescription.Text;
            String packageDiscount = txtPackageDiscount.Text;
            String packageLimits = txtPackageLimits.Text;

            Decimal decimalPackageDiscount = 0;

            int intPackageLimits = 0;

            try
            {
                // Validate the inputs
                // Check if package name is empty
                if (packageName == "") throw new Exception("Package name must not be empty");
                // Check if limits is empty
                if (packageLimits == "") throw new Exception("Package limits must not be empty");
                // Check if discount is numeric
                if (packageDiscount != "" && !decimal.TryParse(packageDiscount, out decimalPackageDiscount)) throw new Exception("Package discount must be numeric");
                // Check if limits is numeric
                if (!int.TryParse(packageLimits, out intPackageLimits)) throw new Exception("Package limits must be numeric");

                // Insert the package into the database
                // Creating and opening connection to db
                SqlConnection cnn = new SqlConnection(connectionString);
                cnn.Open();
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                // Make insert query
                string sql = "Insert into Packages (Package_Name, Package_Desc, Package_Discount) values('" + packageName + "', '" + packageDescription + "', '" + decimalPackageDiscount + "')";
                // Initialize command object
                command = new SqlCommand(sql, cnn);
                // Execute command
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Get the latest entry in the packages table
                sql = "SELECT TOP 1 Package_ID FROM Packages ORDER BY Package_ID DESC";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                SqlDataReader myReader = adapter.SelectCommand.ExecuteReader();
                myReader.Read();
                String PackageID = myReader["Package_ID"].ToString();
                myReader.Close();

                // Create a new entry in Caterer_Packages table
                sql = "Insert into Caterer_Packages (Package_ID, Caterer_ID, Limits) values ('" + int.Parse(PackageID) + "', '" + int.Parse(userID) + "', '" + intPackageLimits + "')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                // Show status on status label
                lblStatusAddPackage.Text = $"Package (<strong>{packageName}</strong>) was created successfully. Package ID: " + PackageID;

                // Refresh data grid
                gvMyPackages.DataBind();

            }
            catch (Exception ex)
            {
                lblStatusAddPackage.Text = $"Item (<strong>{packageName}</strong>) was <strong>NOT</strong> created successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnAddItemToPackage_Click(object sender, EventArgs e)
        {
            string packageID = txtPackageID.Text;
            string itemID = txtItemID.Text;
            string quantity = txtQuantity.Text;

            int intPackageID = 0;
            int intItemID = 0;
            int intQuantity = 0;

            try
            {
                // Validate the inputs
                // Check if package ID is empty
                if (packageID == "") throw new Exception("Package ID must not be empty");
                // Check if item ID is empty
                if (itemID == "") throw new Exception("Item ID must not be empty");
                // Check if quantity is empty
                if (quantity == "") throw new Exception("Quantity must not be empty");
                // Check if package ID is numeric
                if (!int.TryParse(packageID, out intPackageID)) throw new Exception("Package ID must be numeric");
                // Check if item ID is numeric
                if (!int.TryParse(itemID, out intItemID)) throw new Exception("Item ID must be numeric");
                // Check if quantity is numeric
                if (!int.TryParse(quantity, out intQuantity)) throw new Exception("Quantity must be numeric");

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

                // Check if the package is owned by the user
                belongsToMe = false;
                int myPackage = 0;
                // Get the packages for the current user
                cnn = new SqlConnection(connectionString);
                cnn.Open();
                adapter = new SqlDataAdapter();
                sql = "SELECT Packages.Package_ID FROM Packages INNER JOIN Caterer_Packages ON Packages.Package_ID = Caterer_Packages.Package_ID WHERE (Caterer_Packages.Caterer_ID = " + userID + ")";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myPackage = int.Parse(myReader["Package_ID"].ToString());
                    if (myPackage == intPackageID)
                    {
                        belongsToMe = true;
                        break;
                    }
                }
                myReader.Close();
                if (belongsToMe == false) throw new Exception("That package ID does not belong to you");

                // Add the item to the package
                sql = "Insert into Package_Items (Package_ID, Item_ID, Quantity) values ('" + intPackageID + "', '" + intItemID + "', '" + intQuantity + "')";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Show status on status label
                lblAddItemToPackageStatus.Text = $"Item (<strong>{itemID}</strong>) was added successfully. Package ID: " + packageID;

                // Refresh data grid
                gvItemsInPackages.DataBind();
            }
            catch (Exception ex)
            {
                lblAddItemToPackageStatus.Text = $"Item (<strong>{itemID}</strong>) was <strong>NOT</strong> added successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}