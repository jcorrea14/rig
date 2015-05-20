<%@ Page
Language="C#"
MasterPageFile="/master/page.master"
Title="Rig Locator | Daily Well Licences PDF" %>
<%@ Register Src="/licence/calendar.ascx" TagName="calendar" TagPrefix="dob" %>
<asp:Content ContentPlaceHolderId="page_content" runat="server">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Daily Well Licences</h1>
            <ul>
              <li><a href="/licence/" class="btn btn-xl btn-rig full-width">By Date</a></li>
              <li><a href="/licence/pdf.aspx" class="btn btn-xl btn-rig full-width selected">Daily PDF</a></li>
              <li><a href="/licence/operator.aspx" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/licence/location.aspx" class="btn btn-xl btn-rig full-width">By Location</a></li>
              <li class="pull-right"> </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="dnl-calendar">
          <dob:calendar runat="server" UrlFormat="/licence/view-pdf.aspx?file=dnl-{0:yyMMdd}.pdf" />
        </div>
      </div>
    </div>
  </section>
</asp:Content>
