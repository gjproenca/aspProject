using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frontend_user_contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionIDUser"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //TODO: create user contat submit button
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [IDUser] = @iduser";
        sds.SelectParameters.Add("iduser", Session["sessionIDUser"].ToString());
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertquery = "INSERT INTO [UserContact]([IDUser],[Name],[Username],[Email],[Message]) VALUES(@IDUser,@name,@username,@email,@message)";
            SqlCommand con = new SqlCommand(insertquery, conn);
            con.Parameters.AddWithValue("@IDUser", dv[0]["IDUser"].ToString());
            con.Parameters.AddWithValue("@name", dv[0]["Name"].ToString());
            con.Parameters.AddWithValue("@username", dv[0]["Username"].ToString());
            con.Parameters.AddWithValue("@email", dv[0]["Email"].ToString());
            con.Parameters.AddWithValue("@message", textBoxMessage.Text);
            con.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Redirect("~/frontend/user-error.aspx");
            //Response.Write("ERRO:" + ex.ToString());
        }
        Response.Redirect("~/frontend/user-success.aspx");
    }
}