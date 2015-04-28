<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Search By Operator"
    CodeFile="operator.cs"
    Inherits="OperatorSearch"
    AutoEventWireup="true"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
    <section class="mainContent">
        <div id="search" runat="server">
            <div class="container content">
                <div class="row">
                    <div class="col-md-10">
                        <div class="row search-bar">
                            <h1>Drilling Rig Search</h1>
                            <ul>
                                <li><a href="/search/operator" class="btn btn-xl btn-rig selected">By Operator</a></li>
                                <li><a href="/search/contractor" class="btn btn-xl btn-rig">By Contractor</a></li>
                                <li><a href="/search/location" class="btn btn-xl btn-rig">By Location</a></li>
                            </ul>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 nopadding">
                                <h3>Select Criteria</h3>
                            </div>
                        </div>
                        <div class="row">
                            <p id="noselectionmsg" class="errmsg" runat="server" visible="false"> Select an operator! </p>
                            <div class="col-md-4">
                                <div class="toc">Operator</div>
                                <div class="form-group input-group">
                                    <asp:DropDownList id="op" class="form-control" runat="server" />
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
                            <div class="col-md-3">
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
                        </div>
                        <div class="row">
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
                        </div>
                        <div class="row">
                            <div class="col-md-3 nopadding">
                                <asp:Button class="btn btn-xl btn-rig" runat="server" text="SEARCH" onclick="search_click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 pull-right">
                        <div class="row">
                            <div class="skyscrapper-ad"><img src="/img/skyscrapper-placeholder.jpg" alt="advertisment"/> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="results" runat="server" visible="false">
            <div class="row">
                <h1>Drilling Rig Search Results</h1>
                <ul>
                    <li><a href="/search/operator">By Operator</a></li>
                    <li><a href="/search/contractor">By Contractor</a></li>
                    <li><a href="/search/location">By Location</a></li>
                </ul>
            </div>
            <div class="row">
                <riglocator:resultslist id="result" runat="server" />
            </div>
        </div>
    </section>
</asp:Content>
