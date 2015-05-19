<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Locator Well Licences"
    %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container">
      <div class="row">
        <div class="col-md-8"><img src="img/datacentral.jpg" alt="Data Central" width="350"/> </div>
      </div>
    </div>
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <h4> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sagittis rhoncus metus, quis mollis nisi blandit sit amet. Donec finibus et dolor a fermentum. Vestibulum sagittis, purus nec euismod mollis, quam eros euismod erat, sit amet fringilla purus metus in ex. Donec bibendum interdum pulvinar. Cras id finibus tellus, sit amet congue magna. In pharetra rhoncus dui, et ultrices mi facilisis quis. Nam a lorem eget arcu eleifend posuere et sit amet magna.</h4>
          
          <h2>Reports</h2>
          <div class="well-licences">
            <ul>
              <li><a href="http://www.datacentralcanada.com/licence/report.asp?report=dnl%2Fcount.html" target="_blank" class="btn btn-xl btn-rig full-width selected">Monthly Licence Count</a></li>
              <li><a href="http://www.datacentralcanada.com/licence/report.asp?report=dnl%2Fhz-dir.html" target="_blank" class="btn btn-xl btn-rig full-width">Horizontal and Directional Count</a></li>
              <li><a href="http://www.datacentralcanada.com/licence/report.asp?report=dnl%2Fexpl-dev.html" target="_blank" class="btn btn-xl btn-rig full-width">Exploratory and Development Count</a></li>
              <li><a href="http://www.datacentralcanada.com/licence/report.asp?report=dnl%2Ftop-25.html" target="_blank" class="btn btn-xl btn-rig full-width">Top 25 Licencees</a> </li>
            </ul>
            <h4>*All reports include observation wells</h4>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
