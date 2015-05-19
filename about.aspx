<%@ Page
    Language="C#"
    MasterPageFile="/master/public.master"
    Title="More about Rig Locator"
    %>
<%@ Import Namespace="ContentMgr"%>
<script runat="server">
  protected void Page_Load(object sender, EventArgs e) {
    try {
      if (!IsPostBack) {
        WebPage p = new WebPage("RIG", "ABOUT");
        pageTitle.InnerText = p.Title;
        pageBody.InnerHtml = p.Body;
        Page.Header.Title = "More about Rig Locator";
      }
    } catch (Exception ex) {  }
  }
</script>
<asp:Content runat="server" ContentPlaceholderId="page_meta">
  <meta name="description" content="Find out more about the Rig Locator, western Canada's best rig fleet information tool." />
</asp:Content>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h1 id="pageTitle" runat="server" />
          <div id="pageBody" runat="server" />
        </div>
      </div>
    </div>
  </section>
</asp:Content>
