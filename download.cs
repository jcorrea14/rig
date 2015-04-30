using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class DownloadPage : System.Web.UI.Page {

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
        result.DataSource = ds.Tables["dates"];
        result.DataBind();
      } catch (Exception ex) {  }
    }
  }
}
