using System;
using System.Web;

public partial class LicenceLoc : System.Web.UI.Page {
  private String _criteria = "";

  private void addClause(String clause) {
    if(clause != "") {
      if(_criteria != "")
        _criteria += " and ";
      _criteria += clause;
    }
  }
    
  private String sqlString(String s) {
    return "'" + s.Trim().Replace("'", "''") + "'";
  }

  protected String Criteria {
    get { return _criteria; } 
  }

  private String span(String field, String a, String b) {
    if(a != "")
      if(b != "")
        if(a == b)
          return field + " = " + a;
        else if(int.Parse(a) < int.Parse(b))
          return field + " between " + a + " and " + b;
        else
          return field + " between " + b + " and " + a;
      else
        return field + " = " + a;
    else if(b != "")
      return field + " = " + b;
    else
      throw new Exception(field + " is required");
  }

  private String spanString(String field, String a, String b) {
    if(a != "") {
      if(b != "") {
        if(a == b)
          return field + " = '" + a + "'";
        else if(String.Compare(a, b) < 0)
          return field + " between '" + a + "' and '" + b + "'";
        else
          return field + " between '" + b + "' and '" + a + "'";
      }
      else
        return field + " = '" + a + "'";
    }
    else
      if(b != "")
        return field + " = '" + b + "'";
    else
      throw new Exception(field + " is required");
  }

  protected void search_dls_click (object sender, EventArgs e) {
    _criteria = "";
    addClause(span("Township", fromTownship.SelectedValue, toTownship.SelectedValue));
    addClause(span("Range", fromRange.SelectedValue, toRange.SelectedValue));
    addClause(span("Meridian", fromMeridian.SelectedValue, toMeridian.SelectedValue));
    search_click(sender, e);
  }
    
  protected void search_nts_click (object sender, EventArgs e) {
    _criteria = "";
    addClause(span("MapUnit", fromMapUnit.SelectedValue, toMapUnit.SelectedValue));
    addClause(spanString("MapUnitSub", fromMapUnitSub.SelectedValue, toMapUnitSub.SelectedValue));
    addClause(span("MapSheet", fromMapSheet.SelectedValue, toMapSheet.SelectedValue));
    search_click(sender, e);
  }
    

  protected void search_click (object sender, EventArgs e) {
    try {
      addClause(String.Format("LicenceDate between '{0}-{1}-{2}' and '{3}-{4}-{5}'",
                              yearfrom.SelectedValue,
                              monthfrom.SelectedValue,
                              dayfrom.SelectedValue,
                              yearto.SelectedValue,
                              monthto.SelectedValue,
                              dayto.SelectedValue));

      result.Criteria = _criteria;
      results.Visible = true;
      form.Visible = false;
    } catch (Exception ex) { errMsg.InnerText = ex.Message; }
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
      } catch (Exception ex) { }
    }
  }

}