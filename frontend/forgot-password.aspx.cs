using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class frontend_forgot_password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submitForgotPassword_Click(object sender, EventArgs e)
    {
        SqlDataSource sds = new SqlDataSource();
        sds.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        sds.SelectCommand = "SELECT * FROM [User] WHERE [Email] = @email COLLATE SQL_Latin1_General_CP1_CS_AS";
        sds.SelectParameters.Add("email", textBoxEmail.Text);
        DataView dv = (DataView)sds.Select(DataSourceSelectArguments.Empty);

        if (dv.Count == 0)
        {
            Response.Write("<script>alert('Endereço de email não existente!');</script>");
        }
        else
        {
            try
            {
                using (MailMessage mm = new MailMessage("webwarehouse13@gmail.com", textBoxEmail.Text))
                {
                    mm.Subject = "Recuperação de senha";
                    string body = "A sua senha é: " + dv[0]["Password"].ToString(); //TODO: create message with password
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
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Erro, tente novamente!');</script>");
            }

            Response.Redirect("~/frontend/success.aspx");
        }
    }
}