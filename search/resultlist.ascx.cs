using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ResultList : System.Web.UI.UserControl {
  public String Criteria {
    set {
      SqlConnection conn = new SqlConnection(
          ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
      conn.Open();
      String sql = String.Format(@"
select
  Prov,
  Location,
  Area,
  ContractorName,
  Rig,
  Status,
  Capacity,
  OperatorName,
  UC,
  WellType,
  Class,
  Spud,
  ProjDepth,
  Camp
from vwWebRig2 where RigType = 'D'");
      SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
      DataSet ds = new DataSet();
      ad.Fill(ds, "well");
      conn.Close();
      result.DataSource = ds.Tables["well"];
      result.DataBind();
    }
  }
}
