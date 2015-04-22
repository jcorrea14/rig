<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_ANY", "Rig Locator"

  set client = Server.CreateObject("NAuth2.COMAuthenticationClient")
  set user = client.getUser(nauthreference)

  DocName = Replace (Request("report"), "\", "/")
  p = instrrev(DocName, "/")
  if p > 0 then
    DocName = mid(DocName, p + 1)
  end if

  Filename = Request("report")
  ext = UCase(right(Filename, 4))
  if ext = ".XLS" or ext = ".CSV" then
     if not user.CanAccess("RIG_EXPORT") then
       response.redirect "premium.asp"
     end if
  else
    if not user.CanAccess("RIG_BROWSE") then
      response.redirect "drilling.asp"
    end if
  end if

  set f = Server.CreateObject("WebMan.WebFile")
  f.Name = Filename

  Select Case ext
    Case ".TXT"
      Response.ContentType = "text/plain"
      Response.Write f.Text
    Case ".RPT"
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
    Case ".PDF"
      Response.ContentType = "application/PDF"
      Response.BinaryWrite f.Data
    Case ".XLS"
      Response.AddHeader "Content-disposition", "inline; filename=" & _
           DocName
      Response.ContentType = "application/vnd.ms-excel"
      Response.BinaryWrite f.data
    Case ".CSV"
      Response.AddHeader "Content-disposition", "inline; filename=" & _
           DocName
      Response.ContentType = "text/comma-separated-values"
      Response.Write f.Text
    Case "HTML", ".HTM"
      f.GetArticle
%>

<!--#include virtual="/include/rpthdr.inc"-->
<% = nauthbeacon %>
<% Response.Write f.StoryText %>
<!--#include virtual="/include/rptftr.inc"-->
<%
    case else
      Response.ContentType = "application/octet-stream"
      Response.BinaryWrite f.Data
  end select  
%>
