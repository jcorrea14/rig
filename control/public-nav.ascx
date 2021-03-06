<%@ Control Language="C#"
    AutoEventWireup="true"
    CodeFile="public-nav.cs"
    Inherits="PublicNav" %>

<nav class="navbar navbar-utility navbar-static-top utility-nav">
  <div class="container"> 
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li class="hidden"> <a href="#page-top"></a> </li>        
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
        <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank">Become a Member</a> </li>
        <li> <a href="<%= LoginUrl %>">Login</a> </li>
      </ul>
      
    </div>
    <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>
