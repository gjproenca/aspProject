using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_admin_area : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionIDAdmin"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }
    }
}