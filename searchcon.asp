<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_ANY", "Rig Locator"

  set client = Server.CreateObject("NAuth2.COMAuthenticationClient")
  set user = client.getUser(nauthreference)

  if not user.CanAccess("RIG_BROWSE") then
    response.redirect "drilling.asp"
  end if

  title = "Rig Locator Drilling Rig Search"
%><!--#include virtual="/include/nav.inc"-->
<% = nauthbeacon %>
<h1>Rig Locator Drilling Rig Search</h1>
<form method=get action="results.asp" name="loc">
<table cellspacing=10 cellpadding=0 border=0 width="100%">
<tr valign="top">
<td width=105><a href="searchloc.asp"><img
src="/graphics/location0.gif" width=105 height=20 alt="By Location"
border=0></a></td>
<td width=112><img src="/graphics/contractor1.gif" width=112
height=28 alt="*By Contractor*" border=0></td>
<td width=105><a href="searchop.asp"><img src="/graphics/operator0.gif"
width=105 height=20 alt="By Operator" border=0></a></td>
<td align="right"><input type="reset" value="CLEAR"></tr>
</table>
<div class="heading-block">SEARCH CRITERIA</div>
<table cellspacing=0 cellpadding=2 border=0 style="margin-left: 6px;">
<tr valign="top">
  <td align><div class="toc">Contractor</div></td>
  <td align><div class="toc">Province/Region</div></td>
</tr><tr valign="top">
  <td align="center">
    <select name="contractor" class="sub" size=7>
      <option value="" selected>&lt;ALL CONTRACTORS&gt;
<% 
  set conn = Server.createObject("ADODB.Connection")
  set rs = Server.createObject("ADODB.Recordset")
  conn.Provider = "SQLOLEDB"
  conn.ConnectionString = application("RigConnectionString")
  conn.Open

  SQL =  "select distinct ContractorName from vwWebRig2 " & _
         "where RigType = 'D' order by ContractorName"
  rs.open SQL, conn, adOpenStatic
  while not rs.eof
    response.write "      <option>" & rs(0) & chr(13) & chr(10)
    rs.moveNext
  wend
  rs.close
%>    </select></div></td>
  <td align="center">
    <select name="province" class="sub" size=7>
      <option value="" selected>&lt;ALL&gt;
      <option value="AB">Alberta
      <option value="SK">Saskatchewan
      <option value="BC">British Columbia
      <option value="MB">Manitoba
      <option value="EC">Eastern Canada
      <option value="NC">Northern Canada
    </select></div>
  </td>
</tr>
</table>
<div style="margin-left: 8px; margin-top: 4px;"><input type="image"
           src="/graphics/search.gif" name="CON" alt="Search" border=0>
</div>
<div class="heading-block" style="margin-top: 1em;">SELECT A SORT OPTION</div>
<table cellspacing=0 cellpadding=0 border=0 width="100%"
style="margin-left: 6px;">
<tr valign="top">
<td class="sub" width="33%">
<input type="radio" name="sort" value=""> Location<br>
<input type="radio" name="sort" value="Operator"> Operator<br>
<input type="radio" name="sort" value="Rig" checked> Contractor and Rig
</td>
<td class="sub" width="33%">
<input type="radio" name="sort" value="Area"> Area Name<br>
<input type="radio" name="sort" value="Spud"> Spud Date<br>
<input type="radio" name="sort" value="Class"> Well Class
</td>
<td class="sub" width="34%">
<input type="radio" name="sort" value="Status"> Rig Status
</td></tr>
</table>
<div class="heading-block" style="margin-top: 1em;">SELECT RIG STATUS</div>
<div style="margin-left: 6px;">
<select name="status" size=6 class="sub">
<option value="all" selected>&lt;ALL&gt;
<option value="active">ALL ACTIVE
<option value="DRILL">DIR - Drilling
<option value="MIR">MIR - Moving in rig
<option value="RIGUP">RIGUP - Rigging up (setting up rig)
<option value="inactive">DOWN - Not active
</select>
</div><br>
</form>
<!--#include virtual="/include/footer.inc"-->
