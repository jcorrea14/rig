using System;
using System.IO;

public partial class Report : System.Web.UI.Page {

  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        String dir = Request["dir"];
        String link = Request["id"];
        StreamReader sr = new StreamReader(String.Format("c:\\issues\\{0}\\{1}.html", dir, link));
        String html = sr.ReadToEnd();
        sr.Close();

        html = html.Substring(html.ToLower().IndexOf("<body>") + 6);
        html = html.Substring(0, html.ToLower().IndexOf("</body>") - 1);
        report.InnerHtml = html;
      }
    } catch (Exception ex) {   }
  }
}

