using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject
{
    public partial class register : System.Web.UI.Page
    {
        private string connectionString = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=CateringSystemT02;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlUserType.SelectedValue == "Customer")
            {
                CreateNewCustomerEntry(txtUserName.Text);
            }
            else if (ddlUserType.SelectedValue == "Caterer")
            {
                CreateNewCatererEntry(txtUserName.Text);
            }
        }

        private void CreateNewCustomerEntry(string name)
        {
            
        }

        private void CreateNewCatererEntry(string name)
        {
            SqlConnection cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();

            string sql = "Insert into Caterers (Caterer_Name) values('" + name + "')";

            command = new SqlCommand(sql, cnn);

            adapter.InsertCommand = command;
            adapter.InsertCommand.ExecuteNonQuery();

            command.Dispose();
            cnn.Close();
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }
    }
}