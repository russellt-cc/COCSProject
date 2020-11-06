using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace COCSProject.RussellTesting
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // read the text file and populate the list box with items
                // create streamreader object
                StreamReader testReader = new StreamReader(Server.MapPath("~/RussellTesting/menu.txt"));
                // line variable to hold the next line
                string line;
                // while loop to store the text file in the list box
                while((line = testReader.ReadLine()) != null)
                {
                lbMenuItems.Items.Add(line);
                }
                // close the streamreader
                testReader.Close();
                }

        }

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            // add to list box
            lbMenuItems.Items.Add(txtNewItem.Text);
            // add the item to the menu
            // create streamwriter object
            StreamWriter testWriter = new StreamWriter(Server.MapPath("~/RussellTesting/menu.txt"), append : true);
            // write the item
            testWriter.WriteLine(txtNewItem.Text);
            // close streamwriter
            testWriter.Close();
        }

        protected void btnCustomerMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerMenu.aspx");
        }
    }
}