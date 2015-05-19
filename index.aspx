<%@ Page
    MasterPageFile="/master/base.master"
    Title="Rig Locator"
    CodeFile="index.cs"
    Inherits="IndexPage"
    %>
<asp:Content runat="server" ContentPlaceholderId="page_meta">
  <meta name="description" content="The best information for western Canada drilling rig fleet locations, data and report tools." />
</asp:Content>
<asp:Content runat="server" ContentPlaceholderId="page_content">
  <div class="mainNav"> 
    <!-- Navigation -->
    <nav class="navbar navbar-utility navbar-static-top utility-nav-home">
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
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container"> 
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand page-scroll" href="#page-top"></a> </div>
        
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-left navbar-home">
            <li class="hidden"> <a href="#page-top"></a> </li>
            <li> <a class="page-scroll" href="#features">Features</a> </li>
            <li> <a class="page-scroll" href="#data">Rig Locator Data</a> </li>
            <li> <a class="page-scroll" href="#map">Rig Locator Map</a></li>
            <li> <a class="page-scroll" href="#membership">Free Trial</a> </li>
          </ul>
          <ul class="nav navbar-nav navbar-left navbar-buttons pull-right">
            <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank">Become a Member</a> </li>
            <li> <a href="<%= LoginUrl %>">Login</a> </li>
          </ul>
        </div>
        <!-- /.navbar-collapse --> 
      </div>
      <!-- /.container-fluid --> 
    </nav>
  </div>
  <!-- Header -->
  <header class="home">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in">Find business opportunities.</div>
        <div class="intro-lead-in">Analyze competition and market share.</div>
        <div class="intro-lead-in"> Monitor asset details.</div>
        <div class="intro-heading">Get the best information about western Canada’s drilling rig fleet.</div>
        <div class="call-to-action col-md-6 col-centered">
          <ul>
            <li><a href="#" class="btn btn-xl">Start a Trial</a></li>
            <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="btn btn-xl">Become a Member</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>
  
  <!-- Data Partnerships Section -->
  <section class="dataPartnerships">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h4 class="section-heading">Data partnerships provided by: <img src="img/logos/PSAC-logo.png" alt="PSAC" /></h4>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Features Section -->
  <section id="features" class="bg-light-gray">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading">Everything you need for accurate rig information:</h2>
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-4 col-md-offset-2"> <span class="feature-icon-1"> </span>
          <h4 class="service-heading">Maps</h4>
          <p class="section-subheading text-muted"> Search for rig locations, operators or contractors. </p>
        </div>
        <div class="col-md-4"> <span class="feature-icon-2"></span>
          <h4 class="service-heading">Reports</h4>
          <p class="section-subheading text-muted"> Dive deeper into your analysis with detailed rig reports. </p>
        </div>
      </div>
      <div class="row text-center">
        <div class="col-md-4 col-md-offset-2"> <span class="feature-icon-3"></span>
          <h4 class="service-heading">Search</h4>
          <p class="section-subheading text-muted">Search by rig locations, operator or contractor.</p>
        </div>
        <div class="col-md-4"> <span class="feature-icon-4"> </span>
          <h4 class="service-heading">Mobile Ready</h4>
          <p class="section-subheading text-muted"> Search by rig locations, operator or contractor. </p>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Portfolio Grid Section -->
  <section id="data" class="why-rig-locator">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 text-center block-center">
          <h2 class="section-heading">We give you the data behind every rig.</h2>
          <h3 class="section-subheading">Rig Locator provides data on contractors, operators and drilling activity. Find the information you need to identify industry trends, analyze market share and determine business opportunities. Print your search results or export them into an Excel file.</h3>
        </div>
        <div class="call-to-action col-md-6 col-centered">
          <ul>
            <li><a href="#" class="btn btn-xl">Start a Trial</a></li>
            <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="btn btn-xl">Become a Member</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  
  <!-- About Section -->
  <section id="map" class="about-rig-locator">
    <div class="container">
      <div class="col-md-5"><img src="img/placeholder-image-laptop.png" alt="placeholder" width="490"/> </div>
      <div class="col-md-7 vert-offset-top-7">
        <h2 class="section-heading ">Rig locations updated daily.</h2>
        
        <div class="call-to-action vert-offset-top-3">
          <ul>
            <li><a href="#" class="btn btn-xl btn-2xl">Start a Trial</a></li>
            <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="btn btn-xl btn-2xl">Become a Member</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  <!-- Who Section -->
  <section id="membership">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 text-center block-center">
        <span class="feature-icon-1"> </span>
          <h2 class="section-heading">Start your free trial today.</h2>
          <h3 class="section-subheading">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dapibus dignissim elit, vitae ultrices nisl ornare quis. Etiam at scelerisque nisl. Vestibulum vehicula mi ac vulputate cursus. Duis sagittis ante nec urna sodales dignissim. Praesent egestas sed nulla sit amet pretium. In hac habitasse platea dictumst.</h3>
          <a href="#" class="btn btn-xl btn-blk">Start a Trial</a>
        </div>
        
      </div>
    </div>
  </section>
</asp:Content>
