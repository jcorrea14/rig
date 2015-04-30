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
          <div class="col-md-9">
            <h1>
              Drilling Rig Reports
            </h1>
            <h2>Today’s Reports</h2>
            <ul>
              <li>
                <h3>
                  <a href="<%= HtmlLink %>">Printer friendly HTML version</a>
                </h3>
                <p>
                  A drilling rig report for browsing or printing.
                </p>
                <p>
                  Includes:
                  location, operator, contractor, rig number, area, well class,
                  spud date, projected depth and rig status.
                </p>
              </li>
              <li>
                <h3>
                  <a href="<%= MapLink %>">Mapping comma delimited ASCII file</a>
                </h3>
                <p>
                  An electronic drilling rig report for mapping and database users.
                </p>
                <p>
                  Includes: surface location (DLS or PNG plus latitude and longitude;
                  bottom hole location when available), contractor,
                  rig number, operator, rig status, spud date,
                  projected depth, well type, objective, target formation,
                  area name; Rig information: drilling capacity, draw works,
                  contractor's address, phone and fax. (Premium membership
                  required).
                </p>
              </li>
              <li>
                <h3>
                  <a href="<%= FileLink %>">Legacy comma delimited ASCII file</a>
                </h3>
                <p>
                  An electronic drilling rig report provided
                  for compatibility with existing processes that depend on the older
                  Rig Locator CSV file format. The newer mapping file is
                  recommended otherwise. (Premium membership required).
                </p>
              </li>
            </ul>
          </div>
          <div class="col-md-2 pull-right">
            <div class="row">
              <div class="skyscrapper-ad"><img src="img/skyscrapper-placeholder.jpg" alt="advertisment"/> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container content">
      <div class="row">
        <div class="col-md-4">
          <div class="row">
            <div class="side-ad">
              <div><img src="img/bigbox-ad.jpg" alt="advertisment"/> </div>
              <div><img src="img/buttonbox-ad.jpg" alt="advertisment"/> </div>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <h2>
            Previous Reports
          </h2>
          <table class="nd-report" style="width: 100%">
            <colgroup>
              <col />
              <col style="width: 10%; text-align: center;" />
              <col style="width: 10%; text-align: center;" />
              <col style="width: 10%; text-align: center;" />
            </colgroup>
            <asp:Repeater id="result" runat="server">
              <ItemTemplate runat="server">
                <tr style="vertical-align: middle">
                  <td>
                    <%# ((DateTime)Eval("Updated")).ToString("dddd, MMM d, yyyy") %>
                  </td>
                  <td>
                    <a href="/report/rig-<%# Eval("S") %>">
                      <i class="fa fa-print"></i>
                    </a>
                  </td>
                  <td>
                    <a href="/download-file/map-<%# Eval("S") %>.csv">
                      <i class="fa fa-file-image-o"></i>
                    </a>
                  </td>
                  <td>
                    <a href="/download-file/rig-<%# Eval("S") %>.csv">
                      <i class="fa fa-file-o"></i>
                    </a>
                  </td>
                </tr>
              </ItemTemplate>
            </asp:Repeater>
          </table>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
