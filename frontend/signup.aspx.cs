using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class frontend_signup : System.Web.UI.Page
{
    string configurationManager = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitSignup_Click(object sender, EventArgs e)
    {
        int userId = 0;
        string message;

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
                    message = "Username already exists!";
                    break;
                case -2:
                    message = "This email address already exists if you forgot your password click on Forgot my password";
                    break;
                default:
                    message = "Success!";
                    SendEmail(userId);
                    break;
            }
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            //TODO: AddedControl client scrpt to each line so i can add response write to success page 
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
                mm.Subject = "Activação da Conta Do Site XX";
                string body = "Caro(a) " + textBoxName.Text.Trim() + ",";
                body += "<br /><br />Por favor copie o seguinte código e no site visite a página de ativação de conta";
                body += "<br /><br />Code: ";
                body += activationCode;
                body += "<br /><br />Muito Obrigado em nome do site XX";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("webwarehouse13@gmail.com",
                "Ab-123456");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
            }
        }
    }
}
