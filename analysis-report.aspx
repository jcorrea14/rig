<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Market Share Analysis Report"
    %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h1>Rig Market Share Analysis Report</h1>
          <span class="data-icon-1"> </span>
          <h4> This report provides the Q1 2015 drilling contractor marketshare rankings, drilled wells depths and types, and producer activity rankings for western Canadian PSAC regions.</h4>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-5 block-center text-center"> <a href="pdf/Rig Locator-Drilling-Market-Analysis-Report-20150525-Final.pdf" target="_blank" onclick="_gaq.push(['_trackEvent', 'Rig Market Share Analysis Report', 'Download PDF']);"><img src="img/market-share-report.jpg" alt="Rig Market Share Analysis Report"/></a> <a href="pdf/Rig Locator-Drilling-Market-Analysis-Report-20150525-Final.pdf" target="_blank" class="btn btn-xl btn-rig" onclick="_gaq.push(['_trackEvent', 'Rig Market Share Analysis Report', 'Download PDF']);">Download PDF</a> </div>
      </div>
    </div>
  </section>
</asp:Content>
