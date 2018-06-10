using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Web;

public partial class frontend_signup : System.Web.UI.Page
{
    string configurationManager = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitSignup_Click(object sender, EventArgs e)
    {
        int userId = 0;

        using (SqlConnection conn = new SqlConnection(configurationManager))
        {
            using (SqlCommand cmd = new SqlCommand("usp_insert_user"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", textBoxName.Text);
                    cmd.Parameters.AddWithValue("@username", textBoxUsername.Text);
                    cmd.Parameters.AddWithValue("@password", textBoxPassword.Text);
                    cmd.Parameters.AddWithValue("@email", textBoxEmail.Text);
                    cmd.Connection = conn;
                    conn.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    conn.Close();
                }
            }
            switch (userId)
            {
                case -1:
                    Response.Write("<script>alert('Nome de utilizador já existente, se não se lembrar da senha e quiser repurá-la, clique em Recuperar senha');</script>");
                    break;
                case -2:
                    Response.Write("<script>alert('Email já existente, se não se lembrar da senha e quiser repurá-la, clique em Recuperar senha');</script>");
                    break;
                default:
                    SendEmail(userId);
                    Response.Redirect("~/frontend/success.aspx");
                    break;
            }
        }
    }

    private void SendEmail(int IDUser)
    {
        string activationCode = Guid.NewGuid().ToString();

        using (SqlConnection conn = new SqlConnection(configurationManager))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO [UserActivation]([IDUser],[ActivationCode], [Timestamp]) VALUES(@iduser, @activationCode,GETDATE())"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@iduser", IDUser);
                    cmd.Parameters.AddWithValue("@activationCode", activationCode);
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            using (MailMessage mm = new MailMessage("webwarehouse13@gmail.com", textBoxEmail.Text))
            {
                mm.Subject = "Obrigado por se ter registado";
                string body = "Caro(a) " + textBoxName.Text.Trim() + ", estamos felizes em tê-lo na nossa equipa,";
                body += "<br /><br />Por favor aguarde até um dos nossos administradores ativar a sua conta.";
                //body += String.Format("<a href='{0}/frontend.aspx'>Link</a>", HttpContext.Current.Request.Url.Host);
                body += "<br /><br />Muito obrigado em nome da Webware.";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("webwarehouse13@gmail.com", "Ab-123456");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }

            //using (MailMessage mm = new MailMessage("webwarehouse13@gmail.com", "webwarehouse13@gmail.com"))
            //{
            //    mm.Subject = "Requesito de ativação de conta";
            //    string body = "Nome de utilizador: " + textBoxUsername.Text;
            //    body += "<br /><br />Endereço de email: " + textBoxEmail.Text;
            //    //body += String.Format("<a href='{0}/frontend.aspx'>Link</a>", HttpContext.Current.Request.Url.Host);
            //    body += "<br /><br />Código: ";
            //    body += activationCode;
            //    body += "<br /><br />Por favor, tenha cuidado ao ativar uma conta.";
            //    body += "<br /><br />Muito obrigado Webware.";
            //    mm.Body = body;
            //    mm.IsBodyHtml = true;
            //    SmtpClient smtp = new SmtpClient();
            //    smtp.Host = "smtp.gmail.com";
            //    smtp.EnableSsl = true;
            //    NetworkCredential NetworkCred = new NetworkCredential("webwarehouse13@gmail.com", "Ab-123456");
            //    smtp.UseDefaultCredentials = true;
            //    smtp.Credentials = NetworkCred;
            //    smtp.Port = 587;
            //    smtp.Send(mm);
            //}
        }
    }
}
