<%@ Page
  Language="C#"
  MasterPageFile="/master/page.master"
  CodeFile="operator.aspx.cs"
  Inherits="Op"
  AutoEventWireup="true"
  Title="Rig Locator | Search Well Licences By Operator" %>
<%@ Register Src="/licence/resultlist.ascx" TagName="resultslist" TagPrefix="dob" %>
<asp:Content ContentPlaceHolderId="page_content" runat="server">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Daily Well Licences</h1>
            <ul>
              <li><a href="/licence/" class="btn btn-xl btn-rig full-width">By Date</a></li>
              <li><a href="/licence/pdf.aspx" class="btn btn-xl btn-rig full-width">Daily PDF</a></li>
              <li><a href="/licence/operator.aspx" class="btn btn-xl btn-rig full-width selected">By Operator</a></li>
              <li><a href="/licence/location.aspx" class="btn btn-xl btn-rig full-width">By Location</a></li>
            </ul>
          </div>
        </div>
      </div>
      <asp:Placeholder id="search" runat="server">
        <div class="row">
          <div class="col-lg-4">
            <div class="form-group input-group">
              <div class="toc">
                Operator
              </div>
              <asp:DropDownList id="op" class="form-control" runat="server" />
            </div>
          </div>
          <div class="col-lg-3">
            <div class="form-group input-group">
              <div class="toc">
                Well Type
              </div>
              <div>
                <asp:DropdownList class="form-control" id="type" runat="server" >
                  <asp:ListItem value="ANY" Selected="True">[ALL]</asp:ListItem>
                  <asp:ListItem value="D">Directional</asp:ListItem>
                  <asp:ListItem value="H">Horizontal</asp:ListItem>
                  <asp:ListItem value="R">Vertical</asp:ListItem>
                </asp:DropdownList>
              </div>
            </div>
            <div class="form-group input-group">
              <div class="toc">
                Projected Depth
              </div>
              <div>
                <asp:DropdownList class="form-control" id="depth" runat="server" >
                  <asp:ListItem value="ANY" Selected="True">[ANY]</asp:ListItem>
                  <asp:ListItem value="1">0 - 950 M</asp:ListItem>
                  <asp:ListItem value="2">951 - 1850 M</asp:ListItem>
                  <asp:ListItem value="3">1851 - 2450 M</asp:ListItem>
                  <asp:ListItem value="4">2451 - 3050 M</asp:ListItem>
                  <asp:ListItem value="5">3051 - 3700 M</asp:ListItem>
                  <asp:ListItem value="6">3701 - 4600 M</asp:ListItem>
                  <asp:ListItem value="7">4601 M +</asp:ListItem>
                </asp:DropdownList>
              </div>
            </div>
            <div class="form-group input-group">
              <div class="toc">
                Objective
              </div>
              <div>
                <asp:DropdownList class="form-control" id="objective" runat="server" >
                  <asp:ListItem value="ANY" Selected="True">[ALL]</asp:ListItem>
                  <asp:ListItem value="BIT">BIT</asp:ListItem>
                  <asp:ListItem value="CBM">CBM</asp:ListItem>
                  <asp:ListItem value="GAS">GAS</asp:ListItem>
                  <asp:ListItem value="OIL">OIL</asp:ListItem>
                  <asp:ListItem value="SVC">SVC</asp:ListItem>
                </asp:DropdownList>
              </div>
            </div>
            <div class="form-group input-group">
              <div class="toc">
                Well Class
              </div>
              <div>
                <asp:DropdownList class="form-control" id="wellclass" runat="server" >
                  <asp:ListItem value="ANY" Selected="True">[ALL]</asp:ListItem>
                  <asp:ListItem value="DEV">DEV - Development</asp:ListItem>
                  <asp:ListItem value="DPT">DPT - Deeper Pool Test</asp:ListItem>
                  <asp:ListItem value="DSW">DSW - Development Service</asp:ListItem>
                  <asp:ListItem value="EV">EV - Evaluation</asp:ListItem>
                  <asp:ListItem value="EX">EX - Experimental</asp:ListItem>
                  <asp:ListItem value="EXP">EXP - Exploratory</asp:ListItem>
                  <asp:ListItem value="NFW">NFW - New Field Wildcat</asp:ListItem>
                  <asp:ListItem value="NPW">NPW - New Pool Wildcat</asp:ListItem>
                  <asp:ListItem value="OTH">OTH - Other</asp:ListItem>
                  <asp:ListItem value="OUT">OUT - Outpost</asp:ListItem>
                  <asp:ListItem value="OV">OV - Oil Sands Evaluation</asp:ListItem>
                  <asp:ListItem value="REN">REN - Re-enter Well</asp:ListItem>
                  <asp:ListItem value="TH">TH - Test Hole</asp:ListItem>
                </asp:DropdownList>
              </div>
            </div>
          </div>
          <div class="col-md-4 pull-right">
            <div class="row">
              <div class=class="col-lg-12">
                <div class="form-group input-group">
                  <div class="toc">
                    Licence Issue Date From:
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <asp:DropdownList class="form-control" id="yearfrom" runat="server" />
                    </div>
                    <div class="col-md-5">
                      <asp:DropdownList class="form-control" id="monthfrom" runat="server" >
                        <asp:ListItem value="1">January</asp:ListItem>
                        <asp:ListItem value="2">February</asp:ListItem>
                        <asp:ListItem value="3">March</asp:ListItem>
                        <asp:ListItem value="4">April</asp:ListItem>
                        <asp:ListItem value="5">May</asp:ListItem>
                        <asp:ListItem value="6">June</asp:ListItem>
                        <asp:ListItem value="7">July</asp:ListItem>
                        <asp:ListItem value="8">August</asp:ListItem>
                        <asp:ListItem value="9">September</asp:ListItem>
                        <asp:ListItem value="10">October</asp:ListItem>
                        <asp:ListItem value="11">November</asp:ListItem>
                        <asp:ListItem value="12">December</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                    <div class="col-md-3">
                      <asp:DropdownList class="form-control" id="dayfrom" runat="server" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class=class="col-md-12">
                <div class="form-group input-group">
                  <div class="toc">
                    Licence Issue Date From:
                  </div>
                  <div class="row">
                    <div class="col-md-4">
                      <asp:DropdownList class="form-control" id="yearto" runat="server" />
                    </div>
                    <div class="col-md-5">
                      <asp:DropdownList class="form-control" id="monthto" runat="server" >
                        <asp:ListItem value="1">January</asp:ListItem>
                        <asp:ListItem value="2">February</asp:ListItem>
                        <asp:ListItem value="3">March</asp:ListItem>
                        <asp:ListItem value="4">April</asp:ListItem>
                        <asp:ListItem value="5">May</asp:ListItem>
                        <asp:ListItem value="6">June</asp:ListItem>
                        <asp:ListItem value="7">July</asp:ListItem>
                        <asp:ListItem value="8">August</asp:ListItem>
                        <asp:ListItem value="9">September</asp:ListItem>
                        <asp:ListItem value="10">October</asp:ListItem>
                        <asp:ListItem value="11">November</asp:ListItem>
                        <asp:ListItem value="12">December</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                    <div class="col-md-3">
                      <asp:DropdownList class="form-control" id="dayto" runat="server" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <div class="pull-right">
                <input type="reset" value="Clear All" class="btn btn-xl btn-rig" />
                &nbsp;
                <asp:Button class="btn btn-xl btn-rig pull-right" runat="server" text="Search" onclick="search_click" />
              </div>
            </div>
          </div>
        </div>
      </asp:Placeholder>

      <asp:Placeholder id="results" runat="server" visible="false">
        <div class="row">
          <div class="col-lg-12">
            <dob:resultslist id="result" runat="server" />
          </div>
        </div>
      </asp:Placeholder>
    </div>
  </section>
</asp:Content>
