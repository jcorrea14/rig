using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class DownloadPage : System.Web.UI.Page {

  private string _label = "";

  protected string HtmlLink { get { return "/report/rig-" + _label; } }
  protected string FileLink { get { return "/download-file/rig-" + _label + ".csv"; } }
  protected string MapLink { get { return "/download-file/map-" + _label + ".csv"; } }

  protected override void OnLoad(EventArgs e) {
    if (!IsPostBack) {
      try {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();
      
        String sql = @"
select distinct top 20
  Updated,
  replace(convert(varchar, updated, 11), '/', '') S
from webRig2 order by Updated desc";
        SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds, "dates");
        conn.Close();

        _label = ds.Tables["dates"].Rows[0]["S"].ToString();
        result.DataSource = ds.Tables["dates"];
        result.DataBind();
      } catch (Exception ex) {  }
    }
  }
}
