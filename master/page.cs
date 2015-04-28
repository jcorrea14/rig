using System;

public partial class PageMaster : System.Web.UI.MasterPage {

  protected override void OnInit(EventArgs e) {
    if (!((BaseMaster)Master).LoggedIn)
      Response.Redirect("/");
  }
}