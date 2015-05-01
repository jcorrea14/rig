<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Operator’s Rigs"
    AutoEventWireup="true"
    CodeFile="operator.cs"
    Inherits="OperatorPage"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <h1><% = OperatorName %></h1>
        <table class="nd-report">
          <colgroup>
            <col style="width: 3%;" />
            <col style="width: 12%;" />
            <col style="width: 5%;" />
            <col style="width: 7%;" />
            <col style="width: 5%;" />
            <col style="width: 10%;" />
            <col style="width: 27%;" />
            <col style="width: 5%;" />
            <col style="width: 5%;" />
            <col style="width: 5%;" />
            <col style="width: 10%;" />
            <col style="width: 7%;" />
          </colgroup>
          <tr style="display: vertical-align: baseline;">
            <td>Prov</td>
            <td>Location</td>
            <td>PSAC</td>
            <td>Area</td>
            <td>Status</td>
            <td style="text-align: right">Cap</td>
            <td>Contractor</td>
            <td>Rig</td>
            <td>Type</td>
            <td>Class</td>
            <td>Spud</td>
            <td style="text-align: right;">P Depth</td>
          </tr>
          <asp:Repeater id="result" runat="server">
            <ItemTemplate runat="server">
              <tr style="vertical-align: baseline;">
                <td>
                  <%# Eval("Prov") %>
                </td>
                <td>
                  <%# Eval("Location") %>
                </td>
                <td>
                  <%# Eval("PSACArea") %>
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
                  <%# Server.HtmlEncode(Eval("ContractorName").ToString()) %>
                </td>
                <td>
                  <%# Eval("Rig") %>
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
