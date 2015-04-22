<%@ Page Language="C#" %>
<%@ Import Namespace="GarminUnlock" %>
<%@ Import Namespace="System.Configuration" %>
<script runat="server">
  protected void Page_Load(object sender, EventArgs e) {
    String product = ConfigurationManager.AppSettings["Garmin.Product"];
    try {
      String esn = (String) Request["esn"];
      if (esn != null) {
        Response.Clear();
        Response.ContentType = "application/octet-stream"; 
        Response.Write(GPIUnlock.getCode(product, esn)); 
        Response.End();
      }
    } catch (Exception ex) { }
  }
</script>
