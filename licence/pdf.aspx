<%@ Page
Language="C#"
MasterPageFile="/master/page.master"
Title="Rig Locator | Daily Well Licences PDF" %>
<%@ Register Src="/licence/calendar.ascx" TagName="calendar" TagPrefix="dob" %>

<asp:Content ContentPlaceHolderId="page_content" runat="server">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Well Licence Search</h1>
            <ul>
              <li><a href="/licence/" class="btn btn-xl btn-rig full-width">By Date</a></li>
              <li><a href="/licence/pdf.aspx" class="btn btn-xl btn-rig full-width selected">Daily PDF</a></li>
              <li><a href="/licence/operator.aspx" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/licence/location.aspx" class="btn btn-xl btn-rig full-width">By Location</a></li>
              <li class="pull-right"> </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="dnl-calendar">
            <dob:calendar runat="server" UrlFormat="/licence/view-pdf.aspx?file=dnl-{0:yyMMdd}.pdf" />
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
