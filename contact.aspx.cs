using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Net.Mail;
using MSCaptcha;

public partial class Contact : System.Web.UI.Page {

  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        ((SiteMaster) Page.Master).SearchBoxVisible = false;
      }
    } catch (Exception ex) {    }
  }

  private Boolean checkEmail(String email) {
    string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|"
      + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)"
      + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";

    Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);
    return regex.IsMatch(email.Trim());
  }

  protected void validateEmail(object source, ServerValidateEventArgs args) {
    args.IsValid = checkEmail(email.Text);
  }

  protected void validateCaptcha(object source, ServerValidateEventArgs args) {
    captchaImage.ValidateCaptcha(captcha.Text);
    args.IsValid = captchaImage.UserValidated;
  }
  
  protected void submit_Click(object sender, EventArgs e) {
    try {
      if (Page.IsValid) {
        String site = Request.Url.Host;
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress("webform@junewarren-nickles.com");
        if (dept.SelectedValue == "Web Master")
          mail.To.Add("web@junewarren-nickles.com");
        else if (dept.SelectedValue == "Sales")
          mail.To.Add("sales@junewarren-nickles.com");
        else
          mail.To.Add("eigbook@junewarren-nickles.com");
        mail.Subject = "Website contact form submission";
        mail.Body = String.Format(@"Message from contact form at {0}

From: {1}
E-mail: {2}
Phone: {3}
[START OF MESSAGE]

{4}

[END OF MESSAGE]
",
             Request.Url.ToString(),
             name.Text,
             email.Text,
             phone.Text,
             comment.Text);
        new SmtpClient().Send(mail);
        Response.Redirect("thankyou.aspx");
      }
    } catch (Exception ex) {}
  }
}
