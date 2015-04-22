<!--#include virtual="/common/nauth/authenticate.asp"--><%
  Authenticate "RIG_ANY", "Rig Locator"

  set client = Server.CreateObject("NAuth2.COMAuthenticationClient")
  set user = client.getUser(nauthreference)

  if not user.CanAccess("RIG_BROWSE") then
    response.redirect "drilling.asp"
  end if
  dim strWhere, strSelect
  function formatvalue(field)
    if isnull(field) then
      formatvalue = "<br>"
    else
      select case field.name
        case "Rig", "Capacity", "ProjDepth"
          formatvalue = "<div align=""right"">" & field & "</div>"
        case "Camp"
          if field.value then
            formatvalue = "<div align=""center"">*</div>"
          else
            formatvalue = "<br>"
          end if
        case "UC"
          if field.value then
            formatvalue = "UC"
          else
            formatvalue = "<br>"
          end if
        case "Spud"
            
            formatvalue = Day(Field) & "/" & _
                          left(monthname(month(field)), 3) & "/" & _
                          right(Year(Field), 2)
        case else
          formatvalue = field
      end select
    end if
  end function

  function SQLString(S)
    SQLString = "'" & replace (S, "'", "''") & "'"
  end function

  sub addClause(clause)
    strWhere = strWhere & " and " & clause
  end sub

  sub selectProvince
    if Request("province") <> "" then
      select case Request("province")
        case "EC"
          addClause "Prov in ('ON', 'QC', 'NB', 'NS', 'PE', 'NL')"
        case "NC"
          addClause "Prov in ('YT', 'NT', 'NU')"
        case else
          addClause "Prov = '" & Request("province") & "'"
      end select
    end if
  end sub
  
select case Request("location")
 case "surface"
  strSelect = "select Prov, Location, Area, ContractorName, " & _
              "Rig, Status, Capacity, OperatorName, UC, WellType, " & _
              "Class, Spud, ProjDepth, Camp " & _
              "from vwWebRig2 where RigType = 'D'"
 case "bottom"
  strSelect = "select Prov, UniqueWellIdentifier as Location, Area, ContractorName, " & _
              "Rig, Status, Capacity, OperatorName, UC, WellType, " & _
              "Class, Spud, ProjDepth, Camp " & _
              "from vwWebRig2 where RigType = 'D'"
 case else
  strSelect = "select Prov, Location, Area, ContractorName, " & _
              "Rig, Status, Capacity, OperatorName, UC, WellType, " & _
              "Class, Spud, ProjDepth, Camp " & _
              "from vwWebRig2 where RigType = 'D'"
 end select
 
 
  select case Request("status")
    case "active"
      addClause "Status in ('DRILL', 'MIR', 'RIGUP')"
    case "inactive"
      addClause "Status in ('DOWN', 'UCONS', 'NREPO')"
    case "all", ""
    case else
      addClause "Status = '" & Request("status") & "'"
  end select

  if Request("PR.x") <> "" then
    selectProvince
  elseif Request("CON.x") <> "" then
    selectProvince
    if request("contractor") <> "" then
      addClause " ContractorName = " & SQLString(Request("contractor"))
    end if
  elseif Request("OP.x") <> "" then
    selectProvince
    if request("operator") <> "" then
      addClause " OperatorName = " & SQLString(Request("operator"))
    end if
  elseif Request("DLS.x") <> "" then
    if Request("fromTownship") <> "" then
      if Request("toTownship") <> "" then
        if Request("fromTownship") = Request("toTownship") then
          addClause " Township = " & Request("fromTownship")
        elseif cint(Request("fromTownship")) > _
               cint(Request("toTownship")) then
          addClause " Township between " & Request("toTownship") & _
               " and " & Request("fromTownship")
        else
          addClause " Township between " & Request("fromTownship") & _
               " and " & Request("toTownship")
        end if
      else
        addClause " Township = " & Request("fromTownship")
      end if
    else
      if Request("toTownship") <> "" then
        addClause " Township = " & Request("toTownship")
      end if
    end if
    if Request("fromRange") <> "" then
      if Request("toRange") <> "" then
        if Request("fromRange") = Request("toRange") then
          addClause " Range = " & Request("fromRange")
        elseif cint(Request("fromRange")) > _
               cint(Request("toRange")) then
          addClause " Range between " & Request("toRange") & _
               " and " & Request("fromRange")
        else
          addClause " Range between " & Request("fromRange") & _
               " and " & Request("toRange")
        end if
      else
        addClause " Range = " & Request("fromRange")
      end if
    else
      if Request("toRange") <> "" then
        addClause " Range = " & Request("toRange")
      end if
    end if
     if Request("fromMeridian") <> "" then
      if Request("toMeridian") <> "" then
        if Request("fromMeridian") = Request("toMeridian") then
          addClause " Meridian = " & Request("fromMeridian")
        elseif cint(Request("fromMeridian")) > _
               cint(Request("toMeridian")) then
          addClause " Meridian between " & Request("toMeridian") & _
               " and " & Request("fromMeridian")
        else
          addClause " Meridian between " & Request("fromMeridian") & _
               " and " & Request("toMeridian")
        end if
      else
        addClause " Meridian = " & Request("fromMeridian")
      end if
    else
      if Request("toMeridian") <> "" then
        addClause " Meridian = " & Request("toMeridian")
      end if
    end if
  else
    if Request("fromMapUnit") <> "" then
      if Request("toMapUnit") <> "" then
        if Request("fromMapUnit") = Request("toMapUnit") then
          addClause " MapUnit = " & Request("fromMapUnit")
        elseif cint(Request("fromMapUnit")) > _
               cint(Request("toMapUnit")) then
          addClause " MapUnit between " & Request("toMapUnit") & _
               " and " & Request("fromMapUnit")
        else
          addClause " MapUnit between " & Request("fromMapUnit") & _
               " and " & Request("toMapUnit")
        end if
      else
        addClause " MapUnit = " & Request("fromMapUnit")
      end if
    else
      if Request("toMapUnit") <> "" then
        addClause " MapUnit = " & Request("toMapUnit")
      end if
    end if
    if Request("fromMapUnitSub") <> "" then
      if Request("toMapUnitSub") <> "" then
        if Request("fromMapUnitSub") = Request("toMapUnitSub") then
          addClause " MapUnitSub = '" & Request("fromMapUnitSub") & "'"
        elseif Request("fromMapUnitSub") > Request("toMapUnitSub") then
          addClause " MapUnitSub between '" & Request("toMapUnitSub") & _
               "' and '" & Request("fromMapUnitSub") & "'"
        else
          addClause " MapUnitSub between '" & Request("fromMapUnitSub") & _
               "' and '" & Request("toMapUnitSub") & "'"
        end if
      else
        addClause " MapUnitSub = '" & Request("fromMapUnitSub") & "'"
      end if
    else
      if Request("toMapUnitSub") <> "" then
        addClause " MapUnitSub = '" & Request("toMapUnitSub") & "'"
      end if
    end if

    if Request("fromMapSheet") <> "" then
      if Request("toMapSheet") <> "" then
        if Request("fromMapSheet") = Request("toMapSheet") then
          addClause " MapSheet = " & Request("fromMapSheet")
        elseif cint(Request("fromMapSheet")) > _
               cint(Request("toMapSheet")) then
          addClause " MapSheet between " & Request("toMapSheet") & _
               " and " & Request("fromMapSheet")
        else
          addClause " MapSheet between " & Request("fromMapSheet") & _
               " and " & Request("toMapSheet")
        end if
      else
        addClause " MapSheet = " & Request("fromMapSheet")
      end if
    else
      if Request("toMapSheet") <> "" then
        addClause " MapSheet = " & Request("toMapSheet")
      end if
    end if
  end if

  strSort = request("sort")
  if strSort = "Rig" then
    strSort = "Contractor, Rig, "
  elseif strSort <> "" then
    strSort = "case when " & strSort & " is null then 1 else 0 end, " & _
              strSort & ", "
  end if

  set conn = Server.createObject("ADODB.Connection")
  set rs = Server.createObject("ADODB.Recordset")
  conn.Provider = "SQLOLEDB"

  conn.ConnectionString = application("RigConnectionString")

  conn.Open

  SQL =  strSelect & strWhere & _
         " order by " & strSort & " sort"
    
  rs.open SQL, conn, adOpenStatic

%><!--#include virtual="/include/rpthdr.inc" -->
<% = nauthbeacon %>
<h1>Drilling Rig Search Results</h1>
<div class="sub"><% = mid(strWhere, 6) %></div>
<table cellspacing=1 cellpadding=2 border=0 width="100%" class="report">
<tr valign="top">
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
</tr><%
  while not rs.eof
%>
<tr valign="top" >
  <td><% response.write formatValue(rs("Prov")) %></td>
  <td><% response.write formatValue(rs("Location")) %></td>
  <td><% response.write formatValue(rs("Area")) %></td>
  <td><% response.write formatValue(rs("ContractorName")) %></td>
  <td><% response.write formatValue(rs("Rig")) %></td>
  <td><% response.write formatValue(rs("Status")) %></td>
  <td><% response.write formatValue(rs("Capacity")) %></td>
  <td><% response.write formatValue(rs("OperatorName")) %></td>
  <td><% response.write formatValue(rs("UC")) %></td>
  <td><% response.write formatValue(rs("WellType")) %></td>
  <td><% response.write formatValue(rs("Class")) %></td>
  <td><% response.write formatValue(rs("Spud")) %></td>
  <td><% response.write formatValue(rs("ProjDepth")) %></td>
  <td><% response.write formatValue(rs("Camp")) %></td>
</tr><%
    rs.moveNext
  wend
%>
</table>

<!--#include virtual="/include/rptftr.inc"-->


