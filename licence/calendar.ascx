<%@ Control Language="C#" %>
<script runat="server">
  public String UrlFormat {
    get {
      String s = (String)ViewState["urlformat"];
      return s == null ? "" : s;
    }
    set { ViewState["urlformat"] = value; }
  }

  private String FormatUrl(DateTime d) {
    return String.Format(UrlFormat, d);
  }
</script>

<h3>August 2013</h3>
<table>
  <tr>
    <td class="weekday">Sun</td>
    <td class="weekday">Mon</td>
    <td class="weekday">Tue</td>
    <td class="weekday">Wed</td>
    <td class="weekday">Thu</td>
    <td class="weekday">Fri</td>
    <td class="weekday">Sat</td>
  </tr>
  <tr>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-1")) %>">1</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-2")) %>">2</a>
    </td>
    <td class="day">3
    </td>

  </tr>
  <tr>
    <td class="day">4
    </td>
    <td class="day">5
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-6")) %>">6</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-7")) %>">7</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-8")) %>">8</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-9")) %>">9</a>
    </td>
    <td class="day">10
    </td>

  </tr>
  <tr>
    <td class="day">11
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-12")) %>">12</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-13")) %>">13</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-14")) %>">14</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-15")) %>">15</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-8-16")) %>">16</a>
    </td>
    <td class="day">17
    </td>

  </tr>
  <tr>
    <td class="day">18
    </td>
    <td class="day">19
    </td>
    <td class="day">20
    </td>
    <td class="day">21
    </td>
    <td class="day">22
    </td>
    <td class="day">23
    </td>
    <td class="day">24
    </td>

  </tr>
  <tr>
    <td class="day">25
    </td>
    <td class="day">26
    </td>
    <td class="day">27
    </td>
    <td class="day">28
    </td>
    <td class="day">29
    </td>
    <td class="day">30
    </td>
    <td class="day">31
    </td>

  </tr>
</table>
<h3>July 2013</h3>
<table>
  <tr>
    <td class="weekday">Sun</td>
    <td class="weekday">Mon</td>
    <td class="weekday">Tue</td>
    <td class="weekday">Wed</td>
    <td class="weekday">Thu</td>
    <td class="weekday">Fri</td>
    <td class="weekday">Sat</td>
  </tr>
  <tr>
    <td class="day">
    </td>
    <td class="day">1
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-2")) %>">2</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-3")) %>">3</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-4")) %>">4</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-5")) %>">5</a>
    </td>
    <td class="day">6
    </td>

  </tr>
  <tr>
    <td class="day">7
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-8")) %>">8</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-9")) %>">9</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-10")) %>">10</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-11")) %>">11</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-12")) %>">12</a>
    </td>
    <td class="day">13
    </td>

  </tr>
  <tr>
    <td class="day">14
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-15")) %>">15</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-16")) %>">16</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-17")) %>">17</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-18")) %>">18</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-19")) %>">19</a>
    </td>
    <td class="day">20
    </td>

  </tr>
  <tr>
    <td class="day">21
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-22")) %>">22</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-23")) %>">23</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-24")) %>">24</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-25")) %>">25</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-26")) %>">26</a>
    </td>
    <td class="day">27
    </td>

  </tr>
  <tr>
    <td class="day">28
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-29")) %>">29</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-30")) %>">30</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-7-31")) %>">31</a>
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>

  </tr>
</table>
<h3>June 2013</h3>
<table>
  <tr>
    <td class="weekday">Sun</td>
    <td class="weekday">Mon</td>
    <td class="weekday">Tue</td>
    <td class="weekday">Wed</td>
    <td class="weekday">Thu</td>
    <td class="weekday">Fri</td>
    <td class="weekday">Sat</td>
  </tr>
  <tr>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">1
    </td>

  </tr>
  <tr>
    <td class="day">2
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-3")) %>">3</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-4")) %>">4</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-5")) %>">5</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-6")) %>">6</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-7")) %>">7</a>
    </td>
    <td class="day">8
    </td>

  </tr>
  <tr>
    <td class="day">9
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-10")) %>">10</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-11")) %>">11</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-12")) %>">12</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-13")) %>">13</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-14")) %>">14</a>
    </td>
    <td class="day">15
    </td>

  </tr>
  <tr>
    <td class="day">16
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-17")) %>">17</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-18")) %>">18</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-19")) %>">19</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-20")) %>">20</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-21")) %>">21</a>
    </td>
    <td class="day">22
    </td>

  </tr>
  <tr>
    <td class="day">23
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-24")) %>">24</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-25")) %>">25</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-26")) %>">26</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-27")) %>">27</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-6-28")) %>">28</a>
    </td>
    <td class="day">29
    </td>

  </tr>
  <tr>
    <td class="day">30
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>

  </tr>
</table>
<h3>May 2013</h3>
<table>
  <tr>
    <td class="weekday">Sun</td>
    <td class="weekday">Mon</td>
    <td class="weekday">Tue</td>
    <td class="weekday">Wed</td>
    <td class="weekday">Thu</td>
    <td class="weekday">Fri</td>
    <td class="weekday">Sat</td>
  </tr>
  <tr>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-1")) %>">1</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-2")) %>">2</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-3")) %>">3</a>
    </td>
    <td class="day">4
    </td>

  </tr>
  <tr>
    <td class="day">5
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-6")) %>">6</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-7")) %>">7</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-8")) %>">8</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-9")) %>">9</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-10")) %>">10</a>
    </td>
    <td class="day">11
    </td>

  </tr>
  <tr>
    <td class="day">12
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-13")) %>">13</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-14")) %>">14</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-15")) %>">15</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-16")) %>">16</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-17")) %>">17</a>
    </td>
    <td class="day">18
    </td>

  </tr>
  <tr>
    <td class="day">19
    </td>
    <td class="day">20
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-21")) %>">21</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-22")) %>">22</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-23")) %>">23</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-24")) %>">24</a>
    </td>
    <td class="day">25
    </td>

  </tr>
  <tr>
    <td class="day">26
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-27")) %>">27</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-28")) %>">28</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-29")) %>">29</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-30")) %>">30</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2013-5-31")) %>">31</a>
    </td>
    <td class="day">
    </td>

  </tr>
</table>
