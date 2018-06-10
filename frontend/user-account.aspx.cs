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
        if (Session["sessionIDUser"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }

        if (!IsPostBack)
        {
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
    }

    protected void submitSignup_Click(object sender, EventArgs e)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [Username] = @username COLLATE SQL_Latin1_General_CP1_CS_AS AND [IDUser] != @iduser";
        sds.SelectParameters.Add("username", textBoxUsername.Text);
        sds.SelectParameters.Add("iduser", Session["sessionIDUser"].ToString());
        DataView dvUsername = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        SqlDataSource sds2 = new SqlDataSource();
        sds2.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds2.SelectCommand = "SELECT * FROM [User] WHERE [Email] = @email COLLATE SQL_Latin1_General_CP1_CS_AS AND [IDUser] != @iduser";
        sds2.SelectParameters.Add("email", textBoxEmail.Text);
        sds2.SelectParameters.Add("iduser", Session["sessionIDUser"].ToString());
        DataView dvEmail = (DataView)sds2.Select(DataSourceSelectArguments.Empty);

        if (dvUsername.Count != 0)
        {
            textBoxName.Text = "";
            Response.Write("<script>alert('Nome de utilizador já existente!');</script>");
        }
        else if (dvEmail.Count != 0)
        {
            textBoxEmail.Text = "";
            Response.Write("<script>alert('Email já existente!');</script>");
        }
        else
        {
            SqlCommand cmd = new SqlCommand("UPDATE [User] SET [Name] = @name, [Username] = @username, [Password] = @password, [Email] = @email WHERE [IDUser] = @iduser", conn);
            cmd.Parameters.AddWithValue("@name", textBoxName.Text);
            cmd.Parameters.AddWithValue("@username", textBoxUsername.Text);
            cmd.Parameters.AddWithValue("@password", textBoxPassword.Text);
            cmd.Parameters.AddWithValue("@email", textBoxEmail.Text);
            cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }

    protected void deleteAccount_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("UPDATE [User] SET [Active] = @active WHERE [IDUser] = @iduser", conn);
        cmd.Parameters.AddWithValue("@active", false);
        cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("~/frontend/success.aspx");
    }
}