using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace COCSProject
{
    public partial class register : System.Web.UI.Page
    {
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
                CreateNewCustomerEntry(txtUserName.Text);
            }
        }

        private void CreateNewCustomerEntry(string name)
        {
            
        }

        private void CreateNewCatererEntry(string name)
        {

        }
    }
}