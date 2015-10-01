var map;
var markers = [];
var LatLng = { lat: 37.78, lng: -122.44};
var maparr = [{name: "San Francisco", LatLng:{ lat: 37.78, lng: -122.44}, info: "Visit San Francisco."}, 
{name: "London", LatLng:{ lat: 51.50, lng: 0.12}, info: "Visit London."}, 
{name: "Gibraltar", LatLng:{ lat: 36.14, lng: 5.35}, info: "Visit Gibraltar."}, 
{name: "New York", LatLng:{ lat: 40.71, lng: -74.00}, info: "Visit New York"},
{name: "Las Vegas", LatLng:{ lat: 36.12, lng: -115.17}, info: "Visit Las Vegas."},
{name: "Los Angeles", LatLng:{ lat: 34.05, lng: -118.25}, info: "Visit Los Angeles."}];

$(document).ready( function (){
  markerPush(maparr)
  getMap();
  setMapOnAll(map);

});
  

  function getMap () {
    map = new google.maps.Map(document.getElementById('map-canvas'), {
      center: { lat: 37.78, lng: -122.44},
      zoom: 6
    });
     
  };

  function markerPush(arr) {
    arr.forEach(function(el) {
    var marker = new google.maps.Marker({
      position: el.LatLng,
      map: map,
      title: el.name

      
    })
    var info = createInfoWindow(el.info);
    google.maps.event.addListener(marker, 'click', function() {
      info.open(map,marker);

    });
    markers.push(marker)
  });
};

  function setMapOnAll(map) {
    for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }

};

function createInfoWindow(text){
  var infowindow = new google.maps.InfoWindow({
    content: text
   
  });
  return infowindow;
}