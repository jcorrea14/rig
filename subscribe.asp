<%
  Response.ContentType = "text/html"
  Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
  Response.CodePage = 65001
  Response.CharSet = "UTF-8"
  set f = Server.CreateObject("ContentMgr.Finder")
  set page = f.getWebPage("RIG", "SUBSCRIBE")
  title = "Rig Locator -- " & page.Title & " | JuneWarren-Nickle's Energy Group"
%><!--#include virtual="/include/nav.inc" -->
<div style="margin-bottom: 12px;">
  <h1><% = Server.HtmlEncode(title) %></h1>
  <% = page.Body %>
</div>
<!--#include virtual="/include/footer.inc" -->