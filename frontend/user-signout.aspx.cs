using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frontend_user_signout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionIDUser"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }
        Session["sessionIDUser"] = null;
        Response.Redirect("~/default.aspx");
    }
}