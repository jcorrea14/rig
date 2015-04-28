<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeFile="member-nav.cs"
    Inherits="MemberNav" %>

<!-- Navigation -->
<nav class="navbar navbar-utility navbar-static-top utility-nav">
  <div class="container"> 
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="hidden"> <a href="#page-top"></a> </li>
        <li> <a href="#">My Profile</a> </li>
        <li> <a href="https://secure.junewarren-nickles.com/corp-accounts.aspx" target="_blank">Corporate Accounts</a> </li>
        <li> <a href="/about.aspx">About Us</a> </li>
        <li> <a href="/contact.aspx">Contact Us</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<!-- Navigation -->

<nav class="navbar navbar-default navbar-static-top nav-subpage">
  <div class="container"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header page-scroll">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    <a class="navbar-brand page-scroll" href="/"></a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right navbar-buttons">
        <li>
          <asp:LinkButton runat="server" onclick="LogoutClick" Text="Logout" />
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right navbar-home">
        <li class="hidden"> <a href="#page-top"></a> </li>
        <li> <a href="/data.aspx">Rig Data</a> </li>
        <li> <a href="http://maps.riglocator.ca" target="_blank">Rig Map</a> </li>
        <li> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Rig Search</a>
        <ul class="dropdown-menu">
          <li><a href="/search/operator"> By Operator</a></li>
          <li><a href="/search/contractor">By Contractor</a></li>
          <li><a href="/search/location" >By Location</a></li>
        </ul>
        </li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Drilling Rig Reports</a>
        <ul class="dropdown-menu">
          <li><a href="/report/summary">Contractors' Summary</a></li>
          <li><a href="/report/operators">Top Operators</a></li>
          <li><a href="/report/depth">Depth Activity</a></li>
          <li><a href="/report/projects">Planned Drilling Projects</a></li>
          <li><a href="/report/dr-activity">Drilling Activity Surveys</a></li>
          <li><a href="/report/survey">Western Canada Drilling Chart</a></li>
          <li><a href="/report/utilization">Contractor Utilization Summary</a></li>
          <li><a href="/download.asp">Download and print reports</a></li>
        </ul>
        </li>
        <li> <a href="http://www.datacentralcanada.com/licences.asp" target="_blank">Well Licenses</a> </li>
        <li> <a href="../summary.aspx">Drilling Summary</a> </li>
      </ul>
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>