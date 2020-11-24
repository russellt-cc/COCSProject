using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject
{
    public partial class login : System.Web.UI.Page
    {
        // Connection string
        private string connectionString = @"Data Source=cocsnerdherd.database.windows.net;Initial Catalog=CateringSystemT02;Persist Security Info=True;User ID=cocs;Password=password1!";
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {
                Response.Redirect("~/common/profile.aspx");
            }
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/forgotPassword.aspx");
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            // Vars
            string user = txtUserName.Text;
            string pass = txtPassword.Text;

            // Creating and opening connection to db
            SqlConnection cnn = new SqlConnection(connectionString);
            cnn.Open();

            // SQL vars
            SqlCommand command;
            SqlDataReader dataReader;
            string sql, Output = "";

            // Building query and command
            sql = "SELECT Password, User_Name FROM Users WHERE User_Name ='" + user + "'";
            command = new SqlCommand(sql, cnn);

            dataReader = command.ExecuteReader();

            // Get output of query
            while (dataReader.Read())
            {
                Output = Output + dataReader.GetValue(0);
            }

            // Cleanup
            dataReader.Close();
            command.Dispose();
            cnn.Close();

            if (Output == pass)
            {
                // Make cookie
                HttpCookie userInfo = new HttpCookie("userInfo");
                // Populate cookie
                userInfo["UserName"] = user;
                // Check stay logged in box and set expiry on cookie
                if (ckbStayLogged.Checked)
                {
                    userInfo.Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    userInfo.Expires = DateTime.Now.AddMinutes(5);
                }

                // Push cookie
                Response.Cookies.Add(userInfo);
                Response.Redirect("~/common/profile.aspx");
            }
            else
            {
                // Odd error detection
                txtUserName.Text = "Something went wrong!";
            }
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("/common/homepage.aspx");
        }
    }
}