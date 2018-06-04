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

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //TODO: create user contat submit button
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [IDUser] = @iduser";
        sds.SelectParameters.Add("iduser", Session["sessionUser"].ToString());
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        //TODO stopped here

        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string insertquery = "INSERT INTO [UserContact]([IDUser],[Name],[Username],[Email],[Message]) VALUES(@name,@email,@message)";
            //here on the line above
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