using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject.admin_module
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //dlRolesList.DataBind();
                //UsersRoleList.DataBind();
                //ddlUsersList.DataBind();
                //CheckRolesForSelectedUser();
                //lblRoleID.Text = ddlRoles.SelectedValue;
            }
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/common/homepage.aspx");
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/Dashboard2.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/Report2.aspx");
        }

        protected void btnManageCaterers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin_module/Manage_Caterers2.aspx");
        }

        protected void btnNewRole_Click(object sender, EventArgs e)
        {
            string rName = txtRoleName.Text.Trim();
            if (rName == "")
            {
                lblActionStatus.Text = $"Role was <strong>NOT</strong> created successfully.<br/>Error: Role cannot have no name.";
            }
            else if (!System.Web.Security.Roles.RoleExists(rName))
            {
                try
                {
                    System.Web.Security.Roles.CreateRole(rName);
                    lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was created successfully.";
                    gvRolesList.DataBind();
                }
                catch (Exception ex)
                {
                    lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> created successfully.<br/>Error: {ex.Message}";
                }
            }
            else 
            { 
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> created successfully.<br/>Error: Role already exists.";
            }
        }

        protected void btnRemoveRole_Click(object sender, EventArgs e)
        {
            string rName = txtRoleName.Text.Trim();
            if (rName == "")
            {
                lblActionStatus.Text = $"Role was <strong>NOT</strong> removed successfully.<br/>Error: Enter the name of the role to remove.";
            }
            else if (rName.ToLower() == "admin" || rName.ToLower() == "caterer" || rName.ToLower() == "customer")
            {
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: You cannot remove admin, caterer, or customer roles.";
            }
            else if (System.Web.Security.Roles.RoleExists(rName))
            {
                try
                {
                    System.Web.Security.Roles.DeleteRole(rName);
                    lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was removed successfully.";
                    gvRolesList.DataBind();
                }
                catch (Exception ex)
                {
                    lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: {ex.Message}";
                }
            }
            else
            {
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: Role does not exist.";
            }
        }

        protected void btnAssignRole_Click(object sender, EventArgs e)
        {
            string rName = txtSelectRole.Text.Trim();
            string uName = txtSelectUser.Text.Trim();
            if (rName == "" || uName == "")
            {
                lblActionStatus2.Text = $"Role was <strong>NOT</strong> assigned successfully.<br/>Error: Enter the name of the role and user.";
            }
            else if (System.Web.Security.Roles.RoleExists(rName))
            {
                try
                {
                    System.Web.Security.Roles.AddUserToRole(uName, rName);
                    gvUsersInRolesList.DataBind();
                }
                catch (Exception ex)
                {
                    lblActionStatus2.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> assigned successfully.<br/>Error: {ex.Message}";
                }
            }
            else
            {
                lblActionStatus2.Text = $"Role was <strong>NOT</strong> assigned successfully.<br/>Error: Role does not exist.";
            }
        }

        //protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    lblRoleID.Text = ddlRoles.SelectedValue;
        //}
    }
}