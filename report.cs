using System;
using System.IO;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class Report : System.Web.UI.Page {

  private String extract(String src, String startTag, String endTag) {
    return Regex.Match(src,
                       startTag + "[^" + endTag.Substring(0, 1) + "]+" + endTag,
                       RegexOptions.IgnoreCase).Value.Replace(startTag, "").Replace(endTag, "");
  }

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

