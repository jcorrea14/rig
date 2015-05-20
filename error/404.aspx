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
        <div class="col-lg-12 text-center"> <span class="feature-icon-1"> </span>
          <h1><strong>404 Rig Down!</strong></h1>
          <h3>We couldn't find what you were looking for. </h3>
          <h4>The file may have been moved or deleted. Be sure to check your spelling.</h4>
          <p> <a href="/" class="btn btn-xl btn-blk">Back to home </a> </p>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
