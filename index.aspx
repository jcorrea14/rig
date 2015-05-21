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
          <ul class="nav navbar-nav navbar-left navbar-buttons pull-right">
            <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank">Become a Member</a> </li>
            <li> <a href="<%= LoginUrl %>">Login</a> </li>
          </ul>
          <ul class="nav navbar-nav navbar-right navbar-home">
            <li class="hidden"> <a href="#page-top"></a> </li>
            <li> <a class="page-scroll" href="#features">Comprehensive Reports</a> </li>
            <!--li> <a class="page-scroll" href="#data">Pinpoint Business</a> </li>-->
            <li> <a class="page-scroll" href="#map">Improved Mapping</a></li>
            <li> <a class="page-scroll" href="#membership">Free Trial</a> </li>
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
  <section id="features" class="rig-features bg-light-gray">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading">Information that matters.</h2>
        </div>
      </div>
      <div class="row vert-offset-top-3">
        <div class="col-md-7">
          <h3 class="service-heading">Reports</h3>
          <h4 class="section-subheading"><strong>The most up-to-date and comprehensive rig data on the market.</strong></h4>
          <ul class="section-subheading">
            <li>Get an overview of drilling activity and top 5 active operators with the Rig Dashboard.</li>
            <li>View pre-built industry reports on contractors, operators and drilling activity.</li>
            <li>Narrow your search by operator, contractor, <a href="#" data-toggle="tooltip" data-placement="top" title="Dominion Land Survey">DLS</a> or <a href="#" data-toggle="tooltip" data-placement="top" title="National Topographic System">NTS</a>.</li>
            <li>Access the daily well licences and more.</li>
            <li>Download the daily rig file.</li>
          </ul>
        </div>
        <div class="col-md-5"><img src="img/reports-image.png" alt="placeholder"/> </div>
      </div>
    </div>
  </section>
  

  <!-- About Section -->
  <section id="map" class="rig-maps">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading ">Improved mapping streamlines your search.</h2>
        </div>
      </div>
      <div class="row vert-offset-top-3">
        <div class="col-md-5"><img src="img/mapping-image.png" alt="placeholder" width="430"/> </div>
        <div class="col-md-7">
          <h3 class="service-heading">Maps</h3>
          <h4 class="section-subheading"><strong>Pinpoint business opportunities, fast.</strong></h4>
          <ul class="section-subheading">
          <li>Results can be exported, printed and saved.</li>
            <li>Search/filter by <a href="#" data-toggle="tooltip" data-placement="top" title="Petroleum Services Association of Canada">PSAC</a> area, contractor and operator.</li>
            <li>Create your own custom radius or search by <a href="#" data-toggle="tooltip" data-placement="top" title="Dominion Land Survey">DLS</a>, <a href="#" data-toggle="tooltip" data-placement="top" title="National Topographic System">NTS</a> or latitude/longitude. </li>
            <li>Layer in access roads, facilities, pipelines and more.</li>
            <li>Input start and end location to retrieve directions and distance.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Portfolio Grid Section -->
  <section id="membership" class="free-trial">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center block-center">
          <h2 class="section-heading">Take the new Rig Locator for a test drive.</h2>
          <h3 class="section-subheading">Sign up for a 5-day, limited access trial to see how the mapping and reporting features on Rig Locator make businesses more agile.</h3>
          <a href="#" class="btn btn-xl">Start a Trial</a> </div>
      </div>
    </div>
  </section>
</asp:Content>
