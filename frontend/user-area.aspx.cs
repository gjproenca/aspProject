using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class frontend_user_area : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //TODO: download files, delete files, add timestamp to files
    protected void lnkbtnUpload_Click(object sender, EventArgs e)
    {
        if (fileUpload.HasFiles)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            foreach (HttpPostedFile file in fileUpload.PostedFiles)
            {
                Guid guid = Guid.NewGuid();
                string filename = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath("~/uploads/") + guid + "_" + filename);
                SqlCommand cmd = new SqlCommand("INSERT INTO [Upload]([IDUser],[Path]) VALUES (@iduser,@path)", conn);
                cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
                cmd.Parameters.AddWithValue("@path", guid + "_" + filename);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            Response.Redirect("~/frontend/user-area.aspx");
        }
        else
        {
            Response.Write("<script>alert('Selecione um ficheiro!');</script>");
        }
    }
}