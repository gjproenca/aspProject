using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frontend_user_account : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(Session["sessionIDUser"]);

        DataTable dt = new DataTable();
        conn.Open();
        SqlCommand sqlCmd = new SqlCommand("SELECT * FROM [User] WHERE [IDUser] = @iduser", conn);
        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        sqlCmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
        sqlDa.Fill(dt);

        textBoxName.Text = dt.Rows[0]["Name"].ToString();
        textBoxUsername.Text = dt.Rows[0]["Username"].ToString();
        textBoxEmail.Text = dt.Rows[0]["Email"].ToString();

        conn.Close();
    }

    protected void submitSignup_Click(object sender, EventArgs e)
    {
        Response.Write("submit");

        //FIXME: Update data
        SqlCommand cmd = new SqlCommand("UPDATE [User] SET [Name] = @name WHERE [IDUser] = @iduser", conn);
        cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
        cmd.Parameters.AddWithValue("@name", textBoxName.Text);
        //cmd.Parameters.AddWithValue("@email", textBoxEmail.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}