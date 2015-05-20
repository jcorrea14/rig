<%@ Page
MasterPageFile="/master/page.master"
Title="Rig Locator | Browse Well Licences By Date" %>
<%@ Register Src="/licence/calendar.ascx" TagName="calendar" TagPrefix="dob" %>
<asp:Content ContentPlaceHolderId="page_content" runat="server">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Well Licence Search</h1>
            <ul>
              <li><a href="/licence/" class="btn btn-xl btn-rig full-width selected">By Date</a></li>
              <li><a href="/licence/pdf.aspx" class="btn btn-xl btn-rig full-width">Daily PDF</a></li>
              <li><a href="/licence/operator.aspx" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/licence/location.aspx" class="btn btn-xl btn-rig full-width">By Location</a></li>
              <li class="pull-right"> </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="dnl-calendar">
          <dob:calendar runat="server" UrlFormat="/licence/results.aspx?date={0:yyyy-MM-dd}" />
        </div>
      </div>
    </div>
  </section>
</asp:Content>

<asp:Content ContentPlaceHolderId="page_css" runat="server">
  <style>

.dnl-calendar table {
  width: 100%;
}
  

.dnl-calendar table tr td {
  font-size: 1em;
  vertical-align: top;
  width: 14.285714285714287%;
}

.dnl-calendar table tr td.weekday {
  text-align: center;
  color: white;
  background: #881630;
}

.dnl-calendar table tr td.day {
  text-align: center;
}
  </style>

</asp:Content>
