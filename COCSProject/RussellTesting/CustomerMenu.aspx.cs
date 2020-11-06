using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace COCSProject.RussellTesting
{
    public partial class WebForm2 : System.Web.UI.Page
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
                while ((line = testReader.ReadLine()) != null)
                {
                lbMenuItems.Items.Add(line);
                }
                // close the streamreader
                testReader.Close();
                }
        }

        protected void btnCatererMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("CatererMenu.aspx");
        }

        protected void btnLoadCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerCart.aspx");
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // add the item to the cart
            // create streamwriter object
            StreamWriter testWriter = new StreamWriter(Server.MapPath("~/RussellTesting/cart.txt"), append: true);
            // write the item
            testWriter.WriteLine(lbMenuItems.SelectedItem.Text);
            // close streamwriter
            testWriter.Close();
        }
    }
}