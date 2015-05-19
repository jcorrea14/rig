<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Locator Dashboard"
    %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h1>Welcome to your Rig Locator.</h1>
          <span class="data-icon-1"> </span>
          <h4> This dashboard gives you the most accurate and current view of rig activity across western Canada. From here you can select more detailed reports, or navigate into rig maps to visualize geographic data.</h4>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="heading-block">DRILLING RIG ACTIVITY</div>
          <div style="margin-bottom: 1em;"> 
            <!--#include file="activity.inc" --> 
          </div>
          <div class="heading-block"> TOP DRILLING RIG OPERATORS </div>
          <div style="margin-bottom: 1em;"> 
            <!--#include file="ops.inc" --> 
          </div>
        </div>
        <div class="col-md-4 vert-offset-top-6">
          <div class="row">
            <div class="side-ad pull-right"> 
              <!-- big box -->
              <div id='div-gpt-ad-1329923512779-10' style='width:300px; height:250px; margin:10px 0 20px 0;'> 
                <script type='text/javascript'>
                     googletag.display('div-gpt-ad-1329923512779-10');
                </script> 
              </div>
              <div> 
                <!-- button box -->
                <div id='div-gpt-ad-1335301288326-2' style='width:300px; height:120px; margin-bottom:10px;'> 
                  <script type='text/javascript'>
                      googletag.display('div-gpt-ad-1335301288326-2');
                </script> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
