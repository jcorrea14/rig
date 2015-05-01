<%@ Page
  Language="C#"
  MasterPageFile="~/master/public.master"
  Title="Page not found"
  %>
<script runat="server">
  protected override void Render(HtmlTextWriter writer) {
    base.Render(writer);
    Response.StatusCode = 404;
  }
</script>
<asp:Content ContentPlaceHolderID="page_content" runat="server">
  <section class="mainContent">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h1>Page not found</h1>
          <p>The requested web page is not available.</p>
          <p>
            <a href="/">
              Rig Locator home page
            </a>
          </p>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
