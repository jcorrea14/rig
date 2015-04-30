using System;
using System.Web;
using NAuth2;
using System.Configuration;

public partial class BaseMaster : System.Web.UI.MasterPage {

  private string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  private AuthenticationClient getClient() {
    return AuthenticationClient.getClient();
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

  private string cookieValue(string name) {
    HttpCookie cookie = Request.Cookies[name];
    return cookie == null ? "" : cookie.Value;
  }

  override protected void OnInit(EventArgs e) {
    string device = "";
    string cookie = "";
    AuthenticationReply reply;
    AuthenticationClient client = getClient();

    try {
      String token = (String) Request["ntoken"];

      if (token == null) {
        string requestUrl = Request.Url.ToString();
        Session["RequestUrl"] = requestUrl;

        cookie = cookieValue("NUID");
        device = cookieValue("NDID");

        reply = client.Authenticate(cookie,
                                    device,
                                    getSetting("Authentication.PubCode"));

        if (reply.Action == "CHECKID") {
          Response.Redirect(
                            getSetting("Authentication.CheckUrl") +
                            "?pub=" + getSetting("Authentication.PubCode") +
                            "&continue=" + Server.UrlEncode(requestUrl));
        } else {
          setCookies(reply);
        }
                
      } else {
        reply = client.DecodeToken(token);
        setCookies(reply);
        if (Session["RequestUrl"] == null)
          Response.Redirect("/");
        else
          Response.Redirect(Session["RequestUrl"].ToString());
      }

      bool loggedIn = reply.Action == "ALLOW";
      ViewState["loggedin"] = loggedIn;
      Session["Reference"] = loggedIn ? reply.Reference : null ;

    } catch (Exception ex) {     }
  }

  public bool LoggedIn { get { return (bool)ViewState["loggedin"]; } }


}
