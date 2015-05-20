<%@ Page
Language="C#"
MasterPageFile="/master/page.master"
AutoEventWireup="true"
CodeFile="location.aspx.cs"
Inherits="LicenceLoc"
Title="Rig Locator | Search Well Licences" %>
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
              <li><a href="/licence/operator.aspx" class="btn btn-xl btn-rig full-width">By Operator</a></li>
              <li><a href="/licence/location.aspx" class="btn btn-xl btn-rig full-width selected">By Location</a></li>
              <li class="pull-right"> </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="dob-search" id="form" runat="server">
            <h2>Location</h2>
            <div id="errMsg" runat="server" style="color: red;" />
            <section class="h-border">
              <div>
                <asp:RadioButton runat="server" id="dls" Checked="True"  GroupName="sArea" />
                Western Canada DLS (specify township, range and meridian limits)
              </div>
              <table>
                <tr>
                  <td width="25%"><br /></td>
                  <td width="25%">
                    <div style="text-align: center;">
                      Township
                    </div>
                  </td>

                  <td width="25%">
                    <div style="text-align: center;">
                      Range
                    </div>
                  </td>

                  <td width="25%">
                    <div align="center">
                      Meridian
                    </div>
                  </td>
                </tr>

                <tr>
                  <td>
                    <div >
                      From:
                    </div>
                  </td>
                  <td align="center">
                    <asp:DropdownList id="fromTownship" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="fromRange" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="fromMeridian" runat="server">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>1</asp:ListItem>
                      <asp:ListItem>2</asp:ListItem>
                      <asp:ListItem>3</asp:ListItem>
                      <asp:ListItem>4</asp:ListItem>
                      <asp:ListItem>5</asp:ListItem>
                      <asp:ListItem>6</asp:ListItem>
                    </asp:DropdownList>
                  </td>
                </tr>

                <tr>
                  <td>
                    <div >
                      To:
                    </div>
                  </td>
                  <td align="center">
                    <asp:DropdownList id="toTownship" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="toRange" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="toMeridian" runat="server">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>1</asp:ListItem>
                      <asp:ListItem>2</asp:ListItem>
                      <asp:ListItem>3</asp:ListItem>
                      <asp:ListItem>4</asp:ListItem>
                      <asp:ListItem>5</asp:ListItem>
                      <asp:ListItem>6</asp:ListItem>
                    </asp:DropdownList>
                  </td>
                </tr>
              </table>

              <div>
                <asp:RadioButton runat="server" id="nts" GroupName="sArea" />
                British Columnbia NTS (specify quad, map and map sheet limits)
              </div>
              <table cellspacing="2" cellpadding="0" border="0" width="300">
                <tr>
                  <td width="25%"><br /></td>

                  <td width="25%">
                    <div align="center">
                      Quad
                    </div>
                  </td>

                  <td width="25%">
                    <div align="center">
                      Map
                    </div>
                  </td>

                  <td width="25%">
                    <div align="center">
                      Sheet
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div >
                      From:
                    </div>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="fromMapUnit" runat="server">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="fromMapUnitSub" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="fromMapSheet" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>
                </tr>

                <tr>
                  <td>
                    <div >
                      To:
                    </div>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="toMapUnit" runat="server">
                      <asp:ListItem></asp:ListItem>
                      <asp:ListItem>82</asp:ListItem>
                      <asp:ListItem>92</asp:ListItem>
                      <asp:ListItem>93</asp:ListItem>
                      <asp:ListItem>94</asp:ListItem>
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="toMapUnitSub" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>

                  <td align="center">
                    <asp:DropdownList id="toMapSheet" runat="server">
                      <asp:ListItem></asp:ListItem>
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
                    </asp:DropdownList>
                  </td>
                </tr>
              </table>

              <div>
                <asp:RadioButton id="ec" GroupName="sArea" runat="server"/>
                Eastern Canada
              </div>

              <div>
                <asp:RadioButton id="nc" GroupName="sArea" runat="server"/>
                Northern Canada
              </div>
            </section>

            <section class="h-border">
              
              <h2>Additional Criteria</h2>
              <table>
                <tr>
                  <td style="width: 25%">
                    <div style="text-align: center;">
                      Well Type
                    </div>
                  </td>
                  <td style="width: 25%">
                    <div style="text-align: center;">
                      Projected Depth
                    </div>
                  </td>
                  <td style="width: 25%">
                    <div style="text-align: center;">
                      Objective
                    </div>
                  </td>
                  <td style="width: 25%">
                    <div style="text-align: center;">
                      Well Class
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="width: 25%">
                    <div>
                      <asp:DropdownList id="type" runat="server" >
                        <asp:ListItem value="ANY" Selected="True">&lt;ANY&gt;</asp:ListItem>
                        <asp:ListItem value="D">Directional</asp:ListItem>
                        <asp:ListItem value="H">Horizontal</asp:ListItem>
                        <asp:ListItem value="R">Vertical</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                  </td>
                  <td style="width: 25%">
                    <div>
                      <asp:DropdownList id="depth" runat="server" >
                        <asp:ListItem value="ANY" Selected="True">&lt;ANY&gt;</asp:ListItem>
                        <asp:ListItem value="1">0 - 950 M</asp:ListItem>
                        <asp:ListItem value="2">951 - 1850 M</asp:ListItem>
                        <asp:ListItem value="3">1851 - 2450 M</asp:ListItem>
                        <asp:ListItem value="4">2451 - 3050 M</asp:ListItem>
                        <asp:ListItem value="5">3051 - 3700 M</asp:ListItem>
                        <asp:ListItem value="6">3701 - 4600 M</asp:ListItem>
                        <asp:ListItem value="7">4601 M +</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                  </td>

                  <td style="width: 25%">
                    <div>
                      <asp:DropdownList id="objective" runat="server" >
                        <asp:ListItem value="ANY" Selected="True">&lt;ANY&gt;</asp:ListItem>
                        <asp:ListItem value="BIT">BIT</asp:ListItem>
                        <asp:ListItem value="CBM">CBM</asp:ListItem>
                        <asp:ListItem value="GAS">GAS</asp:ListItem>
                        <asp:ListItem value="OIL">OIL</asp:ListItem>
                        <asp:ListItem value="SVC">SVC</asp:ListItem>
                      </asp:DropdownList>
                    </div>
                  </td>

                  <td style="width: 25%">
                    <div>
                      <asp:DropdownList id="wellclass" runat="server" >
                        <asp:ListItem value="ANY" Selected="True">&lt;ANY&gt;</asp:ListItem>
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
                  </td>
                </tr>
              </table>
            </section>

            <section class="h-border">
              <h2>Licence Issue Date</h2>
              <table>
                <tr>
                  <td colspan="3">
                    From:
                  </td>
                  <td colspan="3">
                    To:
                  </td>
                </tr>
                <tr>
                  <td style="width: 15%">
                    <div>
                      <asp:DropdownList id="yearfrom" runat="server" />
                    </div>
                  </td>
                  <td style="width: 20%">
                    <div>
                      <asp:DropdownList id="monthfrom" runat="server" >
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
                  </td>
                  <td style="width: 15%">
                    <div>
                      <asp:DropdownList id="dayfrom" runat="server" >
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
                  </td>
                  <td style="width: 15%">
                    <div>
                      <asp:DropdownList id="yearto" runat="server" />
                    </div>
                  </td>
                  <td style="width: 20%">
                    <div>
                      <asp:DropdownList id="monthto" runat="server" >
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
                  </td>
                  <td style="width: 15%">
                    <div>
                      <asp:DropdownList id="dayto" runat="server" >
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
                  </td>
                </tr>
              </table>
            </section>
            <p>
              <asp:Button class="btn" runat="server" id="search" Text="Search"
                          onclick="search_click" />
            </p>
          </div>
          <div id="results" runat="server" visible="false">
            <p>Results for <%= Criteria %></p>
            <dob:resultslist id="result" runat="server" />
          </div>
        </div>
      </div>
    </div>
  </section>
</asp:Content>
