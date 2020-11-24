using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                Response.Redirect("search.aspx");
            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/menu.aspx");
        }

        protected void btnPackages_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/packages.aspx");
        }

        protected void btnOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/catererModule/orders.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/dashboard.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/report.aspx");
        }

        protected void btnManageCaterers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/manage_caterers.aspx");
        }

        protected void btnTeam_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myteam.aspx");
        }

        protected void btnCustomerMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/cateringPackagesMenu.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/cart.aspx");
        }

        protected void btnCustomerOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myorders.aspx");
        }
    }
}