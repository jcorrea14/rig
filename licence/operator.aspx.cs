using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Op : System.Web.UI.Page {
  private String _criteria = "";

  private void addClause(String clause) {
    if(_criteria != "")
      _criteria += " and ";
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
      if(op.SelectedIndex >= 0)
        addClause("Operator = " + sqlString(op.SelectedValue));

      if(objective.SelectedValue != "ANY")
        addClause("Objective = " + sqlString(objective.SelectedValue));

      if(type.SelectedValue != "ANY")
        addClause("Type = " + sqlString(type.SelectedValue));

      if(wellclass.SelectedValue != "ANY")
        addClause("WellClass = " + sqlString(wellclass.SelectedValue));

      if(depth.SelectedValue != "ANY")
        switch(int.Parse(depth.SelectedValue)) {
        case 1:
          addClause("cast(ProjectedDepth as int) <= 950"); break;
        case 2:
          addClause("cast(ProjectedDepth as int) between 951 and 1850"); break;
        case 3:
          addClause("cast(ProjectedDepth as int) between 1851 and 2450"); break;
        case 4:
          addClause("cast(ProjectedDepth as int) between 2451 and 3050"); break;
        case 5:
          addClause("cast(ProjectedDepth as int) between 3051 and 3700"); break;
        case 6:
          addClause("cast(ProjectedDepth as int) between 3701 and 4600"); break;
        case 7:
          addClause("cast(ProjectedDepth as int) > 4600"); break;
        }

      addClause(String.Format("LicenceDate between '{0}-{1}-{2}' and '{3}-{4}-{5}'",
                              yearfrom.SelectedValue,
                              monthfrom.SelectedValue,
                              dayfrom.SelectedValue,
                              yearto.SelectedValue,
                              monthto.SelectedValue,
                              dayto.SelectedValue));

      result.Criteria = _criteria;
      results.Visible = true;
      search.Visible = false;
    } catch (Exception ex) {  }
  }

  override protected void OnLoad(EventArgs e) {
    if (!IsPostBack) {
      try {
        DateTime d = DateTime.Today.AddDays(-1);
        int y = d.Year;
        for(int i = y - 2; i <= y; i++) {
          yearfrom.Items.Add(i.ToString());
          yearto.Items.Add(i.ToString());
        }
        yearto.SelectedValue = y.ToString();
        monthto.SelectedValue = d.Month.ToString();
        dayto.SelectedValue = d.Day.ToString();

        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();
        String sql = String.Format(@"
select * from (
select
  '[SELECT AN OPERATOR]' Operator
union
select distinct
  Operator
from WebWell2) T
order by Operator");
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
}
