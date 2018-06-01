using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frontend_signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitSignup_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertquery = "INSERT INTO [User]([Name],[Username],[Password],[Email]) VALUES(@name,@username,@password,@email)";
            SqlCommand con = new SqlCommand(insertquery, conn);
            con.Parameters.AddWithValue("@name", textBoxName.Text);
            con.Parameters.AddWithValue("@username", textBoxEmail.Text);
            con.Parameters.AddWithValue("@password", textBoxPassword.Text);
            con.Parameters.AddWithValue("@email", textBoxEmail.Text);
            con.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Redirect("~/frontend/error.aspx");
            //Response.Write("ERRO:" + ex.ToString());
        }
        Response.Redirect("~/frontend/success.aspx");
    }
}