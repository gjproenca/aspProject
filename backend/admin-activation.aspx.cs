using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class backend_admin_activation : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitCode_Click(object sender, EventArgs e)
    {
        string activationCode = textBoxCode.Text;
        string idUser;
        DataTable dt = new DataTable();
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [UserActivation] WHERE [ActivationCode] = @code";
        sds.SelectParameters.Add("code", activationCode);
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);
        SqlCommand sqlCmd = new SqlCommand("SELECT * FROM [UserActivation] WHERE [ActivationCode] = @code1", conn);
        sqlCmd.Parameters.Add(new SqlParameter("@code1", activationCode));
        conn.Open();
        SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
        sqlDa.Fill(dt);
        try
        {
            if (dv.Count == 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('No matches found, user may be already active or code was inserted incorrectly!');", true);
                conn.Close();
            }
            else
            {
                conn.Close();
                idUser = dt.Rows[0]["IDUser"].ToString();
                conn.Open();
                string updatequery = "UPDATE [User] SET [Active] = 1 WHERE [IDUser] = @idUser";
                SqlCommand con = new SqlCommand(updatequery, conn);
                con.Parameters.AddWithValue("@idUser", idUser);
                int rowsAffected = con.ExecuteNonQuery();
                conn.Close();
                conn.Open();
                string deletequery = "DELETE FROM [UserActivation] WHERE[ActivationCode] = @activationCode";
                SqlCommand con1 = new SqlCommand(deletequery, conn);
                con1.Parameters.AddWithValue("@activationCode", activationCode);
                int rowsAffected1 = con1.ExecuteNonQuery();
                conn.Close();
                if ((rowsAffected == 1) && (rowsAffected1 == 1))
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Activation successfull!');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Activation failed, please try again');", true);
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Write("ERRO:" + ex.ToString());
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Error!');", true);
        }
    }
}