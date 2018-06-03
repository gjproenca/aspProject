using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class master_page_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionIDAdmin"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }
    }

    protected void signout_Click(object sender, EventArgs e)
    {
        Session["sessionIDAdmin"] = null;
        Response.Redirect("~/default.aspx");
    }
}
