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
 * @fileoverview Garmin.RemoteTransfer is a high-level API to transfer data to remote servers using POST, web service calls, and the like.
 * 
 * @author Diana Chow diana.chow at garmin.com
 * @version 1.0
 */
/** Provides the easiest avenue for getting a working instance of the plug-in onto your page.
 * Generates the UI elements and places them on the page.
 *
 * @class Garmin.RemoteTransfer
 * @constructor 
 * 
 * requires Prototype and Garmin.DeviceDisplay
 */
Garmin.RemoteTransfer = function(){}; //just here for jsdoc
//Garmin.RemoteTransfer  = {
Garmin.RemoteTransfer = Class.create();
Garmin.RemoteTransfer.prototype = {
	
	initialize: function() {
	},
	
	/** Open a REST request to a web service.  The JSON result is returned (if any) along 
	 * with request status and any error info provided by the HTTP response.
	 * 
	 * @param type - the type of REST call to make
	 * @param url - the URL of the web service endpoint
	 * @param async - true for async, false for synch. 
	 * @param parameters - parameters for the request, if any.  Should be in the hash format: 
	 * 	{paramName:paramValue, anotherParamName:anotherParamValue} 
	 * @return a response hash containing the JSON response object, and an error message if there was one. 
	 * 	message if available.  Ids of the response elements are as follows: json, error.  {json, error }
	 */
	openRequest: function(url, ajaxOptions) {
		var ajaxResponse;
		var apiResponse;
		var errorMsg;
		
		// Set default options that are unique to the plugin
		if( ajaxOptions.on500 == null) {
			ajaxOptions.on500 = function(xhr) {
				// Pass the general exception along for all 500 errors
				errorMsg = xhr.statusText;
			};
		}
		if( ajaxOptions.onFailure == null ) {
			ajaxOptions.onFailure = function(xhr) {
				// Pass the message in the exception along for all other errors.
				errorMsg = Garmin.RemoteTransfer.MESSAGES.generalException;
				throw new Error(xhr.statusText);
			};
		}
		
		ajaxOptions.onComplete = function(ajaxResponseObject) {
			ajaxResponse = ajaxResponseObject;
		}
		
		var ajaxRequest = new Ajax.Request(url, ajaxOptions);
		
		// No response and no error.  So far this means cross-domain issue.  
		if( ajaxResponse == null && errorMsg == null) {
			errorMsg = Garmin.RemoteTransfer.MESSAGES.generalException;
			throw new Error(Garmin.RemoteTransfer.MESSAGES.noResponseException);
		}
		apiResponse = {response: ajaxResponse, error: errorMsg};
		
		return apiResponse;
	}
};

Garmin.RemoteTransfer.MESSAGES = {
	generalException: "An error occured while completing the request.",
	noResponseException: "No response from the URL.  Check URL and domain permissions."
};