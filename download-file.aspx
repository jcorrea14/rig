<%@
  Page Language="C#"
  MasterPageFile="/master/page.master"
  EnableViewState="false"
  Title="Premium Membership Required"
  CodeFile="download-file.cs"
  Inherits="DownloadFile"
 %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container">
      <div class="row">
        <h1>
          Premium Membership Required
        </h1>
        <p>
          The file you want to download requires a premium membership to Rig Locator.
        </p>
        <p>
          <a href="http://www.junewarren-nickles.com/new-membership/rig.html">Upgrade your membership</a>
        </p>
      </div>
    </div>
  </section>
</asp:Content>
