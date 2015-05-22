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
        <div class="col-md-8">
          <h1 id="pageTitle" runat="server" />
          <div id="pageBody" runat="server" />
        </div>
        <div class="col-md-4 vert-offset-top-2">
          <div class="row">
            <div class="side-ad pull-right"> 
              <!-- big box -->
              <div id='div-gpt-ad-1329923512779-10' style='width:300px; height:250px; margin:10px 0 20px 0;'> 
                <script type='text/javascript'>
                     googletag.display('div-gpt-ad-1329923512779-10');
                </script> 
              </div>
              <div> 
                <!-- button box -->
                <div id='div-gpt-ad-1335301288326-2' style='width:300px; height:120px; margin-bottom:10px;'> 
                  <script type='text/javascript'>
                      googletag.display('div-gpt-ad-1335301288326-2');
                </script> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
