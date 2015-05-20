<%@ Control
CodeFile="resultlist.ascx.cs"
Inherits="ResultList" %>
<table class="nd-report">
  <tr valign="baseline">
    <td class="header-left">Well&nbsp;Name</td>
    <td  class="header-left">Prov</td>
    <td  class="header-left">Lic</td>
    <td class="header-left">Issued</td>
    <td class="header-left">Operator</td>
    <td  class="header-left">Class</td>
    <td class="header-left" >Obj</td>
    <td  class="header-left">Dir</td>
    <td  class="header-left">P&nbsp;Zone</td>
    <td  class="header-right">P&nbsp;Depth</td>
  </tr>
  <tr valign="baseline">
    <td align="left">Location</td>
    <td></td>
    <td></td>
    <td></td>
    <td align="left">UWI</td>
  </tr>
  <asp:Repeater id="result" runat="server">
    <ItemTemplate runat="server">
      <tr valign="top">
        <td>
          <%# Server.HtmlEncode(Eval("WellName").ToString()) %><br />
          <%# Eval("LocationLine") %>
          <%# Eval("LocationLine").ToString() == Eval("Surface").ToString() ? "" :
          "<br />SURFACE: " + Eval("Surface") %>
        </td>
        <td>
          <%# Eval("Province") %>
        </td>
        <td>
          <%# Eval("LicenceId") %>
        </td>
        <td>
          <%# ((DateTime)Eval("LicenceDate")).ToString("MMM d, yyyy") %>
        </td>
        <td>
          <%# Server.HtmlEncode(Eval("Operator").ToString()) %><br />
          <%# Server.HtmlEncode(Eval("UWI").ToString()) %>
        </td>
        <td>
          <%# Eval("WellClass") %>
        </td>
        <td>
          <%# Eval("Objective") %>
        </td>
        <td>
          <%# Eval("Type") %>
        </td>
        <td>
          <%# Server.HtmlEncode(Eval("ProjectedZone").ToString()) %>
        </td>
        <td align="right">
          <%# Double.Parse(Eval("ProjectedDepth").ToString()).ToString("#,###.0;-#,###.0,#") %>
        </td>
      </tr>
    </ItemTemplate>
  </asp:Repeater>
</table>
