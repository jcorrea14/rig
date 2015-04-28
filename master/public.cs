using System;
using System.Web;
using System.Configuration;

public partial class PublicMaster : System.Web.UI.MasterPage {

  protected override void OnInit(EventArgs e) {
    bool loggedIn = ((BaseMaster)Master).LoggedIn;
    logged_in.Visible = loggedIn;
    not_logged_in.Visible = !loggedIn;
  }

}
