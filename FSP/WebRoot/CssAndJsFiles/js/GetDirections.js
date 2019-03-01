var rendererOptions = { draggable: true };
var directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
var directionsService = new google.maps.DirectionsService();
var map, geocoder;

function initialize() {
	
	geocoder = new google.maps.Geocoder();
	
	var mapOptions = {
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			streetViewControl: false,
			mapTypeControl: true,
			mapTypeControlOptions: {
				style:google.maps.MapTypeControlStyle.DROPDOWN_MENU
			}		
	};
	
	var input = document.getElementById('inputRouteStart');
	var autocomplete = new google.maps.places.Autocomplete(input);
	
	map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
	
	directionsDisplay.setMap(map);
	directionsDisplay.setPanel(document.getElementById('directions-panel'));

	// Try HTML5 geolocation
	if (navigator.geolocation) {
		var positionOptions = {
				enableHighAccuracy: true,
				timeout: 10 * 1000 
		};
		
		if(navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				
				var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
				
				map.setCenter(pos);
				
				var infowindow = new google.maps.InfoWindow({
					content: 'You are HERE !!!',
					maxWidth: 200,
				});
				
				var marker = new google.maps.Marker({
					map: map,
					position: pos,
					animation:google.maps.Animation.BOUNCE,
				});
				
				google.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.open(map, marker);
				});
				
				google.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
				
				// Write the formatted address
				codeLatLng(pos);
			},
			function() {
				handleNoGeolocation(true);
			});
		} else {
			// Browser doesn't support Geolocation
			handleNoGeolocation(false);
		}
	}
}

function handleNoGeolocation(errorFlag) {
	if (errorFlag) {
		var content = 'Sorry your current location could not be found. This is the default location. Use the form below to get the directions.';
	} else {
		var content = 'Error: Your browser doesn\'t support geolocation.';
	}
	
	var defaultLatlng = new google.maps.LatLng(28.634272, 77.445813);
	
	var infowindow = new google.maps.InfoWindow({
		map: map,
		position: defaultLatlng,
		content: content,
	    maxWidth: 200,
	    height: 200
	});
	
	var marker = new google.maps.Marker({
		position: defaultLatlng,
		map: map,
	});
	
	google.maps.event.addListener(marker, 'mouseover', function() {
		infowindow.open(map, marker); 
	});
	
	google.maps.event.addListener(marker, 'mouseout', function() {
		infowindow.close();
	});

	map.setCenter(defaultLatlng);
}

function calcRoute() {
	
	var start = document.getElementById('inputRouteStart').value;
	var end = document.getElementById('inputRouteDest').value;
	
	var request = {
			origin: start,
			destination: end,
			travelMode: google.maps.TravelMode.DRIVING
	};
	directionsService.route(request, function(result, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(result);
	    }
		else {
			
			// alert an error message when the route could not be calculated
			if (status == 'NOT_FOUND') {
				alert('Error: Please enter the correct starting and destination points.');
			}
			else if (status == 'ZERO_RESULTS') {
				alert('Error: No route could be found between the starting and destination points.');
			}
			else if (status == 'INVALID_REQUEST') {
				alert('Error: The DirectionsRequest was invalid.');         
			}
			else if (status == 'OVER_QUERY_LIMIT') {
				alert('Error: The webpage has gone over the requests limit in too short a period of time.');
			}
			else if (status == 'REQUEST_DENIED') {
				alert('Error: This webpage is not allowed to use the directions service.');
			}
			else if (status == 'UNKNOWN_ERROR') {
				alert('Error: Directions request could not be processed due to a server error. The request may succeed if you try again.');
			}
			else {
				alert('Error: There was an unknown error in your request.');
			}
		}
	});
}

function codeLatLng(latLng) {
	geocoder.geocode({
		"latLng": latLng
	},
	
	function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			
			// if the GeoLocation was recognized and an address was found
			if (results[0]) {
				
				// compose a string with the address parts
				var address = results[0].formatted_address;
				
				// set the located address to the link, show the link and add a click event handler
				$('#autoLink span').html(address).parent().show().click(function() {
					
					// OnClick, set the GeoCoded address to the starting location in the FormField
					$('#inputRouteStart').val(address);
				});
			}
			else {
				alert('No results found');
		    }
		}
		else {
			alert('Geocoder failed due to: ' + status);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);