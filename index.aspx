<%@ Page
    MasterPageFile="/master/base.master"
    Title="Rig Locator"
    CodeFile="index.cs"
    Inherits="IndexPage"
    %>

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
                        <li> <a class="page-scroll" href="#membership">Membership</a> </li>
                        
                    </ul>
                    <ul class="nav navbar-nav navbar-left navbar-buttons">
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
                    <p class="section-subheading text-muted">
                    Search for rig locations, operators or contractors.
                    </p>
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
            <div class="col-md-6"><img src="img/placeholder-image-laptop.png" alt="placeholder" /> </div>
            <div class="col-md-6">
                <h2 class="section-heading">We update rig locations daily.</h2>
                <h3 class="section-subheading">Locate rigs that are currently active, down or moving. View oil and gas facilities, pipelines, municipalities and access road features. Then print or save your search results to reference later.</h3>
                
                <div class="call-to-action col-centered">
                    <ul>
                        <li><a href="#" class="btn btn-xl">Start a Trial</a></li>
                        <li> <a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="btn btn-xl">Become a Member</a></li>
                    </ul>
                </div>
           </div>
           
        </div>
    </section>
    <!-- Who Section -->
    <section id="membership" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center border-right">
                    <h2 class="section-heading">Basic Membership</h2>
                    <h3 class="section-heading"> $550 for a single-user licence </h3>
                    <p><strong>Data:</strong></p>
                    <ul>
                        <li>Daily updates on the following data:</li>
                        <li>Contractors’ summary report</li>
                        <li>Top operators report</li>
                        <li>Depth activity report</li>
                        <li>Planned drilling projects</li>
                        <li>Drilling activity surveys</li>
                        <li>Western Canada drilling chart</li>
                        <li>Quarterly contractor utilization summaries</li>
                    </ul>
                    <p><strong>Map:</strong></p>
                    <ul>
                        <li>Rig location updated twice daily:</li>
                        <li>Search by location</li>
                        <li>Search by contractor</li>
                        <li>Search by operator</li>
                    </ul>
                    <p><strong>Extra benefits:</strong></p>
                    <ul>
                        <li>Free enrolment for the monthly COSSD e-newsletter</li>
                        <li>25% savings on membership to <em>The Basin</em></li>
                        <li>20% savings on purchase of <em>The Oilfield Atlas</em></li>
                    </ul>
                    <p><a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="page-scroll btn btn-xl btn-blk">Become a Member</a></p>
                </div>
                <div class="col-md-6 text-center">
                    <h2 class="section-heading">Premium Membership</h2>
                    <h3 class="section-heading"> $710 for a single-user licence </h3>
                    <h5><strong>Includes all features of the basic membership</strong></h5>
                    <p><strong>Data:</strong></p>
                    <ul>
                        <li>Reports can be printed, saved or exported to Excel</li>
                        <li>Email alert of rig activity in a user-specified PSAC area</li>
                    </ul>
                    <p><strong>Fully navigable map:</strong></p>
                    <ul>
                        <li>Additional rig information, including:</li>
                        <li>Contractor and operator</li>
                        <li>Rig number and current status</li>
                        <li>Date the well was spudded</li>
                        <li>Legal land description (LSD)</li>
                        <li>Maps can be saved or printed</li>
                    </ul>
                    <p><a href="http://www.junewarren-nickles.com/new-membership/rig.html" target="_blank" class="page-scroll btn btn-xl btn-blk">Become a Member</a> </p>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Final Marketing Section -->
    <section id="who" class="become-member">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Get the best information about western Canada’s drilling rig fleet.</h2>
                    <h3 class="section-subheading">Rig Locator provides current, accurate data on rig activity, and updates the location of all rigs daily.</h3>
                </div>
            </div>
        </div>
    </section>    
</asp:Content>
