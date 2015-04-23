<%@
  Page Language="c#"
  EnableViewState="false"
  MasterPageFile="/master/page.master"
  CodeFile="report.cs"
  Inherits="Report" %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div id="report" runat="server"></div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>  
