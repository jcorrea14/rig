<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_BROWSE", "Rig Locator"

  set client = Server.CreateObject("NAuth2.COMAuthenticationClient")
  set user = client.getUser(nauthreference)

  title = "Rig Locator Drilling Rig E-mail Alerts"
%><!--#include virtual="/include/nav.inc"-->
<% = nauthbeacon %>
<div class="heading-block">DRILLING RIG E-MAIL ALERTS SERVICE</div>
<h1>Please confirm your e-mail alert selection.</h1>
<% if request("sel") = "NIL" then %>
<p>You have chosen to remove all previous e-mail alerts requested for
<strong><% = user.Email %></strong>.</p>
<% else %>
<p>You have chosen to be notified about rig activity and new well licences
occurring in the following area:</p>
<h4><% response.write Request("sel") & " "
  select case Request("sel")
    case "A1"
      response.write "ALBERTA (TWP 1 - 32, R1W4 - 5TH MERIDIAN)"
    case "A2"
      response.write "ALBERTA (TWP 33 - 64, R1W4 - 5TH MERIDIAN)"
    case "A3"
      response.write "ALBERTA (TWP 65 - NWT BORDER, R1W4 - 5TH MERIDIAN)"
    case "A4"
      response.write "ALBERTA (TWP 1 - 32, R1W5 - BC BORDER)"
    case "A5"
      response.write "ALBERTA (TWP 33 - 64, R1W5 - BC BORDER)"
    case "A6"
      response.write "ALBERTA (TWP 65 - 79, R1W5 - BC BORDER)"
    case "A7A"
      response.write "ALBERTA (TWP 80 - 100, R1W5 - BC BORDER)"
    case "A7B"
      response.write "ALBERTA (TWP 101 - NWT BORDER, RGE 18W5 - BC BORDER)"
    case "A7C"
      response.write "ALBERTA (TWP 101 - NWT BORDER, R1W5 - R17W5)"
    case "B1"
      response.write "BRITISH COLUMBIA (SOUTH NTS MAP LINE 94-I)"
    case "B2"
      response.write "BRITISH COLUMBIA (NORTH NTS MAP LINE 94-H)"
    case "M1"
      response.write "ALL MANITOBA"
    case "S1"
      response.write "SASKATCHEWAN (TWP 38 - 53, R12W3 - ALBERTA BORDER)"
    case "S2"
      response.write "SASKATCHEWAN (TWP 23 - 37, R12W3 - ALBERTA BORDER)"
    case "S3"
      response.write "SASKATCHEWAN (TWP 1 - 22, R1W3 - ALBERTA BORDER)"
    case "S4"
      response.write "SASKATCHEWAN " & _
             "(TWP 1 - 22, MANITOBA BORDER - 3RD MERIDIAN)"
    case "S5"
      response.write "SASKATCHEWAN (NOT NOTED)"
  end select
%></h4>
<p>This selection will replace all previously requested e-mail alerts.
Notifications will be sent to your e-mail address at <strong><%
  = user.Email %></strong>.</p>
<% end if %>
<p><a href="submitalert.asp?sel=<% = request("sel") %>"><img
src="/graphics/confirm.gif" alt="[CONFIRM]" border=0></a>&nbsp;
<a href="alerts.asp"><img src="/graphics/cancel.gif" alt="[CANCEL]"
border=0></a></p>
<!--#include virtual="/include/footer.inc" -->
