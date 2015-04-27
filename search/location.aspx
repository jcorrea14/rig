<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Search By Location"
    AutoEventWireup="true"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <div class="container">
    <div id="search" runat="server">
      <div class="row">
        <h1>Drilling Rig Search</h1>
        <ul>
          <li><a href="/search/operator">By Operator</a></li>
          <li><a href="/search/contractor">By Contractor</a></li>
          <li><span class="selected">By Location</span></li>
        </ul>
      </div>
    </div>
  </div>
</asp:Content>
