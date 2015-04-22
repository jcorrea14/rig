using System;
using System.Configuration;
using GarminUnlock;
using Ajax;

public partial class index : System.Web.UI.Page {
  
  private string _product = ConfigurationManager.AppSettings["Garmin.Product"];
  private string _filename = ConfigurationManager.AppSettings["Garmin.FileName"];
  private string _source = ConfigurationManager.AppSettings["Garmin.Source"];
  private string _unlockSource = ConfigurationManager.AppSettings["Garmin.UnlockSource"];
  private string _gmaUnlockSource = ConfigurationManager.AppSettings["Garmin.GMAUnlockSource"];
  private string _controlDomain = ConfigurationManager.AppSettings["Garmin.ControlDomain"];
  private string _controlUnlock = ConfigurationManager.AppSettings["Garmin.ControlUnlock"];

  protected string FileName { get { return _filename; } }
  protected string Source { get { return _source; } }
  protected string UnlockSource { get { return _unlockSource; } }
  protected string GMAUnlockSource { get { return _gmaUnlockSource; } }
  protected string ControlDomain { get { return _controlDomain; } }
  protected string ControlUnlock { get { return _controlUnlock; } }

  protected void Page_Load(object sender, EventArgs e) {
    if (!IsPostBack)
      Ajax.Utility.RegisterTypeForAjax(this.GetType(), this);
  }

  [Ajax.AjaxMethod()]
  public string GetUnlockCode(string esn) {
    try {
      return GPIUnlock.GetUnlockCode(esn);
    }
    catch(Exception ex) {
      return ex.Message;
    }
  }
}
