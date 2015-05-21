<%@ Page
    MasterPageFile="/master/page.master"
    CodeFile="date.cs"
    Inherits="Results"
    Title="Rig Locator | Browse Well Licences By Date" %>
<%@ Register Src="/licence/resultlist.ascx" TagName="resultslist" TagPrefix="dob" %>
<asp:Content ContentPlaceHolderId="page_content" runat="server">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Daily Well Licences</h1>
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
        <h3>New Locations Announced To The Daily Oil Bulletin <% = PubDate %></h3>
        <dob:resultslist id="result" runat="server" />
      </div>
    </div>
  </section>
</asp:Content>
