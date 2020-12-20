using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.admin_module
{
    public partial class ManageItems : System.Web.UI.Page
    {

        // Connection string
        private string connectionString = @"Data Source=cocsnerdherd.database.windows.net;Initial Catalog=CateringSystemT02_ASP;Persist Security Info=True;User ID=cocs;Password=password1!";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            String itemID = txtItemID.Text;
            int intItemID = 0;

            try
            {
                // Check if the input is empty
                if (itemID == "") throw new Exception("Enter the ID for the item you want to remove");

                // Check if the input is numeric
                if (!int.TryParse(itemID, out intItemID)) throw new Exception("ID must be numeric");

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

                // Check if the item has an owner
                bool hasOwner = false;
                // Get the items in the items table
                sql = "SELECT Items.Item_ID FROM Items INNER JOIN Caterer_Items ON Items.Item_ID = Caterer_Items.Item_ID";
                command = new SqlCommand(sql, cnn);
                adapter.SelectCommand = command;
                myReader = adapter.SelectCommand.ExecuteReader();
                while (myReader.Read())
                {
                    myItem = int.Parse(myReader["Item_ID"].ToString());
                    if (myItem == intItemID)
                    {
                        hasOwner = true;
                        break;
                    }
                }
                myReader.Close();
                if (hasOwner == true) throw new Exception("That item ID is linked with a caterer");

                // Remove the item from items table
                sql = "DELETE FROM Items WHERE Item_ID='" + intItemID + "'";
                command = new SqlCommand(sql, cnn);
                adapter.InsertCommand = command;
                adapter.InsertCommand.ExecuteNonQuery();

                // Cleanup
                command.Dispose();
                cnn.Close();

                // Show status on status label
                lblRemoveItemStatus.Text = $"Item (<strong>{itemID}</strong>) was removed successfully.";

                // Refresh data grid
                gvMenuItems.DataBind();

            }
            catch (Exception ex)
            {
                lblRemoveItemStatus.Text = $"Item (<strong>{itemID}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: {ex.Message}.";
            }

        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/dashboard2.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/report2.aspx");
        }

        protected void btnManageCaterers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/manage_caterers2.aspx");
        }

        protected void btnManageRoles_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/manageroles.aspx");
        }
    }
}