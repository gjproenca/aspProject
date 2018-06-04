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

    protected void lnkbtnUpload_Click(object sender, EventArgs e)
    {
        if (fileUpload.HasFile)
        {
            //TODO; loop trouf files with postedfiles wich returns a collectoin and add multiple files
            //string path = "~/uploads/" + Path.GetFileName(fileUpload.PostedFile.FileName);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd;
            string path;
            //cmd.Parameters.AddWithValue("@path", path);
            //conn.Open();
            //cmd.ExecuteNonQuery();
            //conn.Close();
            //fileUpload.SaveAs(Server.MapPath("~/uploads/" + fileUpload.FileName));
            //Response.Redirect("~/frontend/user-area.aspx");

            //FIXME: multiply file upload corrupts images

            IList<HttpPostedFile> postedFiles = fileUpload.PostedFiles;

            foreach (HttpPostedFile file in postedFiles)
            {
                path = "~/uploads/" + file.FileName;
                cmd = new SqlCommand("INSERT INTO [Upload]([IDUser],[Path]) VALUES (@iduser,@path)", conn);
                cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
                cmd.Parameters.AddWithValue("@path", path);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                fileUpload.SaveAs(Server.MapPath("~/uploads/" + file.FileName));
            }
            Response.Redirect("~/frontend/user-area.aspx");
        }
        else
        {
            Response.Write("<script>alert('Selecione um ficheiro!');</script>");
        }
    }
}