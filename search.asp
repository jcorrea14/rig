<%
  select case Request("searchtype")
    case "op"
      Response.Redirect "searchop.asp"
    case "con"
      Response.Redirect "searchcon.asp"
    case else
      Response.Redirect "searchloc.asp"
  end select
%>