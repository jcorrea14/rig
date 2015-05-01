using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ContractorPage : System.Web.UI.Page {
  
  string _contractorname = "";

  protected String ContractorName { get { return _contractorname; } }

  override protected void OnLoad(EventArgs e) {
    // try {
      if (!IsPostBack) {
        String contractor = Request["id"];

        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();
        string sql = String.Format(@"
select distinct ContractorName
from vwWebRig2
where ContractorName like Replace('{0}', '-', '%')
", contractor);
        SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds, "contractor");

        if (ds.Tables["contractor"].Rows.Count != 1)
          throw new Exception("not single contractor");
        
        _contractorname = ds.Tables["contractor"].Rows[0][0].ToString();

        sql = String.Format(@"
select
  Rig,
  Prov,
  Location,
  PSACArea,
  Area,
  Status,
  Capacity,
  OperatorName,
  WellType,
  Class,
  Spud,
  ProjDepth
from vwWebRig2
where ContractorName = '{0}'
order by Rig", _contractorname.Replace("'", "''"));
        ad = new SqlDataAdapter(sql, conn);
        ad.Fill(ds, "rig");
        conn.Close();
        result.DataSource = ds.Tables["rig"];
        result.DataBind();
      }
      /*
    } catch (Exception ex) { 
      Response.Clear();
      Response.StatusCode = 404;
      Response.Status = "404 Not Found";
      Response.End();
    }
    */
  }
}



