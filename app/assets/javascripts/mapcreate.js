//********************Marker show and hide Methods********************//

//Mapcreate

// Add a marker to the map and push to the array.
function addMarker(location, map, geocoder, pinToAddress) {
	//On click, pinToAddress is true 
	deleteMarkers(map)
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        draggable:true
  });
//    google.maps.event.addListener(marker, 'click', function(event){
//        console.log("click listener on marker added");
//        console.log(marker.position);
//        reverseCodeLatLng(marker.position, map, geocoder);
//
//     });
//    google.maps.event.addListener(marker, 'rightclick', function(){
//        console.log("rightclick listener on marker added!");
//
//    });
    markers.push(marker);
	if(pinToAddress){
		reverseCodeLatLng(marker.position, map);
	}
}

// Sets the map on all markers in the array.
function setAllMap(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers(map) {
    setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers(map) {
    setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers(map) {
    clearMarkers();
    markers = [];
}

//********************Marker show and hide Methods********************//

//******************** Geocoding ********************//
function addressToPin(address, map) {
	var geocoder = new google.maps.Geocoder();
  var thing = geocoder.geocode( { 'address': address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
			console.log(results[0].geometry.location);
			addMarker(results[0].geometry.location, map, geocoder, false)
		
    } 
		else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  })
	return thing;
}

function reverseCodeLatLng(position, map) {
//    var input = document.getElementById('latlng').value;
//    var latlngStr = input.split(',', 2);
//    var latlng = new google.maps.LatLng(latlngStr[0], latlngStr[1]);
	 var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'location': position}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
//                console.log(results);
                console.log(results[0].formatted_address);
							var formattedResult = results[0].formatted_address;
								addressArray = formattedResult.split(",");
							console.log(addressArray);
							$('#address').val(addressArray[0])
							$('#city').val(addressArray[1])
							$('#state').val(addressArray[2])
//							console.log(results[3]);
//                console.log(results[1].formatted_address);
//                map.setZoom(11);
//                marker = new google.maps.Marker({
//                    position: latlng,
//                    map: map
//                });
//                infowindow.setContent(results[1].formatted_address);
//                infowindow.open(map, marker);

        }
        else {
                console.log('No results found');
            }
        }
        else {
            console.log('Geocoder failed due to: ' + status);
        }
    });
}


//******************** Geocoding ********************//
//Marker container
var markers = [];

//Initialize
function initialize() {

    //get map element
    var mapCanvas = document.getElementById('map-canvas');
    console.log(document);
    //adjust map options
    var mapOptions = {
        center: new google.maps.LatLng(40.7127, -74.0059),
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        draggableCursor: 'default',
        scrollwheel: false,
    }
    //Make the map & the geocoder!
    var map = new google.maps.Map(mapCanvas, mapOptions)
		var geocoder = new google.maps.Geocoder();
 

    //*******************EVENT LISTENERS*******************//

    var doubleclick = false;
    //
    var markerFlag = true;

    //Used as a flag to seperate a long click from a drag
    var mapClicked = true;

    //Drag Start
    google.maps.event.addListener(map, 'dragstart', function() {
        mapClicked = false;
    });

    //Drag End
    google.maps.event.addListener(map, 'dragend', function() {
        mapClicked = true;
    });

    //Zoom change
    google.maps.event.addListener(map, 'zoom_changed', function() {
        mapClicked = false;
    });


    //Click & LongClick
    google.maps.event.addListener(map, 'click', function(event){
        var move = false;

        if (mapClicked && markerFlag) {
            deleteMarkers(map);
            addMarker(event.latLng, map, geocoder, true);
            showMarkers(map);
        }
  
    });

    //Double Click
    //Zoom change
    google.maps.event.addListener(map, 'dblclick', function() {
        doubleclick = true;
    });
	
	//Display button
	$( "#display" ).click(function() {
		var address = $('#address').val()+", "+$('#city').val()+", "+$('#state').val()
  	console.log("clicked");
		addressToPin(address, map)
});

    //*******************END EVENT LISTENERS*******************//

    //TO grey out boxes, just don't turn on event listeners until Sport, Date and Time are filled
	console.log("initialized mapcreateJS Map")
}


google.maps.event.addDomListener(window, 'load', initialize);


//marker drag:draggable
//marker on click

//TODO


//Geolocation from marker
//custom marker
//custom map design
//custom what appears?
//double click?
//RIGHT CLICK PROBLEM
