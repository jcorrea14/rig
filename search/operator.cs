using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class OperatorSearch : System.Web.UI.Page {

  private String _criteria = "";

  private void addClause(String clause) {
    if(_criteria != "")
      _criteria += " and ";
    else
      _criteria += " where ";
    _criteria += clause;
  }

  private String sqlString(String s) {
    return "'" + s.Trim().Replace("'", "''") + "'";
  }

  protected String Criteria {
    get { return _criteria; } 
  }

  protected void search_click (object sender, EventArgs e) {
    try {
      _criteria = "";

      String operatorName = op.SelectedValue;
      String prov = province.SelectedValue;
      String rigStatus = status.SelectedValue;
      String sort = "";

      if (operatorName == "[SELECT AN OPERATOR]") {
        noselectionmsg.Visible = true;
        return;
      } else {
        addClause("OperatorName = " + sqlString(operatorName));
      }

      switch(prov) {
        case "": break;
        case "EC": addClause("Prov in ('ON', 'QC', 'NB', 'NS', 'PE', 'NL')"); break;
        case "NC": addClause("Prov in ('YT', 'NT', 'NU')"); break;
        default: addClause("Prov = " + sqlString(prov)); break;
      }

      switch(rigStatus) {
        case "all": break;
        case "active": addClause("Status in ('DRILL', 'MIR')"); break;
        default: addClause("Status = " + sqlString(rigStatus)); break;
      }

      if (rigsort.Checked) sort = "Contractor, Rig";
      else if (areasort.Checked) sort = "case when Area is null then 1 else 0 end, Area, Sort";
      else if (spudsort.Checked) sort = "case when Spud is null then 1 else 0 end, Spud, Sort";
      else if (classsort.Checked) sort = "case when Class is null then 1 else 0 end, Class, Sort";
      else if (statussort.Checked) sort = "Status, Sort";
      else sort = "Sort";

      result.Criteria = _criteria + " order by " + sort;
      results.Visible = true;
      search.Visible = false;
    } catch (Exception ex) {  }
  }


  override protected void OnLoad(EventArgs e) {
    try {
      if (!IsPostBack) {
        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();
        String sql = @"
select * from (
select
  '[SELECT AN OPERATOR]' Operator
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
        op.SelectedIndex = 0;
      }
    } catch (Exception ex) { }
  }
}
