// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function initialize() {

	var lostObjects = []
	var namesAry = $(".item-name");
	var latssAry = $(".item-latitude");
	var longsAry = $(".item-longitude");

	for(var i=0; i<namesAry.length; i++){
		lostObjects[i] = [
			namesAry[i].innerHTML,
			latssAry[i].innerHTML,
			longsAry[i].innerHTML,
			i+1
		]
	}

  var mapOptions = {
  	center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }

  // To add the marker to the map, use the 'map' property
  var map = new google.maps.Map(document.getElementById("map-container"), mapOptions);
	setMarkers(map, lostObjects);
}

function setMarkers(map, locations) {

  // Add markers to the map

  // Marker sizes are expressed as a Size of X,Y
  // where the origin of the image (0,0) is located
  // in the top left of the image.

  // Origins, anchor positions and coordinates of the marker
  // increase in the X direction to the right and in
  // the Y direction down.
  // var image = {
  //   url: 'http://cdn.flaticon.com/png/256/1252.png',
  //   // This marker is 20 pixels wide by 32 pixels tall.
  //   size: new google.maps.Size(20, 32),
  //   // The origin for this image is 0,0.
  //   origin: new google.maps.Point(0,0),
  //   // The anchor for this image is the base of the flagpole at 0,32.
  //   anchor: new google.maps.Point(0, 32)
  // };

  // Shapes define the clickable region of the icon.
  // The type defines an HTML &lt;area&gt; element 'poly' which
  // traces out a polygon as a series of X,Y points. The final
  // coordinate closes the poly by connecting to the first
  // coordinate.
  // var shape = {
  //     coords: [1, 1, 1, 20, 18, 20, 18 , 1],
  //     type: 'poly'
  // };

  for (var i = 0; i < locations.length; i++) {
    var beach = locations[i];
    var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: beach[0],
        zIndex: beach[3]
    });
		google.maps.event.addListener(marker, 'click', markerClickedHndlr);
  }
}

// function drop() {
//   for (var i =0; i < markerArray.length; i++) {
//     setTimeout(function() {
//       addMarkerMethod();
//     }, i * 200);
//   }
// }

function markerClickedHndlr(event){

	console.log('--- markerClickedHndlr ---');
	console.log( event );
	console.log( event.target.getAnimation() );

	// if (marker.getAnimation() != null) {
	//    marker.setAnimation(null);
	//  } else {
	//    marker.setAnimation(google.maps.Animation.BOUNCE);
	//  }
}

function loadScript() {
	var apiKey = "AIzaSyDGnXNHDMgy5PpgbqOiAr5nrh2mvfrHs1I";
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "https://maps.googleapis.com/maps/api/js?sensor=TRUE_OR_FALSE&callback=initialize";
  document.body.appendChild(script);
}

function getUrlParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam)
        {
            return sParameterName[1];
        }
    }
}

$( document ).ready(function() {

  var reporting = getUrlParameter('reporting');
  var lost = $("#lost");
  var found = $("#found");

  if( $("#map-container")[0] != undefined ){
    loadScript();
  }

  $('#tabs').tab();

});
