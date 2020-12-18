using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.admin_module
{
    public partial class Manage_Caterers2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/Dashboard2.aspx");
        }

        protected void btnManageRoles_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/ManageRoles.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/Report2.aspx");
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string uName = txtUserName.Text;
            try
            {
                if (uName == "") throw new Exception("User name must not be blank");
                if (System.Web.Security.Membership.GetUser(uName) == null) throw new Exception("User name not found");
                if (System.Web.Security.Roles.IsUserInRole(uName, "Caterer")) throw new Exception("User has already been approved");
                if (System.Web.Security.Roles.IsUserInRole(uName, "DeclinedCaterer")) throw new Exception("User has already been declined. Use role manager to approve");
                if (!System.Web.Security.Roles.IsUserInRole(uName, "PotentialCaterer")) throw new Exception("User has not applied to be a caterer");
                System.Web.Security.Roles.AddUserToRole(uName, "Caterer");
                System.Web.Security.Roles.RemoveUserFromRole(uName, "PotentialCaterer");
                lblStatus.Text = $"User (<strong>{uName}</strong>) was approved successfully.";
                gvApprovedCaterers.DataBind();
                gvPotentialCaterers.DataBind();
            }
            catch (Exception ex)
            {
                lblStatus.Text = $"User (<strong>{uName}</strong>) was <strong>NOT</strong> approved successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            string uName = txtUserName.Text;
            try
            {
                if (uName == "") throw new Exception("User name must not be blank");
                if (System.Web.Security.Membership.GetUser(uName) == null) throw new Exception("User name not found");
                if (System.Web.Security.Roles.IsUserInRole(uName, "Caterer")) throw new Exception("User has already been approved. Use role manager to unapprove");
                if (System.Web.Security.Roles.IsUserInRole(uName, "DeclinedCaterer")) throw new Exception("User has already been declined");
                if (!System.Web.Security.Roles.IsUserInRole(uName, "PotentialCaterer")) throw new Exception("User has not applied to be a caterer");
                System.Web.Security.Roles.AddUserToRole(uName, "DeclinedCaterer");
                System.Web.Security.Roles.RemoveUserFromRole(uName, "PotentialCaterer");
                lblStatus.Text = $"User (<strong>{uName}</strong>) was declined successfully.";
                gvDeclinedCaterers.DataBind();
                gvPotentialCaterers.DataBind();
            }
            catch (Exception ex)
            {
                lblStatus.Text = $"User (<strong>{uName}</strong>) was <strong>NOT</strong> declined successfully.<br/>Error: {ex.Message}.";
            }
        }
    }
}