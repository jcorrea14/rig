<%@ Page Language="C#" %>
<%@ Import Namespace="GarminUnlock" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
  protected void Page_Load(object sender, EventArgs e) {
    try {
      String product = ConfigurationManager.AppSettings["Garmin.Product"];
      String esn = (String) Request["esn"];
      if (esn != null) {
        Response.Clear();
        byte[] data = (byte[]) GPIUnlock.getFile(product, esn);
        Response.ContentType = "application/octet-stream";
        Response.BinaryWrite(data);
        Response.End();
      }
    } catch (Exception ex) { }
  }
</script>
