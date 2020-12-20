﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.CustomerModule
{
    public partial class cart2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnTeam_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myteam2.aspx");
        }

        protected void btnCustomerMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/cateringPackagesMenu2.aspx");
        }

        protected void btnCustomerOrders_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerModule/myorders2.aspx");
        }
    }
}