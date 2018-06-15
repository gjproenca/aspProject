using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class backend_admin_user_contact : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionIDAdmin"] == null)
        {
            Response.Redirect("~/frontend/error.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        textBoxId.Text = gr.Cells[1].Text;
        textBoxName.Text = gr.Cells[3].Text;
        textBoxEmail.Text = gr.Cells[5].Text;
        textBoxMessage.Text = gr.Cells[6].Text;
        textBoxTimestamp.Text = gr.Cells[8].Text;
    }

    protected void submitResponse_Click(object sender, EventArgs e)
    {
        if (textBoxId.Text != "" && textBoxSubject.Text != "" && textBoxResponse.Text != "")
        {
            try
            {
                SqlCommand cmd = new SqlCommand("UPDATE [UserContact] SET [Active] = @active WHERE [IDUserContact] = @idcontact", conn);
                cmd.Parameters.AddWithValue("@active", false);
                cmd.Parameters.AddWithValue("@idcontact", textBoxId.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                using (MailMessage mm = new MailMessage("webwarehouse13@gmail.com", textBoxEmail.Text))
                {
                    mm.Subject = textBoxSubject.Text;
                    mm.Body = textBoxResponse.Text;
                    mm.IsBodyHtml = false;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("webwarehouse13@gmail.com", "Ab-123456");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                }
                Response.Write("<script>alert('Sucesso!')</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro!')</script>");
            }
            Response.Redirect("~/backend/admin-user-contact.aspx");
        }
        else
        {
            Response.Write("<script>alert('Selecione uma mensagem e adicione texto aos campos de resposta!')</script>");
        }
    }
}