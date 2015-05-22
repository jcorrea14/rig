using System;
using System.IO;
using System.Text;

public partial class Report : System.Web.UI.Page {

  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        String dir = Request["dir"];
        String link = Request["id"];


        StreamReader sr = new StreamReader(String.Format("c:\\issues\\{0}\\{1}.html", dir, link), Encoding.Default);
        String html = sr.ReadToEnd();
        sr.Close();

        html = html.Substring(html.ToLower().IndexOf("<body>") + 6);
        html = html.Substring(0, html.ToLower().IndexOf("</body>") - 1);

        byte[] bytes = Encoding.Default.GetBytes(html);
        bytes = Encoding.Convert(Encoding.Default, Encoding.UTF8, bytes);
        html = Encoding.UTF8.GetString(bytes);

        report.InnerHtml = html;
      }
    } catch (Exception ex) {   }
  }
}

