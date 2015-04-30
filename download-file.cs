using System;
using NAuth2;
using System.IO;

public partial class DownloadFile : System.Web.UI.Page {
  protected override void OnInit(EventArgs e) {
    if (!IsPostBack) {
      try {
        AuthenticationClient client = AuthenticationClient.getClient();
        AuthenticationUser user = client.GetUser(Session["Reference"].ToString());
        if (user.CanAccess("RIG_EXPORT")) {
          try {
            string filename = (String)Request["id"];
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
        }
      } catch (Exception ex) {  }
    }
  }
}