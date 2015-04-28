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
    /*
    int twp1, twp2, rge1, rge2, mer1, mer2;

    int.TryParse(fromTownship.SelectedValue, out twp1);
    int twp2 = toTownship.SelectedValue;
    int rge1 = fromRange.SelectedValue;
    String rge2 = toRange.SelectedValue;
    String mer1 = fromMeridian.SelectedValue;
    String mer2 = toMeridian.SelectedValue;


    if Request("fromTownship") <> "" then
      if Request("toTownship") <> "" then
        if Request("fromTownship") = Request("toTownship") then
          addClause " Township = " & Request("fromTownship")
        elseif cint(Request("fromTownship")) > _
               cint(Request("toTownship")) then
          addClause " Township between " & Request("toTownship") & _
               " and " & Request("fromTownship")
        else
          addClause " Township between " & Request("fromTownship") & _
               " and " & Request("toTownship")
        end if
      else
        addClause " Township = " & Request("fromTownship")
      end if
    else
      if Request("toTownship") <> "" then
        addClause " Township = " & Request("toTownship")
      end if
    end if
    if Request("fromRange") <> "" then
      if Request("toRange") <> "" then
        if Request("fromRange") = Request("toRange") then
          addClause " Range = " & Request("fromRange")
        elseif cint(Request("fromRange")) > _
               cint(Request("toRange")) then
          addClause " Range between " & Request("toRange") & _
               " and " & Request("fromRange")
        else
          addClause " Range between " & Request("fromRange") & _
               " and " & Request("toRange")
        end if
      else
        addClause " Range = " & Request("fromRange")
      end if
    else
      if Request("toRange") <> "" then
        addClause " Range = " & Request("toRange")
      end if
    end if
     if Request("fromMeridian") <> "" then
      if Request("toMeridian") <> "" then
        if Request("fromMeridian") = Request("toMeridian") then
          addClause " Meridian = " & Request("fromMeridian")
        elseif cint(Request("fromMeridian")) > _
               cint(Request("toMeridian")) then
          addClause " Meridian between " & Request("toMeridian") & _
               " and " & Request("fromMeridian")
        else
          addClause " Meridian between " & Request("fromMeridian") & _
               " and " & Request("toMeridian")
        end if
      else
        addClause " Meridian = " & Request("fromMeridian")
      end if
    else
      if Request("toMeridian") <> "" then
        addClause " Meridian = " & Request("toMeridian")
      end if
    end if

    */
    showResults();
  }

  protected void search_nts_click (object sender, EventArgs e) {
    showResults();
  }

}