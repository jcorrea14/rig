<%@ Page Title="Garmin Download | Rig Locator"
         Language="C#"
         CodeFile="index.aspx.cs"
         Inherits="index"
         MasterPageFile="site.master" %>
<%@ Register Src="/common/nauth/webauth.ascx" TagName="webauth" TagPrefix="jwn" %>
<asp:Content ContentPlaceHolderID="page_content" runat="server">
  <jwn:webauth id="auth"
               runat="server"
               Publication="RIG_EXPORT"
               Redirect="/gpi/verify.aspx"
               Product="Rig Locator" />
  <form runat="server"></form>
  <h1>
    Rig Locator for Garmin!
  </h1>
  <div>
    <ul>
      <li>Connect your Garmin GPS to your computer with the USB cable provided
      <li>Click on the "Find Devices" button below to retrieve and select the
      device*</li>
      <li>Click on "Obtain Unlock Code" to get unlock code for your device</li>
      <li>Click on "Download Files" to obtain the Rig Locator POI file</li>
    </ul>
    <div id="GarminTools">
      <select name="deviceSelect" id="deviceSelect" disabled="disabled">
      </select>
      <input type="button" value="Find Devices" id="findDevices" />
      <input type="button" id="obtainUnlock" value="Obtain Unlock Code"
             onclick="getUnlockCode()" disabled="disabled" />
      <input type="button" id="downloadFile"
             value="Download Files" disabled="disabled" />
      <div id="downloadStatus"></div>
      <div id="status"></div>
      <div id="progressBar" style="display: none; text-align: center;">
        <div id="progressWrapper" style="border: solid 1px black; width: 400px; margin:  auto;">
          <div id="progressBarDisplay" style="background-color: #1111cc; height: 1em;"></div>
        </div>
      </div>
      <div id="unlockCode"></div>
      <p class="note">
        *If this is your first download, you'll be asked to install the Garmin
        Communicator Plugin.
      </p>
      <div id="pluginStatus" ></div>
      <div id="deviceStatus" style="visibility: hidden;"></div>
      <select name="fileSelect" id="fileSelect" style="visibility: hidden;"
              disabled="disabled">
      </select>
    </div>
  </div>
  <p>
    Compatible GPS devices: Garmin nüvi series, Zumo series, StreetPilot
    7200, GPSMap 60CSx or CSx, GPSMap 76CSX or any other Garmin hand-held
    unit with the letter "x" in the model name (ex. HCx)
  </p>
  <p>
    <a href="help/rig-locator-garmin.pdf" target="_blank">Download instructions (PDF)</a>
  </p>
</asp:Content>

<asp:Content ContentPlaceHolderID="page_js" runat="server">
  <script type="text/javascript" src="scripts/prototype/prototype.js"></script>
  <script type="text/javascript" src="scripts/util/Util-Broadcaster.js"></script>
  <script type="text/javascript" src="scripts/util/Util-BrowserDetect.js"></script>
  <script type="text/javascript" src="scripts/util/Util-DateTimeFormat.js"></script>
  <script type="text/javascript" src="scripts/util/Util-PluginDetect.js"></script>
  <script type="text/javascript" src="scripts/util/Util-XmlConverter.js"></script>
  <script type="text/javascript" src="scripts/device/GarminObjectGenerator.js"></script>
  <script type="text/javascript" src="scripts/device/GarminPluginUtils.js"></script>
  <script type="text/javascript" src="scripts/device/GarminDevice.js"></script>
  <script type="text/javascript" src="scripts/device/GarminDevicePlugin.js"></script>
  <script type="text/javascript" src="scripts/device/GarminDeviceControl.js"></script>
  <script type="text/javascript">
    /***** USER DEFINIED VARIABLES *****/
    var controlDomain = '<%= ControlDomain %>';
    var controlUnlock = '<%= ControlUnlock %>';

    // FileInfo Array
    // Add to this array if you want to support multiple files
    //
    // 0: DataType Name - The data type of the file, e.g. VCTVoices
    // 1: Device Path - This will automatically be found so please ignore
    // 2: File Name - The file name that will be on the device after the download
    // 3: Source - The source location
    // 4: UNLSource - The UNL source location
    // 5: GMASource - The GMA source location
    // 6: Dropdown DisplayName - The name to display in the dropdown menu

    var fileInfo = new Array(
      ['CustomPOI',
       'Device Path',
       '<%= FileName %>',
       '<%= Source %>',
       '<%= UnlockSource %>',
       '<%= GMAUnlockSource %>',
       'GPI File']);
  </script>
  <script type="text/javascript" src="scripts/ContentDelivery.js"></script>
  <script type="text/javascript">
    // AJAX call to C# code to get unlock code
    function getUnlockCode() {
      $('unlockCode').innerHTML = "Obtaining unlock code...";
      gpi_index_aspx.GetUnlockCode(esn, getUnlockCode_CallBack);
    }

    // AJAX callback function, response.value has the unlock code
    function getUnlockCode_CallBack(response) {
      if (response.value == '' || response.value == null)
        $('unlockCode').innerHTML = "Unable to obtain unlock code...";
      else {
        $('unlockCode').innerHTML = "Unlock code obtained, click on 'Download Files'";
        $('downloadFile').disabled = false;
      }
    }                  
  </script>
  <script type="text/javascript">
    var display = new listener();
  </script>
</asp:Content>

