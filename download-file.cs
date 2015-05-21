using System;
using NAuth2;
using System.IO;

public partial class DownloadFile : System.Web.UI.Page {
  protected override void OnInit(EventArgs e) {
    if (!IsPostBack) {
      try {
        AuthenticationClient client = AuthenticationClient.getClient();
        AuthenticationUser user = client.GetUser(Session["Reference"].ToString());
        try {
          if (!(user.CanAccess("RIG_BROWSE")))
            throw new Exception("no access");
          string filename = (String)Request["id"];
          string s = "20" + filename.Substring(4, 2) +
            "-" + filename.Substring(6, 2) +
            "-" + filename.Substring(8, 2);
          DateTime d = DateTime.Parse(s);
          if (d < DateTime.Today.AddDays(-30))
            throw new Exception("scraping alert"); 
          Response.Clear();
          Response.ContentType = "text/csv";
          Response.AddHeader("Content-disposition", "inline; filename=" + filename);
          Response.BinaryWrite(File.ReadAllBytes("c:/issues/rig/" + filename));
        } catch (Exception ex) {
          Response.Clear();
          Response.StatusCode = 404;
          Response.Status = "404 Not Found";
        }
        Response.End();
      } catch (Exception ex) {  }
    }
  }
}
