<%  title = "Rig Locator"%>
<!--#include virtual="/include/nav.inc"-->

<!-- Main Content Section -->

<section class="mainContent">
    <div class="container content">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2>Rig Locator provides detailed information and reports on drilling rigs in Canada</h2>
            </div>
        </div>
    </div>
    
    <div class="container content">
        <div class="row">
            <div class="col-md-9">
                <div class="heading-block">DRILLING RIG ACTIVITY</div>
                <div style="margin-bottom: 1em;"> 
                    <!--#include file="activity.inc" --> 
                </div>
                <div class="heading-block"> CAODC DRILLING RIG UTILIZATION </div>
                <div style="margin-bottom: 1em;"> 
                    <!--#include file="caodc.inc" --> 
                </div>
                <div style="font-size: 8pt;"> CAODC chart is updated weekly. </div>
            </div>
            <div class="col-md-2 pull-right">
                <div class="row">
                    <div class="skyscrapper-ad"><img src="img/skyscrapper-placeholder.jpg" alt="advertisment"/> </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container content">
        <div class="row">
            <div class="col-md-4">
                <div class="row">
                    <div class="side-ad">
                        <div><img src="img/bigbox-ad.jpg" alt="advertisment"/> </div>
                        <div><img src="img/buttonbox-ad.jpg" alt="advertisment"/> </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="heading-block"> TOP DRILLING RIG OPERATORS </div>
                <div style="margin-bottom: 1em;"> 
                    <!--#include file="ops.inc" --> 
                </div>
                <div>
                    <p><a href="/caodc.asp">Click here</a> for important information about the CAODC's rig utilization data and the <em>Rig Locator</em>'s rig activity data.</p>
                </div>
                <div>
                    <p><a href="/service.asp">Click here</a> for important information about <em>Rig Locator</em> service rig data.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container content">
        <div class="row search-bar">
          <div class="col-md-6 col-md-offset-3">
            <h4>Search for Drilling Rigs:</h4>
                <form method="post" action="search.asp" class="form-inline">
                    <div class="form-group input-group">
                        <select class="form-control" name="searchtype">
                            <option value="loc"> by Location </option>
                            <option value="con"> by Contractor </option>
                            <option value="op"> by Operator </option>
                        </select>
                        <span class="input-group-btn">
                        <input class="btn search-btn" type="submit" value="" />
                        </span> </div>
                </form>
            </div>
        
            
        </div>
    </div>
</section>






<!--#include virtual="/include/footer.inc" -->