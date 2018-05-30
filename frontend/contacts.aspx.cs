using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add
using System.Data.SqlClient;
using System.Configuration;

public partial class frontend_contacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertquery = "INSERT INTO [Contact]([Name],[Email],[Message]) VALUES(@name,@email,@message)";
            SqlCommand con = new SqlCommand(insertquery, conn);
            con.Parameters.AddWithValue("@name", textBoxName.Text);
            con.Parameters.AddWithValue("@email", textBoxEmail.Text);
            con.Parameters.AddWithValue("@message", textBoxMessage.Text);
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