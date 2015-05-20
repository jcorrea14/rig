<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Search By Contractor"
    CodeFile="contractor.cs"
    Inherits="ContractorSearch"
    AutoEventWireup="true"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Rig Contractor Search</h1>
            <ul>
              <li><a href="/search/location" class="btn btn-xl btn-rig full-width">By Location</a></li>
              <li><a href="/search/operator" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/search/contractor" class="btn btn-xl btn-rig full-width selected">By Contractor</a></li>
            </ul>
          </div>
          <div id="search" runat="server">
            <div class="col-lg-12 nopadding">
              <h3>Select Criteria</h3>
            </div>
            <p id="noselectionmsg" class="errmsg" runat="server" visible="false"> Select a contractor! </p>
            <div class="col-md-4">
              <div class="toc">Contractor</div>
              <div class="form-group input-group">
                <asp:DropDownList id="contractor" class="form-control" runat="server" />
              </div>
            </div>
            <div class="col-md-4">
              <div class="toc">Province/Region</div>
              <div class="form-group input-group">
                <asp:DropDownList id="province" class="form-control" runat="server">
                  <asp:ListItem runat="server" value="" selected="true" >[ALL]</asp:ListItem>
                  <asp:ListItem runat="server" value="AB">Alberta</asp:ListItem>
                  <asp:ListItem runat="server" value="SK">Saskatchewan</asp:ListItem>
                  <asp:ListItem runat="server" value="BC">British Columbia</asp:ListItem>
                  <asp:ListItem runat="server" value="MB">Manitoba</asp:ListItem>
                  <asp:ListItem runat="server" value="EC">Eastern Canada</asp:ListItem>
                  <asp:ListItem runat="server" value="NC">Northern Canada</asp:ListItem>
                </asp:DropDownList>
              </div>
            </div>
            <div class="col-md-4">
              <div class="toc">Select Rig Status</div>
              <div class="form-group input-group">
                <asp:DropDownList id="status" class="form-control" runat="server">
                  <asp:ListItem runat="server" value="all" selected="true" text="[ALL]" />
                  <asp:ListItem runat="server" value="active" text="All active" />
                  <asp:ListItem runat="server" value="DRILL" text="Drilling" />
                  <asp:ListItem runat="server" value="MIR" text="Moving in rig" />
                  <asp:ListItem runat="server" value="DOWN" text="Down" />
                </asp:DropDownList>
              </div>
            </div>
            <div class="col-lg-12 nopadding">
              <h3>Select a Sort Option</h3>
              <div class="col-md-3">
                <asp:RadioButton runat="server" id="locationsort"
                               text="Location" groupName="sort" checked="true" />
                <br />
                <asp:RadioButton runat="server" id="operatorsort"
                               text="Operator" groupName="sort" />
                <br />
              </div>
              <div class="col-md-3">
                <asp:RadioButton runat="server" id="rigsort"
                               text="Contractor and Rig" groupName="sort" />
                <br />
                <asp:RadioButton runat="server" id="areasort"
                               text="Area Name" groupName="sort" />
                <br />
              </div>
              <div class="col-md-3">
                <asp:RadioButton runat="server" id="spudsort"
                               text="Spud Date" groupName="sort" />
                <br />
                <asp:RadioButton runat="server" id="classsort"
                               text="Well Class" groupName="sort" />
                <br />
              </div>
              <div class="col-md-3">
                <asp:RadioButton runat="server" id="statussort"
                               text="Rig Status" groupName="sort" />
                <br />
              </div>
            </div>
            <div class="col-md-4 pull-right">
              <div class="pull-right">
                
               
                <input type="reset" value="Clear All" class="btn btn-xl btn-rig" />
                 &nbsp;
                 <asp:Button class="btn btn-xl btn-rig pull-right" runat="server" text="Search" onclick="search_click" />
              </div>
            </div>
          </div>
        </div>
        <div id="results" runat="server" visible="false">
          <div class="col-lg-12">
            <riglocator:resultslist id="result" runat="server" />
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
