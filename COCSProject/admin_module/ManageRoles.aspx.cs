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
            try
            {
                if (rName == "") throw new Exception("Role cannot have no name");
                if (System.Web.Security.Roles.RoleExists(rName)) throw new Exception("Role already exists");
                System.Web.Security.Roles.CreateRole(rName);
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was created successfully.";
                gvRolesList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> created successfully.<br/>Error: {ex.Message}";
            }
        }

        protected void btnRemoveRole_Click(object sender, EventArgs e)
        {
            string rName = txtRoleName.Text.Trim();
            try
            {
                if (rName == "") throw new Exception("Enter the name of role to remove");
                if (rName.ToLower() == "admin" || rName.ToLower() == "caterer" || rName.ToLower() == "customer" || rName.ToLower() == "potentialcaterer" || rName.ToLower() == "declinedcaterer") throw new Exception("You cannot remove admin, caterer, or customer roles");
                if (!System.Web.Security.Roles.RoleExists(rName)) throw new Exception("Role does not exist");
                System.Web.Security.Roles.DeleteRole(rName);
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was removed successfully.";
                gvRolesList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> removed successfully.<br/>Error: {ex.Message}";
            }
        }

        protected void btnAssignRole_Click(object sender, EventArgs e)
        {
            string rName = txtSelectRole.Text.Trim();
            string uName = txtSelectUser.Text.Trim();
            try
            {
                if (rName == "" || uName == "") throw new Exception("Enter the name of the role and user");
                if (!System.Web.Security.Roles.RoleExists(rName)) throw new Exception("Role does not exist");
                System.Web.Security.Roles.AddUserToRole(uName, rName);
                lblActionStatus2.Text = $"Role (<strong>{rName}</strong>) was assigned successfully.";
                //gvUsersInRolesList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus2.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> assigned successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnUnassignRole_Click(object sender, EventArgs e)
        {
            string rName = txtSelectRole.Text.Trim();
            string uName = txtSelectUser.Text.Trim();
            try
            {
                if (rName == "" || uName == "") throw new Exception("Enter the name of the role and user");
                if (!System.Web.Security.Roles.RoleExists(rName)) throw new Exception("Role does not exist");
                System.Web.Security.Roles.RemoveUserFromRole(uName, rName);
                lblActionStatus2.Text = $"Role (<strong>{rName}</strong>) was unassigned successfully.";
                //gvUsersInRolesList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus2.Text = $"Role (<strong>{rName}</strong>) was <strong>NOT</strong> unassigned successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string uName = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();
            //string email = txtEmail.Text;
            //string question = txtQuestion.Text;
            //string answer = txtAnswer.Text;
            try
            {
                if (uName == "") throw new Exception("Enter the name of the user");
                if (password == "") throw new Exception("Enter a password for the user");
                //if (email == "") throw new Exception("Enter an email for the user");
                //if (question == "") throw new Exception("Enter a security question for the user");
                //if (answer == "") throw new Exception("Enter a security answer for the user");
                if (!(System.Web.Security.Membership.GetUser(uName) == null)) throw new Exception("User already exists");
                //System.Web.Security.Membership.CreateUser(uName, password, email, question, answer, true, out System.Web.Security.MembershipCreateStatus status);
                System.Web.Security.Membership.CreateUser(uName, password);
                //switch (status)
                //{
                //    case System.Web.Security.MembershipCreateStatus.Success:
                //        return;
                //    case System.Web.Security.MembershipCreateStatus.DuplicateUserName:
                //        throw new Exception("Username already exists. Please enter a different user name");
                //    case System.Web.Security.MembershipCreateStatus.DuplicateEmail:
                //        throw new Exception("A username for that email address already exists. Please enter a different email address");
                //    case System.Web.Security.MembershipCreateStatus.InvalidPassword:
                //        throw new Exception("The password provided is invalid. Please enter a valid password value");
                //    case System.Web.Security.MembershipCreateStatus.InvalidEmail:
                //        throw new Exception("The email address provided is invalid. Please check the value and try again");
                //    case System.Web.Security.MembershipCreateStatus.InvalidAnswer:
                //        throw new Exception("The password retrieval answer provided is invalid. Please check the value and try again");
                //    case System.Web.Security.MembershipCreateStatus.InvalidQuestion:
                //        throw new Exception("The password retrieval question provided is invalid. Please check the value and try again");
                //    case System.Web.Security.MembershipCreateStatus.InvalidUserName:
                //        throw new Exception("The user name provided is invalid. Please check the value and try again");
                //    case System.Web.Security.MembershipCreateStatus.ProviderError:
                //        throw new Exception("The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator");
                //    case System.Web.Security.MembershipCreateStatus.UserRejected:
                //        throw new Exception("The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator");
                //    default:
                //        throw new Exception("An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator");
                //}
                lblActionStatus3.Text = $"User <strong>{uName}</strong> was added successfully.";
                //gvUsersInRolesList.DataBind();
                gvUsersList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus3.Text = $"User <strong>{uName}</strong> was <strong>NOT</strong> added successfully.<br/>Error: {ex.Message}.";
            }
        }

        protected void btnRemoveUser_Click(object sender, EventArgs e)
        {
            try
            {
                string uName = txtUserName.Text.Trim();
                if (uName == "") throw new Exception("Enter the name of the user");
                if (System.Web.Security.Membership.FindUsersByName(uName) == null) throw new Exception("User name not found");
                System.Web.Security.Membership.DeleteUser(uName);
                lblActionStatus3.Text = $"User <strong>{uName}</strong> was removed successfully.";
                //gvUsersInRolesList.DataBind();
                gvUsersList.DataBind();
            }
            catch (Exception ex)
            {
                lblActionStatus3.Text = $"User was <strong>NOT</strong> removed successfully.<br/>Error: {ex.Message}.";
            }
        }

        //protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    lblRoleID.Text = ddlRoles.SelectedValue;
        //}
    }
}