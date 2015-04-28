using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class LocationSearch : System.Web.UI.Page {

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

  private void showResults() {
    try {
      result.Criteria = _criteria + " order by Sort";
      results.Visible = true;
      search.Visible = false;
    } catch (Exception ex) {  }
  }

  protected void search_province_click (object sender, EventArgs e) {
    _criteria = "";

    String prov = province.SelectedValue;

    if (prov == "") {
      noprovincemsg.Visible = true;
      return;
    } else {
      switch(prov) {
        case "EC": addClause("Prov in ('ON', 'QC', 'NB', 'NS', 'PE', 'NL')"); break;
        case "NC": addClause("Prov in ('YT', 'NT', 'NU')"); break;
        default: addClause("Prov = " + sqlString(prov)); break;
      }
    }
    showResults();
  }

  protected void search_dls_click (object sender, EventArgs e) {
    _criteria = "";

    int twp1, twp2, rge1, rge2, mer1, mer2;

    int.TryParse(fromTownship.SelectedValue, out twp1);
    int.TryParse(toTownship.SelectedValue, out twp2);
    int.TryParse(fromRange.SelectedValue, out rge1);
    int.TryParse(toRange.SelectedValue, out rge2);
    int.TryParse(fromMeridian.SelectedValue, out mer1);
    int.TryParse(toMeridian.SelectedValue, out mer2);

    if (twp1 > 0) {
      if (twp2 > 0) {
        if (twp1 == twp2)
          addClause(String.Format("Township = {0}" , twp1));
        else {
          if (twp1 > twp2)
            addClause(String.Format("Township between {0} and {1}", twp2, twp1));
          else
            addClause(String.Format("Township between {0} and {1}", twp1, twp2));
        }
      }
      else
        addClause(String.Format("Township = {0}", twp1));
    }
    else {
      if (twp2 > 0)
        addClause(String.Format("Township = {0}", twp2));
      else {
        nodlsmsg.Visible = true;
        return;
      }
    }
        
    if (rge1 > 0) {
      if (rge2 > 0) {
        if (rge1 == rge2)
          addClause(String.Format("Range = {0}" , rge1));
        else {
          if (rge1 > rge2)
            addClause(String.Format("Range between {0} and {1}", rge2, rge1));
          else
            addClause(String.Format("Range between {0} and {1}", rge1, rge2));
        }
      }
      else
        addClause(String.Format("Range = {0}", rge1));
    }
    else {
      if (rge2 > 0)
        addClause(String.Format("Range = {0}", rge2));
      else {
        nodlsmsg.Visible = true;
        return;
      }
    }

    if (mer1 > 0) {
      if (mer2 > 0) {
        if (mer1 == mer2)
          addClause(String.Format("Meridian = {0}" , mer1));
        else {
          if (mer1 > mer2)
            addClause(String.Format("Meridian between {0} and {1}", mer2, mer1));
          else
            addClause(String.Format("Meridian between {0} and {1}", mer1, mer2));
        }
      }
      else
        addClause(String.Format("Meridian = {0}", mer1));
    }
    else {
      if (mer2 > 0)
        addClause(String.Format("Meridian = {0}", mer2));
      else {
        nodlsmsg.Visible = true;
        return;
      }
    }

    showResults();
  }

  protected void search_nts_click (object sender, EventArgs e) {
    _criteria = "";

    int quad1, quad2, sheet1, sheet2;
    string map1, map2;

    int.TryParse(fromMapUnit.SelectedValue, out quad1);
    int.TryParse(toMapUnit.SelectedValue, out quad2);
    map1 = fromMapUnitSub.SelectedValue;
    map2 = toMapUnitSub.SelectedValue;
    int.TryParse(fromMapSheet.SelectedValue, out sheet1);
    int.TryParse(toMapSheet.SelectedValue, out sheet2);

    if (quad1 > 0) {
      if (quad2 > 0) {
        if (quad1 == quad2)
          addClause(String.Format("MapUnit = {0}" , quad1));
        else {
          if (quad1 > quad2)
            addClause(String.Format("MapUnit between {0} and {1}", quad2, quad1));
          else
            addClause(String.Format("MapUnit between {0} and {1}", quad1, quad2));
        }
      }
      else
        addClause(String.Format("MapUnit = {0}", quad1));
    }
    else {
      if (quad2 > 0)
        addClause(String.Format("MapUnit = {0}", quad2));
      else {
        nontsmsg.Visible = true;
        return;
      }
    }
        
    if (map1 != "") {
      if (map2 != "") {
        if (map1 == map2)
          addClause(String.Format("MapUnitSub = '{0}'" , map1));
        else {
          if (String.Compare(map1, map2) > 0)
            addClause(String.Format("MapUnitSub between '{0}' and '{1}'", map2, map1));
          else
            addClause(String.Format("MapUnitSub between '{0}' and '{1}'", map1, map2));
        }
      }
      else
        addClause(String.Format("MapUnitSub = '{0}'", map1));
    }
    else {
      if (map2 != "")
        addClause(String.Format("MapUnitSub = '{0}'", map2));
      else {
        nontsmsg.Visible = true;
        return;
      }
    }

    if (sheet1 > 0) {
      if (sheet2 > 0) {
        if (sheet1 == sheet2)
          addClause(String.Format("MapSheet = {0}" , sheet1));
        else {
          if (sheet1 > sheet2)
            addClause(String.Format("MapSheet between {0} and {1}", sheet2, sheet1));
          else
            addClause(String.Format("MapSheet between {0} and {1}", sheet1, sheet2));
        }
      }
      else
        addClause(String.Format("MapSheet = {0}", sheet1));
    }
    else {
      if (sheet2 > 0)
        addClause(String.Format("MapSheet = {0}", sheet2));
      else {
        nontsmsg.Visible = true;
        return;
      }
    }

    showResults();
  }

  protected override void OnLoad(EventArgs e) {
    noprovincemsg.Visible = false;
    nodlsmsg.Visible = false;
    nontsmsg.Visible = false;
  }
}