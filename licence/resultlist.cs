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
  WellName,
  LocationLine,
  Surface,
  Province,
  LicenceId,
  LicenceDate,
  Operator,
  UWI,
  WellClass,
  Objective,
  case Type
    when 'H' then 'HZ'
    when 'D' then 'DIR'
    else ''
  end Type,
  ProjectedZone,
  isNull(ProjectedDepth, 0) ProjectedDepth
from WebWell2 where {0}
order by LicenceDate desc, Province, LicenceId", value);
      SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
      DataSet ds = new DataSet();
      ad.Fill(ds, "well");
      conn.Close();
      result.DataSource = ds.Tables["well"];
      result.DataBind();
    }
  }
}
