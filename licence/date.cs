using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Results : System.Web.UI.Page {
  private String _pubDate;

  protected String PubDate {
    get { return _pubDate; }
  }

  override protected void OnLoad(EventArgs e) {
    if (!IsPostBack) {
      try {
        DateTime d = DateTime.Parse((String)Request["date"]);
        _pubDate = d.ToString("dddd, MMMM d, yyyy");
        result.Criteria = String.Format("Created = '{0}'", d.ToString("yyyy-MM-dd"));
      } catch (Exception ex) { }
    }
  }
}
