<%@
  Page Language="C#"
  MasterPageFile="/master/page.master"
  CodeFile="download.cs"
  Inherits="DownloadPage"
  Title="Download and Print Reports"
 %>
<asp:Content runat="server" ContentPlaceholderId="page_css">
  <style>
i.fa { font-size: 1.8rem; }
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <h1> Drilling Rig Reports </h1>
          <h2>Today’s Reports</h2>
          <h3> <a href="<%= HtmlLink %>">Printer friendly HTML version</a> </h3>
          <p> A drilling rig report for browsing or printing. </p>
          <p> Includes:
            location, operator, contractor, rig number, area, well class,
            spud date, projected depth and rig status. </p>
          <h3> <a href="<%= MapLink %>">Mapping comma delimited ASCII file</a> </h3>
          <p> An electronic drilling rig report for mapping and database users. </p>
          <p> Includes: surface location (DLS or PNG plus latitude and longitude;
            bottom hole location when available), contractor,
            rig number, operator, rig status, spud date,
            projected depth, well type, objective, target formation,
            area name; Rig information: drilling capacity, draw works,
            contractor's address, phone and fax.</p>
          <h3> <a href="<%= FileLink %>">Legacy comma delimited ASCII file</a> </h3>
          <p> An electronic drilling rig report provided
            for compatibility with existing processes that depend on the older
            Rig Locator CSV file format. The newer mapping file is
            recommended otherwise. </p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 vert-offset-top-3">
          <div class="row">
            <div class="side-ad"> 
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
        <div class="col-md-8">
          <h2> Previous Reports </h2>
          <table class="nd-report" style="width: 100%">
            <colgroup>
            <col />
            <col style="width: 10%; text-align: center;" />
            <col style="width: 10%; text-align: center;" />
            <col style="width: 10%; text-align: center;" />
            </colgroup>
            <tr style="vertical-align: middle">
              <td>&nbsp;</td>
              <td style="text-align: center;">Print</td>
              <td style="text-align: center;">Mapping</td>
              <td style="text-align: center;">CSV</td>
            </tr>
            <asp:Repeater id="result" runat="server">
              <ItemTemplate runat="server">
                <tr style="vertical-align: middle">
                  <td> <%# ((DateTime)Eval("Updated")).ToString("dddd, MMM d, yyyy") %> </td>
                  <td style="text-align: center;"> <a href="/report/rig-<%# Eval("S") %>"> <i class="fa fa-print"></i> </a> </td>
                  <td style="text-align: center;"> <a href="/download-file/map-<%# Eval("S") %>.csv"> <i class="fa fa-file-image-o"></i> </a> </td>
                  <td style="text-align: center;"> <a href="/download-file/rig-<%# Eval("S") %>.csv"> <i class="fa fa-file-o"></i> </a> </td>
                </tr>
              </ItemTemplate>
            </asp:Repeater>
          </table>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
