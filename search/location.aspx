<%@ Page
    Language="C#"
    MasterPageFile="/master/page.master"
    Title="Rig Locator Search By Location"
    CodeFile="location.cs"
    Inherits="LocationSearch"
    AutoEventWireup="true"
    %>
<%@ Register Src="/search/resultlist.ascx" TagName="resultslist" TagPrefix="riglocator" %>

<asp:Content runat="server" ContentPlaceholderId="page_content">
  <section class="mainContent">
    <div class="container content">
      <div class="row">
        <div class="col-lg-12">
          <div class="search-bar">
            <h1>Rig Location Search</h1>
            <ul>
              <li><a href="/search/location" class="btn btn-xl btn-rig full-width selected">By Location</a></li>
              <li><a href="/search/operator" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/search/contractor" class="btn btn-xl btn-rig full-width">By Contractor</a></li>
              <li class="pull-right"> </li>
            </ul>
          </div>
          <div id="search" runat="server">
            <div class="col-md-3">
              <h4>Province/Region</h4>
              <p id="noprovincemsg" class="errmsg" runat="server" visible="false"> Select a province! </p>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group input-group" style="margin-bottom: 25px;">
                    <asp:ListBox runat="server" id="province" class="form-control" rows="9">
                      <asp:ListItem value="AB">Alberta</asp:ListItem>
                      <asp:ListItem value="SK">Saskatchewan</asp:ListItem>
                      <asp:ListItem value="BC">British Columbia</asp:ListItem>
                      <asp:ListItem value="MB">Manitoba</asp:ListItem>
                      <asp:ListItem value="EC">Eastern Canada</asp:ListItem>
                      <asp:ListItem value="NC">Northern Canada</asp:ListItem>
                    </asp:ListBox>
                  </div>
                  <asp:Button class="btn btn-xl btn-rig" runat="Server" text="Search Province" onClick="search_province_click" OnClientClick="_gaq.push(['_trackEvent', 'Location Search', 'Search Province']);"/>
                </div>
              </div>
            </div>
            <div class="col-md-5 extra-padding">
              <h4>Township/Range</h4>
              <p id="nodlsmsg" class="errmsg" runat="server" visible="false"> Select a township, range and meridian! </p>
              <div class="subbold">Township</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromTownship" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
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
                      <asp:ListItem>32</asp:ListItem>
                      <asp:ListItem>33</asp:ListItem>
                      <asp:ListItem>34</asp:ListItem>
                      <asp:ListItem>35</asp:ListItem>
                      <asp:ListItem>36</asp:ListItem>
                      <asp:ListItem>37</asp:ListItem>
                      <asp:ListItem>38</asp:ListItem>
                      <asp:ListItem>39</asp:ListItem>
                      <asp:ListItem>40</asp:ListItem>
                      <asp:ListItem>41</asp:ListItem>
                      <asp:ListItem>42</asp:ListItem>
                      <asp:ListItem>43</asp:ListItem>
                      <asp:ListItem>44</asp:ListItem>
                      <asp:ListItem>45</asp:ListItem>
                      <asp:ListItem>46</asp:ListItem>
                      <asp:ListItem>47</asp:ListItem>
                      <asp:ListItem>48</asp:ListItem>
                      <asp:ListItem>49</asp:ListItem>
                      <asp:ListItem>50</asp:ListItem>
                      <asp:ListItem>51</asp:ListItem>
                      <asp:ListItem>52</asp:ListItem>
                      <asp:ListItem>53</asp:ListItem>
                      <asp:ListItem>54</asp:ListItem>
                      <asp:ListItem>55</asp:ListItem>
                      <asp:ListItem>56</asp:ListItem>
                      <asp:ListItem>57</asp:ListItem>
                      <asp:ListItem>58</asp:ListItem>
                      <asp:ListItem>59</asp:ListItem>
                      <asp:ListItem>60</asp:ListItem>
                      <asp:ListItem>61</asp:ListItem>
                      <asp:ListItem>62</asp:ListItem>
                      <asp:ListItem>63</asp:ListItem>
                      <asp:ListItem>64</asp:ListItem>
                      <asp:ListItem>65</asp:ListItem>
                      <asp:ListItem>66</asp:ListItem>
                      <asp:ListItem>67</asp:ListItem>
                      <asp:ListItem>68</asp:ListItem>
                      <asp:ListItem>69</asp:ListItem>
                      <asp:ListItem>70</asp:ListItem>
                      <asp:ListItem>71</asp:ListItem>
                      <asp:ListItem>72</asp:ListItem>
                      <asp:ListItem>73</asp:ListItem>
                      <asp:ListItem>74</asp:ListItem>
                      <asp:ListItem>75</asp:ListItem>
                      <asp:ListItem>76</asp:ListItem>
                      <asp:ListItem>77</asp:ListItem>
                      <asp:ListItem>78</asp:ListItem>
                      <asp:ListItem>79</asp:ListItem>
                      <asp:ListItem>80</asp:ListItem>
                      <asp:ListItem>81</asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>83</asp:ListItem>
                      <asp:ListItem>84</asp:ListItem>
                      <asp:ListItem>85</asp:ListItem>
                      <asp:ListItem>86</asp:ListItem>
                      <asp:ListItem>87</asp:ListItem>
                      <asp:ListItem>88</asp:ListItem>
                      <asp:ListItem>89</asp:ListItem>
                      <asp:ListItem>90</asp:ListItem>
                      <asp:ListItem>91</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                      <asp:ListItem>95</asp:ListItem>
                      <asp:ListItem>96</asp:ListItem>
                      <asp:ListItem>97</asp:ListItem>
                      <asp:ListItem>98</asp:ListItem>
                      <asp:ListItem>99</asp:ListItem>
                      <asp:ListItem>100</asp:ListItem>
                      <asp:ListItem>101</asp:ListItem>
                      <asp:ListItem>102</asp:ListItem>
                      <asp:ListItem>103</asp:ListItem>
                      <asp:ListItem>104</asp:ListItem>
                      <asp:ListItem>105</asp:ListItem>
                      <asp:ListItem>106</asp:ListItem>
                      <asp:ListItem>107</asp:ListItem>
                      <asp:ListItem>108</asp:ListItem>
                      <asp:ListItem>109</asp:ListItem>
                      <asp:ListItem>110</asp:ListItem>
                      <asp:ListItem>111</asp:ListItem>
                      <asp:ListItem>112</asp:ListItem>
                      <asp:ListItem>113</asp:ListItem>
                      <asp:ListItem>114</asp:ListItem>
                      <asp:ListItem>115</asp:ListItem>
                      <asp:ListItem>116</asp:ListItem>
                      <asp:ListItem>117</asp:ListItem>
                      <asp:ListItem>118</asp:ListItem>
                      <asp:ListItem>119</asp:ListItem>
                      <asp:ListItem>120</asp:ListItem>
                      <asp:ListItem>121</asp:ListItem>
                      <asp:ListItem>122</asp:ListItem>
                      <asp:ListItem>123</asp:ListItem>
                      <asp:ListItem>124</asp:ListItem>
                      <asp:ListItem>125</asp:ListItem>
                      <asp:ListItem>126</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toTownship" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
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
                      <asp:ListItem>32</asp:ListItem>
                      <asp:ListItem>33</asp:ListItem>
                      <asp:ListItem>34</asp:ListItem>
                      <asp:ListItem>35</asp:ListItem>
                      <asp:ListItem>36</asp:ListItem>
                      <asp:ListItem>37</asp:ListItem>
                      <asp:ListItem>38</asp:ListItem>
                      <asp:ListItem>39</asp:ListItem>
                      <asp:ListItem>40</asp:ListItem>
                      <asp:ListItem>41</asp:ListItem>
                      <asp:ListItem>42</asp:ListItem>
                      <asp:ListItem>43</asp:ListItem>
                      <asp:ListItem>44</asp:ListItem>
                      <asp:ListItem>45</asp:ListItem>
                      <asp:ListItem>46</asp:ListItem>
                      <asp:ListItem>47</asp:ListItem>
                      <asp:ListItem>48</asp:ListItem>
                      <asp:ListItem>49</asp:ListItem>
                      <asp:ListItem>50</asp:ListItem>
                      <asp:ListItem>51</asp:ListItem>
                      <asp:ListItem>52</asp:ListItem>
                      <asp:ListItem>53</asp:ListItem>
                      <asp:ListItem>54</asp:ListItem>
                      <asp:ListItem>55</asp:ListItem>
                      <asp:ListItem>56</asp:ListItem>
                      <asp:ListItem>57</asp:ListItem>
                      <asp:ListItem>58</asp:ListItem>
                      <asp:ListItem>59</asp:ListItem>
                      <asp:ListItem>60</asp:ListItem>
                      <asp:ListItem>61</asp:ListItem>
                      <asp:ListItem>62</asp:ListItem>
                      <asp:ListItem>63</asp:ListItem>
                      <asp:ListItem>64</asp:ListItem>
                      <asp:ListItem>65</asp:ListItem>
                      <asp:ListItem>66</asp:ListItem>
                      <asp:ListItem>67</asp:ListItem>
                      <asp:ListItem>68</asp:ListItem>
                      <asp:ListItem>69</asp:ListItem>
                      <asp:ListItem>70</asp:ListItem>
                      <asp:ListItem>71</asp:ListItem>
                      <asp:ListItem>72</asp:ListItem>
                      <asp:ListItem>73</asp:ListItem>
                      <asp:ListItem>74</asp:ListItem>
                      <asp:ListItem>75</asp:ListItem>
                      <asp:ListItem>76</asp:ListItem>
                      <asp:ListItem>77</asp:ListItem>
                      <asp:ListItem>78</asp:ListItem>
                      <asp:ListItem>79</asp:ListItem>
                      <asp:ListItem>80</asp:ListItem>
                      <asp:ListItem>81</asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>83</asp:ListItem>
                      <asp:ListItem>84</asp:ListItem>
                      <asp:ListItem>85</asp:ListItem>
                      <asp:ListItem>86</asp:ListItem>
                      <asp:ListItem>87</asp:ListItem>
                      <asp:ListItem>88</asp:ListItem>
                      <asp:ListItem>89</asp:ListItem>
                      <asp:ListItem>90</asp:ListItem>
                      <asp:ListItem>91</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                      <asp:ListItem>95</asp:ListItem>
                      <asp:ListItem>96</asp:ListItem>
                      <asp:ListItem>97</asp:ListItem>
                      <asp:ListItem>98</asp:ListItem>
                      <asp:ListItem>99</asp:ListItem>
                      <asp:ListItem>100</asp:ListItem>
                      <asp:ListItem>101</asp:ListItem>
                      <asp:ListItem>102</asp:ListItem>
                      <asp:ListItem>103</asp:ListItem>
                      <asp:ListItem>104</asp:ListItem>
                      <asp:ListItem>105</asp:ListItem>
                      <asp:ListItem>106</asp:ListItem>
                      <asp:ListItem>107</asp:ListItem>
                      <asp:ListItem>108</asp:ListItem>
                      <asp:ListItem>109</asp:ListItem>
                      <asp:ListItem>110</asp:ListItem>
                      <asp:ListItem>111</asp:ListItem>
                      <asp:ListItem>112</asp:ListItem>
                      <asp:ListItem>113</asp:ListItem>
                      <asp:ListItem>114</asp:ListItem>
                      <asp:ListItem>115</asp:ListItem>
                      <asp:ListItem>116</asp:ListItem>
                      <asp:ListItem>117</asp:ListItem>
                      <asp:ListItem>118</asp:ListItem>
                      <asp:ListItem>119</asp:ListItem>
                      <asp:ListItem>120</asp:ListItem>
                      <asp:ListItem>121</asp:ListItem>
                      <asp:ListItem>122</asp:ListItem>
                      <asp:ListItem>123</asp:ListItem>
                      <asp:ListItem>124</asp:ListItem>
                      <asp:ListItem>125</asp:ListItem>
                      <asp:ListItem>126</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <div class="subbold">Range</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromRange" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
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
                      <asp:ListItem>32</asp:ListItem>
                      <asp:ListItem>33</asp:ListItem>
                      <asp:ListItem>34</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toRange" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
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
                      <asp:ListItem>32</asp:ListItem>
                      <asp:ListItem>33</asp:ListItem>
                      <asp:ListItem>34</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <div class="subbold">Meridian</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromMeridian" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
                      <asp:ListItem>1</asp:ListItem>
                      <asp:ListItem>2</asp:ListItem>
                      <asp:ListItem>3</asp:ListItem>
                      <asp:ListItem>4</asp:ListItem>
                      <asp:ListItem>5</asp:ListItem>
                      <asp:ListItem>6</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toMeridian" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
                      <asp:ListItem>1</asp:ListItem>
                      <asp:ListItem>2</asp:ListItem>
                      <asp:ListItem>3</asp:ListItem>
                      <asp:ListItem>4</asp:ListItem>
                      <asp:ListItem>5</asp:ListItem>
                      <asp:ListItem>6</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <asp:Button class="btn btn-xl btn-rig" runat="Server" text="Search Township/Range" onclick="search_dls_click" OnClientClick="_gaq.push(['_trackEvent', 'Location Search', 'Search Township/Range']);"/>
            </div>
            <div class="col-md-4">
              <h4>BC NTS</h4>
              <p id="nontsmsg" class="errmsg" runat="server" visible="false"> Select a quad, map and map sheet! </p>
              <div class="subbold">Quad</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromMapUnit" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toMapUnit" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <div class="subbold">Map</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromMapUnitSub" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
                      <asp:ListItem>A</asp:ListItem>
                      <asp:ListItem>B</asp:ListItem>
                      <asp:ListItem>C</asp:ListItem>
                      <asp:ListItem>D</asp:ListItem>
                      <asp:ListItem>E</asp:ListItem>
                      <asp:ListItem>F</asp:ListItem>
                      <asp:ListItem>G</asp:ListItem>
                      <asp:ListItem>H</asp:ListItem>
                      <asp:ListItem>I</asp:ListItem>
                      <asp:ListItem>J</asp:ListItem>
                      <asp:ListItem>K</asp:ListItem>
                      <asp:ListItem>L</asp:ListItem>
                      <asp:ListItem>M</asp:ListItem>
                      <asp:ListItem>N</asp:ListItem>
                      <asp:ListItem>O</asp:ListItem>
                      <asp:ListItem>P</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toMapUnitSub" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
                      <asp:ListItem>A</asp:ListItem>
                      <asp:ListItem>B</asp:ListItem>
                      <asp:ListItem>C</asp:ListItem>
                      <asp:ListItem>D</asp:ListItem>
                      <asp:ListItem>E</asp:ListItem>
                      <asp:ListItem>F</asp:ListItem>
                      <asp:ListItem>G</asp:ListItem>
                      <asp:ListItem>H</asp:ListItem>
                      <asp:ListItem>I</asp:ListItem>
                      <asp:ListItem>J</asp:ListItem>
                      <asp:ListItem>K</asp:ListItem>
                      <asp:ListItem>L</asp:ListItem>
                      <asp:ListItem>M</asp:ListItem>
                      <asp:ListItem>N</asp:ListItem>
                      <asp:ListItem>O</asp:ListItem>
                      <asp:ListItem>P</asp:ListItem>
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <div class="subbold">Sheet</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="fromMapSheet" class="form-control">
                      <asp:ListItem>From</asp:ListItem>
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
                    </asp:DropDownList>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group input-group">
                    <asp:DropDownList runat="server" id="toMapSheet" class="form-control">
                      <asp:ListItem>To</asp:ListItem>
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
                    </asp:DropDownList>
                  </div>
                </div>
              </div>
              <asp:Button class="btn btn-xl btn-rig" runat="Server" text="Search BC NTS"  onclick="search_nts_click"  OnClientClick="_gaq.push(['_trackEvent', 'Location Search', 'Search BC NTS']);"/>
              <input type="reset" value="Clear All" class="btn btn-xl btn-rig full-width pull-right" onclick="_gaq.push(['_trackEvent', 'Location Search', 'Clear All']);" />
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
