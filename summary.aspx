<%@ Page
    MasterPageFile="/master/page.master"
    Title="Rig Locator Drilling Graphs"
    %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <h1>Drilling Graphs</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4"> <a href="#" data-chart="licences" class="fadeback">
          <h3 class="gamma">Well Licences Issued</h3>
          <img src="/img/chart-licences.jpg" alt=""> </a></div>
        <div class="col-md-4">
          <h3>Drilling Activity</h3>
          <img src="/img/chart-activity.jpg" alt=""> </div>
        <div class="col-md-4">
          <h3>Completions</h3>
          <img src="/img/chart-wells.jpg" alt=""> </div>
      </div>
    </div>
    <div id="modal-chart" class="reveal-modal large" style="display: none; opacity: 1; visibility: hidden; top: -3458px;">
      <h1 class="beta">Well Licences Issued</h1>
      <div id="chart" class="chart"> <svg>
        <g class="nvd3 nv-wrap nv-multiBarWithLegend" transform="translate(60,30)">
          <g>
            <g class="nv-x nv-axis" transform="translate(0,420)">
              <g class="nvd3 nv-wrap nv-axis">
                <g>
                  <g class="tick" transform="translate(49.227272727272734,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">Jan</text>
                  </g>
                  <g class="tick" transform="translate(138.7314049586777,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Feb</text>
                  </g>
                  <g class="tick" transform="translate(228.23553719008265,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">Mar</text>
                  </g>
                  <g class="tick" transform="translate(317.73966942148763,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Apr</text>
                  </g>
                  <g class="tick" transform="translate(407.2438016528926,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">May</text>
                  </g>
                  <g class="tick" transform="translate(496.7479338842976,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Jun</text>
                  </g>
                  <g class="tick" transform="translate(586.2520661157025,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">Jul</text>
                  </g>
                  <g class="tick" transform="translate(675.7561983471076,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Aug</text>
                  </g>
                  <g class="tick" transform="translate(765.2603305785124,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">Sep</text>
                  </g>
                  <g class="tick" transform="translate(854.7644628099174,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Oct</text>
                  </g>
                  <g class="tick" transform="translate(944.2685950413224,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 0;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 0;">Nov</text>
                  </g>
                  <g class="tick" transform="translate(1033.7727272727273,0)" style="opacity: 1;">
                    <line y2="-420" x2="0" style="opacity: 1;"></line>
                    <text y="7" dy=".71em" x="0" style="text-anchor: middle; opacity: 1;">Dec</text>
                  </g>
                  <path class="domain" d="M0,0V0H1083V0"></path>
                  <text class="nv-axislabel" text-anchor="middle" y="36" x="541.5" style="opacity: 1;"></text>
                </g>
              </g>
            </g>
            <g class="nv-y nv-axis">
              <g class="nvd3 nv-wrap nv-axis">
                <g>
                  <g class="tick" transform="translate(0,420)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="0" style="text-anchor: end;" y="0">0</text>
                  </g>
                  <g class="tick" transform="translate(0,381.1650485436893)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">200</text>
                  </g>
                  <g class="tick" transform="translate(0,342.33009708737865)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">400</text>
                  </g>
                  <g class="tick" transform="translate(0,303.495145631068)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">600</text>
                  </g>
                  <g class="tick" transform="translate(0,264.6601941747573)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">800</text>
                  </g>
                  <g class="tick" transform="translate(0,225.82524271844662)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">1,000</text>
                  </g>
                  <g class="tick" transform="translate(0,186.99029126213594)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">1,200</text>
                  </g>
                  <g class="tick" transform="translate(0,148.15533980582524)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">1,400</text>
                  </g>
                  <g class="tick" transform="translate(0,109.32038834951459)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">1,600</text>
                  </g>
                  <g class="tick" transform="translate(0,70.48543689320388)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">1,800</text>
                  </g>
                  <g class="tick" transform="translate(0,31.650485436893234)" style="opacity: 1;">
                    <line x2="1083" y2="0"></line>
                    <text x="-3" dy=".32em" opacity="1" style="text-anchor: end;" y="0">2,000</text>
                  </g>
                  <path class="domain" d="M0,0H0V420H0"></path>
                  <text class="nv-axislabel" transform="rotate(-90)" y="-63" x="-210" style="text-anchor: middle;"></text>
                </g>
                <g class="nv-axisMaxMin" transform="translate(0,420)">
                  <text dy=".32em" y="0" x="-3" text-anchor="end" style="opacity: 1;">0</text>
                </g>
                <g class="nv-axisMaxMin" transform="translate(0,0)">
                  <text dy=".32em" y="0" x="-3" text-anchor="end" style="opacity: 1;">2,163</text>
                </g>
              </g>
            </g>
            <g class="nv-barsWrap">
              <g class="nvd3 nv-wrap nv-multibar" transform="translate(0,0)">
                <defs>
                  <clipPath id="nv-edge-clip-9061">
                    <rect width="1083" height="420"></rect>
                  </clipPath>
                </defs>
                <g clip-path="url(#nv-edge-clip-9061)">
                  <g class="nv-groups">
                    <g class="nv-group nv-series-0" style="stroke-opacity: 1; fill-opacity: 0.75; fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);">
                      <rect class="nv-bar positive" x="0" y="249.90291262135923" height="170.09708737864077" width="40.27685950413223" transform="translate(8.950413223140497,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="306.79611650485435" height="113.20388349514565" width="40.27685950413223" transform="translate(98.45454545454547,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="306.79611650485435" height="113.20388349514565" width="40.27685950413223" transform="translate(187.95867768595042,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="312.4271844660194" height="107.57281553398059" width="40.27685950413223" transform="translate(277.4628099173554,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="413.7864077669903" height="6.213592233009706" width="40.27685950413223" transform="translate(366.9669421487604,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(456.47107438016536,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(545.9752066115702,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(635.4793388429753,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(724.9834710743802,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(814.4876033057851,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(903.9917355371902,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                      <rect class="nv-bar positive" x="0" y="419" height="1" width="40.27685950413223" transform="translate(993.4958677685951,0)" style="fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></rect>
                    </g>
                    <g class="nv-group nv-series-1" style="stroke-opacity: 1; fill-opacity: 0.75; fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);">
                      <rect class="nv-bar positive" x="40.27685950413223" y="30.873786407767" height="389.126213592233" width="40.27685950413223" transform="translate(8.950413223140497,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="153.98058252427188" height="266.0194174757281" width="40.27685950413223" transform="translate(98.45454545454547,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="214.95145631067965" height="205.04854368932035" width="40.27685950413223" transform="translate(187.95867768595042,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="244.6601941747573" height="175.3398058252427" width="40.27685950413223" transform="translate(277.4628099173554,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="193.00970873786406" height="226.99029126213594" width="40.27685950413223" transform="translate(366.9669421487604,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="193.59223300970874" height="226.40776699029126" width="40.27685950413223" transform="translate(456.47107438016536,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="121.1650485436893" height="298.8349514563107" width="40.27685950413223" transform="translate(545.9752066115702,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="218.4466019417476" height="201.5533980582524" width="40.27685950413223" transform="translate(635.4793388429753,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="147.5728155339806" height="272.4271844660194" width="40.27685950413223" transform="translate(724.9834710743802,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="135.14563106796118" height="284.8543689320388" width="40.27685950413223" transform="translate(814.4876033057851,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="41.941747572815586" height="378.0582524271844" width="40.27685950413223" transform="translate(903.9917355371902,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                      <rect class="nv-bar positive" x="40.27685950413223" y="0" height="420" width="40.27685950413223" transform="translate(993.4958677685951,0)" style="fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></rect>
                    </g>
                  </g>
                </g>
              </g>
            </g>
            <g class="nv-legendWrap" transform="translate(0,-30)">
              <g class="nvd3 nv-legend" transform="translate(0,5)">
                <g transform="translate(919,5)">
                  <g class="nv-series" transform="translate(0,5)">
                    <circle class="nv-legend-symbol" r="5" style="stroke-width: 2px; fill: rgb(249, 174, 51); stroke: rgb(249, 174, 51);"></circle>
                    <text text-anchor="start" class="nv-legend-text" dy=".32em" dx="8">This Year</text>
                  </g>
                  <g class="nv-series" transform="translate(82,5)">
                    <circle class="nv-legend-symbol" r="5" style="stroke-width: 2px; fill: rgb(0, 156, 163); stroke: rgb(0, 156, 163);"></circle>
                    <text text-anchor="start" class="nv-legend-text" dy=".32em" dx="8">Last Year</text>
                  </g>
                </g>
              </g>
            </g>
            <g class="nv-controlsWrap"></g>
          </g>
        </g>
        </svg></div>
      <a class="close-reveal-modal"><span>Close</span> ×</a> </div>
  </section>
</asp:Content>
