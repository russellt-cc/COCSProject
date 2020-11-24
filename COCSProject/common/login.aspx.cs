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
        private string connectionString = @"Data Source=localhost\SQLEXPRESS;Initial Catalog=CateringSystemT02;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            if (reqCookies != null)
            {
                Response.Redirect("profile.aspx");
            }
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotPassword.aspx");
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
            sql = "SELECT Password, User_Name FROM Users WHERE User_Name = " + user;
            command = new SqlCommand(sql, cnn);

            dataReader = command.ExecuteReader();

            // Get output of query
            while (dataReader.Read())
            {
                Output = Output + dataReader.GetValue(0);
            }

            if (Output == pass)
            {
                HttpCookie userInfo = new HttpCookie("userInfo");
                userInfo["UserName"] = user;
                if (ckbStayLogged.Checked)
                {
                    userInfo.Expires = DateTime.Now.AddDays(30);
                } 
                else
                {
                    userInfo.Expires = DateTime.Now.AddHours(6);
                }

                Response.Cookies.Add(userInfo);
                Response.Redirect("profile.aspx");
            }
            else
            {
                txtUserName.Text = "Something went wrong!";
            }
        }
    }
}