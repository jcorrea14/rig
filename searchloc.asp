<%
  title = "Rig Locator Drilling Rig Search"
%><!--#include virtual="/include/nav.inc"-->
<h1>Rig Locator Drilling Rig Search</h1>
<form method=POST action="results.asp" name="loc">
<table cellspacing=10 cellpadding=0 border=0 width="100%">
<tr valign="top">
<td width=112><img src="/graphics/location1.gif" width=112 height=28
alt="*By Location*" border=0></td>
<td width=105><a href="searchcon.asp"><img src="/graphics/contractor0.gif"
width=105 height=20 alt="By Contractor" border=0></a></td>
<td width=105><a href="searchop.asp"><img src="/graphics/operator0.gif"
width=105 height=20 alt="By Operator" border=0></a></td>
<td align="right"><input type="reset" value="CLEAR"></td>
</tr>
</table>
<div class="heading-block">SEARCH BY SPECIFIC LOCATION</div>
<table cellspacing=0 cellpadding=0 border=0 width="100%">
<tr valign="top">
  <td align="center"><div class="toc">Province/Region</div></td>
  <td rowspan=3 width=1 bgcolor="black"><img src="/graphics/tr.gif"></td>
  <td align="center" width="36%" ><div class="toc" >DLS</div></td>
  <td rowspan=3 width=1 bgcolor="black"><img src="/graphics/tr.gif"></td>
  <td align="center" width="36%"><div class="toc">NTS</div></td>
</tr><tr valign="top">


  <td align="center">
    <div style="margin-top: 4px;">
    <select name="province" class="sub" size=7>
      <option value="" selected>&lt;ALL&gt;
      <option value="AB">Alberta
      <option value="SK">Saskatchewan
      <option value="BC">British Columbia
      <option value="MB">Manitoba
      <option value="EC">Eastern Canada
      <option value="NC">Northern Canada
    </select></div><br>
    <div style="margin-left:40px;text-align:left;"> 
       <input type="radio" name="location" value="surface" checked ID="Radio1">Surface Location<br>
        <input type="radio" name="location" value="bottom" ID="Radio2">Bottom Hole<br> 
   </div>    
  </td>
  <td><table cellspacing=0 cellpadding=3 border=0 align="center">
  
  <tr><td id="tp" name="tp" colspan=4><div class="subbold">Township</div></td>
  </tr><tr>
    <td><div class="sub">From:</div></td>
    <td><select name="fromTownship" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          <option>17
          <option>18
          <option>19
          <option>20
          <option>21
          <option>22
          <option>23
          <option>24
          <option>25
          <option>26
          <option>27
          <option>28
          <option>29
          <option>30
          <option>31
          <option>32
          <option>33
          <option>34
          <option>35
          <option>36
          <option>37
          <option>38
          <option>39
          <option>40
          <option>41
          <option>42
          <option>43
          <option>44
          <option>45
          <option>46
          <option>47
          <option>48
          <option>49
          <option>50
          <option>51
          <option>52
          <option>53
          <option>54
          <option>55
          <option>56
          <option>57
          <option>58
          <option>59
          <option>60
          <option>61
          <option>62
          <option>63
          <option>64
          <option>65
          <option>66
          <option>67
          <option>68
          <option>69
          <option>70
          <option>71
          <option>72
          <option>73
          <option>74
          <option>75
          <option>76
          <option>77
          <option>78
          <option>79
          <option>80
          <option>81
          <option>82
          <option>83
          <option>84
          <option>85
          <option>86
          <option>87
          <option>88
          <option>89
          <option>90
          <option>91
          <option>92
          <option>93
          <option>94
          <option>95
          <option>96
          <option>97
          <option>98
          <option>99
          <option>100
          <option>101
          <option>102
          <option>103
          <option>104
          <option>105
          <option>106
          <option>107
          <option>108
          <option>109
          <option>110
          <option>111
          <option>112
          <option>113
          <option>114
          <option>115
          <option>116
          <option>117
          <option>118
          <option>119
          <option>120
          <option>121
          <option>122
          <option>123
          <option>124
          <option>125
          <option>126
          </select></td>
  <td><div class="sub">To:</div></td>
  <td><select name="toTownship" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          <option>17
          <option>18
          <option>19
          <option>20
          <option>21
          <option>22
          <option>23
          <option>24
          <option>25
          <option>26
          <option>27
          <option>28
          <option>29
          <option>30
          <option>31
          <option>32
          <option>33
          <option>34
          <option>35
          <option>36
          <option>37
          <option>38
          <option>39
          <option>40
          <option>41
          <option>42
          <option>43
          <option>44
          <option>45
          <option>46
          <option>47
          <option>48
          <option>49
          <option>50
          <option>51
          <option>52
          <option>53
          <option>54
          <option>55
          <option>56
          <option>57
          <option>58
          <option>59
          <option>60
          <option>61
          <option>62
          <option>63
          <option>64
          <option>65
          <option>66
          <option>67
          <option>68
          <option>69
          <option>70
          <option>71
          <option>72
          <option>73
          <option>74
          <option>75
          <option>76
          <option>77
          <option>78
          <option>79
          <option>80
          <option>81
          <option>82
          <option>83
          <option>84
          <option>85
          <option>86
          <option>87
          <option>88
          <option>89
          <option>90
          <option>91
          <option>92
          <option>93
          <option>94
          <option>95
          <option>96
          <option>97
          <option>98
          <option>99
          <option>100
          <option>101
          <option>102
          <option>103
          <option>104
          <option>105
          <option>106
          <option>107
          <option>108
          <option>109
          <option>110
          <option>111
          <option>112
          <option>113
          <option>114
          <option>115
          <option>116
          <option>117
          <option>118
          <option>119
          <option>120
          <option>121
          <option>122
          <option>123
          <option>124
          <option>125
          <option>126
          </select></td>
</tr><tr>
  <td colspan=4><div class="subbold">Range</div></td>
</tr><tr>
  <td><div class="sub">From:</div></td>
  <td><select name="fromRange" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          <option>17
          <option>18
          <option>19
          <option>20
          <option>21
          <option>22
          <option>23
          <option>24
          <option>25
          <option>26
          <option>27
          <option>28
          <option>29
          <option>30
          <option>31
          <option>32
          <option>33
          <option>34
          </select></td>
  <td><div class="sub">To:</div></td>
  <td><select name="toRange" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          <option>17
          <option>18
          <option>19
          <option>20
          <option>21
          <option>22
          <option>23
          <option>24
          <option>25
          <option>26
          <option>27
          <option>28
          <option>29
          <option>30
          <option>31
          <option>32
          <option>33
          <option>34
          </select></td>
</tr><tr>
  <td colspan=4><div class="subbold">Meridian</div></td>
</tr><tr>
  <td><div class="sub">From:</div></td>
  <td><select name="fromMeridian" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          </select></td>
  <td><div class="sub">To:</div></td>
  <td><select name="toMeridian" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          </select></td>
</tr></table>
</td>
<td align="center">
  <table cellspacing=0 cellpadding=3 border=0 align="center">
  <tr>
    <td colspan=4><div class="subbold">Map Unit</div></td>
  </tr><tr>
      <td><div class="sub">From:</div></td>
      <td><select name="fromMapUnit" class="sub">
          <option>
          <option>82
          <option>92
          <option>93
          <option>94
          </select></td>
      <td><div class="sub">To:</div></td>
      <td><select name="toMapUnit" class="sub">
          <option>
          <option>82
          <option>92
          <option>93
          <option>94
          </select></td>
  </tr><tr>
      <td colspan=4><div class="subbold">Map Unit Sub</div></td>
  </tr><tr>
      <td><div class="sub">From:</div></td>
      <td><select name="fromMapUnitSub" class="sub">
          <option>
          <option>A
          <option>B
          <option>C
          <option>D
          <option>E
          <option>F
          <option>G
          <option>H
          <option>I
          <option>J
          <option>K
          <option>L
          <option>M
          <option>N
          <option>O
          <option>P
          </select></td>
      <td><div class="sub">To:</div></td>
      <td><select name="toMapUnitSub" class="sub">
          <option>
          <option>A
          <option>B
          <option>C
          <option>D
          <option>E
          <option>F
          <option>G
          <option>H
          <option>I
          <option>J
          <option>K
          <option>L
          <option>M
          <option>N
          <option>O
          <option>P
          </select></td>
  </tr><tr>
  <td colspan=4><div class="subbold">Map Sheet</div></td>
  </tr><tr>
      <td><div class="sub">From:</div></td>
      <td><select name="fromMapSheet" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          </select></td>
      <td><div class="sub">To:</div></td>
      <td><select name="toMapSheet" class="sub">
          <option>
          <option>1
          <option>2
          <option>3
          <option>4
          <option>5
          <option>6
          <option>7
          <option>8
          <option>9
          <option>10
          <option>11
          <option>12
          <option>13
          <option>14
          <option>15
          <option>16
          </select></td></tr>
    </table>
</td></tr>
<tr>
  <td align="center">
    <input type="image" src="/graphics/search.gif"
           name="PR" alt="Search" border=0 vspace=10></td>
  <td align="center">
    <input type="image" src="/graphics/search.gif"
               name="DLS" alt="Search" border=0 vspace=10></td>
  <td align="center">
    <input type="image" name="NTS" src="/graphics/search.gif"
               border=0 alt="Search" vspace=10></td>
</tr>
</table>
<div class="heading-block" style="margin-top: 1em;">SELECT A SORT OPTION</div>
<table cellspacing=0 cellpadding=0 border=0 width="100%"
style="margin-left: 6px;">
<tr valign="top">
<td class="sub" width="33%">
<input type="radio" name="sort" value="" checked> Location<br>
<input type="radio" name="sort" value="Operator"> Operator<br>
<input type="radio" name="sort" value="Rig"> Contractor and Rig
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
<option value="DRILL">DRILL - Drilling
<option value="MIR">MIR - Moving in rig
<option value="RIGUP">RIGUP - Rigging up (setting up rig)
<option value="inactive">DOWN - Not active
</select>
</div><br>
</form>
<!--#include virtual="/include/footer.inc"-->
</html>



