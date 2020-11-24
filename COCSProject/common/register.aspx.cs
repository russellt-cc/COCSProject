﻿using System;
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
        // Connection string
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
            // Vars
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Creating and opening connection to db
            SqlConnection cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();

            // Make insert query
            string sql = "Insert into Users (User_Name, Type, First_Name, Last_Name, Email, Password) values('" + name + "', 'customer', '" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "')";

            // Initialize command object
            command = new SqlCommand(sql, cnn);

            // Execute command
            adapter.InsertCommand = command;
            adapter.InsertCommand.ExecuteNonQuery();

            // Cleanup
            command.Dispose();
            cnn.Close();
        }

        private void CreateNewCatererEntry(string name)
        {
            // Vars
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Creating and opening connection to db
            SqlConnection cnn = new SqlConnection(connectionString);
            cnn.Open();
            SqlCommand command;
            SqlDataAdapter adapter = new SqlDataAdapter();

            // Make insert query
            string sql = "Insert into Users (User_Name, Type, First_Name, Last_Name, Email, Password) values('" + name + "', 'caterer', '" + firstName + "', '" + lastName + "', '" + email + "', " + password + "')";

            // Initialize command object
            command = new SqlCommand(sql, cnn);

            // Execute command
            adapter.InsertCommand = command;
            adapter.InsertCommand.ExecuteNonQuery();

            // Cleanup
            command.Dispose();
            cnn.Close();
        }



        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }
    }
}