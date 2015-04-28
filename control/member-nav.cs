using System;
using System.Web;
using System.Configuration;
using NAuth2;

public partial class MemberNav : System.Web.UI.UserControl {

  private static string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  private void setCookies(AuthenticationReply reply) {
    HttpCookie cookie = new HttpCookie("NDID");
    cookie.Value = reply.Device;
    cookie.Expires = DateTime.Now.AddDays(90);
    Response.Cookies.Add(cookie);      
    
    cookie = new HttpCookie("NUID");
    cookie.Value = reply.CookieText;
    cookie.Expires = DateTime.Now.AddDays(15);
    Response.Cookies.Add(cookie);      
  }

  protected void LogoutClick(object sender, EventArgs e) {
    try {
      String cookieText = Request.Cookies["NUID"].Value;
      String device = Request.Cookies["NDID"].Value;
      AuthenticationClient client = AuthenticationClient.getClient();
      
      AuthenticationReply
        reply = client.Authenticate(cookieText,
                                    device,
                                    getSetting("Authentication.PubCode"));
      reply = client.Logout(reply.Reference);

      setCookies(reply);
      Response.Redirect("/");
    
    } catch (Exception ex) { }
  }
}
