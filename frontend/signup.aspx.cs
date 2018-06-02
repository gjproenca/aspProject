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
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Username already exists!');", true);
                    break;
                case -2:
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('This email address already exists if you forgot your password click on Forgot my password');", true);
                    break;
                default:
                    SendEmail(userId);
                    Response.Redirect("~/frontend/success.aspx");
                    break;
            }
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
                mm.Subject = "Thank you for signing up";
                string body = "Dear " + textBoxName.Text.Trim() + ", we're happy to have you on our team,";
                body += "<br /><br />Please wait until one of our administrators activates your account.";
                //body += String.Format("<a href='{0}/frontend.aspx'>Link</a>", HttpContext.Current.Request.Url.Host);
                body += "<br /><br />Many thanks webwarehouse13.";
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

            using (MailMessage mm = new MailMessage("webwarehouse13@gmail.com", "webwarehouse13@gmail.com"))
            {
                mm.Subject = "User activation request";
                string body = "Username: " + textBoxUsername.Text;
                body += "<br /><br />Email: " + textBoxEmail.Text;
                //body += String.Format("<a href='{0}/frontend.aspx'>Link</a>", HttpContext.Current.Request.Url.Host);
                body += "<br /><br />Code: ";
                body += activationCode;
                body += "<br /><br />Please be carefull when activating an account.";
                body += "<br /><br />Many thanks webwarehouse13.";
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
        }
    }
}
