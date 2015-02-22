// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// enable desktop notifications...
// function requestPermission(callback){
//   Notification.requestPermission(function(permission){
//     if(permission==="granted"){
//       callback();
//     }
//   });
// }
// requestPermission(requestLocation);


function requestLocation(callback){

  console.log("requesting location.....");

  var options = {
    enableHighAccuracy: true,
    timeout: 5000,
    maximumAge: 0
  };

  if( navigator.geolocation ) {
    console.log("Geolocation available............")
    navigator.geolocation.getCurrentPosition(onSuccess, onError, options);
  }else{
    console.log("Warning: Geolocation NOT available............");
  }

  function onSuccess( position ){
    console.log("Geolocation: onSuccess............");
    callback(position);
  }

  function onError( error ){
    console.log("Error when retrieven location - getCurrentPosition");
    console.log(error);
  }
}

function getCoordinates( position ){
  console.log("getting Coordinates...");
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  getMap(latitude, longitude);
}

function getMap(lat, lon){

  //var url = http://maps.googleapis.com/maps/api/staticmap?size=1000x450&markers=icon:http://chart.apis.google.com/chart?chst=d_map_pin_icon%26chld=cafe%257C996600%7C224+West+20th+Street+NY%7C75+9th+Ave+NY%7C700+E+9th+St+NY&sensor=true_or_false

  // ejemplo marcadores mapa google

  // http://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
  // &markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318
  // &markers=color:red%7Ccolor:red%7Clabel:C%7C40.718217,-73.998284&sensor=false

  var width = 900;
  var height = 600;
  var zoom = 20;
  var sensor = true;

  //var url = "http://maps.googleapis.com/maps/api/staticmap?center=" + lat + "," + lon + "&zoom="+zoom+"&size="+width+"x"+height+"&sensor="+sensor;
  var url = "http://maps.googleapis.com/maps/api/staticmap?"+"size="+width+"x"+height+"&markers=color:blue%7C" + lat + "," + lon + "&sensor="+sensor;

  $("#location-map")[0].src = url;

}

requestLocation(getCoordinates);

