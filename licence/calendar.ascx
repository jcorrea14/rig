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

<h3>May 2015</h3>
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
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-1")) %>">1</a>
    </td>
    <td class="day">2
    </td>

  </tr>
  <tr>
    <td class="day">3
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-4")) %>">4</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-5")) %>">5</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-6")) %>">6</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-7")) %>">7</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-8")) %>">8</a>
    </td>
    <td class="day">9
    </td>

  </tr>
  <tr>
    <td class="day">10
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-11")) %>">11</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-12")) %>">12</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-13")) %>">13</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-14")) %>">14</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-15")) %>">15</a>
    </td>
    <td class="day">16
    </td>

  </tr>
  <tr>
    <td class="day">17
    </td>
    <td class="day">18
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-19")) %>">19</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-5-20")) %>">20</a>
    </td>
    <td class="day">21
    </td>
    <td class="day">22
    </td>
    <td class="day">23
    </td>

  </tr>
  <tr>
    <td class="day">24
    </td>
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

  </tr>
  <tr>
    <td class="day">31
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
<h3>April 2015</h3>
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
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-1")) %>">1</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-2")) %>">2</a>
    </td>
    <td class="day">3
    </td>
    <td class="day">4
    </td>

  </tr>
  <tr>
    <td class="day">5
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-6")) %>">6</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-7")) %>">7</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-8")) %>">8</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-9")) %>">9</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-10")) %>">10</a>
    </td>
    <td class="day">11
    </td>

  </tr>
  <tr>
    <td class="day">12
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-13")) %>">13</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-14")) %>">14</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-15")) %>">15</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-16")) %>">16</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-17")) %>">17</a>
    </td>
    <td class="day">18
    </td>

  </tr>
  <tr>
    <td class="day">19
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-20")) %>">20</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-21")) %>">21</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-22")) %>">22</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-23")) %>">23</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-24")) %>">24</a>
    </td>
    <td class="day">25
    </td>

  </tr>
  <tr>
    <td class="day">26
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-27")) %>">27</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-28")) %>">28</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-29")) %>">29</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-4-30")) %>">30</a>
    </td>
    <td class="day">
    </td>
    <td class="day">
    </td>

  </tr>
</table>
<h3>March 2015</h3>
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
    <td class="day">1
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-2")) %>">2</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-3")) %>">3</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-4")) %>">4</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-5")) %>">5</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-6")) %>">6</a>
    </td>
    <td class="day">7
    </td>

  </tr>
  <tr>
    <td class="day">8
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-9")) %>">9</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-10")) %>">10</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-11")) %>">11</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-12")) %>">12</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-13")) %>">13</a>
    </td>
    <td class="day">14
    </td>

  </tr>
  <tr>
    <td class="day">15
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-16")) %>">16</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-17")) %>">17</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-18")) %>">18</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-19")) %>">19</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-20")) %>">20</a>
    </td>
    <td class="day">21
    </td>

  </tr>
  <tr>
    <td class="day">22
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-23")) %>">23</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-24")) %>">24</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-25")) %>">25</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-26")) %>">26</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-27")) %>">27</a>
    </td>
    <td class="day">28
    </td>

  </tr>
  <tr>
    <td class="day">29
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-30")) %>">30</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-3-31")) %>">31</a>
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
<h3>February 2015</h3>
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
    <td class="day">1
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-2")) %>">2</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-3")) %>">3</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-4")) %>">4</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-5")) %>">5</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-6")) %>">6</a>
    </td>
    <td class="day">7
    </td>

  </tr>
  <tr>
    <td class="day">8
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-9")) %>">9</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-10")) %>">10</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-11")) %>">11</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-12")) %>">12</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-13")) %>">13</a>
    </td>
    <td class="day">14
    </td>

  </tr>
  <tr>
    <td class="day">15
    </td>
    <td class="day">16
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-17")) %>">17</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-18")) %>">18</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-19")) %>">19</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-20")) %>">20</a>
    </td>
    <td class="day">21
    </td>

  </tr>
  <tr>
    <td class="day">22
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-23")) %>">23</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-24")) %>">24</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-25")) %>">25</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-26")) %>">26</a>
    </td>
    <td class="day"><a href="<% = FormatUrl(DateTime.Parse("2015-2-27")) %>">27</a>
    </td>
    <td class="day">28
    </td>

  </tr>
</table>
