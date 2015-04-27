using System;
using System.Configuration;
using GarminUnlock;
using Ajax;
using NAuth2;
using System.Web;

public partial class index : System.Web.UI.Page {
  
  private static string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  private string _product = getSetting("Garmin.Product");
  private string _filename = getSetting("Garmin.FileName");
  private string _source = getSetting("Garmin.Source");
  private string _unlockSource = getSetting("Garmin.UnlockSource");
  private string _gmaUnlockSource = getSetting("Garmin.GMAUnlockSource");
  private string _controlDomain = getSetting("Garmin.ControlDomain");
  private string _controlUnlock = getSetting("Garmin.ControlUnlock");

  protected string FileName { get { return _filename; } }
  protected string Source { get { return _source; } }
  protected string UnlockSource { get { return _unlockSource; } }
  protected string GMAUnlockSource { get { return _gmaUnlockSource; } }
  protected string ControlDomain { get { return _controlDomain; } }
  protected string ControlUnlock { get { return _controlUnlock; } }

  protected void Page_Load(object sender, EventArgs e) {
    if (!IsPostBack)
      Ajax.Utility.RegisterTypeForAjax(this.GetType(), this);
  }

  [Ajax.AjaxMethod()]
  public string GetUnlockCode(string esn) {
    try {
      return GPIUnlock.GetUnlockCode(esn);
    }
    catch(Exception ex) {
      return ex.Message;
    }
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
          Response.Redirect(Session["RequestUrl"].ToString());
        }

        if (reply.Action != "ALLOW")
          Response.Redirect(
              getSetting("Authentication.LoginUrl") +
              "?pub=" + getSetting("Authentication.PubCode") +
              "&continue=" + Server.UrlEncode(Request.Url.ToString()));

      } catch (Exception ex) {     }
  }
}
