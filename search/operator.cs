using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class OperatorSearch : System.Web.UI.Page {

  protected void search_click (object sender, EventArgs e) {
    try {
      result.Criteria = "";
      results.Visible = true;
    } catch (Exception ex) {  }
  }


  override protected void OnLoad(EventArgs e) {
    try {
      SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
      conn.Open();
      String sql = @"
select * from (
select
  '[All Operators]' Operator
union
select
  distinct OperatorName as Operator
from vwWebRig2
where
  Operator is not null
  and RigType = 'D') T
order by Operator";
      SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
      DataSet ds = new DataSet();
      ad.Fill(ds, "operator");
      conn.Close();
      op.DataSource = ds.Tables["operator"];
      op.DataValueField = "Operator";
      op.DataBind();
    } catch (Exception ex) { }
  }
}
