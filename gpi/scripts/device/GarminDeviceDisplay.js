if (Garmin == undefined) var Garmin = {};
/** Copyright © 2007 Garmin Ltd. or its subsidiaries.
 *
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @fileoverview Garmin.DeviceDisplay is a high-level UI widget for talking 
 * with Garmin Devices.
 * 
 * @author Michael Bina michael.bina.at.garmin.com
 * @version 1.0
 */
/** Provides the easiest avenue for getting a working instance of the plug-in onto your page.
 * Generates the UI elements and places them on the page.
 *
 * @class Garmin.DeviceDisplay
 * @constructor 
 * @param mainElement - (String) id of the element in which to generate the contents
 * 					(can also be a reference to the dom element itself).
 * @param options - (Object) Object with options (see {@link Garmin.DeviceDisplayDefaultOptions} for descriptions of possible options).
 * 
 * requires Prototype
 * @requires Garmin.DeviceControl
 */
Garmin.DeviceDisplay = function(mainElement, options){}; //just here for jsdoc
Garmin.DeviceDisplay = Class.create();
Garmin.DeviceDisplay.prototype = {

    /** Constructor.
     * @private
     */
	initialize: function(mainElement, options) {
		if(typeof(mainElement) == "string") {
			this.mainElement = $(mainElement);
		} else {
			this.mainElement = mainElement;
		}
		
		if(this.mainElement != null) {
			this.options = null;
			this.setOptions(options);

			this.garminController = null;
			this.garminRemoteTransfer = null;
			this.activities = new Array();
			this.factory = null;
        	this.tracks = null;
	        this.waypoints = null;

			this.activityDirectory = null; 					// Array of activity ID strings in the directory
			this.activitySelection = null; 					// Array of selected activity objects in the directory
			this.activityQueue = null; 						// Queue of activity IDs to sync events
			
			this.currentActivity = null; 					// The top of the activity queue and/or the activity being processed.
			this.finishedFirstActivity = false;
			
			this.error = null;
			
			this._generateElements();
			
			if (this.options.unlockOnPageLoad) {
				this.getController(true);
			}
			if (!this.error && this.options.autoFindDevices) {
				this.startFindDevices();
			}
		}
	},

    ////////////////////////// UI GENERATION METHODS ///////////////////////////
    
    /** Primary UI build method.
     * @private
     */
	_generateElements: function() {
		if (BrowserSupport.isBrowserSupported() || !this.options.hideIfBrowserNotSupported) {
			this._generateStatusElement();
			if(this.options.showFindDevicesElement) {
				this._generateFindDevicesElement();
			}
			if(this.options.showReadDataElement) {
				this._generateReadDataElement();
			}
			if(this.options.showActivityDirectoryElement) {
				this._generateActivityDirectoryElement();	
			}
			if(this.options.showWriteDataElement) {
				this._generateWriteDataElement();
			}
			if(this.options.showSendDataElement) {
				this._generateSendDataElement();
			}
			this._generateAboutElement();
			this.resetUI();
		}
	},

    /** Resets UI widgets based on state of application.
     * @param <String> optional status message.  
     */ 
	resetUI: function() {
		//console.debug("Display.resetUI")		
	    this.hideProgressBar();
	    
		var noDevicesAvailable = this.garminController ? (this.getController().numDevices==0) : true;
		if(this.options.showFindDevicesElement) {
			if (this.findDevicesButton)
				this.findDevicesButton.disabled = false;
			if (this.deviceSelect)		
				this.deviceSelect.disabled = noDevicesAvailable;
			if (this.cancelFindDevicesButton)
				this.cancelFindDevicesButton.disabled = true;
			if (this.readDataTypesSelect) 
				this.readDataTypesSelect.disabled = false;
		}
		if(this.options.showReadDataElement) {
			if (this.readDataButton) 
				this.readDataButton.disabled = noDevicesAvailable;
			if (this.cancelReadDataButton)
				this.cancelReadDataButton.disabled = true;
		}
		if(this.options.showWriteDataElement) {
			if (this.writeDataButton)
				this.writeDataButton.disabled = noDevicesAvailable;
			if (this.cancelWriteDataButton)
				this.cancelWriteDataButton.disabled = true;
		}
	},
	

    /** Build status UI components.
     * @private
     */
	_generateStatusElement: function() {
		this.statusElement = document.createElement("div");
		Element.extend(this.statusElement);
		this.statusElement.id = this.options.statusElementId;
		this.statusElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.statusElement);

		// Status text
		this.statusText = document.createElement("div");
		Element.extend(this.statusText);
		this.statusText.id = this.options.statusTextId;
		this.statusElement.appendChild(this.statusText);

		// Progress Bar
		this.progressBar = document.createElement("div");
		Element.extend(this.progressBar);
		this.progressBar.id = this.options.progressBarId;
		this.progressBarDisplay = document.createElement("div");
		Element.extend(this.progressBarDisplay);
		this.progressBarDisplay.id = this.options.progressBarDisplayId;
		var wrapper = document.createElement("div");
		Element.extend(wrapper);
		wrapper.setStyle({position: 'relative'});
		wrapper.appendChild(this.progressBarDisplay);
		this.progressBar.appendChild(wrapper);
		this.statusElement.appendChild(this.progressBar);
		Element.hide(this.progressBar);
	},
	
	_createElement: function(id, text, type, parent) {
		var elem = document.createElement(type);
		Element.extend(elem);
		if (type=="a") {
			elem.href = location;
			elem.innerHTML = text;
		} else if (type=="button"){
			elem.type = type;
			elem.value = text;
		}
		elem.id = id;
		parent.appendChild(elem);		
		return elem;
	},
	
    /** Build find device UI components.
     * @private 
     */
	_generateFindDevicesElement: function() {
		this.findDevicesElement = document.createElement("div");
		Element.extend(this.findDevicesElement);
		this.findDevicesElement.id = this.options.findDevicesElementId;
		this.findDevicesElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.findDevicesElement);

		// Find devices button
		if( this.options.showFindDevicesButton) {
			this.findDevicesButton = document.createElement( this.options.useLinks ? "a" : "input" );
			Element.extend(this.findDevicesButton);
			if (this.options.useLinks) {
				this.findDevicesButton.href = "#";
				this.findDevicesButton.innerHTML = this.options.findDevicesButtonText;
			} else {
				this.findDevicesButton.type = "button";
				this.findDevicesButton.value = this.options.findDevicesButtonText;
			}
			this.findDevicesButton.id = this.options.findDevicesButtonId;
			this.findDevicesButton.addClassName(this.options.actionButtonClassName);
			this.findDevicesElement.appendChild(this.findDevicesButton);		
	        this.findDevicesButton.onclick = function() {
	        	this.startFindDevices();
	        }.bind(this)
		}
		
		if(!this.options.showFindDevicesElementOnLoad) {
			if( this.findDevicesElement) {
				Element.hide(this.findDevicesElement);
			}
		}

		// Cancel Find devices button
		if (this.options.showCancelFindDevicesButton) {
			this.cancelFindDevicesButton = document.createElement( this.options.useLinks ? "a" : "input" );
			Element.extend(this.cancelFindDevicesButton);
			if (this.options.useLinks) {
				this.cancelFindDevicesButton.href = "#";
				this.cancelFindDevicesButton.innerHTML = this.options.cancelFindDevicesButtonText;
			} else {
				this.cancelFindDevicesButton.type = "button";
				this.cancelFindDevicesButton.value = this.options.cancelFindDevicesButtonText;
			}
			this.cancelFindDevicesButton.id = this.options.cancelFindDevicesButtonId;
			this.cancelFindDevicesButton.addClassName(this.options.actionButtonClassName);
			this.cancelFindDevicesButton.disabled = true;
	        this.cancelFindDevicesButton.onclick = function() {
	        	this.cancelFindDevices();
	        }.bind(this)
			this.findDevicesElement.appendChild(this.cancelFindDevicesButton);
		}
		
		if (!this.options.showDeviceButtonsOnLoad) {
			if (this.findDevicesButton) {
				Element.hide(this.findDevicesButton);
			}
			if (this.cancelFindDevicesButton)				
				Element.hide(this.cancelFindDevicesButton);			
		}

		// Device select drop-down list
		this.deviceSelectElement = document.createElement("div");
		Element.extend(this.deviceSelectElement);
		this.deviceSelectElement.id = this.options.deviceSelectElementId;
		this.deviceSelectElement.innerHTML = '<div id="' + this.options.deviceSelectLabelId + '">' + this.options.deviceSelectLabel + '</div>';
		this.findDevicesElement.appendChild(this.deviceSelectElement);

		this.deviceSelect = document.createElement("select");
		Element.extend(this.deviceSelect);
		this.deviceSelect.id = this.options.deviceSelectId;
		this.deviceSelect.disabled = true;
		this.deviceSelectElement.appendChild(this.deviceSelect);
		
		if (!this.options.showDeviceSelectOnLoad || !this.options.showDeviceSelectOnSingle || this.options.autoSelectFirstDevice) {
			Element.hide(this.deviceSelectElement);	
		}
	},

	_generateSendDataElement: function() {
		this.sendDataElement = document.createElement("div");
		Element.extend(this.sendDataElement);
		this.sendDataElement.id = this.options.sendDataElementId;
		this.sendDataElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.sendDataElement);

		this.sendDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.sendDataButton);
		if (this.options.useLinks) {
			this.sendDataButton.href = "#";
			this.sendDataButton.innerHTML = this.options.sendDataButtonText;
		} else {
			this.sendDataButton.type = "button";
			this.sendDataButton.value = this.options.sendDataButtonText;
		}
		this.sendDataButton.id = this.options.sendDataButtonId;
		this.sendDataButton.addClassName(this.options.actionButtonClassName);
        this.sendDataButton.onclick = function() {
        
        	this.setStatus(this.options.sendingDataToServer);
        	
        	Element.hide(this.findDevicesElement);
	        Element.hide(this.sendDataElement);
	        
        	var apiResponse;
        	
        	this.showProgressBar();
        	
        	// getSendParameters overwrites parameters set in sendDataOptions
        	if( this.options.getSendParameters != null && this.options.sendDataOptions != null) {
        		this.options.sendDataOptions.parameters = this.options.getSendParameters(this.garminController.getCurrentDeviceXml());
        	}
        	
        	// Make the request
        	apiResponse = this.garminRemoteTransfer.openRequest(this.options.sendDataUrl, this.options.sendDataOptions);
        	
        	// Handle response and errors
        	if(apiResponse == null) {
        		throw new Error(this.options.errorHttpResponse);
        	}
        	if( apiResponse.error != null) {
        		this.hideProgressBar();
        		this.setStatus(apiResponse.error);
        	} else {
        		// TODO add json specific options, and xml specific options
				this.options.sendDataCallback(apiResponse.response);
    	    	this.writeToDevice();
        	}
        }.bind(this)
		this.sendDataElement.appendChild(this.sendDataButton);
		
		if(this.options.showSendDataElementOnDeviceFound) {
			Element.hide(this.sendDataElement);
		}	
	},
	
    /** Build read data UI components.
     * @private
     */
	_generateReadDataElement: function() {
		this.readDataElement = document.createElement("div");
		Element.extend(this.readDataElement);
		this.readDataElement.id = this.options.readDataElementId;
		this.readDataElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.readDataElement);

		this.readDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.readDataButton);
		if (this.options.useLinks) {
			this.readDataButton.href = "#";
			this.readDataButton.innerHTML = this.options.readDataButtonText;
		} else {
			this.readDataButton.type = "button";
			this.readDataButton.value = this.options.readDataButtonText;
		}
		this.readDataButton.id = this.options.readDataButtonId;
		this.readDataButton.addClassName(this.options.actionButtonClassName);
		this.readDataButton.disabled = true;
        this.readDataButton.onclick = function() {
        
        	var isSupportedDevice = true;
        	if( this.options.restrictByDevice.length > 0){
				isSupportedDevice = this._restrictByDevice();
			}						
			
			if( isSupportedDevice) {
	        	if( this.options.autoHideUnusedElements ) {
	        		Element.hide(this.findDevicesElement);
	        		Element.hide(this.readDataElement);
	        		Element.hide(this.deviceSelectElement);
	        		Element.hide(this.activityDirectoryElement);
	        	}
	        	this.readDataButton.disabled = true;
	        	this.cancelReadDataButton.disabled = false;
	        	this.showProgressBar();
	        	if (this.options.showReadDataTypesSelect) {
	        		this.readSpecificTypeFromDevice(this.readDataTypesSelect.value);
	        	} else if (this.options.readDataType != null) {
	        		this.readSpecificTypeFromDevice(this.options.readDataType);
	        	} else {
					this.readFromDevice();
	        	}
			}
        }.bind(this)
		this.readDataElement.appendChild(this.readDataButton);

		this.cancelReadDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.cancelReadDataButton);
		if (this.options.useLinks) {
			this.cancelReadDataButton.href = "#";
			this.cancelReadDataButton.innerHTML = this.options.cancelReadDataButtonText;
		} else {
			this.cancelReadDataButton.type = "button";
			this.cancelReadDataButton.value = this.options.cancelReadDataButtonText;
		}
		this.cancelReadDataButton.id = this.options.cancelReadDataButtonId;
		this.cancelReadDataButton.addClassName(this.options.actionButtonClassName);
		this.cancelReadDataButton.disabled = true;
        this.cancelReadDataButton.onclick = function() {
        	this.resetUI();
         	this.hideProgressBar();
        	this.getController().cancelReadFromDevice();
        }.bind(this)
		this.readDataElement.appendChild(this.cancelReadDataButton);

		if(!this.options.showCancelReadDataButton) {
			Element.hide(this.cancelReadDataButton);
		}
		
		// WILL NEED THIS ONCE SYNC NEW ACTIVITIES IS FULLY IMPLEMENTED
		this.uploadDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.uploadDataButton);
		if (this.options.useLinks) {
			this.uploadDataButton.href = "#";
			this.uploadDataButton.innerHTML = this.options.uploadDataButtonText;
		} else {
			this.uploadDataButton.type = "button";
			this.uploadDataButton.value = this.options.uploadDataButtonText;
		}
		this.uploadDataButton.id = this.options.uploadDataButtonId;
		this.uploadDataButton.addClassName(this.options.actionButtonClassName);
        this.uploadDataButton.onclick = function() {
        	this.showProgressBar();
			
			this.activities = null;
        	this.readDataButton.disabled = true;
        	this.uploadDataButton.disabled = true;
        	this.checkAllBox.disabled = true;
        	
    		this._clearActivityTable();
			this.garminController.readHistoryFromFitnessDevice();
        }.bind(this)
		this.readDataElement.appendChild(this.uploadDataButton);

		if(!this.options.showUploadDataButton) {
			Element.hide(this.uploadDataButton);
		}

		
		if(this.options.showReadDataTypesSelect) {
			this.readDataTypesSelect = document.createElement("select");
			Element.extend(this.readDataTypesSelect);
			this.readDataTypesSelect.id = this.options.readDataTypesSelectId;
			this.readDataTypesSelect.disabled = true;
			this.readDataElement.appendChild(this.readDataTypesSelect);

			// TODO: need a more elegant way of adding options
			this.readDataTypesSelect.options[0] = new Option(this.options.gpsData, Garmin.DeviceControl.FILE_TYPES.gpx);
			this.readDataTypesSelect.options[1] = new Option(this.options.trainingData, Garmin.DeviceControl.FILE_TYPES.tcx);			
		}
		
		if(this.options.showReadRoutesSelect) {
			this.readRoutesElement = document.createElement("div");
			Element.extend(this.readRoutesElement);
			this.readRoutesElement.id = this.options.readRoutesElementId;
			this.readRoutesElement.addClassName(this.options.readResultsElementClass);
			this.readRoutesElement.innerHTML = "<span id=\"" + this.options.readRoutesSelectLabelId + "\">" + this.options.readRoutesSelectLabel + "</span>";

			this.readRoutesSelect = document.createElement("select");
			Element.extend(this.readRoutesSelect);
			this.readRoutesSelect.id = this.options.readRoutesSelectId;
			this.readRoutesSelect.addClassName(this.options.readResultsSelectClass);
			this.readRoutesSelect.disabled = true;
			this.readRoutesSelect.onchange = function() {
				this.displayTrack( this._seriesFromSelect(this.readRoutesSelect) );
			}.bind(this);
			this.readRoutesElement.appendChild(this.readRoutesSelect);
			this.readDataElement.appendChild(this.readRoutesElement);
			
			if(!this.options.showReadResultsSelectOnLoad) {
				Element.hide(this.readRoutesElement);
			}
		}

		if(this.options.showReadTracksSelect) {
			this.readTracksElement = document.createElement("div");
			Element.extend(this.readTracksElement);
			this.readTracksElement.id = this.options.readTracksElementId;
			this.readTracksElement.addClassName(this.options.readResultsElementClass);
			this.readTracksElement.innerHTML = "<span id=\"" + this.options.readTracksSelectLabelId + "\">" + this.options.readTracksSelectLabel + "</span>";

			this.readTracksSelect = document.createElement("select");
			Element.extend(this.readTracksSelect);
			this.readTracksSelect.id = this.options.readTracksSelectId;
			this.readTracksSelect.addClassName(this.options.readResultsSelectClass);
			this.readTracksSelect.disabled = true;
			this.readTracksSelect.onchange = function() {
				this.displayTrack( this._seriesFromSelect(this.readTracksSelect) );
			}.bind(this);
			this.readTracksElement.appendChild(this.readTracksSelect);
			this.readDataElement.appendChild(this.readTracksElement);
			
			if(!this.options.showReadResultsSelectOnLoad) {
				Element.hide(this.readTracksElement);
			}
		}
		
		if(this.options.showReadWaypointsSelect) {
			this.readWaypointsElement = document.createElement("div");
			Element.extend(this.readWaypointsElement);
			this.readWaypointsElement.id = this.options.readWaypointsElementId;
			this.readWaypointsElement.addClassName(this.options.readResultsElementClass);
			this.readWaypointsElement.innerHTML = "<span id=\"" + this.options.readWaypointsSelectLabelId + "\">" + this.options.readWaypointsSelectLabel + "</span>";

			this.readWaypointsSelect = document.createElement("select");
			Element.extend(this.readWaypointsSelect);
			this.readWaypointsSelect.id = this.options.readWaypointsSelectId;
			this.readWaypointsSelect.addClassName(this.options.readResultsSelectClass);
			this.readWaypointsSelect.disabled = true;
			this.readWaypointsSelect.onchange = function() {
				this.displayWaypoint( this._seriesFromSelect(this.readWaypointsSelect) );
			}.bind(this);
			this.readWaypointsElement.appendChild(this.readWaypointsSelect);
			this.readDataElement.appendChild(this.readWaypointsElement);
			
			if(!this.options.showReadResultsSelectOnLoad) {
				Element.hide(this.readWaypointsElement);
			}
		}
		
		// Read Tracks Google Map
		if(this.options.showReadGoogleMap) {
			this.readGoogleMap = document.createElement("div");
			Element.extend(this.readGoogleMap);
			this.readGoogleMap.id = this.options.readGoogleMapId;
			this.readGoogleMap.addClassName(this.options.readResultsElementClass);
			this.readDataElement.appendChild(this.readGoogleMap);			
			this.readMapController = new Garmin.MapController(this.options.readGoogleMapId);
		}
		
		if(this.options.showReadDataElementOnDeviceFound) {
			Element.hide(this.readDataElement);
		}
	},

	_generateActivityDirectoryElement: function() {
		// Create the container div to hold the directory elements
		this.activityDirectoryElement = document.createElement("div");
		Element.extend(this.activityDirectoryElement);
		this.activityDirectoryElement.id = this.options.activityDirectoryElementId;
		this.activityDirectoryElement.addClassName(this.options.elementClassName);
		
//		// Create container div that holds the table data only
//		this.activityDirectoryData = document.createElement("div");
//		Element.extend(this.activityDirectoryData);
//		this.activityDirectoryData.id = this.options.activityDirectoryDataId;
//		this.activityDirectoryData.addClassName(this.options.elementClassName);
//		this.activityDirectoryElement.appendChild(this.activityDirectoryData);

		this.mainElement.appendChild(this.activityDirectoryElement);
	},
	
	_generateActivityTableElement: function() {
		
		this.activities = null;
		
		this._generateActivityTableHeader();
		
		// Create the hidden input field that holds the upload string data
		this.uploadXmlString = document.createElement("input");
		Element.extend(this.uploadXmlString);
		this.uploadXmlString.id = "uploadXmlString";
		this.uploadXmlString.type = "hidden";
		this.uploadXmlString.value = "";
		this.activityDirectoryElement.appendChild(this.uploadXmlString);
		
		// Create container div that holds the table data only
		this.activityDirectoryData = document.createElement("div");
		Element.extend(this.activityDirectoryData);
		this.activityDirectoryData.id = this.options.activityDirectoryDataId;
//		this.activityDirectoryData.addClassName(this.options.elementClassName);
		this.activityDirectoryElement.appendChild(this.activityDirectoryData);
		
		// Create the table
		this.activityTable = document.createElement("table");
		Element.extend(this.activityTable);
		this.activityTable.id = "activityTable";
//		this.activityTable.addClassName(this.options.elementClassName);
		this.activityDirectoryData.appendChild(this.activityTable);
		
		this.readSelectedButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.readSelectedButton);
		if (this.options.useLinks) {
			this.readSelectedButton.href = "#";
			this.readSelectedButton.innerHTML = this.options.readSelectedButtonText;
		} else {
			this.readSelectedButton.type = "button";
			this.readSelectedButton.value = this.options.readSelectedButtonText;
		}
		this.readSelectedButton.id = this.options.readSelectedButtonId;
		this.readSelectedButton.addClassName(this.options.actionButtonClassName);
		this.readSelectedButton.disabled = false;
        this.readSelectedButton.onclick = function() {
        	
        	if( this._directoryHasSelected() == false) {
        		alert(this.options.errorActivitySelect);
        	} else {
	        	this.activities = null;
	        	this.readTracksSelect.length = 0;	
	        	this.readSelectedButton.disabled = true;
	        	this.checkAllBox.disabled = false;
        	
	        	this.showProgressBar();

				this.fileTypeRead = Garmin.DeviceControl.FILE_TYPES.tcxDetail;
				 
				this._populateActivityQueue();
				
				setTimeout(function(){this._readNextSelected();}.bind(this), 0);
        	}
        }.bind(this);
        this.activityDirectoryElement.appendChild(this.readSelectedButton);
	},

	_generateActivityTableHeader: function() {
		var selectIndex = 0;
		var nameIndex = 1;
		var durationIndex = 2;
		var statusIndex = 3;
		
		// Create the table header
		this.activityTableHeader = document.createElement("table");
		Element.extend(this.activityTableHeader);
		this.activityTableHeader.id = "activityTableHeader";
//		this.activityTableHeader.addClassName(this.options.elementClassName);
		this.activityTableHeader.cellspacing = 0;
		this.activityTableHeader.cellpadding = 0;
		var row = this.activityTableHeader.insertRow(0); // append a new row to the table
		var selectCell = row.insertCell(selectIndex);
		var nameCell = row.insertCell(nameIndex);
		var durationCell = row.insertCell(durationIndex);
		var statusCell = row.insertCell(statusIndex);
		
		// Set widths to match header
		selectCell.width = '5';
		nameCell.width = '65';
		durationCell.width = '10';
		statusCell.width = '18';
		
		// Align cells
		nameCell.align = 'center';
		durationCell.align = 'center';
		
		// Set cell values
		nameCell.innerHTML = this.options.activityDirectoryHeaderDate;
		durationCell.innerHTML = this.options.activityDirectoryHeaderDuration;
		
		this.checkAllBox = document.createElement("input");
		this.checkAllBox.id = "checkAllBox";
		this.checkAllBox.type = "checkbox";
		
		selectCell.appendChild(this.checkAllBox);
		
		this.checkAllBox.onclick = function() { this._checkAllDirectory(); }.bind(this);

		this.activityDirectoryElement.appendChild(this.activityTableHeader);
	},

    /** Build write data UI components.
     * @private
     */
	_generateWriteDataElement: function() {
		this.writeDataElement = document.createElement("div");
		Element.extend(this.writeDataElement);
		this.writeDataElement.id = this.options.writeDataElementId;
		this.writeDataElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.writeDataElement);

		if (!this.options.getWriteData && !this.options.getGpiWriteDescription && !this.options.getBinaryWriteDescription)
			throw new Error("Can't write data because getWriteData() function nor getGpiWriteDescription() is defined");
		this.writeDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.writeDataButton);
		if (this.options.useLinks) {
			this.writeDataButton.href = "#";
			this.writeDataButton.innerHTML = this.options.writeDataButtonText;
		} else {
			this.writeDataButton.type = "button";
			this.writeDataButton.value = this.options.writeDataButtonText;
		}
		this.writeDataButton.id = this.options.writeDataButtonId;
		this.writeDataButton.addClassName(this.options.actionButtonClassName);
		this.writeDataButton.disabled = true;		
        this.writeDataButton.onclick = function() {
        	this.writeDataButton.disabled = true;
        	this.cancelWriteDataButton.disabled = false;
        	if( this.options.autoHideUnusedElements ) {
        		Element.hide(this.findDevicesElement);
        	}
        	this.showProgressBar();
        	this.writeToDevice();
        }.bind(this);
		this.writeDataElement.appendChild(this.writeDataButton);
		
		this.cancelWriteDataButton = document.createElement( this.options.useLinks ? "a" : "input" );
		Element.extend(this.cancelWriteDataButton);
		if (this.options.useLinks) {
			this.cancelWriteDataButton.href = "#";
			this.cancelWriteDataButton.innerHTML = this.options.cancelWriteDataButtonText;
		} else {
			this.cancelWriteDataButton.type = "button";
			this.cancelWriteDataButton.value = this.options.cancelWriteDataButtonText;
		}
		this.cancelWriteDataButton.id = this.options.cancelWriteDataButtonId;
		this.cancelWriteDataButton.addClassName(this.options.actionButtonClassName);
		this.cancelWriteDataButton.disabled = false;
		this.cancelWriteDataButton.onclick = function() {
			this.resetUI();
			this.hideProgressBar();
			this.getController().cancelWriteToDevice();
		}.bind(this);
		this.writeDataElement.appendChild(this.cancelWriteDataButton);
		
		if(!this.options.showCancelWriteDataButton) {
			Element.hide(this.cancelWriteDataButton);
		}

		if(this.options.showWriteDataElementOnDeviceFound) {
			Element.hide(this.writeDataElement);
		}
	},

    /** Build "Powered by" UI components.
     * @private
     */
	_generateAboutElement: function() {
		this.aboutElement = document.createElement("div");
		Element.extend(this.aboutElement);
		this.aboutElement.id = "aboutElement";
		this.aboutElement.addClassName(this.options.elementClassName);
		this.mainElement.appendChild(this.aboutElement);

		this.copyrightText = document.createElement("span");
		this.copyrightText.innerHTML = this.options.poweredByGarmin;
		this.aboutElement.appendChild(this.copyrightText);
	},
	
	/** Checks the connected device against those listed in this.options.restrictByDevice
	 * and displays a status message if the connected device is not supported by
	 * the application. 
	 * @return true if the connected device is supported, false otherwise.
	 */
	_restrictByDevice: function() {
		
		// Get connected device
		var device = this.getController().getDevices()[this.deviceSelect.value];
		var deviceDescription = device.getDescription();
		var deviceModel = deviceDescription.split(" ")[0];
		
		var isSupportedDevice = false;
		// Compare to restricted list
		for(var model in this.options.restrictByDevice) {
			if(deviceModel == model) {
				isSupportedDevice = true;
			}
		}
		
		// Hide everything but status
		if( !isSupportedDevice ) {
			Element.hide(this.findDevicesElement);
			Element.hide(this.readDataElement);
			
			// Set status
			this.setStatus(this.options.restrictByDeviceStatusText);
		}
		
		return isSupportedDevice;
	},

    ////////////////////////// FIND DEVICES METHODS ////////////////////////// 
    
    /** Entry point for searching for connected devices.
     * Will attempt to unlock the plugin if necessary.
     */
	startFindDevices: function() {
		this.getController(true); //try to unlock plugin
		if(this.findDevicesButton) 
	       	this.findDevicesButton.disabled = true;
	    if (this.cancelFindDevicesButton)
    		this.cancelFindDevicesButton.disabled = !this.isUnlocked();
		if (this.isUnlocked()) {
       		this.getController().findDevices();
		}
	},

    /** Entry point for cancelling search for connected devices.
     */
	cancelFindDevices: function() {
		this.resetUI();
       	this.getController().cancelFindDevices();
	},

    /** Call-back triggered before plugin searches for connected devices.
     * @see Garmin.DeviceControl
     * @see #startFindDevices
     */
     
    onStartFindDevices: function(json) {
        this.setStatus(this.options.lookingForDevices);
    },

    /** Call-back triggered after plugin has completed its search for devices.
     * @see Garmin.DeviceControl
     * @see #startFindDevices
     */
    onFinishFindDevices: function(json) {
		this.resetUI();
        var devices = [];               
        if(json.controller.numDevices > 0) {
            devices = json.controller.getDevices();               
            
            var template = (devices.length == 1) ? this.options.foundDevice : this.options.foundDevices;
            var values = {deviceName: devices[0].getDisplayName(), deviceCount: json.controller.numDevices};
            this.setStatus( new Template(template).evaluate(values) );
 
			if(this.options.showFindDevicesElement ) {
				Element.show(this.findDevicesElement);
				if (this.options.showDeviceButtonsOnFound) {
					if (this.findDevicesButton && this.options.showFindDevicesButton)
						Element.show(this.findDevicesButton);
					if (this.cancelFindDevicesButton)
						Element.show(this.cancelFindDevicesButton);	
				} else {
					if (this.findDevicesButton)
						Element.hide(this.findDevicesButton);
					if (this.cancelFindDevicesButton)
						Element.hide(this.cancelFindDevicesButton);
				}
				if ((devices.length < 2 && !this.options.showDeviceSelectOnSingle) || this.options.autoSelectFirstDevice) {
					Element.hide(this.deviceSelectElement);
				} else {
					Element.show(this.deviceSelectElement);
				}
				
				this._listDevices(devices);
			}
			
			if(this.options.showReadDataElementOnDeviceFound) {
				Element.show(this.readDataElement);
			}
			
			if(this.options.showSendDataElementOnDeviceFound) {
				Element.show(this.sendDataElement);
			}
			
			if(this.options.showWriteDataElementOnDeviceFound) {
				Element.show(this.writeDataElement);
			}
			
			if(this.options.autoHideUnusedElements) {
				Element.hide(this.activityDirectoryElement);
				Element.show(this.readDataElement);
			}
			
			if (this.options.autoReadData) {
	        	this.showProgressBar();
	        	if (this.options.showReadDataTypesSelect) {
	        		this.readSpecificTypeFromDevice(this.readDataTypesSelect.value);
	        	} else if (this.options.readDataType != null) {
	        		this.readSpecificTypeFromDevice(this.options.readDataType);
	        	} else {
					this.readFromDevice();
	        	}
			}
			
			if (this.options.autoWriteData) {
	        	this.showProgressBar();
        		this.writeToDevice();
			}
        } else {
        	if ((this.options.autoReadData || this.options.autoWriteData) && !this.options.showStatusElement) {
        		alert(this.options.noDeviceDetectedStatusText);
        	}
        	
			this.setStatus(this.options.noDeviceDetectedStatusText);
			
			if(this.options.showFindDevicesElement) {
				if (this.options.showFindDevicesButton) {
					Element.show(this.findDevicesButton);
				}				
				if (this.options.showCancelFindDevicesButton) {
					Element.show(this.cancelFindDevicesButton);	
				}
				if (this.options.showDeviceSelectNoDevice && !this.options.autoSelectFirstDevice) {
					Element.show(this.deviceSelectElement);
				}
			}					
        }
        if (this.options.afterFinishFindDevices) {
    		this.options.afterFinishFindDevices(devices, this);
        }
    },
    
    /** Call-back for find device cancelled.
     */
	onCancelFindDevices: function(json) {
		this.setStatus(this.options.findCancelled);
    	this.resetUI();
    },

    /** Load device list into select UI component.
     * @private
     */
	_listDevices: function(devices) {
		this._clearHtmlSelect(this.deviceSelect);
		if(this.options.showFindDevicesElement) {
			for( var i=0; i < devices.length; i++ ) {
	           	this.deviceSelect.options[i] = new Option(devices[i].getDisplayName(),devices[i].getNumber());
	           	if(devices[i].getNumber() == this.getController().deviceNumber) {
	           		this.deviceSelect.selectedIndex = i;
	           	}
			}
			this.deviceSelect.onchange = function() {
				var device = this.getController().getDevices()[this.deviceSelect.value];
				this.setStatus(this.options.using + device.getDisplayName());
			
				this.getController().setDeviceNumber(this.deviceSelect.value);
			}.bind(this)
			this.deviceSelect.disabled = false;
		}
	},

    ////////////////////////////// READ METHODS ////////////////////////////// 
    
    /** Initiation call for reading from a device.  If a fitness device is detected reads TCX
     * otherwise reads GPX.
     * Upon completion if the afterFinishReadFromDevice method is defined
     * it will be called.  At this time you may also obtain location data using the 
     * getTracks and getWaypoints methods.
     */
	readFromDevice: function() {
		var deviceNumber = this.getController().deviceNumber;
		var device = this.getController().getDevices()[deviceNumber];
		
		if (device.supportDeviceDataTypeRead(Garmin.DeviceControl.FILE_TYPES.tcx)) {
			this.getController().readHistoryFromFitnessDevice();
		} else if (device.supportDeviceDataTypeRead(Garmin.DeviceControl.FILE_TYPES.gpx)) {
			this.getController().readFromDevice();
		} else {
			var error = new Error(Garmin.DeviceControl.MESSAGES.invalidFileType);
			error.name = "InvalidTypeException";
			this.handleException(error);
		}
	},
	
//	/**
//	 *  IS THIS STILL NEEDED?
//	 *  
//	 * Reads the device XML of the current device and places it in this.gpsDataString.  The 
//	 * device Xml is already read when the device is found, so this is a separate method from 
//	 * other data types.  
//	 */
//	readDeviceXml: function() {
//		this.getController().gpsDataString = this.garminController.getCurrentDeviceXml();		
//	},

    /** Generic read method, supporting GPX, TCX, Courses, Workouts, User Profiles, 
	 * TCX activity directory, and TCX course directory reads. <br/> 
     * <br/>
     * Upon completion if the afterFinishReadFromDevice method is defined
     * it will be called.  At this time you may also obtain location data using the 
     * getTracks and getWaypoints methods.<br/>
	 * <br/>
	 * Fitness detail reading (one specific activity) is not supported by this read method, refer to 
	 * readDetailFromDevice for that. <br/>  
	 * 
     * @param {String} extension - the file extension of the type to read: gpx or tcx
     */
	readSpecificTypeFromDevice: function(readDataType) {
		var deviceNumber = this.getController().deviceNumber;
		var device = this.getController().getDevices()[deviceNumber];
		
		switch(readDataType) {
    		case Garmin.DeviceControl.FILE_TYPES.tcxDir:
    			this._generateActivityTableElement();
    			this._clearActivityTable();
    			// no break!  keep on goin'
    		case Garmin.DeviceControl.FILE_TYPES.gpx:
    		case Garmin.DeviceControl.FILE_TYPES.tcx:
    		case Garmin.DeviceControl.FILE_TYPES.crs:
    		case Garmin.DeviceControl.FILE_TYPES.wkt:
    		case Garmin.DeviceControl.FILE_TYPES.tcxProfile:        		
    		case Garmin.DeviceControl.FILE_TYPES.crsDir:
    			this.garminController.readDataFromDevice(readDataType);
    			break;
    		case Garmin.DeviceControl.FILE_TYPES.deviceXml:
    			this.garminController.readDataFromDevice(readDataType);
    			break;
    		default:
    			var error = new Error(Garmin.DeviceControl.MESSAGES.invalidFileType + readDataType);
				error.name = "InvalidTypeException";			
				this.handleException(error);
    	} 
	},

    /** Call-back for device read progress.
     */
    onProgressReadFromDevice: function(json) {
		if(this.options.showProgressBar) {
	    	this.updateProgressBar(json.progress.getPercentage());
	    }
    	this.setStatus(json.progress);
    },
    
    /** Call-back for device read cancelled.
     * see Garmin.DeviceControl
     */
	onCancelReadFromDevice: function(json) {
    	this.setStatus(this.options.cancelReadStatusText);
    	this.resetUI();
    },

    /** Call-back for device read.
     * see Garmin.DeviceControl
     */
    onFinishReadFromDevice: function(json) {
    	
    	this.fileTypeRead = json.controller.gpsDataType;
    	
    	if(this.uploadXmlString != null) {
    		this.uploadXmlString.value = json.controller.gpsDataString;
    	}
    	
		this.setStatus(this.options.dataReadProcessing);
	    this.resetUI();
	    
	    this.clearMapDisplay();

    	// select the correct factory for the parsing job
    	switch(this.fileTypeRead) {
    		case Garmin.DeviceControl.FILE_TYPES.tcx:
    		case Garmin.DeviceControl.FILE_TYPES.tcxDir:
    		case Garmin.DeviceControl.FILE_TYPES.tcxDetail:
    			this.factory = Garmin.TcxActivityFactory;
    			break;
    		case Garmin.DeviceControl.FILE_TYPES.gpx:
    			this.factory = Garmin.GpxActivityFactory;
    			break;
    		default:
	    		var error = new Error( + this.fileTypeRead);
				error.name = "InvalidTypeException";
				this.handleException(error);
    	}

		// parse the data into activities if possible
		if (this.factory != null) {
			// Convert the data obtained from the device into activities.
			// If we're starting a new read session (as opposed to individual 
			// activity reads from the activity directory), start a new activities array
			if( this.activities == null) {
				this.activities = new Array();
			}
			
			// Populate this.activities
			switch(this.fileTypeRead) {
				case Garmin.DeviceControl.FILE_TYPES.tcxDir:
					this.activities = this.factory.parseDocument(json.controller.gpsData);
	    			
	    			// If we read a directory, save the directory for the session
	    			this._createActivityDirectory();
					break;
				case Garmin.DeviceControl.FILE_TYPES.tcxDetail:
	    			
	    			// Store this read activity
	    			this.activities = this.activities.concat( this.factory.parseDocument(json.controller.gpsData) );
	    			
		    		// Post to Connect WS (and finishes reading activites on the queue)
		    		if(this.options.uploadSelectedActivities){
						this._postActivityToServer();
		    		}
					break;
	    		default:
	    			this.activities = this.factory.parseDocument(json.controller.gpsData);
	    			// filter the activities
    				this._applyDataFilters();
	    			break;
			}
	
		}
		
		// Finished reading activities in queue, if any, so list them.
    	this._finishReadProcessing(json);
    },

	_applyDataFilters: function() {
		var dataFilters = this.options.dataFilters;
		if (dataFilters != null) {
			for (var i = 0; i < dataFilters.length; i++) {
				if (dataFilters[i].run != null) {
					dataFilters[i].run(this.activities, garminFilterQueue);
				}
			}
		}
	},

	_finishReadProcessing: function(json) {
		if (garminFilterQueue != null && garminFilterQueue.length > 0) {
			//console.debug("waiting for filters to finish...");
			setTimeout(function(){this._finishReadProcessing(json);}.bind(this), 500);
		} else {
			
			// list activities and set status to indicate how many were found
			if( this.activityQueue == null || this.activityQueue.length == 0 ) {
		    	
	    		// List the activities
				if( this.activities != null) {
					if( this.fileTypeRead == Garmin.DeviceControl.FILE_TYPES.tcxDir) {
						var summary = this._listDirectory(this.activities);
					} else {
		    			var summary = this._listActivities(this.activities);
					}
		    		this.setStatus( new Template(this.options.dataFound).evaluate(summary) );
				}
		    	
		    	// Disable appropriate buttons after read is finished
		    	switch(this.fileTypeRead) {
		    		case Garmin.DeviceControl.FILE_TYPES.gpx:
		    			break;
		    		case Garmin.DeviceControl.FILE_TYPES.tcx:
		    		case Garmin.DeviceControl.FILE_TYPES.crs:
		    		case Garmin.DeviceControl.FILE_TYPES.tcxDir:
		    		case Garmin.DeviceControl.FILE_TYPES.crsDir:
		    			this.deviceSelect.disabled = true;
		    			Element.show(this.activityDirectoryElement);
		    			break;
		    		case Garmin.DeviceControl.FILE_TYPES.tcxDetail:
		    		case Garmin.DeviceControl.FILE_TYPES.crsDetail:
		    			this.readSelectedButton.disabled = false;
		    			this.checkAllBox.disabled = false;
		    			break;
		    	}
			}
			
			// pass data to the user if they want it			
			if (this.options.afterFinishReadFromDevice) {
				var dataString = this.factory != null ? this.factory.produceString(this.activities) : json.controller.gpsDataString;
				var dataDoc = this.factory != null ? Garmin.XmlConverter.toDocument(dataString): json.controller.gpsData;
	    		this.options.afterFinishReadFromDevice(dataString, dataDoc, json.controller.gpsDataType, this.activities);
			}
		}
	},

	/** Reads the user-selected activities from the device by using the activity queue. 
     */
    _readNextSelected: function() {
    	
    	// Look at the next selected activity on the queue.  (The queue only holds selected activities)
    	this.currentActivity = this.activityQueue.last();
		
    	// Display 'processing' image next to corresponding activity in table 
    	var statusCellIdElement = $(this.currentActivity.replace(/Checkbox/,"Status"));
    	statusCellIdElement.innerHTML = this.options.statusCellProcessingImg;

    	this.setStatus(this.options.uploadingActivities);
    	this.garminController.readDetailFromDevice(this.fileTypeRead, $(this.currentActivity).value);
    },
    
    /** Posts the last read activity data from the activityQueue using the method defined in this.options.postActivityHandler .
     * After the entire queue is read (and posted), the status is changed to designate that all uploads have been finished. 
     */
    _postActivityToServer: function() {
    	
    	this.options.postActivityHandler(this.uploadXmlString.value, this);
    	
    	// Remove the read activity from the queue
    	this.activityQueue.pop();
    	
    	// TODO: This doesn't quite belong here, but it's the only way to ensure synchronization.
    	if(this.activityQueue.length > 0) {
	    	
	    	// Read what's left in the queue
			setTimeout(function(){this._readNextSelected();}.bind(this), 0);
    	}
    	else {
    		// Finished processing, so update status.
    		this.setStatus(this.options.uploadsFinished + "!");
    	}
    },
    
    _clearActivityTable: function() {
    	//clear previous data, if any (keep the header)
		while(this.activityTable.rows.length > 0) {
			this.activityTable.deleteRow(0);
		}
    },
    
    /** Creates the activity directory of all activities (activity IDs) on the device
     * of the user-selected type.  Most recent entries are first.
     */
    _createActivityDirectory: function() {
    	this.activityDirectory = new Array();
    	this.activityQueue = new Array(); // Initialized here so that we can detect activity selection read status
    	
    	for( var jj = 0; jj < this.activities.length; jj++) {
    		
    		this.activityDirectory[jj] = this.activities[jj].getAttribute("activityName");
    	}
    },
    
    /** Creates the activity queue of selected activities.  This should be called
     * only after the user has finished selecting activities.  The queue
     * is an Array that is constructed and then reversed to simulate a queue.
     */
    _populateActivityQueue: function() {
    	
    	for( var jj = 0; jj < this.activityDirectory.length; jj++) {
    		
    		if( $("activityItemCheckbox" + jj).checked == true){
    			this.activityQueue.push("activityItemCheckbox" + jj);
    		}
    	}
    	
    	// Reverse the array to turn it into a queue
    	this.activityQueue.reverse(); 
    },

	/** The activityTable object is the HTML table element on the demo page.  This function
	 * adds the necessary row to the table with the activity data.
	 */
	_addToActivityTable: function(index, activity) {
		
		var selectIndex = 0;
		var nameIndex = 1;
		var durationIndex = 2;
		var statusIndex = 3;
		
		var activityName = activity.getAttribute("activityName");
		
		var row = this.activityTable.insertRow(this.activityTable.rows.length); // append a new row to the table
		var selectCell = row.insertCell(selectIndex);
		var nameCell = row.insertCell(nameIndex);
		var durationCell = row.insertCell(durationIndex);
		var statusCell = row.insertCell(statusIndex);
		
		// Set widths to match header
		selectCell.width = '5';
		nameCell.width = '65';
		durationCell.width = '10';
		statusCell.width = '18';
		
		// Align cells center
		nameCell.align = 'center';
		durationCell.align = 'center';
		statusCell.align = 'left';
		
		var checkbox = document.createElement("input");
		checkbox.id = "activityItemCheckbox" + index;
		checkbox.type = "checkbox";
		checkbox.value = activityName;
		
		selectCell.appendChild(checkbox);

		statusCell.id = "activityItemStatus" + index;
		
		if( this.fileTypeRead == Garmin.DeviceControl.FILE_TYPES.tcxDir) {
			nameCell.innerHTML = activity.getSummaryValue(Garmin.Activity.SUMMARY_KEYS.startTime).getValue().getTimeString();
			durationCell.innerHTML = activity.getStartTime().getDurationTo(activity.getEndTime()); // Correct time zone
		}
		else if( this.fileTypeRead == Garmin.DeviceControl.FILE_TYPES.crsDir ) {
			nameCell.innerHTML = activityName;
		}
	},
	
	/** Selects all checkboxes in the activity directory, which selects all activities to be read from the device.
	 */
	_checkAllDirectory: function() {
		for( var boxIndex=0; boxIndex < this.activityDirectory.length; boxIndex++ ) {
			$("activityItemCheckbox" + boxIndex).checked = this.checkAllBox.checked;
		}
	},
	
	/** Checks if any activities in directory listing are selected.  Returns true if so, false otherwise.
	 */
	_directoryHasSelected: function() {
		for( var boxIndex=0; boxIndex < this.activityDirectory.length; boxIndex++ ) {
			if ( $("activityItemCheckbox" + boxIndex).checked == true) {
				return true;
			}
		}
		
		return false;
	},
	
	/** Lists the directory and returns summary data (# of tracks). 
	 */
	_listDirectory: function(activities) {
		var numOfTracks = 0;
		
		// clear existing entries
		this._clearHtmlSelect(this.readTracksSelect);
		
		// loop through each activity
		for (var i = 0; i < activities.length; i++) {
			var activity = activities[i];
			
			// Directory entry
			if(this.fileTypeRead == Garmin.DeviceControl.FILE_TYPES.tcxDir || this.fileTypeRead == Garmin.DeviceControl.FILE_TYPES.crsDir) {
				this._addToActivityTable(i, activity);
			}
			
			numOfTracks++;
		}
		
		return {tracks: numOfTracks};
	},
	
	_listActivities: function(activities) {
		var numOfRoutes = 0;
		var numOfTracks = 0;
		var numOfWaypoints = 0;
		
		// clear existing entries
		this._clearHtmlSelect(this.readRoutesSelect);
		this._clearHtmlSelect(this.readTracksSelect);
    	this._clearHtmlSelect(this.readWaypointsSelect);
		
		// loop through each activity
		for (var i = 0; i < activities.length; i++) {
			var activity = activities[i];
			var series = activity.getSeries();
			// loop through each series in the activity
			for (var j = 0; j < series.length; j++) {
				var curSeries = series[j];								
				if (curSeries.getSeriesType() == Garmin.Series.TYPES.history) {
					// activity contains a series of type history, list the track
					this._listTrack(activity, curSeries, i, j);
					numOfTracks++;
				} else if (curSeries.getSeriesType() == Garmin.Series.TYPES.route) {
					// activity contains a series of type route, list the route
					this._listRoute(activity, curSeries, i, j);
					numOfRoutes++;
				} else if (curSeries.getSeriesType() == Garmin.Series.TYPES.waypoint) {
					// activity contains a series of type waypoint, list the waypoint
					this._listWaypoint(activity, curSeries, i, j);				
					numOfWaypoints++;
				}
			}
		}
		if (this.options.showReadRoutesSelect) {
			if(numOfRoutes > 0) {
				Element.show(this.readRoutesElement);
				this.readRoutesSelect.disabled = false;
				this.displayTrack( this._seriesFromSelect(this.readRoutesSelect) );
			} else {
				Element.hide(this.readRoutesElement);
				this.readRoutesSelect.disabled = true;
			}
		}
		if (this.options.showReadTracksSelect) {		
			if(numOfTracks > 0) {
				Element.show(this.readTracksElement);
				this.readTracksSelect.disabled = false;
				this.displayTrack( this._seriesFromSelect(this.readTracksSelect) );
			} else {
				Element.hide(this.readTracksElement);
				this.readTracksSelect.disabled = true;
			}
		}
		if (this.options.showReadWaypointsSelect) {		
			if(numOfWaypoints > 0) {
				Element.show(this.readWaypointsElement);
				this.readWaypointsSelect.disabled = false;
				this.displayWaypoint( this._seriesFromSelect(this.readWaypointsSelect) );
			} else {
				Element.hide(this.readWaypointsElement);
				this.readWaypointsSelect.disabled = true;			
			}
		}	
		return {routes: numOfRoutes, tracks: numOfTracks, waypoints: numOfWaypoints};
	},

    /** Load route names into select UI component.
     * @private
     */    
	_listRoute: function(activity, series, activityIndex, seriesIndex) {
		// make sure the select component exists
		if (this.readRoutesSelect) {
			var routeName = activity.getAttribute(Garmin.Activity.ATTRIBUTE_KEYS.activityName);
			this.readRoutesSelect.options[this.readRoutesSelect.length] = new Option(routeName, activityIndex + "," + seriesIndex);
		}		
	},

    /** Load track name into select UI component.
     * @private
     */    
	_listTrack: function(activity, series, activityIndex, seriesIndex) {
		// make sure the select component exists
		if (this.readTracksSelect) {
			var startDate = activity.getSummaryValue(Garmin.Activity.SUMMARY_KEYS.startTime).getValue();
			var endDate = activity.getSummaryValue(Garmin.Activity.SUMMARY_KEYS.endTime).getValue();
			var values = {date:startDate.getDateString(), duration:startDate.getDurationTo(endDate)}
			var trackName = new Template(this.options.trackListing).evaluate(values);
			this.readTracksSelect.options[this.readTracksSelect.length] = new Option(trackName, activityIndex + "," + seriesIndex);
		}
	},

    /** Load waypoint name into select UI component.
     * @private
     */
	_listWaypoint: function(activity, series, activityIndex, seriesIndex) {
		// make sure the select component exists
		if (this.readWaypointsSelect) {
			var wptName = activity.getAttribute(Garmin.Activity.ATTRIBUTE_KEYS.activityName);
			this.readWaypointsSelect.options[this.readWaypointsSelect.length] = new Option(wptName, activityIndex + "," + seriesIndex);
		}
	},

    
    /** Retreive the two index string value from the selected index.
     * Activities are stored in Select objects as strings with 2 
     * numbers: "(index of array), (index of series)", for example:  "1,1".
     * @param Select select - the Select DOM instance
     * @type Garmin.Series
     * @return a Series instance
     */
    _seriesFromSelect: function(select) {
    	var indexesStr = select.options[select.selectedIndex].value;
    	var indexes = indexesStr.split(",", 2);
    	var activity = this.activities[parseInt(indexes[0])];
    	var series = activity.getSeries()[parseInt(indexes[1])];
    	return series;
    },

    
    /** Draws a simple line on the map using the Garmin.MapController.
     * @param Garmin.Series series - that contains a track. 
     */
    displayTrack: function(series) {
		if(this.options.showReadGoogleMap) {
			this.readMapController.map.clearOverlays();
			this.readMapController.drawTrack(series);
	    }
    },

    /** Draws a point (usualy as a thumb tack) on the map using the Garmin.MapController.
     * @param Garmin.Series series - that contains the lat/lon position of the point. 
     */
    displayWaypoint: function(series) {
		if(this.options.showReadGoogleMap) {
			this.readMapController.map.clearOverlays();
	        this.readMapController.drawWaypoint(series);
		}
    },

    /** Clears overlays from map.
     */
	clearMapDisplay: function() {
		if(this.options.showReadGoogleMap) {
			this.readMapController.map.clearOverlays();
		}
	},


    ////////////////////////////// WRITE METHODS ////////////////////////////// 
    
    /** Writes any supported data to the device.
     * 
     * Requires that the option writeDataType field be set correctly to any of the following values 
     * located in Garmin.DeviceControl.FILE_TYPES:
     * 
     * 		gpx, crs, or gpi
     * 
     * @throws InvalidTypeException
     */
    writeToDevice: function() {
    	//console.debug("Display.writeToDevice writeDataType="+this.options.writeDataType)
    	
    	switch( this.options.writeDataType ) {
				
			case Garmin.DeviceControl.FILE_TYPES.gpx : 
				this.getController().writeToDevice(this.options.getWriteData(), this.options.getWriteDataFileName());
				break;
			case Garmin.DeviceControl.FILE_TYPES.crs :
				this.getController().writeFitnessToDevice(this.options.getWriteData(), this.options.getWriteDataFileName());
				break;
			case Garmin.DeviceControl.FILE_TYPES.goals :
				this.getController().writeGoalsToFitnessDevice(this.options.getWriteData(), this.options.getWriteDataFileName());
				break;
			case Garmin.DeviceControl.FILE_TYPES.gpi :
				var xmlDescription = Garmin.GpiUtil.buildMultipleDeviceDownloadsXML(this.options.getGpiWriteDescription());
		        this.getController().downloadToDevice(xmlDescription, this.options.getWriteDataFileName());
				break;
			case Garmin.DeviceControl.FILE_TYPES.binary :
				var xmlDescription = Garmin.GpiUtil.buildMultipleDeviceDownloadsXML(this.options.getBinaryWriteDescription());
		        this.getController().downloadToDevice(xmlDescription, this.options.getWriteDataFileName());
				break;
			default:
				var error = new Error(Garmin.DeviceControl.MESSAGES.invalidFileType + this.options.writeDataType);
				error.name = "InvalidTypeException";
				this.handleException(error);
		}
    },

	/** Call-back triggered before writing to a device.
     * @see Garmin.DeviceControl
	 */
    onStartWriteToDevice: function(json) { 
     	this.setStatus(this.options.writingToDevice);
    },

	/** Call-back triggered when write has been cancelled.
     * @see Garmin.DeviceControl
	 */
    onCancelWriteToDevice: function(json) { 
    	this.setStatus(this.options.writingCancelled);
    },

    /** Call-back when the device already has a file with this name on it.  Do we want to override?  1 is yes, 2 is no
     * @see Garmin.DeviceControl
     */ 
    onWaitingWriteToDevice: function(json) { 
        if(confirm(json.message.getText())) {
            this.setStatus(this.options.overwritingFile);
            json.controller.respondToMessageBox(true);
        } else {
            this.setStatus(this.options.notOverwritingFile);
            json.controller.respondToMessageBox(false);
        }
    },

    onProgressWriteToDevice: function(json) {
	  	if(this.options.showProgressBar) {
	  		this.updateProgressBar(json.progress.getPercentage());
	  	}
  		this.setStatus( json.progress.percentage==100 ? this.options.dataDownloadProcessing : json.progress );
    },

    onFinishWriteToDevice: function(json) {
    	this.setStatus(this.options.writtenToDevice);
	    this.resetUI();
		if (this.options.afterFinishWriteToDevice) {
    		this.options.afterFinishWriteToDevice(json.success, this);
		}
    },
    
    
    ////////////////////////////// UTILITY METHODS ////////////////////////////// 
    
    /** Sets up the device control which handles most of the work that isn't user
     * interface related.  The controller is lazy loaded the first time it is called.
     * Early calls must specify the unlock parameter, but read and write methods should
     * not because they should follow a call to findDevice.
     * 
     * Also initializes the RemoteTransfer object used to transfer data to remote servers.
     * 
     *   
     * @param {Boolean} optional request to unlock the plugin if not already done.
     * @private
     */
	getController: function(unlock) {
		if (!this.garminController) {
			try {
				this.garminController = new Garmin.DeviceControl();
				this.garminController.register(this);
				this.garminController.setPluginRequiredVersion(this.options.pluginRequiredVersion);
				this.garminController.setPluginLatestVersion(this.options.pluginLatestVersion);
				this.garminController.validatePlugin();
	        } catch (e) {
	            this.handleException(e);
	            return null;
	        }
		}
		if (!this.error && unlock && !this.isUnlocked()) {
			if(this.garminController.unlock(this.options.pathKeyPairsArray)) {
	        	this.setStatus(this.options.pluginUnlocked);
			} else {
	        	this.setStatus(this.options.pluginNotUnlocked);
			}
			this.garminRemoteTransfer = new Garmin.RemoteTransfer();
		}
		return this.garminController;
	},

	/** Plugin unlock status
	 * @type Boolean
	 */
	isUnlocked: function() {
		return (this.garminController && this.garminController.isUnlocked());
	},
	
	/** Sets options for this display object.  Any options that are set will override
	 * the default values.
	 *
	 * @see Garmin.DeviceDisplayDefaultOptions for possible options and default values.
	 * @throws InvalidOptionException
	 * @param {Object} options - Object with options.
	 *
     * 
	 */
	setOptions: function(options) {
		for(key in options || {}) {
			if ( ! (key in Garmin.DeviceDisplayDefaultOptions) ) {
				var err = new Error(key+" is not a valid option name, see Garmin.DeviceDisplayDefaultOptions");
				err.name = "InvalidOptionException";
				throw err;
			}
		}
		this.options = Object.extend(Garmin.DeviceDisplayDefaultOptions, options || {});
	},

	/**Sets the size of the select to zero which essentially clears it from 
	 * any values.
	 * @private
	 * @param {HTMLElement} select DOM element
	 */
    _clearHtmlSelect: function(select) {
		if(select) {
			select.length = 0;
		}
    },

    /** Set status text if showStatusElement is visible.
     * @param {String} text to display.
     */
	setStatus: function(statusText) {
		if(this.options.showStatusElement) {
			
			var statusDisplayString;
			
			if( this.options.showDetailedStatus) {
				statusDisplayString = this._buildDescriptiveStatusString(statusText);
			} else {
				if( statusText.getText ) {
					
					var text = statusText.getText();
					if( text instanceof Array) {
						if( text.length == 0) { 
							statusDisplayString = '';
						} else { 
							statusDisplayString = statusText.getText()[0];
						}
					}
				} else {
					statusDisplayString = statusText;
				}
			} 
		   	this.statusText.innerHTML = statusDisplayString;
		}
	},
	
	/** Builds a descriptive string from the status response (typically JSON, but also can be a plain ol' string).
	 */
	_buildDescriptiveStatusString: function(statusText) {
		
		var resultString = statusText;
		
		if( statusText.getTitle ) {
			resultString = statusText.getTitle() + "<br />";
		}
		if( statusText.getText ) {
			resultString += statusText.getText();
		}
		
		return resultString;
	},

    /** Makes progress bar visible.
     */
	showProgressBar: function() {
		if(this.options.showStatusElement && this.options.showProgressBar) {
		    Element.show(this.progressBar);
		}
	},

    /** Hides progress bar.
     */
	hideProgressBar: function() {
		if(this.options.showStatusElement && this.options.showProgressBar) {
		    Element.hide(this.progressBar);
		}
	},

    /** Update percentage representation of progress bar.
     * @param {Number} percentage completion: 0-100 
     */
	updateProgressBar: function(value) {
		if(this.options.showStatusElement && this.options.showProgressBar && value) {
			var percent = (value <= 100) ? value : 100;
		    this.progressBarDisplay.style.width = percent + "%";
		}
	},
	
    /** Call-back for asynchronous method exceptions.
     * see Garmin.DeviceControl
     */
	onException: function(json) {
		this.handleException(json.msg);
	},
	
    /** Central exception dispatch method will delegate to options.customExceptionHandler
     * if defined or call defaultExceptionHandler otherwise.
     * 
     * @param {Error} error to process.
     */	
	handleException: function(error) {
		this.error = true;
   	    //console.debug("Display.handleException error="+error)
		if (this.options.customExceptionHandler) {
			this.options.customExceptionHandler(error, this);
		} else {
			this.defaultExceptionHandler(error);
		}
	},
    /** Default exception handler method handles plug-in support/downloads/upgrades. 
     * If options.showStatusElement is true then put error messages in the status div otherwise
     * put it in a alert popup.
     * 
     * @param {Error} error to process.
     */	
	defaultExceptionHandler: function(error) {
		var errorStatus;
		var hideFromBrowser = false;
		if(error.name == "BrowserNotSupportedException") {
			errorStatus = error.message;
			if (this.options.hideIfBrowserNotSupported) {
				hideFromBrowser = true;
			}
		} else if (error.name == "PluginNotInstalledException" || error.name == "OutOfDatePluginException") {
			errorStatus = error.message;
			errorStatus += " <a href=\""+Garmin.DeviceDisplay.LINKS.pluginDownload+"\" target=\"_blank\">"  + this.options.downloadAndInstall + "</a>";
		} else if (Garmin.PluginUtils.isDeviceErrorXml(error)) {
			errorStatus = Garmin.PluginUtils.getDeviceErrorMessage(error);	
		} else {
			errorStatus = error.name + ": " + error.message;	
		}						

		this.setStatus(errorStatus);
		this.resetUI();
		//if no status UI div is defined, make sure the user sees the error
		if (!this.options.showStatusElement && !hideFromBrowser) {
			if (error.name == "PluginNotInstalledException" || error.name == "OutOfDatePluginException") {
				if (window.confirm(error.message+"\n" + this.options.installNow)) {
					window.open(Garmin.DeviceDisplay.LINKS.pluginDownload, "_blank");
				}
			} else {
				alert(errorStatus);
			}
		}
	}
    
};

/** Constant defining links referenced in the DeviceDisplay
 */
Garmin.DeviceDisplay.LINKS = {
	pluginDownload:	"http://www.garmin.com/products/communicator/"
};

/** A queue of filters to be applied to activities after data is
 * obtained from the device.  Also used by display to determine
 * if the filtering process is finished; 
 */
var garminFilterQueue = new Array();

/** The default display options for the generated plug-in elements including
 * booleans for which sub-items to show.  Override specific option values by 
 * calling setOptions(optionsHash) on your instance of Garmin.DeviceDisplay
 * to customize your display options.
 *
 * @class 
 * @constructor 
 */
Garmin.DeviceDisplayDefaultOptions = function(){};
Garmin.DeviceDisplayDefaultOptions = {
//Garmin.DeviceDisplayDefaultOptions.prototype = {


	// ================== Plugin unlock ======================

	/**Unlock plugin when user lands on containing page which may result in security or
	 * plugin-not-installed messages.  Set to false to supress plugin acivity
	 * until user initiates an action.
	 * 
	 * @type Boolean
	 */
	unlockOnPageLoad:			true,

	/**The array of strings that contain the unlock codes for the plugin.
	* [URL1,KEY1,URL2,KEY2] add as many url/key pairs as you'd like.
	* @type String[]
	*/
	pathKeyPairsArray:			["file:///C:/dev/", "bd04dc1f5e97a6ff1ea76c564d133b7e"],


	// ================== Global Options ======================
	/**The class name used by various parts of the display to make
	 * CSS styling easier.
	 * 
	 * @see #statusElementId
	 * @see #readDataElementId
	 * @see #findDevicesElementId
	 */
	elementClassName:			"pluginElement",

	/**Display link instead of buttons.  Currently this only applies to the 'Find Devices' button.
	 * @type Boolean
	 */
	useLinks:					false,

	/**Action to take if browser is not supported:
	 * if true on't display the application,
	 * else if status bar is visible, display message, otherwise popup an alert dialog
	 * 
	 * @type Boolean
	 */
	hideIfBrowserNotSupported:		false,

	/**The function called when an error occurs.  This is here to allow
	 * custom error handling logic.  
	 * 
	 * The function should accept an arguement of type Error (Javascript 
	 * Error Object) and a second arguement for the DeviceDisplay instance.
	 * 
	 * Error.name - the type of the error in a String format.
	 * Error.message - the detailed message of the error.
	 *
	 * Some Errors:
	 * 	PluginNotInstalledException - the plugin is not installed
	 *  OutOfDatePluginException - the plugin is out of date
	 *  BrowserNotSupportedException - the browser is not support by the site
	 * 
	 * @type Function
	 */				
	customExceptionHandler:		null, //function(error, display){ display.defaultExceptionHandler(error); }

	/**Class name to add for all buttons/links that perform an action
	 * @type String
	 */
	actionButtonClassName:		"actionButton",
	
	/**DEPRECATED - Use autoHideUnusedElements instead!  
	 * 
	 * Auto-hides read elements when they are not in use.  This is currently used for the Upload Activities use case.
	 * 
	 * default = false
	 * 
	 * @type String
	 * 
	 */
	autoHideUnusedReadElements: false,
	
	/**Auto-hides elements when they are not in use.  This is used to simulate a UI with different screens, until we design a better way to do this. 
	 * 
	 * default = false
	 * 
	 * @type String
	 */
	autoHideUnusedElements:		false,

	// ================== Status Element Options ======================
	/**The choice to display the feedback regarding the communications 
	 * with the device.
	 * 
	 * @type Boolean
	 * 
	 */
	showStatusElement:			true,
	
	/** The choice to display more detailed status when transferring data to and from device.
	 * @type Boolean
	 * default = true
	 */
	showDetailedStatus:		true,
	
	/**The id of the HTML element where the statusBox is to be rendered.
	 * @type String
	 */
	statusElementId:			"statusBox",
	
	/**The id of the HTML element where the status text messages are to be displayed.
	 * @type String
	 */
	statusTextId:				"statusText",
	
	/**The progress bar is a graphical percentage bar used to display 
	 * the amount of reading/writing is complete.
	 * @type Boolean
	 */
	showProgressBar:			true,
	
	/**The container for the progress bar.
	 * @type String
	 */
	progressBarId:				"progressBar",
	
	/**The id of the element where the progress bar is to be displayed.
	 * @type String
	 */
	progressBarDisplayId:		"progressBarDisplay",


	//===================  Find Devices Element Options ===============
	
	/**Choice to display the find devices area that will search for connected devices.
	 * @type Boolean
	 */
	showFindDevicesElement:		true,
	
	/**Choice to display the find devices area that will search for connected devices when the page loads.
	 * @type Boolean
	 */
	showFindDevicesElementOnLoad:	true,
	
    /**Looks for devices as soon as the page is loaded and the plugin unlocked.
     * This might be particularly annoying in many situations since the plugin 
     * requires the user to authorize access to device information via a 
     * dialog box.
     * 
	 * @type Boolean
     */
	autoFindDevices:			false,
	
	/**Controls the view of the buttons related to find devices (find & cancel) if 
	 * based on if the plugin finds one or more devices.  
	 * When set to <b>false</b> and  
	 * used with {@link #showDeviceButtonsOnLoad}=false 
	 * and {@link #autoFindDevices}=true these buttons will only
	 * show up if a device is not found (minimizing confusion for the user).
	 * </p>
	 * <p>
	 * More granular control is provided on each of the device buttons 
	 * {@link #showFindDevicesButton} and {@link #showCancelFindDevicesButton}.
	 * </p>
	 * @see #showFindDevicesElement
	 * @type Boolean
	 */
	showDeviceButtonsOnFound:	true,
	
	/**If true the buttons will show when the page is rendered. 
	 * If false, the buttons will not be displayed until the plugin detects that a device is not found. 
	 * If you choose not to see the buttons at all (regardless if device is found or not) then 
	 * {@link #showFindDevicesElement} should be set to false.
	 * 
	 * @see #showDeviceButtonsOnFound
	 * @see #showFindDevicesElement
	 * @type BSoolean
	 */
	showDeviceButtonsOnLoad:	true,
	
	/**Allows granular control to hide the find devices button independent
	 * of the {@link #showCancelFindDevicesButton} cancel button contol.
	 * @type Boolean
	 * 
	 */
	showFindDevicesButton:		true,
	
	/**The id referencing the HTML container around the find devices buttons.
	 * This is useful for CSS customizations. 
	 * <p>
	 * default = deviceBox
	 * </p>
	 * @type String
	 * 
	 */
	findDevicesElementId:		"deviceBox",
	
	/**The id referencing the find devices button.  This is useful for
	 * CSS customizations.
	 * 
	 * default = findDevicesButton
	 * @type String
	 */
	findDevicesButtonId:		"findDevicesButton",
	
	/**The text for the find device button.
	 * 
	 * @type String
	 */		
	findDevicesButtonText:			"Find Devices",	
	
	/**Controls the view of the cancel find devices button. When
	 * set to <b>false</b> the button will never show.  When
	 * set to <b>true</b> the button's behavior will depend on other
	 * settings such as {@link #showFindDevicesButton}, 
	 * {@link #showDeviceButtonsOnFound}, {@link #showDeviceButtonsOnLoad},
	 * and {@link #showFindDevicesElement}.
	 * 
	 * default= false
	 * @type Boolean
	 */	
	showCancelFindDevicesButton:		false,
	
	/**The id referencing the cancel find devices button.  This is useful for
	 * CSS customizations.
	 * 
	 * default = cancelFindDevicesButton
	 * @type String
	 */	
	cancelFindDevicesButtonId:	"cancelFindDevicesButton",
	
	/**The text for the cancel find device button.
	 * 
	 * @type String
	 */		
	cancelFindDevicesButtonText:		"Cancel Find Devices",

	/**Controls the view of the device select box.
	 * When set to <b>true</b> the select device box will show even when only
	 * one device is found.
	 * When set to <b>false</b> the select device box will hide when only
	 * one device is found.
	 * When {@link #showFindDevicesElement} is set to false, the device select
	 * box will never show.
	 * 
	 * default = false
	 * 
	 * @see #showDeviceSelectNoDevice
	 * @see #showDeviceSelectOnLoad	  	 
	 * @see #showFindDevicesElement	 
	 * @type Boolean
	 */
	showDeviceSelectOnSingle:	false,
	
	/**Controls the view of the device select box.
	 * When set to <b>true</b> the select device box will show even when
	 * no device is found.
	 * When set to <b>false</b> the select device box will hide when
	 * no device is found.
	 * When {@link #showFindDevicesElement} is set to false, the device select
	 * box will never show.
	 * 
	 * default = true
	 * 
	 * @see #showDeviceSelectOnSingle
	 * @see #showDeviceSelectOnLoad	  
	 * @see #showFindDevicesElement	 
	 * @type Boolean
	 */	
	showDeviceSelectNoDevice:	false,
	
	/**Controls the view of the device select box.
	 * When set to <b>true</b> the select device box will show when
	 * the display loads.
	 * When set to <b>false</b> the select device box will never be visible.
	 * When {@link #showFindDevicesElement} is set to false, the device select
	 * box will never show.
	 * 
	 * default = true
	 * 
	 * @see #showDeviceSelectOnSingle
	 * @see #showDeviceSelectNoDevice	  
	 * @see #showFindDevicesElement	 
	 * @type Boolean
	 */		
	showDeviceSelectOnLoad:		true,
	
	/**When more than one device is detected automaticly pick the first device.
	 * This allows single button interfaces to avoid having to ask the user to 
	 * choose the device and keeps the deviceSelect hidden.
	 * 
	 * default = false
	 * 
	 * @see #showDeviceSelectOnSingle
	 * @see #showDeviceSelectNoDevice	  
	 * @see #showFindDevicesElement	 
	 * @type Boolean
	 */		
	autoSelectFirstDevice:		false,
	
	/**The id referencing the device select box.  This is useful for
	 * CSS customizations.
	 * 
	 * default = deviceSelectBox
	 * @type String
	 */		
	deviceSelectElementId:		"deviceSelectBox",
	
	/**The label for the device select box.  Shows up next to the
	 * device select box.
	 * 
	 * @type String
	 */		
	deviceSelectLabel:			"Devices: ",	

	/**The id referencing the device select box label.  This is useful for
	 * CSS customizations.
	 * 
	 * default = deviceSelectLabel
	 * @type String
	 */			
	deviceSelectLabelId:		"deviceSelectLabel",	
	
	/**The id referencing the device select dropdown.  This is useful for
	 * CSS customizations.
	 * 
	 * default = deviceSelect
	 * @type String
	 */			
	deviceSelectId:				"deviceSelect",
	
	/**The id referencing the element that displays what device was selected.  This is useful for CSS customizations.
	 *
	 * default = deviceSelected
	 * @type String 
	 */
	deviceSelectedElementId:	"deviceSelected",
	
	/**The label for the device selected element.  This label preceeds the device selected element.  This is useful for CSS customizations.
	 *
	 * default = Previewing
	 * @type String 
	 */
	deviceSelectedLabel:		"Previewing ",
	
	/**The id referencing the label for the element that displays what device was selected.  This is useful for CSS customizations.
	 *
	 * default = deviceSelectedLabel
	 * @type String 
	 */
	deviceSelectedLabelId:		"deviceSelectedLabel",
	
	/**The status text that is displayed when no devices are found.
	 * 
	 * @type String
	 */			
	noDeviceDetectedStatusText:	"No devices found.",
	/**The status text that prepends itself to the device name when a single device is found.
	 * 
	 * @type String
	 */
	singleDeviceDetectedStatusText: "Found ",

    /**The function called when device search completes successfully or unsuccessfully.
     * The function should have two arguments:
     *  devices {Array<Garmin.Device>} - an array of device descriptors or an empty array in none were found.
     *  display {Garmin.DeviceDisplay} - the current instance of the DeveiceDisplay
	 * 
	 * @type Function
	 */				
	afterFinishFindDevices:	null, //function(devices, display){},


	// ================== Read Element Options ======================
	/**Start reading data from the device when one or more device(s)
	 * is found.
	 * 
	 * default = false
	 * 
	 * @see #autoFindDevices
	 * @see #autoWriteData	  
	 * @type Boolean
	 */					
	autoReadData:				false,
	
	/**Display the user interface associated with reading from
	 * a connected device.
	 * 
	 * default = true
	 * @type Boolean
	 */
	showReadDataElement:		true,
	
	/** Displays the activity directory table, which essentially 
	 * allows users to select individual activities to read from 
	 * the device.  showReadDataElement must be true for this 
	 * to display.
	 * 
	 * default = true
	 * 
	 * @see #showReadDataElement
	 * @type Boolean
	 */
	showActivityDirectoryElement:	true,
	
	/** The id referencing the element that lists individual activities. This element includes the 
	 * data table as well as the related buttons (such as for uploading data). This is useful for CSS customizations.
	 * 
	 * default = activityDirectory
	 * @type String
	 */
	activityDirectoryElementId: "activityDirectory",
	
	/** The id referencing the button for uploading data to a server. This is useful for CSS customizations.
	 * 
	 * default = uploadDataButton
	 * @type String
	 */
	uploadDataButtonId: "uploadDataButton",
	
	/** The text label for the upload data button.  This is useful for CSS customizations.
	 * 
	 * default = activityDirectory
	 * @type String
	 */
	uploadDataButtonText: "Upload",
	
	/** The id referencing the button for uploading selected activities button.  This is useful for CSS customizations.
	 * 
	 * default = readSelectedButton
	 * @type String
	 */
	readSelectedButtonId: "readSelectedButton",
	
	/** The text label for the upload selected data button.  This is useful for CSS customizations.
	 * 
	 * default = Upload Selected
	 * @type String
	 */
	readSelectedButtonText: "Upload Selected",
	
	/** The id referencing the table that holds the activity directory data.  This is useful for CSS customizations.
	 * 
	 * default = activityDirectoryData
	 * @type String
	 */
	activityDirectoryDataId: "activityDirectoryData",
	
	/** Turns on the ability to select activities to upload, rather than all activities read off the device.
	 * 
	 * default = false
	 * @type boolean
	 */
	uploadSelectedActivities: false,
	
	/**Controls the view of the read data element. When
	 * set to <b>true</b> the element will only show after a
	 * device has been found.  When set to <b>false</> the
	 * element will show on page load.
	 * Behavior will depend on other settings such as
	 * and {@link #showReadDataElement}.
	 * 
	 * default= false
	 * @type Boolean
	 */
	showReadDataElementOnDeviceFound:		false,
	
	/**The id referencing the box containing read elements.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readBox
	 * @type String
	 */		
	readDataElementId:			"readBox",
	
	/**The id referencing the read data button.  This is useful for
	 * CSS customizations.
	 * 
	 * default = readDataButton
	 * @type String
	 */			
	readDataButtonId:			"readDataButton",
	
	/**The text on the read button.
	 * 
	 * @type String
	 */		
	readDataButtonText:			"Get Data",
	
	/**Controls the view of the cancel read data button. When
	 * set to <b>false</b> the button will never show.  When
	 * set to <b>true</> the button's behavior will depend on other
	 * settings such as {@link #showReadDataButton}, 
	 * and {@link #showReadDataElement}.
	 * 
	 * default= true
	 * @type Boolean
	 */	
	showCancelReadDataButton:		true,
	
	/**The id referencing the cancel read data button.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = cancelReadDataButton
	 * @type String
	 */		
	cancelReadDataButtonId:		"cancelReadDataButton",
	
	/**The text on the cancel read button.
	 * 
	 * @type String
	 */		
	cancelReadDataButtonText:	"Cancel Get Data",
	
	/**The status text that is displayed when user cancels the
	 * read progress.
	 * 
	 * @type String
	 */		
	cancelReadStatusText:		"Read cancelled",
	
	/**Controls the view of the device select box.
	 * When set to <b>true</b> the select device box will show when
	 * the display loads.
	 * When set to <b>false</b> the select device box will hide when
	 * the display loads.
	 * When {@link #showReadDataElement} is set to false, the results select
	 * box will never show.
	 * 
	 * default = false
	 *  
	 * @see #showReadDataElement	 
	 * @type Boolean
	 */		
	showReadResultsSelectOnLoad:	false,

	/**The class to set for select lists that are displaying results
	 * from a read operation.  This is useful for CSS customizations.
	 * 
	 * default = readResultsSelect
	 * @type String
	 */		
	readResultsSelectClass:			"readResultsSelect",
	
	/**The class to set for results elements.  This is useful for CSS customizations.
	 * 
	 * default = readResultsElement
	 * @type String
	 */		
	readResultsElementClass:		"readResultsElement",

	/**Display the route select dropdown.  When
	 * <@link #showReadDataElement> is set to false, the select
	 * track dropdown will not show.
	 * 
	 * default = true
	 * @see #showReadDataElement
	 * @type Boolean
	 */
	showReadRoutesSelect:		true,

	/**The id referencing the read routes element.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readRoutesElement
	 * @type String
	 */		
	readRoutesElementId	:		"readRoutesElement",
		
	/**The id referencing the route select dropdown.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readRoutesSelect
	 * @type String
	 */		
	readRoutesSelectId:			"readRoutesSelect",
	
	/**The label for the read routes select box.  Shows up next to the
	 * read routes select box.
	 * 
	 * @type String
	 */		
	readRoutesSelectLabel:		"Routes: ",	
		
	/**The id referencing the read routes select box label.  This is useful for
	 * CSS customizations.
	 * 
	 * default = readRoutesSelectLabel
	 * @type String
	 */			
	readRoutesSelectLabelId:	"readRoutesSelectLabel",		
		
	/**Display the track select dropdown.  When
	 * <@link #showReadDataElement> is set to false, the select
	 * track dropdown will not show.
	 * 
	 * default = true
	 * @see #showReadDataElement
	 * @type Boolean
	 */
	showReadTracksSelect:		true,		
		
	/**The id referencing the read tracks element.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readTracksElement
	 * @type String
	 */		
	readTracksElementId:		"readTracksElement",
	
	/**The id referencing the track select dropdown.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readTracksSelect
	 * @type String
	 */		
	readTracksSelectId:			"readTracksSelect",

	/**The label for the read tracks select box.  Shows up next to the
	 * read tracks select box.
	 * 
	 * @type String
	 */		
	readTracksSelectLabel:		"Tracks: ",

	/**The id referencing the read tracks select box label.  This is useful for
	 * CSS customizations.
	 * 
	 * default = deviceSelectLabel
	 * @type String
	 */			
	readTracksSelectLabelId:	"readTracksSelectLabel",

	/**The id referencing the read tracks element.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readTracksElement
	 * @type String
	 */		
	readWaypointsElementId:		"readWaypointsElement",

	/**Display the waypoint select dropdown.  When
	 * <@link #showReadDataElement> is set to false, the select
	 * waypoint dropdown will not show.
	 * 
	 * default = true
	 * @see #showReadDataElement
	 * @type Boolean
	 */	
	showReadWaypointsSelect:	true,
	
	/**The id referencing the waypoint select dropdown.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readWaypointsSelect
	 * @type String
	 */		
	readWaypointsSelectId:		"readWaypointsSelect",
	
	/**The label for the read waypoints select box.  Shows up next to the
	 * read tracks select box.
	 * 
	 * @type String
	 */		
	readWaypointsSelectLabel:	"Waypoints: ",

	/**The id referencing the read waypoints select box label.  This is useful for
	 * CSS customizations.
	 * 
	 * default = deviceSelectLabel
	 * @type String
	 */			
	readWaypointsSelectLabelId:	"readWaypointsSelectLabel",
	
	/**Display Google map to show tracks and laps that have been read.  When <@link #showReadDataElement> is 
	 * set to false, the Google map will not show.
	 * 
	 * default = false
	 * @see #showReadDataElement
	 * @type Boolean
	 */		
	showReadGoogleMap:			false,
	
	/**The id referencing the google map display.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readMap
	 * @type String
	 */		
	readGoogleMapId:			"readMap",
	
	/**Tells the plug-in what data type to read from the device.  Options for this
	 * are currently constants listed in {@link Garmin.DeviceControl.FILE_TYPES}, 
	 * and the values are: crs, gpx, gpi, or null to skip this option altogether and get the default data type from 
	 * the device.
	 * <p>
	 * This property works in conjunction with the following functions, based on the datatype:
	 * <p>
	 * For CRS and GPX:	Define the getWriteData() and getWriteDataFileName() functions in your options section.
	 * <p>
	 * For GPI: Define the getWriteData() and getWriteDataFileName() functions in your options section.
	 * 			The getGpiWriteDescription() function replaces getWriteData().
	 * <p>
	 * default value = Garmin.DeviceControl.FILE_TYPES.gpx
	 * @see #showReadDataElement
	 * @see Garmin.DeviceControl.FILE_TYPES
	 * @type String
	 */		
	readDataType:	"GPSData",
	
	/**Display the dropdown select box for selecting what type
	 * of data to read from the device.  When 
	 * <@link #showReadDataElement> is set to false, 
	 * this device type select will not show.
	 * 
	 * default = false
	 * @see #showReadDataElement
	 * @type Boolean
	 */		
	showReadDataTypesSelect:	false,
	
	/**The id referencing the data type select.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = readDataTypesSelect
	 * @type String
	 */			
	readDataTypesSelectId:		"readDataTypesSelect",
	
	/**The function called when data is successfully read from
	 * the device.  The function should have three arguements:
	 * 
	 * 	dataString - the xml received from the device in String format
	 *  dataDoc - the xml received from the device in Document format
	 *  extension - the file type extension of the data, used to determine
	 * 				the type of data received.
	 *  activities - list of <@link Garmin.Activity> parsed from the xml.
	 * 
	 * @see Garmin.Activity
	 * @type Function
	 */				
	afterFinishReadFromDevice:	null, //function(dataString, dataDoc, extension, activities){},

	/**Load tracks even if they don't have a timestamp (technically these are
	 * routes).  Set to false if you need to do synchronization with existing
	 * track log database (like MotionBased does).
	 * 
	 * default = true
	 * @see #_listTracks
	 * @type Boolean
	 */		
	loadTracksWithoutATimestamp:	true,
	
	// ================== Post Activity to Server ======================
	
	/** Callback function that defines how to update the status of posted activities. */
	updateActivityStatus:		null,
	
	/** The function called when a single activity is finished reading, and the data is ready to post.
	 * Inside this function you can post the data using AJAX or some other method.
     * There is one parameter to this function: the activity XML read.
     *  activityXml {String} - The XML datastring of the activity read from the device. 
     * 
     * @type Function
	 */
	postActivityHandler: 		null,
	
	/** Show the element to send data to a remote server. 
	 */
	showSendDataElement:		false,
	
	/**Controls the view of the send data element. When
	 * set to <b>true</b> the element will only show after a
	 * device has been found.  When set to <b>false</> the
	 * element will show on page load.
	 * Behavior will depend on other settings such as
	 * and {@link #showSendDataElement}.
	 * 
	 * default= false
	 * @type Boolean
	 */
	showSendDataElementOnDeviceFound:		false,
	
	/** The function called to retrieve the parameters to send to the remote server.
	 * This function has one parameter, the active device's XML.  The return
	 * value of this user-defined function should be in the form of a hash, like so:
	 * 
	 * {paramName:paramValue, anotherParamName:anotherParamValue}
	 * 
	 * You can choose to ignore the parameter if you don't need it.
	 * 
	 * @type Function
	 */
	getSendParameters:					null, // function(deviceXml) {}
	
//	/** Choose to send data asynchronously.
//	 * 
//	 * @type Boolean
//	 * 
//	 * default = true 
//	 */
//	sendDataAsynchronously:			true,
	
	/** The URL to send the data to.
	 */
	sendDataUrl:					null,
	
	/** The AJAX request options to use for sending data to a server.  To be used in conjunction with {@link #sendDataUrl}.
	 * 
	 * See the <a href="http://www.prototypejs.org/api/ajax/options">AJAX options page</a> for configurable options and default values. 
	 * 
	 * @type Object
	 */
	sendDataOptions:				null,
	
//	/** The type of HTTP request to make when sending data to a URL, such as POST or GET.
//	 *
//	 * default = "POST"
//	 * @type String  
//	 */
//	sendDataRequestType:			"POST",
	
	/**The id referencing the box containing send elements.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = sendBox
	 * @type String
	 */		
	sendDataElementId:			"sendBox",
	
	/**The id referencing the send data button.  This is useful for
	 * CSS customizations.
	 * 
	 * default = sendDataButton
	 * @type String
	 */			
	sendDataButtonId:			"sendDataButton",
	
	/**The text on the read button.
	 * 
	 * @type String
	 */		
	sendDataButtonText:			"Send Data",
	
	/** The callback function that will be passed the AJAX response after making the request. 
	 * @see #sendDataUrl
	 * @see #getSendParameters
	 * @param response object (see <a href="http://www.prototypejs.org/api/ajax/response">Ajax.Response</a> for response attributes)
	 * default = null
	 * @type function
	 */
	sendDataCallback:			null,

	// ================== Write Element Options ======================
	/**Start writing data to the device when one or more device(s)
	 * is found.
	 * 
	 * default = false
	 * 
	 * @see #autoFindDevices
	 * @see #autoReadData
	 * @type Boolean
	 */					
	autoWriteData:				false,
	
	/**Display the user interface associated with writing to
	 * a connected device.
	 * 
	 * default = false
	 * @type Boolean
	 */	
	showWriteDataElement:		false,

	/**Controls the view of the write data element. When
	 * set to <b>true</b> the element will only show after a
	 * device has been found.  When set to <b>false</> the
	 * element will show on page load.
	 * Behavior will depend on other settings such as
	 * and {@link #showWriteDataElement}.
	 * 
	 * default= false
	 * @type Boolean
	 */
	showWriteDataElementOnDeviceFound:		false,
	
	/**The id referencing the box containing write elements.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = writeBox
	 * @type String
	 */
	writeDataElementId:			"writeBox",
	
	/**The id referencing the write data button.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = writeDataButton
	 * @type String
	 */		
	writeDataButtonId:			"writeDataButton",
	
	/**The text on the write button.
	 * 
	 * @type String
	 */		
	writeDataButtonText:		"Write",
	
	/**Controls the view of the cancel write data button. When
	 * set to <b>false</b> the button will never show.  When
	 * set to <b>true</> the button's behavior will depend on other
	 * settings such as {@link #showWriteDataButton}, 
	 * and {@link #showWriteDataElement}.
	 * 
	 * default= true
	 * @type Boolean
	 */	
	showCancelWriteDataButton:		true,
	
	/**The id referencing the cancel write data button.  This is 
	 * useful for CSS customizations.
	 * 
	 * default = cancelWriteDataButton
	 * @type String
	 */		
	cancelWriteDataButtonId:	"cancelWriteDataButton",
	
	/**The text on the cancel write button.
	 * 
	 * @type String
	 */		
	cancelWriteDataButtonText:  "Cancel Write",
	
	/**The function called when data is successfully written to
	 * the device.  This method takes two parameters:
	 *  success {Boolean} - true if data was written
	 *  display {Garmin.DeviceDisplay} - the current instance of the DeviceDisplay
	 * @type Function
	 */				
	afterFinishWriteToDevice:	null, //function(success, display) {},
	
	/**Array of filters to sequencialy apply to activities before being sent or displayed.
	 * 
	 * @see #Garmin.FILTERS
	 * @type Array
	 */				
	dataFilters:				[],	//[Garmin.FILTERS.historyOnly]
	
	/**The function called by the display in order to acquire the data
	 * that will be written to the device during the writing operation.
	 * 
	 * This function should return a String.
	 * 
	 * @see #getWriteDataFileName
	 * @type Function
	 */
	getWriteData:				null, //function() { return $("myTextAreaId").value; },
	
	/**The function called by the display in order to acquire the filename
	 * of the data that will be written to the device during the writing 
	 * operation.
	 * 
	 * This function should return a String.
	 * 
	 * @see #getWriteData
	 * @type Function
	 */
	getWriteDataFileName:		function(){ return "myData.gpx"; },
	
	/**DEPRECATED (see getBinaryWriteDescription) - The function called by the display in order to acquire the data
	 * that will be written to the device during the writing operation.
	 * 
	 * This function should return an array of strings where adjacent items
	 * indicate the source (URL) of the gpi to be written and the destination
	 * (device path and filename) to write to the device.
	 *
	 * e.g.: [SOURCE,DESTINATION,SOURCE2,DESTINATION2] add as many source/destination 
	 * pairs as you'd like.
	 * 
	 * 
	 * @type Function
	 */
	getGpiWriteDescription:		null, //function() { return ["http://connect.garmin.com/SampleGpi.gpi", "Garmin\\POI\\Test.gpi"] },
	
	/**The function called by the display in order to acquire the data
	 * that will be written to the device during the writing operation.
	 * 
	 * This function should return an array of strings where adjacent items
	 * indicate the source (URL) of the binary data to be written and the destination
	 * (device path and filename) to write to the device.
	 *
	 * e.g.: [SOURCE,DESTINATION,SOURCE2,DESTINATION2] add as many source/destination 
	 * pairs as you'd like.
	 * 
	 * 
	 * @type Function
	 */
	getBinaryWriteDescription:		null, //function() { return ["http://connect.garmin.com/SampleGpi.gpi", "Garmin\\POI\\Test.gpi"] },
	
	
	/**Tells the plug-in what data type to write to the device.  
	 * Options are "gpx" which will use {@link #getWriteData} to get the data
	 * or "gpi" which will use {@link #getGpiWriteDescription} to get the data to
	 * save to the device.
	 *
	 * default = Garmin.DeviceControl.FILE_TYPES.gpx
	 * @see #showWriteDataElement
	 * @see #getWriteData
	 * @see #getGpiWriteDescription
	 * @type String
	 */		
	writeDataType:	"GPSData",
	
	/** Optional - Restricts transfer of data to specifically listed devices ONLY.  This is an array list of 
	 * device models, and is case sensitive for now without white spaces.  
	 * 
	 * ex: To restrict transfers to the Forerunner 305, the array would contain "Forerunner305"
	 * 
	 * At some point we may want to extract these names to constants, but Garmin has so many models
	 * that that seems crazy.  
	 */
	restrictByDevice:			[],
	
	/** Sets the required version of the Communicator Plugin that is compatible with the given application.
	 * This value is set using an array of the major and minor build numbers.  i.e. version 2.2.0.1 is given by [2,2,0,1].
	 * 
	 * default = [2,2,0,1] (for version 2.2.0.1)
	 * 
	 */
	pluginRequiredVersion:			[2,2,0,1],

	/** Sets the latest plugin version number.  This represents the latest version available for download at Garmin.
	 * We will attempt to keep the default value of this up to date with each API release, but this is not guaranteed,
	 * so set this to be safe or if you don't want to upgrade to the latest API.
	 * 
	 * @param reqVersionArray {Array} The latest version to set to.  In the format [versionMajor, versionMinor, buildMajor, buildMinor]
	 * 			i.e. [2,2,0,1]
	 * 
	 * default = [2,5,1,0] (for version 2.5.1.0)
	 */	
	pluginLatestVersion:			[2,5,1,0],
	
	
	// ================== Internationalization ======================
	/** Status message exposed for internationalization. @type String */
	pluginUnlocked: "Plug-in initialized.  Find some devices to get started.",
	/** Status message exposed for internationalization. @type String */
	pluginNotUnlocked: "The plug-in was not unlocked successfully",
	/** Read data selection option exposed for internationalization. @type String */
	gpsData: "GPS Data",
	/** Read data selection option exposed for internationalization. @type String */
	trainingData: "Training Data",
	/** Status message exposed for internationalization. Prepended to the device name after user selects which device to use.  i.e. "Using Diana's Forerunner 305" @type String 
	 * default = "Using "
	 * @type String 
	 */
	using: "Using ",
	/** Track list box item template exposed for internationalization. @type String */
	trackListing: "#{date} (Duration: #{duration})",
	/** Status message template exposed for internationalization. @type String */
	dataFound: "#{routes} routes, #{tracks} tracks and #{waypoints} waypoints found",
	/** Status message exposed for internationalization. @type String */
	writingToDevice: "Writing data to to the device",
	/** Status message exposed for internationalization. @type String */
	writtenToDevice: "Data written to the device",
	/** Status message exposed for internationalization. @type String */
	writingCancelled: "Writing cancelled",
	/** Status message exposed for internationalization. @type String */
	overwritingFile: "Overwriting file",
	/** Status message exposed for internationalization. @type String */
	notOverwritingFile: "Will not be overwriting file",
	/** Status message exposed for internationalization. @type String */
	lookingForDevices: "Looking for connected devices...",
	/** Status template exposed for internationalization. When single device is found. @type String */
	foundDevice: "Found #{deviceName}",
	/** Status template exposed for internationalization. When multiple devices are found. @type String */
	foundDevices: "Found #{deviceCount} devices",
	/** Status message exposed for internationalization. When user cancels Find Devices.@type String */
	findCancelled: "Find cancelled",
	/** Status message exposed for internationalization. When reading data from the device. @type String */
	dataReadProcessing: "Data read from device. Processing...",
	/** Status message exposed for internationalization. When large files are being written to device.  @type String */
	dataDownloadProcessing: "Processing data to write... ",
	/** Status message exposed for internationalization. When uploads have completed.  @type String */
	uploadsFinished: "Transfer Complete",
	/** Error message exposed for internationalization. @type String */
	noParseSupportForType: "The plugin does not have parsing support for file type ",
	/** Request message exposed for internationalization. @type String */
	installNow: "Install now?",
	/** Request message exposed for internationalization. @type String */
	downloadAndInstall: "Download and install now",
	/** Powered-by message. Required for plugin license agreement. @type String */
	poweredByGarmin: "Powered by <a href='http://www.garmin.com/products/communicator/' target='_new'>Garmin Communicator</a>",
	/** Status message for devices that are not in the allowed devices list. @type String */
	restrictByDeviceStatusText:	"Your device is not supported by this application.",
	/** Error message to display when user attempts to upload 0 activities. @type String */
	errorActivitySelect: "At least one activity must be selected before attempting to upload.",
	/** Column header for the Date fields in the activity directory.  Useful for CSS customizations and internationalization.  @type String */
	activityDirectoryHeaderDate: "<b>Date</b>",
	/** Column header for the Duration fields in the activity directory.  Useful for CSS customizations and internationalization.  @type String */
	activityDirectoryHeaderDuration: "<b>Duration</b>",
	/** Status message to display when activities are being uploaded.  @type String */
	uploadingActivities: "Uploading activities...",
	/** The innerHTML to use for status while an activity is processing (for upload).  Define using the img tag if you wish to use an image.  
	 * 
	 * Default = <img src="style/ajax-loader.gif" />
	 * 
	 * which is an animated loader image.  You can customize this to be text instead of an image by not using the image tags.   @type String */
	statusCellProcessingImg: '<img src="style/ajax-loader.gif" />',
	/** Status text to display when the plugin is sending data to a remote server.  @type String */
	sendingDataToServer: "Sending data to server...",
	/** Error message to display when there is an error getting the HTTP response back from the HTTP request.  @type String */
	errorHttpResponse: "Unable to get valid response from HTTP request object.  Ensure that your options are set correctly and try again."
};

/*
 * DisplayBootstrap - not sure what form this should take: class or global var 
 * It should probably be in the Garmin namesapce.
 * 
 * Dynamic include of required libraries and check for Prototype
 * Code taken from scriptaculous (http://script.aculo.us/) - thanks guys!
 */
var GarminDeviceDisplay = {
	require: function(libraryName) {
		// inserting via DOM fails in Safari 2.0, so brute force approach
		document.write('<script type="text/javascript" src="'+libraryName+'"></script>');
	},

	load: function() {
		if((typeof Prototype=='undefined') || 
			(typeof Element == 'undefined') || 
			(typeof Element.Methods=='undefined') ||
			parseFloat(Prototype.Version.split(".")[0] + "." +
			Prototype.Version.split(".")[1]) < 1.5) {
			throw("GarminDeviceDisplay requires the Prototype JavaScript framework >= 1.5.0");
		}

		$A(document.getElementsByTagName("script"))
		.findAll(
			function(s) {
				return (s.src && s.src.match(/GarminDeviceDisplay\.js(\?.*)?$/))
			}
		)
		.each(
			function(s) {
				var path = s.src.replace(/GarminDeviceDisplay\.js(\?.*)?$/,'../../');
				var includes = s.src.match(/\?.*load=([a-z,]*)/);
				var dependencies = 'garmin/device/GarminDeviceControl' +
									',garmin/device/GarminDevicePlugin' +
									',garmin/device/GarminGpsDataStructures' +
									',garmin/device/GoogleMapController' +
									',garmin/device/GarminDevice' +
									',garmin/device/GarminPluginUtils' +
									',garmin/api/GarminRemoteTransfer' +
									',garmin/util/Util-XmlConverter' +
									',garmin/util/Util-Broadcaster' +
									',garmin/util/Util-DateTimeFormat' +
									',garmin/util/Util-BrowserDetect' +
									',garmin/util/Util-PluginDetect' +
									',garmin/device/GarminObjectGenerator' +
									',garmin/activity/GarminMeasurement' +
									',garmin/activity/GarminSample' +
									',garmin/activity/GarminSeries' +
									',garmin/activity/GarminActivity' +
									',garmin/activity/GarminActivityFilter' +
									',garmin/activity/TcxActivityFactory' +									
									',garmin/activity/GpxActivityFactory';
			    (includes ? includes[1] : dependencies).split(',').each(
					function(include) {
						GarminDeviceDisplay.require(path+include+'.js') 
					}
				);
			}
		);
	}	
}

GarminDeviceDisplay.load();
