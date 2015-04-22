/* Web Content Delivery
 *
 * Using 1.4.4 Garmin Communicator API Snapshot
 *
 * @author Yahui Jin yahui.jin[at]garmin.com 
 * @version 1.0
 */

/***** CLIENT CODE STARTS *****/

// Global variables
var esn;
var dataTypes;

// Create a call-back listener class
var listener = Class.create();

listener.prototype =
{
    // Global listener properties that we will be using
    initialize: function () {
        this.pluginStatus = $('pluginStatus');
        //this.apiUnlockStatus = $('apiUnlockStatus');
        this.deviceStatus = $('deviceStatus');
        this.downloadStatus = $('downloadStatus');
        this.status = $('status');
        this.unlockCode = $('unlockCode');
        this.deviceSelect = $('deviceSelect');
        this.fileSelect = $('fileSelect');
        this.findDevices = $('findDevices');
        this.downloadFile = $('downloadFile');
        this.obtainUnlock = $('obtainUnlock');
        this.progressBar = $('progressBar');
        this.progressBarDisplay = $('progressBarDisplay');
        this.control = null;
        this.initializeControl();

        this.findDevices.onclick = function () {
            this.findDevices.disabled = true;
            this.control.findDevices();
        } .bind(this),

        this.fileSelect.onchange = function () {
            this.setStatus(this.unlockCode, '');
            this.setStatus(this.downloadStatus, '');
            this.setStatus(this.status, '');
            this.hideProgressBar();
            this.downloadFile.disabled = true;
        } .bind(this)
    },

    // Display message when trying to find the device
    onStartFindDevices: function (json) {
        // Reset every field when finding a device
        this.resetAll();
        this.deviceSelect.disabled = true;
        this.resetOptions(this.deviceSelect);
        this.setStatus(this.deviceStatus, "Looking for connected Garmin devices...");
    },

    // After the search process is finished
    onFinishFindDevices: function (json) {
        this.findDevices.disabled = false;

        // Make sure there is at least 1 device connected            
        if (json.controller.getDevicesCount() > 0) {
            var devices = json.controller.getDevices();

            // Number of devices found
            this.setStatus(this.deviceStatus, "Devices Found: " + devices.length);
            // Populate dropdown list with every device found
            this.listDevices(devices);

            // Download Helper Function
            // This function will download to the device depending on the xml
            this.download = function (xml) {
                // Sets the download status
                this.showProgressBar();
                this.setStatus(this.downloadStatus, "Downloading... Please do not disconnect device...");

                // We download to the device depending on the xml file
                // The filename parameter that downloadToDevice needs can be ignored and will be removed in a later API release             
                try {
                    json.controller.downloadToDevice(xml, "");
                }
                catch (e) {
                    this.downloadFile.disabled = false;
                    this.setStatus(this.downloadStatus, "Download failed: " + e);
                }
            },

            // Download onlick Event            
            this.downloadFile.onclick = function () {
                this.disableAll();

                // Construct source and destination for the selected file, unl file, and gma file            
                var selectedIndex = this.fileSelect.selectedIndex;
                var path = fileInfo[selectedIndex][1];
                var fileName = fileInfo[selectedIndex][2];
                // GPI file name + appended cache-busting string.
                var source = fileInfo[selectedIndex][3] + '?' + new Date().getTime();
                var destination = path + "/" + fileName;
                //var unlSource = fileInfo[selectedIndex][4];
                var unlSource = fileInfo[selectedIndex][4] + esn;
                var unlFileName = fileName.substring(0, fileName.lastIndexOf('.')) + ".unl";
                var unlDestination = path + "/" + unlFileName;

                var gmaSource = fileInfo[selectedIndex][5] + esn;
                var gmaFileName = fileName.substring(0, fileName.lastIndexOf('.')) + ".gma";
                var gmaDestination = path + "/" + gmaFileName;
                //alert(gmaDestination);
                // Construct the xml with a list of sources and destinations
                var descriptionArray = ([source, destination, unlSource, unlDestination,
                                         gmaSource, gmaDestination]);
                var xml = Garmin.GpiUtil.buildMultipleDeviceDownloadsXML(descriptionArray);

                // Call our download helper function
                this.download(xml);
            } .bind(this)
        }
        else {
            this.setStatus(this.deviceStatus, "No Garmin devices found...");
        }
    },

    // This function is called when we are downloading
    onProgressWriteToDevice: function (json) {
        this.updateProgressBar(json.progress.getPercentage());
        this.setStatus(this.status, json.progress);
    },

    // This function is called when the download has completed
    onFinishWriteToDevice: function (json) {
        this.enableAll();
        this.hideProgressBar();
        this.setStatus(this.downloadStatus, "Download Successful!");
    },

    /***** INTERNAL FUNCTIONS *****/

    initializeControl: function () {
        try {
            this.control = new Garmin.DeviceControl();
            //alert(this.control.getPluginVersionString());
            // Check to make sure there is a plugin and get the version.
            if (this.control.isPluginInitialized()) {
                this.setStatus(this.pluginStatus, "Garmin Communicator plugin version " + this.control.getPluginVersionString() + " found!");
            }

            // Unlocks the plugin
            // Note: When going live, please provide your own website URL with the corresponding valid API key           
            if (this.control.unlock([controlDomain, controlUnlock])) {
                //this.setStatus(this.apiUnlockStatus, "The API has been unlocked successfully.");
                this.findDevices.disabled = false;
            }
            else {
                //this.setStatus(this.apiUnlockStatus, "The API was not unlocked successfully.");
            }

            this.control.checkForUpdates();
            this.control.register(this);
        }
        catch (e) {
            if (e.name == "OutOfDatePluginException" || e.name == "UpdatePluginException") {
                this.setStatus(this.pluginStatus, "Plugin out of date.  Please <a href=\"http://www.garmin.com/products/communicator\">download</a> the latest plugin.");
            }
            else if (e.name == "PluginNotInstalledException") {
                this.setStatus(this.pluginStatus, "Plugin not installed.  Please <a href=\"http://www.garmin.com/products/communicator\">download</a> the latest plugin.");
            }
            else if (e.name == "BrowserNotSupportedException") {
                this.setStatus(this.pluginStatus, "Browser not supported");
            }
            else {
                this.setStatus(this.pluginStatus, "Unhandled exception: " + e.name + ":" + e.message);
            }
        }
    },

    listDevices: function (devices) {
        // Goes through each device found
        for (var i = 0; i < devices.length; i++) {
            // Add the device to the dropdown list
            this.addOptions(this.deviceSelect, devices[i].getDisplayName(), devices[i].getNumber());

            // Get the current device
            if (devices[i].getNumber() == this.control.deviceNumber) {
                // Selects the current device in the dropdown
                this.deviceSelect.selectedIndex = i;
                // Gets and sets the data types that the device supports
                dataTypes = devices[i].getDeviceDataTypes().values();
                // Gets the esn number of the device
                // This will be used for the UnlockService to generate an unlock code
                esn = devices[i].getId();
                //document.getElementById('hiddenESN').value = esn;
                // Validate with our specified user defined data types
                this.validateDataType(dataTypes);
            }
        }

        this.deviceSelect.onchange = function () {
            // Reset all fields when a new device is selected in the dropdown
            this.resetAll();
            // Gets the new device
            var device = this.control.getDevices()[this.deviceSelect.value];
            // Sets the current device number
            // This will be used so we know which device we will be downloading to
            this.control.setDeviceNumber(this.deviceSelect.value);
            // Gets and sets the data types that the device supports
            dataTypes = device.getDeviceDataTypes().values();
            // Gets the esn number of the device
            // This will be used for the UnlockService to generate an unlock code
            esn = device.getId();
            document.getElementById('hiddenESN').value = esn;
            // Validate with our specified user defined data types
            this.validateDataType(dataTypes);
        } .bind(this)

        this.deviceSelect.disabled = false;
    },

    /***** HELPER FUNCTIONS *****/

    // This function is used to determine if data types are available on the device            
    validateDataType: function (dataTypes) {
        var selectedIndex = this.deviceSelect.selectedIndex;
        var displayName = this.deviceSelect.options[selectedIndex].text;

        // Due to the current way Garmin detects Removable Disk devices
        // The demonstration will not support download to any Removable Disk device
        if (!(displayName.length >= 14 && displayName.substring(0, 14) == "Removable Disk")) {
            // Make sure fileSelect dropdown is cleared before we proceed
            this.resetOptions(this.fileSelect);

            // Goes through each data type the user defined       
            for (var x = 0; x < fileInfo.length; x++) {
                // Goes through each data type the device supports
                for (var i = 0; i < dataTypes.length; i++) {
                    var text = false;

                    // Compare and see if there are any matches
                    if (dataTypes[i].getDisplayName() == fileInfo[x][0]) {
                        var dropDownDisplayName = fileInfo[x][5];
                        fileInfo[x][1] = dataTypes[i].getFilePath();

                        this.fileSelect.disabled = false;
                        this.obtainUnlock.disabled = false;
                        this.addOptions(this.fileSelect, dropDownDisplayName, x);

                        break;
                    }
                }
            }
        }
    },

    // Add options to dropdown
    addOptions: function (optionBox, optionText, optionValue) {
        var optn = document.createElement("option");
        optn.text = optionText;
        optn.value = optionValue;
        optionBox.options.add(optn);
    },

    // Clear everything in dropdown
    resetOptions: function (optionBox) {
        for (var i = optionBox.options.length - 1; i >= 0; i--) {
            optionBox.remove(i);
        }
    },

    // Reset everything back to default    
    resetAll: function () {
        this.fileSelect.disabled = true;
        this.obtainUnlock.disabled = true;
        //this.downloadFile.disabled = true;
        this.resetOptions(this.fileSelect);
        this.setStatus(this.status, '');
        this.setStatus(this.downloadStatus, '');
        this.setStatus(this.unlockCode, '');
    },

    enableAll: function () {
        this.downloadFile.disabled = false;
        this.obtainUnlock.disabled = false;
        this.fileSelect.disabled = false;
        this.findDevices.disabled = false;
        this.deviceSelect.disabled = false;
    },

    disableAll: function () {
        this.downloadFile.disabled = true;
        this.obtainUnlock.disabled = true;
        this.fileSelect.disabled = true;
        this.findDevices.disabled = true;
        this.deviceSelect.disabled = true;
    },

    showProgressBar: function () {
        this.progressBar.style.display = '';
    },

    hideProgressBar: function () {
        this.progressBar.style.display = 'none';
    },

    updateProgressBar: function (value) {
        var percent = (value <= 100) ? value : 100;
        this.progressBarDisplay.style.width = percent + "%";
    },

    setStatus: function (element, statusText) {
        element.innerHTML = statusText;
    }
};