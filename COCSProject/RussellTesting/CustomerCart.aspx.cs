using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace COCSProject.RussellTesting
{
    public partial class CustomerCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // read the text file and populate the list box with items
                // create streamreader object
                StreamReader testReader = new StreamReader(Server.MapPath("~/RussellTesting/cart.txt"));
                // line variable to hold the next line
                string line;
                // while loop to store the text file in the list box
                while ((line = testReader.ReadLine()) != null)
                {
                    ListBox1.Items.Add(line);
                   }
                // close the streamreader
                testReader.Close();
                }

        }

        protected void btnMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerMenu.aspx");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            // remove the item
            ListBox1.Items.RemoveAt(ListBox1.SelectedIndex);
            // write to text file
            StreamWriter testWriter = new StreamWriter(Server.MapPath("~/RussellTesting/Cart.txt"), append: false);
            foreach (ListItem item in ListBox1.Items)
            {
                testWriter.WriteLine(item.Text);
            }
            testWriter.Close();
        }
    }
}