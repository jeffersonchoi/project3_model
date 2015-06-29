// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize);
google.maps.event.addDomListener(window, 'page:load', initialize);

var stopsPath704 = [];
var busLocations = [];
var testStops = [
  new google.maps.LatLng(34.07316, -118.4012699),
  new google.maps.LatLng(34.0849099, -118.38363)
];
// Initialize Google Map
function initialize() {

// Define mapProperties
  var mapProperties = {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }

// Define my_map to be map rendered on index page, labeled as "address-map"
  var my_map = new google.maps.Map(document.getElementById("address-map"), mapProperties);
// Define variable "url" as pathname in json format
  var url = window.location.origin + window.location.pathname + ".json"
// AJAX request for our seeded data rendered as json
  $.get(url, function(results){
// Sets our data as array, equal to variable "results", if not already in array form
    if(!(results instanceof Array)) results = [results]
// Defines variable "bounds" as the LatLngBounds of our map
    var bounds = new google.maps.LatLngBounds();
// Pushing stop locations into stopsPath704 array
    // var stopsPath704 =[];
// For loop for stop positions
    for (var i = 0; i < results[0].stops.length; i++) {
      var allStopPositions = new google.maps.LatLng(results[0].stops[i].latitude, results[0].stops[i].longitude)
      stopsPath704.push(allStopPositions)
      var marker = new google.maps.Marker({
        position: allStopPositions,
        icon: {
          path: google.maps.SymbolPath.CIRCLE,
          scale: 3,
          fillColor: '#FF0000',
          strokeColor: '#FF0000',
          fillOpacity: 1,
        },
      });

      // Coloring route lines of different routes
      var path704 = new google.maps.Polyline({
        path: stopsPath704,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 5
      });

      var infowindow = new google.maps.InfoWindow();

      google.maps.event.addListener(marker, 'click', function(marker, i) {
          return function (){
            var stopName = results[0].stops[i].name
            var secondsTillArrival = results[0].stops[i].seconds
            var direction = results[0].stops[i].direction
            if (results[0].stops[i].direction == null){
              var content = "<p><b>Stop Name:</b></p>" + '<p>'+stopName+'</p>' + "<p><b>Time till arrival(seconds):</b></p>" + '<p>'+secondsTillArrival+'</p>'
            } else {
              var content = "<p><b>Stop Name:</b></p>" + '<p>'+stopName+'</p>' + "<p><b>Time till arrival(seconds):</b></p>" + '<p>'+secondsTillArrival+'</p>' + "<p><b>Direction (next bus):</b></p>" + '<p>'+direction+'</p>'
            }
            infowindow.setContent(content);
            infowindow.open(my_map, marker);
          };
      }(marker,i));

      // google.maps.event.addListener(marker, 'mouseout', function(marker, i) {
      //     infowindow.close(my_map, marker);
      // }(marker, i));

      marker.setMap(my_map);

      bounds.extend(allStopPositions);
    }

// For loop for bus positions
    for (var i = 0; i < results[0].buses.length; i++) {
      var bus_position = new google.maps.LatLng(results[0].buses[i].latitude, results[0].buses[i].longitude)
      busLocations.push(bus_position)
      if (results[0].buses[i].route_id == 0){
        var marker = new google.maps.Marker({
          position: bus_position,
          icon: '/assets/bus_icon.png'
        });
      } else {
        var marker = new google.maps.Marker({
          position: bus_position,
          icon: '/assets/bus_icon(reverse).png'
        });
      }
      marker.setMap(my_map);
    }

// Fits bounds of the map according to LatLngbounds of our map as defined by coordinates of existing data
    my_map.fitBounds(bounds);
// Setting map for 3 different route paths
    path704.setMap(my_map);
  })

}
