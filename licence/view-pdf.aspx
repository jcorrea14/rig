<%@ Page Language="C#"  %>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="NAuth2"%>
<script runat="server">

  private string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  private AuthenticationClient getClient() {
    return AuthenticationClient.getClient();
  }

  protected string LoginUrl {
    get {
      return getSetting("Authentication.LoginUrl") +
        "?pub=" + getSetting("Authentication.PubCode") +
        "&continue=" + Server.UrlEncode(Request.Url.ToString());
    }
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



  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        string filename = (String)Request["file"];
        Response.Clear();
        Response.ContentType = "application/pdf";
        Response.AddHeader("Content-disposition", "inline; filename=" + filename);
        Response.BinaryWrite(File.ReadAllBytes("c:/issues/dnl/" + filename));
        Response.End();
      }
    } catch (Exception ex) {  }
  }
</script>

