using System;
using System.Web;
using System.Configuration;

public partial class PublicNav : System.Web.UI.UserControl {

  private string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  protected string LoginUrl {
    get {
      System.Uri url = Request.Url;
      return getSetting("Authentication.LoginUrl") +
        "?pub=" + getSetting("Authentication.PubCode") +
        "&continue=" + Server.UrlEncode("http://" + url.Host + "/data.aspx");
    }
  }
}
