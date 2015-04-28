using System;
using System.Web;
using System.Configuration;

public partial class PublicMaster : System.Web.UI.MasterPage {

  private string getSetting(string key) {
    return ConfigurationManager.AppSettings[key].ToString();
  }

  protected string LoginUrl {
    get {
      return getSetting("Authentication.LoginUrl") +
        "?pub=" + getSetting("Authentication.PubCode") +
        "&continue=" + Server.UrlEncode(Request.Url.ToString());
    }
  }

}
