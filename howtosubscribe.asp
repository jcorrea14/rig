<%
  Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
  Response.CodePage = 65001
  Response.CharSet = "UTF-8"

  set f = Server.CreateObject("ContentMgr.Finder")
  set page = f.getWebPage("JWN", "RIG")
  title = page.Title
%><!--#include virtual="/include/nav.inc" -->
<div class="content-column">
  <h1><% = Server.HtmlEncode(title) %></h1>
  <% = page.Body %>
</div>
<!--#include virtual="/include/footer.inc" -->