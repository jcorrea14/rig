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
            <li> <a class="page-scroll" href="#data">Pinpoint Business</a> </li>
            <li> <a class="page-scroll" href="#map">Improved Mapping</a></li>
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
        <div class="intro-heading">Get current and accurate information about western Canada’s drilling rig fleet.</div>
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
          <h2 class="section-heading">Access complete rig details in easy-to-use formats</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 text-center"> <span class="feature-icon-1"> </span>
          <h3 class="service-heading text-center">Maps</h3>
          <p class="service-heading"><strong>Results can be exported, printed and saved.</strong></p>
          <ul class="section-subheading">
            <li>Filter by <a href="#" data-toggle="tooltip" data-placement="top" title="Petroleum Services Association of Canada">PSAC</a> area, contractor and operator.</li>
            <li>Search by operator, contractor, <a href="#" data-toggle="tooltip" data-placement="top" title="Dominion Land Survey">DLS</a>, <a href="#" data-toggle="tooltip" data-placement="top" title="National Topographic System">NTS</a>, latitude/longitude or custom radius. 
            </li>
            <li>Layer in enhanced roads & lakes, oil sands projects and leases, facilities, pipelines and more.</li>
            <li> Input start and end location to retrieve directions and distance.</li>
          </ul>
        </div>
        <div class="col-md-6 text-center"> <span class="feature-icon-2"></span>
          <h3 class="service-heading text-center">Reports</h3>
          <p class="service-heading"><strong>The most up-to-date and comprehensive rig data on the market, verified by the Rig Locator data analysis team.</strong></p>
          <ul class="section-subheading">
            <li>Get an overview of drilling activity and top 5 operators with the Rig Dashboard.</li>
            <li>View pre-built industry reports on contractors, operators and drilling activity.</li>
            <li>Narrow your search by operator, contractor, <a href="#" data-toggle="tooltip" data-placement="top" title="Dominion Land Survey">DLS</a> or <a href="#" data-toggle="tooltip" data-placement="top" title="National Topographic System">NTS</a>.</li>
            <li>Daily rig activity charts, well licence reports and more.</li>
            <li>Download daily rig files.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Portfolio Grid Section -->
  <section id="data" class="why-rig-locator">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center vert-offset-top-3">
          <h2 class="section-heading">Pinpoint business opportunities, fast.</h2>
          <h3 class="section-subheading">Identify industry trends, analyze market share and determine business opportunities.</h3>
        </div>
      </div>
    </div>
  </section>
  
  <!-- About Section -->
  <section id="map" class="about-rig-locator">
    <div class="container">
      <div class="col-md-6"><img src="img/placeholder-image-laptop.png" alt="placeholder"/> </div>
      <div class="col-md-6 vert-offset-top-5">
        <h2 class="section-heading ">Improved mapping streamlines your search.</h2>
        <h3 class="section-subheading">Rig Locator’s unique custom radius function lets you define your area of interest. Layer in facilities, pipelines and oilsands projects to refine your target. Add other filters to zero in on the information you need.</h3>
      </div>
    </div>
  </section>
  <!-- Who Section -->
  <section id="membership">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 text-center block-center"> <span class="feature-icon-1"> </span>
          <h2 class="section-heading">Take the new Rig Locator for a test drive.</h2>
          <h3 class="section-subheading"><a href="#">Sign up</a> for a 5-day, limited access trial to see how the mapping and reporting features on Rig Locator make businesses more agile.</h3>
          <a href="#" class="btn btn-xl btn-blk">Start a Trial</a> </div>
      </div>
    </div>
  </section>
</asp:Content>
