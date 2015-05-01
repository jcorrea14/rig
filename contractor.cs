using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ContractorPage : System.Web.UI.Page {

  override protected void OnLoad(EventArgs e) {
    try {
      if (!IsPostBack) {
        String contractor = Request["id"];

        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();
        String sql = String.Format(@"
select
  Rig,
  Prov,
  Location,
  Area,
  Status,
  Capacity,
  OperatorName,
  WellType,
  Class,
  Spud,
  ProjDepth
from vwWebRig2
where ContractorName like Replace('{0}', '-', '%')
order by Rig", contractor);
        SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds, "rig");
        conn.Close();
        result.DataSource = ds.Tables["rig"];
        result.DataBind();
      }
    } catch (Exception ex) { }
  }
}



