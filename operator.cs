using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class OperatorPage : System.Web.UI.Page {
  
  string _operatorname = "";

  protected String OperatorName { get { return _operatorname; } }

  override protected void OnLoad(EventArgs e) {
    try {
      if (!IsPostBack) {
        String op = Request["id"];

        SqlConnection conn = new SqlConnection(
            ConfigurationManager.ConnectionStrings["WellConnectionString"].ToString());
        conn.Open();

        string sql = String.Format(@"
select distinct OperatorName
from vwWebRig2
where OperatorName like Replace('{0}', '-', '%')
", op);


        SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        ad.Fill(ds, "operator");

        if (ds.Tables["operator"].Rows.Count != 1)
          throw new Exception("not single operator");
        
        _operatorname = ds.Tables["operator"].Rows[0][0].ToString();

        sql = String.Format(@"
select
  Rig,
  Prov,
  Location,
  PSACArea,
  Area,
  Status,
  Capacity,
  ContractorName,
  WellType,
  Class,
  Spud,
  ProjDepth
from vwWebRig2
where OperatorName = '{0}'
order by Rig", _operatorname.Replace("'", "''"));
        ad = new SqlDataAdapter(sql, conn);
        ad.Fill(ds, "rig");
        conn.Close();
        result.DataSource = ds.Tables["rig"];
        result.DataBind();
      }
    } catch (Exception ex) { 
      Response.Clear();
      Response.StatusCode = 404;
      Response.Status = "404 Not Found";
      Response.End();
    }
  }
}



