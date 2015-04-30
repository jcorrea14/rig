using System;
using System.IO;

public partial class Report : System.Web.UI.Page {

  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        String link = Request["id"];
        StreamReader sr = new StreamReader("c:\\issues\\rig\\" +
                                           link + ".html", System.Text.Encoding.Default);
        String html = sr.ReadToEnd();
        sr.Close();

        html = html.Substring(html.ToLower().IndexOf("<body>") + 6);
        html = html.Substring(0, html.ToLower().IndexOf("</body>") - 1);
        report.InnerHtml = html;
      }
    } catch (Exception ex) {   }
  }
}

