<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Contractor’s Rigs"
    AutoEventWireup="true"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div id="results" runat="server" visible="false">
          <div class="col-md-9">
            <div class="row">
              <riglocator:resultslist id="result" runat="server" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
