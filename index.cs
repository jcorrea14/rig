using System;
using System.Web;
using System.Configuration;

public partial class IndexPage : System.Web.UI.Page {

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

  protected override void OnInit(EventArgs e) {
    if (((BaseMaster)Master).LoggedIn)
      Response.Redirect("/data.aspx");
  }

}
