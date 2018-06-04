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
        try
        {
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @username COLLATE SQL_Latin1_General_CP1_CS_AS AND [Password] = @password COLLATE SQL_Latin1_General_CP1_CS_AS";
            sds.SelectParameters.Add("username", TypeCode.String, textBoxUsername.Text);
            sds.SelectParameters.Add("password", TypeCode.String, textBoxPassword.Text);
            DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            SqlDataSource sdsActive = new SqlDataSource();
            sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @usernameActive COLLATE SQL_Latin1_General_CP1_CS_AS AND [Password] = @passwordActive COLLATE SQL_Latin1_General_CP1_CS_AS AND [Active] = 1";
            sds.SelectParameters.Add("usernameActive", TypeCode.String, textBoxUsername.Text);
            sds.SelectParameters.Add("passwordActive", TypeCode.String, textBoxPassword.Text);
            DataView dvActive = (DataView)sds.Select(DataSourceSelectArguments.Empty);

            SqlDataSource sdsAdminActive = new SqlDataSource();
            sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @usernameAdminActive COLLATE SQL_Latin1_General_CP1_CS_AS AND [Password] = @passwordAdminActive COLLATE SQL_Latin1_General_CP1_CS_AS AND [Active] = 1 AND [Admin] = 1";
            sds.SelectParameters.Add("usernameAdminActive", TypeCode.String, textBoxUsername.Text);
            sds.SelectParameters.Add("passwordAdminActive", TypeCode.String, textBoxPassword.Text);
            DataView dvAdminActive = (DataView)sds.Select(DataSourceSelectArguments.Empty);


            if (dv.Count == 0)
            {
                Response.Write("<script>alert('Nome de utilizador ou senha errada!');</script>");
                textBoxUsername.Text = "";
                textBoxPassword.Text = "";
            }
            else if (dvActive.Count == 0)
            {
                Response.Write("<script>alert('Conta não ativa!');</script>");
            }
            else if (dvAdminActive.Count != 0)
            {
                Session["sessionIDAdmin"] = dv[0]["IDUser"].ToString();
                Response.Redirect("~/backend/admin-area.aspx");
            }
            else
            {
                Session["sessionIDUser"] = dv[0]["IDUser"].ToString();
                Response.Redirect("~/frontend/user-success.aspx");
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            Response.Write("<script>alert('Erro!');</script>");
        }
    }
}