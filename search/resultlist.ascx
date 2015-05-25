<%@ Control
CodeFile="resultlist.ascx.cs"
Inherits="ResultList" %>
<table class="nd-report">
  <colgroup>
    <col style="width: 3%;" />
    <col style="width: 12%;" />
    <col style="width: 7%;" />
    <col style="width: 22%;" />
    <col style="width: 5%;" />
    <col style="width: 6%;" />
    <col style="width: 6%;" />
    <col style="width: 15%;" />
    <col style="width: 5%;" />
    <col style="width: 5%;" />
    <col style="width: 7%;" />
    <col style="width: 7%;" />
  </colgroup>

  <tr style="display: vertical-align: baseline;">
    <td class="header-left">Prov</td>
    <td class="header-left">Location</td>
    <td class="header-left">Area</td>
    <td class="header-left">Contractor</td>
    <td class="header-right">Rig</td>
    <td class="header-left">Status</td>
    <td class="header-right">Capacity</td>
    <td class="header-left">Operator</td>
    <td class="header-left">Type</td>
    <td class="header-left">Class</td>
    <td class="header-left">Spud</td>
    <td class="header-right">P Depth</td>
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
          <%# Server.HtmlEncode(Eval("Area").ToString()) %>
        </td>
        <td>
          <%# Server.HtmlEncode(Eval("ContractorName").ToString()) %>
        </td>
        <td style="text-align: right;">
          <%# Eval("Rig") %>
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
