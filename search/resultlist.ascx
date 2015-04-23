<%@ Control
CodeFile="resultlist.ascx.cs"
Inherits="ResultList" %>
<table cellspacing=1 cellpadding=2 border=0 width="100%" class="nd-report">
  <tr valign="baseline">
    <th>Prov</th>
    <th>Location</th>
    <th>Area</th>
    <th>Contractor</th>
    <th>Rig</th>
    <th>Status</th>
    <th>Capac</th>
    <th>Operator</th>
    <th>UC</th>
    <th>Type</th>
    <th>Class</th>
    <th>Spud</th>
    <th>P Depth</th>
    <th>Camp</th>
  </tr>
  <asp:Repeater id="result" runat="server">
    <ItemTemplate runat="server">
      <tr valign="top">
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
        <td>
          <%# Eval("Rig") %>
        </td>
        <td>
          <%# Eval("Status") %>
        </td>
        <td>
          <%# Eval("Capacity") %>
        </td>
        <td>
          <%# Server.HtmlEncode(Eval("OperatorName").ToString()) %>
        </td>
        <td>
          <%# Eval("UC") %>
        </td>
        <td>
          <%# Eval("WellType") %>
        </td>
        <td>
          <%# Eval("Class") %>
        </td>
        <td>
          <%# Eval("Spud") %>
        </td>
        <td>
          <%# Eval("ProjDepth") %>
        </td>
        <td>
          <%# Eval("Camp") %>
        </td>











<%--


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
  --%>
      </tr>
    </ItemTemplate>
  </asp:Repeater>
</table>
