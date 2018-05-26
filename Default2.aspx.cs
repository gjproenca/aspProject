using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertquery = "INSERT INTO [Contact](NameContact) VALUES(@name)";
            //string insertquery = "INSERT INTO [Contact](NameContact,EmailContact,MessageContact) VALUES(@name,@email,@message)";
            SqlCommand con = new SqlCommand(insertquery, conn);
            con.Parameters.AddWithValue("@name", TextBox1.Text);
            //con.Parameters.AddWithValue("@email", textBoxEmail.Text);
            //con.Parameters.AddWithValue("@message", textBoxMessage.Text);
            con.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("ERRO:" + ex.ToString());
        }
    }
}