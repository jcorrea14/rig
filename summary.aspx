<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Locator Dashboard"
    %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <h1>Drilling Graphs</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 text-center">
          <h4>Well Licences Issued</h4>
          <img src="/licences.gif" border=0>
          <p>Friday: 95</p>
          <p>Year to Date: 4027 </p>
        </div>
        <div class="col-md-3 text-center">
          <h4>Drilling Activity</h4>
          <img src="/activity.gif" border=0>
          <p>Currently Active: 629</p>
          <p>Current Fleet: 789 </p>
        </div>
        <div class="col-md-3 text-center">
          <h4>Completions</h4>
          <img src="/completions.gif" border=0>
          <p>Week Ended Mar 9: 235</p>
          <p>Year to Date: 2084 </p>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
