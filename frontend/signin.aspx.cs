using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class frontend_signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void signin_Click(object sender, EventArgs e)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @username AND [Password] = @password";
        sds.SelectParameters.Add("username", TypeCode.String, textBoxUsername.Text);
        sds.SelectParameters.Add("password", TypeCode.String, textBoxPassword.Text);
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        SqlDataSource sdsActive = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @usernameActive AND [Password] = @passwordActive AND [Active] = 1";
        sds.SelectParameters.Add("usernameActive", TypeCode.String, textBoxUsername.Text);
        sds.SelectParameters.Add("passwordActive", TypeCode.String, textBoxPassword.Text);
        DataView dvActive = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        SqlDataSource sdsAdminActive = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @usernameAdminActive AND [Password] = @passwordAdminActive AND [Active] = 1 AND [Admin] = 1";
        sds.SelectParameters.Add("usernameAdminActive", TypeCode.String, textBoxUsername.Text);
        sds.SelectParameters.Add("passwordAdminActive", TypeCode.String, textBoxPassword.Text);
        DataView dvAdminActive = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        try
        {
            if (dv.Count == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Wrong username or password!');", true);
                textBoxUsername.Text = "";
                textBoxPassword.Text = "";
            }
            else if (dvActive.Count == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Account not activated!');", true);
            }
            else if (dvAdminActive.Count != 0)
            {
                //TODO: create sessions
                Response.Redirect("~/backend/admin-area.aspx");
            }
            else
            {
                Response.Redirect("~/frontend/user-area.aspx");
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error!');", true);
        }
    }
}