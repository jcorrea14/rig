<!--#include virtual="/common/nauth/authenticate.asp"--><%

  Authenticate "RIG_ANY", "Rig Locator"

  set f = Server.CreateObject("WebMan.WebFile")
  Filename = Request("article")
  f.Name = Filename

  t = f.text
  pos = instr(f.Text, "<meta name=""sourcedate""")
  if pos > 0 then
    t = mid(t, pos + 33)
    pos = instr(t, """")
    if pos > 0 then
      PubDate = left(t, pos - 1)
    end if
  end if
  t = ""
  f.GetArticle
  title = f.Headline
%>
<!--#include virtual="/include/rpthdr.inc"-->
<% = nauthbeacon %>
<div class="sub">
  <% = Pubdate %>
</div>
<h1><% Response.Write Server.HTMLEncode (f.Headline) %></h1>
<% Response.Write f.StoryText %>
<!--#include virtual="/include/rptftr.inc"-->
