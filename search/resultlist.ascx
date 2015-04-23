<%@ Control
CodeFile="resultlist.ascx.cs"
Inherits="ResultList" %>
<table class="nd-report">
  <tr style="display: table-row; vertical-align: baseline;">
    <td>Prov</td>
    <td>Location</td>
    <td>Area</td>
    <td>Contractor</td>
    <td>Rig</td>
    <td>Status</td>
    <td>Capac</td>
    <td>Operator</td>
    <td>UC</td>
    <td>Type</td>
    <td>Class</td>
    <td>Spud</td>
    <td>P Depth</td>
    <td>Camp</td>
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
          <%# ((bool)(Eval("UC"))) ? "*": ""  %>
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
        <td>
          <%# ((bool)(Eval("Camp"))) ? "*": ""  %>
        </td>
      </tr>
    </ItemTemplate>
  </asp:Repeater>
</table>
