<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Contractor’s Rigs"
    AutoEventWireup="true"
    CodeFile="contractor.cs"
    Inherits="ContractorPage"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <h1>Title</h1>
        <table class="nd-report">
          <colgroup>
            <col style="width: 5%;" />
            <col style="width: 3%;" />
            <col style="width: 12%;" />
            <col style="width: 7%;" />
            <col style="width: 6%;" />
            <col style="width: 10%;" />
            <col style="width: 26%;" />
            <col style="width: 5%;" />
            <col style="width: 5%;" />
            <col style="width: 10%;" />
            <col style="width: 7%;" />
          </colgroup>
          <tr style="display: vertical-align: baseline;">
            <td>Rig</td>
            <td>Prov</td>
            <td>Location</td>
            <td>Area</td>
            <td>Status</td>
            <td>Cap</td>
            <td>Operator</td>
            <td>Type</td>
            <td>Class</td>
            <td>Spud</td>
            <td>P Depth</td>
          </tr>
          <asp:Repeater id="result" runat="server">
            <ItemTemplate runat="server">
              <tr style="vertical-align: baseline;">
                <td>
                  <%# Eval("Rig") %>
                </td>
                <td>
                  <%# Eval("Prov") %>
                </td>
                <td>
                  <%# Eval("Location") %>
                </td>
                <td>
                  <%# Server.HtmlEncode(Eval("Area").ToString()) %>
                </td>
                <td>
                  <%# Eval("Status") %>
                </td>
                <td style="text-align: right;">
                  <%# Eval("Capacity") %>
                </td>
                <td>
                  <%# Server.HtmlEncode(Eval("OperatorName").ToString()) %>
                </td>
                <td>
                  <%# Eval("WellType") %>
                </td>
                <td>
                  <%# Eval("Class") %>
                </td>
                <td>
                  <%# Eval("Spud") == System.DBNull.Value ? "" : ((DateTime)(Eval("Spud"))).ToString("MMM d, yyyy") %>
                </td>
                <td style="text-align: right;">
                  <%# Eval("ProjDepth") == System.DBNull.Value ?
                  "" :
                  Double.Parse(Eval("ProjDepth").ToString()).ToString("#,###.0;-#,###.0,#") %>
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
      </div>
    </div>
  </section>
</asp:Content>
