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
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Session["sessionIDUser"]);

        DataTable dt = new DataTable();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
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
        //FIXME: Update data
    //    using (SqlConnection conn = new SqlConnection(configurationManager))
    //    {
    //        using (SqlCommand cmd = new SqlCommand("usp_insert_user"))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.CommandType = CommandType.StoredProcedure;
    //                cmd.Parameters.AddWithValue("@name", textBoxName.Text);
    //                cmd.Parameters.AddWithValue("@username", textBoxUsername.Text);
    //                cmd.Parameters.AddWithValue("@password", textBoxPassword.Text);
    //                cmd.Parameters.AddWithValue("@email", textBoxEmail.Text);
    //                cmd.Connection = conn;
    //                conn.Open();
    //                userId = Convert.ToInt32(cmd.ExecuteScalar());
    //                conn.Close();
    //            }
    //        }
    //        switch (userId)
    //        {
    //            case -1:
    //                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Nome de utilizador já existente!');", true);
    //                break;
    //            case -2:
    //                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Endereço de e-mail já existente, se quiser recuperar a password clique em Recuperar Senha);", true);
    //                break;
    //            default:
    //                SendEmail(userId);
    //                Response.Redirect("~/frontend/success.aspx");
    //                break;
    //        }
    //    }
    //}
}