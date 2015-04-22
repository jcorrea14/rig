<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_BROWSE", "Rig Locator"

  set client = Server.CreateObject("NAuth2.COMAuthenticationClient")
  set user = client.getUser(nauthreference)

  user.SetPreference "RIG_A", Request("sel")
  user.Save
  title = "Rig Locator Drilling Rig E-mail Alerts"
%><!--#include virtual="/include/nav.inc"-->
<% = nauthbeacon %>
<div class="heading-block">DRILLING RIG EMAIL ALERTS SERVICE</div>
<p>Thank you for using Nickle's Rig Locator Email Alerts Service. If you wish
to change or discontinue your selection at any time, return to the
<a href="alerts.asp">alerts page</a> and choose another area.</p>
<!--#include virtual="/include/footer.inc" -->
