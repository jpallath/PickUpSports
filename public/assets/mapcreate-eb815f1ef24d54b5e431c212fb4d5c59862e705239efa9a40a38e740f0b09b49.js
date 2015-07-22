function addMarker(e,o,a,r){deleteMarkers(o);var s=new google.maps.Marker({position:e,map:o,draggable:!0});markers.push(s),r&&reverseCodeLatLng(s.position,o)}function setAllMap(e){for(var o=0;o<markers.length;o++)markers[o].setMap(e)}function clearMarkers(){setAllMap(null)}function showMarkers(e){setAllMap(e)}function deleteMarkers(){clearMarkers(),markers=[]}function addressToPin(e,o){var a=new google.maps.Geocoder,r=a.geocode({address:e},function(e,r){r==google.maps.GeocoderStatus.OK?(console.log(e[0].geometry.location),addMarker(e[0].geometry.location,o,a,!1)):alert("Geocode was not successful for the following reason: "+r)});return r}function reverseCodeLatLng(e){var o=new google.maps.Geocoder;o.geocode({location:e},function(e,o){if(o==google.maps.GeocoderStatus.OK)if(e[1]){console.log(e[0].formatted_address);var a=e[0].formatted_address;addressArray=a.split(","),console.log(addressArray),$("#address").val(addressArray[0]),$("#city").val(addressArray[1]),$("#state").val(addressArray[2])}else console.log("No results found");else console.log("Geocoder failed due to: "+o)})}function initialize(){var e=document.getElementById("map-canvas");console.log(document);var o={center:new google.maps.LatLng(40.7127,-74.0059),zoom:14,mapTypeId:google.maps.MapTypeId.ROADMAP,draggableCursor:"default",scrollwheel:!1},a=new google.maps.Map(e,o),r=new google.maps.Geocoder,s=!1,n=!0,l=!0;google.maps.event.addListener(a,"dragstart",function(){l=!1}),google.maps.event.addListener(a,"dragend",function(){l=!0}),google.maps.event.addListener(a,"zoom_changed",function(){l=!1}),google.maps.event.addListener(a,"click",function(e){l&&n&&(deleteMarkers(a),addMarker(e.latLng,a,r,!0),showMarkers(a))}),google.maps.event.addListener(a,"dblclick",function(){s=!0}),$("#display").click(function(){var e=$("#address").val()+", "+$("#city").val()+", "+$("#state").val();console.log("clicked"),addressToPin(e,a)}),console.log("initialized mapcreateJS Map")}var markers=[];google.maps.event.addDomListener(window,"load",initialize);