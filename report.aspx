<%
  DocName = Replace (Request("report"), "\", "/")
  p = instrrev(DocName, "/")
  if p > 0 then
    DocName = mid(DocName, p + 1)
  end if

  Filename = Request("report")
  ext = UCase(right(Filename, 4))
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

<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Locator Dashboard"
    %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
<section class="mainContent">
      <div class="container content">
        <div class="row">
              <div class="col-lg-12 text-center">
                <% Response.Write f.StoryText %>
            </div>
          </div>
    </div>
  </section>
</asp:Content>  

<%
    case else
      Response.ContentType = "application/octet-stream"
      Response.BinaryWrite f.Data
  end select  
%>
