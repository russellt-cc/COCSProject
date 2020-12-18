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
                gvRolesList.DataBind();
                //UsersRoleList.DataBind();
                //ddlUsersList.DataBind();
                //CheckRolesForSelectedUser();
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
    }
}