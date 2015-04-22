<%
  dim rs
  dim link
  dim source

  function digit2(s)
    if len(cstr(s)) = 1 then
      digit2 = "0" & cstr(s)
    else
      digit2 = cstr(s)
    end if
  end function

  function fmtDate(d)
    fmtDate = right(cstr(year(d)), 2) & _
    digit2(month(d)) & _
    digit2(day(d))
  end function

  set source = createObject("ADODB.Connection")
  source.ConnectionString = application("RigConnectionString")
  source.Open
  
  set rs = createObject("ADODB.Recordset")
  rs.Open "select distinct top 20 Updated from webRig2 " & _
          "where Rigtype = 'D' order by Updated desc", source

  link = "/report.asp?report=rig%2Frig%2D" & _
         fmtDate(rs(0)) & "%2E"

  maplink = "/report.asp?report=rig%2Fmap%2D" & _
         fmtDate(rs(0)) & "%2Ecsv"

%><!--#include virtual="/include/nav.inc" -->
    <h1>
      Drilling Rig Reports
    </h1>
    <div class="heading-block">TODAY'S REPORTS</div>
    <div style="padding: 0px 4px;">
      <div class="toc">
        <a href="<% response.write link %>html"><img src="/graphics/printer.gif" alt="[HTML]"
                                                     style="border: 0px; vertical-align: middle;" /></a>
        <a href="<% response.write link %>html">Printer friendly HTML version</a>
      </div>
      <div class="sub">
        A drilling rig report for browsing or printing.
      </div>
      <div class="sub">
        Includes:
        location, operator, contractor, rig number, area, well class,
        spud date, projected depth and rig status.
      </div>
      <div class="toc" style="margin-top: 4px; border-top: 2px solid black;">
        <a href="<% response.write maplink %>"><img src="/graphics/map.gif" alt="[Mapping]"
                                                     style="border: 0px; vertical-align: middle;" /></a>
        <a href="<%  response.write maplink %>">Mapping comma delimited ASCII file</a>
        <img src="/graphics/new.gif" alt="NEW!" />
        (premium subscription required)
      </div>
      <div class="sub">
        An electronic drilling rig report for mapping and database users.
      </div>
      <div class="sub">
        Includes: surface location (DLS or PNG plus latitude and longitude;
        bottom hole location when available), contractor,
        rig number, operator, rig status, spud date,
        projected depth, well type, objective, target formation,
        area name; Rig information: drilling capacity, draw works,
        contractor's address, phone and fax.
      </div>
      <div class="toc" style="margin-top: 4px; border-top: 2px solid black;">
        <a href="<% response.write link %>csv"><img src="/graphics/data.gif" alt="[Legacy]"
                                                     style="border: 0px; vertical-align: middle;" /></a>
        <a href="<%  response.write link %>csv">Legacy comma delimited ASCII file</a>
        (premium subscription required)
      </div>
      <div class="sub">
        An electronic drilling rig report provided
        for compatibility with existing processes that depend on the older
        Rig Locator CSV file format.
        The newer mapping file is recommended otherwise.
      </div>
    </div>
    <div class="heading-block" style="margin-top: 12px;">PREVIOUS REPORTS</div>
    <table cellspacing="4" cellpadding="0" border="0" width="100%">
      <%
        while not rs.eof
          link = "report.asp?report=rig%2Frig%2D" & _
                 fmtDate(rs(0)) & "%2E"
          maplink = "report.asp?report=rig%2Fmap%2D" & _
                 fmtDate(rs(0)) & "%2Ecsv"

      %>
      <tr>
        <td>
          <div class="toc">
            <a href="<% response.write link %>html" /><%
              response.write formatDateTime(rs(0), vbLongDate) %></a>
          </div>
        </td>
        <td align="right" width="32">
          <a href="<% response.write link %>html"><img
             src="/graphics/printer.gif" alt="[HTML]" border="0"></a>
        </td>
        <td align="right" width="32">
          <a href="<% response.write maplink %>"><img
             src="/graphics/map.gif"
             alt="[Mapping]" border="0" /></a>
        </td>
        <td align="right" width="32">
          <a href="<% response.write link %>csv"><img
             src="/graphics/data.gif"
             alt="[Legacy]" border="0" /></a>
        </td>
      </tr>
      <tr>
        <td height="1" bgcolor="#CCCCCC" colspan="4"><img
            src="/graphics/tr.gif" alt=""
            width="1" height="1" border="0" /></td>
      </tr>
      <%
          rs.movenext
        wend
      %></table>
<!--#include virtual="/include/footer.inc" -->
