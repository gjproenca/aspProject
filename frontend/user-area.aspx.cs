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
        gridViewFiles.HeaderRow.TableSection = TableRowSection.TableHeader;
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
                string filename = guid + "_" + Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath("~/uploads/") + filename);
                SqlCommand cmd = new SqlCommand("INSERT INTO [Upload]([IDUser],[Path]) VALUES (@iduser,@path)", conn);
                cmd.Parameters.AddWithValue("@iduser", Session["sessionIDUser"]);
                cmd.Parameters.AddWithValue("@path", filename);
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

    protected void gridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "download")
        {
            Response.Clear();
            Response.ContentType = "application/octect-stream";
            Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/uploads/") + e.CommandArgument);
            Response.End();
        }
    }
}