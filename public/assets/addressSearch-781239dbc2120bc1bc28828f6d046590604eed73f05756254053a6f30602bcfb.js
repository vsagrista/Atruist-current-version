var markers = [];
var myLatLng = {lat: 41.391552999999995, lng: 2.1769064};
var map;

window.initMap = function () {
	  if (navigator.geolocation) {
	     navigator.geolocation.getCurrentPosition(function (position) {
	         initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	         console.log(position.coords.latitude, position.coords.longitude)
	         map.setCenter(initialLocation);
	     });
	 }

map = new google.maps.Map(document.getElementById('map'), {
zoom: 8,
center: myLatLng
});
	var geocoder = new google.maps.Geocoder();
   	geocodeAddress(geocoder, map);
	document.getElementById('submit').addEventListener('click', function() {
		geocodeAddress(geocoder, map);
	});
  $(document).keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
        geocodeAddress(geocoder, map); 
        setTimeout(function(){ checkReadyToSave() }, 1000); 
    }
  })
}


function geocodeAddress(geocoder, resultsMap) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      clearMarkers();
      addMarker(results[0].geometry.location);
    }
  });
}

function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

// Sets the map on all markers in the array.
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

function addressHasCorrectFormat() {
  var enteredAddress = $('#address').val();
  return enteredAddress.split(",").length == 3;
}

function markerIsPresent() {
  return markers.length > 0;
}

function makeSaveButtonClickable() {
  $('#save-address').prop('disabled', false);
  $('#save-address').removeClass('btn-primary');
  $('#save-address').addClass('btn-success');
}

function makeSaveBtnUnclickable() {
  $('#save-address').prop('disabled', true);
  $('#save-address').removeClass('btn-success');
  $('#save-address').addClass('btn-primary');
}

function checkReadyToSave() {
  if (markerIsPresent()) {
    if(addressHasCorrectFormat()) {
      makeSaveButtonClickable();
    }
    else {
      alert('Incorrect format');
    }
  }
}

$('#address').keypress(function() {
  deleteMarkers();
  makeSaveBtnUnclickable();
})

$('#address').keyup(function(event) {
  if(event.keyCode == 8) {
    deleteMarkers();
    makeSaveBtnUnclickable();
  }
})

$('#submit').on('click', function(){
  setTimeout(function(){ checkReadyToSave() }, 1000);
})
