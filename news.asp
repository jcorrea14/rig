<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_ANY", "Rig Locator"

  DocName = Replace (Request("article"), "\", "/")

  set f = Server.CreateObject("WebMan.WebFile")
  Filename = Request("article")
  f.Name = Filename
  Select Case UCase(Right(FileName, 4))
    Case ".TXT"
      Response.ContentType = "text/plain"
      Response.Write f.Text
    Case ".JPG"
      Response.ContentType = "image/JPEG"
      Response.BinaryWrite f.Data
    Case ".GIF"
      Response.ContentType = "image/GIF"
      Response.BinaryWrite f.Data
    Case ".PNG"
      Response.ContentType = "image/PNG"
      Response.BinaryWrite f.Data
    Case "HTML", ".HTM"
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
%><!--#include virtual="/include/nav.inc"-->
<% = nauthbeacon %>
<table cellspacing=0 cellpadding=0 border=0 width="100%">
<tr valign="top"><td class="dateline">
<a href="/printer.asp?article=<% = Server.URLEncode(DocName) %>"><img
src="/graphics/printer.gif" width=16 height=16 alt="[PRINT]" border=0
align="top"></a>
<a href="/printer.asp?article=<% = Server.URLEncode(DocName) %>">Printer
friendly version</a>
</td><td class="dateline" align="right"><% = Pubdate %></td></tr></table>
<h1><% Response.Write Server.HTMLEncode (f.Headline) %></h1>
<% Response.Write f.StoryText %>
<h6><img src="graphics/top.gif" align="absbottom" border="0"> <a href="#top">Top</a></h6>
<!--#include virtual="/include/footer.inc"-->
<%
    case else
      Response.ContentType = "application/octet-stream"
      Response.BinaryWrite f.Data
  end select  
%>
