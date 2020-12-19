using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.catererModule
{
    public partial class menu : System.Web.UI.Page
    {

        String userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            userName = System.Web.HttpContext.Current.User.Identity.Name;
            lblUserName.Text = userName;
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
    }
}